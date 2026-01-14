import 'package:flutter/material.dart';

import '../../../../constants.dart';
import '../../../../size_config.dart';

class MenuButton extends StatelessWidget {
  final IconData iconic;
  final String textIcon;
  final Function press;
  const MenuButton({
    super.key,
    required this.iconic,
    required this.textIcon,
    required this.press,
  });

  @override
  Widget build(BuildContext context) {
    double widthOjb = 50;
    double heightOjb = 50;
    return Container(
      alignment: Alignment.center,
      width: widthOjb,
      height: heightOjb,
      // color: Colors.black,
      child: Center(
        child: Container(
          width: widthOjb - 10,
          height: heightOjb - 10,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(sPrimaryBorderRadius),
              boxShadow: [
                BoxShadow(
                  offset: Offset(-2, 3),
                  blurRadius: 4,
                  color: Colors.black45.withOpacity(.3),
                )
              ]),
          child: InkWell(
            onTap: press(),
            child: Container(
              padding: EdgeInsets.all(5),
              child: Column(
                children: [
                  Icon(iconic, color: Colors.green, size: widthfit(31)),
                  Text(
                    textIcon,
                    style: TextStyle(color: Colors.green, fontSize: sT12),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
