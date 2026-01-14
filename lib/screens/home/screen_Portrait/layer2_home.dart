// import 'dart:html';

// import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'dart:math';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:rawatt/components/card_img.dart';
import 'package:rawatt/components/card_product.dart';
import 'package:rawatt/constants.dart';
import 'package:rawatt/components/card_Perusahaan.dart';
import 'package:rawatt/model/data_.dart';
import 'package:rawatt/model/datafix.dart';
import 'package:rawatt/model/dosis/fieldku_campur.dart';
import 'package:rawatt/model/jenisMesin/mdl_JenisMesin.dart';
import 'package:rawatt/model/product/mdl_Produk.dart';
import 'package:rawatt/screens/convert/component/component.dart';
import 'package:rawatt/screens/convert/component/inisialisasi_var.dart';

import 'package:rawatt/screens/convert/screen_Potrait/backgrounds.dart';
import 'package:rawatt/screens/convert/screens/dosis_pupuk_tanaman/dosis_pupuk_tanaman.dart';
import 'package:rawatt/screens/details/details_screen.dart';
import 'package:rawatt/screens/home/components/card_Quote.dart';
import 'package:rawatt/service/ad_mob_service.dart';
import 'package:rawatt/size_config.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../components/daun.dart';
import '../../../model/MenuRawatan/mdl_MenuRawatan.dart';
import '../../../model/petani/mdl_Petani.dart';
import '../../../paletteColor.dart';
import '../../../service/database_service.dart';
import '../../convert/component/dialogku.dart';
import '../../details/component/component.dart';
// import 'package:google_mobile_ads/google_mobile_ads.dart';

// import '../../convert/component/dialogku.dart';
// import '../../details/component/component.dart';

bool areListsEqual(var list1, var list2) {
  // check if both are lists
  if (!(list1 is List && list2 is List)
      // check if both have same length
      ||
      list1.length != list2.length) {
    return false;
  }

  // check if elements are equal
  for (int i = 0; i < list1.length; i++) {
    if (list1[i] != list2[i]) {
      return false;
    }
  }

  return true;
}

class MenuHomeTanam extends StatefulWidget {
  final int indexmenus;
  final int indexsubmenus;

  // final Function(int submenu) indexsubmenu;
  const MenuHomeTanam({
    super.key,
    required this.indexmenus,
    required this.indexsubmenus,
  });

  @override
  State<MenuHomeTanam> createState() => _MenuHomeTanamState();
}

class _MenuHomeTanamState extends State<MenuHomeTanam> {
  List<DataProducts>? dataProdukskuget = [];
  final DatabaseService _databaseKut = DatabaseService();
  final ScrollController _parentScrollController = ScrollController();

  @override
  void initState() {
    // setState(() {
    c.connection_e.value = true;
    widget.indexmenus;
    filterdataByPerusahaan(0);
    // });
    super.initState();
  }

  int indexsubmenu = 0;

