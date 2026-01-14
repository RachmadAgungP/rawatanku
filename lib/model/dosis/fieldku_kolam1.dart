import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../components/card_expanded.dart';
import '../../components/inputan.dart';
import '../../constants.dart';
import '../../screens/convert/component/inisialisasi_var.dart';
import '../../screens/convert/screens/dosis_pupuk_tanaman/dosis_pupuk_tanaman.dart';
import '../../screens/details/component/component.dart';
import '../MenuRawatan/mdl_MenuRawatan.dart';
import '../datafix.dart';
import '../jenisMesin/mdl_JenisMesin.dart';
import '../kalkulator/mdl_KatRumus.dart';
import 'fieldku_campur.dart';

class FieldskuMainKolam extends StatefulWidget {
  final Function(List<MyData> dataParent) onStateChange;
  final String judul;
  final String penjelas;
  final bool waktu;
  final String Function(int indexk) kesimpulanPerKonten;
  final String Function(String hasil) hasilakhir;
  final String judulchild;
  final String hargamulti;
  final int indexsubmenu;
  final int indexmenu;
  final Widget addWidget;
  final int selectidkal;

  const FieldskuMainKolam(
      {super.key,
      required this.onStateChange,
      required this.judul,
      required this.penjelas,
      required this.hasilakhir,
      required this.kesimpulanPerKonten,
      required this.judulchild,
      required this.indexsubmenu,
      required this.indexmenu,
      required this.hargamulti,
      required this.addWidget,
      required this.waktu,
      required this.selectidkal});

  @override
  State<FieldskuMainKolam> createState() => _FieldskuMainState();
}

int indexProv = 0;

List<dynamic> drowndownk = [];

// String luasLKolam = "0.0";
ScrollController _childScrollController = ScrollController();
ScrollController _parentScrollController = ScrollController();

List<MyData> filterdataobjectKolam() {
  return parentDataKolam
      .where((element) => element.indexmenu == c.indexMenuRawatan.value)
      .toList();
}

// MyData databaruKolam = dataInputDouble[0];
// MyData databaruKolam = dataInputDouble[0];

MyData databaruKolam = parentDataKolam[0];
List<DataObjHasilTakaran>? dataTakaranDosisKolam;
String hasilAkhirKolam = "0";

Map deepCopyMap(Map original) {
  Map copiedMap = {};
  original.forEach((key, value) {
    if (value is Map) {
      // Jika nilai adalah map, rekursif buat deep copy
      copiedMap[key] = deepCopyMap(value);
    } else if (value is TextEditingController) {
      // Jika nilai adalah TextEditingController, buat salinan baru
      copiedMap[key] = value;
    } else {
      // Jika nilai adalah tipe data lain, salin nilai langsung
      copiedMap[key] = value;
    }
  });
  return copiedMap;
}

