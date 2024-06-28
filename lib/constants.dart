import 'package:flutter/material.dart';

const kPrimaryColor =  Color.fromRGBO(7, 25, 82,1);
const kPrimaryLightColor = Color.fromRGBO(8, 131, 149,1);
Color primaryColor = const Color(0xff0C0B0C);
Color buttonColor = const Color.fromARGB(255, 10, 187, 54);

const kSecondaryColor = Color(0x071952);
const kTextColor = Colors.black;
const kTextColorDark = Colors.white;

const kAnimationDuration = Duration(milliseconds: 200);

const headingStyle = TextStyle(
  fontSize: 24,
  fontWeight: FontWeight.bold,
  height: 1.5,
);
const titleStyle = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.bold,
  height: 1.5,
);

const defaultDuration = Duration(milliseconds: 250);

// Form Error
final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

final otpInputDecoration = InputDecoration(
  contentPadding: const EdgeInsets.symmetric(vertical: 16),
  border: outlineInputBorder(),
  focusedBorder: outlineInputBorder(),
  enabledBorder: outlineInputBorder(),
);

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(16),
    borderSide: const BorderSide(color: kPrimaryLightColor),
  );
}
