import 'package:flutter/material.dart';
import 'pages/password_list/password_list.dart';
import 'package:fluro/fluro.dart';
import 'fluro_router.dart';
import 'helpers/file_helper.dart';

void main() {
  final router = new Router();
  RootRoutes.configureRoutes(router);
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.

  @override
  void initState() {
    super.initState();
    checkData();
  }

  checkData() async {
    await FileHelper().initFile();
//    print(res);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Password Reminder',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: PasswordListPage(),
    );
  }
}