class _FieldskuMainState extends State<FieldskuMainKolam> {
  @override
  void initState() {
    super.initState();
    _childScrollController.addListener(() {
      if (_childScrollController.position.pixels ==
          _childScrollController.position.maxScrollExtent) {
        // Child ListView has reached the end, scroll the parent ListView
        _parentScrollController.animateTo(
          _parentScrollController.position.pixels + 100,
          // You can adjust this value
          duration: const Duration(milliseconds: 500),
          // You can adjust the duration
          curve: Curves.ease,
        );
      }
    });

    if (filterdataobjectKolam().isEmpty) {
      databaruKolam = MyData(
          komoditi: "Jenis Pemupukan",
          boolKom: false,
          boolKomHarga: false,
          visiKom: false,
          pupuk: [
            Pupukw(
                boolPup: false,
                visiPup: false,
                namaPupu:
                    dataKategoriMenuRawatan[widget.indexmenu].perlengkapan[0],
                watt: '0',
                LamaListring: '0',
                Rumus: '0',
                hasil: '0',
                img: dataKategoriMenuRawatan[widget.indexmenu].img_banner[1])
          ],
          luas: "0",
          visiKomHarga: false,
          dataHarga: golonganListriks(widget.indexsubmenu, widget.indexmenu,
              (widget.hargamulti == "no") ? "no" : "yes"),
          hasilTotal: "0.0",
          //ini penting
          hasilRp: 0,
          indexsubmenu: widget.indexsubmenu,
          indexmenu: widget.indexmenu,
          idmediatanam: c.selectedItemCalcT.value,
          rumus: dataKategoriMenuRawatan[widget.indexmenu]
              .rumus[c.selectedItemCalcT.value],
          multi: (widget.hargamulti == "no") ? false : true,
          kesimpulansub: "",
          kesimpulanAkhir: "kesimpulanAkhir",
          varii: getDataTakaranDosisTanamanGNew(
              c.indexsubMenuRawatan.value, "(LMt/10000)*JPk", 0.0.toString()),
          kategoriRumusKu: List.of(FdatakategoryRumus(
              c.indexMenuRawatan.value,
              List<KategoriRumus>.from(List.generate(
                kategoriRumus.length,
                (i) => KategoriRumus(
                  id: i,
                  idKalkulasi: kategoriRumus[i]["idKalkulasi"],
                  idMediaTanam: kategoriRumus[i]["idMediaTanam"],
                  vari: kategoriRumus[i]["vari"],
                  nama: kategoriRumus[i]["nama"],
                  rumus: kategoriRumus[i]["rumus"],
                  valuess: kategoriRumus[i]["value"],
                  // fieldValue: kategoriRumus[i]["fieldValue"],
                  img: kategoriRumus[i]["img"],
                  id_MenuRawatan: kategoriRumus[i]["id_MenuRawatan"],
                ),
              )),
              c.selectedItemCalcT.value)),
          propertyLainnya:
              deepCopyMap(tambahanPropertyKal[c.indexMenuRawatan.value]),
          id: 0,
          namaId: '');

      if (parentDataKolam.isEmpty) {
        parentDataKolam = [databaruKolam];
      } else {
        if (parentDataKolam.isEmpty) {
          parentDataKolam.add(databaruKolam);
          filterdataobjectKolam().add(databaruKolam);
        }
      }
    } else {}

    widget.onStateChange(filterdataobjectKolam());
    if (c.indexMenuRawatan.value == 1) {
      if (c.AcontrolHarga.value!.isNotEmpty) {
        print(
            "field update ${c.AcontrolHarga.value[0].length == 0}  ${dataHargafix(
          c.indexdropdownPrushn.value,
          filterCategorybyJenisPemupukan(
              c.indexdropdownPrushn.value)[c.indexdropdownjenisPemupukan.value],
        )}");

        List asp = [];
        Map asp1 = {};
        List.generate(
            dataTakaranDosisKolam!.map((e) => e.idPerusahaan).toList().length,
            (index1) {
          asp.add(dataTakaranDosisKolam!
              .where((element) => element.idPerusahaan == index1)
              .map((e) => e.dataHarga)
              .map((e) {
            List.generate(e.keys.toList().length, (index2) {
              asp1["${e.keys.toList()[index2]}"] =
                  e.values.toList()[index2].toString();
              // TextEditingController(
              // text: e.values.toList()[index2].toString()!);
            });
            return asp1;
          }));
        });

        print(
            "gioal ${asp.map((e) => e)} ${c.AcontrolHarga.value[c.indexdropdownPrushn.value].toList()[c.indexdropdownjenisPemupukan.value].values.toList()}");
      } else {
        dataTakaranDosisKolam = getDataTakaranDosisTanamanGNew(
            c.indexsubMenuRawatan.value, "(LMt/10000)*JPk", 0.0.toString());

        // c.AcontrolHarga.value = List.generate(
        //   dataTakaranDosisKolam!.map((e) => e.dataHarga).toList().length,
        //   (index) => Map.fromEntries(List.generate(
        //       dataTakaranDosisKolam!.map((e) => e.dataHarga).toList()[index].length,
        //       (index1) => MapEntry(
        //           "${dataTakaranDosisKolam!.map((e) => e.dataHarga).toList()[index].keys.toList()[index1]}",
        //           TextEditingController(
        //               text: dataTakaranDosisKolam!
        //                   .map((e) => e.dataHarga)
        //                   .toList()[index]
        //                   .values
        //                   .toList()[index1]
        //                   .toString()!)))),
        // );
        List asp = [];
        List.generate(
            dataTakaranDosisKolam!.map((e) => e.idPerusahaan).toList().length,
            (index1) {
          asp.add(dataTakaranDosisKolam!
              .where((element) => element.idPerusahaan == index1)
              .map((e) => e.dataHarga)
              .map((e) {
            Map asp1 = {};
            List.generate(e.keys.toList().length, (index2) {
              asp1["${e.keys.toList()[index2]}"] =
                  e.values.toList()[index2].toString();
              // TextEditingController(
              // text: e.values.toList()[index2].toString()!);
            });
            return asp1;
          }));
        });
        print("giol ${asp.map((e) => List.of(e).map((e) => e.keys))}");

        c.AcontrolHarga.value = asp;
      }

      // print(
      //     "field update 0 ${c.AcontrolHarga.value!.map((e) => e.keys).length} ${c.AcontrolHarga.value!.map((e) => e.keys)}  ${c.AcontrolHarga.value}");
    }
  }

  bool isDialogOpen = false;

  int indexPW = 0;
  int indexPP = 0;
  int indexSelectmedia = 0;
  String kesimpulanHasil = "0";

  String namasudah = "";
