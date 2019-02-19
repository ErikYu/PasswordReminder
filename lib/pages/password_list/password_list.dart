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
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: FractionalOffset.topCenter,
            end: FractionalOffset.bottomCenter,
            colors: [const Color.fromRGBO(245, 245, 249, 1), const Color.fromRGBO(226, 226, 246, 1)],
            tileMode: TileMode.repeated, // repeats the gradient over the canvas
          ),
        ),
        child: RefreshIndicator(
          child: ListView.builder(
              itemBuilder: (BuildContext context, int i) {
                if (i == passwords.length) {
                  PasswordListService().getAllPasswords(page).then((List<PasswordItem> data) {
                    if (data.length > 0) {
                      setState(() {
                        page += 1;
                        passwords.addAll(data);
                      });
                    }
                  });
                  return null;
                } else if (i > passwords.length) {
                  return null;
                }
                return PasswordCard(
                  passwordItem: passwords[i],
                );
              }
          ),
          onRefresh: () async {
            setState(() {
              page = 1;
              passwords = [];
            });
          }
        )
      )
    );
  }
}

