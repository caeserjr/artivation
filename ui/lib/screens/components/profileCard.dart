import 'dart:ffi';

import 'package:flutter/material.dart';

class ProfileCard extends StatelessWidget {
  final String label;
  final IconData iconData;
  final dynamic onTap;
  final bool hasBorder;
  const ProfileCard(
      {Key key, this.hasBorder = true, this.onTap, this.iconData, this.label})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color(0xffECE5E3).withOpacity(.24),
      ),
      child: InkWell(
          onTap: onTap,
          child: Container(
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(
              width: 1,
              color: hasBorder
                  ? Color(0xFF8B938D).withOpacity(.4)
                  : Colors.transparent,
            ))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 15),
                  child: Text(
                    label,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                  ),
                ),
                Icon(iconData)
              ],
            ),
          )),
    );
  }
}
