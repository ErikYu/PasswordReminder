import 'package:flutter/material.dart';
import 'package:password_reminder/models/password.dart';
import './password_detail_service.dart';

class PasswordDetailPage extends StatefulWidget {
  final String id;
  PasswordDetailPage({this.id}) : assert(id != null);
  @override
  _PasswordDetailPageState createState() => _PasswordDetailPageState();
}

class _PasswordDetailPageState extends State<PasswordDetailPage> {
  PasswordItem _passwordItem;

  String password;
  String userName;
  String title;

  @override
  initState() {
    super.initState();
    getDetail();
  }

  getDetail() async {
    var res = await PasswordDetailService().getPasswordDetail(int.parse(widget.id));
    setState(() {
      _passwordItem = res;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail'),
      ),
      body: Column(
        children: <Widget>[
          TextField(
            decoration: InputDecoration(
              labelText: 'Salt'
            ),
            controller: TextEditingController(text: _passwordItem?.salt),
            enabled: false,
          ),
          TextField(
            controller: TextEditingController(text: _passwordItem?.title),
            decoration: InputDecoration(
              labelText: 'Position'
            ),
            onChanged: (String val) {
              title = val;
            },
            onSubmitted: (String val) {
              setState(() {
                _passwordItem.title = val;
              });
            },
          ),
          TextField(
            controller: TextEditingController(text: _passwordItem?.userName),
            decoration: InputDecoration(
              labelText: 'User Name'
            ),
            onChanged: (String val) {
              userName = val;
            },
            onSubmitted: (String val) {
              setState(() {
                _passwordItem.userName = val;
              });
            },
          ),
          TextField(
            controller: TextEditingController(text: _passwordItem?.decrypt()),
            decoration: InputDecoration(
              labelText: 'Password',
            ),
            onChanged: (String val) {
              password = val;
            },
            onSubmitted: (String val) {
              setState(() {
                _passwordItem.encrypted = _passwordItem.encrypt(val);
              });
            },
          ),
          ButtonBar(
            children: <Widget>[
              RaisedButton(
                child: Text('Save'),
                onPressed: () async {
                  print(_passwordItem.toMap());
                  if (_passwordItem.id == 0) {
                    var res = _passwordItem.encrypt(password);
                    await PasswordDetailService().addPassword(title, _passwordItem.salt, userName, res);
                  } else {
                    await PasswordDetailService().savePassword(_passwordItem.id, _passwordItem.toMap());
                  }
                },
              ),
              RaisedButton(
                child: Text('Reset'),
                onPressed: () {

                },
              )
            ],
          )
        ],
      ),
    );
  }
}
