import 'package:flutter/material.dart';

import 'constants.dart';

class AppTheme {
  static ThemeData lightTheme(BuildContext context) {
    return ThemeData(
      scaffoldBackgroundColor: Colors.white,
      fontFamily: "Muli",
      appBarTheme: const AppBarTheme(
          color: Colors.white,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
          titleTextStyle: TextStyle(color: Colors.black)),
      textTheme: const TextTheme(
        bodyLarge: TextStyle(color: kPrimaryLightColor),
        bodyMedium: TextStyle(color: kPrimaryColor),
        bodySmall: TextStyle(color: kTextColor),
      ),
      inputDecorationTheme: const InputDecorationTheme(
        floatingLabelBehavior: FloatingLabelBehavior.always,
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 7),
        enabledBorder: outlineInputBorderLight,
        focusedBorder: outlineInputBorderLight,
        border: outlineInputBorderLight,
        hintStyle: TextStyle(color: kTextColor),
        focusColor: kTextColorDark,
        prefixIconColor: kTextColor,
        suffixIconColor: kTextColor
      ),
      visualDensity: VisualDensity.adaptivePlatformDensity,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: kPrimaryColor,
          foregroundColor: Colors.white,
          minimumSize: const Size(double.infinity, 40),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
        ),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Colors.white,
      ),
      checkboxTheme: CheckboxThemeData(
        checkColor: WidgetStateProperty.all(Colors.white),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
          side: const BorderSide(
            color: Colors.white, // Border color
            width: 1, // Border width
          ),
        ),
        fillColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return const Color.fromARGB(255, 42, 32, 185);
          }
          return Colors.transparent;
        }),
      ),
      iconTheme: const IconThemeData(color: kTextColor),
      cardColor: Colors.white,
    );
  }

  static ThemeData darkTheme(BuildContext context) {
    return ThemeData(
      scaffoldBackgroundColor: const Color.fromRGBO(7, 25, 82, 1),
      fontFamily: "Muli",
      appBarTheme: const AppBarTheme(
          color: Color.fromRGBO(7, 25, 82, 1),
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.white),
          titleTextStyle: TextStyle(color: Colors.white)),
      textTheme: const TextTheme(
        bodyLarge: TextStyle(color: kTextColorDark),
        bodyMedium: TextStyle(color: kTextColorDark),
        bodySmall: TextStyle(color: kTextColorDark),
      ),
      inputDecorationTheme: const InputDecorationTheme(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 7),
          enabledBorder: outlineInputBorderDark,
          focusedBorder: outlineInputBorderDark,
          border: outlineInputBorderDark,
          hintStyle: TextStyle(color: kTextColorDark),
          focusColor: kTextColorDark,
          prefixIconColor: kTextColorDark,
          suffixIconColor: kTextColorDark
          ),
      visualDensity: VisualDensity.adaptivePlatformDensity,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: kTextColorDark,
          foregroundColor: kTextColor,
          minimumSize: const Size(double.infinity, 40),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
        ),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Color.fromRGBO(7, 25, 82, 1),
      ),
      checkboxTheme: CheckboxThemeData(
        checkColor: WidgetStateProperty.all(Colors.white),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
          side: const BorderSide(
            color: Colors.white, // Border color
            width: 1, // Border width
          ),
        ),
        fillColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return Colors.green;
          }
          return Colors.transparent;
        }),
      ),
      iconTheme: const IconThemeData(color: kTextColorDark),
      cardColor:  const Color.fromRGBO(7, 25, 82, 1),
    );
  }
}

const OutlineInputBorder outlineInputBorderLight = OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(5)),
  borderSide: BorderSide(color: kTextColor),
  gapPadding: 5,
);
const OutlineInputBorder outlineInputBorderDark = OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(5)),
  borderSide: BorderSide(color: kTextColorDark),
  gapPadding: 5,
);
