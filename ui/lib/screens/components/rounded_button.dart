import 'package:Artivation/constants/constants.dart';
import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final Function press;
  final Color color, textColor;
  const RoundedButton(
      {Key key,
      this.text,
      this.press,
      this.color = Constants.kPrimaryColor,
      this.textColor = Colors.white})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        width: size.width * .7,
        child: Container(
          height: 50,
          child: RaisedButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(70.0)),
            padding: EdgeInsets.all(0.0),
            color: Constants.kPrimaryColor,
            onPressed: press,
            child: Ink(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xfff0ccfd), Color(0xff64B6FF)],
                    end: Alignment.centerRight,
                  ),
                  borderRadius: BorderRadius.circular(40.0)),
              child: Container(
                constraints: BoxConstraints(
                    maxWidth: size.width * 30, minHeight: size.height * .5),
                alignment: Alignment.center,
                child: Text(
                  text,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: textColor),
                ),
              ),
            ),
          ),
        ));
  }
}
