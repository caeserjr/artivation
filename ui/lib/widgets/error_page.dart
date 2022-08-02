import 'package:Artivation/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ErrorPage extends StatefulWidget {
  final String message;
  final Function action;
  const ErrorPage({Key key, this.message, this.action}) : super(key: key);

  @override
  State<ErrorPage> createState() => _ErrorPageState();
}

class _ErrorPageState extends State<ErrorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: SvgPicture.asset(
              "assets/icons/errorOccurred.svg",
              height: 100,
              width: 100,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10, bottom: 5),
            alignment: Alignment.center,
            child: Text(
              widget.message,
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: widget.action,
            child: Text(
              "Refresh",
            ),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(
                Constants.kPrimaryColor,
              ),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    10.0,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
