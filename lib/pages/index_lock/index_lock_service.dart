import 'package:password_reminder/helpers/file_helper.dart';
import 'package:crypto/crypto.dart';
import 'dart:convert';

class IndexLockService {
  static Future<bool> validatePassword(String password) async {
    String res = await FileHelper(MyFiles.locker).readFileAsString();
    return res == sha256.convert(utf8.encode(password)).toString();
  }

  static setLock(String lock) async {
    await FileHelper(MyFiles.locker).saveStringFile(sha256.convert(utf8.encode(lock)).toString());
  }
}