// bool ketemu = false;
  @override
  Widget build(BuildContext context) {
    widget.hasilakhir;
    // setState(() {
    // dataInputDouble[0] = databaruKolam;

    if (parentDataKolam.isEmpty) {
      parentDataKolam = [databaruKolam];
    }

    if (parentDataKolam
        .where((element) =>
            element.indexmenu == widget.indexmenu &&
            element.indexsubmenu == widget.indexsubmenu &&
            element.idmediatanam == c.selectedItemCalcT.value)
        .isEmpty) {
      databaruKolam = MyData(
          komoditi: "Jenis Pemupukan",
          boolKom: false,
          boolKomHarga: false,
          visiKom: false,
          pupuk: [
            Pupukw(
                boolPup: false,
                visiPup: false,
                namaPupu:
                    dataKategoriMenuRawatan[widget.indexmenu].perlengkapan[0],
                watt: '0',
                LamaListring: '0',
                Rumus: '0',
                hasil: '0',
                img: dataKategoriMenuRawatan[widget.indexmenu].img_banner[1])
          ],
          luas: "0",
          visiKomHarga: false,
          dataHarga: golonganListriks(widget.indexsubmenu, widget.indexmenu,
              (widget.hargamulti == "no") ? "no" : "yes"),
          hasilTotal: "0.0",
          //ini penting
          hasilRp: 0,
          indexsubmenu: widget.indexsubmenu,
          indexmenu: widget.indexmenu,
          idmediatanam: c.selectedItemCalcT.value,
          rumus: dataKategoriMenuRawatan[widget.indexmenu]
              .rumus[c.selectedItemCalcT.value],
          multi: (widget.hargamulti == "no") ? false : true,
          kesimpulansub: "",
          kesimpulanAkhir: "kesimpulanAkhir",
          varii: getDataTakaranDosisTanamanGNew(
              c.indexsubMenuRawatan.value, "(LMt/10000)*JPk", 0.0.toString()),
          kategoriRumusKu: List.of(FdatakategoryRumus(
              c.indexMenuRawatan.value,
              List<KategoriRumus>.from(List.generate(
                kategoriRumus.length,
                (i) => KategoriRumus(
                  id: i,
                  idKalkulasi: kategoriRumus[i]["idKalkulasi"],
                  idMediaTanam: kategoriRumus[i]["idMediaTanam"],
                  vari: kategoriRumus[i]["vari"],
                  nama: kategoriRumus[i]["nama"],
                  rumus: kategoriRumus[i]["rumus"],
                  valuess: kategoriRumus[i]["value"],
                  // fieldValue: kategoriRumus[i]["fieldValue"],
                  img: kategoriRumus[i]["img"],
                  id_MenuRawatan: kategoriRumus[i]["id_MenuRawatan"],
                ),
              )),
              c.selectedItemCalcT.value)),
          propertyLainnya:
              deepCopyMap(tambahanPropertyKal[c.indexMenuRawatan.value]),
          id: 0,
          namaId: '');
      parentDataKolam.add(databaruKolam);
      print(
          "1 banyak data parentDataKolam ${c.selectedItemCalcT.value} ${parentDataKolam.length}");
    } else {
      print(
          "banyak data parentDataKolam ${c.selectedItemCalcT.value} ${filterdataobjectKolam().length}");
    }

    return Scrollbar(
        child: SingleChildScrollView(
      controller: _parentScrollController,
      child: Center(
        child: Padding(
          padding: EdgeInsets.only(
              top: defaultPadding / 2,
              left: defaultPadding,
              right: defaultPadding,
              bottom: defaultPadding / 2),
          child: Stack(
            children: [
              Container(
                // height: SizeConfig.screenHeight! / 1.2,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(20),
                    ),
                    // border: Border.all(color: kTextColor.withOpacity(.8), width: .2),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 10,
                          offset: const Offset(0, 7),
                          color: Colors.black.withOpacity(.5))
                    ]),
                child: Padding(
                  padding: EdgeInsets.all(defaultPadding),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        dataKategoriMenuRawatan[widget.indexmenu].fitur[0],
                        style: TextStyle(
                            fontSize: 28,
                            color: warnas(
                                dataKategoriMenuRawatan[widget.indexmenu]
                                    .colorku[0]),
                            fontWeight: FontWeight.w700),
                      ),
                      const Divider(
                        color: Colors.black54,
                      ),
                      AutoSizeText(
                        widget.judul,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontStyle: FontStyle.italic,
                            fontSize: 24),
                        minFontSize: 10,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(
                        height: defaultPadding / 2,
                      ),
                      GridView.builder(
                          shrinkWrap: true,
                          // Menyesuaikan ukuran dengan jumlah item
                          physics: const NeverScrollableScrollPhysics(),
                          padding:
                              EdgeInsets.symmetric(vertical: defaultPadding),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                          ),
                          itemCount: filterdataobjectKolam().length,
                          itemBuilder: (BuildContext context, int indexK) {
                            print("kol${filterdataobjectKolam().length}");
                            // ListView.builder(
                            //     itemCount: dataParentfilterfilter.toList().length,
                            //     shrinkWrap: true,
                            //     // Menyesuaikan ukuran dengan jumlah item
                            //     physics: NeverScrollableScrollPhysics(),
                            //     scrollDirection: Axis.vertical,
                            //     // padding: const EdgeInsets.symmetric(horizontal: 56),
                            //     addRepaintBoundaries: true,
                            //     itemBuilder: (context, indexK) {
                            // final item = dataParentfilterfilter.toList()[index % widget.items.length];
                            return FittedBox(
                              child: ExpandingCards(
                                height: 400,
                                indexFix: indexK,
                                len: filterdataobjectKolam().length,
                                gridview: true,
                                axisCount: 2,
                                onchange: (indekpuu) {
                                  if (indexK ==
                                      filterdataobjectKolam().length - 1) {
                                  } else {
                                    setState(() {
                                      indexSelectmedia = indexK;
                                    });
                                  }

                                  print(
                                      "indexKnya Apah $indekpuu $indexK ${filterdataobjectKolam().length - 1}");
                                },
                                dialog: Dialogku(
                                  onStateChange: () {
                                    print("cencell ");
                                    // showAlertDialog(context);
                                    // Future.microtask(() {
                                    //   setState(() {
                                    //
                                    //   });
                                    // });
                                  },
                                  indexKomo: indexK,
                                  fields: Fieldkuparent(
                                    index: indexK,
                                    edit_semua: false,
                                    onStateChangePupukw: (int indexPPS) {
                                      // setState(() {
                                      indexPP = indexPPS;

                                      hasilRps(indexK, widget.indexsubmenu,
                                          filterdataobjectKolam());
                                      // });
                                    },
                                    Judul: widget.judul,
                                    judulchild: widget.judulchild,
                                    penjelas: '',
                                    dataParent: filterdataobjectKolam(),
                                    addWidget: widget.addWidget,
                                    waktu: widget.waktu,
                                  ),
                                  nilaiTotal: "5",
                                  indexPupu: indexPP,
                                  indexmenu: widget.indexmenu,
                                  indexsubmenu: widget.indexsubmenu,
                                  dataParent: filterdataobjectKolam(),
                                ),
                                img: dataKategoriMenuRawatan[widget.indexmenu]
                                    .img_banner[1],
                                title: filterdataobjectKolam()[indexK].namaId,
                                subtitle: filterdataobjectKolam()
                                    .toList()[indexK]
                                    .luas,
                                penjelas: filterdataobjectKolam()
                                    .toList()[indexK]
                                    .hasilTotal,
                                tambah: (String s) {
                                  // print(
                                  //     "tambah sebelum ${indexK} ${parentDataKolam.where((element) => element.indexmenu == widget.indexmenu && element.indexsubmenu == widget.indexsubmenu && element.idmediatanam == c.selectedItemCalcT.value).toList().length} => ${parentDataKolam.where((element) => element.indexmenu == filterdataobjectKolam()[indexK].indexmenu && element.indexsubmenu == filterdataobjectKolam()[indexK].indexsubmenu && element.idmediatanam == filterdataobjectKolam()[indexK].idmediatanam).toList().map((e) => e.id)}");

                                  // setState(() {
                                  showDialog<String>(
                                      context: context,
                                      builder:
                                          (BuildContext context) => AlertDialog(
                                                title:
                                                    const Text('Nama Object'),
                                                content: SizedBox(
                                                  width: 100,
                                                  height: 120,
                                                  child: Column(
                                                    children: [
                                                      Fields(
                                                        controller:
                                                            TextEditingController(
                                                                text: filterdataobjectKolam()[
                                                                        indexK]
                                                                    .namaId),
                                                        satuan: "",
                                                        title: "Berikan nama",
                                                        tema: Colors.black,
                                                        inputType:
                                                            TextInputType.text,
                                                        onStateChange:
                                                            (values) {
                                                          setState(() {
                                                            if (filterdataobjectKolam()
                                                                .map((e) =>
                                                                    e.namaId)
                                                                .contains(
                                                                    values)) {
                                                              showDialog<
                                                                      String>(
                                                                  context:
                                                                      context,
                                                                  builder: (BuildContext
                                                                          context) =>
                                                                      AlertDialog(
                                                                        title: const Text(
                                                                            'Nama Object Sudah ada'),
                                                                        content:
                                                                            Container(
                                                                          child:
                                                                              Text(
                                                                            "Coba dengan nama lain",
                                                                            style:
                                                                                TextStyle(fontSize: 28, fontWeight: FontWeight.w700),
                                                                          ),
                                                                        ),
                                                                        actions: <Widget>[
                                                                          // TextButton(
                                                                          //   onPressed: () =>
                                                                          //       Navigator.pop(context, 'Cancel'),
                                                                          //   child: const Text('Cancel'),
                                                                          // ),
                                                                          TextButton(
                                                                            onPressed: () =>
                                                                                Navigator.pop(context, 'OK'),
                                                                            child:
                                                                                const Text('OK'),
                                                                          ),
                                                                          // Text(
                                                                          //   namasudah,
                                                                          //   style: TextStyle(
                                                                          //       fontSize: heightfit(28),
                                                                          //       fontWeight: FontWeight.w700),
                                                                          // ),
                                                                        ],
                                                                      ));
                                                            } else {
                                                              namasudah = "";
                                                              if (filterdataobjectKolam()
                                                                      .length ==
                                                                  1) {
                                                                c.ObjectIndexSelectedEdit
                                                                    .value = 0;
                                                              }
                                                              print(
                                                                  "TAMBAH=>${c.ObjectIndexSelectedEdit.value}");
                                                              c.namaObj.value =
                                                                  values;
                                                              if (filterdataobjectKolam()
                                                                  .isEmpty) {
                                                                print(
                                                                    "JIKA KOSONG filterdataobjectKolam() ${filterdataobjectKolam()}");
                                                                parentDataKolam
                                                                    .add(MyData(
                                                                  komoditi:
                                                                      "44",
                                                                  boolKom:
                                                                      false,
                                                                  boolKomHarga:
                                                                      false,
                                                                  visiKom:
                                                                      false,
                                                                  pupuk: [
                                                                    Pupukw(
                                                                        boolPup:
                                                                            false,
                                                                        visiPup:
                                                                            false,
                                                                        namaPupu:
                                                                            dataKategoriMenuRawatan[widget.indexmenu].perlengkapan[
                                                                                0],
                                                                        watt:
                                                                            '0',
                                                                        LamaListring:
                                                                            '0',
                                                                        Rumus:
                                                                            '',
                                                                        hasil:
                                                                            '0',
                                                                        img: dataKategoriMenuRawatan[widget.indexmenu]
                                                                            .img_banner[1])
                                                                  ],
                                                                  luas: "",
                                                                  visiKomHarga:
                                                                      false,
                                                                  dataHarga:
                                                                      drowndownk,
                                                                  hasilTotal:
                                                                      '0',
                                                                  hasilRp: 0,
                                                                  indexsubmenu: c
                                                                      .indexsubMenuRawatan
                                                                      .value,
                                                                  indexmenu: widget
                                                                      .indexmenu,
                                                                  idmediatanam: c
                                                                      .selectedItemCalcT
                                                                      .value,
                                                                  rumus: dataKategoriMenuRawatan[widget
                                                                              .indexmenu]
                                                                          .rumus[
                                                                      c.selectedItemCalcT
                                                                          .value],
                                                                  multi: dataKategoriMenuRawatan[
                                                                          widget
                                                                              .indexmenu]
                                                                      .multi,
                                                                  kesimpulansub:
                                                                      '',
                                                                  kesimpulanAkhir:
                                                                      '',
                                                                  // varii: variableObjs()!,
                                                                  varii: getDataTakaranDosisTanamanGNew(
                                                                      c.indexsubMenuRawatan
                                                                          .value,
                                                                      "(LMt/10000)*JPk",
                                                                      0.0.toString()),
                                                                  kategoriRumusKu: List.of(
                                                                      FdatakategoryRumus(
                                                                          c.indexMenuRawatan
                                                                              .value,
                                                                          List<KategoriRumus>.from(List
                                                                              .generate(
                                                                            kategoriRumus.length,
                                                                            (i) =>
                                                                                KategoriRumus(
                                                                              id: i,
                                                                              idKalkulasi: kategoriRumus[i]["idKalkulasi"],
                                                                              idMediaTanam: kategoriRumus[i]["idMediaTanam"],
                                                                              vari: kategoriRumus[i]["vari"],
                                                                              nama: kategoriRumus[i]["nama"],
                                                                              rumus: kategoriRumus[i]["rumus"],
                                                                              valuess: kategoriRumus[i]["value"],
                                                                              // fieldValue: kategoriRumus[i]
                                                                              //     ["fieldValue"],
                                                                              img: kategoriRumus[i]["img"],
                                                                              id_MenuRawatan: kategoriRumus[i]["id_MenuRawatan"],
                                                                            ),
                                                                          )),
                                                                          c.selectedItemCalcT
                                                                              .value)),
                                                                  propertyLainnya:
                                                                      deepCopyMap(tambahanPropertyKal[c
                                                                          .indexMenuRawatan
                                                                          .value]),
                                                                  id: parentDataKolam
                                                                          .map((e) => e
                                                                              .id)
                                                                          .last +
                                                                      1,
                                                                  namaId: c
                                                                      .namaObj
                                                                      .value,
                                                                ));
                                                                filterdataobjectKolam()[
                                                                            indexK]
                                                                        .namaId =
                                                                    values;
                                                                print(
                                                                    "JIKA KOSONG filterdataobjectKolam() ADA ${filterdataobjectKolam()}");
                                                                parentDataKolam
                                                                    .add(MyData(
                                                                  komoditi:
                                                                      "44",
                                                                  boolKom:
                                                                      false,
                                                                  boolKomHarga:
                                                                      false,
                                                                  visiKom:
                                                                      false,
                                                                  pupuk: [
                                                                    Pupukw(
                                                                        boolPup:
                                                                            false,
                                                                        visiPup:
                                                                            false,
                                                                        namaPupu:
                                                                            dataKategoriMenuRawatan[widget.indexmenu].perlengkapan[
                                                                                0],
                                                                        watt:
                                                                            '0',
                                                                        LamaListring:
                                                                            '0',
                                                                        Rumus:
                                                                            '',
                                                                        hasil:
                                                                            '0',
                                                                        img: dataKategoriMenuRawatan[widget.indexmenu]
                                                                            .img_banner[1])
                                                                  ],
                                                                  luas: "",
                                                                  visiKomHarga:
                                                                      false,
                                                                  dataHarga:
                                                                      drowndownk,
                                                                  hasilTotal:
                                                                      '0',
                                                                  hasilRp: 0,
                                                                  indexsubmenu: c
                                                                      .indexsubMenuRawatan
                                                                      .value,
                                                                  indexmenu: widget
                                                                      .indexmenu,
                                                                  idmediatanam: c
                                                                      .selectedItemCalcT
                                                                      .value,
                                                                  rumus: dataKategoriMenuRawatan[widget
                                                                              .indexmenu]
                                                                          .rumus[
                                                                      c.selectedItemCalcT
                                                                          .value],
                                                                  multi: dataKategoriMenuRawatan[
                                                                          widget
                                                                              .indexmenu]
                                                                      .multi,
                                                                  kesimpulansub:
                                                                      '',
                                                                  kesimpulanAkhir:
                                                                      '',
                                                                  // varii: variableObjs()!,
                                                                  varii: getDataTakaranDosisTanamanGNew(
                                                                      c.indexsubMenuRawatan
                                                                          .value,
                                                                      "(LMt/10000)*JPk",
                                                                      0.0.toString()),
                                                                  kategoriRumusKu: List.of(
                                                                      FdatakategoryRumus(
                                                                          c.indexMenuRawatan
                                                                              .value,
                                                                          List<KategoriRumus>.from(List
                                                                              .generate(
                                                                            kategoriRumus.length,
                                                                            (i) =>
                                                                                KategoriRumus(
                                                                              id: i,
                                                                              idKalkulasi: kategoriRumus[i]["idKalkulasi"],
                                                                              idMediaTanam: kategoriRumus[i]["idMediaTanam"],
                                                                              vari: kategoriRumus[i]["vari"],
                                                                              nama: kategoriRumus[i]["nama"],
                                                                              rumus: kategoriRumus[i]["rumus"],
                                                                              valuess: kategoriRumus[i]["value"],
                                                                              // fieldValue: kategoriRumus[i]
                                                                              //     ["fieldValue"],
                                                                              img: kategoriRumus[i]["img"],
                                                                              id_MenuRawatan: kategoriRumus[i]["id_MenuRawatan"],
                                                                            ),
                                                                          )),
                                                                          c.selectedItemCalcT
                                                                              .value)),
                                                                  propertyLainnya:
                                                                      deepCopyMap(tambahanPropertyKal[c
                                                                          .indexMenuRawatan
                                                                          .value]),
                                                                  id: parentDataKolam
                                                                          .map((e) => e
                                                                              .id)
                                                                          .last +
                                                                      1,
                                                                  namaId: c
                                                                      .namaObj
                                                                      .value,
                                                                ));
                                                              } else {
                                                                filterdataobjectKolam()[
                                                                            indexK]
                                                                        .namaId =
                                                                    values;

                                                                parentDataKolam
                                                                    .add(MyData(
                                                                  komoditi:
                                                                      "44",
                                                                  boolKom:
                                                                      false,
                                                                  boolKomHarga:
                                                                      false,
                                                                  visiKom:
                                                                      false,
                                                                  pupuk: [
                                                                    Pupukw(
                                                                        boolPup:
                                                                            false,
                                                                        visiPup:
                                                                            false,
                                                                        namaPupu:
                                                                            dataKategoriMenuRawatan[widget.indexmenu].perlengkapan[
                                                                                0],
                                                                        watt:
                                                                            '0',
                                                                        LamaListring:
                                                                            '0',
                                                                        Rumus:
                                                                            '',
                                                                        hasil:
                                                                            '0',
                                                                        img: dataKategoriMenuRawatan[widget.indexmenu]
                                                                            .img_banner[1])
                                                                  ],
                                                                  luas: "",
                                                                  visiKomHarga:
                                                                      false,
                                                                  dataHarga:
                                                                      drowndownk,
                                                                  hasilTotal:
                                                                      '0',
                                                                  hasilRp: 0,
                                                                  indexsubmenu: c
                                                                      .indexsubMenuRawatan
                                                                      .value,
                                                                  indexmenu: widget
                                                                      .indexmenu,
                                                                  idmediatanam: c
                                                                      .selectedItemCalcT
                                                                      .value,
                                                                  rumus: dataKategoriMenuRawatan[widget
                                                                              .indexmenu]
                                                                          .rumus[
                                                                      c.selectedItemCalcT
                                                                          .value],
                                                                  multi: dataKategoriMenuRawatan[
                                                                          widget
                                                                              .indexmenu]
                                                                      .multi,
                                                                  kesimpulansub:
                                                                      '',
                                                                  kesimpulanAkhir:
                                                                      '',
                                                                  // varii: variableObjs()!,
                                                                  varii: getDataTakaranDosisTanamanGNew(
                                                                      c.indexsubMenuRawatan
                                                                          .value,
                                                                      "(LMt/10000)*JPk",
                                                                      0.0.toString()),
                                                                  kategoriRumusKu: List.of(
                                                                      FdatakategoryRumus(
                                                                          c.indexMenuRawatan
                                                                              .value,
                                                                          List<KategoriRumus>.from(List
                                                                              .generate(
                                                                            kategoriRumus.length,
                                                                            (i) =>
                                                                                KategoriRumus(
                                                                              id: i,
                                                                              idKalkulasi: kategoriRumus[i]["idKalkulasi"],
                                                                              idMediaTanam: kategoriRumus[i]["idMediaTanam"],
                                                                              vari: kategoriRumus[i]["vari"],
                                                                              nama: kategoriRumus[i]["nama"],
                                                                              rumus: kategoriRumus[i]["rumus"],
                                                                              valuess: kategoriRumus[i]["value"],
                                                                              // fieldValue: kategoriRumus[i]
                                                                              //     ["fieldValue"],
                                                                              img: kategoriRumus[i]["img"],
                                                                              id_MenuRawatan: kategoriRumus[i]["id_MenuRawatan"],
                                                                            ),
                                                                          )),
                                                                          c.selectedItemCalcT
                                                                              .value)),
                                                                  propertyLainnya:
                                                                      deepCopyMap(tambahanPropertyKal[c
                                                                          .indexMenuRawatan
                                                                          .value]),
                                                                  id: parentDataKolam
                                                                          .map((e) => e
                                                                              .id)
                                                                          .last +
                                                                      1,
                                                                  namaId: c
                                                                      .namaObj
                                                                      .value,
                                                                ));
                                                                print(
                                                                    "JIKA ADA TAMBAH filterdataobjectKolam() ${filterdataobjectKolam().map((e) => e.namaId)} --${parentDataKolam.map((e) => e.propertyLainnya)}");
                                                              }

                                                              // print("ditambah dengan ${getDataTakaranDosisTanamanGNew(c.indexsubMenuRawatan.value, "(LMt/10000)*JPk",variablesNew(dataKategoriRumus[0].rumus),dataKategoriRumus[0].rumus).map((e) => e.variabelLahan).toList()
                                                              // }");
                                                              // filterdataobjectKolam() = filterdataobjectKolam();

                                                              setPreference();

                                                              Navigator.pop(
                                                                  context,
                                                                  'OK');
                                                            }

                                                            // widget.dataParent.pupuk[indexP].namaPupu =
                                                            //     values;
                                                            // //hasil_rumus(indexK, widget.datapPu);
                                                            // hasilTotal(indexK, indexP, widget.dataParent,
                                                            //     widget.waktu);
                                                            // onproses(indexK, indexP);
                                                            // setPreference();

                                                            print(
                                                                "dataku ${deepCopyMap(tambahanPropertyKal[c.indexMenuRawatan.value])}");
                                                          });
                                                        },
                                                        enable: true,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                actions: [
                                                  TextButton(
                                                    child: Text('OK'),
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                  ),
                                                ],
                                              ));

                                  // });
                                },
                                kurang: (s) {
                                  setState(() {
                                    if (parentDataKolam.isNotEmpty) {
                                      parentDataKolam.removeWhere((element) =>
                                          element.id ==
                                          parentDataKolam
                                              .where((element) =>
                                                  element.indexmenu ==
                                                      filterdataobjectKolam()[
                                                              indexK]
                                                          .indexmenu &&
                                                  element.indexsubmenu ==
                                                      filterdataobjectKolam()[
                                                              indexK]
                                                          .indexsubmenu &&
                                                  element.idmediatanam ==
                                                      filterdataobjectKolam()[
                                                              indexK]
                                                          .idmediatanam)
                                              .toList()
                                              .map((e) => e.id)
                                              .toList()[indexK]);

                                      setPreference();
                                    }
                                  });
                                },
                                costume: Container(),
                              ),
                            );
                          }),
                      Container(
                        margin: EdgeInsets.all(defaultPadding / 2),
                        decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(5)),
                            border: Border.all(
                                style: BorderStyle.solid,
                                color: Colors.black12.withOpacity(0.3)),
                            color: warnas(
                                dataKategoriMenuRawatan[widget.indexmenu]
                                    .colorku[0])),
                        child: Padding(
                          padding: EdgeInsets.all(defaultPadding),
                          child: AutoSizeText(
                            widget.penjelas,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontStyle: FontStyle.normal,
                                fontSize: 16),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: defaultPadding,
                      ),
                      Container(
                        color: Colors.white,
                        child: Padding(
                          padding: EdgeInsets.all(defaultPadding / 2),
                          child: AutoSizeText(
                            widget.hasilakhir(hasilAkhirKolam),
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: warnas(
                                    dataKategoriMenuRawatan[widget.indexmenu]
                                        .colorku[0]),
                                fontStyle: FontStyle.normal,
                                fontSize: 30),
                          ),
                        ),
                      ),
                      const Divider(
                        color: Colors.black54,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
