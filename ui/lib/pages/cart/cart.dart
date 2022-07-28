import 'package:Artivation/constants/constants.dart';
import 'package:Artivation/pages/cart/cart_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'components/cart_item_card.dart';

class FragmentCart extends StatefulWidget {
  @override
  _FragmentCartState createState() => _FragmentCartState();
}

class _FragmentCartState extends State<FragmentCart> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        child: Stack(children: [
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(top: 44),
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: cartItems.length,
                itemBuilder: (context, index) => Dismissible(
                  key: Key(cartItems[index].product.id.toString()),
                  direction: DismissDirection.endToStart,
                  background: Container(
                    decoration: BoxDecoration(
                      color: Color(0xFFFFE6E6),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      children: [
                        Spacer(),
                        SvgPicture.asset('assets/icons/Trash.svg'),
                      ],
                    ),
                  ),
                  onDismissed: (direction) {
                    setState(() {
                      cartItems.removeAt(index);
                    });
                  },
                  child: CartItemCard(
                    size: size,
                    cart: cartItems[index],
                  ),
                ),
              ),
            ),
          ),
          SafeArea(
            child: Container(
              color: Colors.black.withOpacity(0.3),
              height: 44,
              child: Padding(
                padding: const EdgeInsets.all(4),
                child: Row(
                  children: <Widget>[
                    IconButton(
                      icon: Icon(
                        Icons.chevron_left_rounded,
                        size: Constants.iconSize,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ]),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        height: 80,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30)),
          boxShadow: [
            BoxShadow(
                offset: Offset(0, -14),
                blurRadius: 20,
                color: Color(0xff4059f1).withOpacity(.09)),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text.rich(
              TextSpan(text: 'Total: \n', children: [
                TextSpan(
                  text: '\$12000',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                )
              ]),
            ),
            SizedBox(
              width: 190,
              child: SizedBox(
                height: 35,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    'Checkout'.toUpperCase(),
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
