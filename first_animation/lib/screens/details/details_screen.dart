import 'package:first_animation/components/favourite_icon.dart';
import 'package:first_animation/components/price.dart';
import 'package:first_animation/constants.dart';
import 'package:first_animation/models/product.dart';
import 'package:first_animation/screens/details/components/cart_counter.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({Key? key, required this.product}) : super(key: key);

  final Product product;

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(),
      body: Column(
        children: [
          AspectRatio(
            aspectRatio: 1.37,
            child: Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                Container(
                  width: double.infinity,
                  color: Color(0xFFF8F8F8),
                  child: Image.asset(widget.product.image!),
                ),
                Positioned(
                  bottom: -20,
                  child: CartCounter(),
                )
              ],
            ),
          ),
          SizedBox(height: defaultPadding * 1.5),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    widget.product.title!.toUpperCase(),
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 22,
                    ),
                  ),
                ),
                Price(amount: 20.00),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(defaultPadding),
            child: Text(
              "Wearing proper walking shoes is a fundamental element in maintaining the correct walking technique, as well as preventing injury. Shoes are tools. Without the correct tools, you are likely to hurt yourself, making you more prone to suffer further and more severe injuries in the future.A shoe is a type of footwear. It is an item of clothing. You can wear them outside. Shoes come in pairs, with one shoe for each foot. People usually wear shoes in public. They are worn for hygiene, style, and comfort. While there are some shoes that don't need socks to wear, shoes are usually worn with socks.",
              textAlign: TextAlign.justify,
              style: TextStyle(
                color: Color(0xFFBDBDBD),
                height: 1.8,
              ),
            ),
          ),
        ],
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      leading: BackButton(
        color: Colors.black,
      ),
      backgroundColor: Color(0xFFF8F8F8),
      elevation: 0,
      centerTitle: true,
      title: Text(
        "Fruits",
        style: TextStyle(color: Colors.black),
      ),
      actions: [
        FavBtn(radius: 20),
        SizedBox(width: defaultPadding),
      ],
    );
  }
}