  @override
  Widget build(BuildContext context) {
    List selectedQuotesList = quotes;
    // int indexsubmenu = 0;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        // menuCalt(dataPropertyKalkulatorMeroke, 2),

        Titlesy(
          judul: dataKategoriMenuRawatan[widget.indexmenus].fitur[0],
          more: true,
          links: "/dosisPupukTanamanBuah",
        ),
        // Container(
        //   height:  SizeConfig.screenHeight!/3,
        //   width: SizeConfig.screenWidth,
        //   child: FutureBuilder(
        //     // future:_databaseKu.fetchDataPetanis(),
        //       future:_databaseKut.fetchDataProduksku(),
        //       builder: (context, snapshot) {
        //         // if (snapshot.hasData) {
        //         //   final dataPetanie = snapshot.data;
        //         // }
        //         return
        //           (snapshot.connectionState ==ConnectionState.waiting)?
        //           const CircularProgressIndicator(
        //           ):
        //           (c.connection_e.value ==false)?
        //           SizedBox.expand(
        //             child: CustomDialogBox(
        //                 title: "Error",
        //                 descriptions: "Koneksi Internet Bermasalah",
        //                 text: "ok",
        //
        //                 img: "assets/images/logos.png",
        //                 chek: () {
        //                   setState(() {
        //                     c.isdialogpesan.value == false;
        //                   });
        //                 }),
        //           )
        //               :
        //           Padding(
        //             padding: const EdgeInsets.all(8.0),
        //             child: snapshot.data.isEmpty ? const Center(
        //               child: Text('Data Tidak Ada :)',style: TextStyle(color: Colors.black),),
        //             ) :
        //             NotificationListener(
        //               onNotification: (ScrollNotification notification) {
        //                 if (notification is ScrollUpdateNotification) {
        //                   if (notification.metrics.pixels ==
        //                       notification.metrics.maxScrollExtent) {
        //                     debugPrint('Reached the bottom');
        //                     _parentScrollController.animateTo(
        //                         _parentScrollController.position.maxScrollExtent,
        //                         duration: const Duration(seconds: 1),
        //                         curve: Curves.easeIn);
        //                   } else if (notification.metrics.pixels ==
        //                       notification.metrics.minScrollExtent) {
        //                     debugPrint('Reached the top');
        //                     _parentScrollController.animateTo(
        //                         _parentScrollController.position.minScrollExtent + (_parentScrollController.position.maxScrollExtent /4),
        //                         duration: const Duration(seconds: 1),
        //                         curve: Curves.easeIn);
        //                   }
        //                 }
        //                 return true;
        //               },
        //               child:  Container(
        //                 height: heightfit(500),
        //                 width: double.infinity,
        //                 child: ListView.builder(
        //                   controller: _parentScrollController,
        //                   padding: EdgeInsets.zero,
        //                   // reverse: true,
        //                   itemCount:Map.of (List.of(snapshot.data)[55]).length,
        //                   itemBuilder: (context, i) {
        //                     return Row(
        //                       crossAxisAlignment: CrossAxisAlignment.start,
        //                       children: [
        //                         Flexible(
        //                           flex: 2,
        //                           fit: FlexFit.loose,
        //                           child: Daun(number: true, i: i,key: Key("a"),),
        //                         ),
        //                         const SizedBox(
        //                           width: 10,
        //                         ),
        //                         Expanded(
        //                           flex: 11,
        //                           child: Text(
        //                             "${Map.of(List.of(snapshot.data)[55]).keys.toList()[i]} : ${Map.of(List.of(snapshot.data)[55]).values.toList()[i]}",
        //                             textAlign: TextAlign.justify,
        //                             style: const TextStyle(color: Colors.black87),
        //                           ),
        //                         ),
        //                       ],
        //                     );
        //                   },
        //                 ),
        //               ),
        //             ),
        //
        //
        //           );
        //       }),
        // ),
        SizedBox(
          height: defaultPadding / 2,
        ),

        WcalcTanaman(
          h: SizeConfig.screenHeight! / 2.4,
          w: SizeConfig.screenWidth!,
          img: false,
          onStateChange: (indexsub) {
            setState(() {});
            //
            //   // indexsubmenu = indexsub;
            //   // widget.indexsubmenu(indexsub);
            //   // print("indexnya ${indexsubmenus}");
            //   // Navigator.pushNamed(context, "/dosisPupukTanamanBuah");
            //
            //   // Future.delayed(Duration.zero, () {
            //   //   WidgetsBinding.instance!.addPostFrameCallback((_) {
            //   //     Navigator.push(
            //   //       context,
            //   //       MaterialPageRoute(
            //   //         builder: (context) => DosisPupukTanamanbuah(),
            //   //       ),
            //   //     );
            //   //   });
            //   // });
            //
            //   // showInterstitalAd(context,"/dosisPupukTanamanBuah");
          },
          indexmenu: c.indexMenuRawatan.value,
          indexsubmenu: widget.indexsubmenus,
          // datasubMenuRawatan: dataKategoriKomoditi,
        ),
        SizedBox(
          height: defaultPadding,
        ),
        // Slider1(
        //   scrollDirectionss: Axis.horizontal,
        //   shopItem: filterdataByPerusahaan(0),
        //   titles: "Produk Pupuk Petrokimia Gresik",
        // ),

        // SizedBox(
        //   height: defaultPadding,
        // ),
        // Slider1(
        //   scrollDirectionss: Axis.horizontal,
        //   shopItem: filterdataByPerusahaan(1),
        //   titles: "Produk Pupuk Meroke",
        // ),
        // SizedBox(
        //   height: defaultPadding,
        // ),
        // Slider1(
        //   scrollDirectionss: Axis.horizontal,
        //   shopItem: filterdataByPerusahaan(2),
        //   titles: "Produk Pupuk Pak Tani",
        // ),

        // Padding(
        //   padding: EdgeInsets.only(left: defaultPadding / 2),
        //   child: Slider2(
        //     selectedQuotesList: selectedQuotesList,
        //   ),
        // ),

        // Slider4(
        //   selectedstakeholderList: selectedstakeholderList,
        //   titles: "Stakeholder",
        // ),
      ],
    );
  }
}

class WcalcTanaman extends StatefulWidget {
  const WcalcTanaman({
    super.key,
    required this.h,
    required this.w,
    required this.onStateChange,
    required this.img,
    required this.indexmenu,
    required this.indexsubmenu,
  });

  final double h;
  final double w;
  final bool img;

  //(Komoditi, jenis Mesin, dll)
  final int indexsubmenu;
  final int indexmenu;

  // final void dol;
  // final List<DataProducts> cartProductsku;
  final Function(int indexsub) onStateChange;

  @override
  State<WcalcTanaman> createState() => _WcalcTanamanState();
}

class _WcalcTanamanState extends State<WcalcTanaman> {
  int indexsubmenus = 0;
  int lama = 0;
  int baru = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    baru = widget.indexmenu;
    if (baru != lama) {
      setState(() {
        // print("berubah");
        indexsubmenus = 0;
      });
    }
    // print("lama index sub ${indexsubmenus} ${widget
    //     .indexsubmenu} index menu ${widget.indexmenu} ${lama}");
    // print(" Baru index sub ${indexsubmenus} ${widget
    //     .indexsubmenu} index menu ${widget.indexmenu} ${baru}");

    lama = baru;

