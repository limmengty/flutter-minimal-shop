import 'package:ass_minimal_shop/helper/language_heper.dart';
import 'package:ass_minimal_shop/services/cache_logic.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../components/custom_surfix_icon.dart';
import '../../../components/form_error.dart';
import '../../../components/no_account_text.dart';
import '../../../constants.dart';

class ForgotPassForm extends StatefulWidget {
  const ForgotPassForm({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ForgotPassFormState createState() => _ForgotPassFormState();
}

class _ForgotPassFormState extends State<ForgotPassForm> {
  final _formKey = GlobalKey<FormState>();
  List<String> errors = [];
  String? email;
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
              if (value.isNotEmpty && errors.contains(lang.errorEmail)) {
                setState(() {
                  errors.remove(lang.email);
                });
              } else if (emailValidatorRegExp.hasMatch(value) &&
                  errors.contains(lang.errorEmail)) {
                setState(() {
                  errors.remove(lang.errorEmail);
                });
              }
              return;
            },
            validator: (value) {
              if (value!.isEmpty && !errors.contains(lang.errorEmail)) {
                setState(() {
                  errors.add(lang.errorEmail);
                });
              } else if (!emailValidatorRegExp.hasMatch(value) &&
                  !errors.contains(lang.errorEmail)) {
                setState(() {
                  errors.add(lang.errorEmail);
                });
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
          const SizedBox(height: 8),
          FormError(errors: errors),
          const SizedBox(height: 8),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {}
            },
            child: Text(lang.login),
          ),
          const SizedBox(height: 16),
          const NoAccountText(),
        ],
      ),
    );
  }
}
