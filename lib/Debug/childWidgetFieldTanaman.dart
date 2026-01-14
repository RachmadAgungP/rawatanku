import 'dart:convert';

import 'package:rawatt/Debug/childWidgetFieldAyam.dart';
import 'package:rawatt/Debug/childWidgetFieldKolam.dart';
import 'package:rawatt/Debug/formasiKandang.dart';
import 'package:rawatt/Debug/tabelku.dart';
import 'package:rawatt/Debug/uangPerSatuan.dart';
import 'package:rawatt/Debug/widget_mediaLahan.dart';
import 'package:rawatt/components/card_field.dart';
import 'package:rawatt/components/inputan.dart';
import 'package:rawatt/components/tabCostume.dart';
import 'package:rawatt/constants.dart';
import 'package:rawatt/model/dosis/fieldku_kolam1.dart';
import 'package:rawatt/screens/convert/component/Widget_Jenis_Tanah.dart';
import 'package:rawatt/screens/convert/component/Widget_Massa_Tanah.dart';
import 'package:rawatt/screens/home/home_screen.dart';
import 'package:rawatt/screens/product/cariHidroponik.dart';

import 'package:rawatt/size_config.dart';
import 'package:flutter/material.dart';

import 'package:function_tree/function_tree.dart';

import '../../../components/card_expanded.dart';
import '../../../components/card_img.dart';
import '../../../components/card_penjelas.dart';
import '../../../components/card_pupuk.dart';
import '../../../model/MenuRawatan/mdl_MenuRawatan.dart';
import '../../../model/datafix.dart';
import '../../../model/dosis/fieldku_campur.dart';
import '../../../model/kalkulator/mdl_KatMediatanam.dart';
import '../../../model/kalkulator/mdl_KatRumus.dart';
import '../../../model/kalkulator/mdl_KatTanah.dart';
import '../../../model/perusahaan/mdl_KatPerusahaan.dart';
import '../../../model/product/mdl_Produk.dart';
import '../../../rumus.dart';
import 'package:auto_size_text/auto_size_text.dart';
import '../screens/convert/component/Widget_Jarak_Tanaman.dart';
import '../screens/convert/component/Widget_Jenis_Pot.dart';
import '../screens/convert/component/Widget_pH_indikator.dart';
import '../screens/convert/component/inisialisasi_var.dart';
import '../screens/convert/screens/dolomit/Dolomit_display.dart';
import '../screens/convert/screens/dolomit/myMainDolomit.dart';
import '../screens/convert/screens/dosis_pupuk_tanaman/dosis_pupuk_tanaman.dart';

import 'package:get/get.dart';

import '../screens/details/component/component.dart';
import 'aiWork.dart';
import 'childWidgetFieldMaggot.dart';
import 'pipaHidroponik.dart';

class childWidgetFieldTanaman extends StatefulWidget {
  final Function(String) onChangeState;
  String? namaCategory;
  bool? info;
  childWidgetFieldTanaman(
      {super.key, required this.onChangeState, this.namaCategory, this.info});

  @override
  State<childWidgetFieldTanaman> createState() =>
      _childWidgetFieldTanamanState();
}

// int indexMediaLahan = 0;
int indexpot = 0;
// Map dataRumusLuasLahan = {};
// double hasilLahan = 0.0;
// // int indexObjectIndexSelectedEdit = 0;

BuildContext? contexty;
MyData? copiedData;
// MyData? MyDataFilterOBJTanam;

// List<KategoriRumus> datakategorirum = [];
String hargapH = "0";
double hargaTotalpH = 0;

// double hargaMaggot = 0;
// double hargaTotalMaggot = 0;
// Map<dynamic, dynamic> hargaDosis = {};
// Map<dynamic, dynamic> aDosis = {};

// Map<String, String> hagaDosis = {};

Map dataTampungHasil = {};

void hitungProsesTanaman() {
  dataProductsObj.where((element) => element.nama == "dolomit").first.harga =
      hargapH;

  dataProductsObj.where((element) => element.nama == "Maggot").first.harga =
      hargaMaggot.toString();

  // hagaDosis.forEach((key, value) {
  //   dataProductsObj.where((element) => element.nama == key).first.harga =
  //       hagaDosis[key]!;
  // });

  if (copiedData!.propertyLainnya["adaUkurPH"] == false) {
    hargaTotalpH = 0;
  } else {
    hargaTotalpH = double.tryParse(hargapH)! * (cariValue("KpH") * 1000);
  }

  // if (copiedData!.propertyLainnya["adaPakanAlternatif"] == false) {
  //   hargaTotalMaggot = 0;
  // } else {
  //   hargaTotalMaggot = hargaMaggot! * pakanMaggots;
  // }

  // Perhitungan takaran berdasarkan bentuk lahan
  if (copiedData!.propertyLainnya["adaJenisTanah"] == true) {
    c.massaJenis.value = cariValue("q");

    onPresosMtT(c.id_type_tanah.value, false, "m");
    hitung(c.indexsubMenuRawatan.value, "(bTPt/bTHa)*JPk",
        cariValue("vTPt").toString());
  } else {
    if (copiedData!.propertyLainnya["adaUkurPH"] == false) {
      hargaTotalpH = 0;
    }
    onPresospH(
        (datafilterMyData1![c.ObjectIndexSelectedEdit.value]
                    .propertyLainnya["pHData"]["hasil"] ==
                null)
            ? 0
            : cariValue("pH"),
        "m");
    hitung(c.indexsubMenuRawatan.value, "(LMt/10000)*JPk",
        cariValue("LMt").toString());
  }

  datafilterMyData1![c.ObjectIndexSelectedEdit.value] = copiedData!;

  // datafilterMyData1![c.ObjectIndexSelectedEdit.value].kategoriRumusKu =
  //     copiedData!.kategoriRumusKu;
  //
  // datafilterMyData1![c.ObjectIndexSelectedEdit.value].kategoriRumusKu[
  //         copiedData!.propertyLainnya["tampungan"]["indexBentukMediaTanam"]] =
  //     copiedData!.kategoriRumusKu[copiedData!.propertyLainnya["tampungan"]
  //         ["indexBentukMediaTanam"]];

  datafilterMyData1![c.ObjectIndexSelectedEdit.value].luas = copiedData!.luas;

  datafilterMyData1![c.ObjectIndexSelectedEdit.value]
      .propertyLainnya["pHData"] = {
    "pHDiket": listPHIndikator[0].variabels["pHDiket"][1],
    "pHDitanya": listPHIndikator[0].variabels["pHDitanya"][1],
    "hasil": datainputan.value[2]
  };

  datafilterMyData1![c.ObjectIndexSelectedEdit.value]
          .propertyLainnya["satuanMediaLahan"][1] =
      copiedData!.propertyLainnya["satuanMediaLahan"][1];
  datafilterMyData1![c.ObjectIndexSelectedEdit.value]
          .propertyLainnya["satuanMediaLahan"][0] =
      copiedData!.propertyLainnya["satuanMediaLahan"][0];

  datafilterMyData1![c.ObjectIndexSelectedEdit.value]
          .propertyLainnya["alternatifPakan"] =
      copiedData!.propertyLainnya["alternatifPakan"];

  datafilterMyData1![c.ObjectIndexSelectedEdit.value]
          .propertyLainnya["ketebalanTanah"] =
      copiedData!.propertyLainnya["ketebalanTanah"];

  datafilterMyData1![c.ObjectIndexSelectedEdit.value]
      .propertyLainnya["adaUkurPH"] = copiedData!.propertyLainnya["adaUkurPH"];

  datafilterMyData1![c.ObjectIndexSelectedEdit.value]
          .propertyLainnya["adaJenisTanah"] =
      copiedData!.propertyLainnya["adaJenisTanah"];

  datafilterMyData1![c.ObjectIndexSelectedEdit.value]
      .propertyLainnya["indexJb"] = copiedData!.propertyLainnya["indexJb"];

  datafilterMyData1![c.ObjectIndexSelectedEdit.value]
          .propertyLainnya["tampungan"]["indexJenisTanah"] =
      copiedData!.propertyLainnya["tampungan"]["indexJenisTanah"];

  datafilterMyData1![c.ObjectIndexSelectedEdit.value]
          .propertyLainnya["tampungan"]["indexBentukMediaTanam"] =
      copiedData!.propertyLainnya["tampungan"]["indexBentukMediaTanam"];

  datafilterMyData1![c.ObjectIndexSelectedEdit.value]
          .propertyLainnya["tampungan"]["indexperusahaan"] =
      copiedData!.propertyLainnya["tampungan"]["indexperusahaan"];

  datafilterMyData1![c.ObjectIndexSelectedEdit.value]
          .propertyLainnya["tampungan"]["indexperusahaan"] =
      c.indexdropdownPrushn.value;

  datafilterMyData1![c.ObjectIndexSelectedEdit.value]
          .propertyLainnya["tampungan"]["indexjenisPupuk"] =
      copiedData!.propertyLainnya["tampungan"]["indexjenisPupuk"];

  datafilterMyData1![c.ObjectIndexSelectedEdit.value]
          .propertyLainnya["keperluanLainnya"] =
      copiedData!.propertyLainnya["keperluanLainnya"];

  // hargaDosis.keys.toList().forEach((elementw) {
  //   dataProductsObj
  //       .where((element) => element.nama == elementw)
  //       .toList()
  //       .last
  //       .harga = hargaDosis[elementw].toString();
  // });

  datafilterMyData1![c.ObjectIndexSelectedEdit.value]
          .propertyLainnya["indexbentukmedialahanPot"] =
      copiedData!.propertyLainnya["indexbentukmedialahanPot"];
  datafilterMyData1![c.ObjectIndexSelectedEdit.value]
          .propertyLainnya["luasMedia3D"] =
      copiedData!.propertyLainnya["luasMedia3D"];

  datafilterMyData1![c.ObjectIndexSelectedEdit.value]
          .propertyLainnya["satuanMediaLahan3D"] =
      copiedData!.propertyLainnya["satuanMediaLahan3D"];

  datafilterMyData1![c.ObjectIndexSelectedEdit.value]
          .propertyLainnya["jaraktanamTrue"] =
      copiedData!.propertyLainnya["jaraktanamTrue"];

  datafilterMyData1![c.ObjectIndexSelectedEdit.value]
          .propertyLainnya["jarakTanam"] =
      copiedData!.propertyLainnya["jarakTanam"];

  datafilterMyData1![c.ObjectIndexSelectedEdit.value]
          .propertyLainnya["VolumeTampungair"] =
      copiedData!.propertyLainnya["VolumeTampungair"];

  datafilterMyData1![c.ObjectIndexSelectedEdit.value]
          .propertyLainnya["CostumevolumeAir"] =
      copiedData!.propertyLainnya["CostumevolumeAir"];

  datafilterMyData1![c.ObjectIndexSelectedEdit.value]
      .propertyLainnya["DataTabel"] = copiedData!.propertyLainnya["DataTabel"];

  aqw();

  datafilterMyData1![c.ObjectIndexSelectedEdit.value] = copiedData!;

  datafilterMyData1![c.ObjectIndexSelectedEdit.value].propertyLainnya["umur"] =
      copiedData!.propertyLainnya["umur"];

  datafilterMyData1![c.ObjectIndexSelectedEdit.value]
      .propertyLainnya["umurMati"] = copiedData!.propertyLainnya["umurMati"];

  datafilterMyData1![c.ObjectIndexSelectedEdit.value]
      .propertyLainnya["hargaJual"] = copiedData!.propertyLainnya["hargaJual"];
  datafilterMyData1![c.ObjectIndexSelectedEdit.value]
          .propertyLainnya["peliharaans"] =
      copiedData!.propertyLainnya["peliharaans"];

  datafilterMyData1![c.ObjectIndexSelectedEdit.value]
      .propertyLainnya["ukuranPot"] = copiedData!.propertyLainnya["ukuranPot"];
  datafilterMyData1![c.ObjectIndexSelectedEdit.value]
          .propertyLainnya["ukuranPotCostume"] =
      copiedData!.propertyLainnya["ukuranPotCostume"];

  datafilterMyData1![c.ObjectIndexSelectedEdit.value]
          .propertyLainnya["harga/satuan"] =
      copiedData!.propertyLainnya["harga/satuan"];

  datafilterMyData1![c.ObjectIndexSelectedEdit.value]
          .propertyLainnya["hargaPerBanyakSatuan"] =
      copiedData!.propertyLainnya["hargaPerBanyakSatuan"];

  datafilterMyData1![c.ObjectIndexSelectedEdit.value]
          .propertyLainnya["panjangTempatTanam"] =
      copiedData!.propertyLainnya["panjangTempatTanam"];
  datafilterMyData1![c.ObjectIndexSelectedEdit.value]
          .propertyLainnya["diameterLubang"] =
      copiedData!.propertyLainnya["diameterLubang"];

  datafilterMyData1![c.ObjectIndexSelectedEdit.value]
          .propertyLainnya["JarakLubang"] =
      copiedData!.propertyLainnya["JarakLubang"];

  datafilterMyData1![c.ObjectIndexSelectedEdit.value]
          .propertyLainnya["Volume Box Air"] =
      copiedData!.propertyLainnya["Volume Box Air"];
  datafilterMyData1![c.ObjectIndexSelectedEdit.value]
      .propertyLainnya["luasMedia"] = copiedData!.propertyLainnya["luasMedia"];
  datafilterMyData1![c.ObjectIndexSelectedEdit.value]
          .propertyLainnya["Hasilluas3D"] =
      copiedData!.propertyLainnya["Hasilluas3D"];
  datafilterMyData1![c.ObjectIndexSelectedEdit.value].luas = copiedData!.luas;
  fix_updateParentData(datafilterMyData1!);
  setPreference();
}

void aqw() {
  if (copiedData!.propertyLainnya["adaUkurPH"] == false) {
    hargaTotalpH = 0;
  } else {
    hargaTotalpH = double.tryParse(hargapH)! * (cariValue("KpH") * 1000);
  }

  // if (copiedData!.propertyLainnya["adaPakanAlternatif"] == false) {
  //   hargaTotalMaggot = 0;
  // } else {
  //   hargaTotalMaggot = (double.tryParse(hargapH)! *
  //           hasilPersentaseCampur['persenMaggot']!.round() /
  //           100) *
  //       (hasilPersentaseCampur['persenMaggot']!.round() *
  //           (perkirranPakanBanyakTanaman / 1000) /
  //           100);
  // }

  datafilterMyData1![c.ObjectIndexSelectedEdit.value].hasilTotal =
      // (hitungHarga(aDosis, hargaDosis)
      //             .values
      //             .toList()
      //             .reduce((value, element) => value + element) +
      //         (hargaTotalpH + hitungTotalBiaya(beratPupuk)))
      //     .toString();

      ((hitungTotalBiaya(
    hargaPupukPabrik,
    hargaPotTotal,
    hargaTanamanTotal,
  ))).toString();
}
// KategoriRumus? datamediatanamtam;

double hitungTotalBiaya(
    double hargaPupukPabrikt, double totalPot, double totalTanaman) {
  double total = List.from(copiedData!.propertyLainnya["keperluanLainnya"])
      .fold(0.0, (previousValue, element) {
    double biaya = double.tryParse(element['Beban Biaya'].toString())!;
    if (element['Nama Pengeluaran'] == "AB Mix") {
      biaya = hargaPupukPabrikt;
    } else if (element['Nama Pengeluaran'] == 'Pot') {
      biaya = totalPot;
    } else if (element['Nama Pengeluaran'] == 'Bibit') {
      biaya = totalTanaman;
    }
    return previousValue + biaya;
  });
  double totalBiaya = total;

  return totalBiaya;
}

Map transformMap(inputMap) {
  Map resultMap = {};

  if (inputMap.containsKey('p') &&
      inputMap.containsKey('l') &&
      inputMap.containsKey('t')) {
    resultMap['p'] = inputMap['p']!;
    resultMap['l'] = inputMap['l']!;
    resultMap['t'] = inputMap['t']!;
  } else if (inputMap.containsKey('t') &&
      (inputMap.containsKey('r') || inputMap.containsKey('Ri'))) {
    double highest = double.negativeInfinity;
    double lowest = double.infinity;

    if (inputMap.containsKey('r')) {
      double value = inputMap['r']![1];
      if (value > highest) highest = value;
      if (value < lowest) lowest = value;
    }

    if (inputMap.containsKey('Ri')) {
      double value = inputMap['Ri']![1];
      if (value > highest) highest = value;
      if (value < lowest) lowest = value;
    }

    resultMap['p'] = ['jari-jari', highest];
    resultMap['l'] = ['jari-jari', lowest];
    resultMap['t'] = inputMap['t']!;
  } else if (inputMap.containsKey('t')) {
    resultMap['p'] = ['jari-jari', inputMap['t']![1]];
    resultMap['l'] = ['jari-jari', inputMap['t']![1]];
    resultMap['t'] = inputMap['t']!;
  } else {
    // Menangani kasus jika tidak ada kunci yang diinginkan
    resultMap['p'] = ['unknown', 0.0];
    resultMap['l'] = ['unknown', 0.0];
    resultMap['t'] = ['unknown', 0.0];
  }

  return resultMap;
}

String changePath(String path) {
  // Memisahkan bagian-bagian dari path
  List<String> parts = path.split('/');

  // Memisahkan nama file dan ekstensi
  String filename = parts.last;
  List<String> filenameParts = filename.split('.');

  // Menambahkan "Tanaman_" ke nama file sebelum ekstensi
  String newFilename = "Tanaman_${filenameParts.first}.${filenameParts.last}";

  // Mengganti nama file pada bagian terakhir dari path
  parts[parts.length - 1] = newFilename;

  // Menggabungkan kembali bagian-bagian dari path
  return parts.join('/');
}

