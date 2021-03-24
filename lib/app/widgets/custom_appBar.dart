import 'package:conectacontea/app/widgets/custom_buttons.dart';
import 'package:conectacontea/app/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends AppBar {
  final Color color;
  final Widget title;
  final List<Widget> actions;

  CustomAppBar({
    Key? key,
    this.color: Colors.transparent,
    this.title: const AppName(
      captitalSize: 25,
      lowerCaseSize: 20,
      firstColor: const Color(0xff02C2E5),
    ),
    required this.actions,
  }) : super(
          key: key,
          backgroundColor: color,
          title: title,
          centerTitle: true,
          actions: actions,
        );
}
