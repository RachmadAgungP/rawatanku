import 'package:flutter/material.dart';
import 'package:rawatt/components/card_img.dart';
import 'package:rawatt/model/MenuRawatan/mdl_MenuRawatan.dart';

import '../../../constants.dart';
import '../../../size_config.dart';
import '../../convert/component/inisialisasi_var.dart';

class SplashContent extends StatelessWidget {
  const SplashContent({
    required Key key,
    required this.text,
    required this.image,
  }) : super(key: key);
  final String text, image;

  @override
  Widget build(BuildContext context) {
    return (SizeConfig.orientation == Orientation.portrait)
        ? Column(
            children: [
              Expanded(
                  flex: 3,
                  child: Padding(
                    padding: EdgeInsets.all(defaultPadding),
                    child: buildTextSplash(),
                  )),
              Expanded(
                  flex: 5,
                  child: FittedBox(
                      child: SizedBox(
                          height: 180,
                          width: 150,
                          child: ImgOnline(image, image))))
            ],
          )
        : Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                flex: 1,
                child: buildTextSplash(),
              ),
              SizedBox(
                width: defaultPadding / 2,
              ),
              // Spacer(),?
              Flexible(
                flex: 1,
                child: Image.asset(
                  image,
                ),
              ),
              // Spacer(),
            ],
          );
  }

  Column buildTextSplash() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          child: Text(
            "Rawatan",
            style: TextStyle(
              fontSize: heightfit(sT26 + 8),
              color: c.palette.value[0],
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          height: defaultPadding / 3,
        ),
        Container(
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: heightfit(sT12 + 4),
              color: c.palette.value[0],
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