// Fungsi untuk menampilkan data sesuai dengan tipe data
Widget displayValue(dynamic value) {
  if (value is String) {
    return AutoSizeText(
      value,
      style: TextStyle(fontSize: 10),
      maxLines: 2,
      minFontSize: 3,
      overflow: TextOverflow.ellipsis,
    );
  } else if (value is int || value is double) {
    return AutoSizeText(
      value.toString(),
      style: TextStyle(fontSize: 12),
      maxLines: 2,
      minFontSize: 3,
      overflow: TextOverflow.ellipsis,
    );
  } else if (value is bool) {
    return AutoSizeText(
      value ? 'True' : 'False',
      style: TextStyle(fontSize: 12),
      maxLines: 2,
      minFontSize: 3,
      overflow: TextOverflow.ellipsis,
    );
  } else if (value is List) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: value.map<Widget>((item) => displayValue(item)).toList(),
    );
  } else if (value is Map) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: value.entries.map<Widget>((entry) {
        return Container(
          // width: double.infinity,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AutoSizeText(
                '${entry.key}: ',
                style: TextStyle(fontSize: 12),
                maxLines: 2,
                minFontSize: 3,
                overflow: TextOverflow.ellipsis,
              ),
              Expanded(child: displayValue(entry.value)),
            ],
          ),
        );
      }).toList(),
    );
  } else {
    return Text('Unknown type');
  }
}

Map hasilPersentaseCampur = {};
double hargaPupukPabrik = 0;
double hargaTanamanTotal = 0;
double hargaPotTotal = 0;
double beratPupuk = 0;

double perkirranPakanBanyakTanaman = 0;
double umurTanaman = 0;
double beratTanamanSisaAwal = 0;
double beratTanamanSisaAkhir = 0;

class _childWidgetFieldTanamanState extends State<childWidgetFieldTanaman> {
  int tanamPerCage = 1;
  int cageWidthTanam = 20; // cm
  int cageHeightTanam = 17; // cm
  int cageLengthTanam = 28; // cm
  int PanjangTempatTanam = 28;
  int diameterLubang = 4;
  int jarakLubang = 5;
  int jaraktanam = 0;
  bool _isCheckedJt = false;
  bool _costumevolumeAir = false;
  int maxLevelsTanam = 1;
  int _currentValue = 0;
  bool namaKategoriYes = false;
  String imgaePot = "assets/images/MenuRawatan/RawatTanam/bak_hidroponik.jpg";

  double populasiTanam1Ha = 0;
  double populasiPetak = 0;
  double banyakTanaman = 1;
  double banyakTanamanw = 1;
  double totalHasilPanen = 0;
  double totalKeuntungan = 0;
  final ScrollController _childScrollController = ScrollController();
  final ScrollController _parentScrollController = ScrollController();

  int indexJb = 0;
  List<SayuranBuahCategory> _sayuranBuahData = [];

  List<Widget> fieldoBaterai = [];
  List<TextEditingController> myControlerssoBatrai = [];
  Map dataVariabelbaterai = {};

  List myControlerssoBatraiPlus = [];
  List fieldoBateraiPlus = [];

  List dataPengeluaran = [];

  Map datavarmediaPot = {};
  int p = 3;
  int l = 3;

  int Rekomendasibanyakpot = 0;
  double hargaABmix = 0;
  double hargaTotalABmix = 0;

  List<dynamic> panenKeuntunganData = [];

  List<SayuranBuah>? dataSayur;
  MyData? MyDataFilterOBJTanam;
  String mediaTANAM = "Pot";
  int sisatempatTanaman = 0;
  @override
  void dispose() {
    // TODO: implement dispose
    hargaNotifier.removeListener(_handleHargaUpdate);
    hargaNotifier.dispose();
    super.dispose();
    Future.microtask(() {
      if (simpanhitung = true) {
        widget.onChangeState(
            datafilterMyData1![c.ObjectIndexSelectedEdit.value].hasilTotal);
        print(
            "hasil akhir ${datafilterMyData1![c.ObjectIndexSelectedEdit.value].hasilTotal}");
      }
    });
    _childScrollController.dispose();

    _parentScrollController.dispose();

    // datamediatanamtam = dataKategoriRumus1.where((element) => element.id_MenuRawatan==c.indexMenuRawatan.value && element.idMediaTanam == 0).toList().where((element) => element.nama == "Persegi Panjang").toList().first;
  }

  Widget Containes(int indexFixs, String satuan) {
    String sad = "";

    return CardpHs(
      title: "Pengeluaran : ${dataPengeluaran[indexFixs]["Nama Pengeluaran"]}",
      hasilAkhir: "",
      cardornot: false,
      sizes: heightfit(18),
      texts: "",
      multitext: const [],
      tema: Colors.green.shade800,
      cardCostume: Container(),
      id: 0,
      widgetCostum: SizedBox(
        height: 130,
        width: 350,
        child: FittedBox(
          child: SizedBox(
            height: 130,
            width: 290,
            child: Fields(
              controller: TextEditingController(
                  text: "${(dataPengeluaran[indexFixs]["Beban Biaya"])}"
                      .toString()),
              satuan:
                  "Rp/${(widget.namaCategory == "Tanaman Paku Air") ? "${(dataPengeluaran[indexFixs]["Nama Pengeluaran"] == "Bibit") ? "kg" : dataPengeluaran[indexFixs]["Nama Pengeluaran"]}" : dataPengeluaran[indexFixs]["Nama Pengeluaran"]}",
              title: "Harga \n",
              tema: Colors.black38,
              onStateChange: (values) {
                setState(() {
                  // sad["b"] = values;
                  sad = values;
                  // });
                  //
                  dataPengeluaran[indexFixs]["Beban Biaya"] = sad;

                  // copiedData!.propertyLainnya["keperluanLainnya"][indexFixs]["Beban Biaya"] = sad;
                  print("lolsadasd");
                  // setState(() {
                  //
                });
                // setPreference();
              },
              inputType: TextInputType.number,
              enable: true,
            ),
          ),
        ),
      ),
    );
  }

  void hitunglocal() {
    if (MyDataFilterOBJTanam!.propertyLainnya["adaJenisTanah"] == true) {
      c.massaJenis.value = cariValue("q");

      onPresosMtT(c.id_type_tanah.value, false, 'm');

      onPresospH(cariValue("pH"), "m");

      hitung(c.indexsubMenuRawatan.value, "(bTPt/bTHa)*JPk",
          cariValue("vTPt").toString());
    } else {
      onPresospH(cariValue("pH"), "m");

      if (c.selectedItemCalcT.value == 2) {
        if (cariValue("LJt") == 0 || cariValue("LMt") == 0) {
          populasiTanam1Ha = 0.0;
          populasiPetak = 0.0;
          print("sasda");
        } else {
          print("sasda1");
          populasiTanam1Ha = 10000 / cariValue("LJt");
          populasiPetak = (cariValue("LMt") / 10000) * populasiTanam1Ha;
          print(
              "hasil ${cariValue("LJt")} ${cariValue("LMt")} $populasiTanam1Ha $populasiPetak => ${"($populasiPetak/JPk)*$populasiTanam1Ha"}");
          hitung(
              c.indexsubMenuRawatan.value,
              "($populasiPetak/$populasiTanam1Ha)*JPk",
              cariValue("LMt").toString());
        }
      } else {
        hitung(c.indexsubMenuRawatan.value, "(LMt/10000)*JPk",
            cariValue("LMt").toString());
        print("sasda");
      }
    }

    // if (MyDataFilterOBJTanam!.propertyLainnya["adaPakanAlternatif"] == false) {
    //   hargaTotalMaggot = 0;
    // } else {
    //   hargaTotalMaggot = (double.tryParse(hargapH)! *
    //           hasilPersentaseCampur['persenMaggot']!.round() /
    //           100) *
    //       (hasilPersentaseCampur['persenMaggot']!.round() *
    //           (perkirranPakanBanyakTanaman / 1000) /
    //           100);
    // }
  }

  void updateData(int index, String key, double value) {
    Future.microtask(() {
      setState(() {
        panenKeuntunganData[index][key] = value;
        // generateInitialData();

        totalHasilPanen = panenKeuntunganData.fold(
            0.0, (sum, item) => sum + item['hasilPanen']);
        totalKeuntungan = panenKeuntunganData.fold(
            0.0,
            (sum, item) =>
                sum +
                (item['hasilPanen'] as double) *
                    (item['hargaPerKg'] as double));

        MyDataFilterOBJTanam!.propertyLainnya["DataTabel"] =
            panenKeuntunganData;
      });
    });
  }

  String imgInstalasi =
      "assets/images/MenuRawatan/RawatTanam/kandangHidroponik.png";
  Offset position = Offset(100, 100); // Posisi awal widget
  Map hasila = {};

  int indexInt = 0;
  Map datavar = {"panjang": 0, "lebar": 0};
  Map hasila3D = {};
  Map datavar3D = {"p": 0, "l": 0, "t": 0};
  String satuans3D = "m";
  String satuans = "m";
  int sa = 0;

  late ValueNotifier<Map<String, dynamic>> hargaNotifier = ValueNotifier({
    "hargaPer": 0.0,
    "perBanyak": 0.0,
    "satuan": "",
    "hasilrp": 0.0,
  });

