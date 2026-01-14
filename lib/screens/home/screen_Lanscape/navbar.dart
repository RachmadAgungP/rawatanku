import 'package:rawatt/constants.dart';
import 'package:rawatt/screens/home/components/card_ButtonsMenu.dart';
import 'package:rawatt/screens/home/screen_Lanscape/component.dart';
import 'package:rawatt/size_config.dart';
import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  const NavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Flexible(
          flex: 9,
          // fit: FlexFit.loose,
          child: Container(
            // alignment: Alignment.centerRight,
            height: heightfit(80),
            decoration: BoxDecoration(
                // color: Colors.white,
                // boxShadow: [
                //   BoxShadow(
                //     offset: Offset(-9, 0),
                //     blurRadius: 10,
                //     color: Colors.white.withOpacity(.2),
                //   )
                // ],
                borderRadius: BorderRadius.only(
              topLeft: Radius.circular(5),
              bottomLeft: Radius.circular(5),
              topRight: Radius.circular(5),
              bottomRight: Radius.circular(5),
            )),
            child: FittedBox(
              child: SizedBox(
                  height: 80,
                  // width: 1100,
                  // margin: const EdgeInsets.only(top: 8.0),
                  child: CardButtonsMenu()),
            ),
          ),
        ),
        SizedBox(
          width: defaultPadding,
        ),
        Flexible(
          flex: 2,
          // fit: FlexFit.loose,
          child: Container(
              height: heightfit(70),
              margin: EdgeInsets.only(right: widthfit(defaultPadding)),
              // alignment: Alignment.centerRight,
              child: AccountUser()),
        ),
      ],
    );
  }
}
