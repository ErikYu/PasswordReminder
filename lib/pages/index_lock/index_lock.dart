import 'package:flutter/material.dart';
import 'index_lock_service.dart';
import 'package:password_reminder/fluro_router.dart';

class IndexLockPage extends StatefulWidget {
  @override
  _IndexLockPageState createState() => _IndexLockPageState();
}

class _IndexLockPageState extends State<IndexLockPage> {
  TextEditingController _controller1 = TextEditingController();
  TextEditingController _controller2 = TextEditingController();
  TextEditingController _controller3 = TextEditingController();
  TextEditingController _controller4 = TextEditingController();

  FocusNode _node1 = FocusNode();
  FocusNode _node2 = FocusNode();
  FocusNode _node3 = FocusNode();
  FocusNode _node4 = FocusNode();
  
  String password;
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(builder: (BuildContext context) {
        return Container(
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage('assets/index.png'), fit: BoxFit.fitHeight)
          ),
          child: Flex(
            direction: Axis.horizontal,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Flexible(
                child: Center(
                  child: Container(
                    width: 50,
                    child: TextField(
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                      ),
                      obscureText: true,
                      controller: _controller1,
                      focusNode: _node1,
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      onChanged: (String val) {
                        if (val.length == 1) {
                          FocusScope.of(context).requestFocus(_node2);
                          _controller2.clear();
                        }
                      },
                      onTap: () {
                        _controller1.clear();
                      },
                    ),
                  ),
                )
              ),
              Flexible(
                child: Center(
                  child: Container(
                    width: 50,
                    child: TextField(
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                      ),
                      obscureText: true,
                      controller: _controller2,
                      focusNode: _node2,
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      onChanged: (String val) {
                        if (val.length == 1) {
                          FocusScope.of(context).requestFocus(_node3);
                          _controller3.clear();
                        }
                      },
                      onTap: () {
                        _controller2.clear();
                      },
                    ),
                  ),
                )
              ),
              Flexible(
                child: Center(
                  child: Container(
                    width: 50,
                    child: TextField(
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                      ),
                      obscureText: true,
                      controller: _controller3,
                      focusNode: _node3,
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      onChanged: (String val) {
                        if (val.length == 1) {
                          FocusScope.of(context).requestFocus(_node4);
                          _controller4.clear();
                        }
                      },
                      onTap: () {
                        _controller3.clear();
                      },
                    ),
                  ),
                )
              ),
              Flexible(
                child: Center(
                  child: Container(
                    width: 50,
                    child: TextField(
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                      ),
                      obscureText: true,
                      controller: _controller4,
                      focusNode: _node4,
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      onChanged: (String val) async {
                        if (val.length == 1) {
                          FocusScope.of(context).requestFocus(FocusNode());
                          // check password goes here
                          password = '${_controller1.text}${_controller2.text}${_controller3.text}${_controller4.text}';
                          bool isOk = await IndexLockService.validatePassword(password);
                          if (isOk) {
                            RootRoutes.router.navigateTo(context, '/password', replace: true);
                          } else {
                            Scaffold.of(context)
                              ..removeCurrentSnackBar()
                              ..showSnackBar(SnackBar(content: Text('Error Password!!!')));
                            FocusScope.of(context).requestFocus(_node1);
                            _controller1.clear();
                          }
                        }
                      },
                      onTap: () {
                        _controller4.clear();
                      },
                    ),
                  ),
                )
              ),
            ],
          )
        );
      }),
    );
  }
}