import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rawatt/Debug/searchKomoditiKalView.dart';
import 'package:rawatt/components/card_img.dart';
import 'package:rawatt/screens/product/cariHidroponik.dart';
import 'package:rawatt/size_config.dart';

import '../constants.dart';
import '../model/MenuRawatan/mdl_MenuRawatan.dart';
import '../model/dosis/mdl_dosisPengaplikasian.dart';
import '../model/jenisMesin/mdl_JenisMesin.dart';
import '../model/perusahaan/mdl_KatPerusahaan.dart';
import '../screens/convert/component/inisialisasi_var.dart';
import '../screens/convert/screens/dosis_pupuk_tanaman/dosis_pupuk_tanaman.dart';
import '../screens/home/screen_Portrait/layer2_home.dart';

List<KategoriPerusahaan> perusahaanList = dataKategoriPerusahaan;
List<PengaplikasianDosisPupuk> rawatanList = dataDosisPengaplikasianObj
    .where((element) =>
        element.id_MenuRawatan == c.indexMenuRawatan.value.toString())
    .toList();

class SearchKomoditi extends StatefulWidget {
  final ScrollController parentController;
  final ValueChanged<String> onTextChanged;
  final List datad;
  const SearchKomoditi(
      {super.key,
      required this.parentController,
      required this.onTextChanged,
      required this.datad});
  @override
  _SearchKomoditiState createState() => _SearchKomoditiState();
}

class _SearchKomoditiState extends State<SearchKomoditi> {
  final ScrollController _childController = ScrollController();

  // datakategorisubMenuRawatan
  //     .where((element) =>
  // element.id_MenuRawatan == c.indexMenuRawatan.value.toString())
  //     .toList();
  List<KategorisubMenuRawatan> filteredKomoditi = [];
  List _sayuranBuahData = [];
  String judul = "";
  final int _selectedIndex = 0;

  int? selectedPerusahaanId;
  List<KategorisubMenuRawatan> komoditiList = datakategorisubMenuRawatan
      .where((element) =>
          element.id_MenuRawatan == c.indexMenuRawatan.value.toString())
      .toList();

  @override
  void dispose() {
    super.dispose();
    _childController.removeListener(_syncParentScroll);
    _childController.dispose();
  }

  void searchKomoditi(String query) {
    final suggestions = komoditiList.where((komoditi) {
      final komoditiName = komoditi.namaKomoditi.toLowerCase();
      final input = query.toLowerCase();
      return komoditiName.contains(input);
    }).toList();

    setState(() {
      filteredKomoditi = suggestions;
      widget.onTextChanged(query);
    });
  }

  void filterByPerusahaan(int? perusahaanId) {
    setState(() {
      selectedPerusahaanId = perusahaanId;
      filteredKomoditi = perusahaanId == null
          ? komoditiList
          : komoditiList.where((komoditi) {
              return rawatanList.any((rawatan) =>
                  rawatan.idKomoditi == komoditi.id &&
                  rawatan.idPerusahaan == perusahaanId);
            }).toList();
    });
  }

  @override
  void initState() {
    super.initState();
    filteredKomoditi = komoditiList;
    _childController.addListener(_syncParentScroll);
    if (c.indexMenuRawatan.value == 1) {
      _sayuranBuahData = parseSayuranBuahData(dataJson);
      judul = dataKategoriMenuRawatan[c.indexMenuRawatan.value].namaMenurawatan;
    } else {
      judul = dataKategoriMenuRawatan[c.indexMenuRawatan.value].namaMenurawatan;
    }
  }

  void _syncParentScroll() {
    if (_childController.position.atEdge) {
      if (_childController.position.pixels == 0) {
        // At the top of the child scroll
        widget.parentController.animateTo(
          widget.parentController.offset - _childController.offset,
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInOut,
        );
      } else {
        // At the bottom of the child scroll
        widget.parentController.animateTo(
          widget.parentController.offset +
              (_childController.position.maxScrollExtent -
                  _childController.position.pixels),
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInOut,
        );
      }
    }
  }

  // Initial mode is set to "Tanah"
  bool isHydroponic = false;

  void onSwitchChanged(bool value) {
    setState(() {
      isHydroponic = value;
    });

    // Menjalankan fungsi yang sesuai dengan mode yang dipilih
    if (isHydroponic) {
      performHydroponicTask();
    } else {
      performSoilTask();
    }
  }

