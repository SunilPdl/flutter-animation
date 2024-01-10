import 'package:flutter/material.dart';
import 'package:first_animation/constants.dart';
import 'package:first_animation/models/product.dart';
import 'package:first_animation/screens/home/components/home_header.dart';
import 'package:first_animation/screens/home/components/product_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          color: Color(0xFFEAEAEA),
          child: Column(
            children: [
              HomeHeader(),
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: defaultPadding, vertical: defaultPadding * 2),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(defaultPadding * 1.5),
                      bottomRight: Radius.circular(defaultPadding * 1.5),
                    ),
                    color: Colors.white,
                  ),
                  child: GridView.builder(
                    itemCount: products.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 2 / 3,
                      mainAxisSpacing: defaultHeight,
                      crossAxisSpacing: defaultHeight,
                    ),
                    itemBuilder: (context, index) => ProductCard(
                      product: products[index],
                      press: () {},
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
