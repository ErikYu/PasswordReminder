import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import './sign_in_service.dart';
import 'package:password_reminder/router_module/root_router.dart';

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
        appBar: AppBar(title: Text('Sign In'),),
        body: Builder(builder: (BuildContext context) {
          return Container(
            decoration: BoxDecoration(
//          image: DecorationImage(image: AssetImage('assets/earth.jpg'), fit: BoxFit.fitWidth)
            ),
            child: ListView(
              padding: EdgeInsets.only(left: 20, right: 20),
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
                        // TODO: 取消注释
                        Scaffold.of(context)
                          ..removeCurrentSnackBar()
                          ..showSnackBar(SnackBar(content: Text('开发中')));
//                        bool loginSuccess = await SignInService(context).signIn(_loginController.text, _pwdController.text);
//                        if (loginSuccess) {
//                          await SignInService(context).checkIfACTValidate();
//                          RootRoutes.router.navigateTo(context, '/setting', replace: true);
//                        }
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
                        Scaffold.of(context)
                          ..removeCurrentSnackBar()
                          ..showSnackBar(SnackBar(content: Text('开发中')));
                      },
                    ),
                    FlatButton(
                      child: Text('Sign up'),
                      onPressed: () {
                        Scaffold.of(context)
                          ..removeCurrentSnackBar()
                          ..showSnackBar(SnackBar(content: Text('开发中')));
                      },
                    )
                  ],
                ),
                Text('dvacode.tech',textAlign: TextAlign.center, style: TextStyle(height: 4)),
              ],
            ),
          );
        })
      ),
    );
  }
}