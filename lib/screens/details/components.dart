import 'package:rawatt/components/card_img.dart';
import 'package:rawatt/constants.dart';
import 'package:rawatt/model/datafix.dart';
import 'package:rawatt/model/product/mdl_Produk.dart';
import 'package:rawatt/size_config.dart';
import 'package:flutter/material.dart';

import '../convert/component/inisialisasi_var.dart';

SizedBox informasi(DataProducts shopItem) {
  return SizedBox(
    child: Container(
      padding: EdgeInsets.only(top: defaultPadding),
      decoration: BoxDecoration(
        color: warnas(shopItem.color[0]),
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10),
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10)),
      ),
      child: Column(
        children: [
          spesifikasi(
              "Spesifikasi", shopItem.informasi["spesifikasi"], shopItem),
          spesifikasi("Sifat", shopItem.informasi["sifat"], shopItem),
          Divider(
            color: warnas(shopItem.color[2]).withOpacity(.2),
          ),
          FittedBox(
            child: Text("Manfaat" " : ",
                style: TextStyle(
                    color: c.palette_product.value[0],
                    fontSize: heightfit(24),
                    fontWeight: FontWeight.bold)),
          ),
          SizedBox(
            height: heightfit(defaultPadding / 2),
          ),
          Scrollbar(
            trackVisibility: true,
            // isAlwaysShown: true,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  for (var i = 0; i < shopItem.informasi["manfaat"].length; i++)
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: heightfit(defaultPadding),
                          horizontal: widthfit(defaultPadding / 2)),
                      child: Container(
                        width: SizeConfig.screenWidth,
                        decoration: BoxDecoration(
                            color: c.palette_product.value[0],
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10),
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10)),
                            // border: Border.all(color: kTextColor.withOpacity(.8), width: .2),
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 5,
                                  offset: Offset(-2, 7),
                                  color:
                                      warnas(shopItem.color[0]).withOpacity(.1))
                            ]),
                        child: Stack(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: widthfit(defaultPadding),
                                  vertical: heightfit(defaultPadding)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(
                                    flex: 1,
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal:
                                              widthfit(defaultPadding / 3),
                                          vertical:
                                              heightfit(defaultPadding / 3)),
                                      decoration: BoxDecoration(
                                          color: warnas(shopItem.color[0])
                                              .withOpacity(.5),
                                          borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(10),
                                              bottomRight: Radius.circular(10),
                                              topLeft: Radius.circular(10),
                                              topRight: Radius.circular(10)),
                                          // border: Border.all(color: kTextColor.withOpacity(.8), width: .2),
                                          boxShadow: [
                                            BoxShadow(
                                                blurRadius: 5,
                                                offset: Offset(-2, 2),
                                                color: warnas(shopItem.color[0])
                                                    .withOpacity(.2))
                                          ]),
                                      child: Center(
                                        child: Text((i + 1).toString(),
                                            style: TextStyle(
                                                color:
                                                    c.palette_product.value[0],
                                                fontSize: heightfit(20))),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: widthfit(defaultPadding),
                                  ),
                                  Flexible(
                                    flex: 8,
                                    child: Container(
                                      alignment: Alignment.centerLeft,
                                      child: RichText(
                                        text: TextSpan(
                                            text: shopItem.informasi["manfaat"]
                                                [i],
                                            style: TextStyle(
                                                color:
                                                    warnas(shopItem.color[0]),
                                                fontSize: 16)),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: Container(
                                height: heightfit(20),
                                width: widthfit(30),
                                decoration: BoxDecoration(
                                  color:
                                      warnas(shopItem.color[0]).withOpacity(.5),
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(0),
                                      bottomRight: Radius.circular(10),
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(0)),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                ],
              ),
            ),
          )
        ],
      ),
    ),
  );
}

Widget spesifikasi(String subtitle, List dataInfo, shopItem) {
  // dataInfo = ;
  return Container(
    // height: heightfit(20),
    // width: widthfit(30),
    decoration: BoxDecoration(
      color: warnas(shopItem.color[0]),
      borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10)),
    ),
    child: Padding(
      padding: EdgeInsets.all(defaultPadding / 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(defaultPadding / 2),
            child: Text("$subtitle: ",
                style: TextStyle(
                    color: c.palette_product.value[0],
                    fontSize: heightfit(24),
                    fontWeight: FontWeight.bold)),
          ),
          SizedBox(
            height: heightfit(defaultPadding / 3),
          ),
          for (var i = 0; i < dataInfo.length; i++)
            Padding(
              padding: EdgeInsets.only(
                  top: heightfit(defaultPadding / 2),
                  left: widthfit(defaultPadding / 2),
                  bottom: heightfit(defaultPadding / 3)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    flex: 1,
                    child: FittedBox(
                      child: RichText(
                        text: TextSpan(
                          text: "${i + 1}. ",
                          style: TextStyle(
                              color: c.palette_product.value[0],
                              fontSize: heightfit(16)),
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 15,
                    child: RichText(
                      text: TextSpan(
                          text: "${dataInfo[i]}",
                          style: TextStyle(
                              color: c.palette_product.value[0],
                              fontSize: heightfit(16))),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    ),
  );
}

SingleChildScrollView brosure(shopItem) {
  return SingleChildScrollView(
    scrollDirection: Axis.vertical,
    child: Column(
      children: [
        FittedBox(
          child: Text(
            "Brosure" " : ",
            style: TextStyle(
                color: warnas(shopItem.color[2]), fontSize: heightfit(24)),
          ),
        ),
        SizedBox(
          height: defaultPadding / 2,
        ),
        Column(
          children: [
            for (var i = 0; i < shopItem.brosure.length; i++)
              InteractiveViewer(
                child: (shopItem.brosure[0] == "")
                    ? Image.asset("assets/images/BGA.jpg")
                    : ImgOnline(shopItem.brosure[i], shopItem.brosure[i]),
              ),
          ],
        )
      ],
    ),
  );
}

Color detect(colorku) {
  return (ThemeData.estimateBrightnessForColor(colorku) == Brightness.light)
      ? Colors.white
      : Colors.white;
}
