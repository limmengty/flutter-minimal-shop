import 'package:ass_minimal_shop/constants.dart';
import 'package:ass_minimal_shop/screens/details/build_list_cart.dart';
import 'package:ass_minimal_shop/services/cache_logic.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ass_minimal_shop/models/product_model.dart';
import 'package:ass_minimal_shop/screens/cart/cart_screen.dart';
import 'package:provider/provider.dart';
import 'components/top_rounded_container.dart';

class DetailsScreen extends StatelessWidget {
  static String routeName = "/details";

  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ProductDetailsArguments agrs =
        ModalRoute.of(context)!.settings.arguments as ProductDetailsArguments;
    final product = agrs.product;
    // ignore: non_constant_identifier_names
    final product_range = agrs.product.productStarRating;
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              shape: const CircleBorder(),
              padding: EdgeInsets.zero,
              elevation: 0,
            ),
            child: const Icon(
              Icons.arrow_back_ios_new,
              size: 20,
            ),
          ),
        ),
        actions: [
          Row(
            children: [
              Container(
                margin: const EdgeInsets.only(right: 20),
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                    color: kPrimaryLightColor,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Row(
                    children: [
                      Text(
                        product_range,
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(width: 4),
                      SvgPicture.asset("assets/icons/Star Icon.svg"),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      body: BuildListCart(
        product: product,
      ),
      bottomNavigationBar: TopRoundedContainer(
        color: Colors.transparent.withOpacity(.001),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, CartScreen.routeName);
                // add to cart
                context.read<CacheLogic>().addToCart(product);
              },
              child: const Text("Add To Cart"),
            ),
          ),
        ),
      ),
    );
  }
}

class ProductDetailsArguments {
  final Product product;

  ProductDetailsArguments({required this.product});
}
