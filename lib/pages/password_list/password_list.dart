import 'package:flutter/material.dart';
import './password_list_service.dart';
import 'package:password_reminder/models/password.dart';
import './password_card.dart';
import '../layout/bottom_app_bar.dart';
import 'package:password_reminder/fluro_router.dart';

class PasswordListPage extends StatefulWidget {
  _PasswordListPageState createState() => _PasswordListPageState();
}

class _PasswordListPageState extends State<PasswordListPage> {
  int page = 1;
  List<PasswordItem> passwords = [];

  @override
  initState(){
    super.initState();
    _getData();
  }

  _getData() async {
    var res = await PasswordListService().getAllPasswords();
    setState(() {
      passwords = res;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Passwords'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          RootRoutes.router.navigateTo(context, '/password/0',);
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
        elevation: 2.0,
      ),
      bottomNavigationBar: FABBottomAppBar(
        notchedShape: CircularNotchedRectangle(),
        onTabSelected: (int i) {
          print(i);
        },
        items: [
          FABBottomAppBarItem(iconData: Icons.vpn_key, text: 'keys'),
          FABBottomAppBarItem(iconData: Icons.settings, text: 'setting'),
        ],
      ),
      body: ListView(
        children: passwords.map((i) => PasswordCard(
          passwordItem: i,
        )).toList(),
      )
    );
  }
}

