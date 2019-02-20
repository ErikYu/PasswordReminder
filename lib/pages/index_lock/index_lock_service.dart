class IndexLockService {
  static Future<bool> validatePassword(String password) async {
    String pwd = '1234';
    return password == pwd;
  }
}
