import 'package:password_reminder/models/password.dart';
import 'package:password_reminder/helpers/file_helper.dart';

class PasswordListService {
  Future<List<PasswordItem>> getAllPasswords(int page) async {
    int limit = 10;
    List res = await FileHelper(MyFiles.pwd).readFileAsJson();
    return res.skip(limit * page - limit).take(limit).map<PasswordItem>((i) => PasswordItem.fromJson(i)).toList();
  }

  deleteChosenPassword(int id) async {
    List res = await FileHelper(MyFiles.pwd).readFileAsJson();
    res.removeWhere((i) => i['id'] == id);
    await FileHelper(MyFiles.pwd).saveFile(res);
  }
}