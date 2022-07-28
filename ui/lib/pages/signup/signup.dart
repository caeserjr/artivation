import 'dart:async';

import 'package:Artivation/pages/signup/components/body.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignUp extends StatefulWidget {
  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
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
        body: Body(
          child: Container(),
        ),
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
