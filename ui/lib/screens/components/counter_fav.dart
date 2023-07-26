import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CountWithFavBtn extends StatelessWidget {
  const CountWithFavBtn({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // CartCounter(),
        SizedBox(
          width: 10,
        ),
        Padding(
          padding: const EdgeInsets.only(right: 20.0),
          child: Container(
            padding: EdgeInsets.all(8),
            height: 40,
            width: 32,
            decoration:
                BoxDecoration(color: Color(0xFFFF6464), shape: BoxShape.circle),
            child: SvgPicture.asset('assets/icons/heart.svg'),
          ),
        ),
      ],
    );
  }
}
