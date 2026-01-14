// import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:rawatt/Debug/childWidgetFieldListrik.dart';
import 'package:rawatt/Debug/childWidgetFieldMaggot.dart';
import 'package:rawatt/Debug/childWidgetFieldTanaman.dart';
import 'package:rawatt/Debug/widget_mediaLahan.dart';
import 'package:rawatt/components/card_field.dart';
import 'dart:ui' as ui;
import 'package:rawatt/components/card_img.dart';
import 'package:rawatt/components/card_penjelas.dart';
import 'package:rawatt/components/card_pupuk.dart';
import 'package:rawatt/components/tabCostume.dart';
import 'package:rawatt/components/tema_Page.dart';
import 'package:rawatt/model/datafix.dart';
import 'package:rawatt/model/dosis/mdl_dosisPengaplikasian.dart';
import 'package:rawatt/model/kalkulator/mdl_KatRumus.dart';
import 'package:rawatt/model/perusahaan/mdl_KatPerusahaan.dart';
import 'package:rawatt/model/product/mdl_Produk.dart';
import 'package:rawatt/screens/convert/component/Widget_Jarak_Tanaman.dart';
import 'package:rawatt/screens/convert/component/Widget_Jenis_Tanah.dart';
import 'package:rawatt/screens/convert/component/component.dart';
import 'package:rawatt/screens/convert/component/inisialisasi_var.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:measured_size/measured_size.dart';
import 'package:function_tree/function_tree.dart';
import 'package:auto_size_text/auto_size_text.dart';
import '../../../../Debug/childWidgetFieldAyam.dart';
import '../../../../Debug/childWidgetFieldKolam.dart';
import '../../../../components/card_expanded.dart';
import '../../../../components/card_product.dart';
import '../../../../components/inputan.dart';
import '../../../../constants.dart';
import '../../../../model/MenuRawatan/mdl_MenuRawatan.dart';
import '../../../../model/dosis/fieldku_campur.dart';
import '../../../../model/dosis/fieldku_kolam1.dart';
import '../../../../model/jenisMesin/mdl_JenisMesin.dart';
import '../../../../model/kalkulator/mdl_KatMediatanam.dart';
import '../../../../rumus.dart';
import '../../../../service/ad_mob_service.dart';
import '../../../../size_config.dart';
import '../../component/Widget_Jenis_Pot.dart';
import 'background.dart';

void hitung(int indexsubmenu, String rumus, String hasilLahan) {
  print("hasill $hasilLahan");

  datafilterMyData1![c.ObjectIndexSelectedEdit.value].varii =
      getDataTakaranDosisTanamanGNew(indexsubmenu, rumus, hasilLahan);

  c.islabelLayer.value = c.dataMenuKalkulasi.value[c.selectedItemCalcT.value];

  filterCategorybyPerusahaan();
}

List<MyData> filterdataobjectfix() {
  return filterdataobject();
}

List<String> filterCategorybyPerusahaan() {
  List<int> ada =
      List.of(datafilterMyData1![c.ObjectIndexSelectedEdit.value].varii)
          .map((e) => e.idPerusahaan)
          .toList();
  print(
      "perusahaan $ada ${c.ObjectIndexSelectedEdit.value} ${datafilterMyData1![0].varii}");
  ada.sort();
  List<String> perusahan = ada
      .map((e) => dataKategoriPerusahaan[e].perusahaan)
      .toList()
      .toSet()
      .toList();
  print("perusahaan $perusahan");
  return perusahan;
}

List<DataObjHasilTakaran> filterDatabyPerusahaan(int indexPerusahaan) {
  // print("cobaiim ${filterdataobjectfix()[0]} -m ${c.ObjectIndexSelectedEdit.value}");
  if (datafilterMyData1!.length <= 1) {
    c.ObjectIndexSelectedEdit.value = 0;
  }
  // print(datafilterMyData1!);
  List<DataObjHasilTakaran> perusahan =
      List.of(datafilterMyData1![c.ObjectIndexSelectedEdit.value].varii)
          .where((element) => element.idPerusahaan == indexPerusahaan)
          .toList();
  // print("cobaiim $indexPerusahaan ${perusahan} ${datafilterMyData1![0].propertyLainnya } -m ${datafilterMyData1![0].varii} ${c.ObjectIndexSelectedEdit.value}");
  return perusahan;
}

List<String> filterCategorybyJenisPemupukan(int indexPerusahaan) {
  // print("ini error $indexPerusahaan ${filterDatabyPerusahaan(0)}");
  List<String> jenisPemupukan = filterDatabyPerusahaan(indexPerusahaan)
      .map((e) => e.jenisPemupukan)
      .map((e) => e)
      .toList()
      .toSet()
      .toList();
  return jenisPemupukan;
}

List<DataObjHasilTakaran> filterDatabyJenisPemupukan(
    int indexPerusahaan, String JenisPupuk) {
  List<DataObjHasilTakaran> dosisbyjenispemupukan =
      List.of(filterDatabyPerusahaan(indexPerusahaan))
          .where((element) => element.jenisPemupukan == JenisPupuk)
          .toList();
  return dosisbyjenispemupukan;
}

Map<dynamic, dynamic> dataDosisfix(int indexPerusahaan, String JenisPupuk) {
  Map dta = List<DataObjHasilTakaran>.of(
          filterDatabyJenisPemupukan(indexPerusahaan, JenisPupuk))
      .map((e) => e.dataDosis)
      .first;
  // Map dta = {};
  return dta;
}

Map<dynamic, dynamic> dataPengaplikasianfix(
    int indexPerusahaan, String JenisPupuk) {
  Map dta = List<DataObjHasilTakaran>.of(
          filterDatabyJenisPemupukan(indexPerusahaan, JenisPupuk))
      .map((e) => e.dataPengaplikasian)
      .first;
  return dta;
}

Map<dynamic, dynamic> dataHargafix(int indexPerusahaan, String JenisPupuk) {
  Map dta = List<DataObjHasilTakaran>.of(
          filterDatabyJenisPemupukan(indexPerusahaan, JenisPupuk))
      .map((e) => e.dataHarga)
      .first;
  return dta;
}

