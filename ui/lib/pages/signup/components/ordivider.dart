import 'package:Artivation/constants/constants.dart';
import 'package:flutter/material.dart';

class OrDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: size.height * .02),
      width: size.width * .8,
      child: Row(
        children: <Widget>[
          BuildDivider(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Text(
              'OR',
              style: TextStyle(
                  color: Constants.kPrimaryColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 16),
            ),
          ),
          BuildDivider(),
        ],
      ),
    );
  }
}

class BuildDivider extends StatelessWidget {
  const BuildDivider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Divider(
        color: Color(0xFF8B938D),
        height: 1.5,
      ),
    );
  }
}
