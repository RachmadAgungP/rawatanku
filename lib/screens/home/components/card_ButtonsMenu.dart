import 'package:rawatt/components/card_img.dart';
import 'package:rawatt/constants.dart';
import 'package:rawatt/model/MenuRawatan/mdl_MenuRawatan.dart';
import 'package:rawatt/size_config.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../service/ad_mob_service.dart';
import '../../convert/component/inisialisasi_var.dart';
import '../home_screen.dart';
import 'dart:math' as math;

class CardFitursButtons extends StatelessWidget {
  const CardFitursButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: defaultPadding),
      child: FittedBox(
        child: Container(
          height: 170,
          width: 430,
          // margin: EdgeInsets.all(defaultPadding),
          decoration: BoxDecoration(
              color: warnas(
                  dataKategoriMenuRawatan[c.indexMenuRawatan.value].colorku[0]),
              borderRadius: BorderRadius.circular(sPrimaryBorderRadius),
              boxShadow: [
                BoxShadow(
                  offset: Offset(-6, 7),
                  blurRadius: 25,
                  color: Colors.black45.withOpacity(.2),
                )
              ]),
          child: Stack(
            children: [
              ClipRRect(
                borderRadius:
                    BorderRadius.all(Radius.circular(defaultPadding / 2)),
                child: Center(
                    child: ImgOnline(
                        dataKategoriMenuRawatan[c.indexMenuRawatan.value]
                            .img_banner[0],
                        dataKategoriMenuRawatan[c.indexMenuRawatan.value]
                            .img_banner[0])

                    //
                    // Image.asset(
                    //
                    //   dataKategoriMenuRawatan[c.indexMenuRawatan.value].img_banner[0],
                    //
                    // ),
                    ),
              ),
              Positioned(
                bottom: 0,
                top: 0,
                right: 0,
                // left:-100,

                child: Padding(
                  padding: EdgeInsets.all(defaultPadding / 2),
                  child: FittedBox(child: Container(child: CardButtonsMenu())),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CardButtonsMenu extends StatelessWidget {
  const CardButtonsMenu({
    super.key,
  });

  Widget buildExpanded1(
    double h,
    double w,
    double sizeIcon,
    int sizeflex,
  ) {
    return Flexible(
      flex: sizeflex,
      child: Container(
        height: h,
        width: w,
        decoration: BoxDecoration(
          color: (SizeConfig.screenWidth! > 600) ? Colors.white : Colors.green,
          borderRadius: BorderRadius.circular(sPrimaryBorderRadius - 5),
        ),
        child: Icon(
          Icons.play_arrow,
          color: (SizeConfig.screenWidth! > 600) ? Colors.green : Colors.white,
          size: sizeIcon,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(defaultPadding / 2),
      child: Wrap(
        spacing: defaultPadding / 2,
        runSpacing: defaultPadding * 1.5,
        alignment: WrapAlignment.center,
        children: [
          ButtonMenu(
            iconic: Icons.star,
            textIcon: "Product",
            press: () {
              // showInterstitalAd(context,'product');
              Navigator.pushNamed(context, 'product');
            },
          ),
          // ButtonMenu(
          //     iconic: MdiIcons.snail,
          //     textIcon: "Hama",
          //     press: () {
          //       Navigator.pushNamed(context, 'hama');
          //     }),
          // ButtonMenu(
          //     iconic: MdiIcons.flaskOutline,
          //     textIcon: "Kalc",
          //     press: () {
          //       // showInterstitalAd(context,'dosisPupukTanamanBuah');
          //       Navigator.pushNamed(context, 'dosisPupukTanamanBuah');
          //     }),
          // ButtonMenu(
          //     iconic: MdiIcons.calculatorVariantOutline,
          //     textIcon: "Konversi",
          //     press: () {
          //       // showInterstitalAd(context,'menuConversi');
          //       Navigator.pushNamed(context, 'menuConversi');
          //     }),
          // ButtonMenu(
          //     iconic: Icons.play_arrow,
          //     textIcon: "Youtube",
          //     press: () async {
          //       await openUrl(
          //           "https://m.youtube.com/c/PenyuluhPertanianLapangan",
          //           forceWebView: true,
          //           enableJavaScript: true);
          //     }),
          // ButtonMenu(
          //     iconic: Icons.image_outlined,
          //     textIcon: "Instagram",
          //     press: () {
          //       Navigator.pushNamed(context, 'instagram');
          //     }),
          // // SizedBox(height: defaultPadding,),
          // Container(
          //   height: 105,
          //   width: 390,
          //   alignment: Alignment.centerLeft,
          //   // padding: EdgeInsets.all(defaultPadding / 3),
          //   decoration: BoxDecoration(
          //     border:
          //         Border.all(color: Colors.black45.withOpacity(.3), width: .5),
          //     borderRadius: BorderRadius.circular(sPrimaryBorderRadius - 5),
          //   ),
          //   child: ElevatedButton(
          //     onPressed: () async {
          //       await openUrl(
          //           "https://m.youtube.com/c/PenyuluhPertanianLapangan",
          //           forceWebView: true,
          //           enableJavaScript: true);
          //     },
          //     style: ElevatedButton.styleFrom(
          //         padding: EdgeInsets.all(1),
          //         // fixedSize: Size(100, 100),
          //         shadowColor: Colors.black,
          //         // padding: EdgeInsets.only(top: 60),
          //         shape: RoundedRectangleBorder(
          //           borderRadius: BorderRadius.circular(15),
          //         ),
          //         elevation: 0,
          //         backgroundColor: (SizeConfig.screenWidth > 600)
          //             ? Colors.white
          //             : Colors.white.withOpacity(.5)),
          //     child: Padding(
          //       padding: EdgeInsets.all(defaultPadding / 2),
          //       child: Row(
          //         // mainAxisAlignment: MainAxisAlignment,
          //         children: [
          //           Container(
          //             height: 75,
          //             width: 80,
          //             // padding: EdgeInsets.all(defaultPadding / 3),
          //             decoration: BoxDecoration(
          //               color: Colors.red[800],
          //               // border: Border.all(color: Colors.black54),
          //               borderRadius:
          //                   BorderRadius.circular(sPrimaryBorderRadius - 5),
          //             ),
          //             child: Center(
          //               child: Icon(
          //                 Icons.play_arrow,
          //                 color: (SizeConfig.screenWidth > 600)
          //                     ? Colors.green
          //                     : Colors.white,
          //                 size: 60,
          //               ),
          //
          //               //     Text(
          //               //   "Youtube",
          //               //   style: TextStyle(
          //               //     fontSize: 14,
          //               //     fontWeight: FontWeight.bold,
          //               //     color: Colors.white,
          //               //   ),
          //               // )
          //             ),
          //           ),
          //           SizedBox(
          //             width: defaultPadding * 1.8,
          //             child: Icon(
          //               Icons.star,
          //               size: 20,
          //               color: Colors.black45,
          //             ),
          //           ),
          //           Container(
          //             height: 75,
          //             width: 260,
          //             // padding: EdgeInsets.all(defaultPadding / 3),
          //             decoration: BoxDecoration(
          //               color: Colors.green,
          //               // border: Border.all(color: Colors.black54),
          //               borderRadius:
          //                   BorderRadius.circular(sPrimaryBorderRadius - 5),
          //             ),
          //             child: Padding(
          //               padding: EdgeInsets.all(defaultPadding / 2),
          //               child: Center(
          //                   child: RichText(
          //                       textAlign: TextAlign.start,
          //                       text: TextSpan(children: [
          //                         TextSpan(
          //                             text: "Video Penyuluh Petanian\n",
          //                             style: TextStyle(
          //                                 fontSize: 20,
          //                                 // color: Colors.black87,
          //                                 fontWeight: FontWeight.bold)),
          //                         TextSpan(
          //                             text: "Youtube Peyuluh Petanian Lapangan",
          //                             style: TextStyle(
          //                               fontSize: 15,
          //                               // color: Colors.black87,
          //                             )),
          //                       ]))),
          //             ),
          //           ),
          //         ],
          //       ),
          //     ),
          //   ),
          // )
        ],
      ),
    );
  }
}

class ButtonMenu extends StatelessWidget {
  final IconData iconic;
  final String textIcon;
  final Function press;

  const ButtonMenu({
    super.key,
    required this.iconic,
    required this.textIcon,
    required this.press,
  });

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: SizedBox(
        height: SizeConfig.screenWidth! > 600 ? 80 : 105,
        width: SizeConfig.screenWidth! > 600 ? 290 : 120,
        child: ElevatedButton(
          onPressed: () => press(), // Use () => press() to call the function.
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            elevation: 0,
            backgroundColor: SizeConfig.screenWidth! > 600
                ? Colors.white
                : Colors.white.withOpacity(0),
          ),
          child: Padding(
            padding: EdgeInsets.all(
              SizeConfig.screenWidth! > 600
                  ? defaultPadding / 2
                  : defaultPadding / 2,
            ),
            child: SizeConfig.screenWidth! > 600
                ? Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      buildExpanded1(80, 80, 50, 1),
                      SizedBox(width: defaultPadding),
                      buildExpanded2(36, 2),
                    ],
                  )
                : Column(
                    children: [
                      buildExpanded1(90, 90, 50, 5),
                      SizedBox(height: defaultPadding / 1.5),
                      buildExpanded2(14, 2),
                    ],
                  ),
          ),
        ),
      ),
    );
  }

  Widget buildExpanded2(double fontSize, int sizeFlex) {
    return Flexible(
      flex: sizeFlex,
      child: Text(
        textIcon,
        style: TextStyle(color: Colors.white, fontSize: fontSize),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget buildExpanded1(double h, double w, double sizeIcon, int sizeFlex) {
    return Flexible(
      flex: sizeFlex,
      child: Container(
        height: h,
        width: w,
        decoration: BoxDecoration(
          color: SizeConfig.screenWidth! > 600
              ? Colors.white
              : warnas(dataKategoriMenuRawatan[c.indexMenuRawatan.value]
                      .colorku[1])
                  .withOpacity(.3),
          borderRadius: BorderRadius.circular(sPrimaryBorderRadius - 5),
        ),
        child: Icon(
          iconic,
          color: SizeConfig.screenWidth! > 600
              ? warnas(
                  dataKategoriMenuRawatan[c.indexMenuRawatan.value].colorku[0])
              : Colors.white,
          size: sizeIcon,
        ),
      ),
    );
  }
}

class CardSapa extends StatelessWidget {
  const CardSapa({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Container(
        height: 100,
        width: 450,
        alignment: Alignment.center,
        margin: EdgeInsets.all(defaultPadding / 2),
        padding: EdgeInsets.all(defaultPadding / 2),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(defaultPadding / 2)),
            boxShadow: [
              BoxShadow(
                offset: Offset(-8, 6),
                blurRadius: 20,
                color: Colors.black87.withOpacity(.2),
              )
            ]),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: FittedBox(
                child: Container(
                  margin: EdgeInsets.all(defaultPadding / 2),
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.all(Radius.circular(200))),
                  child: Image.asset(
                    "assets/images/person.png",
                  ),
                ),
              ),
            ),
            SizedBox(
              width: defaultPadding,
            ),
            Expanded(
              flex: 9,
              child: Container(
                child: RichText(
                    textAlign: TextAlign.justify,
                    text: (TextSpan(children: [
                      TextSpan(
                          text: "Hai Sobat Tani!!!\n",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: sT22,
                              color: kPrimaryDarkColor)),
                      TextSpan(
                          text: " \n",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 5,
                              color: kPrimaryDarkColor)),
                      TextSpan(
                          text:
                              "Saya penyuluh tani akan memberikan kemudahan untuk persiapan bertani.",
                          style: TextStyle(
                              fontSize: sT14, color: kPrimaryDarkColor))
                    ]))),
              ),
            )
          ],
        ),
      ),
    );
  }
}
