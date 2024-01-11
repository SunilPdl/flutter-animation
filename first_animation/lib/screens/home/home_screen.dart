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
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                height: MediaQuery.of(context).size.height * 0.08,
                child: HomeHeader(),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height * 0.08,
                left: 0,
                right: 0,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.8,
                  padding: EdgeInsets.symmetric(
                      horizontal: defaultPadding, vertical: defaultPadding),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(defaultPadding),
                  ),
                  child: GridView.builder(
                    itemCount: products.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 3 / 4,
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
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                height: MediaQuery.of(context).size.height * 0.08,
                child: Container(
                  color: Colors.red,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
