import 'package:password_reminder/helpers/file_helper.dart';

class IndexLockService {
  static Future<bool> validatePassword(String password) async {
    String pwd = '1234';
    String res = await FileHelper(MyFiles.locker).readFileAsString();
    print(res);
    return password == pwd;
  }
}
