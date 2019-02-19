import 'package:password_reminder/models/password.dart';
import 'package:password_reminder/helpers/file_helper.dart';

class PasswordDetailService {
  getPasswordDetail(int id) async {
    if (id == 0) {
      return PasswordItem(
        salt: PasswordItem.createSalt()
      );
    }
    return PasswordItem.fromJson({
      'id': 1,
      'title': 'baidu',
      'salt': 'juhn',
      'userName': 'yuyizhao',
      'encrypted': 'anVoblBhc3N3b3JkMTIz'
    });
  }

  addPassword(String title, String salt, String userName, String encrypted) async {
    List res = await FileHelper().readFile();
    int nextId = res.length > 0 ? res[res.length - 1]['id'] : 1;
    res.add(PasswordItem(
      id: nextId,
      title: title,
      salt: salt,
      userName: userName,
      encrypted: encrypted
    ).toMap());
    await FileHelper().saveFile(res);
  }
}