    return Padding(
      padding: EdgeInsets.all(defaultPadding / 1.5),
      child: Container(
        height: widget.h,
        width: widget.w,
        padding: EdgeInsets.all(defaultPadding / 8),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            transform: GradientRotation(17),
            colors: <Color>[
              warnas(dataKategoriMenuRawatan[widget.indexmenu].colorku[0]),
              warnas(dataKategoriMenuRawatan[widget.indexmenu].colorku[0]),
              warnas(dataKategoriMenuRawatan[widget.indexmenu].colorku[2]),
              warnas(dataKategoriMenuRawatan[widget.indexmenu].colorku[2]),
            ],
            // Gradient from https://learnui.design/tools/gradient-generator.html
            tileMode: TileMode.mirror,
          ),
          // color: warnas(dataKategoriMenuRawatan[widget.indexmenu].colorku[0]),
          borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10)),
        ),
        child: Stack(
          alignment: Alignment.bottomRight,
          children: [
            Column(
              children: [
                Flexible(
                    flex: 3,
                    child: Container(
                      padding: EdgeInsets.only(left: defaultPadding / 1.5),
                      decoration: const BoxDecoration(
                        // color: Colors.amber.withOpacity(.9),
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20)),
                      ),
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          // physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          padding: EdgeInsets.zero,
                          itemCount: datakategorisubMenuRawatan
                              .where((element) =>
                                  element.id_MenuRawatan ==
                                  widget.indexmenu.toString())
                              .toList()
                              .length,
                          itemBuilder: (context, index) => cardKomoditi(
                                index: index,
                                lenn: datakategorisubMenuRawatan
                                    .where((element) =>
                                        element.id_MenuRawatan ==
                                        widget.indexmenu.toString())
                                    .toList()
                                    .length,
                                img: false,
                                indexs: widget.indexmenu,
                                indexdubmenu: (int indexsubmenu) {
                                  setState(() {
                                    // if(widget.indexmenu)
                                    indexsubmenus = indexsubmenu;

                                    // widget.onStateChange(indexsubmenu);
                                  });
                                },
                              )),
                    )),
                Flexible(
                  flex: 5,
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: defaultPadding,
                        right: defaultPadding,
                        bottom: defaultPadding),
                    child: Stack(
                        // alignment: AlignmentDirectional.bottomEnd,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                // color: Colors.amber.withOpacity(.9),
                                borderRadius: const BorderRadius.only(
                                    bottomLeft: Radius.circular(20),
                                    bottomRight: Radius.circular(20),
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20)),
                                color: warnas(
                                    dataKategoriMenuRawatan[widget.indexmenu]
                                        .colorku[1]),
                                boxShadow: [
                                  BoxShadow(
                                      blurRadius: 15,
                                      offset: Offset(0, 5),
                                      color: warnas(dataKategoriMenuRawatan[
                                              widget.indexmenu]
                                          .colorku[0]))
                                ]),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              // color: Colors.amber.withOpacity(.9),
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(20),
                                  bottomRight: Radius.circular(130),
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20)),
                              color: warnas(
                                      dataKategoriMenuRawatan[widget.indexmenu]
                                          .colorku[0])
                                  .withOpacity(.3),
                            ),
                          ),
                          FittedBox(
                            child: Container(
                              height: 100,
                              width: 100,
                              // alignment: Alignment.bottomLeft,
                              decoration: BoxDecoration(
                                // color: Colors.amber.withOpacity(.9),
                                borderRadius: const BorderRadius.only(
                                    bottomLeft: Radius.circular(0),
                                    bottomRight: Radius.circular(100),
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(0)),
                                color: warnas(dataKategoriMenuRawatan[
                                            widget.indexmenu]
                                        .colorku[1])
                                    .withOpacity(.3),
                              ),
                            ),
                          ),
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Flexible(
                                  flex: 5,
                                  child: Container(
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          // ButtonMenu(
                                          //   iconic: MdiIcons.sproutOutline,
                                          //   textIcon: "DataProducts",
                                          //   press: () {
                                          //     // ShopDataProvider().getProducts(0);
                                          //     Navigator.pushNamed(context, '/product');
                                          //   },
                                          // ),

                                          Flexible(
                                            flex: 2,
                                            child: Padding(
                                              padding: EdgeInsets.all(
                                                defaultPadding / 2,
                                              ),
                                              child: ElevatedButton(
                                                onPressed: () {
                                                  setState(() {
                                                    SchedulerBinding.instance
                                                        .addPostFrameCallback(
                                                            (_) {
                                                      c.indexsubMenuRawatan
                                                              .value =
                                                          indexsubmenus;

                                                      // print(
                                                      //     "index sub ${indexsubmenus} ${parentData.map((e) => e.indexsubmenu)}");

                                                      //yourcode
                                                      // Navigator.pushNamed(context, "/dosisPupukTanamanBuah");
                                                      Navigator.push(context,
                                                          MaterialPageRoute(
                                                              builder:
                                                                  (context) {
                                                        return DosisPupukTanamanbuah(
                                                          indexsubmenu:
                                                              indexsubmenus,
                                                          indexmenu:
                                                              widget.indexmenu,
                                                        );
                                                      }));

                                                      (widget.indexmenu == 1)
                                                          ? showDialog(
                                                              context: context,
                                                              barrierDismissible:
                                                                  false,
                                                              builder:
                                                                  (BuildContext
                                                                      context) {
                                                                return AlertDialog(
                                                                  title: Center(
                                                                      child:
                                                                          Text(
                                                                    'Pengaplikasian',
                                                                    style: TextStyle(
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .bold,
                                                                        fontSize:
                                                                            30),
                                                                  )),
                                                                  content: Text(
                                                                    "Perhitungan ini menggunakan Perbandingan yang sudah ditetapkan dari perusahaan per hektar atau per pohon, jadi dengan menggunakan ini kalian harus tetap memperhatikan dosis yang sesuai dengan keperluan tani kalian.",
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .black38),
                                                                  ),
                                                                  actions: <Widget>[
                                                                    ElevatedButton(
                                                                      onPressed:
                                                                          () {
                                                                        Navigator.of(context)
                                                                            .pop();
                                                                      },
                                                                      style: ElevatedButton.styleFrom(
                                                                          padding: EdgeInsets.all(1),
                                                                          shape: RoundedRectangleBorder(
                                                                            borderRadius:
                                                                                BorderRadius.circular(10),
                                                                          ),
                                                                          elevation: 0,
                                                                          backgroundColor: Colors.orange),
                                                                      child:
                                                                          Padding(
                                                                        padding:
                                                                            EdgeInsets.all(heightfit(defaultPadding /
                                                                                2)),
                                                                        child:
                                                                            Row(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.center,
                                                                          children: [
                                                                            Icon(
                                                                              Icons.check_circle,
                                                                              size: 15,
                                                                              color: Colors.white,
                                                                            ),
                                                                            Text("OK",
                                                                                style: TextStyle(color: Colors.black))
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                );
                                                              })
                                                          : Container();
                                                    });
                                                  });
                                                },
                                                // onStateChange(),

                                                // _showInterstitalAd,

                                                style: ElevatedButton.styleFrom(
                                                  padding:
                                                      const EdgeInsets.all(1),
                                                  shadowColor: warnas(
                                                          dataKategoriMenuRawatan[
                                                                  widget
                                                                      .indexmenu]
                                                              .colorku[1])
                                                      .withOpacity(.3),
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                  ),
                                                  elevation: 0,
                                                  backgroundColor: Colors.white,
                                                ),
                                                child: Container(
                                                  height: 100,
                                                  width: 250,
                                                  alignment: Alignment.center,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        const BorderRadius.only(
                                                            bottomLeft: Radius
                                                                .circular(20),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    20),
                                                            topLeft:
                                                                Radius.circular(
                                                                    20),
                                                            topRight:
                                                                Radius.circular(
                                                                    20)),
                                                    color: warnas(
                                                        dataKategoriMenuRawatan[
                                                                widget
                                                                    .indexmenu]
                                                            .colorku[0]),
                                                  ),
                                                  child: Padding(
                                                    padding: EdgeInsets.all(
                                                        defaultPadding / 1.5),
                                                    child: AutoSizeText(
                                                      "${dataKategoriMenuRawatan[widget.indexmenu].fitur[0]} ${datakategorisubMenuRawatan.where((element) => element.id_MenuRawatan == widget.indexmenu.toString()).toList()[indexsubmenus].namaKomoditi}",
                                                      // ${datakategorisubMenuRawatan.where((element) => element.id_MenuRawatan == widget.indexmenu.toString()).toList()[indexsubmenus].namaKomoditi
                                                      textAlign:
                                                          TextAlign.center,
                                                      maxLines: 4,
                                                      minFontSize: 8,
                                                      style: TextStyle(
                                                          fontSize: 20,
                                                          color: warnas(
                                                              dataKategoriMenuRawatan[
                                                                      widget
                                                                          .indexmenu]
                                                                  .colorku[1]),
                                                          fontWeight:
                                                              FontWeight.w800),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),

                                          // Flexible(
                                          //   flex: 2,
                                          //   child: Padding(
                                          //     padding: EdgeInsets.only(
                                          //       top: defaultPadding,
                                          //       left: defaultPadding / 2,
                                          //       bottom:
                                          //           defaultPadding / 2,
                                          //     ),
                                          //     child: Container(
                                          //       height: 100,
                                          //       width: 150,
                                          //       decoration: BoxDecoration(
                                          //         borderRadius:
                                          //             BorderRadius.only(
                                          //                 bottomLeft: Radius
                                          //                     .circular(
                                          //                         20),
                                          //                 bottomRight:
                                          //                     Radius
                                          //                         .circular(
                                          //                             20),
                                          //                 topLeft: Radius
                                          //                     .circular(
                                          //                         20),
                                          //                 topRight: Radius
                                          //                     .circular(
                                          //                         20)),
                                          //         color: Colors
                                          //             .green.shade900,
                                          //       ),
                                          //       child: Padding(
                                          //         padding: EdgeInsets.all(
                                          //             defaultPadding /
                                          //                 1.5),
                                          //         child: AutoSizeText(
                                          //           "Peptisida Tanaman ${dataKategoriKomoditi[c.indexTanamanbuah.value].namaKomoditi}",
                                          //           textAlign:
                                          //               TextAlign.center,
                                          //           maxLines: 4,
                                          //           minFontSize: 8,
                                          //           style: TextStyle(
                                          //               fontSize: 14,
                                          //               color:
                                          //                   Colors.white,
                                          //               fontWeight:
                                          //                   FontWeight
                                          //                       .w800),
                                          //         ),
                                          //       ),
                                          //     ),
                                          //   ),
                                          // ),
                                          // Flexible(
                                          //   flex: 2,
                                          //   child: Padding(
                                          //     padding: EdgeInsets.only(
                                          //       top: defaultPadding,
                                          //       left: defaultPadding / 2,
                                          //       right: defaultPadding,
                                          //       bottom:
                                          //           defaultPadding / 2,
                                          //     ),
                                          //     child: Container(
                                          //       height: 100,
                                          //       width: 150,
                                          //       decoration: BoxDecoration(
                                          //         borderRadius:
                                          //             BorderRadius.only(
                                          //                 bottomLeft: Radius
                                          //                     .circular(
                                          //                         20),
                                          //                 bottomRight:
                                          //                     Radius
                                          //                         .circular(
                                          //                             20),
                                          //                 topLeft: Radius
                                          //                     .circular(
                                          //                         20),
                                          //                 topRight: Radius
                                          //                     .circular(
                                          //                         20)),
                                          //         color: Colors
                                          //             .green.shade900,
                                          //       ),
                                          //       child: Padding(
                                          //         padding: EdgeInsets.all(
                                          //             defaultPadding /
                                          //                 1.5),
                                          //         child: AutoSizeText(
                                          //           "Perawatan Tanaman ${dataKategoriKomoditi[c.indexTanamanbuah.value].namaKomoditi}",
                                          //           textAlign:
                                          //               TextAlign.center,
                                          //           maxLines: 4,
                                          //           minFontSize: 8,
                                          //           style: TextStyle(
                                          //               fontSize: 14,
                                          //               color:
                                          //                   Colors.white,
                                          //               fontWeight:
                                          //                   FontWeight
                                          //                       .w800),
                                          //         ),
                                          //       ),
                                          //     ),
                                          //   ),
                                          // ),
                                        ]),
                                  ),
                                ),
                                Flexible(
                                  flex: 3,
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: defaultPadding),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Flexible(
                                          flex: 5,
                                          child: AutoSizeText(
                                            "Fitur Pengaplikasian ${dataKategoriMenuRawatan[widget.indexmenu].fitur[0]} ${datakategorisubMenuRawatan.where((element) => element.id_MenuRawatan == widget.indexmenu.toString()).toList()[indexsubmenus].namaKomoditi}",
                                            //
                                            maxLines: 2,
                                            minFontSize: 8,
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: warnas(
                                                    dataKategoriMenuRawatan[
                                                            widget.indexmenu]
                                                        .colorku[0]),
                                                fontWeight: FontWeight.w800),
                                          ),
                                        ),
                                        Flexible(
                                          flex: 2,
                                          child: Padding(
                                              padding: EdgeInsets.only(
                                                  bottom: defaultPadding,
                                                  right: defaultPadding * 2),
                                              child: widget.img == true ||
                                                      widget.indexmenu == 1
                                                  ? ImgOnline(
                                                      datakategorisubMenuRawatan
                                                          .where((element) =>
                                                              element
                                                                  .id_MenuRawatan ==
                                                              widget.indexmenu
                                                                  .toString())
                                                          .toList()[
                                                              indexsubmenus]
                                                          .img,
                                                      datakategorisubMenuRawatan
                                                          .where((element) =>
                                                              element
                                                                  .id_MenuRawatan ==
                                                              widget.indexmenu
                                                                  .toString())
                                                          .toList()[
                                                              indexsubmenus]
                                                          .img)
                                                  : SizedBox(
                                                      height: 100,
                                                      width: 100,
                                                      child: Center(
                                                        child: Icon(
                                                          // Icons.water_outlined
                                                          datakategorisubMenuRawatan
                                                              .where((element) =>
                                                                  element
                                                                      .id_MenuRawatan ==
                                                                  widget
                                                                      .indexmenu
                                                                      .toString())
                                                              .toList()[widget
                                                                  .indexsubmenu]
                                                              .icon

                                                          // icons(
                                                          //     datakategorisubMenuRawatan
                                                          //         .where((element) =>
                                                          //     element
                                                          //         .id_MenuRawatan ==
                                                          //         widget.indexmenu
                                                          //             .toString())
                                                          //         .toList()[indexsubmenus]
                                                          //         .icon.replaceAll(
                                                          //         "'", '"'))
                                                          ,
                                                          color: warnas(dataKategoriMenuRawatan[
                                                                      widget
                                                                          .indexmenu]
                                                                  .colorku[0])
                                                              .withOpacity(.9),
                                                          size: 60,
                                                        ),
                                                      ),
                                                    )),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ]),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class cardMenuRawatan extends StatefulWidget {
  const cardMenuRawatan({
    super.key,
    required this.index,
    required this.getindexmenu,
    // required this.getindexsubmenu,
  });
  final int index;
  final Function(int indexmenu, int indexsub) getindexmenu;

  @override
  State<cardMenuRawatan> createState() => _cardMenuRawatanState();
}

class _cardMenuRawatanState extends State<cardMenuRawatan> {
  int indexsub = 0;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:
          // pressCategory,
          () {
        setState(() {
          indexsub = 0;
          indexsubmenufix = 0;
          widget.getindexmenu(widget.index, indexsub);
          print(indexsub);
          // print(dataKategoriMenuRawatan[index].colorku[0]);
          // setState(() {
          //     getindexsubmenu(index);
          c.indexsubMenuRawatan.value = 0;
          c.indexMenuRawatan.value = widget.index;
          // print ("iniloh error ${c.indexMenuRawatan.value} ${filterdataByBundle(c.indexMenuRawatan.value.toString()).length}");
          // });
        });
      },
      child: FittedBox(
        child: Container(
          height: SizeConfig.screenWidth! / 3.5,
          width: SizeConfig.screenWidth! / 3.5,
          decoration: BoxDecoration(
              // color: Colors.amber.withOpacity(.9),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(7),
                  bottomRight: Radius.circular(7),
                  topLeft: Radius.circular(7),
                  topRight: Radius.circular(7)),
              border: Border.all(
                  width: 2,
                  color: c.indexMenuRawatan.value == widget.index
                      ? warnas(dataKategoriMenuRawatan[c.indexMenuRawatan.value]
                          .colorku[1])
                      : warnas(dataKategoriMenuRawatan[c.indexMenuRawatan.value]
                              .colorku[1])
                          .withOpacity(.3)),
              color: warnas(dataKategoriMenuRawatan[widget.index].colorku[0]),
              boxShadow: [
                BoxShadow(
                    blurRadius: 15,
                    offset: Offset(0, 5),
                    color: c.indexMenuRawatan.value == widget.index
                        ? Colors.green.withOpacity(.3)
                        : Colors.black.withOpacity(.3))
              ]),
          child: Stack(children: [
            Container(
              height: 50,
              width: 80,
              decoration: BoxDecoration(
                // color: Colors.amber.withOpacity(.9),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(0),
                    bottomRight: Radius.circular(50),
                    topLeft: Radius.circular(0),
                    topRight: Radius.circular(0)),
                color: Colors.white12.withOpacity(.2),
              ),
            ),
            Center(
              child: Padding(
                  padding: EdgeInsets.all(defaultPadding / 4),
                  child: ImgOnline(dataKategoriMenuRawatan[widget.index].img,
                      dataKategoriMenuRawatan[widget.index].img)

                  // Image.asset(
                  //   dataKategoriMenuRawatan[index].img,
                  //   fit: BoxFit.fitHeight,
                  // ),
                  ),
            ),
          ]),
        ),
      ),
    );
  }
}

