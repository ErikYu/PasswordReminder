import 'package:flutter/material.dart';
import 'package:password_reminder/models/password.dart';

class PasswordCard extends StatefulWidget {
  static String defaultPass = '********';
  final PasswordItem passwordItem;
  PasswordCard({this.passwordItem});
  @override
  _PasswordCardState createState() => _PasswordCardState();
}

class _PasswordCardState extends State<PasswordCard> {
  bool showDecrypted = false;
  String decrypted;
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        child: Flex(
          direction: Axis.horizontal,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('${widget.passwordItem.title}'),
                Text('username: ${widget.passwordItem.userName}'),
                Text('password: ${showDecrypted ? decrypted : PasswordCard.defaultPass}'),
              ],
            ),
            IconButton(
              icon: showDecrypted ? Icon(Icons.lock) : Icon(Icons.remove_red_eye),
              onPressed: () {
                setState(() {
                  if (showDecrypted) {
                    showDecrypted = false;
                    // 关闭
                  } else {
                    showDecrypted = true;
                    // 解密
                    decrypted = widget.passwordItem.decrypt();
                  }
                });
              },
            )
          ],
        )
      ),
    );
  }
}