import 'dart:convert';

import 'package:rawatt/Debug/childWidgetFieldAyam.dart';
import 'package:rawatt/Debug/childWidgetFieldTanaman.dart';
import 'package:rawatt/Debug/managePakan.dart';
import 'package:rawatt/components/card_field.dart';
import 'package:rawatt/components/inputan.dart';
import 'package:rawatt/components/tabCostume.dart';
import 'package:rawatt/constants.dart';
import 'package:rawatt/screens/convert/component/Widget_Jenis_Tanah.dart';
import 'package:rawatt/screens/convert/component/Widget_Massa_Tanah.dart';

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
import 'childWidgetFieldMaggot.dart';
import 'uangPerSatuan.dart';
import 'widget_mediaLahan.dart';

class childWidgetFieldKolam extends StatefulWidget {
  final Function(String) onChangeState;
  final bool? info;
  const childWidgetFieldKolam({
    super.key,
    required this.onChangeState,
    required this.info,
  });

  @override
  State<childWidgetFieldKolam> createState() => _childWidgetFieldKolamState();
}

int indexMediaLahan = 0;
// Map dataRumusLuasLahan = {};
// double hasilLahan = 0.0;
// // int indexObjectIndexSelectedEdit = 0;

BuildContext? contexty;

// List<KategoriRumus> datakategorirum = [];

String hargapH = "0";
double hargaTotalpH = 0;

double hargaTotalMaggotIkan = 0;
// Map<dynamic, dynamic> hargaDosis = {};
// Map<dynamic, dynamic> aDosis = {};

// Map<String, String> hagaDosis = {};

void hitungProsesKolam() {
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

  if (copiedData!.propertyLainnya["adaPakanAlternatif"] == false) {
    hargaTotalMaggotIkan = 0;
  } else {
    // if(copiedData!.propertyLainnya["adaPakanAlternatifLainnya"] == false) {
    //   hargaTotalMaggotIkan = hargaMaggot! * pakanMaggotsIkan ;
    // }else{
    //   hargaTotalMaggotIkan = (hargaMaggot! * pakanMaggotsIkan) + (hargaPakuAir!*pakanPakuAirIkan!);
    // }
  }

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
        (copiedData!.propertyLainnya["pHData"]["hasil"] == null)
            ? 0
            : cariValue("pH"),
        "m");
    hitung(c.indexsubMenuRawatan.value, "(LMt/10000)*JPk",
        cariValue("LMt").toString());
  }

  datafilterMyData1![c.ObjectIndexSelectedEdit.value] = copiedData!;

  datafilterMyData1![c.ObjectIndexSelectedEdit.value].kategoriRumusKu =
      copiedData!.kategoriRumusKu;

  datafilterMyData1![c.ObjectIndexSelectedEdit.value]
          .propertyLainnya["tampungan"]["indexBentukMediaTanam"] =
      copiedData!.propertyLainnya["tampungan"]["indexBentukMediaTanam"];

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
          .propertyLainnya["luasMedia3D"] =
      copiedData!.propertyLainnya["luasMedia3D"];

  datafilterMyData1![c.ObjectIndexSelectedEdit.value]
          .propertyLainnya["satuanMediaLahan3D"] =
      copiedData!.propertyLainnya["satuanMediaLahan3D"];

  datafilterMyData1![c.ObjectIndexSelectedEdit.value]
          .propertyLainnya["Hasilluas3D"] =
      copiedData!.propertyLainnya["Hasilluas3D"];

  datafilterMyData1![c.ObjectIndexSelectedEdit.value]
          .propertyLainnya["ketebalanTanah"] =
      copiedData!.propertyLainnya["ketebalanTanah"];

  datafilterMyData1![c.ObjectIndexSelectedEdit.value]
      .propertyLainnya["adaUkurPH"] = copiedData!.propertyLainnya["adaUkurPH"];

  datafilterMyData1![c.ObjectIndexSelectedEdit.value]
          .propertyLainnya["adaPakanAlternatif"] =
      copiedData!.propertyLainnya["adaPakanAlternatif"];

  datafilterMyData1![c.ObjectIndexSelectedEdit.value]
          .propertyLainnya["adaPakanAlternatifLainnya"] =
      copiedData!.propertyLainnya["adaPakanAlternatifLainnya"];

  datafilterMyData1![c.ObjectIndexSelectedEdit.value]
          .propertyLainnya["adaJenisTanah"] =
      copiedData!.propertyLainnya["adaJenisTanah"];

  datafilterMyData1![c.ObjectIndexSelectedEdit.value]
      .propertyLainnya["indexJb"] = copiedData!.propertyLainnya["indexJb"];

  datafilterMyData1![c.ObjectIndexSelectedEdit.value]
          .propertyLainnya["tampungan"]["indexJenisTanah"] =
      copiedData!.propertyLainnya["tampungan"]["indexJenisTanah"];

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

  datafilterMyData1![c.ObjectIndexSelectedEdit.value]
          .propertyLainnya["alternatifPakan"] =
      copiedData!.propertyLainnya["alternatifPakan"];

  datafilterMyData1![c.ObjectIndexSelectedEdit.value]
          .propertyLainnya["hargaPerBanyakSatuan"] =
      copiedData!.propertyLainnya["hargaPerBanyakSatuan"];
  datafilterMyData1![c.ObjectIndexSelectedEdit.value]
          .propertyLainnya["hargaPerBanyakSatuanMaggot"] =
      copiedData!.propertyLainnya["hargaPerBanyakSatuanMaggot"];
  datafilterMyData1![c.ObjectIndexSelectedEdit.value]
          .propertyLainnya["hargaPerBanyakSatuanPaku"] =
      copiedData!.propertyLainnya["hargaPerBanyakSatuanPaku"];
  // hargaDosis.keys.toList().forEach((elementw) {
  //   dataProductsObj
  //       .where((element) => element.nama == elementw)
  //       .toList()
  //       .last
  //       .harga = hargaDosis[elementw].toString();
  // });
  datafilterMyData1![c.ObjectIndexSelectedEdit.value]
          .propertyLainnya["Edit Nilai Rekomendasi"] =
      copiedData!.propertyLainnya["Edit Nilai Rekomendasi"];

  datafilterMyData1![c.ObjectIndexSelectedEdit.value]
          .propertyLainnya["tambah pakan alternatif"] =
      copiedData!.propertyLainnya["tambah pakan alternatif"];

  aqw();

  datafilterMyData1![c.ObjectIndexSelectedEdit.value] = copiedData!;

  datafilterMyData1![c.ObjectIndexSelectedEdit.value].propertyLainnya["sr%"] =
      copiedData!.propertyLainnya["sr%"];

  datafilterMyData1![c.ObjectIndexSelectedEdit.value]
          .propertyLainnya["massaBibitTotal(Gr)"] =
      copiedData!.propertyLainnya["massaBibitTotal(Gr)"];

  datafilterMyData1![c.ObjectIndexSelectedEdit.value]
          .propertyLainnya["perkiraanPanenBobotLele(Gr)"] =
      copiedData!.propertyLainnya["perkiraanPanenBobotLele(Gr)"];
  datafilterMyData1![c.ObjectIndexSelectedEdit.value].propertyLainnya["fcr"] =
      copiedData!.propertyLainnya["fcr"];

  fix_updateParentData(datafilterMyData1!);

  setPreference();
}

void aqw() {
  if (copiedData!.propertyLainnya["adaUkurPH"] == false) {
    hargaTotalpH = 0;
  } else {
    hargaTotalpH = double.tryParse(hargapH)! * (cariValue("KpH") * 1000);
  }

  if (copiedData!.propertyLainnya["adaPakanAlternatif"] == false) {
    hargaTotalMaggotIkan = 0;
  } else {
    // if(copiedData!.propertyLainnya["adaPakanAlternatifLainnya"] == false) {
    //   hargaTotalMaggotIkan = hargaMaggot! * pakanMaggotsIkan ;
    // }else{
    //   hargaTotalMaggotIkan = (hargaMaggot! * pakanMaggotsIkan) + (hargaPakuAir!*pakanPakuAirIkan!);
    // }
  }

  datafilterMyData1![c.ObjectIndexSelectedEdit.value].hasilTotal =
      // (hitungHarga(aDosis, hargaDosis)
      //             .values
      //             .toList()
      //             .reduce((value, element) => value + element) +
      //         (hargaTotalpH + hitungTotalBiaya(beratPakan)))
      //     .toString();

      hitungTotalBiaya().toString();
}
// KategoriRumus? datamediatanamtam;

double hitungTotalBiaya() {
  double total = List.from(copiedData!.propertyLainnya["keperluanLainnya"])
      .fold(0.0, (previousValue, element) {
    double biaya = double.tryParse(element['Beban Biaya'].toString())!;
    // if (element['Nama Pengeluaran'] == 'Pakan/Kg') {
    //   biaya = double.tryParse(element['Beban Biaya'].toString())! * beratPakan;
    // }
    return previousValue + biaya;
  });
  double totalBiaya = total;

  return totalBiaya;
}

String changePath(String path) {
  // Memisahkan bagian-bagian dari path
  List<String> parts = path.split('/');

  // Memisahkan nama file dan ekstensi
  String filename = parts.last;
  List<String> filenameParts = filename.split('.');

  // Menambahkan "kolam_" ke nama file sebelum ekstensi
  String newFilename = "kolam_${filenameParts.first}.${filenameParts.last}";

  // Mengganti nama file pada bagian terakhir dari path
  parts[parts.length - 1] = newFilename;

  // Menggabungkan kembali bagian-bagian dari path
  return parts.join('/');
}

String addPrefixToFileName(String filePath, String prefix) {
  // Pisahkan path dan file name
  int lastSlashIndex = filePath.lastIndexOf('/');
  String path = filePath.substring(0, lastSlashIndex + 1);
  String fileName = filePath.substring(lastSlashIndex + 1);

  // Tambahkan prefix ke file name
  String modifiedFileName = prefix + fileName;

  // Gabungkan kembali path dan modified file name
  return path + modifiedFileName;
}

class _childWidgetFieldKolamState extends State<childWidgetFieldKolam> {
  double banyakIkan = 0;
  double banyakIkanSisa = 0;
  double beratIkanSisaAwal = 0;
  double beratIkanSisaAkhir = 0;

  double beratPakan = 0;

  List dates = [];
  double populasiTanam1Ha = 0;
  double populasiPetak = 0;
  final ScrollController _childScrollController = ScrollController();
  final ScrollController _parentScrollController = ScrollController();
  double hargaperKgPabrik = 0;
  double hargaperKgMaggot = 0;
  double hargaperKgPaku = 0;

  double TotalhargaperKgPabrik = 0;
  double TotalhargaperKgMaggot = 0;
  double TotalhargaperKgPaku = 0;

  List<Widget> fieldoBaterai = [];
  List<TextEditingController> myControlerssoBatrai = [];
  Map dataVariabelbaterai = {};

  Map dataVariabelbateraiPlus = {};
  List myControlerssoBatraiPlus = [];
  List fieldoBateraiPlus = [];

  int indexJb = 0;
  Map JenisBatteray = {
    "Ikan lele": [
      15.0,
      [
        {'periode': 1, 'presentase': 10, 'interval': 4, 'agenda': 'Awal Tebar'},
        {'periode': 2, 'presentase': 50, 'interval': 6, 'agenda': 'Sortir'},
        {'periode': 3, 'presentase': 40, 'interval': 4, 'agenda': 'Panen'}
      ],
      "Ketetapan perkiraan 1000 ikan dengan luas 15 m kubik"
    ],
    "Ikan Nila": [
      150.0,
      [
        {'periode': 1, 'presentase': 10, 'interval': 4, 'agenda': 'Awal Tebar'},
        {'periode': 2, 'presentase': 50, 'interval': 10, 'agenda': 'Sortir'},
        {'periode': 3, 'presentase': 40, 'interval': 6, 'agenda': 'Panen'}
      ],
      "Ketetapan perkiraan 1000 ikan dengan luas 150 m kubik"
    ]
  };

  // void prosesPh(){
  //
  // }
  //
  bool _isCheckedNilaiR = false;
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    Future.microtask(() {
      if (simpanhitung = true) {
        widget.onChangeState(
            datafilterMyData1![c.ObjectIndexSelectedEdit.value].hasilTotal);
        print(
            "hasil akhir ${datafilterMyData1![c.ObjectIndexSelectedEdit.value].hasilTotal}");
      }
    });
    // datamediatanamtam = dataKategoriRumus1.where((element) => element.id_MenuRawatan==c.indexMenuRawatan.value && element.idMediaTanam == 0).toList().where((element) => element.nama == "Persegi Panjang").toList().first;

