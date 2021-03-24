import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Widget child;
  final Color color;
  final double radius;
  final VoidCallback? onPressed;
  final EdgeInsets padding;
  CustomButton(
      {required this.child,
      required this.color,
      this.radius: 25.0,
      this.onPressed,
      this.padding: EdgeInsets.zero});
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: child,
      style: ElevatedButton.styleFrom(
        primary: color,
        padding: padding,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
        ),
        elevation: 10,
      ),
      onPressed: onPressed,
    );
  }
}

class LongRoundButton extends CustomButton {
  @required
  final String text;
  final Color color;
  final VoidCallback? onPressed;
  final EdgeInsets padding;
  LongRoundButton({
    required this.text,
    required this.color,
    this.onPressed,
    this.padding: EdgeInsets.zero,
  })  : assert(text != null),
        super(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 20,
              color: Colors.black,
            ),
          ),
          color: color,
          radius: 25,
          onPressed: onPressed,
          padding: padding,
        );
}

class LongRoundButtonWithIcon extends CustomButton {
  final String path;
  final String text;
  final Color color;
  final VoidCallback? onPressed;
  LongRoundButtonWithIcon({
    required this.path,
    required this.text,
    required this.color,
    this.onPressed,
  })  : assert(path != null && text != null),
        super(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: Image.asset(
                    path,
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      text,
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Opacity(
                    opacity: 0,
                    child: Image.asset(path),
                  ),
                )
              ],
            ),
            color: color,
            radius: 25,
            onPressed: onPressed,
            padding: EdgeInsets.only(top: 10, bottom: 10));
}

class SettingsButton extends StatelessWidget {
  final VoidCallback onPressed;

  const SettingsButton({Key? key, required this.onPressed}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: ElevatedButton(
          child: Image.asset(
            'assets/images/ajustes_icono.png',
          ),
          style: ElevatedButton.styleFrom(
            primary: Colors.blueGrey[50],
            padding: EdgeInsets.all(5),
            shape: CircleBorder(),
            elevation: 10,
          ),
          onPressed: onPressed,
        ));
  }
}
