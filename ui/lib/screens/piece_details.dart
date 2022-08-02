import 'package:Artivation/constants/constants.dart';
import 'package:Artivation/models/product.dart';
import 'package:Artivation/pages/cart/cart.dart';
import 'package:Artivation/screens/details_body.dart';
import 'package:flutter/material.dart';

class ArtDetails extends StatelessWidget {
  final Product product;

  Widget BuildAppBar(context) {
    return Container(
      height: 80,
      width: MediaQuery.of(context).size.width,
      color: Colors.black.withOpacity(0.3),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                icon: Icon(
                  Icons.chevron_left_rounded,
                  color: Colors.white,
                  size: Constants.iconSize + 5,
                ),
                onPressed: () => Navigator.pop(context)),
            IconButton(
              icon: Icon(
                Icons.shopping_bag_outlined,
                color: Colors.white,
                size: Constants.iconSize,
              ),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => FragmentCart(),
                ));
              },
            ),
          ],
        ),
      ),
    );
  }

  const ArtDetails({Key key, this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffE9E7E6),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: FractionalOffset.topLeft,
              end: FractionalOffset.bottomRight,
              colors: [Color(0xffE9E7E6), Color(0xffD4E4EA)]),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30)),
        ),
        child: Stack(children: [
          DetailBody(
            product: product,
          ),
          BuildAppBar(context),
        ]),
      ),
    );
  }
}
