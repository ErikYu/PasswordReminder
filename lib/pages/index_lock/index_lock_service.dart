import 'package:password_reminder/helpers/file_helper.dart';

class IndexLockService {
  static Future<bool> validatePassword(String password) async {
    String res = await FileHelper(MyFiles.locker).readFileAsString();
    return password == res;
  }

  static setLock(String lock) async {
    await FileHelper(MyFiles.locker).saveStringFile(lock);
  }
}
