import 'package:ass_minimal_shop/helper/language_heper.dart';
import 'package:ass_minimal_shop/screens/init_screen.dart';
import 'package:ass_minimal_shop/services/cache_logic.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../components/custom_surfix_icon.dart';
import '../../../components/form_error.dart';
import '../../../constants.dart';
import '../../../helper/keyboard.dart';
import '../../forgot_password/forgot_password_screen.dart';

class SignForm extends StatefulWidget {
  const SignForm({super.key});

  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final _formKey = GlobalKey<FormState>();
  String? email;
  String? password;
  bool? remember = false;
  final List<String?> errors = [];

  void addError({String? error}) {
    if (!errors.contains(error)) {
      setState(() {
        errors.add(error);
      });
    }
  }

  void removeError({String? error}) {
    if (errors.contains(error)) {
      setState(() {
        errors.remove(error);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    int isDark = context.watch<CacheLogic>().modeIndex;
    CacheMinimalAppLanguage lang = context.watch<CacheLogic>().cacheLang;

    print(isDark);
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            onSaved: (newValue) => email = newValue,
            onChanged: (value) {
              if (value.isNotEmpty) {
                removeError(error: lang.errorEmail);
              } else if (emailValidatorRegExp.hasMatch(value)) {
                removeError(error: lang.errorEmail);
              }
              return;
            },
            validator: (value) {
              if (value!.isEmpty) {
                addError(error: lang.errorEmail);
                return "";
              } else if (!emailValidatorRegExp.hasMatch(value)) {
                addError(error: lang.errorEmail);
                return "";
              }
              return null;
            },
            decoration: InputDecoration(
              hintText: lang.email,
              floatingLabelBehavior: FloatingLabelBehavior.always,
              suffixIcon: const CustomSurffixIcon(
                icon: Icon(Icons.mail),
              ),
            ),
          ),
          const SizedBox(height: 20),
          TextFormField(
            obscureText: true,
            onSaved: (newValue) => password = newValue,
            onChanged: (value) {
              if (value.isNotEmpty) {
                removeError(error: lang.errorPassword);
              } else if (value.length >= 8) {
                removeError(error: lang.errorPassword);
              }
              return;
            },
            validator: (value) {
              if (value!.isEmpty) {
                addError(error: lang.errorPassword);
                return "";
              } else if (value.length < 8) {
                addError(error: lang.errorPassword);
                return "";
              }
              return null;
            },
            decoration: InputDecoration(
              hintText: lang.password,
              floatingLabelBehavior: FloatingLabelBehavior.always,
              suffixIcon: const CustomSurffixIcon(
                icon: Icon(Icons.lock),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Checkbox(
                value: remember,
                onChanged: (value) {
                  setState(() {
                    remember = value;
                  });
                },
              ),
              Text(lang.remember),
              const Spacer(),
              GestureDetector(
                onTap: () => Navigator.pushNamed(
                    context, ForgotPasswordScreen.routeName),
                child: Text(
                  lang.forgetPassword,
                  style: const TextStyle(decoration: TextDecoration.underline),
                ),
              )
            ],
          ),
          FormError(errors: errors),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                // if all are valid then go to success screen
                KeyboardUtil.hideKeyboard(context);
                Navigator.pushNamed(context, InitScreen.routeName);
              }
            },
            child: Text(lang.login),
          ),
        ],
      ),
    );
  }
}
