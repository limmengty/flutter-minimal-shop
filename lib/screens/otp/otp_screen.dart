import 'package:ass_minimal_shop/helper/language_heper.dart';
import 'package:ass_minimal_shop/services/cache_logic.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants.dart';

import 'components/otp_form.dart';

class OtpScreen extends StatelessWidget {
  static String routeName = "/otp";

  const OtpScreen({super.key});
  @override
  Widget build(BuildContext context) {
    CacheMinimalAppLanguage lang = context.watch<CacheLogic>().cacheLang;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          lang.otpVerify,
          style: const TextStyle(
            fontSize: 18,
          ),
        ),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height / 8),
                Text(
                  lang.otpVerify,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    height: 1.5,
                  ),
                ),
                Text(lang.weSent),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(lang.thisCode),
                    TweenAnimationBuilder(
                      tween: Tween(begin: 30.0, end: 0.0),
                      duration: const Duration(seconds: 30),
                      builder: (_, dynamic value, child) => Text(
                        "00:${value.toInt()}",
                        style: const TextStyle(),
                      ),
                    ),
                  ],
                ),
                const OtpForm(),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    // OTP code resend
                  },
                  child: Text(
                    lang.resendOTP,
                    style:
                        const TextStyle(decoration: TextDecoration.underline),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
