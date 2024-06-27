import 'package:ass_minimal_shop/constants.dart';
import 'package:ass_minimal_shop/helper/language_heper.dart';
import 'package:ass_minimal_shop/services/cache_logic.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TitleBanner extends StatelessWidget {
  const TitleBanner({super.key});

  @override
  Widget build(BuildContext context) {
    CacheMinimalAppLanguage lang = context.watch<CacheLogic>().cacheLang;
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Center(
        child: Text.rich(
          textAlign: TextAlign.center,
          TextSpan(
            text: "${lang.newCollection}\n",
            style: const TextStyle(
              fontSize: 35,
            ),
            children: [
              TextSpan(
                text: lang.withText,
                style: const TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.w700,
                ),
              ),
              TextSpan(
                text: "15% ",
                style: TextStyle(
                  fontSize: 35,
                  color: buttonColor,
                  fontWeight: FontWeight.w700,
                ),
              ),
              TextSpan(
                text: lang.discount,
                style: const TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
