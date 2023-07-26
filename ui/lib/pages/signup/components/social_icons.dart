import 'package:Artivation/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SocialIcon extends StatelessWidget {
  final String iconSrc;
  final dynamic press;
  const SocialIcon({
    Key? key,
    required this.iconSrc,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 12),
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(width: 1, color: Constants.kPrimaryLightColor)),
        child: SvgPicture.asset(
          iconSrc,
          height: 20,
          width: 20,
        ),
      ),
    );
  }
}
