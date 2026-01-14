import 'package:rawatt/components/BG.dart';
import 'package:rawatt/constants.dart';
import 'package:rawatt/model/datafix.dart';
import 'package:rawatt/model/product/mdl_Produk.dart';
import 'package:rawatt/screens/convert/component/inisialisasi_var.dart';
import 'package:rawatt/screens/home/screen_Portrait/layer2_home.dart';
import 'package:rawatt/size_config.dart';
import 'package:flutter/material.dart';

class PanelWidgetSlidingUp extends StatelessWidget {
  const PanelWidgetSlidingUp({
    super.key,
    required this.selectedCategoryList,
    required this.selectedItem,
    required this.controller,
  });

  final ScrollController controller;
  final List selectedCategoryList;
  final int selectedItem;

  @override
  Widget build(BuildContext context) {
    List<DataProducts> shopItems = filterdataByPerusahaan(0);
    return SingleChildScrollView(
      controller: controller,
      child: Stack(
        children: [
          BackgroundShop(
            bolimages: true,
            images: "assets/images/BGA.jpg",
            flex1: 100,
            flex2: 120,
            warnaBG2: Colors.white,
            topRights: 20,
            topLefts: 20,
            bottomRights: 20,
            bottomLefts: 20,
            key: null,
            warnaBG1: Colors.green,
          ),
          Padding(
            padding: EdgeInsets.all(defaultPadding),
            child: Column(
              children: [
                SizedBox(
                  height: 100,
                ),
                Container(
                  alignment: Alignment.topLeft,
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                            text: selectedCategoryList[selectedItem]['title'] +
                                "\n",
                            style: TextStyle(
                                color: kTextColor,
                                fontWeight: FontWeight.bold,
                                fontSize: sT26)),
                        TextSpan(
                            text: selectedCategoryList[selectedItem]
                                ['penjelas'],
                            style: TextStyle(color: kTextColor1))
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                RichText(
                  textAlign: TextAlign.justify,
                  text: TextSpan(
                    children: [
                      TextSpan(
                          text: "\t" +
                              selectedCategoryList[selectedItem]['details'],
                          style: TextStyle(color: kTextColor, fontSize: sT16)),
                    ],
                  ),
                ),
                SizedBox(
                  height: defaultPadding,
                ),
                FittedBox(
                  child: SizedBox(
                    // height: 240,
                    width: SizeConfig.screenWidth,
                    child: Slider1(
                      shopItem: filterdataByPerusahaan(0),
                      titles: "Rekomendasi Produk ",
                      scrollDirectionss: Axis.horizontal,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(children: [
                      TextSpan(
                          text: "Asset Property From Freepik.com",
                          style: TextStyle(color: kTextColor, fontSize: sT12))
                    ])),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
