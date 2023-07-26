import 'package:Artivation/models/product.dart';

class Cart {
  final Product product;
  final int numOfItems;

  Cart({required this.product, required this.numOfItems});
}

List<Cart> cartItems = [
  Cart(product: products[0], numOfItems: 2),
  Cart(product: products[3], numOfItems: 3),
  Cart(product: products[5], numOfItems: 1),
  Cart(product: products[6], numOfItems: 7),
  Cart(product: products[7], numOfItems: 2),
  Cart(product: products[1], numOfItems: 4),
];
