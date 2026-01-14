import 'package:get/get.dart';
import 'package:measured_size/measured_size.dart';
import 'package:rawatt/constants.dart';
import 'package:rawatt/model/controler.dart';
import 'package:rawatt/model/datafix.dart';
import 'package:rawatt/model/product/mdl_Produk.dart';
import 'package:rawatt/model/product/tags.dart';
import 'package:rawatt/screens/details/component/component.dart';
import 'package:rawatt/screens/details/details_screen.dart';
import 'package:rawatt/size_config.dart';
import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../service/database_service.dart';
import '../../convert/component/dialogku.dart';
import '../../convert/component/inisialisasi_var.dart';
import '../../home/screen_Lanscape/main_content.dart';

class SlidingUpCart extends StatefulWidget {
  const SlidingUpCart({
    super.key,
    // @required this.controller,
    required this.pc2,
    required this.onStateChange,
    required this.cartProductku,

    // this.cartProductsku,
  });

  // final ScrollController controller;
  final PanelController pc2;
  final DataProducts cartProductku;

  // final List<DataProducts> cartProductsku;
  final Function() onStateChange;

  @override
  _SlidingUpCartState createState() => _SlidingUpCartState();
}

class _SlidingUpCartState extends State<SlidingUpCart> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
        color: Colors.white,
      ),
      child: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              padding: EdgeInsets.all(defaultPadding),
              // width: double.infinity,
              decoration: BoxDecoration(
                  color: c.palette_product.value[4],
                  borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
                  // border: Border.all(color: kTextColor.withOpacity(.8), width: .2),
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 10,
                        offset: Offset(-7, 7),
                        color: c.palette_product.value[4].withOpacity(.5))
                  ]),
              child: Center(
                child: Text(
                  'Pesanan',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: sT26,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: defaultPadding,
          ),
          Expanded(
            flex: 9,
            child: WidgetListPesanan(
              onStateChange: () {
                setState(() {
                  widget.onStateChange();
                });
              },
            ),
          ),
        ],
      ),
    );
  }

// Widget dragHandle() {
//   return GestureDetector(
//     child: Container(
//       height: 5,
//       width: 30,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
//         color: Colors.grey.shade400,
//       ),
//     ),
//     onTap: togglePanel,
//   );
// }

// void togglePanel() =>
//     widget.pc2.isPanelOpen ? widget.pc2.close() : widget.pc2.open();
}

class WidgetListPesanan extends StatefulWidget {
  const WidgetListPesanan({
    super.key,
    // @required this.widget,
    required this.onStateChange,
  });

  // final SlidingUpCart widget;
  final Function() onStateChange;

  @override
  _WidgetListPesananState createState() => _WidgetListPesananState();
}

