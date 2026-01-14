import 'package:measured_size/measured_size.dart';
import 'package:rawatt/constants.dart';
import 'package:rawatt/model/controler.dart';
import 'package:rawatt/model/datafix.dart';
import 'package:rawatt/model/product/mdl_Produk.dart';
import 'package:rawatt/screens/convert/component/PropertyKalkulator.dart';
import 'package:rawatt/screens/convert/component/component.dart';
import 'package:rawatt/screens/convert/kalkulator.dart';
import 'package:rawatt/screens/convert/screen_Potrait/backgrounds.dart';
import 'package:rawatt/screens/home/screen_Lanscape/component.dart';
import 'package:rawatt/size_config.dart';
import 'package:flutter/material.dart';
import '../../../service/ad_mob_service.dart';
import '../../convert/component/inisialisasi_var.dart';
import '../../details/cart_page/cart_Page.dart';
import '../screen_Portrait/layer2_home.dart';

class MainContent extends StatefulWidget {
  const MainContent({
    super.key,
    required this.shopItems,
    required this.selectedQuotesList,
  });

  final List<DataProducts> shopItems;
  final List selectedQuotesList;

  @override
  State<MainContent> createState() => _MainContentState();
}

Size sizess = Size(0, 0);

class _MainContentState extends State<MainContent> {
  // int indexsubmenus = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: widthfit(defaultPadding / 2),
          vertical: heightfit(defaultPadding * 2)),
      // height: SizeConfig.screenHeight,
      // width: SizeConfig.screenWidth / 1.45,
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
            bottomLeft: Radius.circular(30),
            topRight: Radius.circular(20),
            bottomRight: Radius.circular(5),
          )),
      child: Row(
        children: [
          Expanded(
              flex: 3,
              child: Container(
                alignment: Alignment.topCenter,
                decoration: BoxDecoration(
                    // color: Colors.black12,
                    // border: Border.all(
                    //     color: Colors.green.shade700),
                    borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(5),
                  bottomLeft: Radius.circular(5),
                  topRight: Radius.circular(20),
                  bottomRight: Radius.circular(5),
                )),
                child: Padding(
                  padding: EdgeInsets.all(heightfit(defaultPadding)),
                  child: Column(
                    children: [
                      Flexible(
                        flex: 5,
                        child: Container(
                          padding:
                              EdgeInsets.all(heightfit(defaultPadding / 2)),
                          decoration: BoxDecoration(
                              color: Colors.black12,
                              // border: Border.all(
                              //     color: Colors.green.shade700),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(5),
                                bottomLeft: Radius.circular(25),
                                topRight: Radius.circular(20),
                                bottomRight: Radius.circular(5),
                              )),
                          child: WidgetListPesanan(
                            onStateChange: () {},
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )),
          Expanded(
            flex: 8,
            child: SingleChildScrollView(
              child: SizedBox(
                height: SizeConfig.screenHeight,
                width: SizeConfig.screenWidth,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: SizeConfig.screenHeight! / 4,
                      child: LandingHome(
                        jenisTema: 1,
                        title: "Rawatan",
                        judul: "Bertani Bersama Kami",
                        penjelas:
                            "Rawatan memberikan kemudahan untuk para tani.",
                        image: "assets/images/splash_1.png",
                        tema: Colors.lightBlue,
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: heightfit(defaultPadding),
                        ),
                        child: Container(
                            child: WcalcTanaman(
                          h: SizeConfig.screenHeight! / 2.4,
                          w: SizeConfig.screenWidth!,
                          img: true,
                          onStateChange: (int indexsubmenu) {
                            setState(() {});
                            // indexsubmenus = indexsubmenu;
                            // setState(() {
                            // c.indexsubMenuRawatan.value = submenu;
                            // });
                            // Navigator.pushNamed(context, "/dosisPupukTanamanBuah");
                            // showInterstitalAd(context,"/dosisPupukTanamanBuah");
                          },
                          indexmenu: c.indexMenuRawatan.value,
                          indexsubmenu: c.indexsubMenuRawatan.value,
                        )))
                  ],
                ),
              ),
            ),
          ),
          Expanded(
              flex: 3,
              child: Wkonverter(
                onStateChange: () {
                  setState(() {});
                },
              )),
        ],
      ),
    );
  }
}

