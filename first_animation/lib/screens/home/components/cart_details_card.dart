import 'package:first_animation/components/price.dart';
import 'package:first_animation/constants.dart';
import 'package:first_animation/models/productItem.dart';
import 'package:flutter/material.dart';

class CartDetailsCard extends StatelessWidget {
  const CartDetailsCard({
    Key? key,
    required this.productItem,
  }) : super(key: key);

  final ProductItem productItem;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(vertical: defaultHeight),
      leading: CircleAvatar(
        radius: 15,
        backgroundColor: Colors.white,
        backgroundImage: AssetImage(productItem.product!.image!),
      ),
      title: Text(
        productItem.product!.title!,
        style: TextStyle(
          color: Colors.black87,
          fontWeight: FontWeight.bold,
          fontSize: 22,
        ),
      ),
      trailing: FittedBox(
        child: Row(
          children: [
            Price(amount: 1200),
            Text(
              " x${productItem.quantity}",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
