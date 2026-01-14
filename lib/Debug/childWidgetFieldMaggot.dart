import 'dart:convert';

import 'package:rawatt/Debug/childWidgetFieldTanaman.dart';
import 'package:rawatt/Debug/formasiKandang.dart';
import 'package:rawatt/Debug/widget_mediaLahan.dart';
import 'package:rawatt/components/card_field.dart';
import 'package:rawatt/components/inputan.dart';
import 'package:rawatt/components/tabCostume.dart';
import 'package:rawatt/constants.dart';
import 'package:rawatt/screens/convert/component/Widget_Jenis_Pot.dart';
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
// import '../screens/convert/component/Widget_Jenis_Pot.dart';
import '../screens/convert/component/Widget_pH_indikator.dart';
import '../screens/convert/component/inisialisasi_var.dart';
import '../screens/convert/screens/dolomit/Dolomit_display.dart';
import '../screens/convert/screens/dolomit/myMainDolomit.dart';
import '../screens/convert/screens/dosis_pupuk_tanaman/dosis_pupuk_tanaman.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:get/get.dart';

import '../screens/details/component/component.dart';

class childWidgetFieldMaggot extends StatefulWidget {
  final Function(String) onChangeState;

  const childWidgetFieldMaggot({
    super.key,
    required this.onChangeState,
  });

  @override
  State<childWidgetFieldMaggot> createState() => _childWidgetFieldMaggotState();
}

int indexMediaLahan = 0;
// Map dataRumusLuasLahan = {};
// double hasilLahan = 0.0;
// // int indexObjectIndexSelectedEdit = 0;

String hargapH = "0";
BuildContext? contexty;

// List<KategoriRumus> datakategorirum = [];

double hargaTotalpH = 0;

// Map<dynamic, dynamic> hargaDosis = {};
// Map<dynamic, dynamic> aDosis = {};

// Map<String, String> hagaDosis = {};

void _launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Tidak dapat membuka URL: $url';
  }
}

Center imageCostum(String imgs) {
  return Center(
    child: Stack(children: [
      SizedBox(
        height: SizeConfig.screenWidth! / 1.7,
        width: SizeConfig.screenWidth! / 1.1,
        // margin:EdgeInsets.all(defaultPadding),
        child: ElevatedButton(
          onPressed: () {
            print("ok");
            _launchURL(
                filterdataByDiskon(c.indexMenuRawatan.value.toString())[0]
                    .link);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black12.withOpacity(.1),
            padding: EdgeInsets.zero,
            shadowColor: Colors.white,
            // padding: EdgeInsets.only(top: 60),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            elevation: 0,
          ),
          child: Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    blurRadius: 5,
                    offset: Offset(0, 0),
                    color: warnas(
                        dataKategoriMenuRawatan[c.indexMenuRawatan.value]
                            .colorku[0]))
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(defaultPadding)),
              // Menggunakan anti-aliasing untuk tepi oval yang lebih halus
              child: Image.asset(
                imgs,
                width: double.infinity,
                fit: BoxFit.fitWidth,
              ),
              // ImgOnline(
              //     imgs,
              //     imgs),
            ),
          ),
        ),
      ),
    ]),
  );
}