List<DataObjHasilTakaran> filterdatabyJenisPupuk(
    int indexPerusahaan, String JenisPupuk) {
  List<DataObjHasilTakaran> asa =
      datafilterMyData1![c.ObjectIndexSelectedEdit.value]
          .varii
          .where(
              (element) => element.idPerusahaan == c.indexdropdownPrushn.value)
          .toList()
          .where((element) => element.jenisPemupukan == JenisPupuk)
          .toList();
  return asa;
}

Map hitungHarga(Map datadosis, Map hargaDosis) {
  Map da = {};
  // print(
  //     "field upsa ${ c.AcontrolHarga.value![c.indexdropdownjenisPemupukan.value]}");
  // print(
  //     "field upsa12 ${ dataHargafix(c.indexdropdownPrushn.value,
  //   filterCategorybyJenisPemupukan(c.indexdropdownPrushn.value)[c
  //       .indexdropdownjenisPemupukan.value],)}");

  datadosis.forEach((key, value) {
    print(
        "datanya21 ${hargaDosis.keys.where((element) => element == key).last}");
    da[key] = double.parse(hargaDosis[
            hargaDosis.keys.where((element) => element == key).last]) *
        double.parse(value.toString().replaceAll(RegExp(r'[^0-9.]'), ''));
    // map((e) => double.tryParse(e)!*double.parse(value.toString().replaceAll(
    //     RegExp(r'[^0-9.]'),''))!).last;
    // c.AcontrolHarga.value![c.indexdropdownPrushn.value].toList()[c.indexdropdownjenisPemupukan.value].forEach((key1, value1) {
    //   if (key1 == key) {
    //     da[key] = double.tryParse(value1.toString())! *
    //         double.parse(value.toString().replaceAll(
    //             RegExp(
    //                 r'[^0-9.]'),
    //             ''))!;
    //   }
    // });
  });
  print("datanya $da");
  return da;
}

List<DataObjHasilTakaran> getDataTakaranDosisTanamanGNew(
    int idKomoditi, String rumus, String hasil) {
  // double hasillahan = double.tryParse(convertRumus(dataVar, rumuslahan)
  //     .interpret()
  //     .toDouble()
  //     .toStringAsFixed(3))!;

  // print("hasilku ini  $hasillahan");
  // List<DataObjHasilTakaran> dataHasilnya = [];

  print("hasil =>$hasil $idKomoditi ");
  List<PengaplikasianDosisPupuk> dosisbyMenu = dataDosisPengaplikasianObj
      .where((element) =>
          element.id_MenuRawatan == c.indexMenuRawatan.value.toString())
      .toList();

  print("hasil =>$hasil $idKomoditi $dosisbyMenu");
  // List<PengaplikasianDosisPupuk> dosis = dataDosisPengaplikasianObj
  //     .where((element) => (element.idKomoditi == idKomoditi && element.id_MenuRawatan == c.indexMenuRawatan.value.toString()))
  //     .toList();

  List<PengaplikasianDosisPupuk> dosis = dosisbyMenu
      .where((element) => (element.idKomoditi == idKomoditi))
      .toList();
  // print("dosis =>${dosis.map((e) => e.takaran)} $idKomoditi ${dosisbyMenu.map((e) => e.idKomoditi)}");
  // print("dosis2 =>${List.generate(dosis.length, (index) {
  //   dosis[index].takaran.forEach((key, value) {
  //     Map.of(value).forEach((keyss, valuess) {
  //       dosis[index].hasil[key][keyss] =
  //           convertRumus(dosis[index].variabels, valuess.toString())
  //               .interpret()
  //               .toDouble();
  //     });
  //   });
  //
  //   // print("hasilc 1 ${dosis[index].hasil}");
  //   List dataoutput = multiVarHasil(dosis[index].variabels,
  //       dosis[index].hasil as Map<String, Map<dynamic, dynamic>>, rumus, "JPk");
  //   // print("hasilc 1 ${dataVar}");
  //   return DataObjHasilTakaran(
  //       idPerusahaan: dosis[index].idPerusahaan,
  //       jenisPemupukan: dosis[index].jenisPemupukan,
  //       dataDosis: dataoutput[2],
  //       dataPengaplikasian: dataoutput[0],
  //       penjelas: dosis[index].penjelas.values.toString(),
  //       dataHarga: Map.of(dataoutput[2]).map((key, value) => MapEntry(key, 0)));
  // })} $idKomoditi");
  return List.generate(dosis.length, (index) {
    dosis[index].takaran.forEach((key, value) {
      Map.of(value).forEach((keyss, valuess) {
        dosis[index].hasil[key][keyss] =
            convertRumus(dosis[index].variabels, valuess.toString())
                .interpret()
                .toDouble();
      });
    });

    // print("hasilc 1 ${dosis[index].hasil}");
    List dataoutput = multiVarHasil(dosis[index].variabels,
        dosis[index].hasil as Map<String, Map<dynamic, dynamic>>, rumus, "JPk");
    // print("hasilc 1 ${dataVar}");
    return DataObjHasilTakaran(
        idPerusahaan: dosis[index].idPerusahaan,
        jenisPemupukan: dosis[index].jenisPemupukan,
        dataDosis: dataoutput[2],
        dataPengaplikasian: dataoutput[0],
        penjelas: dosis[index].penjelas.values.toString(),
        dataHarga: Map.of(dataoutput[2]).map((key, value) => MapEntry(key, 0)));
  });
  // });
}

List<DataObjHasilTakaran> getDataTakaranDosisTanamanG(
    int idKomoditi, String rumus) {
  // List<DataObjHasilTakaran> dataHasilnya = [];
  List<PengaplikasianDosisPupuk> dosis = dataDosisPengaplikasianObj
      .where((element) => element.idKomoditi == idKomoditi)
      .toList();

  return List.generate(dosis.length, (index) {
    dosis[index].takaran.forEach((key, value) {
      Map.of(value).forEach((keyss, valuess) {
        dosis[index].hasil[key][keyss] =
            convertRumus(dosis[index].variabels, valuess.toString())
                .interpret()
                .toDouble();
      });
    });

    List dataoutput = multiVarHasil(dosis[index].variabels,
        dosis[index].hasil as Map<String, Map<dynamic, dynamic>>, rumus, "JPk");
    // print("hasilc 1 ${dataoutput}");
    return DataObjHasilTakaran(
        idPerusahaan: dosis[index].idPerusahaan,
        jenisPemupukan: dosis[index].jenisPemupukan,
        dataDosis: dataoutput[2],
        dataPengaplikasian: dataoutput[0],
        penjelas: dosis[index].penjelas.values.toString(),
        dataHarga: Map.of(dataoutput[2]).map((key, value) => MapEntry(key, 0)));
  });
  // });
}

