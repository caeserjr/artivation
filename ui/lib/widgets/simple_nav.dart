import 'package:Artivation/constants/constants.dart';
import 'package:flutter/material.dart';

class SimpleNavBar extends StatelessWidget {
  const SimpleNavBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(.4),
              borderRadius: BorderRadius.circular(15),
            ),
            child: IconButton(
              icon: Icon(
                Icons.chevron_left_rounded,
                color: Colors.white,
                size: Constants.iconSize + 5,
              ),
              onPressed: () => Navigator.pop(context),
            ),
          ),
        ),
      ],
    );
  }
}