class _WidgetListPesananState extends State<WidgetListPesanan> {
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    int indexs = 0;
    return SizedBox(
      height: (SizeConfig.screenWidth! > 600)
          ? SizeConfig.screenHeight
          : SizeConfig.screenHeight! / 1.8,
      child: (c.isdialogpesan.value == false)
          ? Padding(
              padding: EdgeInsets.all(heightfit(defaultPadding)),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                // mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: heightfit(defaultPadding / 4.5),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                        child: (c.cartsku.length == 0.0)
                            ? CircleAvatar(
                                radius: heightfit(80),
                                backgroundColor: Colors.black45,
                                child: Text(
                                  "kosong",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: sT16),
                                ),
                              )
                            : ListView.builder(
                                padding: EdgeInsets.zero,
                                // controller: widget.widget.controller,
                                physics: BouncingScrollPhysics(),
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: c.cartsku.length,
                                itemBuilder: (_, index) => FittedBox(
                                      child: SizedBox(
                                        height: (SizeConfig.screenWidth! > 600)
                                            ? 90
                                            : 120,
                                        width: (SizeConfig.screenWidth! > 600)
                                            ? 360
                                            : 350,
                                        // color: Colors.amberAccent,
                                        child: Stack(
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  top: defaultPadding,
                                                  right: defaultPadding,
                                                  left: defaultPadding / 2),
                                              child: Container(
                                                height: 90,
                                                width: double.infinity,
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.all(
                                                      Radius.circular(10),
                                                    ),
                                                    // border: Border.all(color: kTextColor.withOpacity(.8), width: .2),
                                                    boxShadow: [
                                                      BoxShadow(
                                                          blurRadius: 10,
                                                          offset: Offset(0, 7),
                                                          color: warnas(c
                                                                  .cartsku[
                                                                      index]
                                                                  .color[0])
                                                              .withOpacity(.5))
                                                    ]),
                                                child: Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Expanded(
                                                      flex: 2,
                                                      child: SizedBox(
                                                        height: 60,
                                                        width: 60,
                                                        child: FittedBox(
                                                          child: Container(
                                                            decoration:
                                                                BoxDecoration(
                                                                    color: warnas(
                                                                        c.cartsku[index].color[
                                                                            0]),
                                                                    borderRadius:
                                                                        BorderRadius.all(
                                                                            Radius.circular(20)),
                                                                    // border: Border.all(color: kTextColor.withOpacity(.8), width: .2),
                                                                    boxShadow: [
                                                                  BoxShadow(
                                                                      blurRadius:
                                                                          10,
                                                                      offset:
                                                                          Offset(
                                                                              -7,
                                                                              7),
                                                                      color: warnas(c
                                                                              .cartsku[index]
                                                                              .color[0])
                                                                          .withOpacity(.2))
                                                                ]),
                                                            child:
                                                                ElevatedButton(
                                                              onPressed: () {},
                                                              style: ElevatedButton
                                                                  .styleFrom(
                                                                      padding:
                                                                          EdgeInsets.all(
                                                                              1),
                                                                      shape:
                                                                          RoundedRectangleBorder(
                                                                        borderRadius:
                                                                            BorderRadius.circular(20),
                                                                      ),
                                                                      elevation:
                                                                          0,
                                                                      backgroundColor: warnas(c
                                                                          .cartsku[
                                                                              index]
                                                                          .color[0])),
                                                              child: Container(
                                                                margin: EdgeInsets
                                                                    .only(
                                                                        top:
                                                                            defaultPadding),
                                                                height: 160.0,
                                                                width: 140,
                                                                child: Stack(
                                                                    alignment:
                                                                        Alignment
                                                                            .bottomCenter,
                                                                    children: [
                                                                      Container(
                                                                        margin: EdgeInsets.only(
                                                                            top:
                                                                                70),
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              Colors.white,
                                                                          borderRadius:
                                                                              BorderRadius.all(Radius.circular(20)),
                                                                        ),
                                                                      ),
                                                                      Column(
                                                                        // crossAxisAlignment: CrossAxisAlignment.end,
                                                                        children: [
                                                                          Expanded(
                                                                            flex:
                                                                                8,
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsets.symmetric(horizontal: defaultPadding / 2),
                                                                              child: Hero(
                                                                                tag: Tags.imageProducts(c.cartsku[index].img),
                                                                                child: Container(
                                                                                  decoration: BoxDecoration(
                                                                                    image: DecorationImage(
                                                                                      image: AssetImage(c.cartsku[index].img),
                                                                                      fit: BoxFit.contain,
                                                                                    ),
                                                                                    borderRadius: BorderRadius.circular(sPrimaryBorderRadius - 5),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ]),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: defaultPadding,
                                                    ),
                                                    Expanded(
                                                      flex: 4,
                                                      child: Container(
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            RichText(
                                                              text: TextSpan(
                                                                  children: [
                                                                    TextSpan(
                                                                      text:
                                                                          "${c.cartsku[index].title}\n",
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              20,
                                                                          color: warnas(c.cartsku[index].color[
                                                                              0]),
                                                                          fontWeight:
                                                                              FontWeight.bold),
                                                                    ),
                                                                    TextSpan(
                                                                      text: c
                                                                          .cartsku[
                                                                              index]
                                                                          .penjelas,
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              14,
                                                                          color:
                                                                              Colors.black87),
                                                                    ),
                                                                  ]),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      flex: 2,
                                                      child: Center(
                                                        child: Container(
                                                            padding: EdgeInsets.all(
                                                                defaultPadding /
                                                                    2),
                                                            decoration: BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            5),
                                                                color: warnas(c
                                                                        .cartsku[
                                                                            index]
                                                                        .color[0])
                                                                    .withOpacity(.2)),
                                                            child: Text(
                                                              "${c.cartsku[index].quantity}x",
                                                              style: TextStyle(
                                                                  color: warnas(c
                                                                      .cartsku[
                                                                          index]
                                                                      .color[1]),
                                                                  fontSize: 14),
                                                            )),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Positioned(
                                              top: 0,
                                              right: 0,
                                              child: SizedBox(
                                                height: 40,
                                                child: FittedBox(
                                                  child: Container(
                                                    height: 40,
                                                    width: 40,
                                                    decoration: BoxDecoration(
                                                        color: warnas(
                                                            c.cartsku[index]
                                                                .color[0]),
                                                        borderRadius:
                                                            BorderRadius.only(
                                                                bottomLeft:
                                                                    Radius
                                                                        .circular(
                                                                            20),
                                                                bottomRight:
                                                                    Radius
                                                                        .circular(
                                                                            20),
                                                                topLeft: Radius
                                                                    .circular(
                                                                        20),
                                                                topRight: Radius
                                                                    .circular(
                                                                        20)),
                                                        // border: Border.all(color: kTextColor.withOpacity(.8), width: .2),
                                                        boxShadow: [
                                                          BoxShadow(
                                                            blurRadius: 10,
                                                            offset:
                                                                Offset(-5, 5),
                                                            color: warnas(c
                                                                    .cartsku[
                                                                        index]
                                                                    .color[0])
                                                                .withOpacity(
                                                                    .2),
                                                          )
                                                        ]),
                                                    child: ElevatedButton(
                                                      onPressed: () {
                                                        indexs = index;

                                                        setState(() {
                                                          widget
                                                              .onStateChange();

                                                          kurang(
                                                              dataProductsObj.indexWhere(
                                                                  (element) => element
                                                                      .nama
                                                                      .contains(c
                                                                          .cartsku[
                                                                              index]
                                                                          .nama)),
                                                              c.cartsku[index]);
                                                        });
                                                      },
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(1),
                                                              shape:
                                                                  RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            20),
                                                              ),
                                                              elevation: 0,
                                                              backgroundColor:
                                                                  warnas(c
                                                                      .cartsku[
                                                                          index]
                                                                      .color[0])),
                                                      child: Center(
                                                          child: Icon(
                                                        Icons
                                                            .delete_outline_outlined,
                                                        // size: 20,
                                                        color: Colors.white,
                                                      )),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ))),
                  ),
                  SizedBox(height: heightfit(defaultPadding)),
                  SizedBox(
                    height: heightfit(55),
                    child: FittedBox(
                      child: SizedBox(
                          width: 200,
                          height: 60,
                          // ignore: deprecated_member_use
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.all(1),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                shadowColor: Colors.green,
                                elevation: 0,
                                backgroundColor: Colors.green),
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.shopping_cart_rounded,
                                    color: Colors.white,
                                  ),
                                  SizedBox(
                                    width: defaultPadding / 2,
                                  ),
                                  FittedBox(
                                    child: Text(
                                      'Pesan',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: sT18,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            onPressed: () {
                              String str = "";
                              for (var i = 0; i < c.cartsku.length; i++) {
                                str +=
                                    "${i + 1}. ${c.cartsku[i].title} Sebanyak ${c.cartsku[i].quantity}\n";
                              }

                              setState(() {});
                              // print("cobalah ${snapshot.data}");

                              whatsapp(
                                  number: "089687308071",
                                  pesanan:
                                      'Hai Assalamualaikum Saya ingin Pesan dengan Rincian pesanan: \n\n$str\n Mohon Untuk Secepatnya Terima Kasih.');
                            },
                          )),
                    ),
                  )
                ],
              ),
            )
          : SizedBox(
              height: SizeConfig.screenHeight,
              width: double.infinity,
              child: Transform.scale(
                scale: 0.98,
                child: CustomDialogBox(
                    title: "Pemesanan",
                    descriptions:
                        "Mohon maaf kami belum bisa melayani, Silahkan menghubungi perusahaan terkait",
                    text: "ok",
                    img: "assets/images/logos.png",
                    chek: () {
                      c.isdialogpesan.value = false;
                    }),
              )),
    );
  }
}

void whatsapp({number, pesanan}) async {
  var whatsappUrl = "https://api.whatsapp.com/send?phone=$number&text=$pesanan";
  await canLaunch(whatsappUrl)
      ? launch(whatsappUrl)
      : print(
          "open whatsapp app link or do a snackbar with notification that there is no whatsapp installed");
  // await canLaunch("whatsapp://send?phone=$number&text=$pesanan");
}
