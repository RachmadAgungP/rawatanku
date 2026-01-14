import 'package:flutter/material.dart';

import '../constants.dart';
import '../size_config.dart';

class CardMenyapa extends StatelessWidget {
  const CardMenyapa({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      width: double.infinity,
      // height: getProportionateScreenHeight(50),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(sPrimaryBorderRadius),
          boxShadow: [
            BoxShadow(
              offset: Offset(-3, 4),
              blurRadius: 5,
              color: Colors.black45.withOpacity(.3),
            )
          ]),
      child: Profile(
        key: null,
        colorBg: Colors.green,
      ),
    );
  }
}

class Profile extends StatelessWidget {
  final Color colorBg;
  const Profile({
    super.key,
    required this.colorBg,
  });

  @override
  Widget build(BuildContext context) {
    double sizers = 1 + SizeConfig.screenWidth!;
    print(sizers);
    return SizedBox(
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Container(
              height: 70,
              width: 70,
              decoration: BoxDecoration(
                color: colorBg,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Image.asset("assets/images/person.png"),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            flex: 4,
            // margin: EdgeInsets.only(left: 15, top: 7, bottom: 5),
            // color: Colors.amberAccent,
            child: RichText(
                maxLines: 5,
                text: TextSpan(children: [
                  TextSpan(
                    text: "Hei Sobat Tani!\n",
                    style: TextStyle(color: kTextColor),
                  ),
                  TextSpan(text: " \n", style: TextStyle(fontSize: (3))),
                  TextSpan(
                    text:
                        "Perkenalkan saya penyuluh tani yang akan membantu Kalian semua untuk memberikan informasi yang bermanfaat untuk Sobat tani.",
                    style: TextStyle(fontSize: (9), color: kTextColor1),
                  ),
                ])),
          ),
        ],
      ),
    );
  }
}
