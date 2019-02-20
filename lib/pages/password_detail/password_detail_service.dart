import 'package:password_reminder/models/password.dart';
import 'package:password_reminder/helpers/file_helper.dart';

class PasswordDetailService {
  getPasswordDetail(int id) async {
    if (id == 0) {
      return PasswordItem(
        id: 0,
        salt: PasswordItem.createSalt()
      );
    }
    List res = await FileHelper().readFile();
    return PasswordItem.fromJson(res.firstWhere((i) => i['id'] == id));
  }

  addPassword(String title, String salt, String userName, String encrypted) async {
    List res = await FileHelper().readFile();
    int nextId = res.length > 0 ? res[res.length - 1]['id'] + 1 : 1;
    res.add(PasswordItem(
      id: nextId,
      title: title,
      salt: salt,
      userName: userName,
      encrypted: encrypted
    ).toMap());
    await FileHelper().saveFile(res);
  }

  savePassword(int id, Map newData) async {
    List res = await FileHelper().readFile();
    var thisOne = res.firstWhere((i) => i['id'] == id);
    res[res.indexOf(thisOne)] = newData;
    await FileHelper().saveFile(res);
  }
}