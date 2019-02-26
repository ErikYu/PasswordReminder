class SignInData {
  String ACT;
  SignInData(this.ACT);
  factory SignInData.fromJson(Map data) {
    return SignInData(data['ACT']);
  }
}

class SignIn {
  SignInData data;
  SignIn(this.data);
  factory SignIn.fromJson(Map content) {
    return SignIn(SignInData.fromJson(content['data']));
  }
}