  @override
  void initState() {
    // datavar =

    // TODO: implement initState
    super.initState();

    dataTampungHasil = {};

    _sayuranBuahData = parseSayuranBuahData(dataJson)
        .where((element) => element.category == widget.namaCategory)
        .toList();
    dataSayur = _sayuranBuahData.first.data;

    // List<MyData> datads = List<MyData>.from(datafilterMyData1!);
    MyDataFilterOBJTanam = MyData.fromJson(json.decode(json.encode(
        MyData.toMap(datafilterMyData1![c.ObjectIndexSelectedEdit.value]))));

    copiedData = MyDataFilterOBJTanam!;

    // copiedData = MyData.fromJson(dataMap);
    dataPengeluaran =
        List.from(copiedData!.propertyLainnya["keperluanLainnya"]);

    if (MyDataFilterOBJTanam!.propertyLainnya["keperluanLainnya"][2]
            ["Beban Biaya"] ==
        1000) {
      (widget.namaCategory == "Tanaman Paku Air")
          ? dataPengeluaran[2]["Beban Biaya"] = 20000
          : dataPengeluaran[2]["Beban Biaya"];
    }

    datavar3D = MyDataFilterOBJTanam!.propertyLainnya["luasMedia3D"];
    // MyDataFilterOBJTanam!.luas = "0";
    satuans = MyDataFilterOBJTanam!.propertyLainnya["satuanMediaLahan"][0];
    satuans3D = MyDataFilterOBJTanam!.propertyLainnya["satuanMediaLahan3D"];

    _isCheckedJt = MyDataFilterOBJTanam!.propertyLainnya["jaraktanamTrue"];
    _costumevolumeAir =
        MyDataFilterOBJTanam!.propertyLainnya["CostumevolumeAir"];

    if (MyDataFilterOBJTanam!.propertyLainnya["namaTanaman"] == "") {
      MyDataFilterOBJTanam!.propertyLainnya["namaTanaman"] =
          widget.namaCategory;
    }
    indexInt = MyDataFilterOBJTanam!.propertyLainnya["tampungan"]
        ["indexBentukMediaTanam"];
    print("ssd $indexInt ");

    print("indexJb sebelum $indexJb");
    indexJb = int.tryParse(
        MyDataFilterOBJTanam!.propertyLainnya["indexJb"].toString())!;
    print("indexJb $indexJb");

    diameterLubang = MyDataFilterOBJTanam!.propertyLainnya["lubangtanam"];
    // print(
    //     "index select12 ${copiedData!.propertyLainnya["keperluanLainnya"][1]["Beban Biaya"]} ");

    if (c.selectedItemCalcT.value != 2) {
      if (MyDataFilterOBJTanam!.kategoriRumusKu
          .where((element) => element.nama == "Persegi Panjang")
          .isEmpty) {
        MyDataFilterOBJTanam!.kategoriRumusKu = List<KategoriRumus>.from([
          for (var i = 0; i < kategoriRumus.length; i++)
            KategoriRumus(
                id: i,
                idKalkulasi: kategoriRumus[i]["idKalkulasi"],
                idMediaTanam: kategoriRumus[i]["idMediaTanam"],
                vari: kategoriRumus[i]["vari"],
                nama: kategoriRumus[i]["nama"],
                rumus: kategoriRumus[i]["rumus"],
                valuess: kategoriRumus[i]["value"],
                // fieldValue: kategoriRumus[i]["fieldValue"],
                img: kategoriRumus[i]["img"],
                id_MenuRawatan: kategoriRumus[i]["id_MenuRawatan"])
        ])
            .where((element) => (c.indexMenuRawatan.value == 5)
                ? element.id_MenuRawatan == 1 && element.idMediaTanam == 0
                : element.id_MenuRawatan == c.indexMenuRawatan.value &&
                    element.idMediaTanam == 0)
            .toList();
        print(
            "index select 2 ${MyDataFilterOBJTanam!.kategoriRumusKu} ${c.ObjectIndexSelectedEdit.value}");
      } else {}

      if (MyDataFilterOBJTanam!.propertyLainnya["ukuranPot"].runtimeType !=
          List<KategoriRumus>) {
        MyDataFilterOBJTanam!.propertyLainnya["ukuranPot"] = (json.decode(json
                    .encode(MyDataFilterOBJTanam!.propertyLainnya["ukuranPot"]))
                as List<dynamic>)
            .map<KategoriRumus>((item) => KategoriRumus.fromJson(item))
            .toList();
      }

      if (MyDataFilterOBJTanam!.propertyLainnya["ukuranPot"]
          .where((element) => element.nama == "Balok")
          .isEmpty) {
        MyDataFilterOBJTanam!.propertyLainnya["ukuranPot"] =
            List<KategoriRumus>.from([
          for (var i = 0; i < kategoriRumus.length; i++)
            KategoriRumus(
                id: i,
                idKalkulasi: kategoriRumus[i]["idKalkulasi"],
                idMediaTanam: kategoriRumus[i]["idMediaTanam"],
                vari: kategoriRumus[i]["vari"],
                nama: kategoriRumus[i]["nama"],
                rumus: kategoriRumus[i]["rumus"],
                valuess: kategoriRumus[i]["value"],
                // fieldValue: kategoriRumus[i]["fieldValue"],
                img: kategoriRumus[i]["img"],
                id_MenuRawatan: kategoriRumus[i]["id_MenuRawatan"])
        ])
                .where((element) =>
                    element.id_MenuRawatan == c.indexMenuRawatan.value &&
                    element.idMediaTanam == 1)
                .toList();
      } else {}
    }

    onPresospH(
        (MyDataFilterOBJTanam!.propertyLainnya["pHData"]["hasil"] == null)
            ? 0
            : cariValue("pH"),
        'm');

    // indexMediaLahan = MyDataFilterOBJTanam!.propertyLainnya["tampungan"]
    //     ["indexBentukMediaTanam"];

    indexpot =
        MyDataFilterOBJTanam!.propertyLainnya["indexbentukmedialahanPot"];

    print("data dosis ${MyDataFilterOBJTanam!.varii.map((e) => e.dataDosis)}");

    for (var data in MyDataFilterOBJTanam!.varii.map((e) => e.dataDosis)) {
      data.forEach((key, value) {
        hagaDosis[key] = "0";
      });
    }

    // hagaDosis.forEach((key, value) {
    //   hagaDosis[key] =
    //       dataProductsObj.where((element) => element.nama == key).first.harga;
    // });

    if (MyDataFilterOBJTanam!.propertyLainnya["pHData"].isEmpty) {
      MyDataFilterOBJTanam!.propertyLainnya["pHData"] = {
        "hasil": 0.0,
        "pHDitanya": 6.1,
        "pHDiket": 6.0
      };
    } else {
      listPHIndikator[0].variabels["pHDiket"][1] =
          MyDataFilterOBJTanam!.propertyLainnya["pHData"]["pHDiket"];
      listPHIndikator[0].variabels["pHDitanya"][1] =
          MyDataFilterOBJTanam!.propertyLainnya["pHData"]["pHDitanya"];
      // datainputan.value[2] = MyDataFilterOBJTanam!.propertyLainnya["pHData"]["hasil"];

      MyDataFilterOBJTanam!.propertyLainnya["pHData"] =
          MyDataFilterOBJTanam!.propertyLainnya["pHData"];
    }

    // if (MyDataFilterOBJTanam!
    //     .kategoriRumusKu[indexMediaLahan].valuess.isEmpty) {
    //   MyDataFilterOBJTanam!.kategoriRumusKu[indexMediaLahan].valuess =
    //       variablesNew(
    //           MyDataFilterOBJTanam!.kategoriRumusKu[indexMediaLahan].rumus, 0);
    //
    // } else if (MyDataFilterOBJTanam!
    //     .kategoriRumusKu[indexMediaLahan].valuess.isNotEmpty) {
    //
    //
    //
    //
    //   // kategoriRumus[indexMediaLahan]["value"] =  MyDataFilterOBJTanam!.propertyLainnya["luasMedia"];
    //    // MyDataFilterOBJTanam!.kategoriRumusKu[indexMediaLahan].valuess = MyDataFilterOBJTanam!.propertyLainnya["luasMedia"];
    //  }

    if (MyDataFilterOBJTanam!.propertyLainnya["luasMedia"].isEmpty) {
      MyDataFilterOBJTanam!.propertyLainnya["luasMedia"] = datavar;

      print("lols2 $datavar");
    } else {
      datavar = MyDataFilterOBJTanam!.propertyLainnya["luasMedia"];
      print("lols $datavar");
    }

    if (MyDataFilterOBJTanam!
        .propertyLainnya["ukuranPot"][indexpot].valuess.isEmpty) {
      MyDataFilterOBJTanam!.propertyLainnya["ukuranPot"][indexpot].valuess =
          variablesNew(
              MyDataFilterOBJTanam!
                  .propertyLainnya["ukuranPot"][indexpot].rumus,
              0);
    } else if (MyDataFilterOBJTanam!
        .propertyLainnya["ukuranPot"][indexpot].valuess.isNotEmpty) {
      // print(
      //     "field 12 12 13 => ada  ${MyDataFilterOBJTanam!.kategoriRumusKu[indexMediaLahan].valuess}");
    }

    c.id_type_tanah.value =
        MyDataFilterOBJTanam!.propertyLainnya["tampungan"]["indexJenisTanah"];

    // MyDataFilterOBJTanam!.propertyLainnya["tampungan"]["indexJenisTanah"] =
    //     datafilterMyData1![c.ObjectIndexSelectedEdit.value]
    //         .propertyLainnya["tampungan"]["indexJenisTanah"];

    c.indexdropdownPrushn.value =
        MyDataFilterOBJTanam!.propertyLainnya["tampungan"]["indexperusahaan"];

    // MyDataFilterOBJTanam!.propertyLainnya["tampungan"]["indexperusahaan"] =
    //     datafilterMyData1![c.ObjectIndexSelectedEdit.value]
    //         .propertyLainnya["tampungan"]["indexperusahaan"];

    // ==============================================
    //
    // print(
    //     "indexss ${c.indexdropdownjenisPemupukan.value} ${datafilterMyData1![c.ObjectIndexSelectedEdit.value].propertyLainnya["tampungan"]["indexjenisPupuk"]}");
    // MyDataFilterOBJTanam!.propertyLainnya["tampungan"]["indexjenisPupuk"] =
    //     datafilterMyData1![c.ObjectIndexSelectedEdit.value]
    //         .propertyLainnya["tampungan"]["indexjenisPupuk"];
    //
    // MyDataFilterOBJTanam!.propertyLainnya["ketebalanTanah"] =
    //     datafilterMyData1![c.ObjectIndexSelectedEdit.value]
    //         .propertyLainnya["ketebalanTanah"];
    //
    // MyDataFilterOBJTanam!.luas =
    //     datafilterMyData1![c.ObjectIndexSelectedEdit.value].luas;
    // c.indexdropdownjenisPemupukan.value =
    //     MyDataFilterOBJTanam!.propertyLainnya["tampungan"]["indexjenisPupuk"];
    //
    // MyDataFilterOBJTanam!.propertyLainnya["alternatifPakan"] =
    //     datafilterMyData1![c.ObjectIndexSelectedEdit.value]
    //         .propertyLainnya["alternatifPakan"];
    //
    // MyDataFilterOBJTanam!.propertyLainnya["ukuranPotCostume"] =
    //     datafilterMyData1![c.ObjectIndexSelectedEdit.value]
    //         .propertyLainnya["ukuranPotCostume"];
    // MyDataFilterOBJTanam!.propertyLainnya["harga/satuan"] =
    // datafilterMyData1![c.ObjectIndexSelectedEdit.value]
    //     .propertyLainnya["harga/satuan"];
    //
    // MyDataFilterOBJTanam!.propertyLainnya["hargaPerBanyakSatuan"] = datafilterMyData1![c.ObjectIndexSelectedEdit.value]
    //     .propertyLainnya["hargaPerBanyakSatuan"];
    //
    // MyDataFilterOBJTanam!.propertyLainnya["DataTabel"] = datafilterMyData1![c.ObjectIndexSelectedEdit.value]
    //     .propertyLainnya["DataTabel"];
    // print(
    //     "ping${datafilterMyData1![c.ObjectIndexSelectedEdit.value].propertyLainnya["alternatifPakan"]} ");

    hargaTotalABmix = double.tryParse("${dataPengeluaran[3]["Beban Biaya"]}")!;

    hargapH = dataProductsObj
        .where((element) => element.nama == "dolomit")
        .first
        .harga;

    hargaMaggot = double.tryParse(dataProductsObj
        .where((element) => element.nama == "Maggot")
        .first
        .harga)!;

    dataVariabelbaterai = {
      "Umur mulai pemeliharaan (Minggu)":
          MyDataFilterOBJTanam!.propertyLainnya["umur"],
      "Umur Panen (Minggu)": MyDataFilterOBJTanam!.propertyLainnya["umurMati"],
      "Perkiraan Bobot per Ikan Panen (Gr)":
          MyDataFilterOBJTanam!.propertyLainnya["hargaJual"],
      // rasio jumlah pakan yang dibutuhkan untuk menghasilkan 1 kg
      "Banyak Tanaman : ": MyDataFilterOBJTanam!.propertyLainnya["peliharaans"],
      "Jenis Tanaman": MyDataFilterOBJTanam!.propertyLainnya["indexJb"],
      "Harga Jual Telur /telur":
          MyDataFilterOBJTanam!.propertyLainnya["ketebalanTanah"],
      "Volume Penampung air (Box)":
          MyDataFilterOBJTanam!.propertyLainnya["Volume Box Air"],
    };

    // dataVariabelbateraiPlus =
    //     MyDataFilterOBJTanam!.propertyLainnya["alternatifPakan"];

    myControlerssoBatraiPlus =
        myControl(MyDataFilterOBJTanam!.propertyLainnya["alternatifPakan"]);
    fieldoBateraiPlus = fieldso(
        false,
        MyDataFilterOBJTanam!.propertyLainnya["alternatifPakan"],
        myControlerssoBatraiPlus);

    // {
    // "proteinPakanPabrik": [38.0, "Perkiraan protein pada pakan Pabrik"],
    // "proteinMaggot": [40.0, "Perkiraan protein pada Maggot"],
    // "kebutuhanProtein": [38.0, "Perkiraan protein pada Tanaman"],
    // "kebutuhanPakanPabrik": [
    // 50.0,
    // "Perkiraan persentase pakan pabrik untuk Tanaman"
    // ]
    // }

    myControlerssoBatrai = myControl(dataVariabelbaterai);
    fieldoBaterai = fieldso(false, dataVariabelbaterai, myControlerssoBatrai);

    // MyDataFilterOBJTanam!.propertyLainnya["indexJb"] = int.tryParse(
    //     datafilterMyData1![c.ObjectIndexSelectedEdit.value]
    //         .propertyLainnya["indexJb"]
    //         .toString())!;

    variablesNew(MyDataFilterOBJTanam!.kategoriRumusKu.toList()[0].rumus,
        1500 / 100.round());

    if (MyDataFilterOBJTanam!.propertyLainnya["satuanMediaLahan"][0] == "m") {
      p = (datavar["panjang"] * 100).round();
      l = (datavar["lebar"] * 100).round();
    } else {
      p = (datavar["panjang"]).round();
      l = (datavar["lebar"]).round();
    }
    // p = double.parse(datavar["panjang"].toString()).toInt();
    // l = double.parse(datavar["lebar"].toString()).toInt();
    print("panjang$p ");
    if (MyDataFilterOBJTanam!.luas == "") {
      MyDataFilterOBJTanam!.luas = "0";
    }
    widget.namaCategory == "Sayuran Daun"
        ? namaKategoriYes = false
        : namaKategoriYes = true;

    if (MyDataFilterOBJTanam!.propertyLainnya["DataTabel"].isEmpty) {
      generateInitialData(banyakTanaman);
    } else {
      panenKeuntunganData = MyDataFilterOBJTanam!.propertyLainnya["DataTabel"];
    }

    if (_isCheckedJt == true) {
      jaraktanam = MyDataFilterOBJTanam!.propertyLainnya["jarakTanam"];
    } else {
      jaraktanam = dataSayur![indexJb].jaraktanam;
    }

    if (_costumevolumeAir == true) {
      volumePenampungAir = (widget.namaCategory == "Tanaman Paku Air")
          ? 0
          : double.tryParse(MyDataFilterOBJTanam!
              .propertyLainnya["Volume Box Air"]
              .toString())!;
    } else {
      volumePenampungAir = 80;
    }

    // if (MyDataFilterOBJTanam!.propertyLainnya["ukuranPotCostume"] == false) {
    //   // {"panjang": double.tryParse(PanjangTempatTanam.toString())!, "diameter": diameterLubang ,"jarakLubang": 5.0},
    //
    //   (namaKategoriYes)
    //       ? (widget.namaCategory == "Tanaman Paku Air")
    //           ? {
    //               tanamPerCage = 1,
    //               cageWidthTanam = 31, // cm
    //               cageHeightTanam = 8, // cm
    //               cageLengthTanam = 40, // cm
    //               PanjangTempatTanam = 40,
    //               maxLevelsTanam = 3,
    //   imgInstalasi = "assets/images/MenuRawatan/RawatTanam/kandangAzolla.png"
    //             }
    //           : {
    //               tanamPerCage = 1,
    //               cageWidthTanam = 20, // cm
    //               cageHeightTanam = 17, // cm
    //               cageLengthTanam = 28, // cm
    //               PanjangTempatTanam = 28,
    //               maxLevelsTanam = 1,
    //     imgInstalasi = "assets/images/MenuRawatan/RawatTanam/pot.png"
    //             }
    //       : {
    //           tanamPerCage = 10,
    //           cageWidthTanam = 3, // cm
    //           cageHeightTanam = 30, // cm
    //           cageLengthTanam = 10, // cm
    //           PanjangTempatTanam = 100,
    //           maxLevelsTanam = 4,
    //           diameterLubang = 4,
    //           jarakLubang = 5,
    //     imgInstalasi = "assets/images/MenuRawatan/RawatTanam/kandangHidroponik.png"
    //         };
    // } else {
    //   if (namaKategoriYes == false) {
    //     cageWidthTanam = 3; // cm
    //     cageHeightTanam = 30; // cm
    //     cageLengthTanam = 10; // cm
    //
    //     PanjangTempatTanam =
    //         MyDataFilterOBJTanam!.propertyLainnya["panjangTempatTanam"];
    //     diameterLubang =
    //         MyDataFilterOBJTanam!.propertyLainnya["diameterLubang"];
    //     jarakLubang = MyDataFilterOBJTanam!.propertyLainnya["JarakLubang"];
    //     maxLevelsTanam = 4;
    //
    //     tanamPerCage = ((PanjangTempatTanam - diameterLubang) /
    //             (jaraktanam + diameterLubang))
    //         .floor();
    //     print(
    //         "jaraktanam ${tanamPerCage} ${PanjangTempatTanam} ${diameterLubang}");
    //   }
    // }

    (namaKategoriYes)
        ? {
            mediaTANAM = "Pot",
            if (dataPengeluaran[1]["Beban Biaya"] == 30000)
              {dataPengeluaran[1]["Beban Biaya"] = 30000},
            (widget.namaCategory == "Tanaman Paku Air")
                ? imgaePot = "assets/images/MenuRawatan/RawatTanam/box.jpg"
                : imgaePot =
                    "assets/images/MenuRawatan/RawatTanam/bak_hidroponik.jpg"
          }
        : {
            mediaTANAM = "Pipa",
            if (dataPengeluaran[1]["Beban Biaya"] == 30000)
              {dataPengeluaran[1]["Beban Biaya"] = 45000},
            imgaePot = "assets/images/MenuRawatan/RawatTanam/pipa.jpg",
          };

    print("Sayuran Daun${widget.namaCategory} $namaKategoriYes");

    if (MyDataFilterOBJTanam!.propertyLainnya["panjangTempatTanam"] == 0) {
      MyDataFilterOBJTanam!.propertyLainnya["panjangTempatTanam"] =
          PanjangTempatTanam;
    }

    // MyDataFilterOBJTanam!.propertyLainnya["jarakTanam"] = jaraktanam;

    if (MyDataFilterOBJTanam!.propertyLainnya["ukuranPotCostume"] == false) {
      // {"panjang": double.tryParse(PanjangTempatTanam.toString())!, "diameter": diameterLubang ,"jarakLubang": 5.0},

      (namaKategoriYes)
          ? {
              (widget.namaCategory == "Tanaman Paku Air")
                  ? {
                      maxLevelsTanam = 1,
                    }
                  : {
                      maxLevelsTanam = 1,
                    }
            }
          : {maxLevelsTanam = 1};
    } else {
      if (namaKategoriYes == false) {
        maxLevelsTanam = 1;
      }
    }
    highestNumber = 1;

    hargaABmix = double.tryParse(MyDataFilterOBJTanam!
        .propertyLainnya["hargaPerBanyakSatuan"]["hasilrp"]
        .toString())!;

    aturLayout();
    onPresoqw();

    print(
        "lok ${MyDataFilterOBJTanam!.propertyLainnya["hargaPerBanyakSatuan"]}");

    // Copy nilai awal jika ada
    if (MyDataFilterOBJTanam?.propertyLainnya["hargaPerBanyakSatuan"] != null) {
      hargaNotifier.value = Map<String, dynamic>.from(
          MyDataFilterOBJTanam!.propertyLainnya["hargaPerBanyakSatuan"]);
    }

    hargaNotifier.addListener(_handleHargaUpdate);
  }

  // 2. Handler untuk update state
  void _handleHargaUpdate() {
    if (!mounted) return;
    Future.microtask(() {
      setState(() {
        hargaTotalABmix = hargaNotifier.value["hasilrp"] ?? 0;
        // Simpan perubahan ke global state
        MyDataFilterOBJTanam!.propertyLainnya["hargaPerBanyakSatuan"] = {
          "hargaPer": hargaNotifier.value["hargaPer"],
          "perBanyak": hargaNotifier.value["perBanyak"],
          "satuan": hargaNotifier.value["satuan"],
          "hasilrp": hargaNotifier.value["hasilrp"],
        };
      });
    });
  }

