import 'package:fluro/fluro.dart';
import 'package:password_reminder/router_module/root_router.dart';
import 'package:flutter/material.dart';
import './navigation_store.dart';

abstract class AutoNavHelper {

  static startListen(BuildContext context) {
    return NavigationStore().locked.stream.listen((bool locked) {
      if (locked) {
        RootRoutes.router.navigateTo(context, '/', replace: true, transition: TransitionType.fadeIn);
      }
    });
  }

  static endListen(locked) {
    locked.cancel();
  }
}
