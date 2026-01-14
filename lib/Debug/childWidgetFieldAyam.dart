import 'dart:convert';

import 'package:rawatt/Debug/childWidgetFieldTanaman.dart';
import 'package:rawatt/Debug/formasiKandang.dart';
import 'package:rawatt/Debug/managePakan.dart';
import 'package:rawatt/Debug/uangPerSatuan.dart';
import 'package:rawatt/Debug/widget_mediaLahan.dart';
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

class childWidgetFieldAyam extends StatefulWidget {
  final Function(String) onChangeState;
  final bool? info;
  const childWidgetFieldAyam(
      {super.key, required this.onChangeState, this.info});

  @override
  State<childWidgetFieldAyam> createState() => _childWidgetFieldAyamState();
}

// Map dataRumusLuasLahan = {};
// double hasilLahan = 0.0;
// // int indexObjectIndexSelectedEdit = 0;

BuildContext? contexty;

Map<String, double> hitungKomposisi(double proteinPakanPabrik,
    double proteinMaggot, double kebutuhanProtein, double x) {
  // Misalkan x adalah jumlah pakan pabrik dan y adalah jumlah maggot

  // Protein yang dihasilkan dari x gram pakan pabrik
  double proteinDariPakanPabrik = proteinPakanPabrik / 100;

  // Protein yang dihasilkan dari y gram maggot
  double proteinDariMaggot = proteinMaggot / 100;

  // Misalkan kita mulai dengan 50 gram pakan pabrik

  // Hitung jumlah y yang dibutuhkan untuk melengkapi protein
  double y =
      (kebutuhanProtein - (proteinDariPakanPabrik * x)) / proteinDariMaggot;

  // Total berat campuran (x + y)
  double totalCampuran = x + y;

  // Persentase masing-masing dalam campuran
  double persenPakanPabrik = (x / totalCampuran) * 100;
  double persenMaggot = (y / totalCampuran) * 100;

  return {
    'pakanPabrik': x,
    'maggot': y,
    'persenPakanPabrik': persenPakanPabrik,
    'persenMaggot': persenMaggot
  };
}

void hitungProsesAyam() {
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
    hargaTotalMaggot = 0;
  } else {
    hargaTotalMaggot = hargaMaggot * pakanMaggots;
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
          .propertyLainnya["adaPakanAlternatif"] =
      copiedData!.propertyLainnya["adaPakanAlternatif"];

  datafilterMyData1![c.ObjectIndexSelectedEdit.value]
          .propertyLainnya["adaPakanAlternatifLainnya"] =
      copiedData!.propertyLainnya["adaPakanAlternatifLainnya"];

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

  datafilterMyData1![c.ObjectIndexSelectedEdit.value]
          .propertyLainnya["Edit Nilai Rekomendasi"] =
      copiedData!.propertyLainnya["Edit Nilai Rekomendasi"];

  datafilterMyData1![c.ObjectIndexSelectedEdit.value]
          .propertyLainnya["tambah pakan alternatif"] =
      copiedData!.propertyLainnya["tambah pakan alternatif"];

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
      .propertyLainnya["luasMedia"] = copiedData!.propertyLainnya["luasMedia"];

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
      //         (hargaTotalpH + hitungTotalBiaya(beratPakan)))
      //     .toString();

      ((hitungTotalBiaya(
    hargaKandangTotal,
    hargaAyamTotal,
  ))).toString();
}
// KategoriRumus? datamediatanamtam;

double hitungTotalBiaya(double totalKandang, double totalayam) {
  double total = copiedData!.propertyLainnya["keperluanLainnya"].fold(0.0,
      (previousValue, element) {
    double biaya = double.tryParse(element['Beban Biaya'].toString())!;
    if (element['Nama Pengeluaran'] == 'Kandang') {
      biaya = totalKandang;
    } else if (element['Nama Pengeluaran'] == 'Ayam petelur') {
      biaya = totalayam;
    }
    return previousValue + biaya;
  });
  double totalBiaya = total;

  return totalBiaya;
}

// List<KategoriRumus> datakategorirum = [];

String changePath(String path) {
  // Memisahkan bagian-bagian dari path
  List<String> parts = path.split('/');

  // Memisahkan nama file dan ekstensi
  String filename = parts.last;
  List<String> filenameParts = filename.split('.');

  // Menambahkan "Ayam_" ke nama file sebelum ekstensi
  String newFilename = "Ayam_${filenameParts.first}.${filenameParts.last}";

  // Mengganti nama file pada bagian terakhir dari path
  parts[parts.length - 1] = newFilename;

  // Menggabungkan kembali bagian-bagian dari path
  return parts.join('/');
}

String hargapH = "0";
double hargaTotalpH = 0;

double hargaMaggot = 0;
double hargaTotalMaggot = 0;

double pakanMaggots = 0;
double perkirranPakanBanyakAyam = 0;

double hargaAyamTotal = 0;
double hargaKandangTotal = 0;

class _childWidgetFieldAyamState extends State<childWidgetFieldAyam> {
  double populasiTanam1Ha = 0;
  double populasiPetak = 0;

  double hargaperKgPabrik = 0;
  double hargaperKgMaggot = 0;
  double hargaperKgPaku = 0;

  double TotalhargaperKgPabrik = 0;
  double TotalhargaperKgMaggot = 0;
  double TotalhargaperKgPaku = 0;

  int tanamPerCage = 8;
  int cageWidthTanam = 40; // cm
  int cageHeightTanam = 45; // cm

  int cageLengthTanam = 15; // cm
  int PanjangTempatTanam = 120;
  int maxLevelsTanam = 1;
  int maxWidth = 0;
  int widthTotal = 0;
  int? highestNumber;
  int maxpipa = 0;
  int banyakInstalasi = 0;
  Map<String, List<int>> datatabel = {};
  String cageArrangement = "";
  int _currentValue = 1;
  int banyaktanamS = 0;
  int count = 0;

  int banyakinstalasiperbaris1 = 0;
  int banyakinstalasiperkolom1 = 0;

  int Rekomendasibanyakpot = 0;

  int indexMediaLahan = 0;

  double beratPakan = 0;
  double banyakAyam = 0;

  double banyakTelurperAyam = 0;
  double untungPerharinya = 0;
  double keuntunganBersihTiapBulan = 0;
  double totalkeuntunganBersih = 0;
  double umurAyam = 0;
  double beratIkanSisaAwal = 0;
  double beratIkanSisaAkhir = 0;

  int cagesRequired = 0;
  int fullStacks = 0;
  int remainderCages = 0;

// Map<dynamic, dynamic> hargaDosis = {};
// Map<dynamic, dynamic> aDosis = {};

// Map<String, String> hagaDosis = {};

  final ScrollController _childScrollController = ScrollController();
  final ScrollController _parentScrollController = ScrollController();
  List<Widget> fieldoBaterai = [];
  List<TextEditingController> myControlerssoBatrai = [];
  Map dataVariabelbaterai = {};
  Map dataVariabelbateraiPlus = {};
  List myControlerssoBatraiPlus = [];
  List fieldoBateraiPlus = [];
  int indexJb = 0;
  Map JenisBatteray = {
    "Ayam Petelur": [
      15.0,
      [
        {'periode': 1, 'presentase': 10, 'interval': 4, 'agenda': 'Awal Tebar'},
        {'periode': 2, 'presentase': 50, 'interval': 6, 'agenda': 'Sortir'},
        {'periode': 3, 'presentase': 40, 'interval': 4, 'agenda': 'Panen'}
      ],
      "Ketetapan perkiraan 1000 ikan dengan luas 15 m kubik"
    ],
    "Ayam Pedaging": [
      150.0,
      [
        {'periode': 1, 'presentase': 10, 'interval': 4, 'agenda': 'Awal Tebar'},
        {'periode': 2, 'presentase': 50, 'interval': 10, 'agenda': 'Sortir'},
        {'periode': 3, 'presentase': 40, 'interval': 6, 'agenda': 'Panen'}
      ],
      "Ketetapan perkiraan 1000 ikan dengan luas 150 m kubik"
    ]
  };

  MyData? MyDataFilterOBJ;
  List? dataPengeluaran;
  // void prosesPh(){
  //
  // }
  //

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
    _childScrollController.dispose();
    _parentScrollController.dispose();

