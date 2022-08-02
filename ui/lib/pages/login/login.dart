import 'dart:async';

import 'package:Artivation/pages/login/body.dart';
import "package:flutter/material.dart";
import 'package:fluttertoast/fluttertoast.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var ctime;

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
    DateTime now = DateTime.now();
    if (ctime == null || now.difference(ctime) > Duration(seconds: 2)) {
      //add duration of press gap
      ctime = now;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Press Back Button Again to Exit'),
        ),
      ); //scaffold message, you can show Toast message too.
      return Future.value(false);
    }

    return Future.value(true);
  }
}