  // 3. Widget builder yang dioptimasi
  Widget _buildHargaDisplay() {
    return ValueListenableBuilder<Map<String, dynamic>>(
      valueListenable: hargaNotifier,
      builder: (context, value, _) {
        final formattedHarga =
            formatRupiah((value["hasilrp"] ?? 0).toStringAsFixed(0));

        return Text(
          "\nTotal harga untuk AB Mix $banyakTanaman "
          "${widget.namaCategory == "Tanaman Paku Air" ? "Box" : "instalasi $mediaTANAM"}",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: heightfit(sT16),
          ),
        );
      },
    );
  }

  double volumePenampungAir = 0;

  List<Widget> fieldso(bool totalDaya, Map data, List controllerr) {
    List<Widget> fieldsss = [];

    fieldsss = List<Widget>.generate(data.keys.toList().length, (index) {
      TextEditingController controllers =
          List<TextEditingController>.from(controllerr).toList()[index];

      return Fields(
        controller: (controllers.text.isEmpty)
            ? TextEditingController(text: "0")
            : controllers,
        // dataKategoriInisialisasi.where((element) => element.vari == data.keys.elementAt(index)[0].toString()).first.satuan
        satuan: "",
        title: (widget.namaCategory == "Tanaman Paku Air")
            ? index == 3
                ? "Banyak Box"
                : data.keys.toList()[index].toString()
            : data.keys.toList()[index].toString(),
        tema: Colors.green,
        onStateChange: (valu) {
          String values = valu;
          if (valu.isEmpty) {
            valu = "0";
          }
          if (index == 3) {
            // maxLevelsTanamTurun();
            // aturLayout();
            if (jaraktanam >= 50) {
              // maxLevelsTanamTurun();
              aturLayout();
            }
            aturLayout();
            print("llsa");
          }
          onPresoqw();
        },
        inputType: (index == 0)
            ? TextInputType.text
            : TextInputType.numberWithOptions(decimal: true),
        enable: (totalDaya == false)
            ? true
            : (index == data.keys.toList().length - 1)
                ? false
                : true,
      );
    });

    return fieldsss;
  }

  void onPresoqw() {
    setState(() {
      // Map data = dataVariabel;
      Map dataB = dataVariabelbaterai;
      myControlerssoBatraiPlus.asMap().forEach((index, element) {
        MyDataFilterOBJTanam!.propertyLainnya["alternatifPakan"][
            MyDataFilterOBJTanam!.propertyLainnya["alternatifPakan"].keys
                .toList()[index]] = (element.text.isEmpty) ? "0" : element.text;

        myControlerssoBatraiPlus =
            myControl(MyDataFilterOBJTanam!.propertyLainnya["alternatifPakan"]);
        fieldoBateraiPlus = fieldso(
            false,
            MyDataFilterOBJTanam!.propertyLainnya["alternatifPakan"],
            myControlerssoBatraiPlus);
      });

      myControlerssoBatrai.asMap().forEach((index, element) {
        // dataVariabelbaterai["Banyak Tanaman : "] = banyakTanaman.toString();
        dataB[dataB.keys.toList()[index]] =
            (element.text.isEmpty) ? "0" : element.text;

        myControlerssoBatrai = myControl(dataB);
        fieldoBaterai = fieldso(false, dataB, myControlerssoBatrai);

        dataVariabelbaterai = dataB;
        // MyDataFilterOBJTanamListrik!.propertyLainnya = dataVariabelbaterai;

        MyDataFilterOBJTanam!.propertyLainnya["umur"] =
            dataVariabelbaterai["Umur mulai pemeliharaan (Minggu)"];
        MyDataFilterOBJTanam!.propertyLainnya["umurMati"] =
            dataVariabelbaterai["Umur Panen (Minggu)"];
        MyDataFilterOBJTanam!.propertyLainnya["hargaJual"] =
            dataVariabelbaterai["Perkiraan Bobot per Ikan Panen (Gr)"];
        MyDataFilterOBJTanam!.propertyLainnya["peliharaans"] =
            dataVariabelbaterai["Banyak Tanaman : "];
        MyDataFilterOBJTanam!.propertyLainnya["ketebalanTanah"] =
            dataVariabelbaterai["Harga Jual Telur /telur"];

        MyDataFilterOBJTanam!.propertyLainnya["Volume Box Air"] =
            dataVariabelbaterai["Volume Penampung air (Box)"];
      });
    });
  }

  void generateInitialData(double banyakTanamans) {
    // String tanamanTerpilih = "Cabai Rawit";
    // int umurPanen = tanamanData[tanamanTerpilih]!["umurPanen"] as int;
    int frekuensiPanenMinggu = dataSayur?[indexJb].frekuensiPanenMinggu as int;
    // int umurTidakProduktif = tanamanData[tanamanTerpilih]!["umurTidakProduktif"] as int;
    double hasilPanenPerTanaman =
        dataSayur?[indexJb].hasilPanenPerTanaman as double;
    double hargaJualPerKg = 50000; // Default value for each row

    umurTanaman = ((double.tryParse(
                    dataSayur![indexJb].umurTidakProduktif.toString())! -
                double.tryParse(dataSayur![indexJb].umurPanen.toString())!) ==
            0)
        ? 1
        : (double.tryParse(dataSayur![indexJb].umurTidakProduktif.toString())! -
                double.tryParse(dataSayur![indexJb].umurPanen.toString())!) /
            (double.tryParse(
                dataSayur![indexJb].frekuensiPanenMinggu.toString())!);

    for (int i = 1; i <= (umurTanaman); i++) {
      panenKeuntunganData.add({
        'mingguKe':
            (double.tryParse(dataSayur![indexJb].umurPanen.toString())! +
                        (i * frekuensiPanenMinggu))
                    .round() -
                1,
        'hasilPanen': hasilPanenPerTanaman * banyakTanamans,
        'hargaPerKg': hargaJualPerKg,
      });
    }
  }

  void addRow() {
    setState(() {
      panenKeuntunganData
          .add({'mingguKe': 0, 'hasilPanen': 0.0, 'hargaPerKg': 0.0});
      MyDataFilterOBJTanam!.propertyLainnya["DataTabel"] = panenKeuntunganData;
    });
  }

  void removeRow(int index) {
    setState(() {
      panenKeuntunganData.removeAt(index);
      MyDataFilterOBJTanam!.propertyLainnya["DataTabel"] = panenKeuntunganData;
    });
  }

  void hitungLokall() {
    copiedData = MyDataFilterOBJTanam!;
  }

  // void maxLevelsTanamTurun() {
  //   setState(() {
  //     int sa = maxLevelsTanam; // Salin nilai awal maxLevelsTanam
  //     int lebar = 200; // Lebar yang menjadi target
  //
  //     // Hitung ulang widthTotal berdasarkan maxLevelsTanam
  //     widthTotal = ((cageWidthTanam + 10) * maxLevelsTanam) + 5;
  //
  //     // Jika widthTotal + 50 masih lebih besar dari lebar, kurangi maxLevelsTanam sampai mendekati lebar
  //     while ((widthTotal + 50) >= lebar && maxLevelsTanam > 0) {
  //       maxLevelsTanam -= 1; // Kurangi maxLevelsTanam
  //
  //       // Hitung ulang widthTotal
  //       widthTotal = ((cageWidthTanam + 10) * maxLevelsTanam) + 5;
  //
  //       print("Pengulangan: maxLevelsTanam = $maxLevelsTanam, widthTotal = $widthTotal, lebar = $lebar");
  //     }
  //
  //     // Setelah pengulangan, jika maxLevelsTanam sudah 0, setel ke 1
  //     if (maxLevelsTanam == 0) {
  //       maxLevelsTanam = 1;
  //     }
  //
  //     // Print hasil akhir
  //     print("Hasil akhir: maxLevelsTanam = $maxLevelsTanam, widthTotal = $widthTotal, lebar = $lebar");
  //
  //     // maxLevelsTanam = sa; // Mengembalikan nilai asli jika perlu
  //   });
  //
  //   // aturLayout(); // Panggil fungsi aturLayout jika diperlukan
  // }

  double calculateY(int x, int maxX) {
    // Mengurangi nilai y dari 4 sampai 0 berdasarkan x
    double y = 4 - (4.0 * x / maxX);

    // Memastikan y tidak kurang dari 0
    if (y < 1) y = 1;

    return y;
  }

  void maxLevelsTanamTurun() {
    setState(() {
      sa = maxLevelsTanam;
      if ((widthTotal + 50) < l) {
        maxLevelsTanam = calculateY(banyakTanaman.toInt(),
                tanamPerCage * maxLevelsTanam * banyakInstalasi)
            .toInt();
        print(
            "w maxLevelsTanam; widthTotal<p $banyaktanamS <$maxWidth ${widthTotal + 50}< $l ${calculateY(banyakTanaman.toInt(), tanamPerCage).toInt()} $maxLevelsTanam $maxWidth<$widthTotal");
      }
      // else{
      //   maxLevelsTanam = 4;
      //   print('x: $banyakTanaman, maxLevelsTanam: ${calculateY(banyakTanaman.toInt(), 8)}');
      //   print("maxLevelsTanam; widthTotal<p ${ banyaktanamS} <${maxWidth} ${widthTotal+50}> ${l} ${maxLevelsTanam} $maxWidth<${widthTotal}");
      //
      // }
    });
  }

  int cagesRequired = 0;
  int fullStacks = 0;
  int remainderCages = 0;
  int maxWidth = 0;
  int widthTotal = 0;
  int? highestNumber;
  int maxpipa = 0;
  int banyakInstalasi = 0;
  Map<String, List<int>> datatabel = {};
  // Menyimpan susunan Pot dalam Map
  Map<int, int> stackDistribution = {};
  String cageArrangement = "";
  int banyaktanamS = 0;
  int count = 0;
  int banyakinstalasiperbaris1 = 0;
  int banyakinstalasiperkolom1 = 0;
  Map<String, List<int>> datatabelcoba = {};
  int maxTanaman = 0;
  void aturLayout() {
    stackDistribution = {};
    cageArrangement = "";
    banyaktanamS = 0;
    count = 0;
    banyakinstalasiperbaris1 = 0;
    banyakinstalasiperkolom1 = 0;

    banyakTanaman = (double.tryParse(MyDataFilterOBJTanam!
                .propertyLainnya["peliharaans"]
                .toString())! <
            0)
        ? 1.0
        : double.tryParse(myControlerssoBatrai[3].text)!;

    perkirranPakanBanyakTanaman = banyakTanaman * 100;

    if (_isCheckedJt == true) {
      jaraktanam = MyDataFilterOBJTanam!.propertyLainnya["jarakTanam"];
    } else {
      jaraktanam = dataSayur![indexJb].jaraktanam;
    }

    if (MyDataFilterOBJTanam!.propertyLainnya["ukuranPotCostume"] == false) {
      // {"panjang": double.tryParse(PanjangTempatTanam.toString())!, "diameter": diameterLubang ,"jarakLubang": 5.0},

      (namaKategoriYes)
          ? {
              (widget.namaCategory == "Tanaman Paku Air")
                  ? {
                      jaraktanam = 15,
                      cageWidthTanam = 31, // cm
                      cageHeightTanam = 8, // cm
                      cageLengthTanam = 40, // cm
                      PanjangTempatTanam = 40,
                      tanamPerCage = 3,
                      maxLevelsTanam = 3,
                      imgInstalasi =
                          "assets/images/MenuRawatan/RawatTanam/kandangAzolla.png",
                      print("data paku $jaraktanam"),
                    }
                  : {
                      cageWidthTanam = 20 + jaraktanam, // cm
                      cageHeightTanam = 17, // cm
                      cageLengthTanam = 28 + jaraktanam, // cm
                      PanjangTempatTanam = 28 + jaraktanam,
                      tanamPerCage = 1,
                      maxLevelsTanam = 1,
                      imgInstalasi =
                          "assets/images/MenuRawatan/RawatTanam/pot.png"
                    }
            }
          : {
              cageWidthTanam = 3, // cm
              cageHeightTanam = 30, // cm
              cageLengthTanam = 10, // cm
              PanjangTempatTanam = 100,
              diameterLubang = 4,
              jarakLubang = 5,
              tanamPerCage = ((PanjangTempatTanam - diameterLubang) /
                      (jaraktanam + diameterLubang))
                  .floor(),
              // maxLevelsTanam= 4,
              imgInstalasi =
                  "assets/images/MenuRawatan/RawatTanam/kandangHidroponik.png"
            };
    } else {
      (namaKategoriYes)
          ? {
              (widget.namaCategory == "Tanaman Paku Air")
                  ? {
                      jaraktanam = 15,
                      cageWidthTanam = 31, // cm
                      cageHeightTanam = 8, // cm
                      cageLengthTanam = 40, // cm
                      PanjangTempatTanam = 40,
                      tanamPerCage = 3,
                      maxLevelsTanam = 3,
                      imgInstalasi =
                          "assets/images/MenuRawatan/RawatTanam/kandangAzolla.png",
                      print("data paku $jaraktanam"),
                    }
                  : {
                      tanamPerCage = 1,
                      maxLevelsTanam = 1,
                      imgInstalasi =
                          "assets/images/MenuRawatan/RawatTanam/pot.png"
                    }
            }
          : {
              cageWidthTanam = 3, // cm
              cageHeightTanam = 30, // cm
              cageLengthTanam = 10, // cm

              PanjangTempatTanam =
                  MyDataFilterOBJTanam!.propertyLainnya["panjangTempatTanam"],
              diameterLubang =
                  MyDataFilterOBJTanam!.propertyLainnya["diameterLubang"],
              jarakLubang =
                  MyDataFilterOBJTanam!.propertyLainnya["JarakLubang"],

              print("banyak tanam $tanamPerCage $diameterLubang $jarakLubang"),

              tanamPerCage = ((PanjangTempatTanam - diameterLubang) /
                      (jaraktanam + diameterLubang))
                  .floor(),
              imgInstalasi =
                  "assets/images/MenuRawatan/RawatTanam/kandangHidroponik.png"
            };

      // if (namaKategoriYes == false) {
      //   cageWidthTanam = 3; // cm
      //   cageHeightTanam = 30; // cm
      //   cageLengthTanam = 10; // cm
      //
      //   PanjangTempatTanam =
      //   MyDataFilterOBJTanam!.propertyLainnya["panjangTempatTanam"];
      //   diameterLubang =
      //   MyDataFilterOBJTanam!.propertyLainnya["diameterLubang"];
      //   jarakLubang = MyDataFilterOBJTanam!.propertyLainnya["JarakLubang"];
      //
      //   print("banyak tanam ${tanamPerCage} ${diameterLubang} ${jarakLubang}");
      //
      //
      // }
    }

    int pBedengan = p;
    int minlBedengan = cageWidthTanam * 5;
    int maxlBedengan = 190;

    cagesRequired = (banyakTanaman / tanamPerCage).ceil();
    print("banyak tanam $cagesRequired ");

    fullStacks = (maxLevelsTanam != 0) ? (cagesRequired ~/ maxLevelsTanam) : 0;
    print("banyak tanams $cagesRequired  $maxLevelsTanam");
    remainderCages = cagesRequired % maxLevelsTanam;

    if (fullStacks > 0) {
      stackDistribution[maxLevelsTanam] = fullStacks;
    }
    if (remainderCages > 0) {
      stackDistribution[remainderCages] = 1;
    }

    stackDistribution.forEach((levels, count) {
      int currentWidth = ((cageWidthTanam + 10) * levels) + 5;
      widthTotal += currentWidth * count;
      print("widthTotal  $widthTotal");
      if (currentWidth > maxWidth) {
        maxWidth = currentWidth;
        print("maxWidth  $maxWidth ");
      }
    });

    cageArrangement = stackDistribution.entries.map((entry) {
      return '\n- ${entry.value} instalasi dengan ${entry.key} tingkat $mediaTANAM dengan Jarak tanam $jaraktanam cm ';
    }).join('');

    // Menghitung lebar total struktur
    // int widthTotal = (cagesRequired > maxLevelsTanam) ? cageWidthTanam * (cagesRequired - maxLevelsTanam + 1) : cageWidthTanam;

    // Menghitung tinggi total struktur
    int heightTotal = cageHeightTanam *
        ((cagesRequired > maxLevelsTanam) ? maxLevelsTanam : cagesRequired);

    // Menghitung panjang total struktur
    int lengthTotal =
        cageLengthTanam * (fullStacks + (remainderCages > 0 ? 1 : 0));

    datatabel = proses2(
        PanjangTempatTanam,
        // panjangs
        banyakTanaman.round(),
        // totalChickens
        tanamPerCage,
        // chickensPerCage
        maxLevelsTanam,
        // maxLevels
        maxWidth,
        // cageWidth
        cageHeightTanam,
        // cageHeight
        l,
        // lebar
        p,
        // panjang
        cageLengthTanam,
        // p1
        50,
        // p2
        stackDistribution // stackDistribution
        );
    print(" 'a': ${[
      PanjangTempatTanam,
      // panjangs
      banyakTanaman.round(),
      // totalChickens
      tanamPerCage,
      // chickensPerCage
      maxLevelsTanam,
      // maxLevels
      maxWidth,
      // cageWidth
      cageHeightTanam,
      // cageHeight
      l,
      // lebar
      p,
      // panjang
      cageLengthTanam,
      // p1
      50,
      // p2
      stackDistribution // stackDistribution
    ]}");

    datatabel.forEach((key, values) {
      for (int value in values) {
        if (value != 50) {
          Rekomendasibanyakpot += 1;
        }
      }
    });

    // Inisialisasi penghitung total elemen

    banyakinstalasiperbaris1 = 0;
    banyakinstalasiperkolom1 = 0;

    // Iterasi melalui map
    datatabel.forEach((key, value) {
      // Memeriksa apakah key diawali dengan 'a'
      if (key.startsWith('a')) {
        // Menambahkan jumlah elemen dalam list ke count
        count += value.length;
        banyakinstalasiperbaris1 += 1;
        banyakinstalasiperkolom1 = value.length;
      }
    });

    print("Total count elemen untuk key yang diawali dengan 'a': $count");

    if (datatabel.isNotEmpty) {
      // Membuat list untuk menampung angka yang valid (tidak termasuk 50 dan 80)
      List<int> validNumbers = [];

      // Memfilter angka dari indeks 0 dari setiap value di map yang tidak termasuk 50 dan 80
      datatabel.forEach((key, value) {
        if (value.isNotEmpty &&
            value[0] != 50 &&
            value[0] != PanjangTempatTanam) {
          validNumbers.add(value[0]);
        }
      });

      // Mendapatkan angka terbesar dari list validNumbers
      highestNumber = validNumbers.isNotEmpty
          ? validNumbers.reduce((a, b) => a > b ? a : b)
          : null;

      sisatempatTanaman = Rekomendasibanyakpot * tanamPerCage * maxLevelsTanam;
      banyaktanamS = (Rekomendasibanyakpot * (tanamPerCage * maxLevelsTanam));

      maxpipa = count * maxLevelsTanam;
    }
    banyakInstalasi = banyakinstalasiperbaris1 * banyakinstalasiperkolom1;
    // print("datatabel ${datatabel} ${count } ${maxLevelsTanam} ${count*maxLevelsTanam!}");

    if (jaraktanam >= 50) {
      maxLevelsTanamTurun();
    }
  }

  @override
  Widget build(contexty) {
    // "hargaJual(Gr)":"hargaJual","fcr":"peliharaans"}

    // aturLayout();

    maxTanaman = tanamPerCage * banyakInstalasi * maxLevelsTanam;

    beratTanamanSisaAwal = (umurTanaman /
        (double.tryParse(MyDataFilterOBJTanam!.propertyLainnya["umurMati"]) ??
            1));
    beratTanamanSisaAkhir = umurTanaman *
        (double.tryParse(MyDataFilterOBJTanam!.propertyLainnya["hargaJual"])!) /
        1000;
    beratPupuk = (beratTanamanSisaAkhir - beratTanamanSisaAwal) *
        (double.tryParse(
            MyDataFilterOBJTanam!.propertyLainnya["peliharaans"]))!;

    // if (l == 0 || p == 0) {
    //   p = 15;
    //   l = 15;
    // }

    hasilPersentaseCampur = hitungKomposisi(
        double.tryParse(MyDataFilterOBJTanam!
            .propertyLainnya["alternatifPakan"].values
            .toList()[0])!,
        double.tryParse(MyDataFilterOBJTanam!
            .propertyLainnya["alternatifPakan"].values
            .toList()[1])!,
        double.tryParse(MyDataFilterOBJTanam!
            .propertyLainnya["alternatifPakan"].values
            .toList()[2])!,
        double.tryParse(MyDataFilterOBJTanam!
            .propertyLainnya["alternatifPakan"].values
            .toList()[3])!);
    // hargaTotalMaggot = (hargaMaggot *
    //     hasilPersentaseCampur['persenMaggot']!.round() *
    //     (perkirranPakanBanyakTanaman / 1000) /
    //     100);

    double hargapabrikPerkg =
        double.tryParse(dataPengeluaran[2]["Beban Biaya"]!.toString())!;

    double hargaPupukPabrikFull =
        ((perkirranPakanBanyakTanaman) / 1000 * hargapabrikPerkg);
    hargaPupukPabrik = (((perkirranPakanBanyakTanaman / 1000 -
            (hasilPersentaseCampur['persenMaggot']!.round() *
                (perkirranPakanBanyakTanaman / 1000) /
                100)) *
        hargapabrikPerkg));

    hargaPotTotal = cagesRequired *
        double.tryParse(dataPengeluaran[1]["Beban Biaya"].toString())!;
    hargaTanamanTotal = banyakTanaman *
        double.tryParse(dataPengeluaran[2]["Beban Biaya"].toString())!;
    // double hargaMaggot = hargaTotalpH;
    double hargatotalcAMPUR = hargaMaggot + hargaPupukPabrik;
    print(
        "12harga:${double.tryParse(hargapH)! * hasilPersentaseCampur['persenMaggot']!.round()} $hargaTotalpH");

    // lebar
    //     p,
    print(
        ";p;ps${MyDataFilterOBJTanam!.propertyLainnya["panjangTempatTanam"]}");

    double VolumePot = (cageWidthTanam *
            (cageHeightTanam -
                ((widget.namaCategory == "Tanaman Paku Air") ? 3.2 : 2)) *
            (cageLengthTanam / tanamPerCage)) /
        1000.round();
    double totalVolumeAir = (VolumePot * banyakTanaman) + volumePenampungAir;

    double tdsDiharapkan = double.tryParse(dataSayur![indexJb].ppm.toString())!;

    double tdsStandar = 1000; // TDS standar dari rumus 5:5:1 dalam ppm
    double volumePekatanPerLiter =
        (tdsDiharapkan / tdsStandar) * 5; // 5 mL per liter untuk 1000 ppm

    double kebutuhanABMix = totalVolumeAir * volumePekatanPerLiter;

    hargaTotalABmix = kebutuhanABMix * hargaABmix;

    dataPengeluaran[3]["Beban Biaya"] = hargaTotalABmix.roundToDouble();

    double pengeluaran = hitungTotalBiaya(
      hargaPupukPabrik,
      hargaPotTotal,
      hargaTanamanTotal,
    );
    totalKeuntungan = panenKeuntunganData.fold(
        0.0,
        (sum, item) =>
            sum +
            (item['hasilPanen'] as double) * (item['hargaPerKg'] as double));
    double keuntungan = totalKeuntungan - pengeluaran;
    // hitungLokall();
    // hitunglocal();;

    dataTampungHasil["Luasan lahan yang tersedia"] =
        "${MyDataFilterOBJTanam!.luas} m²";
    dataTampungHasil["Umur mulai panen (Minggu)"] =
        MyDataFilterOBJTanam!.propertyLainnya["umur"];
    dataTampungHasil["Umur akhir Panen (Minggu)"] =
        MyDataFilterOBJTanam!.propertyLainnya["umurMati"];
    dataTampungHasil["Banyak Tanaman : "] =
        MyDataFilterOBJTanam!.propertyLainnya["peliharaans"];
    dataTampungHasil["Jenis Tanaman"] = dataSayur!.map((e) => e.nama).toList()[
        int.tryParse(
            MyDataFilterOBJTanam!.propertyLainnya["indexJb"].toString())!];
    dataTampungHasil["Volume Penampung air (Box)"] =
        "${MyDataFilterOBJTanam!.propertyLainnya["Volume Box Air"]} Liter";
    dataTampungHasil["Total Banyak Tanaman"] = banyakTanaman;
    dataTampungHasil["kebutuhanABMix"] =
        "${kebutuhanABMix.round()} ml, Larutan A: ${kebutuhanABMix.round() / 2}ml, Larutan B: ${kebutuhanABMix.round() / 2}ml";
    dataTampungHasil["Total Pengeluaran : "] =
        "Rp.${formatRupiah(pengeluaran.toString())}";
    dataTampungHasil["hasil tanaman"] =
        "${panenKeuntunganData.length} Kali Panen";
    dataTampungHasil["Omset"] = totalKeuntungan;
    dataTampungHasil["keuntungan"] = keuntungan;

    totalHasilPanen =
        panenKeuntunganData.fold(0.0, (sum, item) => sum + item['hasilPanen']);
    totalKeuntungan = panenKeuntunganData.fold(
        0.0,
        (sum, item) =>
            sum +
            (item['hasilPanen'] as double) * (item['hargaPerKg'] as double));
    // print(
    //     "keterangan maxTanaman2 = $tanamPerCage*$banyakInstalasi*$maxLevelsTanam = ${tanamPerCage*banyakInstalasi*maxLevelsTanam}");
    //

    return widget.info == false
        ? SizedBox(
            width: SizeConfig.screenWidth,
            height: SizeConfig.screenHeight!,
            child: SingleChildScrollView(
              controller: _parentScrollController,
              child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: defaultPadding / 2),
                  child: Column(
                    children: [
                      SizedBox(
                        height: defaultPadding / 2,
                      ),
                      (widget.namaCategory == "Tanaman Paku Air")
                          ? Container()
                          : Column(
                              children: [
                                CalculationWidget(
                                  onChange: (Map<String, dynamic> hasil) {
                                    print(hasil);

                                    Future.microtask(() {
                                      setState(() {});
                                    });

                                    hasila = hasil;

                                    datavar = hasila['Variabel'];
                                    MyDataFilterOBJTanam!
                                        .propertyLainnya["luasMedia"] = datavar;

                                    // print("satuan datavarmedia ${datavarmedia} $l");
                                    if (l == 0 || p == 0) {
                                      p = 15;
                                      l = 15;
                                      if (hasila['satuan'] == "m") {
                                        p = (datavar["panjang"] * 100).round();
                                        l = (datavar["lebar"] * 100).round();
                                      } else {
                                        p = (datavar["panjang"]).round();
                                        l = (datavar["lebar"]).round();
                                      }
                                    } else {
                                      if (hasila['satuan'] == "m") {
                                        p = (datavar["panjang"] * 100).round();
                                        l = (datavar["lebar"] * 100).round();
                                      } else {
                                        p = (datavar["panjang"]).round();
                                        l = (datavar["lebar"]).round();
                                      }
                                    }
                                    // aturLayout();
                                    indexInt = hasila["Index Bidang"];
                                    MyDataFilterOBJTanam!
                                            .propertyLainnya["tampungan"]
                                        ["indexBentukMediaTanam"] = indexInt;
                                    // indexInt =  1;

                                    MyDataFilterOBJTanam!
                                            .propertyLainnya["satuanMediaLahan"]
                                        [0] = hasila['satuan'];
                                    satuans = hasila['satuan'];
                                    MyDataFilterOBJTanam!.luas =
                                        hasila['Hasil'].toString();

                                    print(
                                        "keterangan maxTanaman = $tanamPerCage*$banyakInstalasi*$maxLevelsTanam = ${tanamPerCage * banyakInstalasi * maxLevelsTanam}");

                                    hitunglocal();
                                    // if(jaraktanam>=50){
                                    //   // maxLevelsTanamTurun();
                                    aturLayout();
                                    // }
                                    //
                                    // onPresoqw();
                                  },
                                  mediaIndex: 0,
                                  warna: warnas(dataKategoriMenuRawatan[
                                          c.indexMenuRawatan.value]
                                      .colorku[0]),
                                  datass: datavar,
                                  indexbidang: 1,
                                  judul: 'Ukuran lahan',
                                  satuan: satuans,
                                  dinamis: false,
                                  hasil: double.tryParse(
                                      MyDataFilterOBJTanam!.luas)!,
                                ),
                                Containes(0, "m"),
                              ],
                            ),

                      /////////////======================================================
                      SizedBox(
                        height: defaultPadding,
                      ),
                      Container(
                        // height: 200,
                        width: heightfit(double.infinity),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20),
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20)),
                            // border:
                            //     Border.all(color: kTextColor.withOpacity(.8), width: .2)
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 10,
                                  offset: Offset(-1, 8),
                                  color: Colors.green.withOpacity(.3))
                            ]),
                        child: Center(
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                DropDowns(
                                  (newActivity) {
                                    Future.microtask(() {
                                      setState(() {
                                        indexJb = dataSayur!
                                            .map((e) => e.nama)
                                            .toList()
                                            .indexOf(newActivity);
                                        MyDataFilterOBJTanam!
                                                .propertyLainnya["indexJb"] =
                                            indexJb;

                                        aturLayout();
                                        print("indexJb $indexJb");
                                        print(
                                            "indexJb ${MyDataFilterOBJTanam!.propertyLainnya["indexJb"]}");

                                        onPresoqw();
                                      });
                                    });

                                    // hitunglocal();
                                  },
                                  Colors.green,
                                  dataSayur!.map((e) => e.nama).toList(),
                                  dataSayur!
                                      .map((e) => e.nama)
                                      .toList()[indexJb],
                                  dataSayur!
                                      .map((e) => e.nama)
                                      .toList()[indexJb],
                                  "Jenis Tanaman: ",
                                  const [],
                                ),
                                SizedBox(
                                  height: defaultPadding / 2,
                                ),
                                Padding(
                                  padding: EdgeInsets.all(defaultPadding),
                                  child: (MyDataFilterOBJTanam!.propertyLainnya[
                                              "ukuranPotCostume"] !=
                                          true)
                                      ? Column(
                                          children: [
                                            imageCostum(imgaePot),
                                            (widget.namaCategory ==
                                                    "Tanaman Paku Air")
                                                ? Column(
                                                    children: [
                                                      SizedBox(
                                                        height: defaultPadding,
                                                      ),
                                                      BannerWidget(
                                                          gambarBanner:
                                                              imgInstalasi),
                                                      SizedBox(
                                                        height:
                                                            defaultPadding / 2,
                                                      ),
                                                      imageCostum(
                                                          "assets/images/MenuRawatan/RawatTanam/635e054a3f9c1.jpg"),
                                                    ],
                                                  )
                                                : Column(
                                                    children: [
                                                      SizedBox(
                                                        height: defaultPadding,
                                                      ),
                                                      BannerWidget(
                                                          gambarBanner:
                                                              imgInstalasi),
                                                    ],
                                                  )
                                          ],
                                        )
                                      : SizedBox(
                                          height: heightfit(110),
                                          child: FittedBox(
                                            child: SizedBox(
                                              height: 110,
                                              width: 110,
                                              child: ItemPot(
                                                tema: warnas(
                                                    dataKategoriMenuRawatan[c
                                                            .indexMenuRawatan
                                                            .value]
                                                        .colorku[0]),
                                                img: dataKategoriRumus
                                                    .where((element) =>
                                                        element.nama ==
                                                        MyDataFilterOBJTanam!
                                                            .propertyLainnya[
                                                                "ukuranPot"]
                                                            .toList()[int.parse(
                                                                MyDataFilterOBJTanam!
                                                                    .propertyLainnya[
                                                                        "indexbentukmedialahanPot"]
                                                                    .toString())]
                                                            .nama)
                                                    .first
                                                    .img,
                                                index: c.indexa.value,
                                                onStateChange: (int indexs) {
                                                  // indexmenu(() {
                                                  c.indexa.value = indexs;
                                                  // });
                                                },
                                              ),
                                            ),
                                          ),
                                        ),
                                ),
                                SizedBox(
                                  height: defaultPadding,
                                ),
                                (widget.namaCategory == "Tanaman Paku Air")
                                    ? Container()
                                    : Row(
                                        children: [
                                          Expanded(
                                            flex: 7,
                                            child: SwitchListTile(
                                                activeColor: warnas("f1c232"),
                                                title: Text(
                                                  "Ukuran costume: ",
                                                  style: TextStyle(
                                                      fontSize: heightfit(24)),
                                                ),
                                                // subtitle: Text("Satuan",style: TextStyle(fontSize: heightfit(26)),),
                                                value: MyDataFilterOBJTanam!
                                                        .propertyLainnya[
                                                    "ukuranPotCostume"],
                                                onChanged: (bool value) {
                                                  Future.microtask(() {
                                                    setState(() {
                                                      MyDataFilterOBJTanam!
                                                              .propertyLainnya[
                                                          "ukuranPotCostume"] = value;
                                                    });
                                                  });

                                                  hitunglocal();
                                                }),
                                          ),
                                        ],
                                      ),
                                SizedBox(
                                  height: defaultPadding / 2,
                                ),
                                Containes(1, "m"),
                                SizedBox(height: defaultPadding / 2),
                                (namaKategoriYes)
                                    ? (MyDataFilterOBJTanam!.propertyLainnya[
                                                "ukuranPotCostume"] ==
                                            true)
                                        ? SizedBox(
                                            width: 350,
                                            child: SizedBox(
                                              width: 290,
                                              child: Column(
                                                children: [
                                                  namaKategoriYes
                                                      ? CalculationWidget(
                                                          onChange: (Map<String,
                                                                  dynamic>
                                                              hasil) {
                                                            print(hasil);

                                                            Future.microtask(
                                                                () {
                                                              setState(() {});
                                                            });

                                                            hasila3D = hasil;

                                                            datavar3D =
                                                                hasila3D[
                                                                    'Variabel'];
                                                            MyDataFilterOBJTanam!
                                                                        .propertyLainnya[
                                                                    "luasMedia3D"] =
                                                                datavar3D;

                                                            MyDataFilterOBJTanam!
                                                                        .propertyLainnya[
                                                                    "satuanMediaLahan3D"] =
                                                                hasila3D[
                                                                    'satuan'];
                                                            satuans3D =
                                                                hasila3D[
                                                                    'satuan'];

                                                            MyDataFilterOBJTanam!
                                                                        .propertyLainnya[
                                                                    "indexbentukmedialahanPot"] =
                                                                hasila3D[
                                                                    "Index Bidang"];

                                                            MyDataFilterOBJTanam!
                                                                        .propertyLainnya[
                                                                    "Hasilluas3D"] =
                                                                hasila3D[
                                                                        'Hasil']
                                                                    .toString();

                                                            datavarmediaPot =
                                                                transformMap(
                                                                    hasila3D[
                                                                        'Variabel']);
                                                            print(
                                                                "satuan datavarmediad $datavarmediaPot $l");

                                                            cageWidthTanam = int.parse(
                                                                    (datavarmediaPot[
                                                                            "l"])
                                                                        .round()
                                                                        .toString()) +
                                                                jaraktanam; // cm
                                                            cageHeightTanam = int.parse(
                                                                datavarmediaPot[
                                                                        "t"]
                                                                    .round()
                                                                    .toString()); // cm
                                                            cageLengthTanam = int.parse(
                                                                    ((datavarmediaPot["p"]) *
                                                                            1) //panjang pot * 3 per tataan
                                                                        .round()
                                                                        .toString()) +
                                                                jaraktanam; // cm

                                                            print(
                                                                "cageLengthTanam $cageHeightTanam $l");

                                                            PanjangTempatTanam =
                                                                cageLengthTanam;
                                                            indexpot = hasila3D[
                                                                'Index Bidang'];
                                                            print(
                                                                "satuanaw ${hasila3D["Index Bidang"]} $datavar3D");

                                                            hitunglocal();
                                                          },
                                                          mediaIndex: 1,
                                                          warna: warnas(
                                                              dataKategoriMenuRawatan[c
                                                                      .indexMenuRawatan
                                                                      .value]
                                                                  .colorku[0]),
                                                          datass: datavar3D,
                                                          indexbidang: indexpot,
                                                          judul: 'Ukuran Pot',
                                                          satuan: satuans3D,
                                                          dinamis: true,
                                                          hasil: double.tryParse(
                                                              MyDataFilterOBJTanam!
                                                                  .propertyLainnya[
                                                                      "Hasilluas3D"]
                                                                  .toString())!,
                                                        )
                                                      : Container()
                                                ],
                                              ),
                                            ),
                                          )
                                        : Container()
                                    : Column(
                                        children: [
                                          SizedBox(
                                            height: defaultPadding / 2,
                                          ),
                                          Text(
                                            "Ilustrasi Gambar Pipa dan perkiraan banyak lubang",
                                            style: TextStyle(fontSize: 20.0),
                                          ),
                                          SizedBox(
                                            height: defaultPadding / 2,
                                          ),
                                          Pipa(
                                            ukurancostume: MyDataFilterOBJTanam!
                                                    .propertyLainnya[
                                                "ukuranPotCostume"],
                                            onChangeState: (Map asa) {
                                              int simpans = int.parse(
                                                  tanamPerCage.toString());
                                              Future.microtask(() {
                                                setState(() {
                                                  MyDataFilterOBJTanam!
                                                              .propertyLainnya[
                                                          "panjangTempatTanam"] =
                                                      asa["panjang"].round();
                                                  MyDataFilterOBJTanam!
                                                              .propertyLainnya[
                                                          "diameterLubang"] =
                                                      asa["diameter"].round();

                                                  MyDataFilterOBJTanam!
                                                              .propertyLainnya[
                                                          "JarakLubang"] =
                                                      asa["jarakLubang"]
                                                          .round();

                                                  print(
                                                      "jaraktanam $tanamPerCage $PanjangTempatTanam $diameterLubang");
                                                  simpans = asa["jumlahLubang"]
                                                      .round();
                                                  // print("State Updated: ${tanamPerCage}");
                                                  // MyDataFilterOBJTanam!
                                                  //     .propertyLainnya["lubangtanam"] = diameterLubang;
                                                });
                                              });
                                            },
                                            banyaktanaman: tanamPerCage,
                                            dataUkuran: {
                                              "panjang": double.tryParse(
                                                  PanjangTempatTanam
                                                      .toString())!,
                                              "diameter": double.tryParse(
                                                  diameterLubang.toString())!,
                                              "jarakLubang": double.tryParse(
                                                  jarakLubang.toString())!
                                            },
                                          ),
                                        ],
                                      ),
                                (widget.namaCategory == "Tanaman Paku Air")
                                    ? Container()
                                    : Padding(
                                        padding:
                                            EdgeInsets.all(defaultPadding / 2),
                                        child: Column(
                                          children: [
                                            Fields(
                                              controller: TextEditingController(
                                                  text: jaraktanam.toString()),

                                              // dataKategoriInisialisasi.where((element) => element.vari == data.keys.elementAt(index)[0].toString()).first.satuan
                                              satuan: "cm",
                                              title: "Jarak Tanam",
                                              tema: Colors.green,
                                              onStateChange: (valu) {
                                                Future.microtask(() {
                                                  setState(() {
                                                    jaraktanam =
                                                        int.parse(valu);
                                                    MyDataFilterOBJTanam!
                                                                .propertyLainnya[
                                                            "jarakTanam"] =
                                                        int.parse(valu);
                                                    aturLayout();
                                                  });
                                                });
                                              },
                                              inputType: TextInputType
                                                  .numberWithOptions(
                                                      decimal: true),
                                              enable: _isCheckedJt,
                                            ),
                                            Center(
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Checkbox(
                                                    value: _isCheckedJt,
                                                    onChanged: (check) {
                                                      Future.microtask(() {
                                                        setState(() {
                                                          _isCheckedJt = check!;
                                                          MyDataFilterOBJTanam!
                                                                      .propertyLainnya[
                                                                  "jaraktanamTrue"] =
                                                              _isCheckedJt;

                                                          print(
                                                              "jaratk tanam $jaraktanam");
                                                        });
                                                      });
                                                    },
                                                  ),
                                                  Text(
                                                    "Jarak Tanam : ${_isCheckedJt ? 'Ubah' : 'Tetap'}",
                                                    style: TextStyle(
                                                        fontSize: 18.0),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                              ],
                            ),
                          ),
                        ),
                      ),

                      SizedBox(
                        height: defaultPadding / 2,
                      ),
                      cardWithImg(
                          false,
                          "Maksimal",
                          20,
                          Container(
                            child: Text(
                              "${maxTanaman} ${(widget.namaCategory == "Tanaman Paku Air") ? "Box" : "Tanaman"}",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: heightfit(30),
                              ),
                            ),
                          )),
                      SizedBox(
                        height: defaultPadding / 2,
                      ),
                      Container(
                        child: Container(
                            padding: EdgeInsets.all(defaultPadding),
                            margin: EdgeInsets.symmetric(
                                horizontal: heightfit(defaultPadding / 2),
                                vertical: heightfit(defaultPadding / 2)),
                            // height: 200,
                            width: heightfit(double.infinity),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(20),
                                    bottomRight: Radius.circular(20),
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20)),
                                // border:
                                //     Border.all(color: kTextColor.withOpacity(.8), width: .2)
                                boxShadow: [
                                  BoxShadow(
                                      blurRadius: 10,
                                      offset: Offset(-1, 8),
                                      color: Colors.green.withOpacity(.3))
                                ]),
                            child: Stack(
                              children: [
                                Positioned(
                                  bottom: 0,
                                  right: 0,
                                  // left: 0,
                                  child: Container(
                                    height: heightfit(90),
                                    width: heightfit(100),
                                    decoration: BoxDecoration(
                                        color: Colors.green.shade100,
                                        borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(0),
                                            bottomRight: Radius.circular(20),
                                            topLeft: Radius.circular(90),
                                            topRight: Radius.circular(0)),
                                        // border:
                                        //     Border.all(color: kTextColor.withOpacity(.8), width: .2)
                                        boxShadow: [
                                          BoxShadow(
                                              blurRadius: 10,
                                              offset: Offset(-1, 8),
                                              color:
                                                  Colors.green.withOpacity(.3))
                                        ]),
                                  ),
                                ),
                                Column(
                                  children: [
                                    fieldoBaterai[3],
                                    (maxTanaman == 0)
                                        ? Container()
                                        : (widget.namaCategory ==
                                                "Tanaman Paku Air")
                                            ? Container()
                                            : (maxTanaman < banyakTanaman)
                                                ? Container(
                                                    padding:
                                                        EdgeInsets.all(16.0),
                                                    margin: EdgeInsets.all(
                                                        defaultPadding / 2),
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      border: Border.all(
                                                          color: Colors.red,
                                                          width: 2),
                                                      boxShadow: [
                                                        BoxShadow(
                                                          color: Colors.black
                                                              .withOpacity(0.1),
                                                          blurRadius: 8.0,
                                                          offset: Offset(0, 4),
                                                        ),
                                                      ],
                                                    ),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Row(
                                                          children: [
                                                            Icon(Icons.close,
                                                                color:
                                                                    Colors.red),
                                                            SizedBox(width: 10),
                                                            Text(
                                                              'Peringatan',
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                          ],
                                                        ),
                                                        SizedBox(height: 10),
                                                        Text(
                                                          'Jumlah tanaman melebihi maksimal lahan yang ada dengan maksimal $maxLevelsTanam tingkat'
                                                          'Apakah Anda masih ingin melanjutkan dengan jumlah tanaman yang ada '
                                                          'atau sesuai dengan jumlah tanaman yang sudah direkomendasikan?',
                                                        ),
                                                        SizedBox(height: 20),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .end,
                                                          children: [
                                                            Expanded(
                                                              child:
                                                                  ElevatedButton(
                                                                onPressed: () {
                                                                  // Tindakan jika pengguna memilih melanjutkan
                                                                  Future
                                                                      .microtask(
                                                                          () {
                                                                    setState(
                                                                        () {
                                                                      print(
                                                                          "text ${myControlerssoBatrai[3].text}");
                                                                    });
                                                                  });
                                                                },
                                                                child: Text(
                                                                    'Lanjutkan',
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            10)),
                                                              ),
                                                            ),
                                                            Expanded(
                                                              child:
                                                                  ElevatedButton(
                                                                onPressed: () {
                                                                  // Tindakan jika pengguna memilih sesuai rekomendasi
                                                                  Future
                                                                      .microtask(
                                                                          () {
                                                                    setState(
                                                                        () {
                                                                      myControlerssoBatrai[
                                                                              3]
                                                                          .text = (tanamPerCage *
                                                                              maxLevelsTanam *
                                                                              banyakInstalasi)
                                                                          .toString();
                                                                      banyakTanaman = double.tryParse((tanamPerCage *
                                                                              maxLevelsTanam *
                                                                              banyakInstalasi)
                                                                          .toString())!;

                                                                      dataVariabelbaterai[
                                                                              "Banyak Tanaman : "] =
                                                                          banyakTanaman
                                                                              .toString();
                                                                    });
                                                                  });
                                                                },
                                                                child: Text(
                                                                  'Sesuai Rekomen',
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          10),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  )
                                                : Container(),
                                    RichText(
                                        text: TextSpan(children: [
                                      TextSpan(
                                        text:
                                            "Berdasarkan banyak ${(widget.namaCategory == "Tanaman Paku Air") ? "Box" : "Tanaman"} yang anda pelihara maka kami rekomndasikan  ${namaKategoriYes ? (widget.namaCategory == "Tanaman Paku Air") ? "Box" : "banyak $mediaTANAM" : " Ukuran $mediaTANAM"} adalah :  \n",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: kTextColor,
                                          fontSize: heightfit(sT16),
                                        ),
                                      ),
                                      TextSpan(
                                        text:
                                            "$mediaTANAM ini dengan ukuran : \nPanjang : "
                                            "${(namaKategoriYes ? cageLengthTanam / tanamPerCage : PanjangTempatTanam).toStringAsFixed(0)} cm"
                                            "\n Lebar : ${namaKategoriYes ? cageWidthTanam : cageWidthTanam * 5} cm"
                                            "\ntinggi :  $cageHeightTanam cm => (${namaKategoriYes ? "" : "Ukuran Tinggi ini Bukan tinggi pipa akan tetapi tinggi asumsi antara jarak pipa 1 kepipa diatasnya"})",
                                        style: TextStyle(
                                          fontStyle: FontStyle.italic,
                                          color: kTextColor,
                                          fontSize: heightfit(sT14),
                                        ),
                                      ),
                                      TextSpan(
                                        text: (widget.namaCategory ==
                                                "Tanaman Paku Air")
                                            ? "\n\n1 Kg Tanaman Paku Air berkisar = Rp 20.000 \n-asumsi 1 box kita tanam 1 kg untuk perkembangbiakan"
                                            : "",
                                        style: TextStyle(
                                          fontStyle: FontStyle.italic,
                                          color: kTextColor,
                                          fontSize: heightfit(sT18),
                                        ),
                                      ),
                                    ])),
                                    SizedBox(
                                      height: defaultPadding / 2,
                                    ),

                                    cardWithImg(
                                        false,
                                        "harga",
                                        16,
                                        Container(
                                          child: Column(
                                            children: [
                                              Text(
                                                "${(widget.namaCategory == "Tanaman Paku Air") ? banyakTanaman.round() : cagesRequired.round()} ${(widget.namaCategory == "Tanaman Paku Air") ? "Box" : mediaTANAM}: \nRp.${formatRupiah(hargaPotTotal.toStringAsFixed(0))}",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white,
                                                  fontSize: heightfit(30),
                                                ),
                                              ),
                                            ],
                                          ),
                                        )),
                                    (widget.namaCategory == "Tanaman Paku Air")
                                        ? FittedBox(
                                            child: SizedBox(
                                              width:
                                                  SizeConfig.screenWidth! / 1.2,
                                              child: Containes(2, "m"),
                                            ),
                                          )
                                        : cardWithImg(
                                            false,
                                            "${banyakTanaman.toStringAsFixed(0)} ${(widget.namaCategory == "Tanaman Paku Air") ? "Box" : "Tanaman"}",
                                            40,
                                            Container(
                                              child: Column(
                                                children: [
                                                  Text(
                                                    // "Rekomendasi ${mediaTANAM} :\n$cageArrangement\n- pertempat ada ${namaKategoriYes ? tanamPerCage : "${tanamPerCage} Tanaman"} ${namaKategoriYes ? mediaTANAM : "per panjang Pipa ${PanjangTempatTanam} cm   "} ",
                                                    "Rekomendasi ${(widget.namaCategory == "Tanaman Paku Air") ? "Box" : mediaTANAM} :\n"
                                                    "$cageArrangement",
                                                    // "- per instalasi ada ${namaKategoriYes ? tanamPerCage : "${tanamPerCage} Tanaman"} ${namaKategoriYes ? mediaTANAM : ""} ",
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.white,
                                                      fontSize: heightfit(sT16),
                                                    ),
                                                  ),
                                                  Text(
                                                    namaKategoriYes
                                                        ? ""
                                                        : "\nPenjelas: \n1 instalasi hidroponik = Mapksimal $maxLevelsTanam Tingkat Pipa\n1 Tingkat Pipa = $PanjangTempatTanam cm panjang pipa\nPanjang $PanjangTempatTanam cm = $tanamPerCage Tanaman dengan jarak tanam $jaraktanam cm",
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      color: Colors.white,
                                                      fontStyle:
                                                          FontStyle.italic,
                                                      fontSize: heightfit(sT12),
                                                    ),
                                                  ),
                                                  Text(
                                                    "\nDari luas ${MyDataFilterOBJTanam!.luas} m²: \n- Rekomendasi maksimal banyak  $banyakInstalasi ${namaKategoriYes ? mediaTANAM : "instalasi hidroponik dengan $maxLevelsTanam Tingkat\n"
                                                        "\nJadi Maksimal Tanaman yang dapat ditanam dilahan seluas ${MyDataFilterOBJTanam!.luas} m²: ${maxTanaman} Tanaman $maxLevelsTanam Tingkat "} ",
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.white,
                                                      fontSize: heightfit(sT16),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: defaultPadding,
                                                  ),
                                                  FittedBox(
                                                    child: SizedBox(
                                                      width: SizeConfig
                                                              .screenWidth! /
                                                          1.2,
                                                      child: Containes(2, "m"),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: defaultPadding / 2,
                                                  ),
                                                ],
                                              ),
                                            )),
                                    cardWithImg(
                                        false,
                                        "Rp.${formatRupiah(hargaTanamanTotal.toStringAsFixed(0))}",
                                        40,
                                        Container(
                                          child: Text(
                                            "harga total bibit Tanaman",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                              fontSize: heightfit(sT16),
                                            ),
                                          ),
                                        )),
                                    // (widget.namaCategory == "Tanaman Paku Air")?
                                    // Container():
                                    (double.tryParse(
                                                MyDataFilterOBJTanam!.luas)! <
                                            400)
                                        ? (double.tryParse(MyDataFilterOBJTanam!
                                                    .luas)! <=
                                                0)
                                            ? Container()
                                            : (widget.namaCategory ==
                                                    "Tanaman Paku Air")
                                                ? Container()
                                                : Column(
                                                    children: [
                                                      Text(
                                                        "Perkiraan Pemetaan instalasi ${namaKategoriYes ? mediaTANAM : "Hidroponik"} dangan luas lahan ${double.tryParse(MyDataFilterOBJTanam!.luas)!.toStringAsFixed(0)} m²",
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.black54,
                                                          fontSize:
                                                              heightfit(sT20),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height:
                                                            defaultPadding / 2,
                                                      ),
                                                      (cageLengthTanam != 0 &&
                                                              cageHeightTanam !=
                                                                  0 &&
                                                              cageWidthTanam !=
                                                                  0)
                                                          ? Card(
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsets.all(
                                                                        defaultPadding /
                                                                            2),
                                                                child: Column(
                                                                  children: [
                                                                    widget.namaCategory ==
                                                                            "Sayuran Buah"
                                                                        ? Container()
                                                                        : Column(
                                                                            children: [
                                                                              Text(
                                                                                "Tingkatan tanaman : ",
                                                                                style: TextStyle(
                                                                                  fontWeight: FontWeight.bold,
                                                                                  color: Colors.black54,
                                                                                  fontSize: heightfit(sT26),
                                                                                ),
                                                                              ),
                                                                              Slider(
                                                                                value: double.tryParse(_currentValue.toString())!,
                                                                                min: 0,
                                                                                max: 4,
                                                                                divisions: 4, // Membatasi slider menjadi 5 nilai (0, 1, 2, 3, 4)
                                                                                label: _currentValue.round().toString(),
                                                                                onChanged: (double newValue) {
                                                                                  setState(() {
                                                                                    maxLevelsTanam = newValue.toInt();
                                                                                    _currentValue = newValue.toInt();
                                                                                    aturLayout();
                                                                                  });
                                                                                },
                                                                              ),
                                                                            ],
                                                                          ),
                                                                    SizedBox(
                                                                      height:
                                                                          defaultPadding /
                                                                              2,
                                                                    ),
                                                                    Text(
                                                                      "Perkiraan Pemetaan tempat hidroponik luas lahan ${double.tryParse(MyDataFilterOBJTanam!.luas)!.toStringAsFixed(0)} m²",
                                                                      style:
                                                                          TextStyle(
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                        color: Colors
                                                                            .black54,
                                                                        fontSize:
                                                                            heightfit(sT26),
                                                                      ),
                                                                    ),
                                                                    SizedBox(
                                                                      height:
                                                                          defaultPadding /
                                                                              2,
                                                                    ),
                                                                    PatternGrid(
                                                                      panjangs:
                                                                          PanjangTempatTanam,
                                                                      // Panjang jalan tengah dalam cm
                                                                      p2: 50,
                                                                      // Lebar jalan tengah dalam cm
                                                                      lebar: l,
                                                                      panjang:
                                                                          p,

                                                                      onChangeState:
                                                                          (int
                                                                              ik) {
                                                                        Future.microtask(
                                                                            () {});
                                                                      },
                                                                      prosess:
                                                                          datatabel,

                                                                      // Jumlah ayam per kandang
                                                                    )
                                                                  ],
                                                                ),
                                                              ),
                                                            )
                                                          : Text(
                                                              "Tidak ada karena ukuran $mediaTANAM ada yang 0",
                                                              style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: Colors
                                                                    .black54,
                                                                fontSize:
                                                                    heightfit(
                                                                        sT26),
                                                              ),
                                                            ),
                                                    ],
                                                  )
                                        : cardWithImg(
                                            false,
                                            "Formasi Instalasi ${double.tryParse(MyDataFilterOBJTanam!.luas)! >= 400 ? " terlalu luas" : "luasan ${double.tryParse(MyDataFilterOBJTanam!.luas)!}m²"}",
                                            40,
                                            Container(
                                              child: Column(
                                                children: [
                                                  SizedBox(
                                                    height: defaultPadding / 2,
                                                  ),
                                                ],
                                              ),
                                            )),
                                  ],
                                ),
                              ],
                            )),
                      ),

                      SizedBox(
                        height: defaultPadding,
                      ),
