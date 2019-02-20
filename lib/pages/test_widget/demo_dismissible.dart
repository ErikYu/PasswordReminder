import 'package:flutter/material.dart';

class DemoDismissible extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dismissible'),
      ),
      body: ListView(
        children: <Widget>[
          Dismissible(
              key: Key('asd'),
              background: new Container(
                color: Colors.red,
                child: Text('删除'),

              ),
              child: Card(
                child: Text('asdxixix'),
              )
          ),
          Dismissible(
              key: Key('asd'),
              background: new Container(
                color: Colors.red,
                child: Text('删除'),

              ),
              child: Card(
                child: Text('asdxixix'),
              )
          ),
          Dismissible(
              key: Key('asd'),
              background: new Container(
                color: Colors.red,
                child: Text('删除'),
              ),
              child: Card(
                child: Text('asdxixix'),
              )
          )
        ],
      ),
    );
  }
}