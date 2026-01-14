import 'package:get/get.dart';
import 'package:rawatt/components/tabCostume.dart';
import 'package:rawatt/components/tema_Page.dart';
import 'package:rawatt/constants.dart';
import 'package:rawatt/model/controler.dart';
import 'package:rawatt/model/data_.dart';
import 'package:rawatt/model/datafix.dart';
import 'package:rawatt/model/product/mdl_Produk.dart';
import 'package:rawatt/screens/details/cart_page/cart_Page.dart';
import 'package:rawatt/screens/details/component/component.dart';
import 'package:rawatt/screens/details/components.dart';
import 'package:rawatt/screens/home/screen_Lanscape/component.dart';
import 'package:rawatt/screens/home/screen_Lanscape/left_content.dart';
import 'package:rawatt/screens/home/screen_Portrait/layer2_home.dart';
import 'package:rawatt/size_config.dart';
import 'package:flutter/material.dart';

import '../../../components/card_product.dart';
import '../../convert/component/dialogku.dart';
import '../../convert/component/inisialisasi_var.dart';
import '../details_screen.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

class WideLayoutProduct extends StatelessWidget {
  const WideLayoutProduct({super.key});
  @override
  Widget build(BuildContext context) {
    // List selectedperusahaanList = perusahaan;
    return Center(
      child: BackgraundProduct(
        onStateChange: () {},
      ),
    );
  }
}

class BackgraundProduct extends StatefulWidget {
  const BackgraundProduct({
    super.key,
    required this.onStateChange,
  });
  final Function() onStateChange;

  @override
  _BackgraundProductState createState() => _BackgraundProductState();
}

