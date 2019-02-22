import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/earth.jpg'), fit: BoxFit.fill)
        ),
      ),
    );
  }
}