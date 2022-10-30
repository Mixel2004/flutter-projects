import 'package:flutter/material.dart';

class CardInfo extends StatelessWidget {
  final Color colour;
  final Widget cardChild;
  final Function()? onPress;

  const CardInfo(
      {required this.colour,
      this.cardChild = const Text('hello'),
      this.onPress});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: colour,
        ),
        child: cardChild,
      ),
    );
  }
}
