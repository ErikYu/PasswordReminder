import 'package:password_reminder/models/password.dart';
import 'package:password_reminder/helpers/file_helper.dart';

class PasswordListService {
  Future<List<PasswordItem>> getAllPasswords() async {
    var res = await FileHelper().readFile();
    return res.map<PasswordItem>((i) => PasswordItem.fromJson(i)).toList();
  }
}