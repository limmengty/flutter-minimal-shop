import 'package:ass_minimal_shop/helper/language_heper.dart';
import 'package:ass_minimal_shop/services/cache_logic.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../components/custom_surfix_icon.dart';
import '../../../components/form_error.dart';
import '../../otp/otp_screen.dart';

class CompleteProfileForm extends StatefulWidget {
  const CompleteProfileForm({super.key});

  @override
  _CompleteProfileFormState createState() => _CompleteProfileFormState();
}

class _CompleteProfileFormState extends State<CompleteProfileForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String?> errors = [];
  String? firstName;
  String? lastName;
  String? phoneNumber;
  String? address;

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
            onSaved: (newValue) => firstName = newValue,
            onChanged: (value) {
              if (value.isNotEmpty) {
                removeError(error: lang.errorFirstName);
              }
              return;
            },
            validator: (value) {
              if (value!.isEmpty) {
                addError(error: lang.errorFirstName);
                return "";
              }
              return null;
            },
            decoration: InputDecoration(
              labelText: lang.firstName,
              hintText: lang.firstName,
              floatingLabelBehavior: FloatingLabelBehavior.always,
              suffixIcon:
                  const CustomSurffixIcon(
                icon: Icon(Icons.account_circle),
              ),
            ),
          ),
          const SizedBox(height: 20),
          TextFormField(
            onSaved: (newValue) => lastName = newValue,
            onChanged: (value) {
              if (value.isNotEmpty) {
                removeError(error: lang.errorLastName);
              }
              return;
            },
            validator: (value) {
              if (value!.isEmpty) {
                addError(error: lang.errorLastName);
                return "";
              }
              return null;
            },
            decoration: InputDecoration(
              labelText: lang.lastName,
              hintText: lang.lastName,
              floatingLabelBehavior: FloatingLabelBehavior.always,
              suffixIcon: const CustomSurffixIcon(
                icon: Icon(Icons.account_circle),
              ),
            ),
          ),
          const SizedBox(height: 20),
          TextFormField(
            keyboardType: TextInputType.phone,
            onSaved: (newValue) => phoneNumber = newValue,
            onChanged: (value) {
              if (value.isNotEmpty) {
                removeError(error: lang.errorPhoneNumber);
              }
              return;
            },
            validator: (value) {
              if (value!.isEmpty) {
                addError(error: lang.errorPhoneNumber);
                return "";
              }
              return null;
            },
            decoration: InputDecoration(
              labelText: lang.phoneNumber,
              hintText: lang.phoneNumber,
              floatingLabelBehavior: FloatingLabelBehavior.always,
              suffixIcon:
                const CustomSurffixIcon(
                icon: Icon(Icons.phone),
              ),
            ),
          ),
          const SizedBox(height: 20),
          TextFormField(
            onSaved: (newValue) => address = newValue,
            onChanged: (value) {
              if (value.isNotEmpty) {
                removeError(error: lang.errorEmail);
              }
              return;
            },
            validator: (value) {
              if (value!.isEmpty) {
                addError(error: lang.errorEmail);
                return "";
              }
              return null;
            },
            decoration: InputDecoration(
              labelText: lang.phoneNumber,
              hintText: lang.phoneNumber,
              floatingLabelBehavior: FloatingLabelBehavior.always,
              suffixIcon:
              const CustomSurffixIcon(
                icon: Icon(Icons.location_on),
              ),
            ),
          ),
          FormError(errors: errors),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                Navigator.pushNamed(context, OtpScreen.routeName);
              }
            },
            child: Text(lang.login),
          ),
        ],
      ),
    );
  }
}
