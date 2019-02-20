import 'package:flutter/material.dart';
import '../layout/bottom_app_bar.dart';

class SettingPage extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Setting'),
      ),
      bottomNavigationBar: MyBottomAppBar(currentIndex: 1),
      body: ListView(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.security),
            trailing: Icon(Icons.keyboard_arrow_right),
            title: Text('修改密码'),
            onTap: () {
              print('go change password');
            },
          ),
          ListTile(
            leading: Icon(Icons.import_export),
            trailing: Icon(Icons.keyboard_arrow_right),
            title: Text('导入/导出'),
            onTap: () {
              print('go change password');
            },
          ),
          ListTile(
            leading: Icon(Icons.update),
            trailing: Icon(Icons.keyboard_arrow_right),
            title: Text('检查更新'),
            onTap: () {
              print('go change password');
            },
          )
        ],
      ),
    );
  }
}