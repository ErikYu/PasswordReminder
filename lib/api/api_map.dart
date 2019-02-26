import 'package:password_reminder/models/sign_in.dart';

class ApiMap {
  static final Map<String, dynamic> apiSignIn = {'url': '/api/login', 'model': (data) => SignIn.fromJson(data)};
  Map urlModelRel = {
    '/api/login': (data) => SignIn.fromJson(data)
  };

  getModelByUrl() {

  }
}
