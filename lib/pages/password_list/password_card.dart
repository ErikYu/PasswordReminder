import 'package:flutter/material.dart';
import 'package:password_reminder/models/password.dart';
import 'package:password_reminder/fluro_router.dart';

class PasswordCard extends StatefulWidget {
  static String defaultPass = '●●●●●●●●●●●●';
  final PasswordItem passwordItem;
  PasswordCard({this.passwordItem});
  @override
  _PasswordCardState createState() => _PasswordCardState();
}

class _PasswordCardState extends State<PasswordCard> {
  static final List<Color> colors = [
    Color.fromRGBO(183,82,113,1),
    Color.fromRGBO(27,81,134,1),
    Color.fromRGBO(99,14,65,1),
    Color.fromRGBO(29,145,201,1),
    Color.fromRGBO(195,62,35,1),
    Color.fromRGBO(143,182,210,1),
    Color.fromRGBO(204,191,146,1),
  ];
  bool showDecrypted = false;
  String decrypted;
  Widget build(BuildContext context) {
    int colorIndex = (widget.passwordItem.id - 1) % colors.length;
    TextStyle titleStyle = TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold);
    TextStyle textStyle = TextStyle(color: Colors.white);
    return GestureDetector(
      onLongPress: () {
        RootRoutes.router.navigateTo(context, '/password/${widget.passwordItem.id}');
      },
      child: Card(
        color: colors[colorIndex],
        elevation: 0,
        child: Container(
          padding: EdgeInsets.all(10),
          child: Flex(
            direction: Axis.horizontal,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('${widget.passwordItem.title}', style: titleStyle),
                  Text('  username: ${widget.passwordItem.userName}', style: textStyle),
                  Text('  password: ${showDecrypted ? decrypted : PasswordCard.defaultPass}', style: textStyle),
                ],
              ),
              IconButton(
                icon: showDecrypted ? Icon(Icons.lock, color: Colors.white) : Icon(Icons.remove_red_eye, color: Colors.white),
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
      ),
    );
  }
}