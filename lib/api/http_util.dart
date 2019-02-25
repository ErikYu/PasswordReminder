import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:password_reminder/models/response.dart';
import 'package:password_reminder/models/base_data.dart';

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

  HttpUtil._internal() {
    if (_dio == null) {
      _dio = new Dio();
    }
    _dio.interceptors.add(InterceptorsWrapper(
        onRequest:(RequestOptions options){
          // Do something before request is sent
          return options; //continue
          // If you want to resolve the request with some custom data，
          // you can return a `Response` object or return `dio.resolve(data)`.
          // If you want to reject the request with a error message,
          // you can return a `DioError` object or return `dio.reject(errMsg)`
        },
        onResponse:(Response response) {
          // Do something with response data
          BaseResponse res = BaseResponse.fromJson(response.data);
          if (res.meta.code != 2000) {
//            _scaffoldKey.currentState
//              ..removeCurrentSnackBar()
//              ..showSnackBar(SnackBar(content: Text(res.meta.internalMsg)));
            Scaffold.of(_context).showSnackBar(SnackBar(content: Text(res.meta.userMsg)));
          }

          return response; // continue
        },
        onError: (DioError e) {
          // Do something with response error
          Scaffold.of(_context).showSnackBar(SnackBar(content: Text('连接失败, 请检查服务器设置')));
//          _scaffoldKey.currentState
//            ..removeCurrentSnackBar()
//            ..showSnackBar(SnackBar(content: Text('连接失败, 请检查服务器设置')));
          return  e;//continue
        }
    ));


  }

  Future<Map<String, dynamic>> get(String path, {Map<String, dynamic> params}) async {
    Response<Map<String, dynamic>> response;
    if (null != params) {
      response = await _dio.get('$baseUrl$prefix$path', queryParameters: params);
    } else {
      response = await _dio.get('$baseUrl$prefix$path');
    }
    return response.data;
  }

  post(String path, {@required Map<String, dynamic> data}) async {
    Response<Map<String, dynamic>> response = await _dio.post('$baseUrl$prefix$path', data: data);
    return BaseResponse.fromJson(response.data);
  }
}