class cardKomoditi extends StatefulWidget {
  const cardKomoditi({
    super.key,
    required this.index,
    required this.img,
    required this.indexs,
    required this.indexdubmenu,
    required this.lenn,
  });
  final int lenn;
  final int index;
  final bool img;
  final int indexs;
  final Function(int indexsubmenu) indexdubmenu;

  @override
  State<cardKomoditi> createState() => _cardKomoditiState();
}

int indexsubmenufix = 0;

class _cardKomoditiState extends State<cardKomoditi> {
  int indexsubmenu = 0;

  // @override
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.only(
            left: defaultPadding / 3,
            right: defaultPadding / 2,
            top: defaultPadding / 2,
            bottom: defaultPadding / 2),
        child: InkWell(
          onTap:
              // pressCategory,
              () {
            setState(() {
              indexsubmenufix = widget.index;
              indexsubmenu = widget.index;
              // indexsubmenu = widget.index;
              widget.indexdubmenu(widget.index);
              c.indexsubMenuRawatan.value = widget.index;

              c.selectsubmenu.value = widget.index;

              // print("index ${c.indexsubMenuRawatan.value}");
            });
          },
          child: FittedBox(
            child: Container(
              height: 80,
              width: (widget.lenn <= 1) ? 280 : 80,
              margin: EdgeInsets.all(defaultPadding / 2),
              decoration: BoxDecoration(
                  // color: Colors.amber.withOpacity(.9),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                      topLeft: Radius.circular(0),
                      topRight: Radius.circular(20)),
                  border: Border.all(
                      width: 2,
                      color: indexsubmenufix == widget.index
                          ? warnas(
                              dataKategoriMenuRawatan[widget.indexs].colorku[1])
                          : warnas(dataKategoriMenuRawatan[widget.indexs]
                                  .colorku[1])
                              .withOpacity(.3)),
                  color:
                      warnas(dataKategoriMenuRawatan[widget.indexs].colorku[0]),
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 15,
                        offset: Offset(0, 5),
                        color: indexsubmenufix == widget.index
                            ? Colors.green.withOpacity(.3)
                            : Colors.black.withOpacity(.3))
                  ]),
              child: Stack(children: [
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    // color: Colors.amber.withOpacity(.9),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(0),
                        bottomRight: Radius.circular(50),
                        topLeft: Radius.circular(0),
                        topRight: Radius.circular(0)),
                    color: warnas(
                            dataKategoriMenuRawatan[widget.indexs].colorku[1])
                        .withOpacity(.3),
                  ),
                ),
                Center(
                  child: Padding(
                      padding: EdgeInsets.all(defaultPadding / 2),
                      child: widget.img == true || widget.indexs == 1
                          ? ImgOnline(
                              datakategorisubMenuRawatan
                                  .where((element) =>
                                      element.id_MenuRawatan ==
                                      widget.indexs.toString())
                                  .toList()[widget.index]
                                  .img
                              // dataKategoriKomoditi[index].img,
                              ,
                              datakategorisubMenuRawatan
                                  .where((element) =>
                                      element.id_MenuRawatan ==
                                      widget.indexs.toString())
                                  .toList()[widget.index]
                                  .img)
                          : Icon(
                              datakategorisubMenuRawatan
                                  .where((element) =>
                                      element.id_MenuRawatan ==
                                      c.indexMenuRawatan.value.toString())
                                  .toList()[indexsubmenu]
                                  .icon
                              // icons(datakategorisubMenuRawatan.where((element) =>
                              // element.id_MenuRawatan == widget.indexs.toString())
                              //     .toList()[widget.index].icon)
                              ,
                              color: warnas(
                                      dataKategoriMenuRawatan[widget.indexs]
                                          .colorku[1])
                                  .withOpacity(.9),
                              size: 50,
                            )),
                ),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}

