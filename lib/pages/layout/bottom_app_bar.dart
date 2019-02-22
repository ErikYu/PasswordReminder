import 'package:flutter/material.dart';
import './fab_bottom_app_bar.dart';
import 'package:password_reminder/router_module/root_router.dart';
import 'package:fluro/fluro.dart';

class MyBottomAppBar extends StatelessWidget {
  MyBottomAppBar({this.currentIndex}) : assert(currentIndex != null);
  final int currentIndex;
  Widget build(BuildContext context) {
    return FABBottomAppBar(
      selectedColor: Theme.of(context).primaryColor,
      notchedShape: CircularNotchedRectangle(),
      currentIndex: currentIndex,
      onTabSelected: (int i) {
        if (i != currentIndex) {
          switch(i) {
            case 0:
              RootRoutes.router.navigateTo(context, '/password', replace: true,  transition: TransitionType.inFromLeft);
              break;
            case 1:
              RootRoutes.router.navigateTo(context, '/setting', replace: true,  transition: TransitionType.inFromRight);
              break;
          }
        }
      },
      items: [
        FABBottomAppBarItem(iconData: Icons.vpn_key, text: 'keys'),
        FABBottomAppBarItem(iconData: Icons.settings, text: 'setting'),
      ],
    );
  }
}