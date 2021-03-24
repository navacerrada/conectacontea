import 'package:conectacontea/app/widgets/custom_buttons.dart';
import 'package:flutter/material.dart';

class CustomHomeButtonContainer extends StatelessWidget {
  final double aspectRatio;
  final double horizontalPadding;
  final double bordesRadius;
  final Color color;
  final String pathImage;
  final VoidCallback onPressed;

  const CustomHomeButtonContainer(
      {Key? key,
      required this.aspectRatio,
      this.horizontalPadding: 40,
      this.bordesRadius: 10,
      required this.pathImage,
      required this.onPressed,
      this.color: Colors.white})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: aspectRatio,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
        child: CustomButton(
          child: Image.asset(pathImage),
          color: color,
          radius: bordesRadius,
          onPressed: onPressed,
        ),
      ),
    );
  }
}
