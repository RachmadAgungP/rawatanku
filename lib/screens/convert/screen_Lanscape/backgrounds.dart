import 'package:rawatt/components/card_field.dart';
import 'package:rawatt/components/tema_Page.dart';
import 'package:rawatt/constants.dart';
import 'package:rawatt/model/controler.dart';
import 'package:rawatt/screens/convert/component/PropertyKalkulator.dart';
import 'package:rawatt/screens/convert/screen_Lanscape/Text_Lorem.dart';
import 'package:rawatt/screens/convert/screen_Potrait/backgrounds.dart';
import 'package:rawatt/screens/details/cart_page/cart_Page.dart';
import 'package:rawatt/screens/home/screen_Lanscape/component.dart';
import 'package:rawatt/screens/home/screen_Lanscape/left_content.dart';
import 'package:rawatt/size_config.dart';
import 'package:flutter/material.dart';

import '../../home/screen_Lanscape/main_content.dart';
import '../component/Widget_pH_indikator.dart';
import '../component/inisialisasi_var.dart';
import '../screens/dolomit/Dolomit_display.dart';

class WideLayoutProduct extends StatelessWidget {
  const WideLayoutProduct({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Center(
      child: BackgraundProduct(
        onStateChange: () {},
        index: 0,
      ),
    );
  }
}

class BackgraundProduct extends StatefulWidget {
  const BackgraundProduct({
    super.key,
    required this.onStateChange,
    required this.index,
    // required this.shopItem,
  });
  final int index;
  // final Product shopItem;
  final Function() onStateChange;

  @override
  _BackgraundProductState createState() => _BackgraundProductState();
}

class _BackgraundProductState extends State<BackgraundProduct> {
  String judul = dataPropertyKalkulator[0].judul;
  Color tema = dataPropertyKalkulator[0].tema;
  List dataWidgets = dataPropertyKalkulator[c.indexConvert.value].widgets;

  @override
  Widget build(BuildContext context) {
    return BackgraundLanscape(
        widgets: Row(
      children: [
        // Flexible(
        //   fit: FlexFit.tight,
        //   flex: 2,
        //   child: ContentLeft(
        //       widgets: MenuConversi(onChangeState: (propertyKalkulator) {
        //     setState(() {
        //       judul = propertyKalkulator.judul;
        //       tema = propertyKalkulator.tema;
        //       inputan = propertyKalkulator.widgets;
        //     });
        //   })),
        // ),
        Flexible(
          fit: FlexFit.tight,
          flex: 6,
          child: Container(
            margin: EdgeInsets.symmetric(
                horizontal: defaultPadding, vertical: defaultPadding),
            decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    offset: Offset(-5, 9),
                    blurRadius: 20,
                    color: Colors.black45.withOpacity(.3),
                  )
                ],
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(5),
                  bottomLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                  bottomRight: Radius.circular(5),
                )),
            child: Row(
              children: [
                Flexible(
                  flex: 8,
                  fit: FlexFit.loose,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              bottom: heightfit(defaultPadding)),
                          child: Stack(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: widthfit(defaultPadding / 2),
                                ),
                                child: Container(
                                  margin: EdgeInsets.only(
                                      top: heightfit(defaultPadding),
                                      bottom: heightfit(defaultPadding / 2)),
                                  height: heightfit(235),
                                  decoration: BoxDecoration(
                                      color: (tema == null)
                                          ? Colors.green.shade500
                                          : tema,
                                      boxShadow: [
                                        BoxShadow(
                                          offset: Offset(0, 3),
                                          blurRadius: 5,
                                          color: Colors.black45.withOpacity(.2),
                                        )
                                      ],
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(15),
                                        bottomLeft: Radius.circular(15),
                                        topRight: Radius.circular(15),
                                        bottomRight: Radius.circular(15),
                                      )),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                    right: widthfit(defaultPadding)),
                                height: heightfit(250),
                                child: LandingHome(
                                  jenisTema: 1,
                                  title: "Kalkulator Pertanian",
                                  judul: judul,
                                  penjelas:
                                      "Rawatan adalah aplikasi yang memudahkan dalam menghitung takaran pupuk yang sesuai dengan anjuran perusahaan",
                                  image: "assets/images/splash_1.png",
                                  tema: tema,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                                flex: 2,
                                child: Column(
                                  children: [
                                    Text(
                                      "DiKetahui : ",
                                      style: TextStyle(
                                          color: kTextColor,
                                          fontSize: heightfit(28),
                                          fontWeight: FontWeight.bold),
                                    ),
                                    dataWidgets[0],
                                  ],
                                )),
                            Expanded(
                              flex: 2,
                              child: Column(
                                children: [
                                  Text(
                                    "DiJawab : ",
                                    style: TextStyle(
                                        color: kTextColor,
                                        fontSize: heightfit(28),
                                        fontWeight: FontWeight.bold),
                                  ),
                                  dataWidgets[1],
                                  // HasilConvertDol(tema: tema),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                    flex: 3,
                    child: Wkonverter(
                      onStateChange: () {},
                    )),
              ],
            ),
          ),
        ),
      ],
    ));
  }
}