    // datamediatanamtam = dataKategoriRumus1.where((element) => element.id_MenuRawatan==c.indexMenuRawatan.value && element.idMediaTanam == 0).toList().where((element) => element.nama == "Persegi Panjang").toList().first;
  }

  Widget Containe(int indexFixs, String satuan) {
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
              satuan:
                  "Rp/${MyDataFilterOBJ!.propertyLainnya["keperluanLainnya"][indexFixs]["Nama Pengeluaran"]}",
              // "${indexFixs == 0 ? "Rp/Kandang" : indexFixs == 1 ? "Rp/total bibit" : "Rp/Kg"}",
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
              inputType: TextInputType.number,
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
  }

  Map datavar = {"panjang": 0, "lebar": 0};
  Map hasila = {};
  int indexInt = 0;
  String satuans = "m";
  int p = 0;
  int l = 0;
  int? selectedPakan = 0;
  MyData? dataawal;
  bool isResetProtein = false;
  Map dataPakan = {};

  // double calculateY(int x, int maxX) {
  //   // Menghitung y di mana y besar saat x kecil dan sebaliknya, dengan kisaran 1 sampai 4
  //   double y = 4 - (3.0 * x / maxX);
  //
  //   // Memastikan y tetap dalam kisaran 1 sampai 4
  //   if (y < 1) y = 1;
  //   if (y > 4) y = 4;
  //
  //   return y;
  // }

  // void maxLevelsTanamTurun(){
  //   setState(() {
  //     if ((widthTotal)>l-50){
  //       maxLevelsTanam = calculateY(banyakAyam.toInt(),tanamPerCage*maxLevelsTanam*banyakInstalasi).toInt();
  //       print("w maxLevelsTanam; widthTotal<p ${ banyaktanamS} <${maxWidth} ${widthTotal}> ${l-50} ${calculateY(banyakAyam.toInt(),tanamPerCage).toInt()} ${maxLevelsTanam} $maxWidth<${widthTotal}");
  //     }
  //     // else{
  //     //   maxLevelsTanam = 4;
  //     //   print('x: $banyakTanaman, maxLevelsTanam: ${calculateY(banyakAyam.toInt(), 8)}');
  //     //   print("maxLevelsTanam; widthTotal<p ${ banyaktanamS} <${maxWidth} ${widthTotal+50}> ${l} ${maxLevelsTanam} $maxWidth<${widthTotal}");
  //     //
  //     // }
  //   });
  // }
  Map<int, int> stackDistribution = {};
  void aturLayout() {
    stackDistribution = {};
    cageArrangement = "";
    banyaktanamS = 0;
    count = 0;
    banyakinstalasiperbaris1 = 0;
    banyakinstalasiperkolom1 = 0;

    banyakAyam = (double.tryParse(
                MyDataFilterOBJ!.propertyLainnya["peliharaans"].toString())! <
            0)
        ? 1.0
        : double.tryParse(myControlerssoBatrai[3].text)!;

    // if (_isCheckedJt == true) {
    //   jaraktanam = MyDataFilterOBJ!.propertyLainnya["jarakTanam"];
    // } else {
    //   jaraktanam = dataSayur![indexJb].jaraktanam;
    // }

    // if (MyDataFilterOBJ!.propertyLainnya["ukuranPotCostume"] == false) {
    //   // {"panjang": double.tryParse(PanjangTempatTanam.toString())!, "diameter": diameterLubang ,"jarakLubang": 5.0},
    //
    //   (namaKategoriYes)
    //       ? {
    //     (widget.namaCategory == "Tanaman Paku Air")
    //         ? {
    //       jaraktanam = 15,
    //       cageWidthTanam = 31, // cm
    //       cageHeightTanam = 8, // cm
    //       cageLengthTanam = 40, // cm
    //       PanjangTempatTanam = 40,
    //       tanamPerCage = 3,
    //       maxLevelsTanam= 3,
    //       imgInstalasi = "assets/images/MenuRawatan/RawatTanam/kandangAzolla.png",
    //       print("data paku ${jaraktanam}"),
    //     }
    //         : {
    //       cageWidthTanam = 20, // cm
    //       cageHeightTanam = 17, // cm
    //       cageLengthTanam = 28, // cm
    //       PanjangTempatTanam = 28,
    //       tanamPerCage = 1,
    //       maxLevelsTanam= 1,
    //       imgInstalasi = "assets/images/MenuRawatan/RawatTanam/pot.png"
    //
    //     }
    //   }
    //       : {
    //     cageWidthTanam = 3, // cm
    //     cageHeightTanam = 30, // cm
    //     cageLengthTanam = 10, // cm
    //     PanjangTempatTanam = 100,
    //     diameterLubang = 4,
    //     jarakLubang = 5,
    //     tanamPerCage = ((PanjangTempatTanam - diameterLubang) /
    //         (jaraktanam + diameterLubang))
    //         .floor(),
    //     // maxLevelsTanam= 4,
    //     imgInstalasi = "assets/images/MenuRawatan/RawatTanam/kandangHidroponik.png"
    //   };
    // } else {
    //   if (namaKategoriYes == false) {
    //     cageWidthTanam = 3; // cm
    //     cageHeightTanam = 30; // cm
    //     cageLengthTanam = 10; // cm
    //
    //     PanjangTempatTanam =
    //     MyDataFilterOBJ!.propertyLainnya["panjangTempatTanam"];
    //     diameterLubang =
    //     MyDataFilterOBJ!.propertyLainnya["diameterLubang"];
    //     jarakLubang = MyDataFilterOBJ!.propertyLainnya["JarakLubang"];
    //
    //     print("banyak tanam ${tanamPerCage} ${diameterLubang} ${jarakLubang}");
    //
    //
    //   }
    // }

    perkirranPakanBanyakAyam = banyakAyam * 100;

    cagesRequired = (banyakAyam / tanamPerCage).ceil();
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
      int currentWidth = ((cageWidthTanam + 10) * levels) + 5;
      widthTotal += currentWidth * count;
      print("widthTotal  $widthTotal");
      if (currentWidth > maxWidth) {
        maxWidth = currentWidth;
        print("maxWidth  $maxWidth ");
      }
    });

    cageArrangement = stackDistribution.entries.map((entry) {
      return '- ${entry.value} tempat dengan ${entry.key} tingkat kandang\n';
    }).join('');

    // Menghitung lebar total struktur
    // int widthTotal = (cagesRequired > maxLevelsTanam) ? cageWidthTanam * (cagesRequired - maxLevelsTanam + 1) : cageWidthTanam;

    // Menghitung tinggi total struktur
    // int heightTotal = cageHeightTanam *
    //     ((cagesRequired > maxLevelsTanam) ? maxLevelsTanam : cagesRequired);
    //
    // // Menghitung panjang total struktur
    // int lengthTotal =
    //     cageLengthTanam * (fullStacks + (remainderCages > 0 ? 1 : 0));

    // Map<String, List<int>> datatabel = proses2(
    //     cageLengthTanam+0, // panjangs
    //     banyakAyam.round(), // totalChickens
    //     tanamPerCage, // chickensPerCage
    //     maxLevelsTanam, // maxLevelsTanam
    //     cageWidthTanam, // cageWidth
    //     cageHeightTanam, // cageHeightTanam
    //     l, // lebar
    //     p, // panjang
    //     cageLengthTanam, // p1
    //     50, // p2
    //     stackDistribution // stackDistribution
    // );

    datatabel = proses2(
        PanjangTempatTanam,
        // panjangs
        banyakAyam.round(),
        // totalChickens
        tanamPerCage,
        // chickensPerCage
        maxLevelsTanam,
        // maxLevels
        maxWidth,
        // cageWidth
        cageHeightTanam,
        // cageHeightTanam
        int.tryParse(l.toString())!,
        // lebar
        int.tryParse(p.toString())!,
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
      banyakAyam.round(),
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

      banyaktanamS = (Rekomendasibanyakpot * (tanamPerCage * maxLevelsTanam));

      maxpipa = count * maxLevelsTanam;
      // print("datatabel ${datatabel} ${count } ${maxLevelsTanam} ${count*maxLevelsTanam!}");
    }
    banyakInstalasi = banyakinstalasiperbaris1 * banyakinstalasiperkolom1;
    // print("datatabel ${datatabel} ${count } ${maxLevelsTanam} ${count*maxLevelsTanam!}");

    // if(jaraktanam>=50){
    //   maxLevelsTanamTurun();
    // }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dataTampungHasil = {};
    print(
        "index select ${c.indexMenuRawatan.value} ${kategoriRumus.map((e) => e["id_MenuRawatan"])} ${c.ObjectIndexSelectedEdit.value}");
    // MyDataFilterOBJ = datafilterMyData1![c.ObjectIndexSelectedEdit.value];
    // List<MyData> datads = List<MyData>.from(datafilterMyData1!);
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
          ["Kebutuhan Protein Ayam %"],
      'indexAlternatif2': double.tryParse(selectedPakan.toString())!,
      "isPakanAlternatif1Enabled":
          MyDataFilterOBJ!.propertyLainnya["adaPakanAlternatif"],
      "isPakanAlternatif2Enabled":
          MyDataFilterOBJ!.propertyLainnya["adaPakanAlternatifLainnya"]
    };

    copiedData = MyDataFilterOBJ!;

    // Map<String, dynamic> dataMap = MyData.toMap(MyDataFilterOBJ!);
    // copiedData = MyData.fromJson(dataMap);
    dataPengeluaran =
        List.from(copiedData!.propertyLainnya["keperluanLainnya"]);

    if (c.selectedItemCalcT.value != 2) {
      if (MyDataFilterOBJ!.kategoriRumusKu
          .where((element) => element.nama == "Persegi Panjang")
          .isEmpty) {
        //  MyDataFilterOBJ!.kategoriRumusKu.add(dataKategoriRumus1.where((element) => element.id_MenuRawatan==c.indexMenuRawatan.value && element.idMediaTanam == 0).toList().where((element) => element.nama == "Persegi Panjang").toList().first!);
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
            .where((element) => (c.indexMenuRawatan.value == 5)
                ? element.id_MenuRawatan == 1 && element.idMediaTanam == 0
                : element.id_MenuRawatan == c.indexMenuRawatan.value &&
                    element.idMediaTanam == 0)
            .toList();
        print(
            "index select 2 ${MyDataFilterOBJ!.kategoriRumusKu} ${c.ObjectIndexSelectedEdit.value}");
      } else {}
    }

    onPresospH(
        (MyDataFilterOBJ!.propertyLainnya["pHData"]["hasil"] == null)
            ? 0
            : cariValue("pH"),
        'm');

    indexMediaLahan =
        MyDataFilterOBJ!.propertyLainnya["tampungan"]["indexBentukMediaTanam"];
    MyDataFilterOBJ!.propertyLainnya["tampungan"]["indexBentukMediaTanam"] =
        MyDataFilterOBJ!.propertyLainnya["tampungan"]["indexBentukMediaTanam"];
    // indexMediaLahan = 0;

    MyDataFilterOBJ!.propertyLainnya["satuanMediaLahan"][1] =
        MyDataFilterOBJ!.propertyLainnya["satuanMediaLahan"][1];

    MyDataFilterOBJ!.propertyLainnya["satuanMediaLahan"][0] =
        MyDataFilterOBJ!.propertyLainnya["satuanMediaLahan"][0];

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
      // datainputan.value[2] =  MyDataFilterOBJ!.propertyLainnya["pHData"]["hasil"];

      MyDataFilterOBJ!.propertyLainnya["pHData"] =
          MyDataFilterOBJ!.propertyLainnya["pHData"];
    }

    // if ( MyDataFilterOBJ!
    //     .kategoriRumusKu[indexMediaLahan]
    //     .valuess
    //     .isEmpty) {
    //   MyDataFilterOBJ!.kategoriRumusKu[indexMediaLahan].valuess = variablesNew(
    //       MyDataFilterOBJ!.kategoriRumusKu[indexMediaLahan].rumus, 0);
    //
    //   print(
    //       "field 12 12 13 => tidak  ${ MyDataFilterOBJ!.kategoriRumusKu[indexMediaLahan].valuess}");
    // } else if ( MyDataFilterOBJ!
    //     .kategoriRumusKu[indexMediaLahan]
    //     .valuess
    //     .isNotEmpty) {
    //   print(
    //       "field 12 12 13 => ada  ${ MyDataFilterOBJ!.kategoriRumusKu[indexMediaLahan].valuess}");
    // }

    c.id_type_tanah.value =
        MyDataFilterOBJ!.propertyLainnya["tampungan"]["indexJenisTanah"];

    MyDataFilterOBJ!.propertyLainnya["tampungan"]["indexJenisTanah"] =
        MyDataFilterOBJ!.propertyLainnya["tampungan"]["indexJenisTanah"];

    c.indexdropdownPrushn.value =
        MyDataFilterOBJ!.propertyLainnya["tampungan"]["indexperusahaan"];

    MyDataFilterOBJ!.propertyLainnya["tampungan"]["indexperusahaan"] =
        MyDataFilterOBJ!.propertyLainnya["tampungan"]["indexperusahaan"];

    // ==============================================
    //
    print(
        "indexss ${c.indexdropdownjenisPemupukan.value} ${MyDataFilterOBJ!.propertyLainnya["tampungan"]["indexjenisPupuk"]}");
    MyDataFilterOBJ!.propertyLainnya["tampungan"]["indexjenisPupuk"] =
        MyDataFilterOBJ!.propertyLainnya["tampungan"]["indexjenisPupuk"];

    MyDataFilterOBJ!.propertyLainnya["ketebalanTanah"] =
        MyDataFilterOBJ!.propertyLainnya["ketebalanTanah"];

    c.indexdropdownjenisPemupukan.value =
        MyDataFilterOBJ!.propertyLainnya["tampungan"]["indexjenisPupuk"];

    MyDataFilterOBJ!.propertyLainnya["alternatifPakan"] =
        MyDataFilterOBJ!.propertyLainnya["alternatifPakan"];

    MyDataFilterOBJ!.propertyLainnya["adaPakanAlternatif"] =
        MyDataFilterOBJ!.propertyLainnya["adaPakanAlternatif"];

    print("ping${MyDataFilterOBJ!.propertyLainnya["alternatifPakan"]} ");

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
          MyDataFilterOBJ!.propertyLainnya["umur"],
      "Umur Mati (Minggu)": MyDataFilterOBJ!.propertyLainnya["umurMati"],
      "Perkiraan Bobot per Ikan Panen (Gr)":
          MyDataFilterOBJ!.propertyLainnya["hargaJual"],
      // rasio jumlah pakan yang dibutuhkan untuk menghasilkan 1 kg
      "Banyak Ayam : ": MyDataFilterOBJ!.propertyLainnya["peliharaans"],
      "Jenis Ikan": MyDataFilterOBJ!.propertyLainnya["indexJb"],
      "Harga Jual Telur /telur":
          MyDataFilterOBJ!.propertyLainnya["ketebalanTanah"],
    };

    // dataVariabelbateraiPlus =
    //     MyDataFilterOBJ!.propertyLainnya["alternatifPakan"];

    myControlerssoBatraiPlus =
        myControl(MyDataFilterOBJ!.propertyLainnya["alternatifPakan"]);
    fieldoBateraiPlus = fieldso(
        false,
        MyDataFilterOBJ!.propertyLainnya["alternatifPakan"],
        myControlerssoBatraiPlus);

    // {
    // "proteinPakanPabrik": [38.0, "Perkiraan protein pada pakan Pabrik"],
    // "proteinMaggot": [40.0, "Perkiraan protein pada Maggot"],
    // "kebutuhanProtein": [38.0, "Perkiraan protein pada ayam"],
    // "kebutuhanPakanPabrik": [
    // 50.0,
    // "Perkiraan persentase pakan pabrik untuk Ayam"
    // ]
    // }

    myControlerssoBatrai = myControl(dataVariabelbaterai);
    fieldoBaterai = fieldso(false, dataVariabelbaterai, myControlerssoBatrai);

    onPresoqw();
    MyDataFilterOBJ!.propertyLainnya["indexJb"] =
        int.tryParse(MyDataFilterOBJ!.propertyLainnya["indexJb"].toString())!;
    indexJb = MyDataFilterOBJ!.propertyLainnya["indexJb"];
    variablesNew(
        MyDataFilterOBJ!.kategoriRumusKu.toList()[0].rumus, 1500 / 100.round());

    print(
        "sukses${variablesNew(MyDataFilterOBJ!.kategoriRumusKu.toList()[0].rumus, 1500 / 100.round())["p"]}");

    if (MyDataFilterOBJ!.propertyLainnya["luasMedia"].isEmpty) {
      MyDataFilterOBJ!.propertyLainnya["luasMedia"] = datavar;

      print("lols2 $datavar");
    } else {
      datavar = MyDataFilterOBJ!.propertyLainnya["luasMedia"];
      print("lols $datavar");
    }

    if (MyDataFilterOBJ!.propertyLainnya["satuanMediaLahan"][0] == "m") {
      p = (datavar["panjang"] * 100).round();
      l = (datavar["lebar"] * 100).round();
    } else {
      p = (datavar["panjang"]).round();
      l = (datavar["lebar"]).round();
    }

    if (MyDataFilterOBJ!.luas == "") {
      MyDataFilterOBJ!.luas = "0";
    }

    highestNumber = 1;
    maxLevelsTanam = 1;

    hargaperKgPabrik = double.tryParse(MyDataFilterOBJ!
        .propertyLainnya["hargaPerBanyakSatuan"]["hasilrp"]
        .toString())!;

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
            setState(() {
              // maxLevelsTanamTurun();
              aturLayout();
            });
            // maxLevelsTanamTurun();
            // aturLayout();
            // maxLevelsTanamTurun();
            // aturLayout();

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
        MyDataFilterOBJ!.propertyLainnya["alternatifPakan"][MyDataFilterOBJ!
            .propertyLainnya["alternatifPakan"].keys
            .toList()[index]] = (element.text.isEmpty) ? "0" : element.text;

        myControlerssoBatraiPlus =
            myControl(MyDataFilterOBJ!.propertyLainnya["alternatifPakan"]);
        fieldoBateraiPlus = fieldso(
            false,
            MyDataFilterOBJ!.propertyLainnya["alternatifPakan"],
            myControlerssoBatraiPlus);

        // MyDataFilterOBJ!.propertyLainnya["alternatifPakan"] =
        //     dataVariabelbateraiPlus["alternatifPakan"];
        // MyDataFilterOBJListrik!.propertyLainnya = dataVariabelbaterai;
      });

      myControlerssoBatrai.asMap().forEach((index, element) {
        dataB[dataB.keys.toList()[index]] =
            (element.text.isEmpty) ? "0" : element.text;

        myControlerssoBatrai = myControl(dataB);
        fieldoBaterai = fieldso(false, dataB, myControlerssoBatrai);

        dataVariabelbaterai = dataB;
        // MyDataFilterOBJListrik!.propertyLainnya = dataVariabelbaterai;

        MyDataFilterOBJ!.propertyLainnya["umur"] =
            dataVariabelbaterai["Umur mulai pemeliharaan (Minggu)"];
        MyDataFilterOBJ!.propertyLainnya["umurMati"] =
            dataVariabelbaterai["Umur Mati (Minggu)"];
        MyDataFilterOBJ!.propertyLainnya["hargaJual"] =
            dataVariabelbaterai["Perkiraan Bobot per Ikan Panen (Gr)"];
        MyDataFilterOBJ!.propertyLainnya["peliharaans"] =
            dataVariabelbaterai["Banyak Ayam : "];
        MyDataFilterOBJ!.propertyLainnya["ketebalanTanah"] =
            dataVariabelbaterai["Harga Jual Telur /telur"];
        // MyDataFilterOBJ!.propertyLainnya["indexJb"] =
        //     dataVariabelbaterai["Jenis Ikan"];
      });
    });
  }

  @override
  Widget build(contexty) {
    // "hargaJual(Gr)":"hargaJual","fcr":"peliharaans"}

    // banyakAyam =(double.tryParse(
    //     MyDataFilterOBJ!.propertyLainnya["peliharaans"].toString())!<0)?1.0: double.tryParse(
    //     MyDataFilterOBJ!.propertyLainnya["peliharaans"].toString())!;
    // int cagesRequired = (banyakAyam / tanamPerCage).ceil();
    // perkirranPakanBanyakAyam = banyakAyam * 100;
    // int fullStacks = cagesRequired ~/ maxLevelsTanam;
    // int remainderCages = cagesRequired % maxLevelsTanam;

    // Menyimpan susunan kandang dalam Map
    // Map<int, int> stackDistribution = {};
    // if (fullStacks > 0) {
    //   stackDistribution[maxLevelsTanam] = fullStacks;
    // }
    // if (remainderCages > 0) {
    //   stackDistribution[remainderCages] = 1;
    // }

    // String cageArrangement = stackDistribution.entries.map((entry) {
    //   return '- ${entry.value} tempat dengan ${entry.key} tingkat kandang\n';
    // }).join('');
    //
    // // Menghitung lebar total struktur
    // // int widthTotal = (cagesRequired > maxLevelsTanam) ? cageWidth * (cagesRequired - maxLevelsTanam + 1) : cageWidth;
    // int widthTotal = 0;
    // int maxWidth = 0;
    // stackDistribution.forEach((levels, count) {
    //   int currentWidth = cageWidth * levels;
    //   widthTotal += currentWidth * count;
    //   if (currentWidth > maxWidth) {
    //     maxWidth = currentWidth;
    //   }
    // });

    // Menghitung tinggi total struktur
    // int heightTotal =
    //     cageHeightTanam * ((cagesRequired > maxLevelsTanam) ? maxLevelsTanam : cagesRequired);
    //
    // // Menghitung panjang total struktur
    // int lengthTotal = cageLengthTanam * (fullStacks + (remainderCages > 0 ? 1 : 0));

    aturLayout();

    umurAyam = (double.tryParse(MyDataFilterOBJ!.propertyLainnya["umurMati"])! -
            (double.tryParse(MyDataFilterOBJ!.propertyLainnya["umur"])!)) *
        7;

    beratIkanSisaAwal = (umurAyam /
        (double.tryParse(MyDataFilterOBJ!.propertyLainnya["umurMati"]) ?? 1));
    beratIkanSisaAkhir = umurAyam *
        (double.tryParse(MyDataFilterOBJ!.propertyLainnya["hargaJual"])!) /
        1000;
    beratPakan = umurAyam * (perkirranPakanBanyakAyam / 1000);

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
    // print("satua ${l} $l");
    // if (l == 0 || p == 0) {
    //   p = variablesNew(MyDataFilterOBJ!.kategoriRumusKu.toList()![0].rumus,
    //           1500 / 100)["p"][1]
    //       .round();
    //   l = variablesNew(MyDataFilterOBJ!.kategoriRumusKu.toList()![0].rumus,
    //           1500 / 100)["l"][1]
    //       .round();
    // }

    // Map<String, List<int>> datatabel = proses2(
    //     cageLengthTanam+0, // panjangs
    //     banyakAyam.round(), // totalChickens
    //     tanamPerCage, // chickensPerCage
    //     maxLevelsTanam, // maxLevelsTanam
    //     cageWidth, // cageWidth
    //     cageHeightTanam, // cageHeightTanam
    //     l, // lebar
    //     p, // panjang
    //     cageLengthTanam, // p1
    //     50, // p2
    //     stackDistribution // stackDistribution
    // );

    double hargapabrikPerkg = double.tryParse(MyDataFilterOBJ!
        .propertyLainnya["keperluanLainnya"][2]["Beban Biaya"])!;
    double hargapakanPabrikFull =
        ((perkirranPakanBanyakAyam) / 1000 * hargapabrikPerkg);

    hargaKandangTotal = cagesRequired *
        double.tryParse(MyDataFilterOBJ!.propertyLainnya["keperluanLainnya"][0]
                ["Beban Biaya"]
            .toString())!;
    hargaAyamTotal = banyakAyam *
        double.tryParse(MyDataFilterOBJ!.propertyLainnya["keperluanLainnya"][1]
                ["Beban Biaya"]
            .toString())!;
    // double hargaMaggot = hargaTotalpH;

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

    banyakTelurperAyam = banyakAyam * 0.8;
    untungPerharinya = (banyakTelurperAyam *
        double.tryParse(MyDataFilterOBJ!.propertyLainnya["ketebalanTanah"])!);
    keuntunganBersihTiapBulan = (untungPerharinya * 30 -
        ((double.tryParse(MyDataFilterOBJ!.propertyLainnya["keperluanLainnya"]
                    [2]["Beban Biaya"])! /
                umurAyam) *
            30));
    totalkeuntunganBersih = (keuntunganBersihTiapBulan / 30) * umurAyam;

    dataTampungHasil["Luasan lahan yang tersedia"] =
        "${MyDataFilterOBJ!.luas} m²";
    dataTampungHasil["Umur mulai pemeliharaan (Minggu)"] =
        MyDataFilterOBJ!.propertyLainnya["umur"];
    dataTampungHasil["Umur Mati Ayam (Minggu) : "] =
        MyDataFilterOBJ!.propertyLainnya["umurMati"];
    dataTampungHasil["Banyak Ayam : "] =
        MyDataFilterOBJ!.propertyLainnya["peliharaans"];
    dataTampungHasil["Hasil Telur Tiap Ayam per Hari : "] = banyakTelurperAyam;

    dataTampungHasil["Harga Jual Telur"] =
        "Rp. ${double.tryParse(MyDataFilterOBJ!.propertyLainnya["ketebalanTanah"])!}/telur";
    dataTampungHasil["Untung telur Ayam per Hari : "] = untungPerharinya;

    dataTampungHasil["Untung telur Ayam per Bulan : "] =
        "Rp. ${formatRupiah((untungPerharinya * 30).toString())} / Bulan";
    dataTampungHasil["Penjelas Pakan untuk Ayam"] = {
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
      'kebutuhan protein ayam': MyDataFilterOBJ!
          .propertyLainnya["alternatifPakan"]["Kebutuhan Protein Ayam %"],
    };
    // dataTampungHasil["Keperluan pakan Ayam : "] = "$beratPakan kg" ;
    dataTampungHasil["Total keuntungan bersih : "] =
        "Rp.${formatRupiah(totalkeuntunganBersih.toStringAsFixed(1))}/Bulan";

    dataTampungHasil["Total Pengeluaran Pakan"] =
        "Rp. ${MyDataFilterOBJ!.propertyLainnya["keperluanLainnya"][2]["Beban Biaya"]} Kali Panen";
    // dataTampungHasil["Omset"] = totalKeuntungan;
    // dataTampungHasil["keuntungan"] = keuntungan;

    //

    return widget.info == false
        ? SizedBox(
            width: SizeConfig.screenWidth,
            height: SizeConfig.screenHeight!,
            child: SingleChildScrollView(
              controller: _parentScrollController,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: defaultPadding / 2),
                child: Obx(() {
                  // a();
                  return Column(
                    children: [
                      cardWithImg(
                          false,
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
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: kTextColor,
                                                        fontSize:
                                                            heightfit(sT16),
                                                      ),
                                                    ),
                                                    TextSpan(
                                                      text:
                                                          "- ${List.of(filtersdata[c.selectedItemCalcT.value].studiKasus).map((e) => e.values).toList()[index].first["penjelas"]}",
                                                      style: TextStyle(
                                                        fontStyle:
                                                            FontStyle.italic,
                                                        color: kTextColor,
                                                        fontSize:
                                                            heightfit(sT14),
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
                                                            .map(
                                                                (e) => e.values)
                                                            .toList()[index]
                                                            .first["warna"]),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      child: Center(
                                                          child: Text(
                                                        "Proses ${index + 1}",
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.white,
                                                          fontSize:
                                                              heightfit(sT16),
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
                      SizedBox(
                        height: defaultPadding,
                      ),
                      imageCostum(
                          "assets/images/MenuRawatan/RawatTanam/Kandangayam.jpg"),
                      SizedBox(
                        height: defaultPadding,
                      ),

                      // ProsesWidgets(
                      //   juduls: "Luasan lahan yang tersedia : ",
                      //   tema: warnas(dataKategoriMenuRawatan[c.indexMenuRawatan.value]
                      //       .colorku[0]),
                      //   namaobj: "Type Lahan",
                      //   idTipeMediaTanam: 0,
                      //   rumus: "",
                      //   dropdowns: (c.selectedItemCalcT.value == 2) ? false : true,
                      //   datakatRumus: MyDataFilterOBJ!.kategoriRumusKu.toList(),
                      //   onChangeState:
                      //       (indexs, indpot, satuan, datavarmedia, hasilLuas) {
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
                      //
                      //         print("satuan datavarmedia ${datavarmedia} $l");
                      //         if (l == 0 || p == 0) {
                      //           p = variablesNew(
                      //                   MyDataFilterOBJ!.kategoriRumusKu
                      //                       .toList()![0]
                      //                       .rumus,
                      //                   1500 / 100)["p"][1]
                      //               .round();
                      //           l = variablesNew(
                      //                   MyDataFilterOBJ!.kategoriRumusKu
                      //                       .toList()![0]
                      //                       .rumus,
                      //                   1500 / 100)["l"][1]
                      //               .round();
                      //           datavar = datavarmedia;
                      //           if (satuan == "m") {
                      //             p = (datavarmedia["p"][1] * 100).round();
                      //             l = (datavarmedia["l"][1] * 100).round();
                      //           } else {
                      //             p = (datavarmedia["p"][1]).round();
                      //             l = (datavarmedia["l"][1]).round();
                      //           }
                      //         } else {
                      //           datavar = datavarmedia;
                      //           if (satuan == "m") {
                      //             p = (datavarmedia["p"][1] * 100).round();
                      //             l = (datavarmedia["l"][1] * 100).round();
                      //           } else {
                      //             p = (datavarmedia["p"][1]).round();
                      //             l = (datavarmedia["l"][1]).round();
                      //           }
                      //         }
                      //         print(
                      //             "satuan ${p} ${(datavarmedia["p"][1] * 100).round()}");
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
                      //   idBentukMediaTanam: MyDataFilterOBJ!
                      //       .propertyLainnya["tampungan"]["indexBentukMediaTanam"],
                      //   satuan: MyDataFilterOBJ!.propertyLainnya["satuanMediaLahan"][0],
                      //   warna: warnas("e69138"),
                      // ),
                      CalculationWidget(
                        onChange: (Map<String, dynamic> hasil) {
                          print(hasil);

                          Future.microtask(() {
                            setState(() {});
                          });

                          hasila = hasil;

                          datavar = hasila['Variabel'];
                          MyDataFilterOBJ!.propertyLainnya["luasMedia"] =
                              datavar;

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
                          MyDataFilterOBJ!.propertyLainnya["tampungan"]
                              ["indexBentukMediaTanam"] = indexInt;
                          // indexInt =  1;

                          MyDataFilterOBJ!.propertyLainnya["satuanMediaLahan"]
                              [0] = hasila['satuan'];
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
                        height: defaultPadding,
                      ),
                      cardWithImg(
                          false,
                          "Maksimal",
                          20,
                          Container(
                            child: Text(
                              "${tanamPerCage * maxLevelsTanam * banyakInstalasi} Ayam",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: heightfit(30),
                              ),
                            ),
                          )),
                      Containe(0, "m"),

                      SizedBox(
                        height: defaultPadding,
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
                                        children: [
                                          fieldoBaterai[3],
                                          (tanamPerCage *
                                                      maxLevelsTanam *
                                                      banyakInstalasi <
                                                  banyakAyam)
                                              ? Container(
                                                  padding: EdgeInsets.all(16.0),
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
                                                                  setState(() {
                                                                    print(
                                                                        "text ${myControlerssoBatrai[3].text}");

                                                                    // myControlerssoBatrai[3].text = (tanamPerCage*maxLevelsTanam!*banyakInstalasiPerbaris).toString();
                                                                    // banyakTanaman =
                                                                    // double.tryParse(
                                                                    //     myControlerssoBatrai[
                                                                    //     3]
                                                                    //         .text)!;
                                                                    // dataVariabelbaterai["Banyak Tanaman : "] =
                                                                    //     banyakTanaman
                                                                    //         .toString();
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
                                                                  setState(() {
                                                                    myControlerssoBatrai[
                                                                            3]
                                                                        .text = (tanamPerCage *
                                                                            maxLevelsTanam *
                                                                            banyakInstalasi)
                                                                        .toString();
                                                                    banyakAyam = double.tryParse((tanamPerCage *
                                                                            maxLevelsTanam *
                                                                            banyakInstalasi)
                                                                        .toString())!;

                                                                    dataVariabelbaterai[
                                                                            "Banyak Tanaman : "] =
                                                                        banyakAyam
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
                                          SizedBox(
                                            height: defaultPadding / 2,
                                          ),
                                          cardWithImg(
                                              false,
                                              "Banyak ayam yang anda punya",
                                              20,
                                              Container(
                                                child: Text(
                                                  "${banyakAyam.toStringAsFixed(0)} Ayam",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white,
                                                    fontSize: heightfit(30),
                                                  ),
                                                ),
                                              )),
                                          RichText(
                                              text: TextSpan(children: [
                                            TextSpan(
                                              text:
                                                  "Berdasarkan banyak ayam yang anda pelihara maka kami rekomndasikan banyak kandang adalah :  \n",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: kTextColor,
                                                fontSize: heightfit(sT16),
                                              ),
                                            ),
                                            TextSpan(
                                              text:
                                                  "Kandang ini dengan ukuran : \nPanjang : 120 cm\nLebar : 40 cm\ntinggi : 45 cm",
                                              style: TextStyle(
                                                fontStyle: FontStyle.italic,
                                                color: kTextColor,
                                                fontSize: heightfit(sT14),
                                              ),
                                            ),
                                          ])),
                                          cardWithImg(
                                              false,
                                              "Rekomendasi : \n$cagesRequired Kandang",
                                              40,
                                              Container(
                                                child: Column(
                                                  children: [
                                                    Text(
                                                      "Rekomendasi Kandang :\n$cageArrangement\n",
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
                                              )),
                                          Card(
                                            child: Padding(
                                              padding: EdgeInsets.all(
                                                  defaultPadding / 2),
                                              child: Column(
                                                children: [
                                                  Text(
                                                    "Tingkatan Kandang Ayam : ",
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.black54,
                                                      fontSize: heightfit(sT26),
                                                    ),
                                                  ),
                                                  Slider(
                                                    value: double.tryParse(
                                                        _currentValue
                                                            .toString())!,
                                                    min: 0,
                                                    max: 4,
                                                    divisions:
                                                        4, // Membatasi slider menjadi 5 nilai (0, 1, 2, 3, 4)
                                                    label: _currentValue
                                                        .round()
                                                        .toString(),
                                                    onChanged:
                                                        (double newValue) {
                                                      setState(() {
                                                        maxLevelsTanam =
                                                            newValue.toInt();
                                                        _currentValue =
                                                            newValue.toInt();
                                                        aturLayout();
                                                      });
                                                    },
                                                  ),
                                                  SizedBox(
                                                    height: defaultPadding / 2,
                                                  ),
                                                  Text(
                                                    "Perkiraan Pemetaan tempat kandang ayam luas lahan ${double.tryParse(MyDataFilterOBJ!.luas)!.toStringAsFixed(0)} m²",
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.black54,
                                                      fontSize: heightfit(sT26),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: defaultPadding / 2,
                                                  ),
                                                  PatternGrid(
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
                                                        // print("dada ${datatabel}");
                                                      });
                                                    },
                                                    prosess: datatabel,
                                                    panjangs:
                                                        PanjangTempatTanam,
                                                    // Jumlah ayam per kandang
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          cardWithImg(
                                              false,
                                              "Kandang Ayam",
                                              40,
                                              Container(
                                                child: Column(
                                                  children: [
                                                    Text(
                                                      // "Rekomendasi ${mediaTANAM} :\n$cageArrangement\n- pertempat ada ${namaKategoriYes ? tanamPerCage : "${tanamPerCage} Tanaman"} ${namaKategoriYes ? mediaTANAM : "per panjang Pipa ${PanjangTempatTanam} cm   "} ",
                                                      "Rekomendasi banyak kandang ayam :\n"
                                                      "$cageArrangement",
                                                      // "- per instalasi ada ${namaKategoriYes ? tanamPerCage : "${tanamPerCage} Tanaman"} ${namaKategoriYes ? mediaTANAM : ""} ",
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.white,
                                                        fontSize:
                                                            heightfit(sT16),
                                                      ),
                                                    ),
                                                    Text(
                                                      "\nPenjelas: \n1 instalasi kandang Ayam = Mapksimal $maxLevelsTanam Tingkat Rak\n1 Tingkat Rak = penjang $PanjangTempatTanam cm \nPanjang $PanjangTempatTanam cm = ${tanamPerCage}x box kandang ayam ",
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        color: Colors.white,
                                                        fontStyle:
                                                            FontStyle.italic,
                                                        fontSize:
                                                            heightfit(sT12),
                                                      ),
                                                    ),
                                                    Text(
                                                      "\nDari luas ${MyDataFilterOBJ!.luas} m²: \n- Rekomendasi maksimal $maxLevelsTanam tingkat\n"
                                                      "\nJadi Maksimal box yang dapat ditempatkan dilahan seluas ${MyDataFilterOBJ!.luas} m²: ${tanamPerCage * maxLevelsTanam * banyakInstalasi} box dan maksimal $maxLevelsTanam tingkat",
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.white,
                                                        fontSize:
                                                            heightfit(sT16),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: defaultPadding,
                                                    ),
                                                    SizedBox(
                                                      height:
                                                          defaultPadding / 2,
                                                    ),
                                                  ],
                                                ),
                                              )),
                                          SizedBox(
                                            height: defaultPadding / 2,
                                          ),
                                          fieldoBaterai[0],
                                          fieldoBaterai[1],
                                          SizedBox(
                                            height: defaultPadding / 2,
                                          ),
                                          Container(
                                            padding:
                                                EdgeInsets.all(defaultPadding),
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
                                              "${umurAyam} Hari Ayam Bertahan hidup",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                                fontSize: heightfit(sT16),
                                              ),
                                            )),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: defaultPadding / 2,
                                      ),
                                      Containe(1, "m")
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
                          padding: EdgeInsets.all(defaultPadding),
                          child: Column(
                            children: [
                              SizedBox(
                                height: defaultPadding,
                              ),
                              RichText(
                                  text: TextSpan(children: [
                                TextSpan(
                                  text: "Kebutuhan Pakan : \n",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: kTextColor,
                                    fontSize: heightfit(sT26),
                                  ),
                                ),
                                TextSpan(
                                  text:
                                      "Kebutuhan pakan perkiraan 1 Ayam perhari adalah : 100 gr  \n",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: kTextColor,
                                    fontSize: heightfit(sT16),
                                  ),
                                ),
                              ])),
                              Row(
                                children: [
                                  Text(
                                    'Reset kebutuhan protein :',
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
                                              'pakanUtamaPercentage':
                                                  double.tryParse(dataawal!
                                                      .propertyLainnya[
                                                          "alternatifPakan"][
                                                          "Persentase Pakan Pabrik %"]!
                                                      .toString())!,
                                              'pakanAlternatif1Percentage': (100 -
                                                  (double.tryParse(dataawal!
                                                              .propertyLainnya[
                                                                  "alternatifPakan"]
                                                                  [
                                                                  "Persentase Pakan Pabrik %"]
                                                              .toString())!
                                                          .round() +
                                                      double.tryParse(dataawal!
                                                              .propertyLainnya[
                                                                  "tambah pakan alternatif"]
                                                                  [selectedPakan]
                                                                  [
                                                                  "persen pemberian %"]
                                                              .toString())!
                                                          .round())),
                                              'pakanAlternatif2Percentage':
                                                  (dataawal!.propertyLainnya[
                                                              "tambah pakan alternatif"]
                                                          [selectedPakan]
                                                      ["persen pemberian %"]!),
                                              'proteinPakanUtama': dataawal!
                                                          .propertyLainnya[
                                                      "alternatifPakan"]
                                                  ["Protein Pakan Pabrik %"]!,
                                              'proteinPakanAlternatif1':
                                                  dataawal!.propertyLainnya[
                                                          "alternatifPakan"]
                                                      ["Protein Maggot %"],
                                              'proteinPakanAlternatif2': dataawal!
                                                          .propertyLainnya[
                                                      "tambah pakan alternatif"]
                                                  [selectedPakan]["protein %"],
                                              'kebutuhanProtein': dataawal!
                                                          .propertyLainnya[
                                                      "alternatifPakan"]
                                                  ["Kebutuhan Protein Ayam %"],
                                              'indexAlternatif2':
                                                  double.tryParse(selectedPakan
                                                      .toString())!,
                                              "isPakanAlternatif1Enabled":
                                                  dataawal!.propertyLainnya[
                                                      "adaPakanAlternatif"],
                                              "isPakanAlternatif2Enabled":
                                                  dataawal!.propertyLainnya[
                                                      "adaPakanAlternatifLainnya"]
                                            };
                                          } else {
                                            dataPakan = {
                                              'pakanUtamaPercentage': double
                                                  .tryParse(MyDataFilterOBJ!
                                                      .propertyLainnya[
                                                          "alternatifPakan"][
                                                          "Persentase Pakan Pabrik %"]!
                                                      .toString())!,
                                              'pakanAlternatif1Percentage': (100 -
                                                  (double.tryParse(MyDataFilterOBJ!
                                                              .propertyLainnya[
                                                                  "alternatifPakan"]
                                                                  [
                                                                  "Persentase Pakan Pabrik %"]
                                                              .toString())!
                                                          .round() +
                                                      double.tryParse(MyDataFilterOBJ!
                                                              .propertyLainnya[
                                                                  "tambah pakan alternatif"]
                                                                  [selectedPakan]
                                                                  [
                                                                  "persen pemberian %"]
                                                              .toString())!
                                                          .round())),
                                              'pakanAlternatif2Percentage':
                                                  (MyDataFilterOBJ!
                                                                  .propertyLainnya[
                                                              "tambah pakan alternatif"]
                                                          [selectedPakan]
                                                      ["persen pemberian %"]!),
                                              'proteinPakanUtama':
                                                  MyDataFilterOBJ!
                                                              .propertyLainnya[
                                                          "alternatifPakan"][
                                                      "Protein Pakan Pabrik %"]!,
                                              'proteinPakanAlternatif1':
                                                  MyDataFilterOBJ!
                                                              .propertyLainnya[
                                                          "alternatifPakan"]
                                                      ["Protein Maggot %"],
                                              'proteinPakanAlternatif2':
                                                  MyDataFilterOBJ!
                                                              .propertyLainnya[
                                                          "tambah pakan alternatif"]
                                                      [
                                                      selectedPakan]["protein %"],
                                              'kebutuhanProtein': MyDataFilterOBJ!
                                                          .propertyLainnya[
                                                      "alternatifPakan"]
                                                  ["Kebutuhan Protein Ayam %"],
                                              'indexAlternatif2':
                                                  double.tryParse(selectedPakan
                                                      .toString())!,
                                              "isPakanAlternatif1Enabled":
                                                  MyDataFilterOBJ!
                                                          .propertyLainnya[
                                                      "adaPakanAlternatif"],
                                              "isPakanAlternatif2Enabled":
                                                  MyDataFilterOBJ!
                                                          .propertyLainnya[
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
                                            pakanData["indexAlternatif2"]!
                                                .round();
                                        MyDataFilterOBJ!.propertyLainnya[
                                                    "alternatifPakan"]
                                                ["Protein Pakan Pabrik %"] =
                                            pakanData["proteinPakanUtama"];

                                        MyDataFilterOBJ!.propertyLainnya[
                                                    "alternatifPakan"]
                                                ["Kebutuhan Protein Ayam %"] =
                                            pakanData["kebutuhanProtein"];

                                        MyDataFilterOBJ!.propertyLainnya[
                                                    "alternatifPakan"]
                                                ["Protein Maggot %"] =
                                            pakanData[
                                                "proteinPakanAlternatif1"];

                                        MyDataFilterOBJ!.propertyLainnya[
                                                    "tambah pakan alternatif"]
                                                [selectedPakan]["protein %"] =
                                            pakanData[
                                                "proteinPakanAlternatif2"];

                                        MyDataFilterOBJ!.propertyLainnya[
                                                    "alternatifPakan"]
                                                ["Persentase Pakan Pabrik %"] =
                                            pakanData["pakanUtamaPercentage"];

                                        MyDataFilterOBJ!.propertyLainnya[
                                                        "tambah pakan alternatif"]
                                                    [selectedPakan]
                                                ["persen pemberian %"] =
                                            pakanData[
                                                "pakanAlternatif2Percentage"];

                                        MyDataFilterOBJ!.propertyLainnya[
                                                "adaPakanAlternatif"] =
                                            pakanData[
                                                "isPakanAlternatif1Enabled"];

                                        MyDataFilterOBJ!.propertyLainnya[
                                                "adaPakanAlternatifLainnya"] =
                                            pakanData[
                                                "isPakanAlternatif2Enabled"];

                                        dataPakan = {
                                          'pakanUtamaPercentage':
                                              double.tryParse(MyDataFilterOBJ!
                                                  .propertyLainnya[
                                                      "alternatifPakan"][
                                                      "Persentase Pakan Pabrik %"]!
                                                  .toString())!,
                                          'pakanAlternatif1Percentage': (100 -
                                              (double.tryParse(MyDataFilterOBJ!
                                                          .propertyLainnya[
                                                              "alternatifPakan"]
                                                              [
                                                              "Persentase Pakan Pabrik %"]
                                                          .toString())!
                                                      .round() +
                                                  double.tryParse(MyDataFilterOBJ!
                                                          .propertyLainnya[
                                                              "tambah pakan alternatif"]
                                                              [selectedPakan][
                                                              "persen pemberian %"]
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
                                                  ["Kebutuhan Protein Ayam %"],
                                          'indexAlternatif2': double.tryParse(
                                              selectedPakan.toString())!,
                                          "isPakanAlternatif1Enabled":
                                              MyDataFilterOBJ!.propertyLainnya[
                                                  "adaPakanAlternatif"],
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
                                  data: MyDataFilterOBJ!.propertyLainnya[
                                      "tambah pakan alternatif"],
                                  namaPliharaan:
                                      JenisBatteray.keys.toList()[indexJb],
                                  dataProtein: {
                                    "proteinPakanUtama": double.tryParse(
                                        dataPakan["proteinPakanUtama"]
                                            .toString())!,
                                    "proteinPakanAlternatif1": double.tryParse(
                                        dataPakan["proteinPakanAlternatif1"]
                                            .toString())!,
                                    "kebutuhanProtein": double.tryParse(
                                        dataPakan["kebutuhanProtein"]
                                            .toString())!,
                                    "proteinPakanUtama": double.tryParse(
                                        dataPakan["proteinPakanUtama"]
                                            .toString())!,
                                    "proteinPakanAlternatif1": double.tryParse(
                                        dataPakan["proteinPakanAlternatif1"]
                                            .toString())!,
                                    "kebutuhanProtein": double.tryParse(
                                        dataPakan["kebutuhanProtein"]
                                            .toString())!,
                                    'pakanUtamaPercentage': double.tryParse(
                                        dataPakan["pakanUtamaPercentage"]
                                            .toString())!,
                                    'pakanAlternatif1Percentage':
                                        double.tryParse(dataPakan[
                                                    'pakanAlternatif1Percentage']
                                                .toString())!
                                            .round(),
                                    'pakanAlternatif2Percentage':
                                        double.tryParse(dataPakan[
                                                    'pakanAlternatif2Percentage']
                                                .toString())!
                                            .round(),
                                  },
                                  dataBoolAktifPakan: {
                                    "isPakanAlternatif1Enabled":
                                        MyDataFilterOBJ!.propertyLainnya[
                                            "adaPakanAlternatif"],
                                    "isPakanAlternatif2Enabled":
                                        MyDataFilterOBJ!.propertyLainnya[
                                            "adaPakanAlternatifLainnya"]
                                  },
                                  isReset: isResetProtein),
                              SizedBox(
                                height: defaultPadding,
                              ),
                              cardWithImg(
                                false,
                                "${((double.tryParse(MyDataFilterOBJ!.propertyLainnya["alternatifPakan"]["Persentase Pakan Pabrik %"]!.toString())!.round() / 100) * beratPakan).toStringAsFixed(0)}Kg",
                                30,
                                Column(
                                  children: [
                                    Text(
                                      "${double.tryParse(MyDataFilterOBJ!.propertyLainnya["alternatifPakan"]["Persentase Pakan Pabrik %"]!.toString())!.round()}% Perkiraan Pakan Pabrik untuk pakan ayam selama masa produktif ayam yaitu $umurAyam hari",
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
                                          onChangeState: (double hasilrp,
                                              double rp,
                                              double perBanyak,
                                              String satuan) {
                                            Future.microtask(() {
                                              setState(() {
                                                MyDataFilterOBJ!
                                                        .propertyLainnya[
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
                                          selectedUnitFrom: MyDataFilterOBJ!
                                                  .propertyLainnya[
                                              "hargaPerBanyakSatuan"]["satuan"],
                                          selectedUnitType: 'gr',
                                          selectedUnitTos: 'kg',
                                          hargaPer: double.tryParse(
                                              MyDataFilterOBJ!
                                                  .propertyLainnya[
                                                      "hargaPerBanyakSatuan"]
                                                      ["hargaPer"]
                                                  .toString())!,
                                          perbanyak: double.tryParse(
                                              MyDataFilterOBJ!.propertyLainnya[
                                                      "hargaPerBanyakSatuan"]
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
                              (dataPakan["isPakanAlternatif1Enabled"] == true)
                                  ? cardWithImg(
                                      false,
                                      "${(((100 - (double.tryParse(MyDataFilterOBJ!.propertyLainnya["alternatifPakan"]["Persentase Pakan Pabrik %"].toString())!.round() + double.tryParse(MyDataFilterOBJ!.propertyLainnya["tambah pakan alternatif"][selectedPakan]["persen pemberian %"].toString())!.round())) / 100) * beratPakan).toStringAsFixed(0)}Kg",
                                      30,
                                      Column(
                                        children: [
                                          Text(
                                            "${100 - (double.tryParse(MyDataFilterOBJ!.propertyLainnya["alternatifPakan"]["Persentase Pakan Pabrik %"].toString())!.round() + double.tryParse(MyDataFilterOBJ!.propertyLainnya["tambah pakan alternatif"][selectedPakan]["persen pemberian %"].toString())!.round())}% Perkiraan Maggot untuk pakan ayam",
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
                                                    bottomLeft:
                                                        Radius.circular(0),
                                                    bottomRight:
                                                        Radius.circular(20),
                                                    topLeft:
                                                        Radius.circular(20),
                                                    topRight:
                                                        Radius.circular(0)),
                                                border: Border.all(
                                                    style: BorderStyle.solid,
                                                    color: warnas("f1c232"),
                                                    width: 3.5),
                                                boxShadow: [
                                                  BoxShadow(
                                                      blurRadius: 10,
                                                      offset: Offset(-5, 5),
                                                      color: Colors
                                                          .green.shade700
                                                          .withOpacity(.2))
                                                ],
                                              ),
                                              child: UangPerSatuan(
                                                onChangeState: (double hasilrp,
                                                    double rp,
                                                    double perBanyak,
                                                    String satuan) {
                                                  Future.microtask(() {
                                                    setState(() {
                                                      MyDataFilterOBJ!
                                                              .propertyLainnya[
                                                          "hargaPerBanyakSatuanMaggot"] = {
                                                        "hargaPer": rp,
                                                        "perBanyak": perBanyak,
                                                        "satuan": satuan
                                                      };
                                                      hargaperKgMaggot =
                                                          hasilrp;

                                                      // hargaMaggot = hasilrp;
                                                      // hargaTotalMaggotIkan = hargaMaggot * pakanMaggotsIkan;
                                                      hitunglocal();
                                                    });
                                                  });
                                                },
                                                selectedUnitFrom: MyDataFilterOBJ!
                                                            .propertyLainnya[
                                                        "hargaPerBanyakSatuanMaggot"]
                                                    ["satuan"],
                                                selectedUnitType: 'gr',
                                                selectedUnitTos: 'kg',
                                                hargaPer: double.tryParse(
                                                    MyDataFilterOBJ!
                                                        .propertyLainnya[
                                                            "hargaPerBanyakSatuanMaggot"]
                                                            ["hargaPer"]
                                                        .toString())!,
                                                perbanyak: double.tryParse(
                                                    MyDataFilterOBJ!
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
                                    )
                                  : Container(),
                              (dataPakan["isPakanAlternatif2Enabled"] == true)
                                  ? cardWithImg(
                                      false,
                                      "${((MyDataFilterOBJ!.propertyLainnya["tambah pakan alternatif"][selectedPakan]["persen pemberian %"]!.round() / 100) * beratPakan).toStringAsFixed(0)}Kg",
                                      30,
                                      Column(
                                        children: [
                                          Text(
                                            "${MyDataFilterOBJ!.propertyLainnya["tambah pakan alternatif"][selectedPakan]["persen pemberian %"]!.round()}% Perkiraan ${MyDataFilterOBJ!.propertyLainnya["tambah pakan alternatif"][selectedPakan]["nama"]} untuk pakan ayam",
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
                                                    bottomLeft:
                                                        Radius.circular(0),
                                                    bottomRight:
                                                        Radius.circular(20),
                                                    topLeft:
                                                        Radius.circular(20),
                                                    topRight:
                                                        Radius.circular(0)),
                                                border: Border.all(
                                                    style: BorderStyle.solid,
                                                    color: warnas("f1c232"),
                                                    width: 3.5),
                                                boxShadow: [
                                                  BoxShadow(
                                                      blurRadius: 10,
                                                      offset: Offset(-5, 5),
                                                      color: Colors
                                                          .green.shade700
                                                          .withOpacity(.2))
                                                ],
                                              ),
                                              child: UangPerSatuan(
                                                onChangeState: (double hasilrp,
                                                    double rp,
                                                    double perBanyak,
                                                    String satuan) {
                                                  Future.microtask(() {
                                                    setState(() {
                                                      MyDataFilterOBJ!
                                                              .propertyLainnya[
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
                                                selectedUnitFrom: MyDataFilterOBJ!
                                                            .propertyLainnya[
                                                        "hargaPerBanyakSatuanPaku"]
                                                    ["satuan"],
                                                selectedUnitType: 'gr',
                                                selectedUnitTos: 'kg',
                                                hargaPer: double.tryParse(
                                                    MyDataFilterOBJ!
                                                        .propertyLainnya[
                                                            "hargaPerBanyakSatuanPaku"]
                                                            ["hargaPer"]
                                                        .toString())!,
                                                perbanyak: double.tryParse(
                                                    MyDataFilterOBJ!
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
                                    )
                                  : Container()
                              // Padding(
                              //   padding:
                              //       EdgeInsets.symmetric(vertical: defaultPadding / 2),
                              //   child: Container(
                              //     decoration: BoxDecoration(
                              //       color: Colors.white,
                              //       borderRadius: BorderRadius.only(
                              //           bottomLeft: Radius.circular(0),
                              //           bottomRight: Radius.circular(20),
                              //           topLeft: Radius.circular(20),
                              //           topRight: Radius.circular(0)),
                              //       border: Border.all(
                              //           style: BorderStyle.solid,
                              //           color: warnas("6aa84f"),
                              //           width: 3.5),
                              //       boxShadow: [
                              //         BoxShadow(
                              //             blurRadius: 10,
                              //             offset: Offset(-5, 5),
                              //             color: Colors.green.shade700.withOpacity(.2))
                              //       ],
                              //     ),
                              //     child: Column(
                              //       children: [
                              //         SwitchListTile(
                              //             activeColor: warnas("f1c232"),
                              //             title: Text(
                              //               "Alternatif Pakan Maggot ",
                              //               style: TextStyle(fontSize: heightfit(26)),
                              //             ),
                              //             // subtitle: Text("Satuan",style: TextStyle(fontSize: heightfit(26)),),
                              //             value: MyDataFilterOBJ!
                              //                 .propertyLainnya["adaPakanAlternatif"],
                              //             onChanged: (bool value) {
                              //               Future.microtask(() {
                              //                 setState(() {});
                              //               });
                              //
                              //               MyDataFilterOBJ!
                              //                   .propertyLainnya["adaPakanAlternatif"] = value;
                              //
                              //               hitunglocal();
                              //             }),
                              //         // Visibility(
                              //         //   visible: MyDataFilterOBJ!
                              //         //       .propertyLainnya["adaPakanAlternatif"],
                              //         //   child: Padding(
                              //         //     padding: EdgeInsets.symmetric(
                              //         //         horizontal: defaultPadding / 2),
                              //         //     child: Column(
                              //         //       children: [
                              //         //         Row(
                              //         //           children: [
                              //         //             Expanded(
                              //         //               flex: 7,
                              //         //               child: FittedBox(
                              //         //                 child: Container(
                              //         //                   height: 100,
                              //         //                   width: 50,
                              //         //                   child: const CardProductku(
                              //         //                       tema: Colors.green,
                              //         //                       tema2: Colors.orange,
                              //         //                       image:
                              //         //                           "assets/images/MenuRawatan/Rawat_Maggot.png"),
                              //         //                 ),
                              //         //               ),
                              //         //             ),
                              //         //             Expanded(
                              //         //               flex: 1,
                              //         //               child: SizedBox(
                              //         //                 width: defaultPadding / 3,
                              //         //               ),
                              //         //             ),
                              //         //             Expanded(
                              //         //               flex: 27,
                              //         //               child: FittedBox(
                              //         //                 child: Container(
                              //         //                     height: 120,
                              //         //                     width: 250,
                              //         //                     child: Fields(
                              //         //                       controller:
                              //         //                           TextEditingController(
                              //         //                               text: hargaMaggot.toString()),
                              //         //                       satuan: "Rp/Kg",
                              //         //                       title: "Harga Maggot\n",
                              //         //                       tema: Colors.black38,
                              //         //                       onStateChange: (valu) {
                              //         //                         Future.microtask(() {
                              //         //                           setState(() {
                              //         //                             hargaMaggot = double.tryParse(valu)!;
                              //         //                             // hargaTotalpH = (double
                              //         //                             //         .tryParse(
                              //         //                             //             hargapH)! *
                              //         //                             //     hasilPersentaseCampur['persenMaggot']!
                              //         //                             //         .round());
                              //         //                             print(
                              //         //                                 "harga:${double.tryParse(hargapH)!} ${hargaTotalpH}");
                              //         //                             hitunglocal();
                              //         //                           });
                              //         //                         });
                              //         //                       },
                              //         //                       typeinput: TextInputType
                              //         //                           .numberWithOptions(
                              //         //                               decimal: true),
                              //         //                       enable: true,
                              //         //                     )),
                              //         //               ),
                              //         //             ),
                              //         //           ],
                              //         //         ),
                              //         //         SizedBox(
                              //         //           height: defaultPadding,
                              //         //         ),
                              //         //         fieldoBateraiPlus[0],
                              //         //         RichText(
                              //         //             textAlign: TextAlign.right,
                              //         //             text: TextSpan(children: [
                              //         //               TextSpan(
                              //         //                 text:
                              //         //                     "Kandungan Protein pada pakan pabrik",
                              //         //                 style: TextStyle(
                              //         //                   fontWeight: FontWeight.bold,
                              //         //                   color: kTextColor,
                              //         //                   fontSize: heightfit(sT12),
                              //         //                 ),
                              //         //               ),
                              //         //             ])),
                              //         //         SizedBox(
                              //         //           height: defaultPadding,
                              //         //         ),
                              //         //         fieldoBateraiPlus[1],
                              //         //         RichText(
                              //         //             textAlign: TextAlign.right,
                              //         //             text: TextSpan(children: [
                              //         //               TextSpan(
                              //         //                 text:
                              //         //                     "Kandungan Protein pada pakan Maggot",
                              //         //                 style: TextStyle(
                              //         //                   fontWeight: FontWeight.bold,
                              //         //                   color: kTextColor,
                              //         //                   fontSize: heightfit(sT12),
                              //         //                 ),
                              //         //               ),
                              //         //             ])),
                              //         //         SizedBox(
                              //         //           height: defaultPadding,
                              //         //         ),
                              //         //         fieldoBateraiPlus[2],
                              //         //         RichText(
                              //         //             textAlign: TextAlign.right,
                              //         //             text: TextSpan(children: [
                              //         //               TextSpan(
                              //         //                 text:
                              //         //                     "Kebutuhan Protein pada Ayam",
                              //         //                 style: TextStyle(
                              //         //                   fontWeight: FontWeight.bold,
                              //         //                   color: kTextColor,
                              //         //                   fontSize: heightfit(sT12),
                              //         //                 ),
                              //         //               ),
                              //         //             ])),
                              //         //         SizedBox(
                              //         //           height: defaultPadding,
                              //         //         ),
                              //         //         fieldoBateraiPlus[3],
                              //         //         RichText(
                              //         //             textAlign: TextAlign.right,
                              //         //             text: TextSpan(children: [
                              //         //               TextSpan(
                              //         //                 text:
                              //         //                     "Persentase pemberian pakan pabrik ke Ayam",
                              //         //                 style: TextStyle(
                              //         //                   fontWeight: FontWeight.bold,
                              //         //                   color: kTextColor,
                              //         //                   fontSize: heightfit(sT12),
                              //         //                 ),
                              //         //               ),
                              //         //             ])),
                              //         //         SizedBox(
                              //         //           height: defaultPadding,
                              //         //         ),
                              //         //         Container(
                              //         //           child: Container(
                              //         //               margin: EdgeInsets.symmetric(
                              //         //                   horizontal: heightfit(
                              //         //                       defaultPadding / 2),
                              //         //                   vertical: heightfit(
                              //         //                       defaultPadding / 2)),
                              //         //               // height: 200,
                              //         //               width: heightfit(double.infinity),
                              //         //               decoration: BoxDecoration(
                              //         //                   color: Colors.white,
                              //         //                   borderRadius: BorderRadius.only(
                              //         //                       bottomLeft:
                              //         //                           Radius.circular(20),
                              //         //                       bottomRight:
                              //         //                           Radius.circular(20),
                              //         //                       topLeft:
                              //         //                           Radius.circular(20),
                              //         //                       topRight:
                              //         //                           Radius.circular(20)),
                              //         //                   // border:
                              //         //                   //     Border.all(color: kTextColor.withOpacity(.8), width: .2)
                              //         //                   boxShadow: [
                              //         //                     BoxShadow(
                              //         //                         blurRadius: 10,
                              //         //                         offset: Offset(-1, 8),
                              //         //                         color: Colors.green
                              //         //                             .withOpacity(.3))
                              //         //                   ]),
                              //         //               child: Stack(
                              //         //                 children: [
                              //         //                   Positioned(
                              //         //                     bottom: 0,
                              //         //                     right: 0,
                              //         //                     // left: 0,
                              //         //                     child: Container(
                              //         //                       height: heightfit(90),
                              //         //                       width: heightfit(100),
                              //         //                       decoration: BoxDecoration(
                              //         //                           color: Colors
                              //         //                               .green.shade100,
                              //         //                           borderRadius:
                              //         //                               BorderRadius.only(
                              //         //                                   bottomLeft: Radius
                              //         //                                       .circular(
                              //         //                                           0),
                              //         //                                   bottomRight:
                              //         //                                       Radius
                              //         //                                           .circular(
                              //         //                                               20),
                              //         //                                   topLeft: Radius
                              //         //                                       .circular(
                              //         //                                           90),
                              //         //                                   topRight: Radius
                              //         //                                       .circular(
                              //         //                                           0)),
                              //         //                           // border:
                              //         //                           //     Border.all(color: kTextColor.withOpacity(.8), width: .2)
                              //         //                           boxShadow: [
                              //         //                             BoxShadow(
                              //         //                                 blurRadius: 10,
                              //         //                                 offset:
                              //         //                                     Offset(-1, 8),
                              //         //                                 color: Colors
                              //         //                                     .green
                              //         //                                     .withOpacity(
                              //         //                                         .3))
                              //         //                           ]),
                              //         //                     ),
                              //         //                   ),
                              //         //                   Padding(
                              //         //                       padding: EdgeInsets.all(
                              //         //                         defaultPadding / 2,
                              //         //                       ),
                              //         //                       child: cardWithImg(
                              //         //                         false,
                              //         //                         "${hasilPersentaseCampur['persenMaggot']!.round()}%",
                              //         //                         30,
                              //         //                         Text(
                              //         //                           "Perkiraan maggot untuk pakan Ayam",
                              //         //                           style: TextStyle(
                              //         //                             fontWeight:
                              //         //                                 FontWeight.bold,
                              //         //                             color: Colors.white,
                              //         //                             fontSize:
                              //         //                                 heightfit(sT16),
                              //         //                           ),
                              //         //                         ),
                              //         //                       )),
                              //         //                 ],
                              //         //               )),
                              //         //         ),
                              //         //         SizedBox(
                              //         //           height: defaultPadding,
                              //         //         ),
                              //         //         // DolomitBerdasarkanLuas(
                              //         //         //   tampiltombol: false,
                              //         //         //   diketahui: false,
                              //         //         //   tema: Colors.green,
                              //         //         //   indexmenu: c.indexMenuRawatan.value,
                              //         //         //   indexsubmenu: c.indexsubMenuRawatan.value,
                              //         //         //   onchange: () {
                              //         //         //     setState(() {
                              //         //         //       Future.microtask(() {
                              //         //         //         setState(() {
                              //         //         //           hargaTotalpH = double.tryParse(hargapH)! *
                              //         //         //               (cariValue("KpH") * 1000);
                              //         //         //           print(
                              //         //         //               "harga:${double.tryParse(hargapH)!}");
                              //         //         //           hitunglocal();
                              //         //         //         });
                              //         //         //       });
                              //         //         //     });
                              //         //         //   },
                              //         //         // ),
                              //         //         // HasilConvertDol(tema: Colors.green)
                              //         //       ],
                              //         //     ),
                              //         //   ),
                              //         // ),
                              //       ],
                              //     ),
                              //   ),
                              // ),
                              // Visibility(
                              //   visible: MyDataFilterOBJ!.propertyLainnya["adaPakanAlternatif"],
                              //   child: Column(
                              //     children: [
                              //       SizedBox(
                              //         height: defaultPadding,
                              //       ),
                              //       RichText(
                              //           textAlign: TextAlign.right,
                              //           text: TextSpan(children: [
                              //             TextSpan(
                              //               text: "Pakan Maggot : ",
                              //               style: TextStyle(
                              //                 fontWeight: FontWeight.bold,
                              //                 color: kTextColor,
                              //                 fontSize: heightfit(sT26),
                              //               ),
                              //             ),
                              //           ])),
                              //       Container(
                              //         child: Container(
                              //             margin: EdgeInsets.symmetric(
                              //                 horizontal: heightfit(defaultPadding / 2),
                              //                 vertical: heightfit(defaultPadding / 2)),
                              //             // height: 200,
                              //             width: heightfit(double.infinity),
                              //             decoration: BoxDecoration(
                              //                 color: Colors.white,
                              //                 borderRadius: BorderRadius.only(
                              //                     bottomLeft: Radius.circular(20),
                              //                     bottomRight: Radius.circular(20),
                              //                     topLeft: Radius.circular(20),
                              //                     topRight: Radius.circular(20)),
                              //                 // border:
                              //                 //     Border.all(color: kTextColor.withOpacity(.8), width: .2)
                              //                 boxShadow: [
                              //                   BoxShadow(
                              //                       blurRadius: 10,
                              //                       offset: Offset(-1, 8),
                              //                       color: Colors.green.withOpacity(.3))
                              //                 ]),
                              //             child: Stack(
                              //               children: [
                              //                 Positioned(
                              //                   bottom: 0,
                              //                   right: 0,
                              //                   // left: 0,
                              //                   child: Container(
                              //                     height: heightfit(90),
                              //                     width: heightfit(100),
                              //                     decoration: BoxDecoration(
                              //                         color: Colors.green.shade100,
                              //                         borderRadius: BorderRadius.only(
                              //                             bottomLeft:
                              //                                 Radius.circular(0),
                              //                             bottomRight:
                              //                                 Radius.circular(20),
                              //                             topLeft: Radius.circular(90),
                              //                             topRight: Radius.circular(0)),
                              //                         // border:
                              //                         //     Border.all(color: kTextColor.withOpacity(.8), width: .2)
                              //                         boxShadow: [
                              //                           BoxShadow(
                              //                               blurRadius: 10,
                              //                               offset: Offset(-1, 8),
                              //                               color: Colors.green
                              //                                   .withOpacity(.3))
                              //                         ]),
                              //                   ),
                              //                 ),
                              //                 Padding(
                              //                     padding: EdgeInsets.all(
                              //                       defaultPadding / 2,
                              //                     ),
                              //                     child: cardWithImg(
                              //                       false,
                              //                       "${hasilPersentaseCampur['persenMaggot']!.round() * (perkirranPakanBanyakAyam / 1000) / 100} kg ",
                              //                       30,
                              //                       Text(
                              //                         "Perkiraan pakan yang perlu disiapkan per-harinya dari banyak  $banyakAyam ayam dengan Pakan Maggot",
                              //                         style: TextStyle(
                              //                           fontWeight: FontWeight.bold,
                              //                           color: Colors.white,
                              //                           fontSize: heightfit(sT16),
                              //                         ),
                              //                       ),
                              //                     )),
                              //               ],
                              //             )),
                              //       ),
                              //     ],
                              //   ),
                              // ),
                              // SizedBox(
                              //   height: defaultPadding,
                              // ),
                              // RichText(
                              //     textAlign: TextAlign.right,
                              //     text: TextSpan(children: [
                              //       TextSpan(
                              //         text: "Pakan Pabrik : ",
                              //         style: TextStyle(
                              //           fontWeight: FontWeight.bold,
                              //           color: kTextColor,
                              //           fontSize: heightfit(sT26),
                              //         ),
                              //       ),
                              //     ])),
                              ,
                              Container(
                                child: Container(
                                    margin: EdgeInsets.symmetric(
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
                                            child: cardWithImg(
                                              false,
                                              "${perkirranPakanBanyakAyam / 1000} kg ",
                                              30,
                                              Text(
                                                "Perkiraan pakan yang perlu disiapkan per-harinya dari banyak  $banyakAyam ayam",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white,
                                                  fontSize: heightfit(sT16),
                                                ),
                                              ),
                                            )),
                                      ],
                                    )),
                              ),
                              // Containe(2, "m"),
                            ],
                          ),
                        ),
                      ),

                      SizedBox(
                        height: defaultPadding,
                      ),
                      Padding(
                        padding: EdgeInsets.all(defaultPadding / 2),
                        child: imageCostum(
                            "assets/images/MenuRawatan/RawatTanam/pakan.jpg"),
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
                                  text: "Hasil Telur : \n",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: kTextColor,
                                    fontSize: heightfit(sT26),
                                  ),
                                ),
                                TextSpan(
                                  text:
                                      "hasil telur perkiraan 1 Ayam menghasilkan telur perhari adalah : 0.8  \n",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: kTextColor,
                                    fontSize: heightfit(sT16),
                                  ),
                                ),
                              ])),
                              Container(
                                child: Container(
                                    margin: EdgeInsets.symmetric(
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
                                            child: cardWithImg(
                                              false,
                                              "$banyakTelurperAyam telur ",
                                              30,
                                              Text(
                                                "Perkiraan Ayam bertelur per-harinya dengan banyak ayam $banyakAyam ayam",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white,
                                                  fontSize: heightfit(sT16),
                                                ),
                                              ),
                                            )),
                                      ],
                                    )),
                              ),
                              fieldoBaterai[5],
                              Padding(
                                  padding: EdgeInsets.all(
                                    defaultPadding / 2,
                                  ),
                                  child: cardWithImg(
                                    false,
                                    "Rp. ${formatRupiah(untungPerharinya.toString())} ",
                                    30,
                                    Text(
                                      "Perkiraan untung yang anda dapatkan per-harinya dengan banyak ayam $banyakAyam ayam",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontSize: heightfit(sT16),
                                      ),
                                    ),
                                  )),
                            ],
                          ),
                        ),
                      ),
                      // Print conclusions
                      SizedBox(
                        height: defaultPadding,
                      ),
                      Column(
                        children: [
                          for (int o = 0; o < agendaNila.toList().length; o++)
                            if (agendaNila.toList()[o]['agenda'] ==
                                'Awal Tebar')
                              cardWithImg(
                                  false,
                                  "Keuntungan Telur \nRp. ${formatRupiah((untungPerharinya * 30).toString())} / Bulan",
                                  30,
                                  Container(
                                    child: Column(
                                      children: [
                                        Text(
                                          "Keuntungan Penjualan telur per bulan dengan banyak ayam $banyakAyam Ayam",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                            fontSize: heightfit(sT16),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ))
                        ],
                      ),
                      // ketebalan tanah == harga jual /kg ikan
                      cardWithImg(
                          false,
                          "Rp.${formatRupiah(keuntunganBersihTiapBulan.toStringAsFixed(1))}/Bulan",
                          30,
                          Container(
                            child: Column(
                              children: [
                                Text(
                                  "Keuntungan bersih per-Bulan dari pengeluaran pakan dan hasil penjualan telur dengan harga per telur Rp.${formatRupiah(double.tryParse(MyDataFilterOBJ!.propertyLainnya["ketebalanTanah"]).toString())}",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: heightfit(sT24),
                                  ),
                                ),
                              ],
                            ),
                          )),
                      cardWithImg(
                          false,
                          "Rp.${formatRupiah(totalkeuntunganBersih.toStringAsFixed(1))}/378 hari",
                          30,
                          Container(
                            child: Column(
                              children: [
                                Text(
                                  "Keuntungan bersih dari pengeluaran pakan selama masa hidup ayam $umurAyam hari dan hasil penjualan telur dengan harga per telur Rp.${formatRupiah(double.tryParse(MyDataFilterOBJ!.propertyLainnya["ketebalanTanah"]).toString())}",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: heightfit(sT24),
                                  ),
                                ),
                              ],
                            ),
                          )),

                      SizedBox(
                        height: defaultPadding / 2,
                      ),

                      // AutoSizeText(
                      //   "Agenda Rawat: ",
                      //   style: TextStyle(
                      //     fontWeight: FontWeight.bold,
                      //     fontStyle: FontStyle.normal,
                      //     fontSize: 20,
                      //     color: kTextColor,
                      //   ),
                      //   minFontSize: 12,
                      //   maxLines: 4,
                      //   overflow: TextOverflow.ellipsis,
                      // ),

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
                                      itemCount: MyDataFilterOBJ!
                                          .propertyLainnya["keperluanLainnya"]
                                          .length,
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
                                          len: MyDataFilterOBJ!
                                              .propertyLainnya[
                                                  "keperluanLainnya"]
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
                                                      .propertyLainnya[
                                                  "keperluanLainnya"][indexFixs]
                                              ["Nama Pengeluaran"],
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
                                            MyDataFilterOBJ!.propertyLainnya[
                                                    "keperluanLainnya"]
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
                                              MyDataFilterOBJ!.propertyLainnya[
                                                      "keperluanLainnya"]
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
                                                                  text: "${MyDataFilterOBJ!.propertyLainnya["keperluanLainnya"][indexFixs]["Nama Pengeluaran"]}"
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
                                                                MyDataFilterOBJ!
                                                                            .propertyLainnya["keperluanLainnya"]
                                                                        [
                                                                        indexFixs]
                                                                    [
                                                                    "Nama Pengeluaran"] = values;

                                                                // setState(() {
                                                                //
                                                                // });
                                                                // setPreference();
                                                              },
                                                              enable: true,
                                                              inputType:
                                                                  TextInputType
                                                                      .text,
                                                            ),
                                                            Fields(
                                                              controller: TextEditingController(
                                                                  text: "${MyDataFilterOBJ!.propertyLainnya["keperluanLainnya"][indexFixs]["Beban Biaya"]}"
                                                                      .toString()),
                                                              satuan: (indexFixs ==
                                                                      0)
                                                                  ? ""
                                                                  : (indexFixs ==
                                                                          1)
                                                                      ? "Rp/$banyakAyam"
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
                                                                MyDataFilterOBJ!
                                                                            .propertyLainnya["keperluanLainnya"]
                                                                        [
                                                                        indexFixs]
                                                                    [
                                                                    "Beban Biaya"] = values;

                                                                // setState(() {
                                                                //
                                                                // });
                                                                // setPreference();
                                                              },
                                                              enable: true,
                                                              inputType:
                                                                  TextInputType
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
                                      t <
                                          MyDataFilterOBJ!
                                                  .propertyLainnya[
                                                      "keperluanLainnya"]
                                                  .length -
                                              1;
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
                                                "Biaya ${MyDataFilterOBJ!.propertyLainnya["keperluanLainnya"][t]["Nama Pengeluaran"]} :",
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
                                              "${(MyDataFilterOBJ!.propertyLainnya["keperluanLainnya"][t]["Nama Pengeluaran"] == "Ayam petelur") ? "Rp. ${formatRupiah((hargaAyamTotal).toString())}" : (MyDataFilterOBJ!.propertyLainnya["keperluanLainnya"][t]["Nama Pengeluaran"] == "Kandang") ? "Rp. ${formatRupiah(hargaKandangTotal.toString())}" : "Rp. ${formatRupiah(MyDataFilterOBJ!.propertyLainnya["keperluanLainnya"][t]["Beban Biaya"].toString())}"} ",
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
                            // "${formatRupiah((hitungHarga(aDosis, hargaDosis).values.toList().reduce((value, element) => value + element) + (hargaTotalpH + hitungTotalBiaya(beratPakan))).toString())}"
                            "${formatRupiah((hitungTotalBiaya(
                              hargaKandangTotal,
                              hargaAyamTotal,
                            )).toString())}",
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold),
                          )),
                    ],
                  );
                }),
              ),
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
                                SizedBox(
                                  height: heightfit(defaultPadding),
                                ),
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
                //         "${filterCategorybyPerusahaan()[(c.indexMenuRawatan.value == 3 || c.indexMenuRawatan.value == 4  || c.indexMenuRawatan.value == 5 ) ? 0 : MyDataFilterOBJ!.propertyLainnya["tampungan"]["indexperusahaan"]]}",
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
