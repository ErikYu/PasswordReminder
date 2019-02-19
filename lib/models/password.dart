import 'dart:convert';
import 'dart:core';
import 'dart:math';

class PasswordItem {
  int id;
  String title;
  String salt;
  String encrypted;
  String userName;

  PasswordItem({this.title, this.salt, this.encrypted, this.userName, this.id});

  factory PasswordItem.fromJson(Map<String, dynamic> data) => PasswordItem(
    id: data['id'],
    title: data['title'],
    salt: data['salt'],
    encrypted: data['encrypted'],
    userName: data['userName'],
  );

  Map toMap() {
    return {
      'id': id,
      'title': title,
      'salt': salt,
      'encrypted': encrypted,
      'userName': userName,
    };
  }

  String encrypt(String decrypted) {
    String binded = '$salt$decrypted';
    var bytes = utf8.encode(binded);
    String base64Str = base64.encode(bytes);
    return base64Str;
  }

  String decrypt() {
    if (encrypted != null) {
      var password = latin1.decode(base64.decode(encrypted));
      return password.substring(4);
    }
    return null;
  }

  static String createSalt () {
    Random rnd = Random(DateTime.now().millisecondsSinceEpoch);
    const String chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
    String result = "";
    for (var i = 0; i < 4; i++) {
      result += chars[rnd.nextInt(chars.length)];
    }
    return result;
  }
}