import 'package:rawatt/components/card_img.dart';
import 'package:rawatt/components/matahari.dart';
import 'package:rawatt/constants.dart';
import 'package:rawatt/model/MenuRawatan/mdl_MenuRawatan.dart';
import 'package:rawatt/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../convert/component/inisialisasi_var.dart';

class BackgraundHome extends StatefulWidget {
  const BackgraundHome({
    super.key,
  });

  @override
  State<BackgraundHome> createState() => _BackgraundHomeState();
}

class _BackgraundHomeState extends State<BackgraundHome> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Container(
        child: Stack(children: [
          Container(
            height: heightfit(250),
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: defaultPadding),
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
                // color: warnas(dataKategoriMenuRawatan[c.indexMenuRawatan.value].colorku[0]),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  transform: GradientRotation(17),
                  colors: <Color>[
                    warnas(dataKategoriMenuRawatan[c.indexMenuRawatan.value]
                        .colorku[2]),
                    warnas(dataKategoriMenuRawatan[c.indexMenuRawatan.value]
                        .colorku[2]),
                    warnas(dataKategoriMenuRawatan[c.indexMenuRawatan.value]
                        .colorku[0]),
                  ], // Gradient from https://learnui.design/tools/gradient-generator.html
                  tileMode: TileMode.mirror,
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(sBgBorderRadius),
                  bottomRight: Radius.circular(sBgBorderRadius),
                )),
          ),
          Positioned(
            right: 0,
            bottom: 90,
            child: Container(
                height: heightfit(100),
                width: widthfit(110),
                // alignment: Alignment.topCenter,
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(.4),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(100),
                      topRight: Radius.circular(0),
                    ))),
          ),
          Padding(
            padding:
                EdgeInsets.only(top: defaultPadding, right: defaultPadding),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: heightfit(100),
                  width: widthfit(160),
                  child: FittedBox(
                      child: ImgOnline(
                          dataKategoriMenuRawatan[c.indexMenuRawatan.value].img,
                          dataKategoriMenuRawatan[c.indexMenuRawatan.value].img)
                      // Container(
                      //   height: 20,
                      //   width: 50,
                      //   padding: EdgeInsets.all(defaultPadding),
                      //   decoration: BoxDecoration(
                      //       image: DecorationImage(
                      //
                      //           // image: NetworkImage("assets/images/sawah1.jpg")
                      //           image: AssetImage(dataKategoriMenuRawatan[c.indexMenuRawatan.value].img)),
                      //       borderRadius: BorderRadius.circular(5)),
                      // ),
                      ),
                ),
                // Container(
                //   child: Matahari(),
                // ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: defaultPadding / 2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  padding:
                      EdgeInsets.only(top: heightfit(40), right: heightfit(18)),
                  child: Matahari(),
                ),
              ],
            ),
          ),
        ]),
      );
    });
  }
}
