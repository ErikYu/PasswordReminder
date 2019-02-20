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
        onPressed: () async {
          await RootRoutes.router.navigateTo(context, '/password/0',);
          setState(() {
            page = 1;
            passwords = [];
          });
        },
        tooltip: 'Create',
        child: Icon(Icons.add),
        elevation: 2.0,
      ),
      bottomNavigationBar: MyBottomAppBar(currentIndex: 0),
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
                return Dismissible(
                  key: Key(passwords[i].id.toString()),
                  direction: DismissDirection.endToStart,
                  background: Container(
                    padding: EdgeInsets.only(right: 24),
                    alignment: AlignmentDirectional.centerEnd,
                    color: Colors.red,
                    child: Text('Delete', style: TextStyle(color: Colors.white, fontSize: 24)),
                  ),
                  child: GestureDetector(
                    onLongPress: () async {
                      await RootRoutes.router.navigateTo(context, '/password/${passwords[i].id}');
                      setState(() {
                        page = 1;
                        passwords = [];
                      });
                    },
                    child: PasswordCard(
                      passwordItem: passwords[i],
                    ),
                  ),
                  onDismissed: (DismissDirection direction) {
                    setState(() {
                      PasswordListService().deleteChosenPassword(passwords[i].id);
                      passwords.removeAt(i);
                    });
                  },
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

