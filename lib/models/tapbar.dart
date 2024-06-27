import 'package:ass_minimal_shop/screens/products/components/all_product.dart';
import 'package:ass_minimal_shop/screens/products/components/bag_product.dart';
import 'package:ass_minimal_shop/screens/products/components/computer_product.dart';
import 'package:ass_minimal_shop/screens/products/components/iphone_product.dart';
import 'package:ass_minimal_shop/screens/products/components/keyboard_product.dart';
import 'package:ass_minimal_shop/screens/products/components/mouse_product.dart';
import 'package:ass_minimal_shop/screens/products/components/ssd_product.dart';
import 'package:flutter/material.dart';

class TapbarModel {
  List<String> items = [
    "All",
    'Phone',
    "Computer",
    "Mouse",
    "Keyboard",
    "Headset",
    'Bag'
  ];
  List<Widget> screen = [
    const AllProduct(),
    const IphoneProduct(),  
    const ComputerProduct(),
    const MouseProduct(),
    const KeyboardProduct(),
    const SSDProduct(),
    const BagProduct()
  ];
} 
