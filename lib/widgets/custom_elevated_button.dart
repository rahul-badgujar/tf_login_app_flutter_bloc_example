import 'package:flutter/material.dart';
import 'package:tf_responsive/tf_responsive.dart';

import '../resources/colors.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    Key? key,
    required this.onPressed,
    required this.lable,
  }) : super(key: key);

  final void Function()? onPressed;
  final String lable;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: onPressed == null
          ? const CircularProgressIndicator()
          : Text(
              lable,
            ),
      style: ButtonStyle(
        backgroundColor: onPressed == null
            ? MaterialStateProperty.all<Color>(Colors.white.withOpacity(0.8))
            : MaterialStateProperty.all<Color>(Colors.white),
        foregroundColor:
            MaterialStateProperty.all<Color>(ColorPalette.primaryColor),
        textStyle: MaterialStateProperty.all<TextStyle>(
          TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: tfText(2.5),
          ),
        ),
        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
          EdgeInsets.all(tfImage(1)),
        ),
        fixedSize: MaterialStateProperty.all<Size>(
          Size(
            tfWidth(50),
            tfHeight(7),
          ),
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(9),
          ),
        ),
      ),
      onPressed: onPressed,
    );
  }
}
