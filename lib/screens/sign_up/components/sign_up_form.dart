import 'package:ass_minimal_shop/helper/language_heper.dart';
import 'package:ass_minimal_shop/services/cache_logic.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../components/custom_surfix_icon.dart';
import '../../../components/form_error.dart';
import '../../../constants.dart';
import '../../complete_profile/complete_profile_screen.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  String? email;
  String? password;
  String? conform_password;
  bool remember = false;
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
    CacheMinimalAppLanguage lang = context.watch<CacheLogic>().cacheLang;

    return Form(
      key: _formKey,
      child: Column(
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
              password = value;
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
            decoration:  InputDecoration(
              hintText: lang.password,
              floatingLabelBehavior: FloatingLabelBehavior.always,
              suffixIcon: const CustomSurffixIcon(
                icon: Icon(Icons.lock),
              ),
            ),
          ),
          const SizedBox(height: 20),
          TextFormField(
            obscureText: true,
            onSaved: (newValue) => conform_password = newValue,
            onChanged: (value) {
              if (value.isNotEmpty) {
                removeError(error: lang.errorComfirmPassword);
              } else if (value.isNotEmpty && password == conform_password) {
                removeError(error: lang.errorComfirmPassword);
              }
              conform_password = value;
            },
            validator: (value) {
              if (value!.isEmpty) {
                addError(error: lang.errorComfirmPassword);
                return "";
              } else if ((password != value)) {
                addError(error: lang.errorComfirmPassword);
                return "";
              }
              return null;
            },
            decoration: InputDecoration(
              hintText: lang.rePassword,
              floatingLabelBehavior: FloatingLabelBehavior.always,
              suffixIcon: const CustomSurffixIcon(
                icon: Icon(Icons.lock),
              ),
            ),
          ),
          FormError(errors: errors),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                // if all are true then go to success screen
                Navigator.pushNamed(context, CompleteProfileScreen.routeName);
              }
            },
            child: Text(lang.login),
          ),
        ],
      ),
    );
  }
}
