import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import './sign_in_service.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController _loginController = TextEditingController();
  TextEditingController _pwdController = TextEditingController();
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        body: Builder(builder: (BuildContext context) {
          return Container(
            decoration: BoxDecoration(
//          image: DecorationImage(image: AssetImage('assets/earth.jpg'), fit: BoxFit.fitWidth)
            ),
            child: ListView(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(top: 60, bottom: 20),
                  child: SvgPicture.asset(
                      'assets/locker.svg',
                      height: 100,
                      semanticsLabel: 'Acme Logo'
                  ),
                ),
                TextField(
                  controller: _loginController,
                  decoration: InputDecoration(
                      labelText: 'Login'
                  ),
                ),
                TextField(
                  controller: _pwdController,
                  decoration: InputDecoration(
                      labelText: 'Password'
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: RaisedButton(
                      color: Theme.of(context).primaryColor,
                      child: Text('Log In', style: TextStyle(color: Colors.white)),
                      onPressed: () async {
                        print('asdjkhasdkjahskdasd');
                        var a = await SignInService(context).signIn(_loginController.text, _pwdController.text);
                      },
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    FlatButton(
                      child: Text('Forget password'),
                      onPressed: () {

                      },
                    ),
                    FlatButton(
                      child: Text('Sign up'),
                      onPressed: () {

                      },
                    )
                  ],
                ),
                Text('dvacode.tech',textAlign: TextAlign.center, style: TextStyle(),),
              ],
            ),
          );
        })
      ),
    );
  }
}