class DosisPupukTanamanbuah extends StatefulWidget {
  final int indexsubmenu;
  final int indexmenu;
  String? namaCategoryTanam;
  DosisPupukTanamanbuah({
    super.key,
    required this.indexsubmenu,
    required this.indexmenu,
    this.namaCategoryTanam,
  });

  @override
  _DosisPupukTanamanbuahState createState() => _DosisPupukTanamanbuahState();
}

// bool layer = true;

Map<String, dynamic> hasils = {};

@override
String getIdP(int idd) {
  return dataKategoriPerusahaan
      .where((element) => element.id == idd)
      .map((e) => e.perusahaan)
      .last;
}

List<List<DataObjHasilTakaran>> dataFilterDosis =
    c.datashasilfix.value.map((e) => e.idPerusahaan).toSet().toList().map((ei) {
  List<DataObjHasilTakaran> datas = List.of(c.datashasilfix.value)
      .where((element) => element.idPerusahaan == ei)
      .toList();
  return datas;
}).toList();

List<String> perusahan = List.of(c.datashasilfix.value)
    .map((e) => e.idPerusahaan)
    .map((e) => dataKategoriPerusahaan[e].perusahaan)
    .toList()
    .toSet()
    .toList();
List<String> Dosis = [];

Set<MapEntry<dynamic, dynamic>> resultMapEntries = {};

class _DosisPupukTanamanbuahState extends State<DosisPupukTanamanbuah> {
  List tampungidx = [0, 0];

  @override
  Map<String, List<String>> groupByKey(List<Map<String, String>> data) {
    Map<String, List<String>> groupedData = {};

    for (var item in data) {
      // Mendapatkan kunci dari Map (nama perusahaan)
      String key = item.keys.first;

      // Mendapatkan nilai dari Map (jenis produk)
      String value = item[key]!;

      // Mengecek apakah kunci sudah ada di dalam Map atau belum
      if (groupedData.containsKey(key)) {
        // Jika kunci sudah ada, tambahkan nilai ke dalam List yang sudah ada
        groupedData[key]!.add(value);
      } else {
        // Jika kunci belum ada, buat List baru dengan nilai sebagai elemen pertama
        groupedData[key] = [value];
      }
    }

    return groupedData;
  }

