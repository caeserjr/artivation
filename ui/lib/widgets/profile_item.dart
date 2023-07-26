import 'package:Artivation/constants/constants.dart';
import 'package:Artivation/widgets/app_text.dart';
import 'package:flutter/material.dart';

class ProfileCardItem extends StatelessWidget {
  final IconData cardIcon;
  final String title;
  final dynamic action;
  final Color color;

  const ProfileCardItem({
    Key? key,
    required this.cardIcon,
    required this.title,
    required this.action,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: action,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 25),
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: color.withOpacity(.35),
                    borderRadius: BorderRadius.circular(
                      Constants.borderRadius,
                    ),
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(cardIcon),
                    iconSize: 30,
                    color: color,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 25),
                  child: AppText(
                    size: 18,
                    text: title,
                    isBold: true,
                  ),
                )
              ],
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.chevron_right_rounded),
              iconSize: 30,
            ),
          ],
        ),
      ),
    );
  }
}
