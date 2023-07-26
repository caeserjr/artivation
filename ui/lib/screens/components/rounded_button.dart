import 'package:Artivation/constants/constants.dart';
import 'package:flutter/material.dart';

class RoundedButton extends StatefulWidget {
  final String text;
  final dynamic press;
  final Color color, textColor;
  final bool isLoading;

  const RoundedButton({
    Key? key,
    required this.text,
    this.isLoading = false,
    this.press,
    this.color = Constants.kPrimaryColor,
    this.textColor = Colors.white,
  }) : super(key: key);

  @override
  State<RoundedButton> createState() => _RoundedButtonState();
}

class _RoundedButtonState extends State<RoundedButton> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        width: size.width * .7,
        child: Container(
          height: 50,
          child: InkWell(
            onTap: widget.press,
            borderRadius: BorderRadius.circular(40.0),
            splashColor: Color(0xfff0ccfd),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40.0),
              ),
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
                  child: widget.isLoading
                      ? Container(
                          //todo add loading container
                          // child: Center(
                          //   child: Loading(
                          //     indicator: BallPulseIndicator(),
                          //     size: 40.0,
                          //   ),
                          // ),
                          )
                      : Text(
                          widget.text,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: widget.textColor,
                          ),
                        ),
                ),
              ),
            ),
          ),
        ));
  }
}
