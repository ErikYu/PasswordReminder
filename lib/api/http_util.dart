import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:password_reminder/models/response.dart';
import 'package:password_reminder/models/base_data.dart';
import 'package:password_reminder/api/api_map.dart';
import 'package:password_reminder/helpers/storage_helper.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:password_reminder/helpers/file_helper.dart';
import 'dart:io';

class HttpUtil {
  Dio _dio;                                   // dio实例
  String baseUrl = 'http://172.12.78.174:7777';                        // 前缀
  final String prefix = '';            // 固定

  var _scaffoldKey;

  BuildContext _context;

  static final HttpUtil _instance = HttpUtil._internal();

  factory HttpUtil() => _instance;

  setKey(key) {
    _scaffoldKey = key;
  }

  setContext(BuildContext context) {
    _context = context;
  }

  static String _exactCookie(cookie) {
    return cookie[0].split(";").map((x) => x.trim().split("=")).where((x) => x.length == 2).where((x) => x[0] == 'session').toList()[0][1];
  }

  HttpUtil._internal() {
    if (_dio == null) {
      _dio = new Dio();
      getApplicationDocumentsDirectory().then((Directory val) {
        _dio.interceptors.add(CookieManager(PersistCookieJar(dir: val.path)));
      });
    }
    _dio.interceptors.add(InterceptorsWrapper(
        onRequest:(RequestOptions options) {
          // Do something before request is sent
          return options; //continue
          // If you want to resolve the request with some custom data，
          // you can return a `Response` object or return `dio.resolve(data)`.
          // If you want to reject the request with a error message,
          // you can return a `DioError` object or return `dio.reject(errMsg)`
        },
        onResponse:(Response response) {
          // Do something with response data
          StorageHelper().setStringByKey(StorageKeys.COOKIE, _exactCookie(response.headers['set-cookie']));
          ResponseMeta res = ResponseMeta.fromJson(response.data['meta']);
          if (res.code != 2000) {
            Scaffold.of(_context)
              ..removeCurrentSnackBar()
              ..showSnackBar(SnackBar(content: Text(res.userMsg)));
          }

          return response; // continue
        },
        onError: (DioError e) {
          // Do something with response error
          Scaffold.of(_context)
            ..removeCurrentSnackBar()
            ..showSnackBar(SnackBar(content: Text(e.response.data)));
          return  e;//continue
        }
    ));


  }

  Future<Map<String, dynamic>> get(String path, {Map<String, dynamic> params}) async {
    Response<Map<String, dynamic>> response;
    var ack = await StorageHelper().getByKey(StorageKeys.ACK);
    if (null != params) {
      response = await _dio.get('$baseUrl$prefix$path', queryParameters: params, options: Options(headers: {'act': ack}));
    } else {
      response = await _dio.get('$baseUrl$prefix$path', options: Options(headers: {'act': ack}));
    }
    return response.data;
  }

  Future<BaseResponse<T>> post<T>(String path, {@required Map<String, dynamic> data}) async {
    try {
      var ack = await StorageHelper().getByKey(StorageKeys.ACK);
      Response<Map<String, dynamic>> response = await _dio.post('$baseUrl$prefix$path', data: data, options: Options(headers: {'act': ack}));
      return BaseResponse.fromJson(response.data, path);
    } catch (e) {
      print('error: $e');
    }
  }
}