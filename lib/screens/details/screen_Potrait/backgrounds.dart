import 'package:before_after_image_slider_nullsafty/before_after_image_slider_nullsafty.dart';
import 'package:rawatt/components/card_judulPetro.dart';
import 'package:rawatt/components/pupuk_rating.dart';
import 'package:rawatt/components/tabCostume.dart';
import 'package:rawatt/components/tema_Page.dart';
import 'package:rawatt/constants.dart';
import 'package:rawatt/model/MenuRawatan/mdl_MenuRawatan.dart';
import 'package:rawatt/model/controler.dart';
import 'package:rawatt/model/data_.dart';
import 'package:rawatt/model/datafix.dart';
import 'package:rawatt/model/product/mdl_Produk.dart';
import 'package:rawatt/screens/details/cart_page/cart_Page.dart';
import 'package:rawatt/screens/details/cart_page/cart_header.dart';
import 'package:rawatt/screens/details/component/component.dart';
import 'package:rawatt/screens/details/components.dart';
import 'package:rawatt/size_config.dart';
import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../../../components/card_img.dart';
import '../../../components/card_product.dart';
import '../../convert/component/dialogku.dart';
import '../../convert/component/inisialisasi_var.dart';
import '../../home/home_screen.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({
    super.key,
  });

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  int selectedItem = 0;
  final PanelController _pc1 = PanelController();

  PageController? _pageController;
  int qN = 0;

  void _changePage() {
    setState(() {
      // selectedItem = selectedItem;
      _pageController!.animateToPage(
        selectedItem,
        duration: Duration(milliseconds: 1000),
        curve: Curves.fastLinearToSlowEaseIn,
      );
    });
  }

  @override
  void initState() {
    _pageController = PageController();

    super.initState();
  }

  @override
  void dispose() {
    _pageController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final PanelController pc1 = PanelController();
    // print("warnas ${c.palette_product.value}");
    return SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: SlidingUpPanel(
          parallaxEnabled: true,
          parallaxOffset: .5,
          minHeight: heightfit(85),
          maxHeight: heightfit(550),
          body: BackgraundPotrait(
              judul: c.produkku.value.title,
              penjelas: c.produkku.value.penjelas,
              tema: warnas(c.produkku.value.color[1]),
              widgets: bodyDetail(
                  pc1,
                  c.produkku.value,
                  context,
                  warnas(c.produkku.value.color[0]),
                  warnas(c.produkku.value.color[1]))),
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(25.0),
          ),
          controller: pc1,
          backdropEnabled: true,
          panel: SlidingUpCart(
            // controller: controller,
            pc2: pc1,
            cartProductku: c.produkku.value,
            // cartProductsku: cartProducts,
            onStateChange: () {
              setState(() {});
            },
          ),
          // },
          collapsed: Container(
            decoration: BoxDecoration(
              color: warnas(c.produkku.value.color[0]),
              borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
            ),
            child: CartHeaderWidget(
              shopItem: c.produkku.value,
              pc2: pc1,
              onChange: () {
                setState(() {});
              },
            ),
          ),
        )
        // ),
        );
  }

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Tidak dapat membuka URL: $url';
    }
  }

  Widget bodyDetail(PanelController pc1, DataProducts shopItem,
      BuildContext context, tema5, tema2) {
    // print("lalalala" + c.produkku.value.bundle["Paket bundle"]);
    return Stack(
      children: [
        Positioned(
          top: 100,
          right: -120,
          // bottom: 0,
          // left: 0,
          child: FittedBox(
            child: Image.asset(
              "assets/images/MenuRawatan/logoRBack.png",
              height: SizeConfig.screenHeight! / 2,
              width: SizeConfig.screenWidth!,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: widthfit(defaultPadding)),
          child: Column(children: [
            Padding(
              padding: EdgeInsets.only(top: heightfit(defaultPadding * 2)),
              child: CardListProduct(),
            ),

            Padding(
              padding: EdgeInsets.only(top: defaultPadding / 2),
              child: SizedBox(
                height: heightfit(280),
                width: widthfit(SizeConfig.screenWidth!),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 4,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          //
                          Expanded(
                            flex: 3,
                            child: FittedBox(
                              child: Container(
                                height: 35,
                                padding: EdgeInsets.all(defaultPadding / 3),
                                decoration: BoxDecoration(
                                    color: tema5,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
                                    boxShadow: [
                                      BoxShadow(
                                          blurRadius: 5,
                                          offset: Offset(-3, 2),
                                          color: tema5)
                                    ]),
                                child: Text(
                                  c.produkku.value.title,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                              ),
                            ),
                          ),

                          // Expanded(
                          //   flex: 3,
                          //   child: FittedBox(
                          //     child: Container(
                          //       margin: EdgeInsets.only(
                          //           top: defaultPadding / 2,
                          //           bottom: defaultPadding / 2),
                          //       alignment: Alignment.centerLeft,
                          //       child: RichText(
                          //           text: TextSpan(children: [
                          //         TextSpan(
                          //             text: "Berkualitas",
                          //             style: TextStyle(
                          //               fontSize: 14,
                          //               color:
                          //                   warnas(c.produkku.value.color[2]),
                          //             )),
                          //       ])),
                          //     ),
                          //   ),
                          // ),
                          // Flexible(
                          //   fit: FlexFit.loose,
                          //   flex: 3,
                          //   child: Padding(
                          //     padding: EdgeInsets.symmetric(
                          //         vertical: defaultPadding / 2),
                          //     child: Container(
                          //       width: widthfit(70),
                          //       child: FittedBox(
                          //         child: PupukRating(
                          //           score: 4.8,
                          //           tema: Colors.black,
                          //         ),
                          //       ),
                          //     ),
                          //   ),
                          // ),
                          Expanded(
                            flex: 10,
                            child: Container(
                              padding: EdgeInsets.only(top: defaultPadding),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: Icon(Icons.clean_hands,
                                            color: tema5, size: heightfit(30)),
                                      ),
                                      Expanded(
                                        flex: 3,
                                        child: Text(
                                            'Cuci Tangan Setelah Penggunaan',
                                            style: TextStyle(
                                              fontSize: 10,
                                              fontWeight: FontWeight.bold,
                                              color: tema5,
                                            )),
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: Icon(
                                            Icons.exposure_plus_2_rounded,
                                            color: tema5,
                                            size: heightfit(30)),
                                      ),
                                      Expanded(
                                        flex: 3,
                                        child: Text(
                                            'Gunakan 2X jika hasilnya kurang',
                                            style: TextStyle(
                                              fontSize: 10,
                                              fontWeight: FontWeight.bold,
                                              color: tema5,
                                            )),
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: Icon(Icons.fire_hydrant,
                                            color: tema5, size: heightfit(30)),
                                      ),
                                      Expanded(
                                        flex: 3,
                                        child: Text(
                                            'sesuaikan dengan cara penggunaan',
                                            style: TextStyle(
                                              fontSize: 10,
                                              fontWeight: FontWeight.bold,
                                              color: tema5,
                                            )),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: heightfit(defaultPadding / 3),
                          ),
                          Expanded(
                            flex: 4,
                            child: Padding(
                              padding: EdgeInsets.only(
                                  right: widthfit(defaultPadding / 2)),
                              child: Stack(
                                children: [
                                  Container(
                                    height: heightfit(60),
                                    width: widthfit(100),
                                    margin: EdgeInsets.only(
                                        right: widthfit(defaultPadding),
                                        top: heightfit(defaultPadding)),
                                    child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          tambah(c.produkku.value.id,
                                              c.produkku.value);
                                          setPreference();
                                          if (c.produkku.value.linkSp != "") {
                                            // _launchURL(c.produkku.value.linkSp);
                                          }

                                          // print("c.cartsku ${c.cartsku}");
                                        });
                                      },
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal:
                                                widthfit(defaultPadding / 2),
                                            vertical:
                                                heightfit(defaultPadding / 2)),
                                        decoration: BoxDecoration(
                                            boxShadow: [
                                              BoxShadow(
                                                  blurRadius: 6.0,
                                                  offset: Offset(-3, 3),
                                                  color: Colors.deepOrange),
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: Colors.deepOrange),
                                        child: (c.produkku.value.linkSp == "")
                                            ? Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Expanded(
                                                    flex: 2,
                                                    child: FittedBox(
                                                      child: Icon(
                                                        Icons
                                                            .production_quantity_limits_sharp,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 1,
                                                    child: SizedBox(
                                                        width: widthfit(
                                                            defaultPadding /
                                                                3)),
                                                  ),
                                                  Expanded(
                                                    flex: 5,
                                                    child: FittedBox(
                                                      child: Text(
                                                        "Ok",
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 12),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              )
                                            : Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Expanded(
                                                    flex: 2,
                                                    child: FittedBox(
                                                      child: Icon(
                                                        Icons
                                                            .shopping_cart_outlined,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 1,
                                                    child: SizedBox(
                                                        width: widthfit(
                                                            defaultPadding /
                                                                3)),
                                                  ),
                                                  Expanded(
                                                    flex: 5,
                                                    child: FittedBox(
                                                      child: Text(
                                                        "BELI",
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 12),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                      ),
                                    ),
                                  ),
                                  // Positioned(
                                  //   top: 0,
                                  //   right: 0,
                                  //   child: FittedBox(
                                  //     child: Container(
                                  //       height: heightfit(30),
                                  //       width: widthfit(30),
                                  //       decoration: BoxDecoration(
                                  //           boxShadow: [
                                  //             BoxShadow(
                                  //                 blurRadius: 7.0,
                                  //                 offset: Offset(-5, 5),
                                  //                 color: Colors.black45
                                  //                     .withOpacity(.5)),
                                  //           ],
                                  //           borderRadius: BorderRadius.circular(5),
                                  //           color: tema5
                                  //               .withBlue(100)),
                                  //       child: Center(
                                  //         child: Text(
                                  //           "${dataProductsObj[c.produkku.value.id].quantity}",
                                  //
                                  //           style:
                                  //               TextStyle(fontSize: heightfit(12)),
                                  //         ),
                                  //       ),
                                  //     ),
                                  //   ),
                                  // ),
                                ],
                              ),
                            ),
                          ),

                          Expanded(
                            flex: 2,
                            child: Padding(
                              padding: EdgeInsets.only(
                                  top: heightfit(defaultPadding / 2)),
                              child: FittedBox(
                                child: Text(
                                  "Pelanggan Prioritas Kami",
                                  style: TextStyle(
                                      fontSize: heightfit(12),
                                      color: Colors.black),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      width: defaultPadding,
                    ),
                    Expanded(
                      flex: 4,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        // mainAxisAlignment:
                        //     MainAxisAlignment.center,
                        children: [
                          Expanded(
                            flex: 6,
                            child: Stack(
                              children: [
                                Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: ImgOnline(c.produkku.value.img,
                                        c.produkku.value.img),
                                    // Image.asset(c.produkku.value.img)),
                                  ),
                                ),
                                Positioned(
                                  bottom: 10,
                                  right: 0,
                                  child: Image.asset(
                                    "assets/images/maskot/char_itutu.png",
                                    height: 130,
                                    width: 90,
                                  ),
                                )
                              ],
                            ),
                          ),
                          Expanded(
                              flex: 1,
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  SizedBox(
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: CounterProduct(
                                          index: c.produkku.value.id,
                                          product: c.produkku.value,
                                          type: true,
                                          changeTotal: () {
                                            setState(() {});
                                          }),
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                            blurRadius: 6.0,
                                            offset: Offset(-5, 5),
                                            color: tema5),
                                      ],
                                      borderRadius: BorderRadius.circular(10),
                                      color: tema5,
                                    ),
                                    child: Center(
                                        child: Padding(
                                      padding:
                                          EdgeInsets.all(defaultPadding / 2),
                                      child: Text(
                                        "Beli hanya di Shopee",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14),
                                      ),
                                    )),
                                  )
                                ],
                              )),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: defaultPadding,
            ),
            (c.produkku.value.bundle["Paket bundle"].toString() == "[]")
                ? Container()
                : Container(
                    height: SizeConfig.screenHeight! / 7,
                    width: SizeConfig.screenWidth,
                    decoration: BoxDecoration(
                        color: tema5,
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 5,
                              offset: Offset(-3, 2),
                              color: tema5)
                        ]),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Container(
                            height: 200,
                            alignment: Alignment.center,
                            margin: EdgeInsets.only(right: defaultPadding / 2),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              // color: tema2,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Dapatkan paket pemebelian : ",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 5,
                          child: ListView.builder(
                            padding: EdgeInsets.zero,
                            scrollDirection: Axis.horizontal,
                            itemCount:
                                c.produkku.value.bundle["Paket bundle"].length,
                            itemBuilder: (context, index) =>

                                // for (var i = 0; i < c.produkku.value.bundle["Paket bundle"].length; i++)
                                // (c.produkku.value.bundle["Paket bundle"].length <= 1)?
                                //     Container():
                                Padding(
                              padding: EdgeInsets.all(defaultPadding / 2),
                              child: FittedBox(
                                child: ProductListCard(
                                  index: c.produkku.value.bundle["Paket bundle"]
                                      [index],
                                  data: dataProductsObj
                                      .where((element) =>
                                          element.id ==
                                          c.produkku.value
                                              .bundle["Paket bundle"][index])
                                      .toList()[0],
                                  press: () {
                                    // for (var i = 0; i < c.produkku.value.bundle["Paket bundle"].length; i++){

                                    // }
                                    // dataProductsObj.where((element) => element.id == c.produkku.value.bundle["Paket bundle"][index]).toList()[0];
                                    // c.produkku.value = data;
                                  },
                                  key: Key("s"),
                                  todetail: true,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )),
            SizedBox(
              height: defaultPadding,
            ),
            // Container(
            //   decoration: BoxDecoration(
            //       color: tema5,
            //       borderRadius: BorderRadius.all(Radius.circular(5)),
            //       boxShadow: [
            //         BoxShadow(
            //             blurRadius: 5,
            //             offset: Offset(-3, 2),
            //             color:
            //                 tema5)
            //       ]),
            //   child: Column(
            //     children: [
            //       Align(
            //           alignment: Alignment.centerLeft,
            //           child: Padding(
            //             padding: EdgeInsets.all(defaultPadding / 2),
            //             child: Text(
            //               "Hasil After Before :",
            //               textAlign: TextAlign.center,
            //               style: TextStyle(
            //                   color: Colors.white,
            //                   fontWeight: FontWeight.bold,
            //                   fontSize: 16),
            //             ),
            //           )),
            //       Container(
            //         margin: EdgeInsets.only(
            //             bottom: defaultPadding * 1.5,
            //             top: defaultPadding,
            //             left: defaultPadding * 1.5,
            //             right: defaultPadding * 1.5),
            //         decoration: BoxDecoration(
            //             color: tema5,
            //             borderRadius: BorderRadius.all(Radius.circular(15)),
            //             boxShadow: [
            //               BoxShadow(
            //                   blurRadius: 5,
            //                   offset: Offset(0, 2),
            //                   color: tema2
            //                       .withOpacity(.7))
            //             ]),
            //         child: Padding(
            //           padding: EdgeInsets.all(defaultPadding),
            //           child: BeforeAfter(
            //             beforeImage: Image.asset(
            //                 'assets/images/MenuRawatan/Rawat_Motor.png'),
            //             afterImage: Image.asset(
            //                 'assets/images/MenuRawatan/Rawat_Tanam.png'),
            //           ),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            SizedBox(
              height: defaultPadding / 2,
            ),
            FittedBox(
              child: SizedBox(
                height: 160,
                width: SizeConfig.screenWidth,
                child: Stack(
                  children: [
                    Positioned(
                      bottom: 0,
                      // top: 0,
                      right: 0,
                      left: 0,
                      child: Container(
                        height: 142,
                        width: 150,
                        // margin: EdgeInsets.only(left: defaultPadding/2,right: defaultPadding/2),
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 6.0,
                                offset: Offset(-5, 5),
                                color: tema5.withOpacity(.3)),
                          ],
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.deepOrange.withOpacity(.9),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              flex: 8,
                              child: Padding(
                                padding:
                                    EdgeInsets.only(top: defaultPadding * 1.5),
                                child: Center(
                                    child: RichText(
                                        text: TextSpan(
                                  text: "DISKON\n",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold),
                                  children: [
                                    TextSpan(
                                        text: "70%",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 30,
                                            fontWeight: FontWeight.bold))
                                  ],
                                ))),
                              ),
                            ),
                            Flexible(
                              fit: FlexFit.loose,
                              flex: 1,
                              child: Padding(
                                padding: EdgeInsets.only(
                                    top: defaultPadding * 2,
                                    bottom: defaultPadding),
                                child: Container(
                                  width: 4,
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                          blurRadius: 6.0,
                                          offset: Offset(-5, 5),
                                          color: tema5.withOpacity(.3)),
                                    ],
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 14,
                              child: Padding(
                                padding: EdgeInsets.only(
                                    top: defaultPadding * 1.5,
                                    right: defaultPadding / 3),
                                child: Center(
                                    child: RichText(
                                        text: TextSpan(
                                  text: "IKUTI TOKO\n",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold),
                                  children: [
                                    TextSpan(
                                        text: "DISKON +5%",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 30,
                                            fontWeight: FontWeight.bold))
                                  ],
                                ))),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      // bottom: 0,
                      top: 0,
                      right: 0,
                      left: 0,
                      child: Container(
                        height: 40,
                        margin: EdgeInsets.only(
                            left: defaultPadding / 2,
                            right: defaultPadding / 2),
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 6.0,
                                offset: Offset(-5, 5),
                                color: tema5.withOpacity(.3)),
                          ],
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10),
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10)),
                          color: Colors.white,
                        ),
                        child: Center(
                            child: Text("Shopee",
                                style: TextStyle(
                                    color: Colors.deepOrange,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold))),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: heightfit(defaultPadding / 2),
            ),
            TabButtonku(
                typetema: 1,
                dataCategoryImgList: [],
                temaWarna: tema5,
                initialStateselected: selectedItem,
                dataCategoryList: categoryDetail,
                onStateChange: (selected, categoryDetail) {
                  setState(() {
                    selectedItem = selected;
                    categoryDetail = categoryDetail;
                  });
                },
                listWidgetPageView: [
                  informasi(shopItem),
                  brosure(shopItem),
                ]),
            SizedBox(
              height: heightfit(defaultPadding),
            ),

            SizedBox(
              height: 100,
            ),
          ]),
        ),
      ],
    );
  }
}