/////////////======================================================
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(0),
                              bottomRight: Radius.circular(20),
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(0)),
                          border: Border.all(
                              style: BorderStyle.solid,
                              color: warnas("f1c232"),
                              width: 3.5),
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 10,
                                offset: Offset(-5, 5),
                                color: Colors.green.shade700.withOpacity(.2))
                          ],
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(defaultPadding / 2),
                          child: Column(
                            children: [
                              RichText(
                                  text: TextSpan(children: [
                                TextSpan(
                                  text: "Kontrol pH : \n",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: kTextColor,
                                    fontSize: heightfit(sT26),
                                  ),
                                ),
                                TextSpan(
                                  text:
                                      "Ukur pH dengan sesuai agar nutrisi dapat  diserap oleh tanaman \n",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: kTextColor,
                                    fontSize: heightfit(sT16),
                                  ),
                                ),
                              ])),
                              SizedBox(
                                height: defaultPadding,
                              ),
                              BannerWidget(
                                gambarBanner:
                                    "assets/images/MenuRawatan/RawatTanam/Ph.png",
                              ),
                              SizedBox(
                                height: defaultPadding,
                              ),
                              cardWithImg(
                                  false,
                                  "pH: \n${dataSayur![indexJb].ph.toStringAsFixed(1)}",
                                  40,
                                  Container(
                                    child: Column(
                                      children: [
                                        Text(
                                          "\n- Lakukan pengukuran dengan pH meter agar dapat menyesuaikan nilai pH",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                            fontSize: heightfit(sT16),
                                          ),
                                        ),
                                        SizedBox(
                                          height: defaultPadding / 2,
                                        ),
                                      ],
                                    ),
                                  )),
                              SizedBox(
                                height: defaultPadding,
                              ),
                              RichText(
                                  text: TextSpan(children: [
                                TextSpan(
                                  text: "Kebutuhan Pupuk : \n",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: kTextColor,
                                    fontSize: heightfit(sT26),
                                  ),
                                ),
                                TextSpan(
                                  text:
                                      "Kebutuhan Pupuk kalian bisa disesuaikan dengan mengukur tds meter \n",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: kTextColor,
                                    fontSize: heightfit(sT16),
                                  ),
                                ),
                              ])),
                              BannerWidget(
                                gambarBanner:
                                    "assets/images/MenuRawatan/RawatTanam/abmix.png",
                              ),
                              SizedBox(
                                height: defaultPadding,
                              ),
                              Container(
                                child: Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal:
                                            heightfit(defaultPadding / 2),
                                        vertical:
                                            heightfit(defaultPadding / 2)),
                                    // height: 200,
                                    width: heightfit(double.infinity),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(20),
                                            bottomRight: Radius.circular(20),
                                            topLeft: Radius.circular(20),
                                            topRight: Radius.circular(20)),
                                        // border:
                                        //     Border.all(color: kTextColor.withOpacity(.8), width: .2)
                                        boxShadow: [
                                          BoxShadow(
                                              blurRadius: 10,
                                              offset: Offset(-1, 8),
                                              color:
                                                  Colors.green.withOpacity(.3))
                                        ]),
                                    child: Stack(
                                      children: [
                                        Positioned(
                                          bottom: 0,
                                          right: 0,
                                          // left: 0,
                                          child: Container(
                                            height: heightfit(90),
                                            width: heightfit(100),
                                            decoration: BoxDecoration(
                                                color: Colors.green.shade100,
                                                borderRadius: BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(0),
                                                    bottomRight:
                                                        Radius.circular(20),
                                                    topLeft:
                                                        Radius.circular(90),
                                                    topRight:
                                                        Radius.circular(0)),
                                                // border:
                                                //     Border.all(color: kTextColor.withOpacity(.8), width: .2)
                                                boxShadow: [
                                                  BoxShadow(
                                                      blurRadius: 10,
                                                      offset: Offset(-1, 8),
                                                      color: Colors.green
                                                          .withOpacity(.3))
                                                ]),
                                          ),
                                        ),
                                        Padding(
                                            padding: EdgeInsets.all(
                                              defaultPadding / 2,
                                            ),
                                            child: Column(
                                              children: [
                                                RichText(
                                                    text: TextSpan(children: [
                                                  TextSpan(
                                                    text:
                                                        "Berdasarkan banyak ${(widget.namaCategory == "Tanaman Paku Air") ? "Box" : "instalasi $mediaTANAM"} dengan volumenya maka kami rekomndasikan Kebutuhan ABMix adalah :  \n",
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: kTextColor,
                                                      fontSize: heightfit(sT16),
                                                    ),
                                                  ),
                                                ])),
                                                SizedBox(
                                                  height: defaultPadding / 2,
                                                ),
                                                cardWithImg(
                                                    false,
                                                    "Volume Total: \n${totalVolumeAir.toStringAsFixed(1)} Liter Air",
                                                    40,
                                                    Container(
                                                      child: Column(
                                                        children: [
                                                          Container(
                                                            // height: 200,
                                                            width: heightfit(
                                                                double
                                                                    .infinity),
                                                            decoration:
                                                                BoxDecoration(
                                                                    color: Colors
                                                                        .white,
                                                                    borderRadius: BorderRadius.only(
                                                                        bottomLeft:
                                                                            Radius.circular(
                                                                                20),
                                                                        bottomRight:
                                                                            Radius.circular(
                                                                                20),
                                                                        topLeft:
                                                                            Radius.circular(
                                                                                20),
                                                                        topRight:
                                                                            Radius.circular(20)),
                                                                    // border:
                                                                    //     Border.all(color: kTextColor.withOpacity(.8), width: .2)
                                                                    boxShadow: [
                                                                  BoxShadow(
                                                                      blurRadius:
                                                                          10,
                                                                      offset:
                                                                          Offset(
                                                                              -1,
                                                                              8),
                                                                      color: Colors
                                                                          .green
                                                                          .withOpacity(
                                                                              .3))
                                                                ]),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsets.all(
                                                                      defaultPadding /
                                                                          2),
                                                              child: Column(
                                                                children: [
                                                                  Fields(
                                                                    controller:
                                                                        TextEditingController(
                                                                            text:
                                                                                volumePenampungAir.toStringAsFixed(1)),

                                                                    // dataKategoriInisialisasi.where((element) => element.vari == data.keys.elementAt(index)[0].toString()).first.satuan
                                                                    satuan:
                                                                        "Liter",
                                                                    title:
                                                                        "Volume Tampung air",
                                                                    tema: Colors
                                                                        .green,
                                                                    onStateChange:
                                                                        (valu) {
                                                                      Future.microtask(
                                                                          () {
                                                                        setState(
                                                                            () {
                                                                          volumePenampungAir =
                                                                              double.tryParse(valu)!;
                                                                          MyDataFilterOBJTanam!.propertyLainnya["Volume Box Air"] =
                                                                              volumePenampungAir;
                                                                        });
                                                                      });
                                                                    },
                                                                    inputType: TextInputType.numberWithOptions(
                                                                        decimal:
                                                                            true),
                                                                    enable:
                                                                        _costumevolumeAir,
                                                                  ),
                                                                  Center(
                                                                    child: Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      children: [
                                                                        Checkbox(
                                                                          value:
                                                                              _costumevolumeAir,
                                                                          onChanged:
                                                                              (check) {
                                                                            Future.microtask(() {
                                                                              setState(() {
                                                                                _costumevolumeAir = check!;
                                                                                MyDataFilterOBJTanam!.propertyLainnya["CostumevolumeAir"] = _costumevolumeAir;
                                                                              });
                                                                            });
                                                                          },
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                          Text(
                                                            (widget.namaCategory ==
                                                                    "Tanaman Paku Air")
                                                                ? "Volume Tampung air (Box): ${VolumePot.toStringAsFixed(1)} Liter air"
                                                                : "\n- Volume Tampung air (Box): ${volumePenampungAir.toStringAsFixed(1)} Liter air\n"
                                                                    "- Volume per${(widget.namaCategory == "Tanaman Paku Air") ? "Box" : "instalasi $mediaTANAM"} ${VolumePot.toStringAsFixed(1)} liter air",
                                                            style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color:
                                                                  Colors.white,
                                                              fontSize:
                                                                  heightfit(
                                                                      sT16),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    )),
                                                SizedBox(
                                                  height: defaultPadding / 2,
                                                ),
                                                RichText(
                                                    textAlign: TextAlign.right,
                                                    text: TextSpan(children: [
                                                      TextSpan(
                                                        text:
                                                            "Pemupukan AB Mix : ",
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: kTextColor,
                                                          fontSize:
                                                              heightfit(sT26),
                                                        ),
                                                      ),
                                                    ])),
                                                SizedBox(
                                                  height: defaultPadding / 2,
                                                ),
                                                RichText(
                                                    text: TextSpan(children: [
                                                  TextSpan(
                                                    text:
                                                        "Tambahkan ABmix secara perlahan dan sesuaikan dengan nilai tds meter sampai sesuai dengan ppm : $tdsDiharapkan",
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      color: kTextColor,
                                                      fontSize: heightfit(sT20),
                                                    ),
                                                  ),
                                                ])),

                                                RichText(
                                                    text: TextSpan(children: [
                                                  TextSpan(
                                                    text:
                                                        "\nPerkiraan Takaran ABmix  untuk mencapai ppm : $tdsDiharapkan sesuai dengan volume air : ${totalVolumeAir.toStringAsFixed(1)} Liter Berikut ini : ",
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      color: kTextColor,
                                                      fontSize: heightfit(sT16),
                                                    ),
                                                  ),
                                                ])),
                                                SizedBox(
                                                  height: defaultPadding / 2,
                                                ),
                                                cardWithImg(
                                                    false,
                                                    "AB Mix: \n${kebutuhanABMix.toStringAsFixed(1)} ml",
                                                    40,
                                                    Container(
                                                      child: Column(
                                                        children: [
                                                          Text(
                                                            "AB Mix :",
                                                            style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color:
                                                                  Colors.white,
                                                              fontSize:
                                                                  heightfit(
                                                                      sT20),
                                                            ),
                                                          ),
                                                          Text(
                                                            "\n-Larutan A: ${(kebutuhanABMix / 2).toStringAsFixed(1)} ml\n"
                                                            "-Larutan B : ${(kebutuhanABMix / 2).toStringAsFixed(1)} ml",
                                                            style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color:
                                                                  Colors.white,
                                                              fontSize:
                                                                  heightfit(
                                                                      sT16),
                                                            ),
                                                          ),
                                                          Text(
                                                            "\nTetap sesuakan dengan alat ukur TDS",
                                                            style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color:
                                                                  Colors.white,
                                                              fontSize:
                                                                  heightfit(
                                                                      sT12),
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height:
                                                                defaultPadding /
                                                                    2,
                                                          ),
                                                        ],
                                                      ),
                                                    )),
                                                SizedBox(
                                                  height: defaultPadding / 2,
                                                ),
                                                Text(
                                                  "Harga ABMIX Didaerah anda: ",
                                                  style: TextStyle(
                                                      fontSize: heightfit(24),
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors
                                                          .green.shade800),
                                                ),
                                                SizedBox(
                                                  height: defaultPadding,
                                                ),
                                                Container(
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.only(
                                                              bottomLeft: Radius
                                                                  .circular(0),
                                                              bottomRight:
                                                                  Radius
                                                                      .circular(
                                                                          20),
                                                              topLeft: Radius
                                                                  .circular(20),
                                                              topRight: Radius
                                                                  .circular(0)),
                                                      border: Border.all(
                                                          style:
                                                              BorderStyle.solid,
                                                          color:
                                                              warnas("f1c232"),
                                                          width: 3.5),
                                                      boxShadow: [
                                                        BoxShadow(
                                                            blurRadius: 10,
                                                            offset:
                                                                Offset(-5, 5),
                                                            color: Colors
                                                                .green.shade700
                                                                .withOpacity(
                                                                    .2))
                                                      ],
                                                    ),
                                                    child: UangPerSatuan(
                                                      onChangeState:
                                                          (double hasilrp,
                                                              double rp,
                                                              double perBanyak,
                                                              String satuan) {
                                                        print(
                                                            "Rp $hasilrp $hargaTotalABmix");
                                                        // Future.microtask(() {
                                                        //   setState(() {
                                                        //
                                                        //   });
                                                        // });
                                                        hargaNotifier.value = {
                                                          "hargaPer": rp,
                                                          "perBanyak":
                                                              perBanyak,
                                                          "satuan": satuan,
                                                          "hasilrp": hasilrp,
                                                        };
                                                        // Simpan juga ke MyDataFilterOBJTanam
                                                        MyDataFilterOBJTanam!
                                                                    .propertyLainnya[
                                                                "hargaPerBanyakSatuan"] =
                                                            hargaNotifier.value;

                                                        // MyDataFilterOBJTanam!
                                                        //     .propertyLainnya[
                                                        // "hargaPerBanyakSatuan"] = {
                                                        //   "hargaPer": rp,
                                                        //   "perBanyak": perBanyak,
                                                        //   "satuan": satuan,
                                                        //   "hasilrp": hasilrp
                                                        //
                                                        // };
                                                        hargaABmix = hasilrp;
                                                      },
                                                      selectedUnitFrom:
                                                          MyDataFilterOBJTanam!
                                                                      .propertyLainnya[
                                                                  "hargaPerBanyakSatuan"]
                                                              ["satuan"],
                                                      selectedUnitType: 'l',
                                                      selectedUnitTos: 'ml',
                                                      hargaPer: double.tryParse(
                                                          MyDataFilterOBJTanam!
                                                              .propertyLainnya[
                                                                  "hargaPerBanyakSatuan"]
                                                                  ["hargaPer"]
                                                              .toString())!,
                                                      perbanyak: double.tryParse(
                                                          MyDataFilterOBJTanam!
                                                              .propertyLainnya[
                                                                  "hargaPerBanyakSatuan"]
                                                                  ["perBanyak"]
                                                              .toString())!,
                                                    )),
                                                SizedBox(
                                                  height: defaultPadding,
                                                ),
                                                // :Container(),

                                                cardWithImg(
                                                    false,
                                                    "Rp. ${(MyDataFilterOBJTanam!.propertyLainnya["adaPakanAlternatif"] == true) ? formatRupiah((hargaTotalABmix.round()).toString()) : formatRupiah(hargaTotalABmix.toString())}",
                                                    34,
                                                    _buildHargaDisplay()
                                                    // ValueListenableBuilder<Map<String, dynamic>>(
                                                    //   valueListenable: hargaNotifier,
                                                    //   builder: (context, value, _) {
                                                    //     //               setState(() {
                                                    //     //
                                                    //     //               });
                                                    //     return

                                                    //   },
                                                    // )
                                                    )
                                                // cardWithImg(
                                                //     false,
                                                //     "Rp. ${(MyDataFilterOBJTanam!.propertyLainnya["adaPakanAlternatif"] == true) ? formatRupiah((hargaTotalABmix.round()).toString()) : formatRupiah(hargaTotalABmix.toString())} ",
                                                //     34,
                                                //     Column(
                                                //       children: [
                                                //
                                                //         ValueListenableBuilder<Map<String, dynamic>>(
                                                //           valueListenable: hargaNotifier,
                                                //           builder: (context, value, _) {
                                                //             Future.microtask(() {
                                                //               setState(() {
                                                //
                                                //               });
                                                //             });
                                                //             return Text(
                                                //               "\nTotal harga yang dikeluarkan untuk AB Mix $banyakTanaman ${(widget.namaCategory == "Tanaman Paku Air")?"Box":"instalasi ${mediaTANAM}"} / Total Volume air",
                                                //               style: TextStyle(
                                                //                 fontWeight: FontWeight.bold,
                                                //                 color: Colors.white,
                                                //                 fontSize: heightfit(sT16),
                                                //               ),
                                                //             );
                                                //           },
                                                //         ),
                                                //
                                                //       ],
                                                //     ))
                                              ],
                                            )),
                                      ],
                                    )),
                              ),
                            ],
                          ),
                        ),
                      ),
                      /////////////======================================================

                      SizedBox(
                        height: defaultPadding,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(0),
                              bottomRight: Radius.circular(20),
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(0)),
                          border: Border.all(
                              style: BorderStyle.solid,
                              color: warnas("f1c232"),
                              width: 3.5),
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 10,
                                offset: Offset(-5, 5),
                                color: Colors.green.shade700.withOpacity(.2))
                          ],
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(defaultPadding / 2),
                          child: Column(
                            children: [
                              SizedBox(
                                height: defaultPadding,
                              ),
                              RichText(
                                  text: TextSpan(children: [
                                TextSpan(
                                  text: "Hasil Tanaman : ",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: kTextColor,
                                    fontSize: heightfit(sT26),
                                  ),
                                ),
                              ])),
                              SizedBox(
                                height: defaultPadding / 2,
                              ),
                              Container(
                                padding: EdgeInsets.all(defaultPadding),
                                decoration: BoxDecoration(
                                  color: kTextColor,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Center(
                                    child: Text(
                                  "Perkiraan ${umurTanaman} kali Panen dari awal panen di umur ${double.tryParse(dataSayur![indexJb].umurPanen.toString())!} minggu sampai umur tidak produktif berbuah diumur ${double.tryParse(dataSayur![indexJb].umurTidakProduktif.toString())!} minggu",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: heightfit(sT16),
                                  ),
                                )),
                              ),
                              SizedBox(
                                height: defaultPadding,
                              ),
                              (widget.namaCategory == "Tanaman Paku Air")
                                  ? Container()
                                  : Column(
                                      children: [
                                        Text(
                                          'Tabel Hasil Panen dan Keuntungan',
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(height: defaultPadding / 2),
                                        PanenKeuntunganDataTable(
                                          panenKeuntunganData:
                                              panenKeuntunganData,
                                          removeRow: removeRow,
                                          addRow: addRow,
                                          biayaTotal: 0,
                                          updateData: (int index, String key,
                                              double value) {
                                            Future.microtask(() {
                                              setState(() {
                                                panenKeuntunganData[index]
                                                    [key] = value;
                                                // generateInitialData();

                                                totalHasilPanen =
                                                    panenKeuntunganData.fold(
                                                        0.0,
                                                        (sum, item) =>
                                                            sum +
                                                            item['hasilPanen']);
                                                totalKeuntungan =
                                                    panenKeuntunganData.fold(
                                                        0.0,
                                                        (sum, item) =>
                                                            sum +
                                                            (item['hasilPanen']
                                                                    as double) *
                                                                (item['hargaPerKg']
                                                                    as double));

                                                MyDataFilterOBJTanam!
                                                            .propertyLainnya[
                                                        "DataTabel"] =
                                                    panenKeuntunganData;
                                              });
                                            });
                                          },
                                        ),
                                        Container(
                                          child: Container(
                                              margin: EdgeInsets.symmetric(
                                                  horizontal: heightfit(
                                                      defaultPadding / 2),
                                                  vertical: heightfit(
                                                      defaultPadding / 2)),
                                              // height: 200,
                                              width: heightfit(double.infinity),
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  20),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  20),
                                                          topLeft:
                                                              Radius.circular(
                                                                  20),
                                                          topRight:
                                                              Radius.circular(
                                                                  20)),
                                                  // border:
                                                  //     Border.all(color: kTextColor.withOpacity(.8), width: .2)
                                                  boxShadow: [
                                                    BoxShadow(
                                                        blurRadius: 10,
                                                        offset: Offset(-1, 8),
                                                        color: Colors.green
                                                            .withOpacity(.3))
                                                  ]),
                                              child: Stack(
                                                children: [
                                                  Positioned(
                                                    bottom: 0,
                                                    right: 0,
                                                    // left: 0,
                                                    child: Container(
                                                      height: heightfit(90),
                                                      width: heightfit(100),
                                                      decoration: BoxDecoration(
                                                          color: Colors
                                                              .green.shade100,
                                                          borderRadius: BorderRadius.only(
                                                              bottomLeft: Radius
                                                                  .circular(0),
                                                              bottomRight:
                                                                  Radius
                                                                      .circular(
                                                                          20),
                                                              topLeft: Radius
                                                                  .circular(90),
                                                              topRight: Radius
                                                                  .circular(0)),
                                                          // border:
                                                          //     Border.all(color: kTextColor.withOpacity(.8), width: .2)
                                                          boxShadow: [
                                                            BoxShadow(
                                                                blurRadius: 10,
                                                                offset: Offset(
                                                                    -1, 8),
                                                                color: Colors
                                                                    .green
                                                                    .withOpacity(
                                                                        .3))
                                                          ]),
                                                    ),
                                                  ),
                                                  Padding(
                                                      padding: EdgeInsets.all(
                                                        defaultPadding / 2,
                                                      ),
                                                      child: Column(
                                                        children: [
                                                          cardWithImg(
                                                            false,
                                                            "Total Omset : Rp.${formatRupiah(totalKeuntungan.toStringAsFixed(0))} ",
                                                            30,
                                                            Text(
                                                              "Perkiraan hasil Omset dari total panen ${totalHasilPanen.toStringAsFixed(0)} kg dari banyak Tanaman ${banyakTanaman.toStringAsFixed(0)} Tanaman",
                                                              style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: Colors
                                                                    .white,
                                                                fontSize:
                                                                    heightfit(
                                                                        sT16),
                                                              ),
                                                            ),
                                                          ),
                                                          cardWithImg(
                                                            false,
                                                            "Omset PerBulan : Rp. ${formatRupiah((totalKeuntungan / (panenKeuntunganData.length / 4)).toStringAsFixed(0))} ",
                                                            30,
                                                            Text(
                                                              "Perkiraan Omset per Bulannya dengan banyak Tanaman ${banyakTanaman.toStringAsFixed(0)} Tanaman",
                                                              style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: Colors
                                                                    .white,
                                                                fontSize:
                                                                    heightfit(
                                                                        sT16),
                                                              ),
                                                            ),
                                                          )
                                                        ],
                                                      )),
                                                ],
                                              )),
                                        ),
                                      ],
                                    ),

                              // fieldoBaterai[5],
                            ],
                          ),
                        ),
                      ),
                      // Print conclusions
                      SizedBox(
                        height: defaultPadding,
                      ),

                      SizedBox(
                        height: defaultPadding / 2,
                      ),
                      (widget.namaCategory == "Tanaman Paku Air")
                          ? Container()
                          : Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(0),
                                    bottomRight: Radius.circular(20),
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(0)),
                                border: Border.all(
                                    style: BorderStyle.solid,
                                    color: warnas("f1c232"),
                                    width: 3.5),
                                boxShadow: [
                                  BoxShadow(
                                      blurRadius: 10,
                                      offset: Offset(-5, 5),
                                      color:
                                          Colors.green.shade700.withOpacity(.2))
                                ],
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(defaultPadding / 2),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: defaultPadding,
                                    ),
                                    RichText(
                                        text: TextSpan(children: [
                                      TextSpan(
                                        text: "Keuntungan Bersih : ",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: kTextColor,
                                          fontSize: heightfit(sT26),
                                        ),
                                      ),
                                    ])),
                                    SizedBox(
                                      height: defaultPadding / 2,
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(defaultPadding),
                                      decoration: BoxDecoration(
                                        color: kTextColor,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Center(
                                          child: Text(
                                        "Dari total Omset Rp.${formatRupiah(totalKeuntungan.toStringAsFixed(0))} dari panen ${panenKeuntunganData.length} kali",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                          fontSize: heightfit(sT16),
                                        ),
                                      )),
                                    ),
                                    SizedBox(
                                      height: defaultPadding / 2,
                                    ),

                                    Container(
                                      child: Container(
                                          margin: EdgeInsets.symmetric(
                                              horizontal:
                                                  heightfit(defaultPadding / 2),
                                              vertical: heightfit(
                                                  defaultPadding / 2)),
                                          // height: 200,
                                          width: heightfit(double.infinity),
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.only(
                                                  bottomLeft:
                                                      Radius.circular(20),
                                                  bottomRight:
                                                      Radius.circular(20),
                                                  topLeft: Radius.circular(20),
                                                  topRight:
                                                      Radius.circular(20)),
                                              // border:
                                              //     Border.all(color: kTextColor.withOpacity(.8), width: .2)
                                              boxShadow: [
                                                BoxShadow(
                                                    blurRadius: 10,
                                                    offset: Offset(-1, 8),
                                                    color: Colors.green
                                                        .withOpacity(.3))
                                              ]),
                                          child: Stack(
                                            children: [
                                              Positioned(
                                                bottom: 0,
                                                right: 0,
                                                // left: 0,
                                                child: Container(
                                                  height: heightfit(90),
                                                  width: heightfit(100),
                                                  decoration: BoxDecoration(
                                                      color: Colors
                                                          .green.shade100,
                                                      borderRadius:
                                                          BorderRadius.only(
                                                              bottomLeft: Radius
                                                                  .circular(0),
                                                              bottomRight:
                                                                  Radius
                                                                      .circular(
                                                                          20),
                                                              topLeft: Radius
                                                                  .circular(90),
                                                              topRight: Radius
                                                                  .circular(0)),
                                                      // border:
                                                      //     Border.all(color: kTextColor.withOpacity(.8), width: .2)
                                                      boxShadow: [
                                                        BoxShadow(
                                                            blurRadius: 10,
                                                            offset:
                                                                Offset(-1, 8),
                                                            color: Colors.green
                                                                .withOpacity(
                                                                    .3))
                                                      ]),
                                                ),
                                              ),
                                              Padding(
                                                  padding: EdgeInsets.all(
                                                    defaultPadding / 2,
                                                  ),
                                                  child: Column(
                                                    children: [
                                                      cardWithImg(
                                                        false,
                                                        "Total Keuntungan : Rp.${formatRupiah((keuntungan).toStringAsFixed(0))} ",
                                                        30,
                                                        Text(
                                                          "Perkiraan hasil Omset dari total panen ${totalHasilPanen.toStringAsFixed(0)} kg dan pengeluaran keseluruhan Rp.${pengeluaran.toStringAsFixed(0)}",
                                                          style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Colors.white,
                                                            fontSize:
                                                                heightfit(sT16),
                                                          ),
                                                        ),
                                                      ),
                                                      cardWithImg(
                                                        false,
                                                        "Keuntungan PerBulan : Rp. ${formatRupiah((keuntungan / (panenKeuntunganData.length / 4)).toStringAsFixed(0))} ",
                                                        30,
                                                        Text(
                                                          "Perkiraan Keuntungan per Bulannya dengan banyak Tanaman ${banyakTanaman.toStringAsFixed(0)} Tanaman",
                                                          style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Colors.white,
                                                            fontSize:
                                                                heightfit(sT16),
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  )),
                                            ],
                                          )),
                                    ),
                                    // fieldoBaterai[5],
                                  ],
                                ),
                              ),
                            ),
                      // Print conclusions
                      SizedBox(
                        height: defaultPadding * 2,
                      ),
                      BannerWidget(
                        gambarBanner:
                            "assets/images/MenuRawatan/RawatTanam/tikus.png",
                      ),

                      SizedBox(
                        height: defaultPadding,
                      ),
                      AutoSizeText(
                        "Pengeluaran Lainnya : ",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.normal,
                          fontSize: 24,
                          color: kTextColor,
                        ),
                        minFontSize: 12,
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(
                        height: defaultPadding,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(.7),
                            border: Border.all(
                                style: BorderStyle.solid,
                                color: warnas("0b5394"),
                                width: 3.5),
                            // color: Theme.of(context).cardColor,
                            borderRadius: BorderRadius.circular(15)),
                        child: CardpHs(
                          title: "Tambahakan Pengeluaran : ",
                          hasilAkhir: "",
                          cardornot: false,
                          sizes: heightfit(14),
                          texts: "",
                          multitext: const [],
                          tema: Colors.green.shade800,
                          cardCostume: Container(),
                          id: 0,
                          widgetCostum: Column(
                            children: [
                              SizedBox(
                                height: defaultPadding / 2,
                              ),
                              SizedBox(
                                height: SizeConfig.screenHeight! / 2,
                                width: SizeConfig.screenWidth,
                                child: NotificationListener<ScrollNotification>(
                                  onNotification:
                                      (ScrollNotification notification) {
                                    if (notification is ScrollEndNotification) {
                                      if (_childScrollController
                                          .position.atEdge) {
                                        if (_childScrollController
                                                .position.pixels ==
                                            0) {
                                          // At the top of the child scroll
                                          // widget.parentController.jumpTo(widget.parentController.offset - 30);
                                          _parentScrollController.animateTo(
                                            _parentScrollController.offset -
                                                SizeConfig.screenHeight! / 4,
                                            duration: const Duration(
                                                milliseconds: 300),
                                            curve: Curves.easeInOut,
                                          );
                                        } else {
                                          // At the bottom of the child scroll
                                          // widget.parentController.jumpTo(widget.parentController.offset + 30);
                                          _parentScrollController.animateTo(
                                            _parentScrollController.offset +
                                                SizeConfig.screenHeight! / 4,
                                            duration: const Duration(
                                                milliseconds: 300),
                                            curve: Curves.easeInOut,
                                          );
                                        }
                                      }
                                    }
                                    return false;
                                  },
                                  child: ListView.builder(
                                      controller: _childScrollController,
                                      itemCount: dataPengeluaran.length,
                                      // shrinkWrap: true,
                                      // Menyesuaikan ukuran dengan jumlah item
                                      // physics: const NeverScrollableScrollPhysics(),
                                      scrollDirection: Axis.vertical,
                                      // padding: const EdgeInsets.symmetric(horizontal: 56),
                                      // addRepaintBoundaries: true,
                                      itemBuilder: (context, indexFixs) {
                                        // final item = dataParentss.toList()[index % widget.items.length];
                                        // dataParentss[indexK].pupuk[indexFixs].hasil = hargaObject["hasilAkhirPerObject"].toString();
                                        return ExpandingCards(
                                          height: 300,
                                          indexFix: indexFixs,
                                          // len: dataParentss[indexK].pupuk.length,
                                          len: dataPengeluaran.length,
                                          gridview: false,
                                          axisCount: 3,
                                          onchange: (indekpuu) {
                                            // hasilTotal(indexK, indexFixs, dataParentss[indexK],
                                            //     widget.waktu);
                                          },
                                          img: dataKategoriMenuRawatan[
                                                  c.indexMenuRawatan.value]
                                              .img_banner[1],
                                          title: dataPengeluaran[indexFixs]
                                              ["Nama Pengeluaran"],
                                          subtitle:
                                              "Rp.${formatRupiah(dataPengeluaran[indexFixs]["Beban Biaya"].toString())}",
                                          penjelas: "",
                                          // "Dengan \nDaya ${dataParentss[indexK].pupuk[indexFixs].namaPupu} : ${dataParentss[indexK].pupuk[indexFixs].watt} Watt\nTotal daya : ${dataParentss[indexK].pupuk[indexFixs].hasil} Watt \nSelama waktu: ${dataParentss[indexK].pupuk[indexFixs].LamaListring} Jam ",
                                          dialog: Container(),
                                          tambah: (LO) {
                                            Future.microtask(() {
                                              setState(() {});
                                            });
                                            // setState(() {
                                            dataPengeluaran.add({
                                              "Nama Pengeluaran": "Listrik",
                                              "Beban Biaya": 0.0
                                            });

                                            // setPreference();
                                            // setPreference();
                                            // });
                                          },
                                          kurang: (s) {
                                            Future.microtask(() {
                                              setState(() {});
                                            });
                                            // setState(() {
                                            List ass = [0, 1, 2];
                                            if (ass.contains(indexFixs)) {
                                            } else {
                                              dataPengeluaran
                                                  .removeAt(indexFixs);
                                            }

                                            // });
                                            // setPreference();
                                          },
                                          costume: SizedBox(
                                            height: 320,
                                            width: 360,
                                            child: FittedBox(
                                              child: Container(
                                                height: 350,
                                                width: 360,
                                                padding: EdgeInsets.only(
                                                    top: defaultPadding / 2),
                                                child: CardpHs(
                                                  title: "Edit Pengeluaran : ",
                                                  hasilAkhir: "",
                                                  cardornot: false,
                                                  sizes: heightfit(18),
                                                  texts: "",
                                                  multitext: const [],
                                                  tema: Colors.green.shade800,
                                                  cardCostume: Container(),
                                                  id: 0,
                                                  widgetCostum: SizedBox(
                                                    height: 280,
                                                    width: 350,
                                                    child: FittedBox(
                                                      child: SizedBox(
                                                        height: 240,
                                                        width: 300,
                                                        child: Column(
                                                          children: [
                                                            Fields(
                                                              controller: TextEditingController(
                                                                  text: "${dataPengeluaran[indexFixs]["Nama Pengeluaran"]}"
                                                                      .toString()),
                                                              satuan: "",
                                                              title:
                                                                  "Nama Pengeluaran \n",
                                                              tema: Colors
                                                                  .black38,
                                                              onStateChange:
                                                                  (values) {
                                                                Future
                                                                    .microtask(
                                                                        () {
                                                                  setState(
                                                                      () {});
                                                                });
                                                                dataPengeluaran[
                                                                        indexFixs]
                                                                    [
                                                                    "Nama Pengeluaran"] = values;

                                                                // setState(() {
                                                                //
                                                                // });
                                                                // setPreference();
                                                              },
                                                              inputType:
                                                                  TextInputType
                                                                      .text,
                                                              enable: true,
                                                            ),
                                                            Fields(
                                                              controller: TextEditingController(
                                                                  text: "${dataPengeluaran[indexFixs]["Beban Biaya"]}"
                                                                      .toString()),
                                                              satuan: (indexFixs ==
                                                                      0)
                                                                  ? ""
                                                                  : (indexFixs ==
                                                                          1)
                                                                      ? "Rp/$banyakTanaman"
                                                                      : "Rp/Kg",
                                                              title: "Harga \n",
                                                              tema: Colors
                                                                  .black38,
                                                              onStateChange:
                                                                  (values) {
                                                                Future
                                                                    .microtask(
                                                                        () {
                                                                  setState(
                                                                      () {});
                                                                });
                                                                dataPengeluaran[
                                                                        indexFixs]
                                                                    [
                                                                    "Beban Biaya"] = values;

                                                                // setState(() {
                                                                //
                                                                // });
                                                                // setPreference();
                                                              },
                                                              enable: true,
                                                              inputType: TextInputType
                                                                  .numberWithOptions(
                                                                      decimal:
                                                                          true),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                      }),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: defaultPadding,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(0),
                              bottomRight: Radius.circular(20),
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(0)),
                          border: Border.all(
                              style: BorderStyle.solid,
                              color: warnas("0b5394"),
                              width: 3.5),
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 10,
                                offset: Offset(-5, 5),
                                color: Colors.green.shade700.withOpacity(.2))
                          ],
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(defaultPadding / 2),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: defaultPadding,
                                  ),
                                  RichText(
                                      text: TextSpan(children: [
                                    TextSpan(
                                      text: "Biaya Investasi diawal : \n",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: kTextColor,
                                        fontSize: heightfit(sT26),
                                      ),
                                    ),
                                  ])),
                                  for (int t = 0;
                                      t < dataPengeluaran.length - 1;
                                      t++)
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        RichText(
                                            text: TextSpan(children: [
                                          TextSpan(
                                            text:
                                                "Biaya ${dataPengeluaran[t]["Nama Pengeluaran"]} :",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: kTextColor,
                                              fontSize: heightfit(sT20),
                                            ),
                                          ),
                                        ])),
                                        Padding(
                                          padding: EdgeInsets.all(
                                              defaultPadding / 2),
                                          child: Container(
                                            height: 50,
                                            decoration: BoxDecoration(
                                              color: warnas(List.of(filtersdata[
                                                          c.selectedItemCalcT
                                                              .value]
                                                      .studiKasus)
                                                  .map((e) => e.values)
                                                  .toList()[0]
                                                  .first["warna"]),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: Center(
                                                child: Text(
                                              "${(dataPengeluaran[t]["Nama Pengeluaran"] == "AB Mix") ? "Rp. ${formatRupiah(hargaTotalABmix.toString())}" : (dataPengeluaran[t]["Nama Pengeluaran"] == "Bibit") ? "Rp. ${formatRupiah((hargaTanamanTotal).toString())}" : (dataPengeluaran[t]["Nama Pengeluaran"] == "Pot") ? "Rp. ${formatRupiah(hargaPotTotal.toString())}" : "Rp. ${formatRupiah(dataPengeluaran[t]["Beban Biaya"].toString())}"} ",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                                fontSize: heightfit(sT16),
                                              ),
                                            )),
                                          ),
                                        ),
                                      ],
                                    ),
                                  SizedBox(
                                    height: defaultPadding / 2,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: defaultPadding,
                      ),
                      AutoSizeText(
                        "Total : ",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.normal,
                          fontSize: 20,
                          color: kTextColor,
                        ),
                        minFontSize: 12,
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(
                        height: defaultPadding / 2,
                      ),
                      Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: defaultPadding / 3,
                            vertical: defaultPadding / 3,
                          ),
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            color: Colors.orange,
                            // color: Theme.of(context).cardColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            "Rp. "
                            // "${formatRupiah((hitungHarga(aDosis, hargaDosis).values.toList().reduce((value, element) => value + element) + (hargaTotalpH + hitungTotalBiaya(beratPupuk))).toString())}"
                            "${formatRupiah((hitungTotalBiaya(
                              hargaTotalABmix,
                              hargaPotTotal,
                              hargaTanamanTotal,
                            )).toString())}",
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold),
                          )),
                    ],
                  )),
            ),
          )
        : Container(
            width: SizeConfig.screenWidth,
            height: SizeConfig.screenHeight! / 4,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(
              child: Padding(
                padding: EdgeInsets.all(defaultPadding),
                child: ListView(
                  children: dataTampungHasil.entries.map((entry) {
                    return ListTile(
                      title: Text(entry.key,
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      subtitle: displayValue(entry.value),
                    );
                  }).toList(),
                ),
              ),
            ),
          );
  }

  Padding cardWithImg(
      bool garis, String penjelas, double size, Widget widgetCostume) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: defaultPadding / 2,
      ),
      child: Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          color: Colors.black12.withOpacity(.5),
          // color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
            Stack(
              children: [
                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                            dataKategoriMenuRawatan[c.indexMenuRawatan.value]
                                .img_banner[0]),
                        fit: BoxFit.cover,
                      ),
                    ),
                    foregroundDecoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.black.withOpacity(0),
                          Colors.black.withOpacity(1),
                        ],
                        stops: const [0.7, 1],
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    width: 400,
                    // height: 500,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      color: Colors.black12.withOpacity(.5),
                      // color: Theme.of(context).cardColor,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: defaultPadding / 2,
                        vertical: defaultPadding * 2,
                      ),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Center(
                                    child: RichText(
                                  text: TextSpan(
                                    text: penjelas,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: size,
                                      decoration: (garis == true)
                                          ? TextDecoration.lineThrough
                                          : TextDecoration.none,
                                    ),
                                  ),
                                )),
                                SizedBox(
                                  height: heightfit(defaultPadding / 2),
                                ),
                                Column(children: const []),
                                SizedBox(
                                  height: heightfit(defaultPadding / 2),
                                ),
                                widgetCostume,
                                // Text(
                                //   "Dosis Acuhan dari Brosure",
                                //   style: TextStyle(
                                //       fontWeight:
                                //       FontWeight
                                //           .bold,
                                //       color: Colors
                                //           .white!,
                                //       fontStyle:
                                //       FontStyle
                                //           .normal,
                                //       fontSize: 16),
                                // ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                // Align(
                //   alignment: Alignment.topRight,
                //   child: Container(
                //     padding: EdgeInsets.symmetric(
                //       horizontal: defaultPadding / 3,
                //       vertical: defaultPadding / 3,
                //     ),
                //     clipBehavior: Clip.antiAlias,
                //     decoration: BoxDecoration(
                //       color: Colors.orange,
                //       // color: Theme.of(context).cardColor,
                //       borderRadius: BorderRadius.circular(10),
                //     ),
                //     child: Text(
                //         "${filterCategorybyPerusahaan()[(c.indexMenuRawatan.value == 3 || c.indexMenuRawatan.value == 4  || c.indexMenuRawatan.value == 5 ) ? 0 : MyDataFilterOBJTanam!.propertyLainnya["tampungan"]["indexperusahaan"]]}",
                //         style: TextStyle(
                //             color: Colors.black, fontWeight: FontWeight.bold)),
                //   ),
                // ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class BannerWidget extends StatelessWidget {
  final String? gambarBanner;

  const BannerWidget({
    super.key,
    required this.gambarBanner,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: SizeConfig.screenWidth,
      child: Stack(
        children: [
          Center(
            child: ElevatedButton(
              onPressed: () {
                // print("ok");
                // _launchURL(
                //     filterdataByDiskon(c.indexMenuRawatan.value.toString())[0].link);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                padding: EdgeInsets.all(1),
                // shadowColor: Colors.black,
                // padding: EdgeInsets.only(top: 60),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                elevation: 0,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(defaultPadding)),
                // Menggunakan anti-aliasing untuk tepi oval yang lebih halus
                child: Image.asset(gambarBanner!),
              ),
            ),
          ),
          Positioned(
            right: defaultPadding / 2,
            top: 0,
            child: ElevatedButton(
              onPressed: () {
                print("ok");
                launchURL(
                    filterdataByDiskon(c.indexMenuRawatan.value.toString())[0]
                        .link);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                padding: EdgeInsets.all(1),
                // shadowColor: Colors.black,
                // padding: EdgeInsets.only(top: 60),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 0,
              ),
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "> Cek di Toko Kami",
                  style: TextStyle(
                      color: kTextColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 14),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
