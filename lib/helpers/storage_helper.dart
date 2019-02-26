import 'package:shared_preferences/shared_preferences.dart';

class StorageKeys {
  static final String ACK = 'ACK';
  static final String COOKIE = 'COOKIE';
}

class StorageHelper {
  getByKey(String key) async {
    SharedPreferences prefs =  await SharedPreferences.getInstance();
    return prefs.getString(key);
  }

  setStringByKey(String key, String val) async {
    SharedPreferences prefs =  await SharedPreferences.getInstance();
    await prefs.setString(key, val);
  }
}
