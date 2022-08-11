import 'package:Artivation/constants/constants.dart';
import 'package:Artivation/pages/cart/cart_data.dart';
import 'package:Artivation/widgets/app_text.dart';
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
              padding: const EdgeInsets.only(top: 40),
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
                    child: Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Row(
                        children: [
                          Spacer(),
                          SvgPicture.asset('assets/icons/Trash.svg'),
                        ],
                      ),
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
              height: 44,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: AppText(
                              text: "Cart ",
                              isBold: true,
                              size: 18,
                            ),
                          ),
                          Container(
                            child: RichText(
                              text: TextSpan(
                                style: const TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.black,
                                ),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: "${cartItems.length} ",
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),
                                  TextSpan(
                                    text: "items",
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ]),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 20,
        ),
        height: 65,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text.rich(
                  TextSpan(
                    style: TextStyle(fontWeight: FontWeight.bold),
                    text: 'Total ',
                  ),
                ),
                Text.rich(
                  TextSpan(
                    text: '\$12000',
                  ),
                ),
              ],
            ),
            SizedBox(
              width: 170,
              child: ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  backgroundColor: MaterialStateProperty.all<Color>(
                    Constants.kPrimaryColor,
                  ),
                ),
                child: Text(
                  'Checkout'.toUpperCase(),
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
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
