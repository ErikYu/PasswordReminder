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

  TextEditingController _saltController = TextEditingController();
  TextEditingController _titleController = TextEditingController();
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _decryptedController = TextEditingController();

  @override
  initState() {
    super.initState();
    getDetail();
  }

  getDetail() async {
    var res = await PasswordDetailService().getPasswordDetail(int.parse(widget.id));
    setState(() {
      _passwordItem = res;
      _saltController.text = _passwordItem.salt;
      _titleController.text = _passwordItem.title;
      _usernameController.text = _passwordItem.userName;
      _decryptedController.text = _passwordItem.decrypt();
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail'),
      ),
      body: Builder(builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.only(left: 15, right: 15),
          child: Column(
            children: <Widget>[
              TextField(
                decoration: InputDecoration(
                    labelText: 'Salt'
                ),
                controller: _saltController,
                enabled: false,
              ),
              TextField(
                controller: _titleController,
                decoration: InputDecoration(
                    labelText: 'Position'
                ),
                onChanged: (String val) {
                  title = val;
                },
              ),
              TextField(
                controller: _usernameController,
                decoration: InputDecoration(
                    labelText: 'User Name'
                ),
                onChanged: (String val) {
                  userName = val;
                },
              ),
              TextField(
                controller: _decryptedController,
                decoration: InputDecoration(
                  labelText: 'Password',
                ),
                onChanged: (String val) {
                  password = val;
                },
              ),
              ButtonBar(
                children: <Widget>[
                  RaisedButton(
                    color: Theme.of(context).primaryColor,
                    child: Text('Save', style: TextStyle(color: Colors.white)),
                    onPressed: () async {
                      _passwordItem.userName = _usernameController.text;
                      _passwordItem.title = _titleController.text;
                      _passwordItem.encrypted = _passwordItem.encrypt(_decryptedController.text);
                      if (_passwordItem.id == 0) {
                        var res = _passwordItem.encrypt(_decryptedController.text);
                        await PasswordDetailService().addPassword(_titleController.text, _passwordItem.salt, _usernameController.text, res);
                        Scaffold.of(context).showSnackBar(SnackBar(content: Text('Add Password successfully')));
                      } else {
                        await PasswordDetailService().savePassword(_passwordItem.id, _passwordItem.toMap());
                        Scaffold.of(context).showSnackBar(SnackBar(content: Text('Save Password successfully')));
                      }
                      FocusScope.of(context).requestFocus(FocusNode());
                    },
                  ),
                ],
              )
            ],
          ),
        );
      })
    );
  }
}
