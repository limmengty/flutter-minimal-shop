import 'package:ass_minimal_shop/helper/language_heper.dart';
import 'package:ass_minimal_shop/services/cache_logic.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'components/forgot_pass_form.dart';

class ForgotPasswordScreen extends StatelessWidget {
  static String routeName = "/forgot_password";

  const ForgotPasswordScreen({super.key});
  @override
  Widget build(BuildContext context) {
    CacheMinimalAppLanguage lang = context.watch<CacheLogic>().cacheLang;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          lang.forgetPassword,
          style: const TextStyle(
            fontSize: 18,
          ),
        ),
      ),
      body: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height / 4),
                Text(
                  lang.forgetPassword,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 32),
                const ForgotPassForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
