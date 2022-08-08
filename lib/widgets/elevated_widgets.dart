import 'package:flutter/material.dart';

class ElevatedButtonWidget extends StatelessWidget {
  const ElevatedButtonWidget(
      {Key? key,
      required this.width,
      this.backgroundColor,
      required this.child,
      required this.onPressed})
      : super(key: key);
  final Color? backgroundColor;
  final double width;
  final Widget child;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            primary: backgroundColor,
            elevation: 3,
            minimumSize: Size(width, 50),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
            side: const BorderSide(
                width: 2,
                //color: Colors.black,
                style: BorderStyle.solid)),
        child: child);
  }
}
