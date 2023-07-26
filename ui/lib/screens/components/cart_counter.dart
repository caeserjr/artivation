import 'package:flutter/material.dart';

class CartCounter extends StatefulWidget {
  @override
  _CartCounterState createState() => _CartCounterState();
}

class _CartCounterState extends State<CartCounter> {
  int numOfItems = 1;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Row(
        children: [
          buildOutLineButton(
            icon: Icons.remove,
            press: () {
              if (numOfItems > 1) {
                setState(() {
                  numOfItems -= 1;
                });
              }
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
            child: Text(
              numOfItems.toString().padLeft(2, '0'),
              style: TextStyle(color: Colors.blueGrey),
            ),
          ),
          buildOutLineButton(
              icon: Icons.add,
              press: () {
                setState(() {
                  numOfItems += 1;
                });
              })
        ],
      ),
    );
  }

  SizedBox buildOutLineButton({
    IconData? icon,
    dynamic press,
  }) {
    return SizedBox(
      width: 40,
      height: 32,
      child: OutlinedButton(
        onPressed: press,
        child: Icon(icon),
      ),
    );
  }
}
