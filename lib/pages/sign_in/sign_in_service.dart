import 'package:flutter/material.dart';
import 'package:password_reminder/api/http_util.dart';
import 'package:password_reminder/models/sign_in.dart';
import 'package:password_reminder/models/response.dart';
//import 'package:shared_preferences/shared_preferences.dart';
import 'package:password_reminder/helpers/storage_helper.dart';

class SignInService {
  HttpUtil _http = HttpUtil();
  SignInService(BuildContext context) {
    _http.setContext(context);
  }
  
  signIn(String login, String password) async {
    Map<String, dynamic> payload = {
      'login': login,
      'password': password,
    };
    BaseResponse res = await _http.post('/api/login', data: payload);
    SignIn _signIn = SignIn.fromJson(res.data['data']);
    print(_signIn.ACT);
    await StorageHelper().setStringByKey(StorageKeys.ACK, _signIn.ACT);
  }
}