  String jenisMediatanam = "Hidroponik";
  void performHydroponicTask() {
    // Tambahkan logika khusus untuk mode Hidroponik di sini
    print("Mode Hidroponik dipilih. Mengaktifkan sistem hidroponik.");
    jenisMediatanam = "Tanah :";
  }

  void performSoilTask() {
    // Tambahkan logika khusus untuk mode Tanah di sini
    print("Mode Tanah dipilih. Mengaktifkan sistem tanah.");
    jenisMediatanam = "Hidroponik : ";
  }

  @override
  Widget build(BuildContext context) {
    judul = dataKategoriMenuRawatan[c.indexMenuRawatan.value].namaMenurawatan;
    print("indexMenuRawatan: ${c.indexMenuRawatan.value}");
    if (c.indexMenuRawatan.value == 1) {
      _sayuranBuahData = parseSayuranBuahData(dataJson);
      judul = dataKategoriMenuRawatan[c.indexMenuRawatan.value].namaMenurawatan;
    } else {
      judul = dataKategoriMenuRawatan[c.indexMenuRawatan.value].namaMenurawatan;
    }
    return NotificationListener<ScrollNotification>(
      onNotification: (ScrollNotification notification) {
        if (notification is ScrollEndNotification) {
          if (_childController.position.atEdge) {
            if (_childController.position.pixels == 0) {
              // At the top of the child scroll
              // widget.parentController.jumpTo(widget.parentController.offset - 30);
              widget.parentController.animateTo(
                widget.parentController.offset - SizeConfig.screenHeight! / 4,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            } else {
              // At the bottom of the child scroll
              // widget.parentController.jumpTo(widget.parentController.offset + 30);
              widget.parentController.animateTo(
                widget.parentController.offset + SizeConfig.screenHeight! / 4,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            }
          }
        }
        return false;
      },
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                // height: 200,
                width: SizeConfig.screenWidth! / 2,
                child: Titlesy(
                  judul: "Fitur Kalkulator",
                  more: true,
                  links: "",
                ),
              ),
            ],
          ),
          SizedBox(
            height: defaultPadding,
          ),
          SizedBox(
            height: SizeConfig.screenHeight! / 2.4,
            width: SizeConfig.screenWidth!,
            child: Container(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: defaultPadding / 2),
                decoration: BoxDecoration(
                  // gradient: LinearGradient(
                  //   begin: Alignment.topLeft,
                  //   end: Alignment.bottomRight,
                  //   transform: GradientRotation(17),
                  //   colors: <Color>[
                  //     warnas(dataKategoriMenuRawatan[c.indexMenuRawatan.value].colorku[0]),
                  //     warnas(dataKategoriMenuRawatan[c.indexMenuRawatan.value].colorku[0]),
                  //     warnas(dataKategoriMenuRawatan[c.indexMenuRawatan.value].colorku[2]),
                  //     warnas(dataKategoriMenuRawatan[c.indexMenuRawatan.value].colorku[2]),
                  //   ],
                  //   // Gradient from https://learnui.design/tools/gradient-generator.html
                  //   tileMode: TileMode.mirror,
                  // ),
                  // color: warnas(dataKategoriMenuRawatan[c.indexMenuRawatan.value].colorku[0]),
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
                ),
                child: Stack(
                  children: [
                    SizedBox(
                        height: SizeConfig.screenHeight! / 2.4,
                        width: SizeConfig.screenWidth!,
                        child: Imageku(
                            image: dataKategoriMenuRawatan[
                                    c.indexMenuRawatan.value]
                                .img_banner[2])),
                    Column(
                      children: [
                        Flexible(
                          flex: c.indexMenuRawatan.value == 1 ? 4 : 7,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              height: 220,
                              // width: SizeConfig.screenWidth,
                              //       child:SingleChildScrollView(
                              //           scrollDirection:Axis.horizontal,
                              //         child: Row(
                              //           children: [
                              //         // Row(
                              //         // children: [
                              //         //     ...rawatanList
                              //         //         .map((element) => element.idPerusahaan)
                              //         //         .toSet()
                              //         //         .map((idPerusahaan) {
                              //         //       final perusahaan = perusahaanList[idPerusahaan];
                              //         //       return Padding(
                              //         //         padding: EdgeInsets.only(right: defaultPadding / 2),
                              //         //         child: ChoiceChip(
                              //         //           labelPadding: EdgeInsets.symmetric(vertical: defaultPadding / 1.2),
                              //         //           avatar: Image.asset(perusahaan.img),
                              //         //           label: Text(""),
                              //         //           selected: selectedPerusahaanId == perusahaan.id,
                              //         //           onSelected: (selected) {
                              //         //             filterByPerusahaan(selected ? perusahaan.id : null);
                              //         //           },
                              //         //         ),
                              //         //       );
                              //         //     }),]),
                              //             ChoiceChip(
                              //               labelPadding: EdgeInsets.symmetric(vertical: defaultPadding / 1.2),
                              //               avatar: Image.asset(perusahaanList[3].img),
                              //               label: Text("Kumpulan Komoditi"),
                              //               selected: selectedPerusahaanId == 3,
                              //               onSelected: (selected) {
                              //                 Navigator.push(context,
                              //                     MaterialPageRoute(
                              //                         builder: (
                              //                             context) {
                              //                           return MyHomePagev();
                              //                         }));
                              //                 // filterByPerusahaan(selected ? 3 : null);
                              //               },
                              //             ),
                              //           ],
                              //         ),
                              //       )
                              //
                              //       // ListView.builder(
                              //       //   scrollDirection: Axis.horizontal,
                              //       //   itemCount:  rawatanList.map((element) => element.idPerusahaan).toList().toSet().length,
                              //       //
                              //       //   itemBuilder: (context, index) {
                              //       //     final perusahaan = perusahaanList[rawatanList.map((element) => element.idPerusahaan).toList().toSet().toList()[index]];
                              //       //     return Padding(
                              //       //       padding: EdgeInsets.only(right: defaultPadding/2),
                              //       //       child:
                              //       //
                              //       //       ChoiceChip(
                              //       //         labelPadding: EdgeInsets.symmetric(vertical: defaultPadding/1.2),
                              //       //         avatar: Image.asset(perusahaan.img),
                              //       //         label: Text(""),
                              //       //         selected: selectedPerusahaanId == perusahaan.id,
                              //       //         onSelected: (selected) {
                              //       //           filterByPerusahaan(selected ? perusahaan.id : null);
                              //       //         },
                              //       //       ),
                              //       //     );
                              //       //   },
                              //       // ),
                            ),
                          ),
                        ),
                        c.indexMenuRawatan.value == 1
                            ? Expanded(
                                flex: 2,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      child: AutoSizeText(
                                        jenisMediatanam,
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                          fontSize: 24,
                                        ),
                                        maxLines: 1,
                                        minFontSize: 10,
                                        maxFontSize: 30,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            : Container(),
                        Expanded(
                          flex: 9,
                          child: Padding(
                              padding: EdgeInsets.only(
                                  left: defaultPadding,
                                  right: defaultPadding,
                                  bottom: defaultPadding),
                              child:
                                  // List.generate(_sayuranBuahData.length, (index) {
                                  // return GestureDetector(
                                  // onTap: () {
                                  // setState(() {
                                  // _selectedIndex = index;
                                  // });
                                  // },
                                  // child: Container(
                                  // alignment: Alignment.center,
                                  // height: 60,
                                  // margin: EdgeInsets.symmetric(horizontal: 4.0),
                                  // padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                                  // decoration: BoxDecoration(
                                  // color: _selectedIndex == index ? Colors.green : Colors.white,
                                  // borderRadius: BorderRadius.circular(10.0),
                                  // border: Border.all(color: Colors.green),
                                  // ),
                                  // child: Text(
                                  //
                                  // _sayuranBuahData[index].category,
                                  // style: TextStyle(
                                  // color: _selectedIndex == index ? Colors.white : Colors.green,
                                  // fontSize: 20
                                  // ),
                                  // ),
                                  // ),
                                  // );

                                  ListView.separated(
                                padding: EdgeInsets.zero,
                                shrinkWrap: true, //
                                controller: _childController,
                                itemCount: (c.indexMenuRawatan.value == 1)
                                    ? _sayuranBuahData.length
                                    : 1,
                                itemBuilder: (context, index) {
                                  print("tid ${_sayuranBuahData.length}");

                                  return Padding(
                                    padding: EdgeInsets.all(defaultPadding / 2),
                                    child: Container(
                                        decoration: const BoxDecoration(
                                          color: Colors.white,
                                          // color: warnas(dataKategoriMenuRawatan[c.indexMenuRawatan.value].colorku[0]),
                                          borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(10),
                                              bottomRight: Radius.circular(10),
                                              topLeft: Radius.circular(10),
                                              topRight: Radius.circular(10)),
                                        ),
                                        child: (c.indexMenuRawatan.value == 1)
                                            ? ListTile(
                                                leading: Image(
                                                  image: AssetImage((index %
                                                              2 ==
                                                          0)
                                                      ? "assets/images/komoditi/kangkung.png"
                                                      : "assets/images/komoditi/rawit.png"),
                                                ),
                                                title: AutoSizeText(
                                                  (c.indexMenuRawatan.value ==
                                                          1)
                                                      ? _sayuranBuahData[index]
                                                          .category
                                                      : judul,
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: kTextColor,
                                                    fontSize: 12,
                                                  ),
                                                  maxLines: 1,
                                                  minFontSize: 10,
                                                  maxFontSize: 14,
                                                ),

                                                // title: Text(komoditi.namaKomoditi),
                                                subtitle: Text(
                                                    c.indexMenuRawatan.value ==
                                                            1
                                                        ? "Hidroponik"
                                                        : "Merawat"),
                                                // trailing: Imageku(image: "${(index%2 == 0)?"assets/images/komoditi/kangkung.png":"assets/images/komoditi/rawit.png"}"),

                                                onTap: () {
                                                  // Handle tap on Komoditi item
                                                  // Navigator.push(
                                                  //   context,
                                                  //   MaterialPageRoute(
                                                  //     builder: (context) =>
                                                  //         DetailKomoditiScreen(komoditi: komoditi),
                                                  //   ),
                                                  // );

                                                  Navigator.push(context,
                                                      MaterialPageRoute(
                                                          builder: (context) {
                                                    c.namaTanaman.value =
                                                        (c.indexMenuRawatan
                                                                    .value ==
                                                                1)
                                                            ? _sayuranBuahData[
                                                                    index]
                                                                .category
                                                            : judul;
                                                    return DosisPupukTanamanbuah(
                                                      indexsubmenu: 0,
                                                      namaCategoryTanam:
                                                          (c.indexMenuRawatan
                                                                      .value ==
                                                                  1)
                                                              ? _sayuranBuahData[
                                                                      index]
                                                                  .category
                                                              : judul,
                                                      // indexsubmenu: komoditi.id,
                                                      indexmenu: c
                                                          .indexMenuRawatan
                                                          .value,
                                                    );
                                                  }));

                                                  if (c.indexMenuRawatan
                                                          .value ==
                                                      1) {
                                                    c.indexsubMenuRawatan
                                                        .value = 0;
                                                    showDialog(
                                                        context: context,
                                                        barrierDismissible:
                                                            false,
                                                        builder: (BuildContext
                                                            context) {
                                                          return AlertDialog(
                                                            title: Center(
                                                                child: Text(
                                                              'Pengaplikasian',
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontSize: 30),
                                                            )),
                                                            content: Text(
                                                              "Perhitungan ini menggunakan tabel abmix yang sudah ada, jadi dengan menggunakan ini kalian harus tetap memperhatikan dosis ABmix yang sesuai dengan keperluan tanaman kalian dengan pH meter.",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .black38),
                                                            ),
                                                            actions: <Widget>[
                                                              ElevatedButton(
                                                                onPressed: () {
                                                                  Navigator.of(
                                                                          context)
                                                                      .pop();
                                                                },
                                                                style: ElevatedButton
                                                                    .styleFrom(
                                                                        padding:
                                                                            EdgeInsets.all(
                                                                                1),
                                                                        shape:
                                                                            RoundedRectangleBorder(
                                                                          borderRadius:
                                                                              BorderRadius.circular(10),
                                                                        ),
                                                                        elevation:
                                                                            0,
                                                                        backgroundColor:
                                                                            Colors.orange),
                                                                child: Padding(
                                                                  padding: EdgeInsets.all(
                                                                      heightfit(
                                                                          defaultPadding /
                                                                              2)),
                                                                  child: Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      Icon(
                                                                        Icons
                                                                            .check_circle,
                                                                        size:
                                                                            15,
                                                                        color: Colors
                                                                            .white,
                                                                      ),
                                                                      Text("OK",
                                                                          style:
                                                                              TextStyle(color: Colors.black))
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          );
                                                        });
                                                    // print("index komoditi :${komoditi.id} ${c.indexsubMenuRawatan.value}");
                                                  } else {
                                                    Container();
                                                  }
                                                },
                                              )
                                            : ElevatedButton(
                                                onPressed: () {
                                                  Navigator.push(context,
                                                      MaterialPageRoute(
                                                          builder: (context) {
                                                    c.namaTanaman.value =
                                                        (c.indexMenuRawatan
                                                                    .value ==
                                                                1)
                                                            ? _sayuranBuahData[
                                                                    index]
                                                                .category
                                                            : judul;
                                                    return DosisPupukTanamanbuah(
                                                      indexsubmenu: 0,
                                                      namaCategoryTanam:
                                                          (c.indexMenuRawatan
                                                                      .value ==
                                                                  1)
                                                              ? _sayuranBuahData[
                                                                      index]
                                                                  .category
                                                              : judul,
                                                      // indexsubmenu: komoditi.id,
                                                      indexmenu: c
                                                          .indexMenuRawatan
                                                          .value,
                                                    );
                                                  }));
                                                },
                                                style: ElevatedButton.styleFrom(
                                                    padding: EdgeInsets.all(1),
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                    elevation: 0,
                                                    backgroundColor: warnas(
                                                        dataKategoriMenuRawatan[c
                                                                .indexMenuRawatan
                                                                .value]
                                                            .colorku[2])),
                                                child: Container(
                                                  height: 150,
                                                  decoration: BoxDecoration(
                                                    gradient: LinearGradient(
                                                      begin: Alignment.topLeft,
                                                      end:
                                                          Alignment.bottomRight,
                                                      transform:
                                                          GradientRotation(17),
                                                      colors: <Color>[
                                                        warnas(dataKategoriMenuRawatan[c
                                                                .indexMenuRawatan
                                                                .value]
                                                            .colorku[0]),
                                                        warnas(dataKategoriMenuRawatan[c
                                                                .indexMenuRawatan
                                                                .value]
                                                            .colorku[0]),
                                                        warnas(dataKategoriMenuRawatan[c
                                                                .indexMenuRawatan
                                                                .value]
                                                            .colorku[2]),
                                                        warnas(dataKategoriMenuRawatan[c
                                                                .indexMenuRawatan
                                                                .value]
                                                            .colorku[2]),
                                                      ],
                                                      // Gradient from https://learnui.design/tools/gradient-generator.html
                                                      tileMode: TileMode.mirror,
                                                    ),
                                                    // color: warnas(dataKategoriMenuRawatan[widget.indexmenu].colorku[0]),
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    10),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    10),
                                                            topLeft:
                                                                Radius.circular(
                                                                    10),
                                                            topRight:
                                                                Radius.circular(
                                                                    10)),
                                                  ),
                                                  child: Column(
                                                    children: [
                                                      ListTile(
                                                        tileColor: Colors.white,

                                                        leading: SizedBox(
                                                            height: 70,
                                                            width: 70,
                                                            child: Image.asset(
                                                                dataKategoriMenuRawatan[c
                                                                        .indexMenuRawatan
                                                                        .value]
                                                                    .img)),
                                                        title: Text(
                                                          (c.indexMenuRawatan
                                                                      .value ==
                                                                  1)
                                                              ? _sayuranBuahData[
                                                                      index]
                                                                  .category
                                                              : judul,
                                                          style: TextStyle(
                                                              fontSize: 16,
                                                              color:
                                                                  Colors.white),
                                                        ),
                                                        // title: Text(komoditi.namaKomoditi),
                                                        subtitle: Text(
                                                          c.indexMenuRawatan
                                                                      .value ==
                                                                  1
                                                              ? "Hidroponik"
                                                              : "Merawat",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white),
                                                        ),
                                                        // trailing: Imageku(image: "${(index%2 == 0)?"assets/images/komoditi/kangkung.png":"assets/images/komoditi/rawit.png"}"),

                                                        onTap: () {
                                                          // Handle tap on Komoditi item
                                                          // Navigator.push(
                                                          //   context,
                                                          //   MaterialPageRoute(
                                                          //     builder: (context) =>
                                                          //         DetailKomoditiScreen(komoditi: komoditi),
                                                          //   ),
                                                          // );

                                                          Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                                  builder:
                                                                      (context) {
                                                            c.namaTanaman
                                                                .value = (c
                                                                        .indexMenuRawatan
                                                                        .value ==
                                                                    1)
                                                                ? _sayuranBuahData[
                                                                        index]
                                                                    .category
                                                                : judul;
                                                            return DosisPupukTanamanbuah(
                                                              indexsubmenu: 0,
                                                              namaCategoryTanam: (c
                                                                          .indexMenuRawatan
                                                                          .value ==
                                                                      1)
                                                                  ? _sayuranBuahData[
                                                                          index]
                                                                      .category
                                                                  : judul,
                                                              // indexsubmenu: komoditi.id,
                                                              indexmenu: c
                                                                  .indexMenuRawatan
                                                                  .value,
                                                            );
                                                          }));

                                                          if (c.indexMenuRawatan
                                                                  .value ==
                                                              1) {
                                                            c.indexsubMenuRawatan
                                                                .value = 0;
                                                            showDialog(
                                                                context:
                                                                    context,
                                                                barrierDismissible:
                                                                    false,
                                                                builder:
                                                                    (BuildContext
                                                                        context) {
                                                                  return AlertDialog(
                                                                    title: Center(
                                                                        child: Text(
                                                                      'Pengaplikasian',
                                                                      style: TextStyle(
                                                                          fontWeight: FontWeight
                                                                              .bold,
                                                                          fontSize:
                                                                              30),
                                                                    )),
                                                                    content:
                                                                        Text(
                                                                      "Perhitungan ini menggunakan Perbandingan yang sudah ditetapkan dari perusahaan per hektar atau per pohon, jadi dengan menggunakan ini kalian harus tetap memperhatikan dosis yang sesuai dengan keperluan tani kalian.",
                                                                      style: TextStyle(
                                                                          color:
                                                                              Colors.black38),
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
                                                                              borderRadius: BorderRadius.circular(10),
                                                                            ),
                                                                            elevation: 0,
                                                                            backgroundColor: Colors.orange),
                                                                        child:
                                                                            Padding(
                                                                          padding:
                                                                              EdgeInsets.all(heightfit(defaultPadding / 2)),
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
                                                                              Text("OK", style: TextStyle(color: Colors.black))
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  );
                                                                });
                                                            // print("index komoditi :${komoditi.id} ${c.indexsubMenuRawatan.value}");
                                                          } else {
                                                            Container();
                                                          }
                                                        },
                                                      ),
                                                      Padding(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal:
                                                                    defaultPadding),
                                                        child: AutoSizeText(
                                                          "Hitung ${dataKategoriMenuRawatan[c.indexMenuRawatan.value].fitur.last}",
                                                          style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Colors.white,
                                                            fontSize: 20,
                                                          ),
                                                          maxLines: 1,
                                                          minFontSize: 10,
                                                          maxFontSize: 20,
                                                        ),
                                                      ),
                                                      Container(
                                                        padding: EdgeInsets.only(
                                                            top: defaultPadding,
                                                            right:
                                                                defaultPadding),
                                                        alignment: Alignment
                                                            .bottomRight,
                                                        child: Text(
                                                          "電卓",
                                                          style: TextStyle(
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color:
                                                                  Colors.white),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              )),
                                  );
                                },
                                separatorBuilder:
                                    (BuildContext context, int index) =>
                                        SizedBox(height: defaultPadding / 2),
                              )),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DetailKomoditiScreen extends StatelessWidget {
  final KategorisubMenuRawatan komoditi;

  const DetailKomoditiScreen({super.key, required this.komoditi});

  @override
  Widget build(BuildContext context) {
    List<PengaplikasianDosisPupuk> relatedRawatan = rawatanList
        .where((rawatan) => rawatan.idKomoditi == komoditi.id)
        .toList();
    List<KategoriPerusahaan> relatedPerusahaan = relatedRawatan
        .map((rawatan) {
          return perusahaanList.firstWhere(
              (perusahaan) => perusahaan.id == rawatan.idPerusahaan);
        })
        .toSet()
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(komoditi.namaKomoditi),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(komoditi.img),
            SizedBox(height: 8),
            Text(
              komoditi.namaKomoditi,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text('Media: ${komoditi.media}'),
            SizedBox(height: 8),
            Text('Variable Ketetapan: ${komoditi.variableKetetapan}'),
            SizedBox(height: 8),
            Text('Perusahaan Terkait:',
                style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            ...relatedPerusahaan.map((perusahaan) {
              return ListTile(
                leading: Image.asset(perusahaan.img),
                title: Text(perusahaan.perusahaan),
              );
            }),
            SizedBox(height: 8),
            Expanded(
              child: ListView.builder(
                itemCount: relatedRawatan.length,
                itemBuilder: (context, index) {
                  final rawatan = relatedRawatan[index];
                  return ListTile(
                    title: Text(rawatan.jenisPemupukan),
                    subtitle: Text('Satuan: ${rawatan.satuan}'),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
