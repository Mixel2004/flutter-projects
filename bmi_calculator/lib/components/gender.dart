import 'package:flutter/material.dart';

import '../constants.dart';

class GenderIcon extends StatelessWidget {
  final IconData icon;
  final String label;

  const GenderIcon({required this.icon, required this.label});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 80,
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          label,
          style: kTextStyle,
        )
      ],
    );
  }
}
