import 'package:first_animation/constants.dart';
import 'package:first_animation/screens/home/components/cart_details_card.dart';
import 'package:first_animation/screens/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';

class CartDetailsView extends StatelessWidget {
  const CartDetailsView({Key? key, required this.controller}) : super(key: key);

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Cart",
            style: TextStyle(fontSize: 18),
          ),
          ...List.generate(
            controller.cart.length,
            (index) => CartDetailsCard(productItem: controller.cart[index]),
          ),
          SizedBox(height: defaultHeight),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: primaryColor,
              ),
              child: Text(
                "Next - \$30",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
