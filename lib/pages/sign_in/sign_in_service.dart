import 'package:flutter/material.dart';
import 'package:password_reminder/api/http_util.dart';
import 'package:password_reminder/models/sign_in.dart';
import 'package:password_reminder/models/response.dart';
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
    BaseResponse<SignIn> res = await _http.post<SignIn>('/api/login', data: payload);
    await StorageHelper().setStringByKey(StorageKeys.act, res?.content?.data?.act);
    print(res?.content?.data?.act);
    return res?.content?.data?.act != null;
  }

  checkIfACTValidate() async {
    var res = await _http.get('/api/check/ack');
    return res['content']['data'];
  }
}