    _parentScrollController.dispose();
    _childScrollController.dispose();
  }

  Widget Containe(int indexFixs, bool aktif) {
    return CardpHs(
      title:
          "Pengeluaran : ${MyDataFilterOBJ!.propertyLainnya["keperluanLainnya"][indexFixs]["Nama Pengeluaran"]}",
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
                  text:
                      "${MyDataFilterOBJ!.propertyLainnya["keperluanLainnya"][indexFixs]["Beban Biaya"]}"
                          .toString()),
              satuan: indexFixs == 0
                  ? "Rp"
                  : indexFixs == 1
                      ? "Rp/total bibit"
                      : "Rp/Kg",
              title: "Harga \n",
              tema: Colors.black38,
              onStateChange: (values) {
                Future.microtask(() {
                  setState(() {});
                });
                MyDataFilterOBJ!.propertyLainnya["keperluanLainnya"][indexFixs]
                    ["Beban Biaya"] = values;

                // setState(() {
                //
                // });
                // setPreference();
              },
              enable: aktif,
              inputType: TextInputType.number,
            ),
          ),
        ),
      ),
    );
  }

  void hitunglocal() {
    if (MyDataFilterOBJ!.propertyLainnya["adaJenisTanah"] == true) {
      c.massaJenis.value = cariValue("q");

      onPresosMtT(c.id_type_tanah.value, false, 'm');

      onPresospH(cariValue("pH"), "m");

      if (MyDataFilterOBJ!.propertyLainnya["adaUkurPH"] == false) {
        hargaTotalpH = 0;
      } else {
        hargaTotalpH = double.tryParse(hargapH)! * (cariValue("KpH") * 1000);
      }

      hitung(c.indexsubMenuRawatan.value, "(bTPt/bTHa)*JPk",
          cariValue("vTPt").toString());
    } else {
      onPresospH(cariValue("pH"), "m");
      if (MyDataFilterOBJ!.propertyLainnya["adaUkurPH"] == false) {
        hargaTotalpH = 0;
      } else {
        hargaTotalpH = double.tryParse(hargapH)! * (cariValue("KpH") * 1000);
      }

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

    // datafilterMyData1![c.ObjectIndexSelectedEdit.value]
    //     .propertyLainnya["indexJb"] =
    // MyDataFilterOBJ!.propertyLainnya["indexJb"];
    //
    aDosis = Map.from(dataDosisfix(
        MyDataFilterOBJ!.propertyLainnya["tampungan"]["indexperusahaan"],
        filterCategorybyJenisPemupukan(MyDataFilterOBJ!
                .propertyLainnya["tampungan"]["indexperusahaan"])[
            MyDataFilterOBJ!.propertyLainnya["tampungan"]["indexjenisPupuk"]]));

    print(
        "dosis${dataDosisfix(MyDataFilterOBJ!.propertyLainnya["tampungan"]["indexperusahaan"], filterCategorybyJenisPemupukan(c.indexdropdownPrushn.value)[MyDataFilterOBJ!.propertyLainnya["tampungan"]["indexjenisPupuk"]])}");
  }

  MyData? MyDataFilterOBJ;
  List? dataPengeluaran;
  int? selectedPakan = 0;
  List dataPakanAlternatifLainnya = [];
  MyData? dataawal;
  bool isResetProtein = false;
  Map dataPakan = {};

  Map hasila3D = {};
  Map datavar3D = {"p": 0, "l": 0, "t": 0};
  String satuans3D = "m";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // indexObjectIndexSelectedEdit = c.ObjectIndexSelectedEdit.value;
    // print("field variabel + => INDEX${datafilterMyData1![c
    //     .ObjectIndexSelectedEdit.value].kategoriRumusKu[indexMediaLahan].valuess}");
    //

    // cariVarUpdate("LMt", false, 0.0, "", 0);
    // cariVarUpdate("LJt", false, 0.0, "", 0);

    dataTampungHasil = {};

    MyDataFilterOBJ = MyData.fromJson(json.decode(json.encode(
        MyData.toMap(datafilterMyData1![c.ObjectIndexSelectedEdit.value]))));
    dataawal = MyData.fromJson(
        json.decode(json.encode(MyData.toMap(datafilterMyData1!.last))));

    dataPakan = {
      'pakanUtamaPercentage': double.tryParse(MyDataFilterOBJ!
          .propertyLainnya["alternatifPakan"]["Persentase Pakan Pabrik %"]!
          .toString())!,
      'pakanAlternatif1Percentage': (100 -
          (double.tryParse(MyDataFilterOBJ!.propertyLainnya["alternatifPakan"]
                          ["Persentase Pakan Pabrik %"]
                      .toString())!
                  .round() +
              double.tryParse(MyDataFilterOBJ!
                      .propertyLainnya["tambah pakan alternatif"][selectedPakan]
                          ["persen pemberian %"]
                      .toString())!
                  .round())),
      'pakanAlternatif2Percentage':
          (MyDataFilterOBJ!.propertyLainnya["tambah pakan alternatif"]
              [selectedPakan]["persen pemberian %"]!),
      'proteinPakanUtama': MyDataFilterOBJ!.propertyLainnya["alternatifPakan"]
          ["Protein Pakan Pabrik %"]!,
      'proteinPakanAlternatif1': MyDataFilterOBJ!
          .propertyLainnya["alternatifPakan"]["Protein Maggot %"],
      'proteinPakanAlternatif2':
          MyDataFilterOBJ!.propertyLainnya["tambah pakan alternatif"]
              [selectedPakan]["protein %"],
      'kebutuhanProtein': MyDataFilterOBJ!.propertyLainnya["alternatifPakan"]
          ["Kebutuhan Protein Ikan %"],
      'indexAlternatif2': double.tryParse(selectedPakan.toString())!,
      "isPakanAlternatif1Enabled":
          MyDataFilterOBJ!.propertyLainnya["adaPakanAlternatif"],
      "isPakanAlternatif2Enabled":
          MyDataFilterOBJ!.propertyLainnya["adaPakanAlternatifLainnya"]
    };

    copiedData = MyDataFilterOBJ!;

    // copiedData = MyData.fromJson(dataMap);
    dataPengeluaran =
        List.from(copiedData!.propertyLainnya["keperluanLainnya"]);
    dataPakanAlternatifLainnya = MyDataFilterOBJ!
        .propertyLainnya["tambah pakan alternatif"]
        .map((e) => "${e['nama']} = ${e['protein %']}% Protein")
        .toList();
    _isCheckedNilaiR =
        MyDataFilterOBJ!.propertyLainnya["Edit Nilai Rekomendasi"];

    dates = filterCategorybyPerusahaan();

    datavar3D = MyDataFilterOBJ!.propertyLainnya["luasMedia3D"];

    satuans3D = MyDataFilterOBJ!.propertyLainnya["satuanMediaLahan3D"];

    if (c.selectedItemCalcT.value != 2) {
      if (MyDataFilterOBJ!.kategoriRumusKu
          .where((element) => element.nama == "Balok")
          .isEmpty) {
        // datafilterMyData1![c.ObjectIndexSelectedEdit.value].kategoriRumusKu.add(dataKategoriRumus1.where((element) => element.id_MenuRawatan==c.indexMenuRawatan.value && element.idMediaTanam == 0).toList().where((element) => element.nama == "Persegi Panjang").toList().first!);
        // MyDataFilterOBJ! = dataKategoriRumus1.where((element) => element.id_MenuRawatan==c.indexMenuRawatan.value && element.idMediaTanam == 0).toList().where((element) => element.nama == "Persegi Panjang").toList().first;
        MyDataFilterOBJ!.kategoriRumusKu = List<KategoriRumus>.from([
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
            .where((element) => (c.indexMenuRawatan.value == 3 ||
                    c.indexMenuRawatan.value == 4 ||
                    c.indexMenuRawatan.value == 5)
                ? element.id_MenuRawatan == 1 && element.idMediaTanam == 1
                : element.id_MenuRawatan == c.indexMenuRawatan.value &&
                    element.idMediaTanam == 0)
            .toList();
      } else {}
    }

    onPresospH(
        (MyDataFilterOBJ!.propertyLainnya["pHData"]["hasil"] == null)
            ? 0
            : cariValue("pH"),
        'm');

    indexMediaLahan =
        MyDataFilterOBJ!.propertyLainnya["tampungan"]["indexBentukMediaTanam"];

    print(
        "satuanaw $indexMediaLahan ${MyDataFilterOBJ!.propertyLainnya["tampungan"]["indexBentukMediaTanam"]}");
    // MyDataFilterOBJ!.propertyLainnya["tampungan"]["indexBentukMediaTanam"] =
    // MyDataFilterOBJ!
    //         .propertyLainnya["tampungan"]["indexBentukMediaTanam"];
    // indexMediaLahan = 0;

    // MyDataFilterOBJ!.propertyLainnya["satuanMediaLahan"][1] =
    //     datafilterMyData1![c.ObjectIndexSelectedEdit.value]
    //         .propertyLainnya["satuanMediaLahan"][1];
    //
    // MyDataFilterOBJ!.propertyLainnya["satuanMediaLahan"][0] =
    //     datafilterMyData1![c.ObjectIndexSelectedEdit.value]
    //         .propertyLainnya["satuanMediaLahan"][0];

    print("data dosis ${MyDataFilterOBJ!.varii.map((e) => e.dataDosis)}");

    for (var data in MyDataFilterOBJ!.varii.map((e) => e.dataDosis)) {
      data.forEach((key, value) {
        hagaDosis[key] = "0";
      });
    }

    // hagaDosis.forEach((key, value) {
    //   hagaDosis[key] =
    //       dataProductsObj.where((element) => element.nama == key).first.harga;
    // });

    // // datakategorirum = List<KategoriRumus>.of(MyDataFilterOBJ!.kategoriRumusKu);
    //
    //
    // print("field variabel + => INDEX ${datafilterMyData1![c
    //     .ObjectIndexSelectedEdit.value].kategoriRumusKu[indexMediaLahan].valuess}");
    // //
    // print("field variabel + => INDEX ${indexMediaLahan}");
    //
    // print("field variabel + => INDEX ${MyDataFilterOBJ!
    //     .kategoriRumusKu[indexMediaLahan].valuess}");
    //
    // print(
    //     "index => $indexMediaLahan ${MyDataFilterOBJ!
    //         .propertyLainnya["tampungan"]["indexBentukMediaTanam"]}");

    if (MyDataFilterOBJ!.propertyLainnya["pHData"].isEmpty) {
      MyDataFilterOBJ!.propertyLainnya["pHData"] = {
        "hasil": 0.0,
        "pHDitanya": 6.1,
        "pHDiket": 6.0
      };
      // indikatorpH["hasil"] = 0.0;s
    } else {
      listPHIndikator[0].variabels["pHDiket"][1] =
          MyDataFilterOBJ!.propertyLainnya["pHData"]["pHDiket"];
      listPHIndikator[0].variabels["pHDitanya"][1] =
          MyDataFilterOBJ!.propertyLainnya["pHData"]["pHDitanya"];
      // datainputan.value[2] = MyDataFilterOBJ!.propertyLainnya["pHData"]["hasil"];

      // MyDataFilterOBJ!.propertyLainnya["pHData"] =
      //     MyDataFilterOBJ!
      //         .propertyLainnya["pHData"];
    }

    if (MyDataFilterOBJ!.kategoriRumusKu[indexMediaLahan].valuess.isEmpty) {
      // print("field 12 12 => ${indexObjectIndexSelectedEdit} ${datafilterMyData1!
      //     .map((e) =>
      //     e.kategoriRumusKu.map((e) => e.valuess)).toList()}");

      MyDataFilterOBJ!.kategoriRumusKu[indexMediaLahan].valuess = variablesNew(
          MyDataFilterOBJ!.kategoriRumusKu[indexMediaLahan].rumus, 0);
      // datakategorirum[indexMediaLahan].fieldValue =
      //     myControlerssi(Map.of(datakategorirum[indexMediaLahan].valuess));
      // print(
      //     "field 12 12 54 => ${kategoriRumus[0]["value"]} ${FdatakategoryRumus(
      //         c.indexMenuRawatan.value,
      //         List<KategoriRumus>.of(dataKategoriRumus1),
      //         c.selectedItemCalcT.value).map((e) =>
      //     e.valuess)} ${datafilterMyData1!.map((e) =>
      //         e.kategoriRumusKu.map((e) => e.valuess)).toList()}");
      print(
          "field 12 12 13 => tidak  ${MyDataFilterOBJ!.kategoriRumusKu[indexMediaLahan].valuess}");
    } else if (MyDataFilterOBJ!
        .kategoriRumusKu[indexMediaLahan].valuess.isNotEmpty) {
      print(
          "field 12 12 13 => ada  ${MyDataFilterOBJ!.kategoriRumusKu[indexMediaLahan].valuess}");
    }

    c.id_type_tanah.value =
        MyDataFilterOBJ!.propertyLainnya["tampungan"]["indexJenisTanah"];

    // MyDataFilterOBJ!.propertyLainnya["tampungan"]["indexJenisTanah"] =
    //     datafilterMyData1![c.ObjectIndexSelectedEdit.value]
    //         .propertyLainnya["tampungan"]["indexJenisTanah"];

    c.indexdropdownPrushn.value =
        MyDataFilterOBJ!.propertyLainnya["tampungan"]["indexperusahaan"];

    // MyDataFilterOBJ!.propertyLainnya["tampungan"]["indexperusahaan"] =
    //     datafilterMyData1![c.ObjectIndexSelectedEdit.value]
    //         .propertyLainnya["tampungan"]["indexperusahaan"];

    // ==============================================
    //
    // print(
    //     "indexss ${c.indexdropdownjenisPemupukan.value} ${datafilterMyData1![c.ObjectIndexSelectedEdit.value].propertyLainnya["tampungan"]["indexjenisPupuk"]}");
    // MyDataFilterOBJ!.propertyLainnya["tampungan"]["indexjenisPupuk"] =
    //     datafilterMyData1![c.ObjectIndexSelectedEdit.value]
    //         .propertyLainnya["tampungan"]["indexjenisPupuk"];
    //
    // MyDataFilterOBJ!.propertyLainnya["ketebalanTanah"] =
    //     datafilterMyData1![c.ObjectIndexSelectedEdit.value]
    //         .propertyLainnya["ketebalanTanah"];
    //
    // MyDataFilterOBJ!.luas =
    //     datafilterMyData1![c.ObjectIndexSelectedEdit.value].luas;
    c.indexdropdownjenisPemupukan.value =
        MyDataFilterOBJ!.propertyLainnya["tampungan"]["indexjenisPupuk"];
    //
    // aDosis = Map.from(dataDosisfix(
    //     MyDataFilterOBJ!.propertyLainnya["tampungan"]["indexperusahaan"],
    //     filterCategorybyJenisPemupukan(
    //         MyDataFilterOBJ!.propertyLainnya["tampungan"]
    //             ["indexperusahaan"])[c.indexdropdownjenisPemupukan.value]));
    //
    // hargaDosis = Map.from(dataDosisfix(
    //     MyDataFilterOBJ!.propertyLainnya["tampungan"]["indexperusahaan"],
    //     filterCategorybyJenisPemupukan(
    //         MyDataFilterOBJ!.propertyLainnya["tampungan"]
    //             ["indexperusahaan"])[c.indexdropdownjenisPemupukan.value]));
    //
    //
    // hargaDosis.forEach((key, value) {
    //   hargaDosis[key] =
    //       dataProductsObj.where((element) => element.nama == key).first.harga;
    // });
    // print("fi4 => $hargaDosis}");

    hargapH = dataProductsObj
        .where((element) => element.nama == "dolomit")
        .first
        .harga;
    hargaMaggot = double.tryParse(dataProductsObj
        .where((element) => element.nama == "Maggot")
        .first
        .harga)!;

    dataVariabelbaterai = {
      "Survival Rate % (sr)": MyDataFilterOBJ!.propertyLainnya["sr%"],
      "bibit ikan/Kg": MyDataFilterOBJ!.propertyLainnya["massaBibitTotal(Gr)"],
      "Perkiraan Bobot per Ikan Panen (Gr)":
          MyDataFilterOBJ!.propertyLainnya["perkiraanPanenBobotLele(Gr)"],
      // rasio jumlah pakan yang dibutuhkan untuk menghasilkan 1 kg
      "FCR": MyDataFilterOBJ!.propertyLainnya["fcr"],
      "Jenis Ikan": MyDataFilterOBJ!.propertyLainnya["indexJb"],
      "Harga Pasar Ikan/Kg": MyDataFilterOBJ!.propertyLainnya["ketebalanTanah"],
    };

    myControlerssoBatraiPlus =
        myControl(MyDataFilterOBJ!.propertyLainnya["alternatifPakan"]);
    fieldoBateraiPlus = fieldso(
        _isCheckedNilaiR,
        MyDataFilterOBJ!.propertyLainnya["alternatifPakan"],
        myControlerssoBatraiPlus);

    myControlerssoBatrai = myControl(dataVariabelbaterai);
    fieldoBaterai = fieldso(true, dataVariabelbaterai, myControlerssoBatrai);

    if (MyDataFilterOBJ!.luas == "") {
      MyDataFilterOBJ!.luas = "0";
    }

    hargaperKgPabrik = double.tryParse(MyDataFilterOBJ!
        .propertyLainnya["hargaPerBanyakSatuan"]["hasilrp"]
        .toString())!;

    onPresoqw();
    // MyDataFilterOBJ!.propertyLainnya["indexJb"] = int.tryParse(
    //     datafilterMyData1![c.ObjectIndexSelectedEdit.value]
    //         .propertyLainnya["indexJb"]
    //         .toString())!;
    indexJb = MyDataFilterOBJ!.propertyLainnya["indexJb"];
  }

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
        title: data.keys.toList()[index].toString(),
        tema: Colors.green,
        onStateChange: (valu) {
          String values = valu;
          if (valu.isEmpty) {
            valu = "0";
          }

          onPresoqw();
        },
        inputType: (index == 0)
            ? TextInputType.text
            : TextInputType.numberWithOptions(decimal: true),
        enable: totalDaya,
      );
    });

    return fieldsss;
  }

  void onPresoqw() {
    setState(() {
      // Map data = dataVariabel;
      Map dataB = dataVariabelbaterai;
      // changeSatuan(satuanm,  dataVariabel);
      // print("datanya ${data}");

      myControlerssoBatraiPlus.asMap().forEach((index, element) {
        MyDataFilterOBJ!.propertyLainnya["alternatifPakan"][MyDataFilterOBJ!
            .propertyLainnya["alternatifPakan"].keys
            .toList()[index]] = (element.text.isEmpty) ? "0" : element.text;

        myControlerssoBatraiPlus =
            myControl(MyDataFilterOBJ!.propertyLainnya["alternatifPakan"]);
        fieldoBateraiPlus = fieldso(
            _isCheckedNilaiR,
            MyDataFilterOBJ!.propertyLainnya["alternatifPakan"],
            myControlerssoBatraiPlus);

        // MyDataFilterOBJ!.propertyLainnya["alternatifPakan"] =
        //     dataVariabelbateraiPlus["alternatifPakan"];
        // MyDataFilterOBJListrik!.propertyLainnya = dataVariabelbaterai;
      });

      // myControlersso1.asMap().forEach((index, element) {
      //   print("lolo ${data[data.keys.toList()[index]]}");
      //   data[data.keys.toList()[index]] =
      //   (element.text.isEmpty) ? "0" : element.text;
      //
      //   // dataKategoriInisialisasi[dataKategoriInisialisasi
      //   //     .where((element) => element.vari == data.keys.toList()[index])
      //   //     .first
      //   //     .id]
      //   //     .nilai = double.tryParse((element.text.isEmpty)?"0":element.text)!;
      //
      //   // if (MyDataFilterOBJListrik!
      //   //     .propertyLainnya["keperluanLainnya"][indexFixs][data[data.keys.toList()[index]]].runtimeType != String ){
      //   //   MyDataFilterOBJListrik!
      //   //       .propertyLainnya["keperluanLainnya"][indexFixs][data[data.keys.toList()[index]]] = (element.text.isEmpty)?"0":element.text;
      //   //
      //   //
      //   //
      //   //
      //   //
      //   //   MyDataFilterOBJListrik!.propertyLainnya["keperluanLainnya"][indexFixs]["Watt Hours"] = double.parse(data["Daya (watt)"].toString())*double.parse(data["Total Nyala (jam)"].toString());
      //
      //   data["Watt Hours"] = double.parse(data["Daya (watt)"].toString()) *
      //       double.parse(data["Total Nyala (jam)"].toString());
      //
      //   myControlersso1 = myControl(data);
      //   fieldo = fieldso(false, data, myControlersso1);
      //   dataVariabel = data;
      //   // };
      //   MyDataFilterOBJListrik!.propertyLainnya["keperluanLainnya"][indesxs] =
      //       dataVariabel.cast<String, Object>();
      //   print(
      //       "Print ${MyDataFilterOBJListrik!.propertyLainnya["keperluanLainnya"][indesxs]["Daya (watt)"]}");
      // });

      // TotalDayaJam =
      //     List.of(MyDataFilterOBJListrik!.propertyLainnya["keperluanLainnya"])
      //         .map((e) => e["Watt Hours"])
      //         .toList()
      //         .reduce((value, element) => value + element);

      myControlerssoBatrai.asMap().forEach((index, element) {
        dataB[dataB.keys.toList()[index]] =
            (element.text.isEmpty) ? "0" : element.text;

        // TotalDayaJam =
        //     List.of(MyDataFilterOBJListrik!.propertyLainnya["keperluanLainnya"])
        //         .map((e) => e["Watt Hours"])
        //         .toList()
        //         .reduce((value, element) => value + element);
        //
        // TotalKebutuhanInverter = TotalDayaJam +
        //     (TotalDayaJam *
        //         ((100 - inverter[inverter.keys.toList()[indexinverter]][0]) /
        //             100));
        // TotalKebutuhanBaterai = TotalKebutuhanInverter /
        //     (double.parse(MyDataFilterOBJListrik!
        //         .propertyLainnya["ketebalanTanah"]
        //         .toString()) *
        //         double.parse(MyDataFilterOBJListrik!
        //             .propertyLainnya["aHBaterai"]
        //             .toString()));
        //
        // JenisBatteray[JenisBatteray.keys.toList()[indexJb]][1] =
        //     TotalKebutuhanBaterai *
        //         JenisBatteray[JenisBatteray.keys.toList()[indexJb]][0];

        myControlerssoBatrai = myControl(dataB);
        fieldoBaterai = fieldso(true, dataB, myControlerssoBatrai);
        dataVariabelbaterai = dataB;
        // MyDataFilterOBJListrik!.propertyLainnya = dataVariabelbaterai;

        MyDataFilterOBJ!.propertyLainnya["sr%"] =
            dataVariabelbaterai["Survival Rate % (sr)"];
        MyDataFilterOBJ!.propertyLainnya["massaBibitTotal(Gr)"] =
            dataVariabelbaterai["bibit ikan/Kg"];
        MyDataFilterOBJ!.propertyLainnya["perkiraanPanenBobotLele(Gr)"] =
            dataVariabelbaterai["Perkiraan Bobot per Ikan Panen (Gr)"];
        MyDataFilterOBJ!.propertyLainnya["fcr"] = dataVariabelbaterai["FCR"];
        MyDataFilterOBJ!.propertyLainnya["ketebalanTanah"] =
            dataVariabelbaterai["Harga Pasar Ikan/Kg"];
        // MyDataFilterOBJ!.propertyLainnya["indexJb"] =
        //     dataVariabelbaterai["Jenis Ikan"];
      });

      // TotalKebutuhanSCC = TotalDayaJam +
      //     (TotalDayaJam * ((100 - scc[scc.keys.toList()[indexscc]][0]) / 100));
      // TotalKebutuhanPanel = TotalKebutuhanSCC /
      //     (double.parse(MyDataFilterOBJ!.propertyLainnya["jamMatahari"]
      //         .toString()) *
      //         double.parse(MyDataFilterOBJ!.propertyLainnya["DayaPanel"]
      //             .toString()));
    });
  }

  @override
  Widget build(contexty) {
    banyakIkan = (1000 * double.tryParse(MyDataFilterOBJ!.luas)!) /
        JenisBatteray.values.toList()[indexJb][0];
    print("banyak ikan $banyakIkan");
    banyakIkanSisa =
        (double.tryParse(MyDataFilterOBJ!.propertyLainnya["sr%"])! *
            banyakIkan /
            100);
    beratIkanSisaAwal = (banyakIkanSisa /
        (double.tryParse(
                MyDataFilterOBJ!.propertyLainnya["massaBibitTotal(Gr)"]) ??
            1));

    beratIkanSisaAkhir = banyakIkanSisa *
        (double.tryParse(
            MyDataFilterOBJ!.propertyLainnya["perkiraanPanenBobotLele(Gr)"])!) /
        1000;
    beratPakan = (beratIkanSisaAkhir - beratIkanSisaAwal) *
        (double.tryParse(MyDataFilterOBJ!.propertyLainnya["fcr"]))!;

/////aturPakan

    List<Map<String, dynamic>> periode =
        JenisBatteray.values.toList()[indexJb][1];
    List<Map<String, dynamic>> generateAgenda(
        List<Map<String, dynamic>> periode, double bobotPakan) {
      List<Map<String, dynamic>> agendaNila = [];
      int minggu = 1; // Mulai dari minggu 1

      for (var p in periode) {
        int presentase = p['presentase'];
        int interval = p['interval'];
        int jmlHari2 = 6;
        double pakanPerHari =
            (((bobotPakan * presentase) / 100) / interval) / jmlHari2;

        for (int i = 0; i < interval; i++) {
          String agenda = '';
          String presentaseText =
              'Periode ${p['periode']} - ${p['presentase']}%';

          if (p['agenda'] == 'Awal Tebar' && i == 0) {
            agenda = p['agenda'];
          } else if (p['agenda'] == 'Sortir' && i == (interval ~/ 2)) {
            agenda = p['agenda'];
          } else if (p['agenda'] == 'Panen' && i == (interval - 1)) {
            agenda = p['agenda'];
          }

          agendaNila.add({
            'agenda': agenda,
            'minggu': minggu,
            'jmlHari': 7,
            'presentase': presentaseText,
            'jmlHari2': jmlHari2,
            'pakanPerHari': pakanPerHari,
            'opsi2x': pakanPerHari / 2,
            'opsi3x': pakanPerHari / 3,
            'totalPakan': pakanPerHari * jmlHari2
          });
          minggu++;
        }
      }

      return agendaNila;
    }

    List<Map<String, dynamic>> agendaNila = generateAgenda(periode, beratPakan);

    double hargapabrikPerkg = double.tryParse(MyDataFilterOBJ!
        .propertyLainnya["keperluanLainnya"][2]["Beban Biaya"])!;
    double hargapakanPabrikFull =
        ((perkirranPakanBanyakAyam) / 1000 * hargapabrikPerkg);

    TotalhargaperKgPabrik = hargaperKgPabrik *
        (double.tryParse(MyDataFilterOBJ!.propertyLainnya["alternatifPakan"]
                        ["Persentase Pakan Pabrik %"]!
                    .toString())!
                .round() /
            100) *
        beratPakan;
    TotalhargaperKgMaggot = hargaperKgMaggot *
        (((100 -
                    (double.tryParse(MyDataFilterOBJ!
                                .propertyLainnya["alternatifPakan"]
                                    ["Persentase Pakan Pabrik %"]
                                .toString())!
                            .round() +
                        double.tryParse(MyDataFilterOBJ!
                                .propertyLainnya["tambah pakan alternatif"]
                                    [selectedPakan]["persen pemberian %"]
                                .toString())!
                            .round())) /
                100) *
            beratPakan);

    TotalhargaperKgPaku = hargaperKgPaku *
        (MyDataFilterOBJ!.propertyLainnya["tambah pakan alternatif"]
                    [selectedPakan]["persen pemberian %"]!
                .round() /
            100) *
        beratPakan;

    MyDataFilterOBJ!.propertyLainnya["keperluanLainnya"][2]["Beban Biaya"] =
        (TotalhargaperKgPabrik + TotalhargaperKgMaggot + TotalhargaperKgPaku)
            .toStringAsFixed(0);

    dataTampungHasil["Volume kolam yang tersedia"] =
        "${MyDataFilterOBJ!.luas} m²";
    // dataTampungHasil["Umur mulai pemeliharaan (Minggu)"] = MyDataFilterOBJ!.propertyLainnya["umur"];
    // dataTampungHasil["Umur Panen (Minggu)"] = MyDataFilterOBJ!.propertyLainnya["umurMati"];
    dataTampungHasil["Jenis Ikan"] = JenisBatteray.keys.toList()[indexJb];
    dataTampungHasil["Bibit ikan/Kg : "] =
        MyDataFilterOBJ!.propertyLainnya["massaBibitTotal(Gr)"];
    dataTampungHasil["Perkiraan Bobot per Ikan Panen (Gr)"] =
        MyDataFilterOBJ!.propertyLainnya["perkiraanPanenBobotLele(Gr)"];
    dataTampungHasil["Total Banyak Ikan"] = banyakIkan;
    dataTampungHasil["Survival Rate % (sr)"] =
        MyDataFilterOBJ!.propertyLainnya["sr%"];

    dataTampungHasil["FCR (Perbandingan pakan dan hasil panen)"] =
        "${MyDataFilterOBJ!.propertyLainnya["fcr"]}%";
    dataTampungHasil["Harga Pasar Ikan/Kg"] =
        "Rp.${MyDataFilterOBJ!.propertyLainnya["ketebalanTanah"]}";

    dataTampungHasil["Total pengeluaran pakan : "] = "Rp.${hitungTotalBiaya()}";

    dataTampungHasil["Omset"] =
        "Rp.${formatRupiah(((beratIkanSisaAkhir) * double.tryParse(MyDataFilterOBJ!.propertyLainnya["ketebalanTanah"])!).toString())}";
    dataTampungHasil["Untung dari pengeluaran Pakan"] =
        "Rp.${MyDataFilterOBJ!.propertyLainnya["adaPakanAlternatif"] == true ? formatRupiah((beratIkanSisaAkhir * double.tryParse(MyDataFilterOBJ!.propertyLainnya["ketebalanTanah"])! - double.tryParse(MyDataFilterOBJ!.propertyLainnya["keperluanLainnya"][2]["Beban Biaya"].toString())! * beratPakan.round()).toString()) : formatRupiah((beratIkanSisaAkhir * double.tryParse(MyDataFilterOBJ!.propertyLainnya["ketebalanTanah"])! - double.tryParse(MyDataFilterOBJ!.propertyLainnya["keperluanLainnya"][2]["Beban Biaya"].toString())! * beratPakan.round()).toString())}";
    dataTampungHasil["Penjelas Pakan untuk ikan"] = {
      '% pakan pabrik': double.tryParse(MyDataFilterOBJ!
          .propertyLainnya["alternatifPakan"]["Persentase Pakan Pabrik %"]!
          .toString())!,
      '% pakan maggot': (100 -
          (double.tryParse(MyDataFilterOBJ!.propertyLainnya["alternatifPakan"]
                          ["Persentase Pakan Pabrik %"]
                      .toString())!
                  .round() +
              double.tryParse(MyDataFilterOBJ!
                      .propertyLainnya["tambah pakan alternatif"][selectedPakan]
                          ["persen pemberian %"]
                      .toString())!
                  .round())),
      '% pakan tanaman paku air':
          (MyDataFilterOBJ!.propertyLainnya["tambah pakan alternatif"]
              [selectedPakan]["persen pemberian %"]!),
      'Protein pakan pabrik': MyDataFilterOBJ!
          .propertyLainnya["alternatifPakan"]["Protein Pakan Pabrik %"]!,
      'Protein pakan maggot': MyDataFilterOBJ!
          .propertyLainnya["alternatifPakan"]["Protein Maggot %"],
      'Protein pakan tanaman paku air':
          MyDataFilterOBJ!.propertyLainnya["tambah pakan alternatif"]
              [selectedPakan]["protein %"],
      'kebutuhan protein ikan': MyDataFilterOBJ!
          .propertyLainnya["alternatifPakan"]["Kebutuhan Protein Ikan %"],
    };

    return widget.info == false
        ? SingleChildScrollView(
            controller: _parentScrollController,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: defaultPadding / 2),
              child: Obx(() {
                // a();
                return Column(children: [
                  cardWithImg(
                      "Penjelasan penggunaan Kalkulator: ",
                      18,
                      Container(
                        child: Container(
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
                                Padding(
                                  padding: EdgeInsets.all(
                                    heightfit(defaultPadding),
                                  ),
                                  child: Column(
                                    children: [
                                      Column(
                                        children: List.generate(
                                            List.of(filtersdata[c
                                                        .selectedItemCalcT
                                                        .value]
                                                    .studiKasus)
                                                .map((e) => e.values)
                                                .toList()
                                                .length, (index) {
                                          return Column(
                                            children: [
                                              RichText(
                                                  text: TextSpan(children: [
                                                TextSpan(
                                                  text:
                                                      "${index + 1}. ${List.of(filtersdata[c.selectedItemCalcT.value].studiKasus).map((e) => e.values).toList()[index].first["studi kasus"]}\n",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: kTextColor,
                                                    fontSize: heightfit(sT16),
                                                  ),
                                                ),
                                                TextSpan(
                                                  text:
                                                      "- ${List.of(filtersdata[c.selectedItemCalcT.value].studiKasus).map((e) => e.values).toList()[index].first["penjelas"]}",
                                                  style: TextStyle(
                                                    fontStyle: FontStyle.italic,
                                                    color: kTextColor,
                                                    fontSize: heightfit(sT14),
                                                  ),
                                                ),
                                              ])),
                                              Padding(
                                                padding: EdgeInsets.all(
                                                    defaultPadding / 2),
                                                child: Container(
                                                  padding: EdgeInsets.all(
                                                      defaultPadding / 2),
                                                  decoration: BoxDecoration(
                                                    color: warnas(List.of(
                                                            filtersdata[c
                                                                    .selectedItemCalcT
                                                                    .value]
                                                                .studiKasus)
                                                        .map((e) => e.values)
                                                        .toList()[index]
                                                        .first["warna"]),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  ),
                                                  child: Center(
                                                      child: Text(
                                                    "Proses ${index + 1}",
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.white,
                                                      fontSize: heightfit(sT16),
                                                    ),
                                                  )),
                                                ),
                                              )
                                            ],
                                          );
                                        }),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            )),
                      )),
                  SizedBox(
                    height: defaultPadding / 2,
                  ),
                  imageCostum("assets/images/MenuRawatan/RawatTanam/kolam.jpg"),
                  SizedBox(
                    height: defaultPadding / 2,
                  ),
                  SizedBox(
                    height: heightfit(110),
                    child: FittedBox(
                      child: SizedBox(
                        height: 110,
                        width: 110,
                        child: ItemPot(
                          tema: warnas(
                              dataKategoriMenuRawatan[c.indexMenuRawatan.value]
                                  .colorku[0]),
                          img: addPrefixToFileName(
                              dataKategoriRumus
                                  .where((element) =>
                                      element.nama ==
                                      MyDataFilterOBJ!.kategoriRumusKu
                                          .toList()[int.parse(MyDataFilterOBJ!
                                              .propertyLainnya["tampungan"]
                                                  ["indexBentukMediaTanam"]
                                              .toString())]
                                          .nama)
                                  .first
                                  .img,
                              "kolam_"),
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
                  CalculationWidget(
                    onChange: (Map<String, dynamic> hasil) {
                      print(hasil);

                      Future.microtask(() {
                        setState(() {});
                      });

                      hasila3D = hasil;

                      datavar3D = hasila3D['Variabel'];
                      MyDataFilterOBJ!.propertyLainnya["luasMedia3D"] =
                          datavar3D;

                      MyDataFilterOBJ!.propertyLainnya["satuanMediaLahan3D"] =
                          hasila3D['satuan'];
                      satuans3D = hasila3D['satuan'];

                      indexMediaLahan = hasila3D['Index Bidang'];
                      MyDataFilterOBJ!.propertyLainnya["tampungan"]
                          ["indexBentukMediaTanam"] = indexMediaLahan;
                      print("satuanawA $indexMediaLahan $datavar3D");
                      MyDataFilterOBJ!.propertyLainnya["Hasilluas3D"] =
                          hasila3D['Hasil'].toString();

                      MyDataFilterOBJ!.luas = hasila3D['Hasil'].toString();

                      hitunglocal();
                    },
                    mediaIndex: 1,
                    warna: warnas(
                        dataKategoriMenuRawatan[c.indexMenuRawatan.value]
                            .colorku[0]),
                    datass: datavar3D,
                    indexbidang: indexMediaLahan,
                    judul: 'Ukuran Pot',
                    satuan: satuans3D,
                    dinamis: true,
                    hasil: double.tryParse(MyDataFilterOBJ!
                        .propertyLainnya["Hasilluas3D"]
                        .toString())!,
                  ),

                  // ProsesWidgets(
                  //   juduls: "Luasan lahan ",
                  //   tema: warnas(
                  //       dataKategoriMenuRawatan[c.indexMenuRawatan.value].colorku[0]),
                  //   namaobj: "Type Lahan",
                  //   idTipeMediaTanam: 1,
                  //   rumus: "",
                  //   dropdowns: (c.selectedItemCalcT.value == 2) ? false : true,
                  //   datakatRumus: MyDataFilterOBJ!.kategoriRumusKu.toList(),
                  //   onChangeState: (indexs, indpot, satuan, datavarmedia, hasilLuas) {
                  //     Future.microtask(() {
                  //       setState(() {
                  //         // widget.onChangeState(datafilterMyData1![c
                  //         //     .ObjectIndexSelectedEdit
                  //         //     .value].hasilTotal);
                  //
                  //         print(
                  //             "hasil luasnya : ${MyDataFilterOBJ!.kategoriRumusKu.toList()[int.parse(MyDataFilterOBJ!.propertyLainnya["tampungan"]["indexBentukMediaTanam"].toString())].nama}");
                  //
                  //         MyDataFilterOBJ!.luas = hasilLuas;
                  //         MyDataFilterOBJ!.propertyLainnya["tampungan"]
                  //             ["indexBentukMediaTanam"] = indpot;
                  //       });
                  //     });
                  //
                  //     indexMediaLahan = indpot;
                  //     MyDataFilterOBJ!.propertyLainnya["satuanMediaLahan"][0] =
                  //         satuan;
                  //
                  //     hitunglocal();
                  //   },
                  //   indexmenu: c.indexMenuRawatan.value,
                  //   indexsubmenu: c.indexsubMenuRawatan.value,
                  //   idBentukMediaTanam: MyDataFilterOBJ!.propertyLainnya["tampungan"]
                  //       ["indexBentukMediaTanam"],
                  //   satuan: MyDataFilterOBJ!.propertyLainnya["satuanMediaLahan"][0],
                  //   warna: warnas("e69138"),
                  // ),
                  Containe(0, true),

                  Container(
                    child: Container(
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
                                          color: Colors.green.withOpacity(.3))
                                    ]),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(
                                heightfit(defaultPadding),
                              ),
                              child: Column(
                                children: [
                                  Column(
                                    children: [
                                      SizedBox(
                                        height: defaultPadding,
                                      ),
                                      DropDowns(
                                        (newActivity) {
                                          Future.microtask(() {
                                            setState(() {});
                                          });

                                          indexJb = JenisBatteray.keys
                                              .toList()
                                              .indexOf(newActivity);
                                          MyDataFilterOBJ!
                                                  .propertyLainnya["indexJb"] =
                                              indexJb;

                                          onPresoqw();
                                          // hitunglocal();
                                        },
                                        Colors.green,
                                        JenisBatteray.keys.toList(),
                                        JenisBatteray.keys.toList()[indexJb],
                                        JenisBatteray.keys.toList()[indexJb],
                                        "Jenis Ikan: ",
                                        const [],
                                      ),
                                      SizedBox(
                                        height: defaultPadding,
                                      ),
                                      cardWithImg(
                                          " ${banyakIkan.round()} ikan",
                                          40,
                                          Container(
                                            child: Text(
                                              "- Rekomendasi banyak ikan ${banyakIkan.round()}",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                                fontSize: heightfit(sT16),
                                              ),
                                            ),
                                          )),
                                      fieldoBaterai[0],
                                      RichText(
                                          text: TextSpan(children: [
                                        TextSpan(
                                          text:
                                              "Sisa Ikan yang masih hidup Berdasarkan Survival Rate (%) \n",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: kTextColor,
                                            fontSize: heightfit(sT16),
                                          ),
                                        ),
                                        TextSpan(
                                          text:
                                              "Contoh Perhitungannya jika awal bibit ikan ditebar adalah 1000 dan Survival Rate 95% maka ikan yang masih hidup adalah (1000*95/100 = 950 Ikan yang masih bertahan hidup)",
                                          style: TextStyle(
                                            fontStyle: FontStyle.italic,
                                            color: kTextColor,
                                            fontSize: heightfit(sT14),
                                          ),
                                        ),
                                      ])),
                                      Padding(
                                        padding: EdgeInsets.all(defaultPadding),
                                        child: Container(
                                          padding:
                                              EdgeInsets.all(defaultPadding),
                                          decoration: BoxDecoration(
                                            color: warnas(List.of(filtersdata[c
                                                        .selectedItemCalcT
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
                                            "${banyakIkanSisa.round()} Ikan Hidup",
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
                                  Containe(1, true)
                                ],
                              ),
                            ),
                          ],
                        )),
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
                              text: "Awal Tebar Ikan \n",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: kTextColor,
                                fontSize: heightfit(sT26),
                              ),
                            ),
                            TextSpan(
                              text:
                                  "Perkiraan Bobot sesuai dengan ukuran ikan \n",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: kTextColor,
                                fontSize: heightfit(sT16),
                              ),
                            ),
                            TextSpan(
                              text: "\n   9-12 cm = 30 Ekor/Kg \n"
                                  "   7-9 cm = 40 Ekor/Kg \n"
                                  "   5-7 cm = 60 Ekor/Kg \n "
                                  "   3-5 cm = 100 Ekor/Kg \n",
                              style: TextStyle(
                                fontStyle: FontStyle.italic,
                                color: kTextColor,
                                fontSize: heightfit(sT14),
                              ),
                            ),
                          ])),
                          fieldoBaterai[1],
                          Container(
                            child: Container(
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
                                                bottomRight:
                                                    Radius.circular(20),
                                                topLeft: Radius.circular(90),
                                                topRight: Radius.circular(0)),
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
                                        heightfit(defaultPadding),
                                      ),
                                      child: Column(
                                        children: [
                                          Column(
                                            children: [
                                              RichText(
                                                  text: TextSpan(children: [
                                                TextSpan(
                                                  text:
                                                      "Berat total bibit ikan sebanyak sisa ikan yang masih hidup :  \n",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: kTextColor,
                                                    fontSize: heightfit(sT16),
                                                  ),
                                                ),
                                                TextSpan(
                                                  text:
                                                      "Dari berat total ikan sebanyak ${banyakIkanSisa.round()} maka beratnya ${beratIkanSisaAwal.round().toStringAsFixed(2)} Kg",
                                                  style: TextStyle(
                                                    fontStyle: FontStyle.italic,
                                                    color: kTextColor,
                                                    fontSize: heightfit(sT14),
                                                  ),
                                                ),
                                              ])),
                                              Padding(
                                                padding: EdgeInsets.all(
                                                    defaultPadding / 2),
                                                child: Container(
                                                  padding: EdgeInsets.all(
                                                      defaultPadding / 2),
                                                  decoration: BoxDecoration(
                                                    color: warnas(List.of(
                                                            filtersdata[c
                                                                    .selectedItemCalcT
                                                                    .value]
                                                                .studiKasus)
                                                        .map((e) => e.values)
                                                        .toList()[0]
                                                        .first["warna"]),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  ),
                                                  child: Center(
                                                      child: Text(
                                                    "${beratIkanSisaAwal.toStringAsFixed(2)} Kg Total Berat bibit Ikan",
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.white,
                                                      fontSize: heightfit(sT16),
                                                    ),
                                                  )),
                                                ),
                                              ),
                                              cardWithImg(
                                                  "Perkiraan pakan per-harinya bibit ikan seberat ${beratIkanSisaAwal.toStringAsFixed(2)} Kg Di Awal tebar selama 2 Minggu beri pakan sebanyak :",
                                                  20,
                                                  Container(
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceAround,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        for (int e = 1;
                                                            e <= 4;
                                                            e++)
                                                          Column(
                                                            children: [
                                                              Text(
                                                                "- ${e + 1}% : ${(beratIkanSisaAwal * (e + 1) / 100).toStringAsFixed(2)} Kg",
                                                                style:
                                                                    TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize:
                                                                      heightfit(
                                                                          24),
                                                                ),
                                                              ),
                                                              Text(
                                                                  "(ikan ukuran ${3 + e}-${6 + e})",
                                                                  style:
                                                                      TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        heightfit(
                                                                            18),
                                                                  )),
                                                              SizedBox(
                                                                height:
                                                                    defaultPadding,
                                                              ),
                                                            ],
                                                          ),
                                                        Text(
                                                          "Perkiraan pakan yang perlu disiapkan per-harinya  ",
                                                          style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Colors.white,
                                                            fontSize:
                                                                heightfit(sT16),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ))
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                )),
                          ),
                        ],
                      ),
                    ),
                  ),
                  cardWithImg(
                      "Metode Terbalik",
                      30,
                      Container(
                        child: Column(
                          children: [
                            Text(
                              "Metode yang dihitung dengan terbalik dengan menetapkan Perkiraan berapa Kg pakan yang harus Disiapkan untuk ${banyakIkanSisa.round()} ikan",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: heightfit(sT16),
                              ),
                            ),
                          ],
                        ),
                      )),
                  SizedBox(
                    height: defaultPadding / 2,
                  ),
                  Padding(
                    padding: EdgeInsets.all(defaultPadding / 2),
                    child: imageCostum(
                        "assets/images/MenuRawatan/RawatTanam/pakan ikan.jpg"),
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
                              text: "Perkiraan Kebutuhan Pakan \n",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: kTextColor,
                                fontSize: heightfit(sT26),
                              ),
                            ),
                          ])),
                          RichText(
                              text: TextSpan(children: [
                            TextSpan(
                              text: "Perkiraan Hasil Panen \n",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: kTextColor,
                                fontSize: heightfit(sT20),
                              ),
                            ),
                            TextSpan(
                              text:
                                  "'Dalam perkiraan bobot ikan saat panen untuk Lele berkisar 150 gram jika Nila 300 gram (Sesuaikan dengan Perkiraan anda)'",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: kTextColor,
                                fontSize: heightfit(sT16),
                              ),
                            ),
                          ])),
                          SizedBox(
                            height: defaultPadding / 2,
                          ),
                          fieldoBaterai[2],
                          SizedBox(
                            height: defaultPadding / 2,
                          ),
                          Container(
                            child: Container(
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
                                                bottomRight:
                                                    Radius.circular(20),
                                                topLeft: Radius.circular(90),
                                                topRight: Radius.circular(0)),
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
                                        heightfit(defaultPadding),
                                      ),
                                      child: Column(
                                        children: [
                                          Column(
                                            children: [
                                              RichText(
                                                  text: TextSpan(children: [
                                                TextSpan(
                                                  text:
                                                      "Total Bobot Panen ${banyakIkanSisa.round()} ikan ",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: kTextColor,
                                                    fontSize: heightfit(sT20),
                                                  ),
                                                ),
                                              ])),
                                              cardWithImg(
                                                " ${beratIkanSisaAkhir.round()} Kg ",
                                                30,
                                                Container(
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceAround,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text("totol bobot ikan",
                                                          style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Colors.white,
                                                            fontSize:
                                                                heightfit(14),
                                                          )),
                                                      SizedBox(
                                                        height: defaultPadding,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                )),
                          ),
                          SizedBox(
                            height: defaultPadding,
                          ),
                          RichText(
                              text: TextSpan(children: [
                            TextSpan(
                              text: "FCR \n",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: kTextColor,
                                fontSize: heightfit(sT20),
                              ),
                            ),
                            TextSpan(
                              text:
                                  "'FCR (Feed Conversion Ratio) pada budidaya ikan adalah suatu ukuran yang menyatakan rasio jumlah pakan yang dibutuhkan untuk menghasilkan 1 kg'",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: kTextColor,
                                fontSize: heightfit(sT16),
                              ),
                            ),
                          ])),
                          fieldoBaterai[3],
                          SizedBox(
                            height: defaultPadding / 2,
                          ),
                          Container(
                            child: Container(
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
                                                bottomRight:
                                                    Radius.circular(20),
                                                topLeft: Radius.circular(90),
                                                topRight: Radius.circular(0)),
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
                                    cardWithImg(
                                      "FCR antara 1.2 sampai 1.5",
                                      30,
                                      Container(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                                "FCR normalnya petani tambak yang sudah berpengalaman",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white,
                                                  fontSize: heightfit(18),
                                                )),
                                            SizedBox(
                                              height: defaultPadding,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                )),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: defaultPadding,
                  ),

                  Column(
                    children: [
                      RichText(
                          text: TextSpan(children: [
                        TextSpan(
                          text:
                              "Di rumuskan seperti :\nFCR = Jumlah pakan (kg)/berat total ikan saat panen (kg)-total berat ikan pada awal tebar (kg)\n",
                          style: TextStyle(
                            fontStyle: FontStyle.normal,
                            color: kTextColor,
                            fontSize: heightfit(sT20),
                          ),
                        ),
                        TextSpan(
                          text:
                              "\n-Karena Jumlah Pakan (Kg) ini yang kita cari maka kita harus menetapkan sendiri nilai FCRnya biasanya berkisar 1.2 - 1.5. jika lebih dari > 1.5 maka pemberian pakan kita terlalu boros dan kurang baik.\n",
                          style: TextStyle(
                            fontStyle: FontStyle.italic,
                            color: kTextColor,
                            fontSize: heightfit(sT14),
                          ),
                        ),
                      ])),
                      RichText(
                          text: TextSpan(children: [
                        TextSpan(
                          text:
                              "Maka dapat dirumuskan :\nJumlah pakan (kg) = FCR*(berat total ikan saat panen (kg)-total berat ikan pada awal tebar) (kg)\n",
                          style: TextStyle(
                            fontStyle: FontStyle.normal,
                            color: kTextColor,
                            fontSize: heightfit(sT20),
                          ),
                        ),
                      ])),
                      Row(
                        children: [
                          Text(
                            'Reset :',
                            style: TextStyle(
                              fontStyle: FontStyle.normal,
                              color: kTextColor,
                              fontSize: heightfit(sT16),
                            ),
                          ),
                          Checkbox(
                            value: isResetProtein,
                            onChanged: (value) {
                              Future.microtask(() {
                                setState(() {
                                  // dataawal
                                  isResetProtein = value!;
                                  if (value == true) {
                                    dataPakan = {
                                      'pakanUtamaPercentage': double.tryParse(
                                          dataawal!.propertyLainnya[
                                                  "alternatifPakan"]
                                                  ["Persentase Pakan Pabrik %"]!
                                              .toString())!,
                                      'pakanAlternatif1Percentage': (100 -
                                          (double.tryParse(dataawal!
                                                      .propertyLainnya[
                                                          "alternatifPakan"][
                                                          "Persentase Pakan Pabrik %"]
                                                      .toString())!
                                                  .round() +
                                              double.tryParse(dataawal!
                                                      .propertyLainnya[
                                                          "tambah pakan alternatif"]
                                                          [selectedPakan]
                                                          ["persen pemberian %"]
                                                      .toString())!
                                                  .round())),
                                      'pakanAlternatif2Percentage':
                                          (dataawal!.propertyLainnya[
                                                      "tambah pakan alternatif"]
                                                  [selectedPakan]
                                              ["persen pemberian %"]!),
                                      'proteinPakanUtama':
                                          dataawal!.propertyLainnya[
                                                  "alternatifPakan"]
                                              ["Protein Pakan Pabrik %"]!,
                                      'proteinPakanAlternatif1':
                                          dataawal!.propertyLainnya[
                                                  "alternatifPakan"]
                                              ["Protein Maggot %"],
                                      'proteinPakanAlternatif2':
                                          dataawal!.propertyLainnya[
                                                  "tambah pakan alternatif"]
                                              [selectedPakan]["protein %"],
                                      'kebutuhanProtein':
                                          dataawal!.propertyLainnya[
                                                  "alternatifPakan"]
                                              ["Kebutuhan Protein Ikan %"],
                                      'indexAlternatif2': double.tryParse(
                                          selectedPakan.toString())!,
                                      "isPakanAlternatif1Enabled":
                                          dataawal!.propertyLainnya[
                                              "adaPakanAlternatif"],
                                      "isPakanAlternatif2Enabled":
                                          dataawal!.propertyLainnya[
                                              "adaPakanAlternatifLainnya"]
                                    };
                                  } else {
                                    dataPakan = {
                                      'pakanUtamaPercentage': double.tryParse(
                                          MyDataFilterOBJ!.propertyLainnya[
                                                  "alternatifPakan"]
                                                  ["Persentase Pakan Pabrik %"]!
                                              .toString())!,
                                      'pakanAlternatif1Percentage': (100 -
                                          (double.tryParse(MyDataFilterOBJ!
                                                      .propertyLainnya[
                                                          "alternatifPakan"][
                                                          "Persentase Pakan Pabrik %"]
                                                      .toString())!
                                                  .round() +
                                              double.tryParse(MyDataFilterOBJ!
                                                      .propertyLainnya[
                                                          "tambah pakan alternatif"]
                                                          [selectedPakan]
                                                          ["persen pemberian %"]
                                                      .toString())!
                                                  .round())),
                                      'pakanAlternatif2Percentage':
                                          (MyDataFilterOBJ!.propertyLainnya[
                                                      "tambah pakan alternatif"]
                                                  [selectedPakan]
                                              ["persen pemberian %"]!),
                                      'proteinPakanUtama':
                                          MyDataFilterOBJ!.propertyLainnya[
                                                  "alternatifPakan"]
                                              ["Protein Pakan Pabrik %"]!,
                                      'proteinPakanAlternatif1':
                                          MyDataFilterOBJ!.propertyLainnya[
                                                  "alternatifPakan"]
                                              ["Protein Maggot %"],
                                      'proteinPakanAlternatif2':
                                          MyDataFilterOBJ!.propertyLainnya[
                                                  "tambah pakan alternatif"]
                                              [selectedPakan]["protein %"],
                                      'kebutuhanProtein':
                                          MyDataFilterOBJ!.propertyLainnya[
                                                  "alternatifPakan"]
                                              ["Kebutuhan Protein Ikan %"],
                                      'indexAlternatif2': double.tryParse(
                                          selectedPakan.toString())!,
                                      "isPakanAlternatif1Enabled":
                                          MyDataFilterOBJ!.propertyLainnya[
                                              "adaPakanAlternatif"],
                                      "isPakanAlternatif2Enabled":
                                          MyDataFilterOBJ!.propertyLainnya[
                                              "adaPakanAlternatifLainnya"]
                                    };
                                  }
                                });
                              });
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                        height: defaultPadding,
                      ),
                      PakanManager(
                          onChanged: (Map<String, dynamic> pakanData) {
                            Future.microtask(() {
                              setState(() {
                                selectedPakan =
                                    pakanData["indexAlternatif2"]!.round();
                                MyDataFilterOBJ!
                                            .propertyLainnya["alternatifPakan"]
                                        ["Protein Pakan Pabrik %"] =
                                    pakanData["proteinPakanUtama"];

                                MyDataFilterOBJ!
                                            .propertyLainnya["alternatifPakan"]
                                        ["Kebutuhan Protein Ikan %"] =
                                    pakanData["kebutuhanProtein"];

                                MyDataFilterOBJ!
                                            .propertyLainnya["alternatifPakan"]
                                        ["Protein Maggot %"] =
                                    pakanData["proteinPakanAlternatif1"];

                                MyDataFilterOBJ!.propertyLainnya[
                                            "tambah pakan alternatif"]
                                        [selectedPakan]["protein %"] =
                                    pakanData["proteinPakanAlternatif2"];

                                MyDataFilterOBJ!
                                            .propertyLainnya["alternatifPakan"]
                                        ["Persentase Pakan Pabrik %"] =
                                    pakanData["pakanUtamaPercentage"];

                                MyDataFilterOBJ!.propertyLainnya[
                                            "tambah pakan alternatif"]
                                        [selectedPakan]["persen pemberian %"] =
                                    pakanData["pakanAlternatif2Percentage"];

                                MyDataFilterOBJ!
                                        .propertyLainnya["adaPakanAlternatif"] =
                                    pakanData["isPakanAlternatif1Enabled"];

                                MyDataFilterOBJ!.propertyLainnya[
                                        "adaPakanAlternatifLainnya"] =
                                    pakanData["isPakanAlternatif2Enabled"];

                                dataPakan = {
                                  'pakanUtamaPercentage': double.tryParse(
                                      MyDataFilterOBJ!
                                          .propertyLainnya["alternatifPakan"]
                                              ["Persentase Pakan Pabrik %"]!
                                          .toString())!,
                                  'pakanAlternatif1Percentage': (100 -
                                      (double.tryParse(MyDataFilterOBJ!
                                                  .propertyLainnya[
                                                      "alternatifPakan"][
                                                      "Persentase Pakan Pabrik %"]
                                                  .toString())!
                                              .round() +
                                          double.tryParse(MyDataFilterOBJ!
                                                  .propertyLainnya[
                                                      "tambah pakan alternatif"]
                                                      [selectedPakan]
                                                      ["persen pemberian %"]
                                                  .toString())!
                                              .round())),
                                  'pakanAlternatif2Percentage':
                                      (MyDataFilterOBJ!.propertyLainnya[
                                                  "tambah pakan alternatif"]
                                              [selectedPakan]
                                          ["persen pemberian %"]!),
                                  'proteinPakanUtama': MyDataFilterOBJ!
                                          .propertyLainnya["alternatifPakan"]
                                      ["Protein Pakan Pabrik %"]!,
                                  'proteinPakanAlternatif1': MyDataFilterOBJ!
                                          .propertyLainnya["alternatifPakan"]
                                      ["Protein Maggot %"],
                                  'proteinPakanAlternatif2':
                                      MyDataFilterOBJ!.propertyLainnya[
                                              "tambah pakan alternatif"]
                                          [selectedPakan]["protein %"],
                                  'kebutuhanProtein': MyDataFilterOBJ!
                                          .propertyLainnya["alternatifPakan"]
                                      ["Kebutuhan Protein Ikan %"],
                                  'indexAlternatif2': double.tryParse(
                                      selectedPakan.toString())!,
                                  "isPakanAlternatif1Enabled": MyDataFilterOBJ!
                                      .propertyLainnya["adaPakanAlternatif"],
                                  "isPakanAlternatif2Enabled":
                                      MyDataFilterOBJ!.propertyLainnya[
                                          "adaPakanAlternatifLainnya"]
                                };
                              });
                            });

                            // Ini adalah callback yang dipanggil ketika ada perubahan
                            // Anda bisa mengimplementasikan logika di sini
                            // print('Data pakan berubah: $pakanData');
                          },
                          data: MyDataFilterOBJ!
                              .propertyLainnya["tambah pakan alternatif"],
                          namaPliharaan: JenisBatteray.keys.toList()[indexJb],
                          dataProtein: {
                            "proteinPakanUtama": double.tryParse(
                                dataPakan["proteinPakanUtama"].toString())!,
                            "proteinPakanAlternatif1": double.tryParse(
                                dataPakan["proteinPakanAlternatif1"]
                                    .toString())!,
                            "kebutuhanProtein": double.tryParse(
                                dataPakan["kebutuhanProtein"].toString())!,
                            "proteinPakanUtama": double.tryParse(
                                dataPakan["proteinPakanUtama"].toString())!,
                            "proteinPakanAlternatif1": double.tryParse(
                                dataPakan["proteinPakanAlternatif1"]
                                    .toString())!,
                            "kebutuhanProtein": double.tryParse(
                                dataPakan["kebutuhanProtein"].toString())!,
                            'pakanUtamaPercentage': double.tryParse(
                                dataPakan["pakanUtamaPercentage"].toString())!,
                            'pakanAlternatif1Percentage': double.tryParse(
                                    dataPakan['pakanAlternatif1Percentage']
                                        .toString())!
                                .round(),
                            'pakanAlternatif2Percentage': double.tryParse(
                                    dataPakan['pakanAlternatif2Percentage']
                                        .toString())!
                                .round(),
                          },
                          dataBoolAktifPakan: {
                            "isPakanAlternatif1Enabled": MyDataFilterOBJ!
                                .propertyLainnya["adaPakanAlternatif"],
                            "isPakanAlternatif2Enabled": MyDataFilterOBJ!
                                .propertyLainnya["adaPakanAlternatifLainnya"]
                          },
                          isReset: isResetProtein),
                      SizedBox(
                        height: defaultPadding,
                      ),
                      cardWithImg(
                        "${((double.tryParse(MyDataFilterOBJ!.propertyLainnya["alternatifPakan"]["Persentase Pakan Pabrik %"]!.toString())!.round() / 100) * beratPakan).toStringAsFixed(0)}Kg",
                        30,
                        Column(
                          children: [
                            Text(
                              "${double.tryParse(MyDataFilterOBJ!.propertyLainnya["alternatifPakan"]["Persentase Pakan Pabrik %"]!.toString())!.round()}% Perkiraan Pakan Pabrik untuk pakan Ikan",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: heightfit(sT16),
                              ),
                            ),
                            SizedBox(
                              height: defaultPadding,
                            ),
                            Text(
                              "Harga Pakan Pabrik :",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: heightfit(sT16),
                              ),
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
                                        color: Colors.green.shade700
                                            .withOpacity(.2))
                                  ],
                                ),
                                child: UangPerSatuan(
                                  onChangeState: (double hasilrp, double rp,
                                      double perBanyak, String satuan) {
                                    Future.microtask(() {
                                      setState(() {
                                        MyDataFilterOBJ!.propertyLainnya[
                                            "hargaPerBanyakSatuan"] = {
                                          "hargaPer": rp,
                                          "perBanyak": perBanyak,
                                          "satuan": satuan,
                                          "hasilrp": hasilrp
                                        };
                                        hargaperKgPabrik = hasilrp;
                                        hitunglocal();
                                      });
                                    });
                                  },
                                  selectedUnitFrom:
                                      MyDataFilterOBJ!.propertyLainnya[
                                          "hargaPerBanyakSatuan"]["satuan"],
                                  selectedUnitType: 'gr',
                                  selectedUnitTos: 'kg',
                                  hargaPer: double.tryParse(MyDataFilterOBJ!
                                      .propertyLainnya["hargaPerBanyakSatuan"]
                                          ["hargaPer"]
                                      .toString())!,
                                  perbanyak: double.tryParse(MyDataFilterOBJ!
                                      .propertyLainnya["hargaPerBanyakSatuan"]
                                          ["perBanyak"]
                                      .toString())!,
                                )),
                            SizedBox(
                              height: defaultPadding,
                            ),
                            Text(
                              "Harga Total: ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: heightfit(sT16),
                              ),
                            ),
                            Text(
                              "Rp.${formatRupiah(TotalhargaperKgPabrik.toString())}",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: heightfit(sT22),
                              ),
                            ),
                          ],
                        ),
                      ),
                      cardWithImg(
                        "${(((100 - (double.tryParse(MyDataFilterOBJ!.propertyLainnya["alternatifPakan"]["Persentase Pakan Pabrik %"].toString())!.round() + double.tryParse(MyDataFilterOBJ!.propertyLainnya["tambah pakan alternatif"][selectedPakan]["persen pemberian %"].toString())!.round())) / 100) * beratPakan).toStringAsFixed(0)}Kg",
                        30,
                        Column(
                          children: [
                            Text(
                              "${100 - (double.tryParse(MyDataFilterOBJ!.propertyLainnya["alternatifPakan"]["Persentase Pakan Pabrik %"].toString())!.round() + double.tryParse(MyDataFilterOBJ!.propertyLainnya["tambah pakan alternatif"][selectedPakan]["persen pemberian %"].toString())!.round())}% Perkiraan Maggot untuk pakan Ikan",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: heightfit(sT16),
                              ),
                            ),
                            SizedBox(
                              height: defaultPadding,
                            ),
                            Text(
                              "Harga Maggot :",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: heightfit(sT16),
                              ),
                            ),
                            SizedBox(
                              height: defaultPadding / 2,
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
                                        color: Colors.green.shade700
                                            .withOpacity(.2))
                                  ],
                                ),
                                child: UangPerSatuan(
                                  onChangeState: (double hasilrp, double rp,
                                      double perBanyak, String satuan) {
                                    Future.microtask(() {
                                      setState(() {
                                        MyDataFilterOBJ!.propertyLainnya[
                                            "hargaPerBanyakSatuanMaggot"] = {
                                          "hargaPer": rp,
                                          "perBanyak": perBanyak,
                                          "satuan": satuan
                                        };
                                        hargaperKgMaggot = hasilrp;

                                        // hargaMaggot = hasilrp;
                                        // hargaTotalMaggotIkan = hargaMaggot * pakanMaggotsIkan;
                                        hitunglocal();
                                      });
                                    });
                                  },
                                  selectedUnitFrom: MyDataFilterOBJ!
                                          .propertyLainnya[
                                      "hargaPerBanyakSatuanMaggot"]["satuan"],
                                  selectedUnitType: 'gr',
                                  selectedUnitTos: 'kg',
                                  hargaPer: double.tryParse(MyDataFilterOBJ!
                                      .propertyLainnya[
                                          "hargaPerBanyakSatuanMaggot"]
                                          ["hargaPer"]
                                      .toString())!,
                                  perbanyak: double.tryParse(MyDataFilterOBJ!
                                      .propertyLainnya[
                                          "hargaPerBanyakSatuanMaggot"]
                                          ["perBanyak"]
                                      .toString())!,
                                )),
                            SizedBox(
                              height: defaultPadding,
                            ),
                            Text(
                              "Harga Total: ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: heightfit(sT16),
                              ),
                            ),
                            Text(
                              "Rp.${formatRupiah(TotalhargaperKgMaggot.toString())}",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: heightfit(sT22),
                              ),
                            ),
                            SizedBox(
                              height: defaultPadding,
                            ),
                          ],
                        ),
                      ),
                      cardWithImg(
                        "${((MyDataFilterOBJ!.propertyLainnya["tambah pakan alternatif"][selectedPakan]["persen pemberian %"]!.round() / 100) * beratPakan).toStringAsFixed(0)}Kg",
                        30,
                        Column(
                          children: [
                            Text(
                              "${MyDataFilterOBJ!.propertyLainnya["tambah pakan alternatif"][selectedPakan]["persen pemberian %"]!.round()}% Perkiraan ${MyDataFilterOBJ!.propertyLainnya["tambah pakan alternatif"][selectedPakan]["nama"]} untuk pakan Ikan",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: heightfit(sT16),
                              ),
                            ),
                            SizedBox(
                              height: defaultPadding,
                            ),
                            Text(
                              "Harga ${MyDataFilterOBJ!.propertyLainnya["tambah pakan alternatif"][selectedPakan]["nama"]} :",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: heightfit(sT16),
                              ),
                            ),
                            SizedBox(
                              height: defaultPadding / 2,
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
                                        color: Colors.green.shade700
                                            .withOpacity(.2))
                                  ],
                                ),
                                child: UangPerSatuan(
                                  onChangeState: (double hasilrp, double rp,
                                      double perBanyak, String satuan) {
                                    Future.microtask(() {
                                      setState(() {
                                        MyDataFilterOBJ!.propertyLainnya[
                                            "hargaPerBanyakSatuanPaku"] = {
                                          "hargaPer": rp,
                                          "perBanyak": perBanyak,
                                          "satuan": satuan
                                        };

                                        hargaperKgPaku = hasilrp;
                                        hitunglocal();
                                        // hargaMaggot = hasilrp;
                                        // hargaTotalMaggotIkan = hargaMaggot * pakanMaggotsIkan;
                                        // hitunglocal();
                                      });
                                    });
                                  },
                                  selectedUnitFrom:
                                      MyDataFilterOBJ!.propertyLainnya[
                                          "hargaPerBanyakSatuanPaku"]["satuan"],
                                  selectedUnitType: 'gr',
                                  selectedUnitTos: 'kg',
                                  hargaPer: double.tryParse(MyDataFilterOBJ!
                                      .propertyLainnya[
                                          "hargaPerBanyakSatuanPaku"]
                                          ["hargaPer"]
                                      .toString())!,
                                  perbanyak: double.tryParse(MyDataFilterOBJ!
                                      .propertyLainnya[
                                          "hargaPerBanyakSatuanPaku"]
                                          ["perBanyak"]
                                      .toString())!,
                                )),
                            SizedBox(
                              height: defaultPadding,
                            ),
                            SizedBox(
                              height: defaultPadding,
                            ),
                            Text(
                              "Harga Total: ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: heightfit(sT16),
                              ),
                            ),
                            Text(
                              "Rp.${formatRupiah(TotalhargaperKgPaku.toString())}",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: heightfit(sT22),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  // ketebalan tanah == harga jual /kg ikan
                  SizedBox(
                    height: defaultPadding,
                  ),
                  // Print conclusions
                  Container(
                      padding: EdgeInsets.all(defaultPadding),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                          child: Column(
                        children: [
                          Text(
                            textAlign: TextAlign.center,
                            (MyDataFilterOBJ!.propertyLainnya[
                                        "adaPakanAlternatif"] ==
                                    false)
                                ? "Beri Pakan setiap periode"
                                : "Beri Pakan setiap periode dengan persentase sesuai dengan pakan yang ditentukan\n",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: heightfit(sT24),
                            ),
                          ),
                          SizedBox(
                            height: defaultPadding,
                          ),
                          Column(
                            children: [
                              for (int o = 0;
                                  o < agendaNila.toList().length;
                                  o++)
                                if (agendaNila.toList()[o]['agenda'] ==
                                    'Awal Tebar')
                                  cardWithImg(
                                      "Periode ${agendaNila.toList()[o]['agenda']}: ${double.tryParse(agendaNila.toList()[o]['pakanPerHari'].toString())!.toStringAsFixed(2)} Kg/Hari",
                                      30,
                                      Container(
                                        child: Column(
                                          children: [
                                            Text(
                                              "Kebutuhan Pakan untuk perharinya berdasarkan persentase ${JenisBatteray.values.toList()[indexJb][1][0]['presentase']}% selama ${JenisBatteray.values.toList()[indexJb][1][0]['interval']} Minggu",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                                fontSize: heightfit(sT16),
                                              ),
                                            ),
                                            Text(
                                              "Dalam 2x sehari :  ${(agendaNila.toList()[o]['opsi2x'])!.toStringAsFixed(2)} Kg\n"
                                              "Dalam 3x sehari :  ${(agendaNila.toList()[o]['opsi3x'])!.toStringAsFixed(2)} Kg",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                                fontSize: heightfit(sT16),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ))
                                else if (agendaNila.toList()[o]['agenda'] ==
                                    'Sortir')
                                  cardWithImg(
                                      "Periode ${agendaNila.toList()[o]['agenda']}: ${double.tryParse(agendaNila.toList()[o]['pakanPerHari'].toString())!.toStringAsFixed(2)} Kg/Hari",
                                      30,
                                      Container(
                                        child: Column(
                                          children: [
                                            Text(
                                              "Kebutuhan Pakan untuk perharinya berdasarkan persentase ${JenisBatteray.values.toList()[indexJb][1][1]['presentase']}% selama ${JenisBatteray.values.toList()[indexJb][1][1]['interval']} Minggu",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                                fontSize: heightfit(sT16),
                                              ),
                                            ),
                                            Text(
                                              "Dalam 2x sehari :  ${(agendaNila.toList()[o]['opsi2x'])!.toStringAsFixed(2)} Kg\n"
                                              "Dalam 3x sehari :  ${(agendaNila.toList()[o]['opsi3x'])!.toStringAsFixed(2)} Kg",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                                fontSize: heightfit(sT16),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ))
                                else if (agendaNila.toList()[o]['agenda'] ==
                                    'Panen')
                                  cardWithImg(
                                      "Periode ${agendaNila.toList()[o]['agenda']}: ${double.tryParse(agendaNila.toList()[o]['pakanPerHari'].toString())!.toStringAsFixed(2)} Kg/Hari",
                                      30,
                                      Container(
                                        child: Column(
                                          children: [
                                            Text(
                                              "Kebutuhan Pakan untuk perharinya berdasarkan persentase ${JenisBatteray.values.toList()[indexJb][1][2]['presentase']}% selama ${JenisBatteray.values.toList()[indexJb][1][2]['interval']} Minggu\n",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                                fontSize: heightfit(sT16),
                                              ),
                                            ),
                                            Text(
                                              "Dalam 2x sehari :  ${(agendaNila.toList()[o]['opsi2x'])!.toStringAsFixed(2)} Kg\n"
                                              "Dalam 3x sehari :  ${(agendaNila.toList()[o]['opsi3x'])!.toStringAsFixed(2)} Kg",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                                fontSize: heightfit(sT16),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ))
                                else
                                  Container()
                            ],
                          ),
                        ],
                      ))),

                  cardWithImg(
                      "Perkiraan Keuntungan Kotor Rp.${formatRupiah(((beratIkanSisaAkhir) * double.tryParse(MyDataFilterOBJ!.propertyLainnya["ketebalanTanah"])!).toString())}",
                      30,
                      Container(
                        child: Column(
                          children: [
                            Container(
                                padding: EdgeInsets.all(defaultPadding / 2),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(10),
                                        bottomRight: Radius.circular(10),
                                        topLeft: Radius.circular(10),
                                        topRight: Radius.circular(10)),
                                    // border:
                                    //     Border.all(color: kTextColor.withOpacity(.8), width: .2)
                                    boxShadow: [
                                      BoxShadow(
                                          blurRadius: 10,
                                          offset: Offset(-1, 8),
                                          color: Colors.green.withOpacity(.3))
                                    ]),
                                child: fieldoBaterai[5]),
                            SizedBox(
                              height: defaultPadding / 2,
                            ),
                            Text(
                              "Perkiraan keuntungan ikan adalah hasil dari total bobot ikan saat panen",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: heightfit(sT16),
                              ),
                            ),
                            Text(
                              "\nKeuntungan bersih dari pengeluaran pakan : "
                              "Rp.${MyDataFilterOBJ!.propertyLainnya["adaPakanAlternatif"] == true ? formatRupiah((beratIkanSisaAkhir * double.tryParse(MyDataFilterOBJ!.propertyLainnya["ketebalanTanah"])! - double.tryParse(MyDataFilterOBJ!.propertyLainnya["keperluanLainnya"][2]["Beban Biaya"].toString())!).toString()) : formatRupiah((beratIkanSisaAkhir * double.tryParse(MyDataFilterOBJ!.propertyLainnya["ketebalanTanah"])! - double.tryParse(MyDataFilterOBJ!.propertyLainnya["keperluanLainnya"][2]["Beban Biaya"].toString())!).toString())}",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: heightfit(sT24),
                              ),
                            ),
                            // Text("",
                            //   // "Dalam 2x sehari :  ${(agendaNila.toList()[o]['opsi2x'])!.toStringAsFixed(2)} Kg\n"
                            //   //     "Dalam 3x sehari :  ${(agendaNila.toList()[o]['opsi3x'])!.toStringAsFixed(2)} Kg",
                            //
                            //   style: TextStyle(
                            //     fontWeight: FontWeight.bold,
                            //     color: Colors.white,
                            //     fontSize: heightfit(sT16),
                            //   ),
                            // ),
                          ],
                        ),
                      )),

                  SizedBox(
                    height: defaultPadding,
                  ),
                  BannerWidget(
                    gambarBanner: "assets/images/MenuRawatan/RawatTanam/Ph.png",
                  ),

                  SizedBox(
                    height: defaultPadding,
                  ),
                  AutoSizeText(
                    "Agenda Rawat: ",
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
                    height: defaultPadding,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: DataTable(
                      columns: [
                        DataColumn(label: Text('Agenda')),
                        DataColumn(label: Text('Minggu')),
                        DataColumn(label: Text('Jml Hari')),
                        DataColumn(label: Text('Presentase %')),
                        DataColumn(label: Text('Jml Hari2')),
                        DataColumn(label: Text('Pakan/Hari (Kg)')),
                        DataColumn(label: Text('Opsi 2x (Kg)')),
                        DataColumn(label: Text('Opsi 3x (Kg)')),
                        DataColumn(label: Text('Total Pakan (Kg)')),
                      ],
                      rows: agendaNila.asMap().entries.map((entry) {
                        int index = entry.key;
                        var data = entry.value;

                        Color getColor(int index) {
                          double interval = 0;
                          for (var p in periode) {
                            interval += p['interval'];
                            if (index < interval) {
                              return p['periode'] == 1
                                  ? Colors.blue[100]!
                                  : p['periode'] == 2
                                      ? Colors.green[100]!
                                      : Colors.green[500]!;
                            }
                          }
                          return Colors.white;
                        }

                        return DataRow(
                          color: WidgetStateProperty.resolveWith<Color>(
                              (Set<WidgetState> states) {
                            return getColor(index);
                          }),
                          cells: [
                            DataCell(Text(data['agenda'])),
                            DataCell(Text(data['minggu'].toString())),
                            DataCell(Text(data['jmlHari'].toString())),
                            DataCell(Text(data['presentase'])),
                            DataCell(Text(data['jmlHari2'].toString())),
                            DataCell(
                                Text(data['pakanPerHari'].toStringAsFixed(2))),
                            DataCell(Text(data['opsi2x'].toStringAsFixed(2))),
                            DataCell(Text(data['opsi3x'].toStringAsFixed(2))),
                            DataCell(
                                Text(data['totalPakan'].toStringAsFixed(2))),
                          ],
                        );
                      }).toList(),
                    ),
                  ),
                  SizedBox(
                    height: defaultPadding / 2,
                  ),
                  AutoSizeText(
                    "Pengeluaran Lainnya : ",
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
                    height: defaultPadding,
                  ),

                  SizedBox(
                    height: defaultPadding / 2,
                  ),
                  SizedBox(
                    height: SizeConfig.screenHeight! / 2,
                    width: SizeConfig.screenWidth,
                    child: NotificationListener<ScrollNotification>(
                      onNotification: (ScrollNotification notification) {
                        if (notification is ScrollEndNotification) {
                          if (_childScrollController.position.atEdge) {
                            if (_childScrollController.position.pixels == 0) {
                              // At the top of the child scroll
                              // widget.parentController.jumpTo(widget.parentController.offset - 30);
                              _parentScrollController.animateTo(
                                _parentScrollController.offset -
                                    SizeConfig.screenHeight! / 4,
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeInOut,
                              );
                            } else {
                              // At the bottom of the child scroll
                              // widget.parentController.jumpTo(widget.parentController.offset + 30);
                              _parentScrollController.animateTo(
                                _parentScrollController.offset +
                                    SizeConfig.screenHeight! / 4,
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeInOut,
                              );
                            }
                          }
                        }
                        return false;
                      },
                      child: ListView.builder(
                          controller: _childScrollController,
                          itemCount: MyDataFilterOBJ!
                              .propertyLainnya["keperluanLainnya"].length,
                          // shrinkWrap: true,
                          // Menyesuaikan ukuran dengan jumlah item
                          // physics: const NeverScrollableScrollPhysics(),
                          // scrollDirection: Axis.vertical,
                          // padding: const EdgeInsets.symmetric(horizontal: 56),
                          // addRepaintBoundaries: true,
                          itemBuilder: (context, indexFixs) {
                            // final item = dataParentss.toList()[index % widget.items.length];
                            // dataParentss[indexK].pupuk[indexFixs].hasil = hargaObject["hasilAkhirPerObject"].toString();
                            return ExpandingCards(
                              height: 300,
                              indexFix: indexFixs,
                              // len: dataParentss[indexK].pupuk.length,
                              len: MyDataFilterOBJ!
                                  .propertyLainnya["keperluanLainnya"].length,
                              gridview: false,
                              axisCount: 3,
                              onchange: (indekpuu) {
                                // hasilTotal(indexK, indexFixs, dataParentss[indexK],
                                //     widget.waktu);
                              },
                              img: dataKategoriMenuRawatan[
                                      c.indexMenuRawatan.value]
                                  .img_banner[1],
                              title: MyDataFilterOBJ!
                                      .propertyLainnya["keperluanLainnya"]
                                  [indexFixs]["Nama Pengeluaran"],
                              subtitle:
                                  "Rp.${formatRupiah(MyDataFilterOBJ!.propertyLainnya["keperluanLainnya"][indexFixs]["Beban Biaya"].toString())}",
                              penjelas: "",
                              // "Dengan \nDaya ${dataParentss[indexK].pupuk[indexFixs].namaPupu} : ${dataParentss[indexK].pupuk[indexFixs].watt} Watt\nTotal daya : ${dataParentss[indexK].pupuk[indexFixs].hasil} Watt \nSelama waktu: ${dataParentss[indexK].pupuk[indexFixs].LamaListring} Jam ",
                              dialog: Container(),
                              tambah: (LO) {
                                Future.microtask(() {
                                  setState(() {});
                                });
                                // setState(() {
                                MyDataFilterOBJ!
                                    .propertyLainnya["keperluanLainnya"]
                                    .add({
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
                                  MyDataFilterOBJ!
                                      .propertyLainnya["keperluanLainnya"]
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
                                                      text:
                                                          "${MyDataFilterOBJ!.propertyLainnya["keperluanLainnya"][indexFixs]["Nama Pengeluaran"]}"
                                                              .toString()),
                                                  satuan: "",
                                                  title: "Nama Pengeluaran \n",
                                                  tema: Colors.black38,
                                                  onStateChange: (values) {
                                                    Future.microtask(() {
                                                      setState(() {});
                                                    });
                                                    MyDataFilterOBJ!.propertyLainnya[
                                                                "keperluanLainnya"]
                                                            [indexFixs][
                                                        "Nama Pengeluaran"] = values;

                                                    // setState(() {
                                                    //
                                                    // });
                                                    // setPreference();
                                                  },
                                                  inputType: TextInputType.text,
                                                  enable: true,
                                                ),
                                                Fields(
                                                  controller: TextEditingController(
                                                      text:
                                                          "${MyDataFilterOBJ!.propertyLainnya["keperluanLainnya"][indexFixs]["Beban Biaya"]}"
                                                              .toString()),
                                                  satuan: (indexFixs == 0)
                                                      ? ""
                                                      : (indexFixs == 1)
                                                          ? "Rp/$banyakIkan"
                                                          : "Rp/Kg",
                                                  title: "Harga \n",
                                                  tema: Colors.black38,
                                                  onStateChange: (values) {
                                                    Future.microtask(() {
                                                      setState(() {});
                                                    });
                                                    MyDataFilterOBJ!.propertyLainnya[
                                                                "keperluanLainnya"]
                                                            [indexFixs][
                                                        "Beban Biaya"] = values;

                                                    // setState(() {
                                                    //
                                                    // });
                                                    // setPreference();
                                                  },
                                                  inputType: TextInputType
                                                      .numberWithOptions(
                                                          decimal: true),
                                                  enable: true,
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
                                  t <
                                      MyDataFilterOBJ!
                                              .propertyLainnya[
                                                  "keperluanLainnya"]
                                              .length -
                                          1;
                                  t++)
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    RichText(
                                        text: TextSpan(children: [
                                      TextSpan(
                                        text:
                                            "Biaya ${MyDataFilterOBJ!.propertyLainnya["keperluanLainnya"][t]["Nama Pengeluaran"]} :",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: kTextColor,
                                          fontSize: heightfit(sT20),
                                        ),
                                      ),
                                    ])),
                                    Padding(
                                      padding:
                                          EdgeInsets.all(defaultPadding / 2),
                                      child: Container(
                                        padding:
                                            EdgeInsets.all(defaultPadding / 2),
                                        decoration: BoxDecoration(
                                          color: warnas(List.of(filtersdata[
                                                      c.selectedItemCalcT.value]
                                                  .studiKasus)
                                              .map((e) => e.values)
                                              .toList()[0]
                                              .first["warna"]),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Center(
                                            child: Text(
                                          "Rp. ${formatRupiah(MyDataFilterOBJ!.propertyLainnya["keperluanLainnya"][t]["Beban Biaya"].toString())}",
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
                        MyDataFilterOBJ!
                                    .propertyLainnya["adaPakanAlternatif"] ==
                                true
                            ? "Rp. ${formatRupiah((hargaTotalpH + hitungTotalBiaya()).toString())}"
                            : "Rp. "
                                // "${formatRupiah((hitungHarga(aDosis, hargaDosis).values.toList().reduce((value, element) => value + element) + (hargaTotalpH + hitungTotalBiaya(beratPakan))).toString())}"
                                "${formatRupiah((hargaTotalpH + hitungTotalBiaya()).toString())}",
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      )),
                ]);
              }),
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

  Padding cardWithImg(String penjelas, double size, Widget widgetCostume) {
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
                                SizedBox(
                                  height: heightfit(defaultPadding),
                                ),
                                Center(
                                    child: RichText(
                                  text: TextSpan(
                                    text: penjelas,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: size),
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
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
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
                        "${dates[(c.indexMenuRawatan.value == 3 || c.indexMenuRawatan.value == 4 || c.indexMenuRawatan.value == 5) ? 0 : MyDataFilterOBJ!.propertyLainnya["tampungan"]["indexperusahaan"]]}",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
