import 'package:first_animation/screens/details/details_screen.dart';
import 'package:first_animation/screens/home/components/cart_details_card.dart';
import 'package:first_animation/screens/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:first_animation/constants.dart';
import 'package:first_animation/models/product.dart';
import 'package:first_animation/screens/home/components/home_header.dart';
import 'package:first_animation/screens/home/components/product_card.dart';

class HomeScreen extends StatelessWidget {
  // const HomeScreen({super.key});
  final controller = HomeController();
  void _onVerticalGesture(DragUpdateDetails details) {
    if (details.primaryDelta! < 0.7) {
      controller.changeHomeState(HomeState.cart);
    } else if (details.primaryDelta! > 12) {
      controller.changeHomeState(HomeState.normal);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: AnimatedBuilder(
              animation: controller,
              builder: (context, _) {
                return LayoutBuilder(
                  builder: (context, BoxConstraints constraints) {
                    return Stack(
                      children: [
                        AnimatedPositioned(
                          duration: panelTransition,
                          top: controller.homeState == HomeState.normal
                              ? 0
                              : -headerHeight,
                          left: 0,
                          right: 0,
                          height: headerHeight,
                          child: HomeHeader(),
                        ),
                        AnimatedPositioned(
                          duration: panelTransition,
                          top: controller.homeState == HomeState.normal
                              ? headerHeight
                              : -500,
                          left: 0,
                          right: 0,
                          child: Container(
                            height: constraints.maxHeight -
                                headerHeight -
                                cartBarHeight,
                            padding: EdgeInsets.symmetric(
                                horizontal: defaultPadding,
                                vertical: defaultPadding),
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(defaultPadding),
                            ),
                            child: GridView.builder(
                              itemCount: products.length,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 3 / 4,
                                mainAxisSpacing: defaultHeight,
                                crossAxisSpacing: defaultHeight,
                              ),
                              itemBuilder: (context, index) => ProductCard(
                                product: products[index],
                                press: () {
                                  Navigator.push(
                                    context,
                                    PageRouteBuilder(
                                      transitionDuration:
                                          const Duration(microseconds: 500),
                                      reverseTransitionDuration:
                                          const Duration(microseconds: 500),
                                      pageBuilder: (context, animation,
                                              secondaryAnimation) =>
                                          FadeTransition(
                                        opacity: animation,
                                        child: DetailsScreen(
                                          product: products[index],
                                          onProductAdd: () {
                                            controller.addProductToCart(
                                              products[index],
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                        AnimatedPositioned(
                          duration: panelTransition,
                          bottom: 0,
                          left: 0,
                          right: 0,
                          height: controller.homeState == HomeState.normal
                              ? cartBarHeight
                              : (constraints.maxHeight - cartBarHeight),
                          child: GestureDetector(
                            onVerticalDragUpdate: _onVerticalGesture,
                            child: Container(
                              color: Color(0xFFEAEAEA),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                );
              }),
        ),
      ),
    );
  }
}
