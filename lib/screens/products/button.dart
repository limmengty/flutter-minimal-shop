import 'package:ass_minimal_shop/constants.dart';
import 'package:flutter/material.dart';

class ButtonList extends StatelessWidget {
  const ButtonList({required this.text, required this.onPress, required this.width});
  final String text;
  final VoidCallback onPress;
  final double width;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        width: width,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Row(
            children: [
              const SizedBox(
                width: 15,
              ),
              const SizedBox(width: 8),
              Text(
                text,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Theme.of(context).colorScheme.secondary),
              )
            ],
          ),
        ),
      ),
    );
  }
}
