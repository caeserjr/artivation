import 'package:flutter/material.dart';
import '../cart_data.dart';

class CartItemCard extends StatelessWidget {
  const CartItemCard({
    Key key,
    @required this.size,
    @required this.cart,
  }) : super(key: key);

  final Size size;
  final Cart cart;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 15),
      child: Container(
        width: size.width,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                child: Container(
                  height: size.height * .13,
                  width: size.width * .4,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                        image: AssetImage(cart.product.image),
                        fit: BoxFit.cover),
                  ),
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Text(
                    cart.product.title,
                    style: TextStyle(
                      fontSize: 16,
                    ),
                    maxLines: 2,
                  ),
                ),
                Container(
                  width: 60,
                  child: Text.rich(
                    TextSpan(
                        text: ' \$${cart.product.price}',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.redAccent,
                        ),
                        children: [
                          TextSpan(
                            text: ' x${cart.numOfItems} ',
                            style: TextStyle(color: Colors.blueGrey),
                          ),
                        ]),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