  @override
  List coba() {
    dataFilterDosis = c.datashasilfix.value
        .map((e) => e.idPerusahaan)
        .toSet()
        .toList()
        .map((ei) {
      List<DataObjHasilTakaran> datas = c.datashasilfix.value
          .where((element) => element.idPerusahaan == ei)
          .toList();
      return datas;
    }).toList();
    // dataFilterDosis = prosesFilterDosis();
    // print(
    //     "lllo${dataFilterDosis.map((e) => e.map((e) => e)).toList().expand((element) => element).toList()[0].dataPengaplikasian}");
    // // ==========================================

// ==========================================
    Size ukuran = Size(0.0, 0.0);
    // labelLayer = dataKategoriMediaTanam[selectedItemprev].mediatanam;
    return List<Widget>.generate(dataFilterDosis.length, (index) {
      return Padding(
        padding: EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            Stack(
              children: [
                MeasuredSize(
                  onChange: (Size size) {
                    setState(() {
                      c.sizeslayers.value.insert(index, size);
                      ukuran = size;
                    });
                    // widget.indexmenu(() {

                    // print("size ${size.height}");
                    // });
                  },
                  child: Container(
                    padding: EdgeInsets.only(bottom: defaultPadding),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        border: Border.all(
                            style: BorderStyle.solid,
                            color: Colors.black.withOpacity(0.3)),
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 10,
                              offset: Offset(0, 5),
                              color: Colors.black.withOpacity(.3))
                        ],
                        color: Colors.white),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(defaultPadding / 2),
                          child: ListTile(
                            title: Text(
                                dataKategoriPerusahaan[
                                        dataFilterDosis[index][0].idPerusahaan]
                                    .perusahaan,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold)),
                            subtitle: Text("Dosis Pengaplikasian",
                                style: TextStyle(color: Colors.black)),
                            leading: FittedBox(
                              child: SizedBox(
                                  height: 150,
                                  width: 150,
                                  child: ImgOnline(
                                      dataKategoriPerusahaan[
                                              dataFilterDosis[index][0]
                                                  .idPerusahaan]
                                          .img,
                                      dataKategoriPerusahaan[
                                              dataFilterDosis[index][0]
                                                  .idPerusahaan]
                                          .img)),
                            ),
                          ),
                        ),

                        // final item = databysubmenu.toList()[index % widget.items.length];
                        Column(
                            children: dataFilterDosis[index]
                                .map<Widget>((DataObjHasilTakaran e) {
                          return Container(
                            child: Column(
                              children: [
                                // Text(MaptoStr(e.dataDosis, 0.0,
                                //     c.satuan.value, 0),style:TextStyle(color: Colors.black38),),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: defaultPadding / 2,
                                      horizontal: defaultPadding),
                                  child: ExpandingCards(
                                    height: 500,
                                    onchange: (int o) {},
                                    len: 1,
                                    gridview: false,
                                    axisCount: 1,
                                    title: 'Dosis  ${e.jenisPemupukan}',
                                    subtitle: "Dosis",
                                    penjelas: MaptoStr(
                                        e.dataDosis, 0.0, c.satuan.value, 0),
                                    indexFix: 2,
                                    img: dataKategoriMenuRawatan[
                                            widget.indexmenu]
                                        .img_banner[0],
                                    dialog: Dialogku(
                                      onStateChange: () {},
                                      indexKomo: 0,
                                      indexPupu: 0,
                                      fields: SingleChildScrollView(
                                          child: Column(
                                        children: List<Widget>.generate(
                                            e.dataPengaplikasian.length,
                                            (index) {
                                          Map dataPengaplikasian =
                                              e.dataPengaplikasian;
                                          return Column(
                                            children: [
                                              Text(
                                                dataPengaplikasian.keys
                                                    .toList()[index]
                                                    .toString(),
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 20,
                                                    color: Colors.black45),
                                              ),
                                              Column(
                                                children: List<Widget>.generate(
                                                    dataPengaplikasian.values
                                                        .toList()[index]
                                                        .length, (indexr) {
                                                  double angka = double.parse(
                                                      dataPengaplikasian.values
                                                          .toList()[index]
                                                          .values
                                                          .toList()[indexr]
                                                          .toString()
                                                          .replaceAll(
                                                              RegExp(
                                                                  r'[^0-9.]'),
                                                              ''));
                                                  return Padding(
                                                    padding: EdgeInsets.only(
                                                        left: defaultPadding),
                                                    child: SizedBox(
                                                      height: 100,
                                                      child: CardpHs(
                                                        title:
                                                            "${dataPengaplikasian.values.toList()[index].keys.toList()[indexr].toString()} : \n",
                                                        hasilAkhir: "",
                                                        sizes: sT18,
                                                        texts:
                                                            dataPengaplikasian
                                                                .values
                                                                .toList()[index]
                                                                .values
                                                                .toList()[
                                                                    indexr]
                                                                .toString(),
                                                        multitext: [],
                                                        tema: warnas(
                                                            dataKategoriMenuRawatan[c
                                                                    .indexMenuRawatan
                                                                    .value]
                                                                .colorku[0]),
                                                        cardornot: true,
                                                        cardCostume: Container(
                                                          child: CardProductku(
                                                              tema: (dataPengaplikasian
                                                                          .values
                                                                          .toList()[
                                                                              index]
                                                                          .keys
                                                                          .toList()[
                                                                              indexr]
                                                                          .toString() ==
                                                                      "Kieserit")
                                                                  ? Colors.blue
                                                                  : warnas(
                                                                      List.from(dataProductsObj.where((element) => element.nama == e.dataPengaplikasian.values.toList()[index].keys.toList()[indexr].toString()).first.color)[
                                                                          0]),
                                                              image: (e.dataPengaplikasian
                                                                          .values
                                                                          .toList()[index]
                                                                          .keys
                                                                          .toList()[indexr]
                                                                          .toString() ==
                                                                      "Kieserit")
                                                                  ? "assets/images/BGA.jpg"
                                                                  : dataProductsObj.where((element) => element.nama == e.dataPengaplikasian.values.toList()[index].keys.toList()[indexr].toString()).first.img),
                                                        ),
                                                        id: 0,
                                                        widgetCostum:
                                                            Container(),
                                                      ),
                                                    ),
                                                  );
                                                }),
                                              ),
                                            ],
                                          );
                                        }),
                                      )),
                                      nilaiTotal: '0',
                                      indexmenu: widget.indexmenu,
                                      indexsubmenu: widget.indexsubmenu,
                                      dataParent: [],
                                    ),
                                    tambah: (String s) {},
                                    kurang: (String u) {},
                                    costume: Container(),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }).toList()),
                      ],
                    ),
                  ),
                ),
                Visibility(
                  visible: c.isviewlayer.value,
                  child: Container(
                    height: c.sizeslayers.value[index].height,
                    padding: EdgeInsets.only(bottom: defaultPadding),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        border: Border.all(
                            style: BorderStyle.solid,
                            color: Colors.black.withOpacity(0.3)),
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 10,
                              offset: Offset(0, 5),
                              color: Colors.black.withOpacity(.3))
                        ],
                        color: Colors.black.withOpacity(.3)),
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Hasil Perhitungan masih perhitungan dalam ${c.islabelLayer.value}",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: defaultPadding,
                          ),
                          InkWell(
                            onTap: () {
                              // widget.indexmenu(() {
                              setState(() {
                                c.isviewlayer.value = false;
                              });

                              // });
                            },
                            child: Container(
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5)),
                                  color: warnas(
                                      dataKategoriMenuRawatan[widget.indexmenu]
                                          .colorku[0]),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "OK",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  ),
                                )),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            // FieldskuChild(index: 0, indexPP: 0, edit_semua: false, onStateChange: (List<Pupukw> lol) {
            //
            // }, datap: databysubmenu,)
          ],
        ),
      );
    });
  }

  // BannerAd _banner1;

  // void _createBAnnerAd() {
  //   _banner1 =BannerAd(size: AdSize.fullBanner, adUnitId: AdMobService.bannerAdUnitId, listener: AdMobService.bannerListener, request: const AdRequest(),)..load();
  // }
  Map<String, dynamic> _flattenMap(Map<dynamic, dynamic> map) {
    Map<String, dynamic> flattenedMap = {};

    map.forEach((key, value) {
      if (value is Map) {
        flattenedMap.addAll(_flattenMap(value));
      } else {
        flattenedMap[key] = value.toString().split(' ')[0];
      }
    });

    return flattenedMap;
  }

  int subinsexmenu = 0;

  Map dataCopy = deepCopyMap(tambahanPropertyKal[c.indexMenuRawatan.value]);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    if (dataCopy["namaTanaman"] == "") {
      dataCopy["namaTanaman"] = widget.namaCategoryTanam;
    }

    // });
    // _createBAnnerAd();
    if ((datafilterMyData1 ?? []).isEmpty) {
      // (["namaTanaman"] == ""){
      //
      // };

      parentData.add(MyData(
        komoditi: "0",
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
              Rumus: '',
              hasil: '0',
              img: dataKategoriMenuRawatan[widget.indexmenu].img_banner[1])
        ],
        luas: "",
        visiKomHarga: false,
        dataHarga: [],
        hasilTotal: '0',
        hasilRp: 0,
        indexsubmenu: c.indexsubMenuRawatan.value,
        indexmenu: widget.indexmenu,
        idmediatanam: c.selectedItemCalcT.value,
        rumus: dataKategoriMenuRawatan[widget.indexmenu]
            .rumus[c.selectedItemCalcT.value],
        multi: dataKategoriMenuRawatan[widget.indexmenu].multi,
        kesimpulansub: '',
        kesimpulanAkhir: '',
        // varii: variableObjs()!,
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
                // fieldValue: kategoriRumus[i]
                //     ["fieldValue"],
                img: kategoriRumus[i]["img"],
                id_MenuRawatan: kategoriRumus[i]["id_MenuRawatan"],
              ),
            )),
            c.selectedItemCalcT.value)),
        propertyLainnya: dataCopy,
        id: parentData.length + 1, namaId: "0",
      ));
    } else {}
    List<List<Map<String, dynamic>>> dataFilterhasilPupuk = dataFilterDosis
        .map((e) =>
            e.map((e) => {e.jenisPemupukan: e.dataPengaplikasian}).toList())
        .toList();

    List<List<Map<String, String>>> data = dataFilterDosis
        .map((e) => e
            .map((e) => {
                  dataKategoriPerusahaan[e.idPerusahaan].perusahaan:
                      e.jenisPemupukan
                })
            .toList())
        .toList();

    Map<String, List<String>> groupedData = {};

    for (var group in data) {
      for (var item in group) {
        String key = item.keys.first;
        String value = item.values.first;

        if (!groupedData.containsKey(key)) {
          groupedData[key] = [value];
        } else {
          groupedData[key]!.add(value);
        }
      }
    }

    Map<String, Map<String, List<String>>> outputData = {};
    // Menampilkan hasil
    groupedData.forEach((key, value) {
      Map<String, List<String>> inputData = {key: value.join(', ').split(', ')};

      inputData.forEach((key, values) {
        Map<String, List<String>> innerMap = {};

        for (var value in values) {
          innerMap[value] = [];
        }

        outputData[key] = innerMap;
      });

      // datakategorisubMenuRawatan.where((element) => element.id == widget.indexsubmenu).map((e) => e.media);
      print(outputData);
    });
    List<Map<String, dynamic>> convertedDataList = [];

    for (var item in dataFilterhasilPupuk.expand((i) => i)) {
      String key = item.keys.first;
      Map<String, dynamic> values = {};

      if (item[key] is Map) {
        values = _flattenMap(item[key]);
      }

      convertedDataList.add({key: values});
    }
