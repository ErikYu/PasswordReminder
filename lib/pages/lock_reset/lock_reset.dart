import 'package:flutter/material.dart';

class LockResetPage extends StatelessWidget {
  TextEditingController oldController = TextEditingController();
  TextEditingController newController = TextEditingController();
  TextEditingController confirmController = TextEditingController();
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reset Password'),
      ),
      body: Column(
        children: <Widget>[
          TextField(
            controller: oldController,
            decoration: InputDecoration(
              labelText: 'Old Password'
            ),
          ),
          TextField(
            controller: newController,
            decoration: InputDecoration(
              labelText: 'New Password'
            ),
          ),
          TextField(
            controller: confirmController,
            decoration: InputDecoration(
              labelText: 'Confirm New Password'
            ),
          ),
          ButtonBar(
            children: <Widget>[
              RaisedButton(
                child: Text('Save'),
                onPressed: () {
                  print(oldController.text);
                  print(newController.text);
                  print(confirmController.text);
                },
              )
            ],
          )
        ],
      ),
    );
  }
}