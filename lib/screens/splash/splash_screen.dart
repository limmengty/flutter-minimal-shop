import 'dart:convert';

import 'package:ass_minimal_shop/helper/language_heper.dart';
import 'package:ass_minimal_shop/services/cache_logic.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../sign_in/sign_in_screen.dart';

class SplashScreen extends StatefulWidget {
  static String routeName = "/splash";

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 1), () async {
      await context.read<CacheLogic>().read();
      if (mounted) {
        Navigator.pushNamed(context, SignInScreen.routeName);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    CacheMinimalAppLanguage lang = context.watch<CacheLogic>().cacheLang;

    return Scaffold(
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text.rich(
                textAlign: TextAlign.center,
                TextSpan(
                  text: "${lang.welcome}\n",
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                  ),
                  children: [
                    TextSpan(
                      text: "${lang.to}\n",
                      style: const TextStyle(
                        fontSize: 25,
                        height: 3,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    TextSpan(
                      text: lang.minimalShop,
                      style: const TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