// c.indexMenuRawatan.value = widget.indexmenu;
    // print(convertedDataList);
    //
    // print(convertedDataList);
    print("iodex ${c.indexMenuRawatan.value}");
    if (widget.indexmenu == 1) {
      setState(() {
        List.generate(dataKategoriPerusahaan.length, (index) {
          c.sizeslayers.value.add(Size(20, 21));
        });

        c.indexdropdownjenisPemupukan.value = 0;

        datakategorisubMenuRawatan[widget.indexmenu].media = outputData;
        datakategorisubMenuRawatan[widget.indexmenu].variableKetetapan =
            convertedDataList;
      });
    }

    print("iniloh ${datakategorisubMenuRawatan[widget.indexmenu].media}");

    // print(
    //     "indexberapa ${datafilterMyData1!.map((e) => e.indexsubmenu)}");

    // dataFilterDosis = prosesFilterDosis();
  }

  int indpots = 8;
  int selectedItemprev = 0;
  int selectedItem = 0;
  int selectedItemprev2 = 0;
  int selectedItem2 = 0;

  // int indes = 0;
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // dataFilterDosis = prosesFilterDosis();
    return Scaffold(
        extendBodyBehindAppBar: (SizeConfig.screenWidth! > 600) ? false : true,
        appBar: (SizeConfig.screenWidth! > 600)
            ? appBarLanscape()
            : appBarPotrait(),
        body:
            // ====================== rotate ============= Lancape
            LayoutBuilder(builder: (context, constraints) {
          if (constraints.maxWidth > 600) {
            return WideLayoutProduct();
          } else {
            return BackgraundPotrait(
              judul:
                  "${dataKategoriMenuRawatan[widget.indexmenu].fitur[0]} ${c.indexMenuRawatan.value == 1 ? "" : datakategorisubMenuRawatan.where((element) => element.id_MenuRawatan == widget.indexmenu.toString()).toList()[widget.indexsubmenu].namaKomoditi}",
              penjelas: "Rawatan",
              tema:
                  warnas(dataKategoriMenuRawatan[widget.indexmenu].colorku[0]),
              widgets: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: defaultPadding / 2),
                        // width: SizeConfig.screenWidth,
                        child: SizedBox(
                          height: SizeConfig.screenHeight! / 3.8,
                          width: SizeConfig.screenWidth,
                          child: TemaCardButton(
                            tema: warnas(
                                dataKategoriMenuRawatan[widget.indexmenu]
                                    .colorku[0]),
                            typetema: "dolomit",
                            judul:
                                "${dataKategoriMenuRawatan[widget.indexmenu].fitur[0]} ${c.indexMenuRawatan.value == 1 ? widget.namaCategoryTanam : datakategorisubMenuRawatan.where((element) => element.id_MenuRawatan == widget.indexmenu.toString()).toList()[widget.indexsubmenu].namaKomoditi}",
                            subjudul:
                                "Menghitung ${dataKategoriMenuRawatan[widget.indexmenu].fitur[0]} ${c.indexMenuRawatan.value == 1 ? widget.namaCategoryTanam : datakategorisubMenuRawatan.where((element) => element.id_MenuRawatan == widget.indexmenu.toString()).toList()[widget.indexsubmenu].namaKomoditi}",
                            judulimg: c.indexMenuRawatan.value == 1
                                ? "${widget.namaCategoryTanam}"
                                : datakategorisubMenuRawatan
                                    .where((element) =>
                                        element.id_MenuRawatan ==
                                        widget.indexmenu.toString())
                                    .toList()[widget.indexsubmenu]
                                    .namaKomoditi,
                            imgs: [
                              c.indexMenuRawatan.value == 1
                                  ? "assets/images/MenuRawatan/label_tanam.png"
                                  : datakategorisubMenuRawatan
                                      .where((element) =>
                                          element.id_MenuRawatan ==
                                          widget.indexmenu.toString())
                                      .toList()[widget.indexsubmenu]
                                      .img
                            ],
                            indexsubmenu: widget.indexsubmenu,
                            indexmenu: widget.indexmenu,
                          ),
                        )),
                    // Container(
                    //   child: SwitchListTile(
                    //       title: Text(c.satuan.value),
                    //       subtitle: Text("Satuan"),
                    //       value: c.checked.value,
                    //       onChanged: (bool value) {
                    //         widget.indexmenu(() {
                    //           c.checked.value = value;
                    //
                    //           c.satuan.value = (value == true) ? "cm" : "m";
                    //           // changedatavalues(c.satuan.value);
                    //         });
                    //       }),
                    // ),

                    inputCalcT(
                      indexmenuchild: widget.indexmenu,
                      indexsubmenuchild: widget.indexsubmenu,
                      namaTanaman: (c.indexMenuRawatan.value == 1)
                          ? "${widget.namaCategoryTanam}"
                          : "",
                    ),
                    // (widget.indexmenu == 1)
                    //     ? Column(children: coba() as List<Widget>)
                    //     : Container()
                  ],
                ),
              ),
            );
            // bottomNavigationBar: _banner1 ==null? Container():Container(
            // margin: EdgeInsets.only(bottom: defaultPadding),
            // height: 52,
            // child: AdWidget(ad:_banner1),
            // );
          }
        }));
  }
}

