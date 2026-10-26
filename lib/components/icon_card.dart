import 'package:flutter/material.dart';
import 'package:bmr/constants.dart';

class IconCard extends StatelessWidget {
  const IconCard({this.cardIcon, required this.caption});

  final IconData? cardIcon; // ikon yang ditampilkan
  final String caption; // teks di bawah ikon

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          cardIcon,
          size: 70.0,
        ),
        const SizedBox(
          height: 15.0,
        ),
        Text(
          caption,
          style: labelTextStyle,
        ),
      ],
    );
  }
}