void hitungProsesMaggot() {
  dataProductsObj.where((element) => element.nama == "dolomit").first.harga =
      hargapH;

  // hagaDosis.forEach((key, value) {
  //   dataProductsObj.where((element) => element.nama == key).first.harga =
  //       hagaDosis[key]!;
  // });

  if (copiedData!.propertyLainnya["adaUkurPH"] == false) {
    hargaTotalpH = 0;
  } else {
    hargaTotalpH = double.tryParse(hargapH)! * (cariValue("KpH") * 1000);
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

  datafilterMyData1![c.ObjectIndexSelectedEdit.value].kategoriRumusKu =
      copiedData!.kategoriRumusKu;
  datafilterMyData1![c.ObjectIndexSelectedEdit.value].kategoriRumusKu[
          copiedData!.propertyLainnya["tampungan"]["indexBentukMediaTanam"]] =
      copiedData!.kategoriRumusKu[copiedData!.propertyLainnya["tampungan"]
          ["indexBentukMediaTanam"]];

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
          .propertyLainnya["ketebalanTanah"] =
      copiedData!.propertyLainnya["ketebalanTanah"];

  datafilterMyData1![c.ObjectIndexSelectedEdit.value]
      .propertyLainnya["adaUkurPH"] = copiedData!.propertyLainnya["adaUkurPH"];

  datafilterMyData1![c.ObjectIndexSelectedEdit.value]
          .propertyLainnya["adaJenisTanah"] =
      copiedData!.propertyLainnya["adaJenisTanah"];

  datafilterMyData1![c.ObjectIndexSelectedEdit.value]
          .propertyLainnya["peliharaans"] =
      copiedData!.propertyLainnya["peliharaans"];

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
      .propertyLainnya["luasMedia"] = copiedData!.propertyLainnya["luasMedia"];

  // hargaDosis.keys.toList().forEach((elementw) {
  //   dataProductsObj
  //       .where((element) => element.nama == elementw)
  //       .toList()
  //       .last
  //       .harga = hargaDosis[elementw].toString();
  // });

  aqw();

  datafilterMyData1![c.ObjectIndexSelectedEdit.value] = copiedData!;

  datafilterMyData1![c.ObjectIndexSelectedEdit.value].propertyLainnya["sr%"] =
      copiedData!.propertyLainnya["sr%"];

  datafilterMyData1![c.ObjectIndexSelectedEdit.value]
          .propertyLainnya["massaBibitTotal"] =
      copiedData!.propertyLainnya["massaBibitTotal"];

  datafilterMyData1![c.ObjectIndexSelectedEdit.value]
          .propertyLainnya["perkiraanPanenBobotLele"] =
      copiedData!.propertyLainnya["perkiraanPanenBobotLele"];
  datafilterMyData1![c.ObjectIndexSelectedEdit.value].propertyLainnya["fcr"] =
      copiedData!.propertyLainnya["fcr"];
  // datafilterMyData1![c.ObjectIndexSelectedEdit.value].kategoriRumusKu.toList()[0].valuess.isEmpty?
  // MyDataFilterOBJ!.kategoriRumusKu.toList()[0].valuess = {"p": ["panjang", 0.3], "l": ["lebar", 0.32], "t": ["tinggi", 0.015]}:
  // MyDataFilterOBJ!.kategoriRumusKu.toList()[0].valuess;
  fix_updateParentData(datafilterMyData1!);

  setPreference();
}

void aqw() {
  if (copiedData!.propertyLainnya["adaUkurPH"] == false) {
    hargaTotalpH = 0;
  } else {
    hargaTotalpH = double.tryParse(hargapH)! * (cariValue("KpH") * 1000);
  }

  datafilterMyData1![c.ObjectIndexSelectedEdit.value].hasilTotal =
      // (hitungHarga(aDosis, hargaDosis)
      //             .values
      //             .toList()
      //             .reduce((value, element) => value + element) +
      //         (hargaTotalpH + hitungTotalBiaya(beratPakanMaggot)))
      //     .toString();

      (hargaTotalpH + hitungTotalBiaya(beratPakanMaggot)).toString();
}
// KategoriRumus? datamediatanamtam;

double hitungTotalBiaya(double beratPakanMaggot) {
  double total = List.from(copiedData!.propertyLainnya["keperluanLainnya"])
      .fold(0.0, (previousValue, element) {
    double biaya = double.tryParse(element['Beban Biaya'].toString())!;
    if (element['Nama Pengeluaran'] == 'Pakan/Kg') {
      biaya = double.tryParse(element['Beban Biaya'].toString())! *
          beratPakanMaggot;
    }
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

  // Menambahkan "Maggot_" ke nama file sebelum ekstensi
  String newFilename = "Maggot_${filenameParts.first}.${filenameParts.last}";

  // Mengganti nama file pada bagian terakhir dari path
  parts[parts.length - 1] = newFilename;

  // Menggabungkan kembali bagian-bagian dari path
  return parts.join('/');
}

double beratPakanMaggot = 0;

class PakanData {
  final String agenda;
  final int hari;
  final double pakanAwal;
  final double pakanKg;
  final double persentase;

  PakanData({
    required this.agenda,
    required this.hari,
    required this.pakanAwal,
    required this.pakanKg,
    required this.persentase,
  });
}

int biopond = 0;
double banyakTelurMaggot = 0;
double banyakIkanSisaMaggot = 0;
double beratIkanSisaAwalMaggot = 0;
double pakanMaggot = 0;

class _childWidgetFieldMaggotState extends State<childWidgetFieldMaggot> {
  final ScrollController _childScrollController = ScrollController();
  final ScrollController _parentScrollController = ScrollController();

  double populasiTanam1Ha = 0;
  double populasiPetak = 0;
  double tinggi = 0.0;
  double tinggiPaten = 0.015;
  List<PakanData> _data = [];

  List<Widget> fieldoBaterai = [];
  List<TextEditingController> myControlerssoBatrai = [];
  Map dataVariabelbaterai = {};
  int indexJb = 0;
  int jaraktanam = 2;
  int Rekomendasibanyakpot = 0;
  // Map JenisBatteray = {
  //   "Ikan lele": [
  //     luasBoxMaggot,
  //     [
  //       {'periode': 1, 'presentase': 10, 'interval': 4, 'agenda': 'Awal Tebar'},
  //       {'periode': 2, 'presentase': 50, 'interval': 6, 'agenda': 'Sortir'},
  //       {'periode': 3, 'presentase': 40, 'interval': 4, 'agenda': 'Panen'}
  //     ],
  //     "Ketetapan perkiraan 1000 ikan dengan luas 15 m kubik"
  //   ],
  // };

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    Future.microtask(() {
      if (simpanhitung = true) {
        widget.onChangeState(
            datafilterMyData1![c.ObjectIndexSelectedEdit.value].hasilTotal);
      }
    });
    // datamediatanamtam = dataKategoriRumus1.where((element) => element.id_MenuRawatan==c.indexMenuRawatan.value && element.idMediaTanam == 0).toList().where((element) => element.nama == "Persegi Panjang").toList().first;
    _childScrollController.dispose();

    _parentScrollController.dispose();
  }

  Widget Containe(int indexFixs) {
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
              satuan: "Rp/Kg",
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
              inputType: TextInputType.numberWithOptions(decimal: true),
              enable: true,
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
    // Mengambil data terakhir
  }

  void _generateDataMagoot() {
    // Data awal dari baris pertama
    List<PakanData> newData = [
      PakanData(
        agenda: "pertumbuhan",
        hari: 1,
        pakanAwal: pakanMaggot / 470,
        pakanKg: pakanMaggot / 470,
        persentase: 1,
      ),
    ];

    // Fungsi untuk menghitung pakan pada fase pertumbuhan
    double hitungPertumbuhan(double pakanAwal, double persentase) {
      return pakanAwal * (1 + persentase / 100);
    }

    // Fungsi untuk menghitung pakan pada fase penggemukan
    double hitungPenggemukan(double pakanAwal, double pakanTetap) {
      return pakanTetap;
    }

    // Mengambil data terakhir
    double pakanAwal = newData.last.pakanKg;
    double persentasePertumbuhan = 170;
    double persentasePenggemukan = 1;
    int hariPertumbuhan = 7;
    int hariPenggemukan = 7;

    // Perhitungan fase pertumbuhan
    for (int hari = 2; hari <= hariPertumbuhan; hari++) {
      double pakanBaru = hitungPertumbuhan(pakanAwal, persentasePertumbuhan);
      newData.add(
        PakanData(
          agenda: "pertumbuhan",
          hari: hari,
          pakanAwal: pakanAwal,
          pakanKg: double.tryParse(pakanBaru.toStringAsFixed(1))!,
          persentase: persentasePertumbuhan,
        ),
      );
      pakanAwal = pakanBaru;
    }

    // Perhitungan fase penggemukan
    pakanTetap = pakanMaggot;
    for (int hari = hariPertumbuhan + 1;
        hari <= hariPertumbuhan + hariPenggemukan;
        hari++) {
      newData.add(
        PakanData(
          agenda: "penggemukan",
          hari: hari,
          pakanAwal: pakanAwal,
          pakanKg: pakanTetap,
          persentase: persentasePenggemukan,
        ),
      );
      pakanAwal = pakanTetap;
    }

    setState(() {
      _data = newData;
    });
  }

  double pakanTetap = 0;

  MyData? MyDataFilterOBJ;
  List? dataPengeluaran;
  int tanamPerCage = 1;
  int cageWidthTanam = 31; // cm
  int cageHeightTanam = 2; // cm
  int cageLengthTanam = 28; // cm
  int PanjangTempatTanam = 28;
  int maxLevelsTanam = 1;
  final int _currentValue = 0;

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

    MyDataFilterOBJ = MyData.fromJson(json.decode(json.encode(
        MyData.toMap(datafilterMyData1![c.ObjectIndexSelectedEdit.value]))));

    copiedData = MyDataFilterOBJ!;

    // copiedData = MyData.fromJson(dataMap);
    dataPengeluaran =
        List.from(copiedData!.propertyLainnya["keperluanLainnya"]);

    if (MyDataFilterOBJ!.propertyLainnya["luasMedia"].isEmpty) {
      MyDataFilterOBJ!.propertyLainnya["luasMedia"] = datavar;

      print("lols2 $datavar");
    } else {
      datavar = MyDataFilterOBJ!.propertyLainnya["luasMedia"];
      print("lols $datavar");
    }

    if (MyDataFilterOBJ!.luas == "") {
      MyDataFilterOBJ!.luas = "0";
    }
    satuans = MyDataFilterOBJ!.propertyLainnya["satuanMediaLahan"][0];

    if (c.selectedItemCalcT.value != 2) {
      if (MyDataFilterOBJ!.kategoriRumusKu
          .where((element) => element.nama == "Persegi Panjang")
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
                ? element.id_MenuRawatan == 1
                : element.id_MenuRawatan == c.indexMenuRawatan.value &&
                    element.idMediaTanam == 0)
            .toList();
        print(
            "index select 2 ${MyDataFilterOBJ!.kategoriRumusKu} ${c.ObjectIndexSelectedEdit.value}");
      } else {
        // MyDataFilterOBJ!.kategoriRumusKu
        //         .where((element) => element.nama == "Persegi Panjang")
        //         .toList()
        //         .first =
        //     datafilterMyData1![c.ObjectIndexSelectedEdit.value]
        //         .kategoriRumusKu
        //         .where((element) => element.nama == "Persegi Panjang")
        //         .toList()
        //         .first;
      }
    }

    onPresospH(
        (MyDataFilterOBJ!.propertyLainnya["pHData"]["hasil"] == null)
            ? 0
            : cariValue("pH"),
        'm');

    indexMediaLahan =
        MyDataFilterOBJ!.propertyLainnya["tampungan"]["indexBentukMediaTanam"];
    // MyDataFilterOBJ!.propertyLainnya["tampungan"]["indexBentukMediaTanam"] =
    //     datafilterMyData1![c.ObjectIndexSelectedEdit.value]
    //         .propertyLainnya["tampungan"]["indexBentukMediaTanam"];
    // indexMediaLahan = 0;
    //
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
      // datainputan.value[2] = datafilterMyData1![c.ObjectIndexSelectedEdit.value].propertyLainnya["pHData"]["hasil"];

      // MyDataFilterOBJ!.propertyLainnya["pHData"] =
      //     datafilterMyData1![c.ObjectIndexSelectedEdit.value]
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
      // MyDataFilterOBJ!.kategoriRumusKu.toList()[0].valuess = {"p": ["panjang", 0.3], "l": ["lebar", 0.32], };
      // "t": ["tinggi", 0.015]

      // print(
      //     "field 12 12 13 => tidak  ${datafilterMyData1![c.ObjectIndexSelectedEdit.value].kategoriRumusKu[indexMediaLahan].valuess}");
    } else if (MyDataFilterOBJ!
        .kategoriRumusKu[indexMediaLahan].valuess.isNotEmpty) {
      // print(
      //     "field 12 12 13 => ada  ${datafilterMyData1![c.ObjectIndexSelectedEdit.value].kategoriRumusKu[indexMediaLahan].valuess}");
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
    //
    // // ==============================================
    // //
    // print(
    //     "indexss ${c.indexdropdownjenisPemupukan.value} ${datafilterMyData1![c.ObjectIndexSelectedEdit.value].propertyLainnya["tampungan"]["indexjenisPupuk"]}");
    // MyDataFilterOBJ!.propertyLainnya["tampungan"]["indexjenisPupuk"] =
    //     datafilterMyData1![c.ObjectIndexSelectedEdit.value]
    //         .propertyLainnya["tampungan"]["indexjenisPupuk"];
    //
    // MyDataFilterOBJ!.propertyLainnya["ketebalanTanah"] =
    //     datafilterMyData1![c.ObjectIndexSelectedEdit.value]
    //         .propertyLainnya["ketebalanTanah"];

    // MyDataFilterOBJ!.luas =
    //     datafilterMyData1![c.ObjectIndexSelectedEdit.value].luas;
    c.indexdropdownjenisPemupukan.value =
        MyDataFilterOBJ!.propertyLainnya["tampungan"]["indexjenisPupuk"];

    hargapH = dataProductsObj
        .where((element) => element.nama == "dolomit")
        .first
        .harga;

    dataVariabelbaterai = {
      "Survival Rate % (sr)": MyDataFilterOBJ!.propertyLainnya["sr%"],
      "bobot total bibit (Gr)":
          MyDataFilterOBJ!.propertyLainnya["massaBibitTotal"],
      "Perkiraan Bobot per Ikan (Gr)":
          MyDataFilterOBJ!.propertyLainnya["perkiraanPanenBobotLele"],
      // rasio jumlah pakan yang dibutuhkan untuk menghasilkan 1 kg
      "banyak Box Maggot : ": MyDataFilterOBJ!.propertyLainnya["peliharaans"],

      "FCR": MyDataFilterOBJ!.propertyLainnya["fcr"],
      "Jenis Ikan": MyDataFilterOBJ!.propertyLainnya["indexJb"],
      "Harga Pasar Ikan/Kg": MyDataFilterOBJ!.propertyLainnya["ketebalanTanah"],
    };

    myControlerssoBatrai = myControl(dataVariabelbaterai);
    fieldoBaterai = fieldso(false, dataVariabelbaterai, myControlerssoBatrai);

    onPresoqw();
    // MyDataFilterOBJ!.propertyLainnya["indexJb"] = int.tryParse(
    //     datafilterMyData1![c.ObjectIndexSelectedEdit.value]
    //         .propertyLainnya["indexJb"]
    //         .toString())!;
    indexJb = MyDataFilterOBJ!.propertyLainnya["indexJb"];

    print(
        "index select 3 ${MyDataFilterOBJ!.kategoriRumusKu} ${c.ObjectIndexSelectedEdit.value}");

    // MyDataFilterOBJ!.luas =
    //     (double.tryParse(MyDataFilterOBJ!.luas)! * tinggiPaten).toString();

    if (MyDataFilterOBJ!.propertyLainnya["satuanMediaLahan"][0] == "m") {
      p = (datavar["panjang"] * 100).round();
      l = (datavar["lebar"] * 100).round();
    } else {
      p = (datavar["panjang"]).round();
      l = (datavar["lebar"]).round();
    }

    // p = double.parse(datavar["panjang"].toString()).toInt();
    // l = double.parse(datavar["lebar"].toString()).toInt();

    _generateDataMagoot();

    if (MyDataFilterOBJ!.propertyLainnya["panjangTempatTanam"] == 0) {
      MyDataFilterOBJ!.propertyLainnya["panjangTempatTanam"] =
          PanjangTempatTanam;
    }
    aturLayout();
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
          if (index == 3) {
            // maxLevelsTanamTurun();
            // aturLayout();
            if (jaraktanam >= 50) {
              // maxLevelsTanamTurun();
              aturLayout();
            }
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
      // changeSatuan(satuanm,  dataVariabel);
      // print("datanya ${data}");

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
        fieldoBaterai = fieldso(false, dataB, myControlerssoBatrai);
        dataVariabelbaterai = dataB;
        // MyDataFilterOBJListrik!.propertyLainnya = dataVariabelbaterai;

        MyDataFilterOBJ!.propertyLainnya["sr%"] =
            dataVariabelbaterai["Survival Rate % (sr)"];
        MyDataFilterOBJ!.propertyLainnya["massaBibitTotal"] =
            dataVariabelbaterai["bobot total bibit (Gr)"];

        MyDataFilterOBJ!.propertyLainnya["peliharaans"] =
            dataVariabelbaterai["banyak Box Maggot : "];

        MyDataFilterOBJ!.propertyLainnya["perkiraanPanenBobotLele"] =
            dataVariabelbaterai["Perkiraan Bobot per Ikan (Gr)"];
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

  Map hasila = {};
  Map datavar = {"panjang": 0, "lebar": 0};
  String satuans = "m";
  int p = 3;
  int l = 3;

  int luasBoxMaggot = 0;

  int cagesRequired = 0;
  int fullStacks = 0;
  int remainderCages = 0;
  int maxWidth = 0;
  int widthTotal = 0;
  int highestNumber = 1;
  int maxpipa = 0;

  int count = 0;

  int banyakInstalasi = 0;
  int banyakinstalasiperbaris1 = 0;
  int banyakinstalasiperkolom1 = 0;
  Map<String, List<int>> datatabel = {};
  String cageArrangement = "";
  int banyaktanamS = 0;

  Map<int, int> stackDistribution = {};

  //
  void aturLayout() {
    stackDistribution = {};
    cageArrangement = "";
    banyaktanamS = 0;
    count = 0;
    banyakinstalasiperbaris1 = 0;
    banyakinstalasiperkolom1 = 0;

    // if ((MyDataFilterOBJ!
    //     .propertyLainnya["peliharaans"].toInt()! <
    //     0)) {
    //   biopond = 1;
    // } else {
    //   biopond = int.tryParse(myControlerssoBatrai[3].text)!;
    // }

    biopond = (double.tryParse(
                MyDataFilterOBJ!.propertyLainnya["peliharaans"].toString())! <
            0)
        ? 1
        : double.tryParse(myControlerssoBatrai[3].text)!.toInt();
    // ((double.tryParse(MyDataFilterOBJ!.luas)! * 1.0!) / (1890 / 1000000))
    //     .toInt();
    perkirranPakanBanyakTanaman = biopond * 100;
    jaraktanam = 1;
    cageWidthTanam = 31; // cm
    cageHeightTanam = 2; // cm
    cageLengthTanam = 40; // cm
    PanjangTempatTanam = 40 * 3;
    tanamPerCage = 3;
    maxLevelsTanam = 3;
    // imgInstalasi = "assets/images/MenuRawatan/RawatTanam/kandangAzolla.png",
    // print("data paku ${jaraktanam}"),

    cagesRequired = (biopond / tanamPerCage).ceil();
    print("banyak tanam $cagesRequired ");

    fullStacks = (maxLevelsTanam != 0) ? (cagesRequired ~/ maxLevelsTanam) : 0;
    remainderCages = cagesRequired % maxLevelsTanam;

    // Menyimpan susunan Pot dalam Map

    if (fullStacks > 0) {
      stackDistribution[maxLevelsTanam] = fullStacks;
    }
    if (remainderCages > 0) {
      stackDistribution[remainderCages] = 1;
    }

    stackDistribution.forEach((levels, count) {
      int currentWidth = ((cageWidthTanam) * 1);
      widthTotal += currentWidth * count;
      print("widthTotal  $widthTotal");
      if (currentWidth > maxWidth) {
        maxWidth = currentWidth;
        print("maxWidth  $maxWidth ");
      }
    });

    cageArrangement = stackDistribution.entries.map((entry) {
      return '\n- ${entry.value} instalasi dengan ${entry.key} tingkat dengan Jarak antar box $jaraktanam cm ';
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
        biopond.round(),
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

    datatabel.forEach((key, values) {
      for (int value in values) {
        if (value != 50) {
          Rekomendasibanyakpot += 1;
        }
      }
    });

    // Inisialisasi penghitung total elemen
    count = 0;
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
          : 1;

      banyaktanamS = (Rekomendasibanyakpot * (tanamPerCage * maxLevelsTanam));

      maxpipa = count * maxLevelsTanam;
      // print("datatabel ${datatabel} ${count } ${maxLevelsTanam} ${count*maxLevelsTanam!}");
    }
    banyakInstalasi = banyakinstalasiperbaris1 * banyakinstalasiperkolom1;
    // print("datatabel ${datatabel} ${count } ${maxLevelsTanam!} ${count*maxLevelsTanam!!}");

    // if(jaraktanam>=50){
    //   maxLevelsTanamTurun();
    // }
  }

  @override
  Widget build(contexty) {
    aturLayout();

    luasBoxMaggot = cageWidthTanam * 2 * cageLengthTanam;
    Map tetapan = {
      "PKandangBSF": 300,
      "LKandangBSF": 200,
      "TKandangBSF": 200,
      "Telurgr": 20,
      "MaggotKg": 30,
      "EkorMaggot": 20000,
      "PBiopond": 120,
      "LBiopond": 80,
      "TBiopond": 1.5,
      "pakan": 4,
      "LsBiopond": 14400,
    };

    banyakTelurMaggot = double.tryParse(
        (((tetapan["Telurgr"] * luasBoxMaggot) / tetapan["LsBiopond"]) *
                biopond)
            .toStringAsFixed(2))!;
    banyakIkanSisaMaggot = double.tryParse(
        (((tetapan["EkorMaggot"] * luasBoxMaggot) / tetapan["LsBiopond"]) *
                biopond)
            .toStringAsFixed(2))!;

    beratIkanSisaAwalMaggot = double.tryParse(
        (((tetapan["MaggotKg"] * luasBoxMaggot) / tetapan["LsBiopond"]) *
                biopond)
            .toStringAsFixed(2))!;

    pakanMaggot = double.tryParse(
        (((tetapan["pakan"] * luasBoxMaggot) / tetapan["LsBiopond"]) * biopond)
            .toStringAsFixed(2))!;

    beratPakanMaggot = double.tryParse(
        ((tetapan["pakan"] * luasBoxMaggot) / tetapan["LsBiopond"])
            .toStringAsFixed(2))!;

    // List<Map<String, dynamic>> periode =
    //     JenisBatteray.values.toList()[indexJb][1];

    // print("lolal${MyDataFilterOBJ!.kategoriRumusKu.toList().where((element) => element.id== 8).toList()[0].nama} ${MyDataFilterOBJ!.kategoriRumusKu.toList().length}");
    _generateDataMagoot();

    //
    //   if (MyDataFilterOBJ!.propertyLainnya["ukuranPotCostume"] == false) {
    //     tanamPerCage = 1;
    //     cageWidthTanam = 31; // cm
    //     cageHeightTanam = 8; // cm
    //     cageLengthTanam = 40; // cm
    //     PanjangTempatTanam = 40;
    //     maxLevelsTanam = 3;
    //   }
    //
    //   if (MyDataFilterOBJ!.propertyLainnya["ukuranPotCostume"] == false) {
    //     tanamPerCage = tanamPerCage;
    //   cageWidthTanam = 31; // cm
    //   cageHeightTanam = 8; // cm
    //   cageLengthTanam = 40; // cm
    //   PanjangTempatTanam = 40;
    //   maxLevelsTanam = 3;
    //   }
    //
    // int cagesRequired = (biopond / tanamPerCage).ceil();
    // perkirranPakanBanyakTanaman = biopond * 100;
    // int fullStacks = cagesRequired ~/ maxLevelsTanam;
    // int remainderCages = cagesRequired % maxLevelsTanam;
    //
    // // Menyimpan susunan Pot dalam Map
    // Map<int, int> stackDistribution = {};
    // if (fullStacks > 0) {
    // stackDistribution[maxLevelsTanam] = fullStacks;
    // }
    // if (remainderCages > 0) {
    // stackDistribution[remainderCages] = 1;
    // }
    //
    // int widthTotal = 0;
    //   int maxWidth = 0;
    //   stackDistribution.forEach((levels, count) {
    //     int currentWidth = ((cageWidthTanam + 10) * levels) + 5;
    //     widthTotal += currentWidth * count;
    //     if (currentWidth > maxWidth) {
    //       maxWidth = currentWidth;
    //     }
    //   });
    //
    // String cageArrangement = stackDistribution.entries.map((entry) {
    // return '\n- ${entry.value} instalasi dengan ${entry.key} tingkat Biopond Box dengan Jarak tanam ${jaraktanam} cm ';
    // }).join('');
    //
    //   Map<String, List<int>> datatabel = proses2(
    //       PanjangTempatTanam,
    //       // panjangs
    //       biopond.round(),
    //       // totalChickens
    //       tanamPerCage,
    //       // chickensPerCage
    //       maxLevelsTanam,
    //       // maxLevels
    //       maxWidth,
    //       // cageWidth
    //       cageHeightTanam,
    //       // cageHeight
    //       l,
    //       // lebar
    //       p,
    //       // panjang
    //       cageLengthTanam,
    //       // p1
    //       50,
    //       // p2
    //       stackDistribution // stackDistribution
    //   );
    //
    // Rekomendasibanyakpot = 0;
    // datatabel.forEach((key, values) {
    // for (int value in values) {
    // if (value != 50) {
    // Rekomendasibanyakpot += 1;
    // }
    // }
    // });

    return SingleChildScrollView(
        controller: _parentScrollController,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: defaultPadding / 2),
          child: Obx(() {
            // a();
            return Column(
              children: [
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
                                      children: List.generate(
                                          List.of(filtersdata[
                                                      c.selectedItemCalcT.value]
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
                                                height: 50,
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
                                                      BorderRadius.circular(10),
                                                ),
                                                child: Center(
                                                    child: Text(
                                                  "Proses ${index + 1}",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
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
                CalculationWidget(
                  onChange: (Map<String, dynamic> hasil) {
                    print(hasil);

                    Future.microtask(() {
                      setState(() {});
                    });

                    hasila = hasil;

                    datavar = hasila['Variabel'];
                    MyDataFilterOBJ!.propertyLainnya["luasMedia"] = datavar;

                    // print("satuan datavarmedia ${datavarmedia} $l");
                    if (l == 0 || p == 0) {
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

                    indexMediaLahan = hasila["Index Bidang"];
                    MyDataFilterOBJ!.propertyLainnya["tampungan"]
                        ["indexBentukMediaTanam"] = indexMediaLahan;
                    // indexInt =  1;

                    MyDataFilterOBJ!.propertyLainnya["satuanMediaLahan"][0] =
                        hasila['satuan'];
                    satuans = hasila['satuan'];

                    MyDataFilterOBJ!.luas = hasila['Hasil'].toString();

                    print("satuan ${MyDataFilterOBJ!.luas}");

                    hitunglocal();
                  },
                  mediaIndex: 0,
                  warna: warnas(
                      dataKategoriMenuRawatan[c.indexMenuRawatan.value]
                          .colorku[0]),
                  datass: datavar,
                  indexbidang: 1,
                  judul: 'Ukuran lahan',
                  satuan: satuans,
                  dinamis: false,
                  hasil: double.tryParse(MyDataFilterOBJ!.luas)!,
                ),
                SizedBox(
                  height: defaultPadding / 2,
                ),
                imageCostum(
                    "assets/images/MenuRawatan/RawatTanam/kandangAzolla.png"),
                SizedBox(
                  height: defaultPadding / 2,
                ),
                fieldoBaterai[3],
                (biopond > tanamPerCage * maxLevelsTanam * banyakInstalasi)
                    ? Container(
                        padding: EdgeInsets.all(16.0),
                        margin: EdgeInsets.all(defaultPadding / 2),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8.0),
                          border: Border.all(color: Colors.red, width: 2),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 8.0,
                              offset: Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.close, color: Colors.red),
                                SizedBox(width: 10),
                                Text(
                                  'Peringatan',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            Text(
                              'Jumlah box biopond melebihi maksimal lahan yang ada dengan maksimal $maxLevelsTanam tingkat'
                              'Apakah Anda masih ingin melanjutkan dengan jumlah box biopond yang ada '
                              'atau sesuai dengan jumlah box biopond yang sudah direkomendasikan?',
                            ),
                            SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Expanded(
                                  child: ElevatedButton(
                                    onPressed: () {
                                      // Tindakan jika pengguna memilih melanjutkan
                                      Future.microtask(() {
                                        setState(() {
                                          print(
                                              "text ${myControlerssoBatrai[3].text}");

                                          // myControlerssoBatrai[3].text = (tanamPerCage*maxLevelsTanam!*banyakInstalasiPerbaris).toString();
                                          // biopond =
                                          // int.tryParse(
                                          //     myControlerssoBatrai[
                                          //     3]
                                          //         .text)!;
                                          // dataVariabelbaterai["banyak Box Maggot : "] =
                                          //     biopond
                                          //         .toString();
                                        });
                                      });
                                    },
                                    child: Text('Lanjutkan',
                                        style: TextStyle(fontSize: 10)),
                                  ),
                                ),
                                Expanded(
                                  child: ElevatedButton(
                                    onPressed: () {
                                      // Tindakan jika pengguna memilih sesuai rekomendasi
                                      Future.microtask(() {
                                        setState(() {
                                          myControlerssoBatrai[3].text =
                                              (tanamPerCage *
                                                      maxLevelsTanam *
                                                      banyakInstalasi)
                                                  .toString();
                                          biopond = int.tryParse((tanamPerCage *
                                                  maxLevelsTanam *
                                                  banyakInstalasi)
                                              .toString())!;

                                          dataVariabelbaterai[
                                                  "banyak Box Maggot : "] =
                                              biopond.toString();
                                        });
                                      });
                                    },
                                    child: Text(
                                      'Sesuai Rekomen',
                                      style: TextStyle(fontSize: 10),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    : Container(),
                SizedBox(
                  height: defaultPadding / 2,
                ),
                (double.tryParse(MyDataFilterOBJ!.luas)! < 400)
                    ? (double.tryParse(MyDataFilterOBJ!.luas)! < 0)
                        ? Container()
                        : Column(
                            children: [
                              SizedBox(
                                height: defaultPadding / 2,
                              ),
                              (cageLengthTanam != 0 &&
                                      cageHeightTanam != 0 &&
                                      cageWidthTanam != 0)
                                  ? Card(
                                      child: Padding(
                                        padding:
                                            EdgeInsets.all(defaultPadding / 2),
                                        child: Column(
                                          children: [
                                            SizedBox(
                                              height: defaultPadding / 2,
                                            ),
                                            Text(
                                              "Perkiraan Pemetaan tempat Rak Biopond luas lahan ${double.tryParse(MyDataFilterOBJ!.luas)!.toStringAsFixed(0)} m²",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black54,
                                                fontSize: heightfit(sT26),
                                              ),
                                            ),
                                            SizedBox(
                                              height: defaultPadding / 2,
                                            ),
                                            PatternGrid2(
                                              panjangs: PanjangTempatTanam,
                                              // Panjang jalan tengah dalam cm
                                              p2: 50,
                                              // Lebar jalan tengah dalam cm
                                              lebar: l,
                                              panjang: p,

                                              onChangeState: (int ik) {
                                                Future.microtask(() {
                                                  //             // setState(() {
                                                  //               banyakAyam = double.tryParse(ik.toString())!;
                                                  //             // });
                                                });
                                              },
                                              prosess: datatabel,
                                              lebars: maxWidth,

                                              // Jumlah ayam per kandang
                                            )
                                          ],
                                        ),
                                      ),
                                    )
                                  : Text(
                                      "Tidak ada karena ukuran biopond box ada yang 0",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black54,
                                        fontSize: heightfit(sT26),
                                      ),
                                    ),
                            ],
                          )
                    : cardWithImg(
                        "Formasi Box ${double.tryParse(MyDataFilterOBJ!.luas)! > 400 ? " terlalu luas" : "luasan m² ${double.tryParse(MyDataFilterOBJ!.luas)!}"}",
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
                cardWithImg(
                    "box Mgot",
                    40,
                    Container(
                      child: Column(
                        children: [
                          Text(
                            // "Rekomendasi ${mediaTANAM} :\n$cageArrangement\n- pertempat ada ${namaKategoriYes ? tanamPerCage : "${tanamPerCage} Tanaman"} ${namaKategoriYes ? mediaTANAM : "per panjang Pipa ${PanjangTempatTanam} cm   "} ",
                            "Rekomendasi Box :\n"
                            "$cageArrangement",
                            // "- per instalasi ada ${namaKategoriYes ? tanamPerCage : "${tanamPerCage} Tanaman"} ${namaKategoriYes ? mediaTANAM : ""} ",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: heightfit(sT16),
                            ),
                          ),
                          Text(
                            "\nPenjelas: \n1 instalasi box Mgot = Mapksimal $maxLevelsTanam Tingkat Rak\n1 Tingkat Rak = penjang $PanjangTempatTanam cm \nPanjang $PanjangTempatTanam cm = ${tanamPerCage}x box Mgot dengan jarak antar box $jaraktanam cm",
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              color: Colors.white,
                              fontStyle: FontStyle.italic,
                              fontSize: heightfit(sT12),
                            ),
                          ),
                          Text(
                            "\nDari luas ${MyDataFilterOBJ!.luas} m²: \n- Rekomendasi maksimal $maxLevelsTanam tingkat\n"
                            "\nJadi Maksimal box yang dapat ditempatkan dilahan seluas ${MyDataFilterOBJ!.luas} m²: ${tanamPerCage * maxLevelsTanam * banyakInstalasi} box dan maksimal $maxLevelsTanam tingkat",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: heightfit(sT16),
                            ),
                          ),
                          SizedBox(
                            height: defaultPadding,
                          ),
                          SizedBox(
                            height: defaultPadding / 2,
                          ),
                        ],
                      ),
                    )),
                Containe(0),
                Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(defaultPadding / 2),
                      child: imageCostum(
                          "assets/images/MenuRawatan/RawatTanam/box.jpg"),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      left: 0,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: defaultPadding / 2),
                        child: Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: heightfit(defaultPadding / 2),
                              vertical: heightfit(defaultPadding / 2)),
                          height: 60,
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
                              child: Text(
                            "${biopond}x biopond box",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: heightfit(sT16),
                            ),
                          )),
                        ),
                      ),
                    ),
                  ],
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
                                    cardWithImg(
                                        " ${banyakTelurMaggot}gr",
                                        40,
                                        Container(
                                          child: Text(
                                            "- Rekomendasi banyak telur ${banyakTelurMaggot}gr",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                              fontSize: heightfit(sT16),
                                            ),
                                          ),
                                        )),

                                    // fieldoBaterai[0],
                                    // fieldoBaterai[1],
                                    // fieldoBaterai[3],
                                    // RichText(
                                    //     text: TextSpan(children: [
                                    //   TextSpan(
                                    //     text:
                                    //         "Sisa Ikan yang masih hidup Berdasarkan Survival Rate (%) \n",
                                    //     style: TextStyle(
                                    //       fontWeight: FontWeight.bold,
                                    //       color: kTextColor,
                                    //       fontSize: heightfit(sT16),
                                    //     ),
                                    //   ),
                                    //   TextSpan(
                                    //     text:
                                    //         "Contoh Perhitungannya jika awal bibit ikan ditebar adalah 1000 dan Survival Rate 95% maka ikan yang masih hidup adalah (1000*95/100 = 950 Ikan yang masih bertahan hidup)",
                                    //     style: TextStyle(
                                    //       fontStyle: FontStyle.italic,
                                    //       color: kTextColor,
                                    //       fontSize: heightfit(sT14),
                                    //     ),
                                    //   ),
                                    // ])),
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
                                          "Perkiraan sekitar jadi : ${banyakIkanSisaMaggot.toStringAsFixed(1)} ekor Maggot",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                            fontSize: heightfit(sT18),
                                          ),
                                        )),
                                      ),
                                    ),
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
                                          "Perkiraan jadi sekitar bobot : ${beratIkanSisaAwalMaggot}Kg Maggot",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                            fontSize: heightfit(sT18),
                                          ),
                                        )),
                                      ),
                                    ),
                                  ],
                                ),
                                Containe(1)
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
                            text: "Pemberian Pakan \n",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: kTextColor,
                              fontSize: heightfit(sT26),
                            ),
                          ),
                          TextSpan(
                            text:
                                "Perkiraan pakan perharinya sesuai dengan berat maggot \n",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: kTextColor,
                              fontSize: heightfit(sT16),
                            ),
                          ),
                          TextSpan(
                            text: "\nPakan yang disarankan :  \n"
                                "\nLimbah sayuran, yang sudah dibusukkan atau dihaluskan \n"
                                "\nLimbah Buah-buahan, yang dihaluskan atau dicacah \n "
                                "\nSisa Makanan dari rumuh, sekolah, warung, hotel  \n"
                                "\nSisa Limbah Industri, ampas tahu, sisa roti, sisa sosis \n"
                                "\nKotoran-kotoran hewan,seperti kotoran ayam, kambing, kelinci, sapi, bangkai ikan \n"
                                "\n(Jika becek gunakan ampas kelapa, dedak, bekas kayu gergaji) ",
                            style: TextStyle(
                              fontStyle: FontStyle.italic,
                              color: kTextColor,
                              fontSize: heightfit(sT14),
                            ),
                          ),
                        ])),
                        // fieldoBaterai[1],

                        // Column(
                        //   children: [
                        //     cardWithImg(
                        //         "Fase ${_data.toList().map((e) => e.agenda).toSet().toList()[0]}: Rata-rata Pakan yang diberikan: \n\n${double.tryParse((_data.toList().where((element) => element.agenda == _data.toList().map((e) => e.agenda).toSet().toList()[0]).toList().map((e) => e.pakanKg).toList().reduce((value, element) => value + element) / _data.toList().length).toString())!.toStringAsFixed(1)} Kg/2 Hari ",
                        //         30,
                        //         Container(
                        //           child: Column(
                        //             children: [
                        //               Text(
                        //                 "Kebutuhan Pakan untuk per 2 hari selama 1 Minggu",
                        //                 style: TextStyle(
                        //                   fontWeight: FontWeight.bold,
                        //                   color: Colors.white,
                        //                   fontSize: heightfit(sT16),
                        //                 ),
                        //               ),
                        //             ],
                        //           ),
                        //         )),
                        //     cardWithImg(
                        //         "Periode ${_data.toList().map((e) => e.agenda).toSet().toList()[1]}: Rata-rata Pakan yang diberikan: \n\n${double.tryParse((_data.toList().where((element) => element.agenda == _data.toList().map((e) => e.agenda).toSet().toList()[1]).toList().map((e) => e.pakanKg).toList().reduce((value, element) => value + element) / _data.toList().length).toString())!.toStringAsFixed(1)} Kg/2 Hari ",
                        //         30,
                        //         Container(
                        //           child: Column(
                        //             children: [
                        //               Text(
                        //                 "Kebutuhan Pakan untuk per 2 harinya selama 1 Minggu",
                        //                 style: TextStyle(
                        //                   fontWeight: FontWeight.bold,
                        //                   color: Colors.white,
                        //                   fontSize: heightfit(sT16),
                        //                 ),
                        //               ),
                        //             ],
                        //           ),
                        //         ))
                        //   ],
                        // ),
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
                                                    "Masa pertubuhan maggot dari telur sampai larva menjelang prepupa itu : 2 Minggu-an \n",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: kTextColor,
                                                  fontSize: heightfit(sT16),
                                                ),
                                              ),
                                            ])),
                                            cardWithImg(
                                                "Perkiraan pakan per-harinya seberat ${beratIkanSisaAwalMaggot.toStringAsFixed(2)}Kg Maggot, berikan pakan sebanyak :",
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
                                                      Text(
                                                        "> $pakanMaggot Kg Sampah Organik\n",
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.white,
                                                          fontSize:
                                                              heightfit(24),
                                                        ),
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
                // Print conclusions
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
                      DataColumn(label: Text('Hari')),
                      DataColumn(label: Text('Pakan (kg)')),
                    ],
                    rows: _data.map((data) {
                      return DataRow(
                        cells: [
                          DataCell(Text(data.agenda)),
                          DataCell(Text(data.hari.toString())),
                          DataCell(Text(data.pakanKg.toString())),
                        ],
                      );
                    }).toList(),
                  ),
                ),

                SizedBox(
                  height: defaultPadding / 2,
                ),
                Padding(
                  padding: EdgeInsets.all(defaultPadding / 2),
                  child: Container(
                    padding: EdgeInsets.all(defaultPadding / 2),
                    decoration: BoxDecoration(
                      color: warnas(List.of(
                              filtersdata[c.selectedItemCalcT.value].studiKasus)
                          .map((e) => e.values)
                          .toList()[0]
                          .first["warna"]),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                        child: Text(
                      "Hari berikutnya : ${pakanMaggot}Kg selama belum menjadi pupa (Jika pakan sebelumnya masih banyak jangan tambahkan pakan lagi agar mengurangi bau busuk pada media)",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: heightfit(sT18),
                      ),
                    )),
                  ),
                ),
                SizedBox(
                  height: defaultPadding / 2,
                ),
                Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(defaultPadding / 2),
                      child: imageCostum(
                          "assets/images/MenuRawatan/RawatTanam/kandang.jpg"),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      left: 0,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: defaultPadding / 2),
                        child: Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: heightfit(defaultPadding / 2),
                              vertical: heightfit(defaultPadding / 2)),
                          height: 60,
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
                              child: Text(
                            "${biopond}x Waring Mgot",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: heightfit(sT16),
                            ),
                          )),
                        ),
                      ),
                    ),
                  ],
                ),

                cardWithImg(
                    "Fase pupa ",
                    30,
                    Container(
                      child: Column(
                        children: [
                          Text(
                            "Pada fase ini maggot memerlukan waktu sekitar tiga sampai tujuh hari untuk bermetamorfosis menjadi lalat BSF\n\nPindahkan ke kandang Lalat bsf untuk lanjut ke tahap fase bertelur, Ukuran kandang yang direkomendasi dengan banyak box : ",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: heightfit(sT16),
                            ),
                          ),
                          Text(
                            "\n${biopond * (50 * 50 * 100) / 1000000} m³ ",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: heightfit(30),
                            ),
                          ),
                        ],
                      ),
                    )),

                SizedBox(
                  height: defaultPadding / 2,
                ),
                // cardWithImg(
                //     "Perkiraan Keuntungan Rp.${formatRupiah (((beratIkanSisaAwalMaggot * pakanMaggot)*double.tryParse(MyDataFilterOBJ!.propertyLainnya["ketebalanTanah"])!).toString())}",
                //     30,
                //     Container(
                //       child: Column(
                //         children: [
                //           Container(
                //               padding: EdgeInsets.all(defaultPadding/2),
                //               decoration: BoxDecoration(
                //                   color: Colors.white,
                //                   borderRadius: BorderRadius.only(
                //                       bottomLeft: Radius.circular(10),
                //                       bottomRight: Radius.circular(10),
                //                       topLeft: Radius.circular(10),
                //                       topRight: Radius.circular(10)),
                //                   // border:
                //                   //     Border.all(color: kTextColor.withOpacity(.8), width: .2)
                //                   boxShadow: [
                //                     BoxShadow(
                //                         blurRadius: 10,
                //                         offset: Offset(-1, 8),
                //                         color: Colors.green.withOpacity(.3))
                //                   ]),
                //               child: fieldoBaterai[5]),
                //           SizedBox(height: defaultPadding/2,),
                //           Text(
                //             "Perkiraan keuntungan maggot adalah hasil dari total bobot maggot saat panen dikalikan dengan harga pasar",
                //
                //             style: TextStyle(
                //               fontWeight: FontWeight.bold,
                //               color: Colors.white,
                //               fontSize: heightfit(sT16),
                //             ),
                //           ),
                //
                //         ],
                //       ),
                //     )),

                SizedBox(
                  height: defaultPadding,
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
                            onNotification: (ScrollNotification notification) {
                              if (notification is ScrollEndNotification) {
                                if (_childScrollController.position.atEdge) {
                                  if (_childScrollController.position.pixels ==
                                      0) {
                                    // At the top of the child scroll
                                    // widget.parentController.jumpTo(widget.parentController.offset - 30);
                                    _parentScrollController.animateTo(
                                      _parentScrollController.offset -
                                          SizeConfig.screenHeight! / 4,
                                      duration:
                                          const Duration(milliseconds: 300),
                                      curve: Curves.easeInOut,
                                    );
                                  } else {
                                    // At the bottom of the child scroll
                                    // widget.parentController.jumpTo(widget.parentController.offset + 30);
                                    _parentScrollController.animateTo(
                                      _parentScrollController.offset +
                                          SizeConfig.screenHeight! / 4,
                                      duration:
                                          const Duration(milliseconds: 300),
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
                                scrollDirection: Axis.vertical,
                                // padding: const EdgeInsets.symmetric(horizontal: 56),
                                addRepaintBoundaries: true,
                                itemBuilder: (context, indexFixs) {
                                  // final item = dataParentss.toList()[index % widget.items.length];
                                  // dataParentss[indexK].pupuk[indexFixs].hasil = hargaObject["hasilAkhirPerObject"].toString();
                                  return ExpandingCards(
                                    height: 300,
                                    indexFix: indexFixs,
                                    // len: dataParentss[indexK].pupuk.length,
                                    len: MyDataFilterOBJ!
                                        .propertyLainnya["keperluanLainnya"]
                                        .length,
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
                                                        controller:
                                                            TextEditingController(
                                                                text: "${MyDataFilterOBJ!.propertyLainnya["keperluanLainnya"][indexFixs]["Nama Pengeluaran"]}"
                                                                    .toString()),
                                                        satuan: "",
                                                        title:
                                                            "Nama Pengeluaran \n",
                                                        tema: Colors.black38,
                                                        onStateChange:
                                                            (values) {
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
                                                        inputType:
                                                            TextInputType.text,
                                                        enable: true,
                                                      ),
                                                      Fields(
                                                        controller:
                                                            TextEditingController(
                                                                text: "${MyDataFilterOBJ!.propertyLainnya["keperluanLainnya"][indexFixs]["Beban Biaya"]}"
                                                                    .toString()),
                                                        satuan: "Rp/Kg",
                                                        title: "Harga \n",
                                                        tema: Colors.black38,
                                                        onStateChange:
                                                            (values) {
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
                                                        enable: true,
                                                        inputType: TextInputType
                                                            .number,
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
                                t <
                                    MyDataFilterOBJ!
                                            .propertyLainnya["keperluanLainnya"]
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
                                    padding: EdgeInsets.all(defaultPadding / 2),
                                    child: Container(
                                      height: 50,
                                      decoration: BoxDecoration(
                                        color: warnas(List.of(filtersdata[
                                                    c.selectedItemCalcT.value]
                                                .studiKasus)
                                            .map((e) => e.values)
                                            .toList()[0]
                                            .first["warna"]),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Center(
                                          child: Text(
                                        "${(MyDataFilterOBJ!.propertyLainnya["keperluanLainnya"][t]["Nama Pengeluaran"] == "Pakan/Kg") ? "Rp. ${formatRupiah((double.tryParse(MyDataFilterOBJ!.propertyLainnya["keperluanLainnya"][t]["Beban Biaya"])! * beratPakanMaggot).toString())}" : "Rp. ${formatRupiah(MyDataFilterOBJ!.propertyLainnya["keperluanLainnya"][t]["Beban Biaya"].toString())}"} ",
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
                      // "${formatRupiah((hitungHarga(aDosis, hargaDosis).values.toList().reduce((value, element) => value + element) + (hargaTotalpH + hitungTotalBiaya(beratPakanMaggot))).toString())}"
                      "${formatRupiah((hargaTotalpH + hitungTotalBiaya(beratPakanMaggot)).toString())}",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    )),
              ],
            );
          }),
        ));
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
                        filterCategorybyPerusahaan()[
                            (c.indexMenuRawatan.value == 3 ||
                                    c.indexMenuRawatan.value == 4 ||
                                    c.indexMenuRawatan.value == 5)
                                ? 0
                                : MyDataFilterOBJ!.propertyLainnya["tampungan"]
                                    ["indexperusahaan"]],
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
