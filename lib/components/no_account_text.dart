import 'package:ass_minimal_shop/helper/language_heper.dart';
import 'package:ass_minimal_shop/services/cache_logic.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../screens/sign_up/sign_up_screen.dart';

class NoAccountText extends StatelessWidget {
  const NoAccountText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CacheMinimalAppLanguage lang = context.watch<CacheLogic>().cacheLang;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          lang.notAccount,
          style: const TextStyle(fontSize: 16),
        ),
        GestureDetector(
          onTap: () => Navigator.pushNamed(context, SignUpScreen.routeName),
          child: Text(
            lang.signUp,
            style: const TextStyle(fontSize: 16),
          ),
        ),
      ],
    );
  }
}
