import 'package:ass_minimal_shop/screens/home/components/slidable_image.dart';
import 'package:ass_minimal_shop/screens/home/components/title_banner.dart';
import 'package:ass_minimal_shop/screens/products/tapbar.dart';
import 'package:flutter/material.dart';
import 'components/home_header.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = "/home";

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Column(
            children: [
              const HomeHeader(),
              const SizedBox(
                height: 20,
              ),
              const TitleBanner(),
              const SlidableImage(),
              const SizedBox(height: 70),
              TapBar(),
            ],
          ),
        ),
      ),
    );
  }
}
