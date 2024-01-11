import 'package:first_animation/models/product.dart';

class ProductItem {
  int quantity;
  final Product? product;

  ProductItem({this.quantity = 1, required this.product});

  void increment() {
    quantity++;
  }

  void decrement() {
    if (quantity > 0) quantity--;
  }
}