class Wkonverter extends StatefulWidget {
  const Wkonverter({
    super.key,
    required this.onStateChange,
  });

  final Function() onStateChange;

  @override
  State<Wkonverter> createState() => _WkonverterState();
}

class _WkonverterState extends State<Wkonverter> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(defaultPadding / 2),
      child: Container(
        alignment: Alignment.topCenter,
        decoration: BoxDecoration(
            // color: Colors.black12,
            // border: Border.all(
            //     color: Colors.green.shade700),
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(5),
          bottomLeft: Radius.circular(5),
          topRight: Radius.circular(20),
          bottomRight: Radius.circular(5),
        )),
        child: Column(
          children: [
            Flexible(
              flex: 5,
              child: Container(
                  padding: EdgeInsets.all(heightfit(defaultPadding / 2)),
                  decoration: BoxDecoration(
                      color: Colors.black12,
                      // border: Border.all(
                      //     color: Colors.green.shade700),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(5),
                        bottomLeft: Radius.circular(25),
                        topRight: Radius.circular(20),
                        bottomRight: Radius.circular(5),
                      )),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: defaultPadding / 2,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        FittedBox(
                            child: RichText(
                          text: TextSpan(
                            text: "Konverter",
                            style: TextStyle(
                                color: Colors.black54,
                                fontSize: heightfit(26),
                                fontWeight: FontWeight.bold),
                            // more: false,
                          ),
                        )),
                        SizedBox(
                          height: defaultPadding / 4.5,
                        ),
                        Expanded(
                          flex: 5,
                          child: Container(
                              // height: heightfit(85),
                              // width: widthfit(150),
                              child: Center(
                            child: ListView.builder(
                                scrollDirection: Axis.vertical,
                                // physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                padding: EdgeInsets.zero,
                                itemCount: 3,
                                itemBuilder: (context, index) => Container(
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: defaultPadding / 2,
                                                vertical: defaultPadding / 5),
                                            child: InkWell(
                                                onTap: () {
                                                  c.indexConvert.value = index;
                                                  print(
                                                      "c.indexConvert.value ${c.indexConvert.value}");
                                                  Navigator.pushAndRemoveUntil(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) {
                                                    return BodyInputanKalkulator(
                                                      widgets: [
                                                        dataPropertyKalkulator[
                                                                index]
                                                            .widgets[0]
                                                      ],
                                                      tema:
                                                          dataPropertyKalkulator[
                                                                  index]
                                                              .tema,
                                                      temaLandingPotrait:
                                                          dataPropertyKalkulator[
                                                                  index]
                                                              .temalendingPotrait,
                                                      judul:
                                                          dataPropertyKalkulator[
                                                                  index]
                                                              .judul,
                                                      imgs: [],
                                                      subjudul: '',
                                                      judulimg: '',
                                                    );
                                                  }),
                                                      (Route<dynamic> route) =>
                                                          true);
                                                },
                                                child: TemaCardButton(
                                                  tema: dataPropertyKalkulator[
                                                          index]
                                                      .tema,
                                                  typetema:
                                                      dataPropertyKalkulator[
                                                              index]
                                                          .typeTema,
                                                  judul: dataPropertyKalkulator[
                                                          index]
                                                      .judul,
                                                  subjudul:
                                                      dataPropertyKalkulator[
                                                              index]
                                                          .subjudul,
                                                  judulimg:
                                                      dataPropertyKalkulator[
                                                              index]
                                                          .judulimg,
                                                  imgs: dataPropertyKalkulator[
                                                          index]
                                                      .imgs,
                                                  indexsubmenu: c
                                                      .indexsubMenuRawatan
                                                      .value,
                                                  indexmenu: 1,
                                                )),
                                          ),
                                        ],
                                      ),
                                    )),
                          )),
                        )
                      ],
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
