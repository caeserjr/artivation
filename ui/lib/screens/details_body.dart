import 'package:Artivation/models/product.dart';
import 'package:flutter/material.dart';
import 'components/add_to_cart.dart';
import 'components/counter_fav.dart';
import 'components/create_desc.dart';

class DetailBody extends StatelessWidget {
  final Product product;

  const DetailBody({Key key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: size.width,
      child: Stack(
        children: [
          Container(
            height: size.height * .7,
            width: size.width,
            child: Hero(
              tag: 'image${product.id}',
              child: Image.asset(
                product.image,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: Container(
              height: size.height * .40,
              width: size.width,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: FractionalOffset.topLeft,
                    end: FractionalOffset.bottomRight,
                    colors: [
                      Color.fromARGB(255, 227, 233, 234),
                      Color.fromARGB(255, 204, 222, 229)
                    ]),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(45),
                    topRight: Radius.circular(45)),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: size.width * .6,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                product.title,
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 23,
                                    color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: size.width * .2,
                        child: RichText(
                          text: TextSpan(
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontWeight: FontWeight.w800,
                                  fontSize: 13),
                              children: [
                                TextSpan(
                                  text: 'Dimensions\n',
                                ),
                                TextSpan(
                                    text: '${product.dim}' +
                                        " x " +
                                        '${product.dim}' +
                                        ' cm')
                              ]),
                        ),
                      ),
                      Container(
                        width: size.width * .2,
                        child: RichText(
                          text: TextSpan(
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontWeight: FontWeight.w800,
                                  fontSize: 13),
                              children: [
                                TextSpan(
                                  text: 'Price\n',
                                ),
                                TextSpan(
                                    text: '${product.price} ',
                                    style: TextStyle(fontSize: 18)),
                                TextSpan(
                                    text: "\$", style: TextStyle(fontSize: 18))
                              ]),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Description(size: size, product: product),
                  ),
                  CountWithFavBtn(),
                  AddToCart(),
                  SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
