import 'package:flutter/material.dart';

class AppName extends StatelessWidget {
  final double captitalSize;
  final double lowerCaseSize;
  final Color firstColor;
  final Color secondColor;
  final Color thirdColor;

  const AppName(
      {this.captitalSize: 40,
      this.lowerCaseSize: 30,
      this.firstColor: const Color(0Xff81D4FA),
      this.secondColor: const Color(0xff29B6F6),
      this.thirdColor: const Color(0xff039BE5)});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        style: TextStyle(
          fontFamily: 'Trebuchet MS',
          fontSize: captitalSize,
          color: firstColor,
        ),
        children: [
          TextSpan(
            text: 'C',
          ),
          TextSpan(
            text: 'ONECTA',
            style: TextStyle(
              fontSize: lowerCaseSize,
            ),
          ),
          TextSpan(
            text: 'C',
            style: TextStyle(
              color: secondColor,
            ),
          ),
          TextSpan(
            text: 'ON',
            style: TextStyle(
              fontSize: lowerCaseSize,
              color: secondColor,
            ),
          ),
          TextSpan(
            text: 'TEA',
            style: TextStyle(
              color: thirdColor,
            ),
          ),
        ],
      ),
      textAlign: TextAlign.left,
    );
  }
}
