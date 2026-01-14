import 'package:rawatt/components/matahari.dart';
import 'package:flutter/material.dart';

import '../../../../constants.dart';
import '../../../../size_config.dart';

class HomeHeader extends StatelessWidget {
  final String titleSapa;
  const HomeHeader({
    super.key,
    required this.titleSapa,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: SizeConfig.screenHeight! * 0.24,
          decoration: BoxDecoration(
              gradient: kPrimaryGradientColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(sBgBorderRadius),
                bottomRight: Radius.circular(sBgBorderRadius),
              )),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                  width: double.infinity,
                  height: SizeConfig.screenHeight! * 0.07),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: RichText(
                    text: TextSpan(
                        style: TextStyle(
                            fontSize: sT22, color: kPrimaryLightColor),
                        children: [
                      TextSpan(text: titleSapa),
                    ])),
              ),
            ],
          ),
        ),
        Matahari(),
      ],
    );
  }
}
