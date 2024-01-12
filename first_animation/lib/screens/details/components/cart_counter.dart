import 'package:first_animation/constants.dart';
import 'package:first_animation/screens/details/components/round_icon_btn.dart';
import 'package:flutter/material.dart';

class CartCounter extends StatelessWidget {
  const CartCounter({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFF6F6F6),
        borderRadius: const BorderRadius.all(Radius.circular(40)),
      ),
      child: Row(
        children: [
          RoundIconBtn(
            iconData: Icons.remove,
            color: Colors.black38,
            press: () {},
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: defaultPadding / 2),
            child: Text(
              "1",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
            ),
          ),
          RoundIconBtn(
            iconData: Icons.add,
            color: Color(0xFF40A944),
            press: () {},
          ),
        ],
      ),
    );
  }
}
