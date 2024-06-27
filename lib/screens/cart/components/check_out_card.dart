import 'package:ass_minimal_shop/helper/language_heper.dart';
import 'package:ass_minimal_shop/services/cache_logic.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';

class CheckoutCard extends StatelessWidget {
  const CheckoutCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CacheLogic>().cart;
    CacheMinimalAppLanguage lang = context.watch<CacheLogic>().cacheLang;
    double totalPrice = 0.0;
    for (var e in cart) {
      String priceString = e.productPrice.replaceAll(RegExp(r'[^\d.]'), '');
      totalPrice += double.parse(priceString);
    }

    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 16,
        horizontal: 20,
      ),
      // height: 174,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, -15),
            blurRadius: 5,
            color: const Color(0xFFDADADA).withOpacity(0.02),
          )
        ],
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: Colors.transparent.withOpacity(.1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: SvgPicture.asset("assets/icons/receipt.svg"),
                ),
                const Spacer(),
                Text(lang.addVoucherCode),
                const SizedBox(width: 8),
                const Icon(
                  Icons.arrow_forward_ios,
                  size: 12,
                )
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: Text.rich(
                    TextSpan(
                      text: "${lang.total}:\n",
                      children: [
                        TextSpan(
                          text: totalPrice.toStringAsFixed(2),
                          style: const TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text(lang.checkOut),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
