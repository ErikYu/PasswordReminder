import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:password_reminder/router_module/root_router.dart';
import 'helpers/file_helper.dart';
import 'pages/index_lock/index_lock.dart';
//import 'pages/setting/setting.dart';
import 'dart:convert';
import 'package:crypto/crypto.dart';

import 'store/main_store.dart';
import 'router_module/navigation_store.dart';

void main() {
  final router = new Router();
  RootRoutes.configureRoutes(router);
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  // This widget is the root of your application.

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    checkData();
  }

  @override
  dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  checkData() async {
    await FileHelper(MyFiles.pwd).initFile(seedContent: '[]');
    await FileHelper(MyFiles.locker).initFile(seedContent: sha256.convert(utf8.encode('1234')).toString());
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.inactive) {
      // 后台运行
      NavigationStore().locked.add(true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Locker',
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
        primarySwatch: Colors.deepPurple,
        cursorColor: Colors.deepPurple,
      ),
      home: IndexLockPage(),
    );
  }
}
