import 'package:flutter/material.dart';

class MyButtons extends StatelessWidget {
  final Color;
  final textColor;
  final String buttonText;
  final buttonTap;

  MyButtons(
      {this.Color, this.textColor, required this.buttonText, this.buttonTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: buttonTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            color: Color,
            child: Center(
              child: Text(
                buttonText,
                style: TextStyle(color: textColor, fontSize: 20),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
