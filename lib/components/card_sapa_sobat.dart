import 'package:rawatt/constants.dart';
import 'package:rawatt/size_config.dart';
import 'package:flutter/material.dart';

class CardSapaSobatTani extends StatelessWidget {
  final String penjelas;
  const CardSapaSobatTani({
    super.key,
    required this.penjelas,
  });

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Container(
        height: 100,
        width: SizeConfig.screenWidth,
        padding: EdgeInsets.symmetric(horizontal: defaultPadding),
        // margin: EdgeInsets.only(top: 10),
        child: Stack(
          children: [
            Container(
              // margin: EdgeInsets.only(top: 10),
              padding: EdgeInsets.all(defaultPadding),
              decoration: BoxDecoration(
                  // gradient: kPrimaryGradientColor,
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(sPrimaryBorderRadius),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(-7, 7),
                      blurRadius: 10,
                      color: Colors.black45.withOpacity(.2),
                    )
                  ]),
              child: RichText(
                  // textAlign: TextAlign.justify,
                  text: (TextSpan(children: [
                (TextSpan(
                    text: "Hai Sobat Tani!!!\n",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: sT18,
                        color: kTextColor))),
                TextSpan(
                    text: " \n",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: sT8,
                        color: kTextColor)),
                TextSpan(
                    text: penjelas,
                    style: TextStyle(fontSize: sT16, color: kTextColor1))
              ]))),
            ),
            // Container(
            //   alignment: Alignment.centerRight,
            //   margin: EdgeInsets.only(bottom: 20),
            //   width: double.infinity + 50,
            //   height: 120,
            //   // child: Image.asset("assets/images/pest-01.png")
            // ),
          ],
        ),
      ),
    );
  }
}
