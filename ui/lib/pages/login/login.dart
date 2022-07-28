import 'dart:async';

import 'package:Artivation/pages/login/body.dart';
import "package:flutter/material.dart";
import 'package:fluttertoast/fluttertoast.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isLocked;
  void initState() {
    super.initState();
    isLocked = true;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: willPop,
      child: Scaffold(
        body: LoginPage(),
      ),
    );
  }

  Future<bool> willPop() async {
    if (!isLocked) {
      Navigator.of(context).popUntil((route) => false);
      return true;
    } else {
      setState(() {
        isLocked = false;
      });
      Timer(Duration(seconds: 3), () {
        setState(() {
          isLocked = true;
        });
      });
      Fluttertoast.showToast(
          msg: 'One more click to exit.',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green.withOpacity(.8),
          textColor: Colors.white,
          fontSize: 16);
      return false;
    }
  }
}
