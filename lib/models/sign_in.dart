class SignIn {
  String ACT;
  SignIn(this.ACT);
  factory SignIn.fromJson(Map data) {
    return SignIn(data['ACT']);
  }
}
