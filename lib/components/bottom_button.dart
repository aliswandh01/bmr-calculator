import 'package:flutter/material.dart';
import 'package:bmr/constants.dart';

class BottomButton extends StatelessWidget {
  const BottomButton({required this.buttonTitle, required this.onTap});

  final String buttonTitle; // tulisan pada tombol
  final Function() onTap; // aksi saat tombol ditekan

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(top: 10.0),
        height: bottomContainerHeight,
        color: bottomContainerColor,
        child: Center(
          child: Text(
            buttonTitle,
            style: buttonTextStyle,
          ),
        ),
      ),
    );
  }
}