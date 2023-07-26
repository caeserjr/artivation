import 'dart:async';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  @override
  VideoState createState() => VideoState();
}

class VideoState extends State<Splash> with SingleTickerProviderStateMixin {
  var _visible = true;

  AnimationController? animationController;
  Animation<double>? animation;

  startTime() async {
    var _duration = new Duration(seconds: 2);
    return new Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Navigator.of(context).pushNamedAndRemoveUntil("Login", (route) => false);
  }

  @override
  void initState() {
    super.initState();

    animationController = new AnimationController(
        vsync: this, duration: new Duration(seconds: 1));
    animation = new CurvedAnimation(
        parent: animationController!, curve: Curves.easeOut);

    animation!.addListener(() => this.setState(() {}));
    animationController!.forward();

    setState(() {
      _visible = !_visible;
    });
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    var date = DateTime.now().toString();
    var dateParse = DateTime.parse(date);
    var _year;
    setState(() {
      _year = dateParse.year;
    });

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          new Column(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: 0),
                child: Image.asset(
                  'assets/logolon.png',
                  height: 52.0,
                  fit: BoxFit.scaleDown,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 40.0),
                child: Text('  \u00a9 2018 - $_year \n Artivation.co.tz',
                    style: TextStyle(
                        fontSize: 8,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey)),
              )
            ],
          ),
          new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'assets/logo.png',
                width: animation!.value * 250,
                height: animation!.value * 250,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
