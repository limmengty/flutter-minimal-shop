import 'package:ass_minimal_shop/constants.dart';
import 'package:ass_minimal_shop/helper/language_heper.dart';
import 'package:ass_minimal_shop/screens/cart/components/cart.dart';
import 'package:ass_minimal_shop/services/cache_logic.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'components/check_out_card.dart';

class CartScreen extends StatefulWidget {
  static String routeName = "/cart";

  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CacheLogic>().cart;
    CacheMinimalAppLanguage lang = context.watch<CacheLogic>().cacheLang;

    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            Text(
              lang.yourCart,
              style: titleStyle,
            ),
            Text(
              "${cart.length} ${lang.itemCart}",
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView.builder(
            itemCount: cart.length,
            itemBuilder: (context, index) {
              final item = cart[index];
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Dismissible(
                  key: Key(cart.length.toString()),
                  direction: DismissDirection.endToStart,
                  onDismissed: (direction) {
                    setState(() {
                      context.read<CacheLogic>().removeFromCart(item);
                    });
                  },
                  background: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFE6E6),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      children: [
                        const Spacer(),
                        SvgPicture.asset("assets/icons/Trash.svg"),
                      ],
                    ),
                  ),
                  child: Cart(
                    title: item.productTitle,
                    image: item.productPhoto,
                    price: item.productPrice,
                  ),
                ),
              );
            }),
      ),
      bottomNavigationBar: const CheckoutCard(),
    );
  }
}
