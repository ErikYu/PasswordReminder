import 'package:flutter/material.dart';
import '../index_lock/index_lock_service.dart';

class LockResetPage extends StatefulWidget {
  @override
  _LockResetPageState createState() => _LockResetPageState();
}

class _LockResetPageState extends State<LockResetPage> {
  final TextEditingController oldController = TextEditingController();
  final TextEditingController newController = TextEditingController();
  final TextEditingController confirmController = TextEditingController();
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reset Password'),
      ),
      body: Builder(builder: (BuildContext context) {
        return ListView(
          children: <Widget>[
            TextField(
              keyboardType: TextInputType.number,
              maxLength: 4,
              controller: oldController,
              decoration: InputDecoration(
                  labelText: 'Old Password'
              ),
            ),
            TextField(
              keyboardType: TextInputType.number,
              maxLength: 4,
              controller: newController,
              decoration: InputDecoration(
                  labelText: 'New Password'
              ),
            ),
            TextField(
              keyboardType: TextInputType.number,
              maxLength: 4,
              controller: confirmController,
              decoration: InputDecoration(
                  labelText: 'Confirm New Password'
              ),
            ),
            ButtonBar(
              children: <Widget>[
                RaisedButton(
                  child: Text('Save'),
                  onPressed: () async {
                    String oldPassword = oldController.text;
                    String newPassword = newController.text;
                    String confirmPassword = confirmController.text;
                    if (!await IndexLockService.validatePassword(oldPassword)) {
                      Scaffold.of(context).showSnackBar(SnackBar(content: Text('Error Old Password')));
                    } else if (newPassword.length < 4) {
                      Scaffold.of(context).showSnackBar(SnackBar(content: Text('New Password Shall Be Length Of 4')));
                    } else if (newPassword != confirmPassword) {
                      Scaffold.of(context).showSnackBar(SnackBar(content: Text('Your new password is not same with confirmed password')));
                    } else {
                      // change Password
                      await IndexLockService.setLock(newPassword);
                      Scaffold.of(context).showSnackBar(SnackBar(content: Text('Password Reset Successfully')));
                      FocusScope.of(context).requestFocus(FocusNode());
                    }
                  },
                )
              ],
            )
          ],
        );
      })
    );
  }
}