class inputCalcT extends StatefulWidget {
  final int indexmenuchild;
  final int indexsubmenuchild;
  String? namaTanaman;
  inputCalcT({
    super.key,
    required this.indexmenuchild,
    required this.indexsubmenuchild,
    this.namaTanaman,
  });

  @override
  State<inputCalcT> createState() => _inputCalcTState();
}

// List<MyData> databysubmenu =filterfromsubmenu(c.selectsubmenu.value);
int indexselectidkalku = 0;
int selectdedperusahaan = 0;

int indexdosis = 0;

class _inputCalcTState extends State<inputCalcT> {
  final ScrollController _parentController = ScrollController();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    // widget.indexsubmenuchild = 0;

    super.initState();

    filtersdata = dataKategoriJenisPerhitungan
        .where((element) =>
            element.id_menurawatan == widget.indexmenuchild.toString())
        .toList();

    c.dataMenuKalkulasi.value =
        filtersdata.map((e) => e.mediatanam).toList().sublist(0, 1);

    c.indexdropdownPrushn.value = 0;

    c.indexdropdownjenisPemupukan.value = 0;
  }

  List<Widget> larsTanah(int indexsubmenu, int indexmenu) {
    return [
      Column(
        children: [
          FieldskuMain(
            namaTanam: widget.namaTanaman,
            indexmenu: widget.indexmenuchild,
            indexsubmenu: widget.indexsubmenuchild,
            onStateChange: (List<MyData> s) {
              // setState(() {
              // });
            },
            judul: "Tambahkan Media Tanam Lahan",
            penjelas:
                "Anda menanan tanaman ${widget.namaTanaman} pada lahan dengan Estimasi biaya: ",
            hasilakhir: (sa) {
              if (datafilterMyData1!
                  .map((e) => double.tryParse(e.hasilTotal)!)
                  .isEmpty) {
                return "Rp. 0";
              } else {
                return "Rp.${formatRupiah(datafilterMyData1!.map((e) => double.tryParse(e.hasilTotal)!).reduce((value, element) => value + element).toString())}";
              }
            },
            kesimpulanPerKonten: (indexK) {
              return "Rp. ${formatRupiah(datafilterMyData1![c.ObjectIndexSelectedEdit.value].hasilTotal.toString())}";
            },
            judulchild: 'Tambahkan Kebutuhan Tani',
            hargamulti: 'yes',
            addWidget: childWidgetField(
              onChangeState: (totalHarga) {
                setState(() {});
              },
            ),
            waktu: false,
            selectidkal: indexselectidkalku,
          ),
        ],
      ),
    ];
  }

  List<Widget> lars(int indexsubmenu, int indexmenu) {
    return [
      Column(
        children: [
          FieldskuMain(
            namaTanam: widget.namaTanaman,
            indexmenu: widget.indexmenuchild,
            indexsubmenu: widget.indexsubmenuchild,
            onStateChange: (List<MyData> s) {
              // setState(() {
              // });
            },
            judul: "Tambahkan Media Tanam Lahan",
            penjelas:
                "Anda menanan tanaman ${widget.namaTanaman} pada lahan dengan Estimasi biaya: ",
            hasilakhir: (sa) {
              if (datafilterMyData1!
                  .map((e) => double.tryParse(e.hasilTotal)!)
                  .isEmpty) {
                return "Rp. 0";
              } else {
                return "Rp.${formatRupiah(datafilterMyData1!.map((e) => double.tryParse(e.hasilTotal)!).reduce((value, element) => value + element).toString())}";
              }
            },
            kesimpulanPerKonten: (indexK) {
              return "Rp. ${formatRupiah(datafilterMyData1![c.ObjectIndexSelectedEdit.value].hasilTotal.toString())}";
            },
            judulchild: 'Tambahkan Kebutuhan Tani',
            hargamulti: 'yes',
            addWidget:
                // Container(),
                // childWidgetField(onChangeState: (totalHarga){
                //   setState(() {
                //
                //   });

                // }),
                childWidgetFieldTanaman(
              namaCategory: widget.namaTanaman,
              onChangeState: (totalHarga) {
                // setState(() {
                //
                // });
              },
              info: false,
            ),
            waktu: false,
            selectidkal: indexselectidkalku,
          ),
        ],
      ),
      // Column(
      //   children: [
      //     FieldskuMain(
      //       indexmenu: widget.indexmenuchild,
      //       indexsubmenu: widget.indexsubmenuchild,
      //       onStateChange: (List<MyData> s) {
      //
      //       },
      //       judul: "Tambahkan Media Tanam Pot",
      //       penjelas:
      //       "Anda menggunakan pupuk pada lahan dengan Estimasi biaya: ",
      //       hasilakhir: (sa){
      //         return "Rp.${formatRupiah(datafilterMyData1!.map((e) => double.tryParse(e.hasilTotal)!).reduce((value, element) => value+element).toString())}";
      //       },
      //       kesimpulanPerKonten: (indexK) {
      //         // print("apakah null? ${databysubmenu.map((e) => e.pupuk.map((e) => int.tryParse(e.hasil) ?? 0).fold(0, (prev, curr) => prev + curr).toInt()).toList()[indexK]} Watt \nBiaya: ${golonganListrik[widget.indexmenuchild].values.toList()!.last[databysubmenu[indexK].luas]} ${ databysubmenufilter[indexK].luas}");
      //         //
      //         // kesimpulan = "Dengan \nTotal daya : ${databysubmenu.map((e) => e.pupuk.map((e) => int.tryParse(e.hasil) ?? 0).fold(0, (prev, curr) => prev + curr).toInt()).toList()[indexK]} Watt \nBiaya: ${(databysubmenu[indexK].pupuk.map((e) => int.tryParse(e.hasil) ?? 0).fold(0, (prev, curr) => prev + curr).toInt() / 1000 * double.tryParse(golonganListrik[widget.indexmenuchild].values.toList()![0][databysubmenufilter[indexK].luas])!).round()}";
      //         return "Rp. ${formatRupiah(datafilterMyData1![c
      //             .ObjectIndexSelectedEdit
      //             .value].hasilTotal.toString())}";
      //       },
      //       judulchild: 'Tambahkan Kebutuhan Tani',
      //       hargamulti: 'yes',
      //       addWidget:
      //       // childWidgetFieldTanaman(onChangeState: (totalHarga){
      //       //   setState(() {
      //       //
      //       //   });
      //       // }),
      //       childWidgetField(onChangeState: (totalHarga){
      //         setState(() {
      //
      //         });
      //       },),
      //       waktu: false,
      //       selectidkal: indexselectidkalku,
      //     ),
      //
      //   ],
      // ),
    ];
  }

  List<Widget> bahanBakars(int indexsubmenu, int indexmenu) {
    return [
      Padding(
        padding: EdgeInsets.symmetric(horizontal: defaultPadding),
        child: ProsesWidgets(
          datakatRumus: dataKategoriRumus
              .where((element) => element.nama == "Konsumsi BBM")
              .toList(),
          juduls: "Konsumsi BBM",
          tema: warnas(dataKategoriMenuRawatan[indexmenu].colorku[0]),
          namaobj: "Type Lahan",
          idTipeMediaTanam: 0,
          rumus: "(JTah - JTaw)/JKbBkr",
          dropdowns: false,
          onChangeState: (indexs, indpot, satuan, datavarmedia, rumuslahan) {
            c.datashasilfix.value = getDataTakaranDosisTanamanG(
                indexsubmenu, "(JTah - JTaw)/JKbBkr");
            c.islabelLayer.value =
                c.dataMenuKalkulasi.value[c.selectedItemCalcT.value];
            // });
          },
          indexmenu: widget.indexmenuchild,
          indexsubmenu: widget.indexsubmenuchild,
          idBentukMediaTanam: 0,
          satuan: '',
          warna: warnas(dataKategoriMenuRawatan[indexmenu].colorku[0]),
        ),
      ),
    ];
  }

  String kesimpulan = "";

  // List<MyData> databysubmenufilters =[];
  List<MyData> databysubmenufilters = [];

  List<Widget> listriks(int indexsubmenu, int indexmenu) {
    c.selectsubmenu.value = indexsubmenu;
    return [
      Padding(
        padding: EdgeInsets.all(defaultPadding),
        child: childWidgetFieldListrik(
          onChangeState: (totalHarga) {
            // setState(() {
            //
            // });
          },
        ),
      ),
    ];
  }

  List<Widget> kolams(int indexsubmenu, int indexmenu) {
    return [
      Column(
        children: [
          FieldskuMain(
            indexmenu: c.indexMenuRawatan.value,
            indexsubmenu: c.indexsubMenuRawatan.value,
            onStateChange: (List<MyData> s) {},
            judul: "Pembesaran ikan diKolam",
            penjelas:
                "Anda menggunakan keperluan pembesaran ikan pada kolam dengan Estimasi biaya: ",
            hasilakhir: (sa) {
              if (datafilterMyData1!
                  .map((e) => double.tryParse(e.hasilTotal)!)
                  .isEmpty) {
                return "Rp. 0";
              } else {
                return "Rp.${formatRupiah(datafilterMyData1!.map((e) => double.tryParse(e.hasilTotal)!).reduce((value, element) => value + element).toString())}";
              }
            },
            kesimpulanPerKonten: (indexK) {
              // print("apakah null? ${databysubmenu.map((e) => e.pupuk.map((e) => int.tryParse(e.hasil) ?? 0).fold(0, (prev, curr) => prev + curr).toInt()).toList()[indexK]} Watt \nBiaya: ${golonganListrik[widget.indexmenuchild].values.toList()!.last[databysubmenu[indexK].luas]} ${ databysubmenufilter[indexK].luas}");
              //
              // kesimpulan = "Dengan \nTotal daya : ${databysubmenu.map((e) => e.pupuk.map((e) => int.tryParse(e.hasil) ?? 0).fold(0, (prev, curr) => prev + curr).toInt()).toList()[indexK]} Watt \nBiaya: ${(databysubmenu[indexK].pupuk.map((e) => int.tryParse(e.hasil) ?? 0).fold(0, (prev, curr) => prev + curr).toInt() / 1000 * double.tryParse(golonganListrik[widget.indexmenuchild].values.toList()![0][databysubmenufilter[indexK].luas])!).round()}";
              return "Rp. ${formatRupiah(datafilterMyData1![c.ObjectIndexSelectedEdit.value].hasilTotal.toString())}";
            },
            judulchild: 'Tambahkan Kebutuhan Tani',
            hargamulti: 'yes',
            addWidget: childWidgetFieldKolam(
              onChangeState: (totalHarga) {
                setState(() {});
              },
              info: false,
            ),
            waktu: false,
            selectidkal: indexselectidkalku,
          ),
        ],
      ),
    ];
  }

  List<Widget> Maggots(int indexsubmenu, int indexmenu) {
    return [
      Column(
        children: [
          FieldskuMain(
            indexmenu: c.indexMenuRawatan.value,
            indexsubmenu: c.indexsubMenuRawatan.value,
            onStateChange: (List<MyData> s) {},
            judul: "Pembesaran Maggot",
            penjelas:
                "Anda menggunakan keperluan pembesaran ikan pada kolam dengan Estimasi biaya: ",
            hasilakhir: (sa) {
              if (datafilterMyData1!
                  .map((e) => double.tryParse(e.hasilTotal)!)
                  .isEmpty) {
                return "Rp. 0";
              } else {
                return "Rp.${formatRupiah(datafilterMyData1!.map((e) => double.tryParse(e.hasilTotal)!).reduce((value, element) => value + element).toString())}";
              }

              // print("asa ${datafilterMyData1!.map((e) => double.tryParse(e.hasilTotal)!)}");
            },
            kesimpulanPerKonten: (indexK) {
              // print("apakah null? ${databysubmenu.map((e) => e.pupuk.map((e) => int.tryParse(e.hasil) ?? 0).fold(0, (prev, curr) => prev + curr).toInt()).toList()[indexK]} Watt \nBiaya: ${golonganListrik[widget.indexmenuchild].values.toList()!.last[databysubmenu[indexK].luas]} ${ databysubmenufilter[indexK].luas}");
              //
              // kesimpulan = "Dengan \nTotal daya : ${databysubmenu.map((e) => e.pupuk.map((e) => int.tryParse(e.hasil) ?? 0).fold(0, (prev, curr) => prev + curr).toInt()).toList()[indexK]} Watt \nBiaya: ${(databysubmenu[indexK].pupuk.map((e) => int.tryParse(e.hasil) ?? 0).fold(0, (prev, curr) => prev + curr).toInt() / 1000 * double.tryParse(golonganListrik[widget.indexmenuchild].values.toList()![0][databysubmenufilter[indexK].luas])!).round()}";
              return "Rp. ${formatRupiah(datafilterMyData1![c.ObjectIndexSelectedEdit.value].hasilTotal.toString())}";
            },
            judulchild: 'Tambahkan Kebutuhan Maggot',
            hargamulti: 'yes',
            addWidget: childWidgetFieldMaggot(
              onChangeState: (totalHarga) {
                setState(() {});
              },
            ),
            waktu: false,
            selectidkal: indexselectidkalku,
          ),
        ],
      ),
    ];
  }

  List<Widget> Ayam(int indexsubmenu, int indexmenu) {
    return [
      Column(
        children: [
          FieldskuMain(
            indexmenu: c.indexMenuRawatan.value,
            indexsubmenu: c.indexsubMenuRawatan.value,
            onStateChange: (List<MyData> s) {},
            judul: "Produksi Telur Ayam",
            penjelas:
                "Anda menggunakan keperluan pembesaran ikan pada kolam dengan Estimasi biaya: ",
            hasilakhir: (sa) {
              if (datafilterMyData1!
                  .map((e) => double.tryParse(e.hasilTotal)!)
                  .isEmpty) {
                return "Rp. 0";
              } else {
                return "Rp.${formatRupiah(datafilterMyData1!.map((e) => double.tryParse(e.hasilTotal)!).reduce((value, element) => value + element).toString())}";
              }
            },
            kesimpulanPerKonten: (indexK) {
              // print("apakah null? ${databysubmenu.map((e) => e.pupuk.map((e) => int.tryParse(e.hasil) ?? 0).fold(0, (prev, curr) => prev + curr).toInt()).toList()[indexK]} Watt \nBiaya: ${golonganListrik[widget.indexmenuchild].values.toList()!.last[databysubmenu[indexK].luas]} ${ databysubmenufilter[indexK].luas}");
              //
              // kesimpulan = "Dengan \nTotal daya : ${databysubmenu.map((e) => e.pupuk.map((e) => int.tryParse(e.hasil) ?? 0).fold(0, (prev, curr) => prev + curr).toInt()).toList()[indexK]} Watt \nBiaya: ${(databysubmenu[indexK].pupuk.map((e) => int.tryParse(e.hasil) ?? 0).fold(0, (prev, curr) => prev + curr).toInt() / 1000 * double.tryParse(golonganListrik[widget.indexmenuchild].values.toList()![0][databysubmenufilter[indexK].luas])!).round()}";
              return "Rp. ${formatRupiah(datafilterMyData1![c.ObjectIndexSelectedEdit.value].hasilTotal.toString())}";
            },
            judulchild: 'Tambahkan Kebutuhan Ayam Petelur',
            hargamulti: 'yes',
            addWidget: childWidgetFieldAyam(
              onChangeState: (totalHarga) {
                setState(() {});
              },
              info: false,
            ),
            waktu: false,
            selectidkal: indexselectidkalku,
          ),
        ],
      ),
    ];
  }

  Map? hasila = {};
  @override
  Widget build(BuildContext context) {
    List<List<Widget> Function(int, int)> listWidgetFiled = [
      bahanBakars,
      lars,
      listriks,
      kolams,
      Maggots,
      Ayam
    ];
    // print("aoks${sdataMenuKalkulasi}");

    return Stack(
      children: [
        Positioned.fill(
          child: Container(
            color: Colors.white,
          ),
        ),
        Column(children: [
          Obx(() {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: defaultPadding / 2),
              child: Column(
                children: [
                  TabButtonku(
                    typetema: 1,
                    temaWarna: Colors.black54,
                    initialStateselected: c.selectedItemCalcT.value,
                    listWidgetPageView:
                        // Kalkulasi,
                        listWidgetFiled[widget.indexmenuchild](
                            widget.indexsubmenuchild, widget.indexmenuchild),
                    dataCategoryList: c.dataMenuKalkulasi.value,
                    dataCategoryImgList: ["assets/images/Petrokimia_logo.png"],
                    onStateChange: (selected, categoryDetail) {
                      // c.selectedItemCalcTprev.value = c.selectedItemCalcT.value;

                      setState(() {
                        c.selectedItemCalcT.value = selected;

                        c.isviewlayer.value = true;
                        c.islabelLayerNow.value =
                            c.dataMenuKalkulasi.value[selected];
                        // cekmenuMediaTanam();

                        // print("inis selected ${selected}");
                      });
                      // print("inis ${c.selectedItemCalcT.value}");
                      indexselectidkalku = c.selectedItemCalcT.value;
                    },
                  ),
                ],
              ),
            );
          }),
        ]),
      ],
    );
  }
}
//
// void cekmenuMediaTanam() {
//   (c.islabelLayerNow.value !="Pot")?c.satuan.value = "m": c.satuan.value = "cm";
//   if(c.islabelLayerNow.value == "Pot"){
//     c.luasmediaTanam.value = "${cariStringnamavar("LMt")} : ${cariValue("LMt")} ${c.satuan.value}³\n ";
//
//   }else if(c.islabelLayerNow.value == "Lahan"){
//     c.luasmediaTanam.value = "${cariStringnamavar("LMt")} : ${cariValue("LMt")} ${c.satuan.value}²";
//   }else{
//     c.luasmediaTanam.value = "${cariStringnamavar("LJt")} : ${cariValue("LMt")} ${c.satuan.value}²";
//   }}