class TemaCardButton1 extends StatelessWidget {
  const TemaCardButton1({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    int ukuran = 0;
    return Container(
      height: heightfit(250),
      decoration: BoxDecoration(
        // color: Colors.amber.withOpacity(.9),
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20)),
      ),
      child: Stack(
        children: [
          Container(
            height: 300,
            width: 250,
            alignment: Alignment.bottomCenter,
            // color: Colors.black,
            // margin: EdgeInsets.only(bottom: defaultPadding),
            child: Container(
                height: 250,
                width: 250,
                padding: EdgeInsets.all(defaultPadding / 3),
                child: Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: warnas(dataKategoriMenuRawatan[
                                      c.indexMenuRawatan.value]
                                  .colorku[0])
                              .withOpacity(.9),
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20)),
                          // border: Border.all(color: Colors.white, width: 1),
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 15,
                                offset: Offset(0, 5),
                                color: warnas(dataKategoriMenuRawatan[
                                            c.indexMenuRawatan.value]
                                        .colorku[1])
                                    .withOpacity(.2))
                          ]),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(right: 4),
                                child: FittedBox(
                                  child: RotatedBox(
                                    quarterTurns: 3,
                                    child: Text(
                                      "Tanaman ",
                                      style: TextStyle(fontSize: 14),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: defaultPadding,
                              ),
                              Padding(
                                padding: EdgeInsets.only(right: 8.0 / 2),
                                child: Icon(
                                  Icons.arrow_forward_ios,
                                  size: defaultPadding,
                                  color: Colors.white,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 250,
                      width: 250,
                      // padding: EdgeInsets.all(defaultPadding / 2),
                      margin: EdgeInsets.only(right: defaultPadding * 2),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20)),
                        // border:
                        //     Border.all(color: tema.withOpacity(.8), width: .2)
                      ),
                      child: Stack(
                        children: [
                          FittedBox(
                            child: Container(
                              height: 100,
                              width: 210,
                              decoration: BoxDecoration(
                                color: Colors.amber.withOpacity(.2),
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(0),
                                    bottomRight: Radius.circular(50),
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(0)),
                              ),
                            ),
                          ),
                          FittedBox(
                            child: Container(
                              height: 300,
                              width: 260,
                              decoration: BoxDecoration(
                                color: Colors.amber.withOpacity(.1),
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(20),
                                    bottomRight: Radius.circular(10),
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(0)),
                              ),
                              alignment: Alignment.bottomRight,
                              child: FittedBox(
                                child: Container(
                                  height: 80,
                                  width: 60,
                                  decoration: BoxDecoration(
                                    color: Colors.amber.withOpacity(.6),
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(0),
                                        bottomRight: Radius.circular(20),
                                        topLeft: Radius.circular(60),
                                        topRight: Radius.circular(0)),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                )),
          ),
          Column(
            children: [
              Flexible(
                flex: 4,
                child: SizedBox(
                  height: 130,
                  width: 200,
                  child: Column(
                    children: [
                      Flexible(
                        flex: 3,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            SizedBox(
                              height: 150,
                              // width: 200,
                              child: Image.asset(
                                "assets/images/object_tanaman2.png",
                                fit: BoxFit.fitHeight,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                                padding: EdgeInsets.only(
                                    left: defaultPadding * 1.5,
                                    bottom: defaultPadding / 3),
                                height: 100,
                                width: 200,
                                child: AutoSizeText(
                                  "Bibit Monstera ",
                                  minFontSize: 8,
                                  maxLines: 1,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w800,
                                      fontSize: 18),
                                )),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Flexible(
                flex: 3,
                child: Container(
                    // height: 130,
                    width: 200,
                    padding: EdgeInsets.only(
                        top: defaultPadding / 1.5,
                        left: defaultPadding * 1.5,
                        bottom: defaultPadding / 3),
                    child: AutoSizeText(
                      "Monstera Monstera Monstera Monstera Monstera Monstera Monstera Monstera Monstera Monstera Monstera Monstera",
                      minFontSize: 8,
                      maxLines: 4,
                      style: TextStyle(color: Colors.black, fontSize: 14),
                    )),
              ),
              Flexible(
                flex: 1,
                child: Container(
                    // height: 130,
                    width: 200,
                    padding: EdgeInsets.only(
                      top: defaultPadding / 1.5,
                      left: defaultPadding * 1.5,
                    ),
                    child: AutoSizeText(
                      "Rp. 60.000",
                      minFontSize: 16,
                      maxLines: 4,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 18),
                    )),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class Titlesy extends StatelessWidget {
  const Titlesy({
    super.key,
    required this.judul,
    required this.more,
    required this.links,
  });

  final String judul;
  final bool more;
  final String links;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: defaultPadding),
      child: SizedBox(
        height: heightfit(24),
        width: double.infinity,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FittedBox(
              child: RichText(
                  text: TextSpan(
                      text: judul,
                      style: TextStyle(
                          color: kTextColor,
                          fontSize: 24,
                          fontWeight: FontWeight.bold))),
            ),
            // FittedBox(
            //     child: InkWell(
            //       onTap: () {
            //         Navigator.pushNamed(context, links);
            //       },
            //       child: RichText(
            //           text: TextSpan(
            //             text: (more == true) ? "More..." : "",
            //             style: TextStyle(
            //               color: kTextColor,
            //               fontSize: 12,
            //             ),
            //           )),
            //     )),
          ],
        ),
      ),
    );
  }
}

class TentangPerusahaan extends StatelessWidget {
  const TentangPerusahaan({
    super.key,
    required this.selectedperusahaanList,
    required this.scrollDirection,
    required this.heights,
  });

  final List selectedperusahaanList;
  final Axis scrollDirection;
  final double heights;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: heights,
      // padding: EdgeInsets.only(bottom: 10),
      width: double.infinity,
      child: ListView.builder(
        padding: EdgeInsets.zero,
        scrollDirection: scrollDirection,
        itemCount: selectedperusahaanList.length,
        itemBuilder: (context, index) => Container(
          padding: EdgeInsets.only(bottom: 20, top: 5),
          child: CardPerusahaan(
            logo: perusahaan[index]['logo']!,
            img: perusahaan[index]["image"]!,
            title: perusahaan[index]['title']!,
            penjelas: perusahaan[index]['penjelas']!,
          ),
        ),
      ),
    );
  }
}

class Slider2 extends StatelessWidget {
  final List selectedQuotesList;

  const Slider2({
    super.key,
    required this.selectedQuotesList,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // color: Colors.greenAccent,
      height: heightfit(150),
      width: SizeConfig.screenWidth,

      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: selectedQuotesList.length,
          itemBuilder: (context, index) => CardQuotes(
                title: selectedQuotesList[index]['title'],
                kutipan: selectedQuotesList[index]['kutipan'],
                images: selectedQuotesList[index]['image'],
                // pressDetails: () {},
              )),
    );
  }
}

class Slider1 extends StatefulWidget {
  final String titles;
  final Axis scrollDirectionss;
  final List<DataProducts> shopItem;

  const Slider1({
    super.key,
    required this.titles,
    required this.shopItem,
    required this.scrollDirectionss,
  });

  @override
  _Slider1State createState() => _Slider1State();
}

class _Slider1State extends State<Slider1> {
  @override
  void initState() {
    // setState(() {
    filterdataByPerusahaan(0);
    // });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // print(widget.shopItem[0].title);
    return Column(
      children: [
        Titlesy(
          judul: widget.titles,
          more: true,
          links: 'product',
        ),
        SizedBox(
          height: defaultPadding,
        ),
        Padding(
            padding: EdgeInsets.only(left: defaultPadding / 2),
            child: Container(
              padding: EdgeInsets.only(left: defaultPadding / 2),
              height: heightfit(180),
              width: SizeConfig.screenWidth,
              decoration: BoxDecoration(
                color: Colors.amber.shade500,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(0),
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(0)),
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      height: 160,
                      width: 30,
                      padding: EdgeInsets.all(defaultPadding / 3),
                      decoration: BoxDecoration(
                        // color: Colors.white,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10)),
                      ),
                      child: Stack(
                        children: [
                          Container(
                            padding: EdgeInsets.only(left: defaultPadding / 2),
                            height: 90,
                            width: 100,
                            decoration: BoxDecoration(
                              color: Colors.amber.shade100.withOpacity(.8),
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(0),
                                  bottomRight: Radius.circular(50),
                                  topLeft: Radius.circular(40),
                                  topRight: Radius.circular(0)),
                            ),
                          ),
                          Image.asset(
                            "assets/images/maskot/char_blanja.png",
                            height: 160,
                            width: 110,
                          ),
                          Container(
                              height: 160,
                              width: 60,
                              alignment: Alignment.bottomLeft,
                              child: ImgOnline(widget.shopItem[3].img,
                                  widget.shopItem[3].img))
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: defaultPadding / 3,
                  ),
                  Expanded(
                    flex: 5,
                    child: FittedBox(
                      child: SizedBox(
                        height: heightfit(230),
                        width: SizeConfig.screenWidth,
                        child: ListView.builder(
                            scrollDirection: widget.scrollDirectionss,
                            itemCount: 6,
                            itemBuilder: (context, index) => Container(
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                      left: (defaultPadding - 2) / 2,
                                      right: (defaultPadding - 2) / 2,
                                      bottom: defaultPadding,
                                      // bottom: defaultPadding / 2
                                    ),
                                    child: FittedBox(
                                      child: ProductListCard(
                                        index: widget.shopItem[index].id,
                                        data: widget.shopItem[index],
                                        press: () {
                                          // DataProducts data =
                                          //     widget.shopItem[index];
                                          // c.produkku.value = data;
                                          // Navigator.push(
                                          //         context,
                                          //         MaterialPageRoute(
                                          //           builder: (context) =>
                                          //               BodyDetails(),
                                          //         ))
                                          //     .then((value) =>
                                          //         setState(() => {}));
                                        },
                                        todetail: true,
                                      ),
                                    ),
                                  ),
                                )),
                      ),
                    ),
                  ),
                ],
              ),
            ))
      ],
    );
  }
}
