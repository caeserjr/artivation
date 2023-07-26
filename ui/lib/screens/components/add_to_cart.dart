import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AddToCart extends StatelessWidget {
  const AddToCart({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 7),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(right: 20),
            height: 50,
            width: 58,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: Color(0xff7C9FDF),
              ),
            ),
            child: IconButton(
              icon: SvgPicture.asset('assets/icons/add_to_cart.svg'),
              onPressed: () {},
            ),
          ),
          Expanded(
            child: SizedBox(
              height: 50,
              child: ElevatedButton(
                onPressed: () {},
                child: Text(
                  'Buy Now'.toUpperCase(),
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  backgroundColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                    if (states.contains(MaterialState.pressed)) {
                      return Color.fromARGB(255, 191, 203, 225);
                    } else if (states.contains(MaterialState.disabled)) {
                      return Color.fromARGB(255, 178, 183, 194);
                    } else {
                      return Color(0xff7C9FDF);
                    }
                  }),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