class _BackgraundProductState extends State<BackgraundProduct> {
  @override
  Widget build(BuildContext context) {
    int selectedItem = 0;
    return BackgraundLanscape(
        widgets: Obx(() => Row(
              children: [
                Expanded(
                  // fit: FlexFit.tight,
                  flex: 8,
                  child: Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: heightfit(defaultPadding * 2),
                        vertical: heightfit(defaultPadding)),
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
                          child: Padding(
                            padding: EdgeInsets.all(heightfit(defaultPadding)),
                            child: Container(
                              padding:
                                  EdgeInsets.all(heightfit(defaultPadding)),
                              decoration: BoxDecoration(
                                  color: Colors.black12,
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
                                  Expanded(
                                    flex: 1,
                                    child: RichText(
                                      text: TextSpan(
                                        text: "Product",
                                        style: TextStyle(
                                            color: Colors.black54,
                                            fontSize: heightfit(36),
                                            fontWeight: FontWeight.bold),
                                        // more: false,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 8,
                                    child: ListView.builder(
                                        padding: EdgeInsets.zero,
                                        scrollDirection: Axis.vertical,
                                        itemCount: filterdataByPerusahaan(
                                                c.produkku.value.idPerusahaan)
                                            .length,
                                        itemBuilder: (context, index) =>
                                            Container(
                                              child: Padding(
                                                padding: EdgeInsets.only(
                                                  // left: (defaultPadding - 2/2),
                                                  // right: (defaultPadding - 2/2),
                                                  bottom: defaultPadding / 2,
                                                  // bottom: defaultPadding / 2
                                                ),
                                                child: FittedBox(
                                                  child: ProductListCard(
                                                    index:
                                                        dataProductsObj[index]
                                                            .id,
                                                    data:
                                                        filterdataByPerusahaan(c
                                                                .produkku
                                                                .value
                                                                .idPerusahaan)[
                                                            index],
                                                    press: () {
                                                      DataProducts data =
                                                          dataProductsObj[
                                                              index];
                                                      c.produkku.value = data;
                                                      (SizeConfig.screenWidth! >
                                                              600)
                                                          ? Container()
                                                          : Navigator.push(
                                                                  context,
                                                                  MaterialPageRoute(
                                                                    builder:
                                                                        (context) =>
                                                                            BodyDetails(),
                                                                  ))
                                                              .then((value) =>
                                                                  setState(() =>
                                                                      {}));
                                                    },
                                                    todetail: true,
                                                  ),
                                                ),
                                              ),
                                            )),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 12,
                          child: Column(
                            children: [
                              Flexible(
                                  flex: 3,
                                  fit: FlexFit.loose,
                                  // fit: FlexFit.tight,
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        bottom: heightfit(defaultPadding)),
                                    child: SizedBox(
                                      height: heightfit(300),
                                      child: LandingHome(
                                        jenisTema: 2,
                                        title: "Detail Produk",
                                        judul: c.produkku.value.title,
                                        penjelas: "Untuk Tanamanmu",
                                        image: c.produkku.value.img,
                                        tema: c.palette_product.value[4],
                                      ),
                                    ),
                                  )),
                              Flexible(
                                  flex: 5,
                                  fit: FlexFit.loose,
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal:
                                            widthfit(defaultPadding / 2),
                                        vertical:
                                            heightfit(defaultPadding / 4)),
                                    child: Container(
                                      // height: heightfit(SizeConfig.screenHeight),
                                      child: Column(
                                        children: [
                                          Expanded(
                                            flex: 1,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                RichText(
                                                  text: TextSpan(
                                                      text: "Penjelasan",
                                                      style: TextStyle(
                                                          fontSize:
                                                              heightfit(25),
                                                          color: Colors
                                                              .grey.shade600,
                                                          fontWeight:
                                                              FontWeight.bold)),
                                                ),
                                                SizedBox(
                                                  height: heightfit(40),
                                                  width: widthfit(60),
                                                  child: CounterProduct(
                                                      index:
                                                          c.produkku.value.id,
                                                      product: c.produkku.value,
                                                      type: true,
                                                      changeTotal: () {
                                                        setState(() {
                                                          // bloc.cartProductx;
                                                        });
                                                      }),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                            flex: 5,
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: heightfit(
                                                      defaultPadding / 2),
                                                  vertical: heightfit(
                                                      defaultPadding)),
                                              child: Container(
                                                height: heightfit(500),
                                                decoration: BoxDecoration(
                                                    // color: Colors.green.shade100,
                                                    // boxShadow: [
                                                    //   BoxShadow(
                                                    //     offset: Offset(-5, 9),
                                                    //     blurRadius: 20,
                                                    //     color:
                                                    //         Colors.black45.withOpacity(.3),
                                                    //   )
                                                    // ],
                                                    borderRadius:
                                                        BorderRadius.only(
                                                  topLeft: Radius.circular(5),
                                                  bottomLeft:
                                                      Radius.circular(30),
                                                  topRight: Radius.circular(20),
                                                  bottomRight:
                                                      Radius.circular(5),
                                                )),
                                                child: SingleChildScrollView(
                                                  child: TabButtonku(
                                                      typetema: 1,
                                                      dataCategoryImgList: [],
                                                      temaWarna: c
                                                          .palette_product
                                                          .value[4],
                                                      initialStateselected:
                                                          selectedItem,
                                                      dataCategoryList:
                                                          categoryDetail,
                                                      onStateChange: (selected,
                                                          categoryDetail) {
                                                        setState(() {
                                                          selectedItem =
                                                              selected;
                                                          categoryDetail =
                                                              categoryDetail;
                                                        });
                                                      },
                                                      listWidgetPageView: [
                                                        informasi(
                                                            c.produkku.value),
                                                        brosure(
                                                            c.produkku.value),
                                                      ]),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ))
                            ],
                          ),
                        ),
                        Expanded(
                            flex: 5,
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
                                padding:
                                    EdgeInsets.all(heightfit(defaultPadding)),
                                child: Column(
                                  children: [
                                    Flexible(
                                      flex: 3,
                                      child: Container(
                                        padding: EdgeInsets.all(
                                            heightfit(defaultPadding / 2)),
                                        decoration: BoxDecoration(
                                            color: Colors.black12,
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
                                            Expanded(
                                              flex: 1,
                                              child: RichText(
                                                text: TextSpan(
                                                  text: "Pesanan",
                                                  style: TextStyle(
                                                      color: Colors.black54,
                                                      fontSize: heightfit(34),
                                                      fontWeight:
                                                          FontWeight.bold),
                                                  // more: false,
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 10,
                                              child: WidgetListPesanan(
                                                onStateChange: () {
                                                  setState(() {
                                                    // bloc.cartProductss;
                                                  });
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )),
                      ],
                    ),
                  ),
                ),
              ],
            )));
  }
}
