import 'package:rawatt/constants.dart';
import 'package:rawatt/model/MenuRawatan/mdl_MenuRawatan.dart';
import 'package:rawatt/size_config.dart';
import 'package:flutter/material.dart';

import '../screens/convert/component/inisialisasi_var.dart';

class BackgroundShop extends StatelessWidget {
  final bool bolimages;
  final String images;
  final double flex1;
  final double flex2;
  final Color warnaBG1;
  final Color warnaBG2;
  final double topLefts;
  final double topRights;
  final double bottomLefts;
  final double bottomRights;

  const BackgroundShop({
    super.key,
    required this.flex1,
    required this.flex2,
    required this.warnaBG1,
    required this.warnaBG2,
    required this.topLefts,
    required this.topRights,
    required this.bottomLefts,
    required this.bottomRights,
    required this.images,
    required this.bolimages,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeConfig.screenHeight,
      width: double.infinity,
      child: Stack(
        children: [
          Column(
            // mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                height: (SizeConfig.orientation == Orientation.landscape)
                    ? heightfit(flex2 - 40)
                    : heightfit(flex2),
                width: double.infinity,
                child: Stack(
                  children: [
                    Container(
                      // alignment: Alignment.topCenter,
                      decoration: (bolimages == false)
                          ? (warnaBG1 == Colors.white)
                              ? BoxDecoration(
                                  color: warnas(dataKategoriMenuRawatan[
                                          c.indexMenuRawatan.value]
                                      .colorku[0]),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(bottomLefts),
                                    topRight: Radius.circular(bottomRights),
                                  ))
                              : BoxDecoration(color: warnaBG1)
                          : BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(images), fit: BoxFit.cover),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(bottomLefts),
                                topRight: Radius.circular(bottomRights),
                              )),
                      // height: SizeConfig.screenHeight,
                      // width: double.infinity,
                    ),
                    Positioned(
                      right: 0,
                      bottom: 0,
                      child: Container(
                          height: heightfit(140),
                          width: heightfit(100),
                          // alignment: Alignment.topCenter,
                          decoration: BoxDecoration(
                              color: Colors.white.withOpacity(.4),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(100),
                                topRight: Radius.circular(bottomRights),
                              ))),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: (SizeConfig.orientation == Orientation.landscape)
                    ? heightfit(flex1 - 20)
                    : heightfit(flex1),
                width: double.infinity,
                child: Container(),
              ),
            ],
          ),
          // Container(
          //   child: Stack(
          //     children: [
          //       for (int i = 0; i < 3; i++)
          //         Column(
          //           // mainAxisAlignment: MainAxisAlignment.end,
          //           children: [
          //             Expanded(
          //               flex: flex1,
          //               child: Container(),
          //             ),
          //             Expanded(
          //               flex: flex2 + i * 3,
          //               child: Container(
          //                 decoration: BoxDecoration(
          //                     color: warnaBG2.withOpacity(.4 - (i / 10)),
          //                     // color: warna1,
          //                     // gradient: kGradientColor,
          //                     borderRadius: BorderRadius.only(
          //                       topLeft: Radius.circular(topLefts),
          //                       topRight: Radius.circular(topRights),
          //                     )),
          //               ),
          //             ),
          //           ],
          //         ),
          //     ],
          //   ),
          // ),
          Column(
            // mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                height: (SizeConfig.orientation == Orientation.landscape)
                    ? heightfit(flex1 - 20)
                    : heightfit(flex1),
                width: double.infinity,
                child: Container(),
              ),
              SizedBox(
                height: (SizeConfig.orientation == Orientation.landscape)
                    ? heightfit(flex2 - 40)
                    : heightfit(flex2),
                width: double.infinity,
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: warnaBG2,

                          // color: warna1,
                          // gradient: kGradientColor,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(topLefts),
                            topRight: Radius.circular(topRights),
                          )),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
