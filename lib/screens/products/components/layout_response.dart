import 'package:ass_minimal_shop/components/product_card_response.dart';
import 'package:flutter/material.dart';

class LayoutResponse extends StatefulWidget {
  const LayoutResponse({super.key});

  @override
  _LayoutResponseState createState() => _LayoutResponseState();
}

class _LayoutResponseState extends State<LayoutResponse> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(left: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.64,
                crossAxisSpacing: 10,
              ),
              itemCount: 2,
              itemBuilder: (context, index) {
                return FadeTransition(
                  opacity: _animation,
                  child:  ProductResponeCard(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
