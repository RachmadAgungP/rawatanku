import 'package:rawatt/constants.dart';
// import 'package:rawatt/screens/home/screen_Portrait/layer2_home.dart';
import 'package:rawatt/size_config.dart';
import 'package:flutter/material.dart';

class ContentLeft extends StatelessWidget {
  const ContentLeft({
    super.key,
    required this.widgets,
  });

  final Widget widgets;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: defaultPadding, top: defaultPadding),
      child: Column(
        children: [
          Flexible(
            fit: FlexFit.tight,
            flex: 1,
            child: Container(
              // height: heightfit(200),
              width: widthfit(160),
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(-9, 0),
                      blurRadius: 10,
                      color: Colors.white.withOpacity(.2),
                    )
                  ],
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    bottomLeft: Radius.circular(0),
                    topRight: Radius.circular(5),
                    bottomRight: Radius.circular(0),
                  )),
              child: FittedBox(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: widthfit(defaultPadding / 2),
                      vertical: heightfit(defaultPadding)),
                  child: Image.asset(
                    "assets/images/logoPG.png",
                    // fit: BoxFit.fitWidth,
                  ),
                ),
              ),
            ),
          ),
          Flexible(
            fit: FlexFit.tight,
            flex: 5,
            child: Padding(
              padding: EdgeInsets.only(bottom: defaultPadding),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(-9, 0),
                        blurRadius: 10,
                        color: Colors.white.withOpacity(.2),
                      )
                    ],
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(0),
                      bottomLeft: Radius.circular(5),
                      topRight: Radius.circular(0),
                      bottomRight: Radius.circular(20),
                    )),
                // width: SizeConfig.screenWidth / 4.5,
                // height: heightfit(470),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: widthfit(defaultPadding / 4),
                  ),
                  child: Container(child: widgets),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
