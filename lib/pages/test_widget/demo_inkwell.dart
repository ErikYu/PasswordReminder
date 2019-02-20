import 'package:flutter/material.dart';

class DemoInkWell extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('InkWell'),
      ),
      body: Container(
        child: _Demo(),
      ),
    );
  }
}

class _Demo extends StatelessWidget {
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print('tapping');
      },
      onLongPress: () {

      },
      child: Container(
        width: 100,
        height: 100,
        child: Text('asdfghjk'),
      ),
    );
  }
}