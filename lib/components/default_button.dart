import 'package:flutter/material.dart';

import '../constants.dart';
import '../size_config.dart';

// ignore: camel_case_types
class Button_splash extends StatelessWidget {
  const Button_splash({
    super.key,
    required this.press,
    required this.text,
  });

  final Function press;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        // color: kPrimaryColor,
        style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(
          kPrimaryColor,
        )),
        onPressed: press(),
        child: Text(
          text,
          style: TextStyle(fontSize: widthfit(20), color: Colors.white),
        ));
  }
}
