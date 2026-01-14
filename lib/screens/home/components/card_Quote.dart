import 'package:rawatt/constants.dart';
import 'package:rawatt/size_config.dart';
import 'package:flutter/material.dart';

class CardQuotes extends StatelessWidget {
  const CardQuotes({
    super.key,
    required this.title,
    required this.kutipan,
    required this.images,
  });

  final String title;
  final String kutipan;
  final String images;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: SizedBox(
        height: 150,
        width: 350,
        // margin: EdgeInsets.symmetric(
        //   horizontal: defaultPadding,
        // ),
        child: Stack(
          children: [
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.all(defaultPadding),
              decoration: BoxDecoration(
                  // gradient: kPrimaryGradientColor,
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(sPrimaryBorderRadius),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(-7, 9),
                      blurRadius: 10,
                      color: Colors.black45.withOpacity(.2),
                    )
                  ]),
              child: Padding(
                padding: EdgeInsets.only(
                  top: defaultPadding,
                  bottom: defaultPadding,
                  left: defaultPadding,
                  right: 120,
                  // top: defaultPadding / 2,
                ),
                child: RichText(
                    maxLines: 5,
                    overflow: TextOverflow.ellipsis,
                    text: TextSpan(children: [
                      TextSpan(
                          text: title,
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: kTextColor)),
                      TextSpan(
                          text: " \n",
                          style: TextStyle(
                            fontSize: 2,
                          )),
                      TextSpan(
                          text: kutipan,
                          style: TextStyle(fontSize: 12, color: kTextColor1))
                    ])),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Image.asset(
                images,
                fit: BoxFit.fitHeight,
                height: 150,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
