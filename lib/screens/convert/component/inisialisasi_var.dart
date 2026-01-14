// import 'package:rawatt/screens/convert/component/database_perhitungan_komoditi.dart';

import 'dart:convert';
import 'dart:math';
import 'dart:ui';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:rawatt/components/inputan.dart';
import 'package:rawatt/model/diskon/diskon.dart';
import 'package:rawatt/model/dosis/mdl_dosisPengaplikasian.dart';
import 'package:rawatt/model/kalkulator/mdl_KatRumus.dart';
import 'package:rawatt/model/product/mdl_Produk.dart';
import 'package:rawatt/screens/convert/component/database_rumus_komoditi.dart';
import 'package:get/get.dart';
import 'package:rawatt/service/database_service.dart';

import '../../../model/MenuRawatan/mdl_MenuRawatan.dart';
import '../../../model/dosis/fieldku_campur.dart';
import '../../../model/petani/mdl_Petani.dart';
import '../screens/dosis_pupuk_tanaman/dosis_pupuk_tanaman.dart';
import 'Widget_Jenis_Lahan.dart';
import '../../../model/datafix.dart';
import 'Widget_Jenis_Tanah.dart';
import 'Widget_pH_indikator.dart';
import 'datatanamanbuah.dart';

// class DosisPupukTanaman {
//   DosisPupukTanaman({
//     this.idKomoditi,
//     this.pengaplikasian,
//   });

//   int idKomoditi;
//   List<Pengaplikasian> pengaplikasian;

//   factory DosisPupukTanaman.fromJson(Map<String, dynamic> json) =>
//       DosisPupukTanaman(
//         idKomoditi: json["idKomoditi"],
//         pengaplikasian: List<Pengaplikasian>.from(
//             json["pengaplikasian"].map((x) => Pengaplikasian.fromJson(x))),
//       );

//   Map<String, dynamic> toJson() => {
//         "idKomoditi": idKomoditi,
//         "pengaplikasian":
//             List<dynamic>.from(pengaplikasian.map((x) => x.toJson())),
//       };
// }

// class Pengaplikasian {
//   Pengaplikasian({
//     this.idPerusahaan,
//     this.dataDosis,
//   });

//   int idPerusahaan;
//   List<DataDosis> dataDosis;

//   factory Pengaplikasian.fromJson(Map<String, dynamic> json) => Pengaplikasian(
//         idPerusahaan: json["id_perusahaan"],
//         dataDosis: List<DataDosis>.from(
//             json["data_dosis"].map((x) => DataDosis.fromJson(x))),
//       );

//   Map<String, dynamic> toJson() => {
//         "id_perusahaan": idPerusahaan,
//         "data_dosis": List<dynamic>.from(dataDosis.map((x) => x.toJson())),
//       };
// }

// class DataDosis {
//   DataDosis({
//     this.idDosis,
//     this.jenisPemupukan,
//     this.variabels,
//     this.takaran,
//     this.hasil,
//     this.penjelas,
//   });

//   int idDosis;
//   String jenisPemupukan;
//   Map<String, List<dynamic>> variabels;
//   Map<String, dynamic> takaran;
//   Map<String, dynamic> hasil;
//   Map<String, dynamic> penjelas;

//   factory DataDosis.fromJson(Map<String, dynamic> json) => DataDosis(
//         idDosis: json["id_dosis"],
//         jenisPemupukan: json["jenis pemupukan"],
//         variabels: Map.from(json["variabels"]).map((k, v) =>
//             MapEntry<String, List<dynamic>>(
//                 k, List<dynamic>.from(v.map((x) => x)))),
//         takaran: Map.from(json["takaran"]).map((k, v) =>
//             MapEntry<String, List<dynamic>>(
//                 k, List<dynamic>.from(v.map((x) => x)))),
//         hasil: Map.from(json["hasil"]).map((k, v) =>
//             MapEntry<String, List<dynamic>>(
//                 k, List<dynamic>.from(v.map((x) => x)))),
//         penjelas: Map.from(json["penjelas"]).map((k, v) =>
//             MapEntry<String, List<dynamic>>(
//                 k, List<dynamic>.from(v.map((x) => x)))),
//       );

//   Map<String, dynamic> toJson() => {
//         "id_dosis": idDosis,
//         "jenis pemupukan": jenisPemupukan,
//         "variabels": Map.from(variabels).map((k, v) =>
//             MapEntry<String, dynamic>(k, List<dynamic>.from(v.map((x) => x)))),
//         "takaran": Map.from(takaran).map((k, v) =>
//             MapEntry<String, dynamic>(k, List<dynamic>.from(v.map((x) => x)))),
//         "hasil": Map.from(hasil).map((k, v) =>
//             MapEntry<String, dynamic>(k, List<dynamic>.from(v.map((x) => x)))),
//         "penjelas": Map.from(penjelas).map((k, v) =>
//             MapEntry<String, dynamic>(k, List<dynamic>.from(v.map((x) => x)))),
//       };
// }
List tambahanPropertyKal = [
  {},
  {
    "DataTabel": [],
    "luasMedia": {},
    "luasMedia3D": {},
    "Hasilluas3D": 0,
    "satuanMediaLahan3D": "cm",
    "StringAi": "",
    "CostumevolumeAir": false,

    "namaTanaman": "",
    "satuanMediaLahan": ["m", "m"],
    "pHData": {},
    "adaUkurPH": false,
    "ketebalanTanah": 0.0,
    "adaJenisTanah": false,
    "adaPakanAlternatif": false,
    "ukuranPotCostume": false,
    "alternatifPakan": {
      "Protein Pakan Pabrik %": 38.0,
      "Protein Maggot %": 40.0,
      "Kebutuhan Protein Ayam %": 38.0,
      "Persentase Pakan Pabrik %": 50.0,
    },
    "umur": 7,
    // "massaBibitTotal(Gr)" :0,
    "umurMati": 72,
    // "perkiraanPanenBobotLele(Gr)":0,
    "hargaJual": 1500,
    // "fcr":1.3,
    "peliharaans": 1,
    "Volume Box Air": 80,
    "indexJb": 0,
    "indexbentukmedialahanPot": 0,
    "jenisTempat": 0,
    "lubangtanam": 0,

    "panjangTempatTanam": 0,
    "diameterLubang": 0,
    "JarakLubang": 5,

    "jaraktanamTrue": false,
    "jarakTanam": 0,

    "ukuranPipa": 0,
    "tingkatan": 0,
    "harga/satuan": false,
    "tabelHasil": [],

    "pemetaanTenpat": {
      "tempatPerWadahRawatan": 1,
      "PanjangTempat": 1,
      "maxLevwl": 1,
    },
    "hargaPerBanyakSatuan": {
      "hargaPer": 0,
      "perBanyak": 1,
      "satuan": "ml",
      "hasilrp": 0.0,
    },
    "keperluanLainnya": [
      {"Nama Pengeluaran": "Lahan", "Beban Biaya": 0.0},
      {
        "Nama Pengeluaran": "Pot",
        "Beban Biaya": 30000,
      },
      {
        "Nama Pengeluaran": "Bibit",
        "Beban Biaya": 1000,
      },
      {
        "Nama Pengeluaran": "AB Mix",
        "Beban Biaya": "50000",
      },
      {
        "Nama Pengeluaran": "Obat",
        "Beban Biaya": "0.0",
      },
    ],
    "hasil Akhir": hasilAkhir,
    "tampungan": {
      "indexBentukMediaTanam": 0,
      "indexJenisTanah": 0,
      "indexperusahaan": 0,
      "indexjenisPupuk": 0
    },
    "ukuranPot": []
  },
  {
    "DataTabel": [],
    "luasMedia3D": {},
    "Hasilluas3D": 0,
    "satuanMediaLahan3D": "cm",
    "StringAi": "",
    "satuanMediaLahan": ["m", "m"],
    "pHData": {},
    "adaUkurPH": false,
    "ketebalanTanah": 0.0,
    "aHBaterai": 0.0,
    "jamMatahari": 0,
    "DayaPanel": 0,
    "keperluanLainnya": [
      {
        "Nama Pengeluaran": "Listrik",
        "Daya (watt)": 0.0,
        "Total Nyala (jam)": 0,
        "Watt Hours": 0
      }
    ],
    "hasil Akhir": hasilAkhir,
    "tampungan": {
      "indexBentukMediaTanam": 0,
      "indexJenisTanah": 0,
      "indexperusahaan": 0,
      "indexjenisPupuk": 0
    }
  },
  {
    "DataTabel": [],
    "luasMedia3D": {},
    "Hasilluas3D": 0,
    "satuanMediaLahan3D": "m",
    "StringAi": "",
    "luasMedia": {},
    "satuanMediaLahan": ["m", "m"],
    "pHData": {},
    "adaUkurPH": false,
    "ketebalanTanah": "0.0",
    "adaJenisTanah": false,
    "adaPakanAlternatif": false,
    "alternatifPakan": {
      "Protein Pakan Pabrik %": 38.0,
      "Protein Maggot %": 40.0,
      "Kebutuhan Protein Ikan %": 38.0,
      "Persentase Pakan Pabrik %": 100.0,
    },
    "Edit Nilai Rekomendasi": false,
    "adaPakanAlternatifLainnya": false,
    "tambah pakan alternatif": [
      {"nama": "azolla", "protein %": 30, "harga": 0, "persen pemberian %": 0},
      {"nama": "lemna", "protein %": 35, "harga": 0, "persen pemberian %": 0},
      {"nama": "wolffia", "protein %": 35, "harga": 0, "persen pemberian %": 0},
    ],
    "sr%": 0,
    "massaBibitTotal(Gr)": 60,
    "perkiraanPanenBobotLele(Gr)": 0,
    "fcr": 1.3,
    "indexJb": 0,
    "hargaPerBanyakSatuan": {
      "hargaPer": 0,
      "perBanyak": 1,
      "satuan": "kg",
      "hasilrp": 0.0,
    },
    "hargaPerBanyakSatuanMaggot": {
      "hargaPer": 0,
      "perBanyak": 1,
      "satuan": "kg",
      "hasilrp": 0.0,
    },
    "hargaPerBanyakSatuanPaku": {
      "hargaPer": 0,
      "perBanyak": 1,
      "satuan": "kg",
      "hasilrp": 0.0,
    },
    "keperluanLainnya": [
      {
        "Nama Pengeluaran": "Kolam",
        "Beban Biaya": 0.0,
      },
      {
        "Nama Pengeluaran": "Bibit",
        "Beban Biaya": 0.0,
      },
      {
        "Nama Pengeluaran": "Pakan/Kg",
        "Beban Biaya": "0.0",
      },
      {
        "Nama Pengeluaran": "Pompa",
        "Beban Biaya": 0.0,
      },
      {
        "Nama Pengeluaran": "Pipa",
        "Beban Biaya": 0.0,
      },
      {
        "Nama Pengeluaran": "Vitamin",
        "Beban Biaya": 0.0,
      },
      {
        "Nama Pengeluaran": "Listrik",
        "Beban Biaya": 0.0,
      },
      {
        "Nama Pengeluaran": "Air",
        "Beban Biaya": 0.0,
      },
      {
        "Nama Pengeluaran": "Listrik",
        "Beban Biaya": 0.0,
      }
    ],
    "hasil Akhir": hasilAkhir,
    "tampungan": {
      "indexBentukMediaTanam": 0,
      "indexJenisTanah": 0,
      "indexperusahaan": 3,
      "indexjenisPupuk": 0
    }
  },
  {
    "DataTabel": [],
    "luasMedia": {},
    "luasMedia3D": {},
    "Hasilluas3D": 0,
    "satuanMediaLahan3D": "cm",
    "StringAi": "",
    "peliharaans": 1,
    "satuanMediaLahan": ["m", "m"],
    "pHData": {},
    "adaUkurPH": false,
    "ketebalanTanah": "0.0",
    "adaJenisTanah": false,
    "sr%": 0,
    "massaBibitTotal(Gr)": 0,
    "perkiraanPanenBobotLele(Gr)": 0,
    "fcr": 1.3,
    "indexJb": 0,
    "keperluanLainnya": [
      {
        "Nama Pengeluaran": "Biopond",
        "Beban Biaya": 0.0,
      },
      {
        "Nama Pengeluaran": "Bibit",
        "Beban Biaya": 0.0,
      },
      {
        "Nama Pengeluaran": "Pakan/Kg",
        "Beban Biaya": "0.0",
      },
    ],
    "hasil Akhir": hasilAkhir,
    "tampungan": {
      "indexBentukMediaTanam": 0,
      "indexJenisTanah": 0,
      "indexperusahaan": 3,
      "indexjenisPupuk": 0
    }
  },
  {
    "DataTabel": [],
    "luasMedia": {},
    "StringAi": "",

    "satuanMediaLahan": ["m", "m"],
    "pHData": {},
    "adaUkurPH": false,
    "ketebalanTanah": "0.0",
    "adaJenisTanah": false,
    "adaPakanAlternatif": false,
    "alternatifPakan": {
      "Protein Pakan Pabrik %": 19.0,
      "Protein Maggot %": 40.0,
      "Kebutuhan Protein Ayam %": 18.0,
      "Persentase Pakan Pabrik %": 100,
    },
    "Edit Nilai Rekomendasi": false,
    "adaPakanAlternatifLainnya": false,
    "tambah pakan alternatif": [
      {"nama": "azolla", "protein %": 30, "harga": 0, "persen pemberian %": 0},
      {"nama": "lemna", "protein %": 35, "harga": 0, "persen pemberian %": 0},
      {"nama": "wolffia", "protein %": 35, "harga": 0, "persen pemberian %": 0},
    ],
    // "sr%": 0,
    "umur": 1,
    // "massaBibitTotal(Gr)" :0,
    "umurMati": 2,
    // "perkiraanPanenBobotLele(Gr)":0,
    "hargaJual": 1500,
    // "fcr":1.3,
    "peliharaans": 1,

    "indexJb": 0,
    "hargaPerBanyakSatuan": {
      "hargaPer": 0,
      "perBanyak": 1,
      "satuan": "kg",
      "hasilrp": 0.0,
    },
    "hargaPerBanyakSatuanMaggot": {
      "hargaPer": 0,
      "perBanyak": 1,
      "satuan": "kg",
      "hasilrp": 0.0,
    },
    "hargaPerBanyakSatuanPaku": {
      "hargaPer": 0,
      "perBanyak": 1,
      "satuan": "kg",
      "hasilrp": 0.0,
    },
    "keperluanLainnya": [
      {
        "Nama Pengeluaran": "Kandang",
        "Beban Biaya": 0.0,
      },
      {
        "Nama Pengeluaran": "Ayam petelur",
        "Beban Biaya": 0.0,
      },
      {
        "Nama Pengeluaran": "Pakan/Kg",
        "Beban Biaya": "0.0",
      },
      {
        "Nama Pengeluaran": "Vitamin/Kg",
        "Beban Biaya": "0.0",
      },
    ],
    "hasil Akhir": hasilAkhir,
    "tampungan": {
      "indexBentukMediaTanam": 0,
      "indexJenisTanah": 0,
      "indexperusahaan": 3,
      "indexjenisPupuk": 0
    }
  },
];

class Tanamanbuah {
  int id;
  String namaKomoditi;
  String img;
  String satuan;
  List fieldValue;
  Map menu;

  Tanamanbuah(
      {required this.id,
      required this.namaKomoditi,
      required this.img,
      required this.satuan,
      required this.fieldValue,
      required this.menu});
}

// class DosisPupuk {
//   int id;
//   String namaKomoditi;
//   String img;
//   String satuan;
//   Map<String, dynamic> variabels;
//   List<dynamic> fieldValue;
//   Map<String, dynamic> takaran;
//   Map<String, dynamic> hasil;
//   Map<String, dynamic> penjelas;
//   int category;

//   DosisPupuk(
//       {this.id,
//       this.namaKomoditi,
//       this.img,
//       this.satuan,
//       this.variabels,
//       this.fieldValue,
//       this.takaran,
//       this.hasil,
//       this.penjelas,
//       this.category});
// }

// Perhitungan pupuk per luas lahan / Ha
// class PerhitunganDosisPupuk {
//   int id;
//   String nama;
//   String img;
//   Map<String, dynamic> input;
//   Map<String, dynamic> proses;
//   Map<String, dynamic> output;
//   Map<String, dynamic> prosesperhitungan;
//   Map<String, dynamic> penjelas;

//   PerhitunganDosisPupuk(
//       {this.id,
//       this.nama,
//       this.img,
//       this.input,
//       this.proses,
//       this.output,
//       this.prosesperhitungan,
//       this.penjelas});
// }

// Baru ===>
// class KategoriSatuan {
//   int id;
//   String satuan;
//   KategoriSatuan({this.id, this.satuan});
// }

// List<KategoriSatuan> dataKategoriSatuan = [
//   for (var i = 0; i < kategoriSatuan.length; i++)
//     KategoriSatuan(
//       id: i,
//       satuan: kategoriSatuan[i]["satuan"],
//     )
// ];

// class KategoriPerusahaan {
//   int id;
//   String perusahaan;
//   KategoriPerusahaan({this.id, this.perusahaan});
// }

// List<KategoriPerusahaan> dataKategoriPerusahaan = [
//   for (var i = 0; i < kategoriPerusahaan.length; i++)
//     KategoriPerusahaan(
//       id: i,
//       perusahaan: kategoriPerusahaan[i]["perusahaan"],
//     )
// ];

// class KategoriProduk {
//   int id;
//   String produk;

//   KategoriProduk({this.id, this.produk});
// }

// List<KategoriProduk> dataKategoriProduk = [
//   for (var i = 0; i < kategoriProduk.length; i++)
//     KategoriProduk(
//       id: i,
//       produk: kategoriProduk[i]["produk"],
//     )
// ];

List<DataProducts> filterdataByPerusahaan(int idPrusahaan) {
  return dataProductsObj
      .where((element) => element.idPerusahaan == idPrusahaan)
      .toList();
}

List<DataProducts> filterdataByMenuRawatan(String id) {
  return dataProductsObj
      .where((element) => element.id_MenuRawatan == id)
      .toList();
}

List<Diskon> filterdataByDiskon(String id) {
  return datadiskon.where((element) => element.id_MenuRawatan == id).toList();
}

List<DataProducts> filterdataByPromo() {
  List<DataProducts> dataProdukk1 =
      filterdataByMenuRawatan(c.indexMenuRawatan.value.toString())
          .where((element) => element.diskon >= 1 && element.countdownku != "")
          .toList();
  // print(dataProdukk1);
  try {
    // dataProdukk1.sort((a, b) => DateTime.parse(b.countdownku).millisecondsSinceEpoch.compareTo(DateTime.parse(a.countdownku).millisecondsSinceEpoch));

    // Memecah string menjadi komponen tanggal dan waktu

    dataProdukk1.sort((a, b) {
      String ass = a.countdownku.replaceAll("'", '"');
      String bss = b.countdownku.replaceAll("'", '"');
      String timeea = ass;
      String timeeb = bss;

      return DateTime.parse(timeeb)
          .millisecondsSinceEpoch
          .compareTo(DateTime.parse(timeea).millisecondsSinceEpoch);
    });
    // print("kokol ${dataProdukk1.map((e) => e.countdownku)}");
  } catch (e) {
    dataProdukk1.sort((a, b) {
      String ass = a.countdownku.replaceAll("'", '"');
      String bss = b.countdownku.replaceAll("'", '"');
      String timeea = ass;
      String timeeb = bss;

      // print(dataProdukk1.map((e) => e.countdownku));
      return DateTime.parse(timeeb)
          .millisecondsSinceEpoch
          .compareTo(DateTime.parse(timeea).millisecondsSinceEpoch);
    });
    // print("kol ${dataProdukk1.map((e) => e.countdownku)}");
  }

  //
  return dataProdukk1;
}

String downku = filterdataByPromo()[0].countdownku;

String ds(dateString) {
  // Memecah string menjadi komponen tanggal dan waktu
  List<String> parts = dateString.split(' ');
  String datePart = parts[0];
  String timePart = parts[1];

  // Memecah komponen tanggal menjadi tahun, bulan, dan hari
  List<String> dateComponents = datePart.split('-');
  int year = int.parse(dateComponents[0]);
  int month = int.parse(dateComponents[1]);
  int day = int.parse(dateComponents[2]);

  // Memecah komponen waktu menjadi jam, menit, detik, dan milidetik
  List<String> timeComponents = timePart.split(':');
  int hour = int.parse(timeComponents[0]);
  int minute = int.parse(timeComponents[1]);
  int second =
      int.parse(timeComponents[2].split('.')[0]); // Mengabaikan milidetik

  // Mengonversi ke objek DateTime
  DateTime dateTime = DateTime(year, month, day, hour, minute, second);
  return dateTime.toString();
}

List<List> filterdataByBundle(String id) {
  List<DataProducts> dataProdukku = dataProductsObj;

  // dataProdukku =  dataProductsObjOnLine;

  List<DataProducts> dataProdukk1 = dataProdukku
      .where((element) => (element.id_MenuRawatan == id &&
          List.from(element.bundle['Paket bundle']).isNotEmpty))
      .toList();

  List<DataProducts> dataProdukk = dataProdukku
      .where((element) => (element.id_MenuRawatan == id &&
          List.from(element.bundle['Paket bundle']).isNotEmpty))
      .toList();
  // print("${dataProdukk} produksasasa");

  List<dynamic> asa =
      dataProdukk.map((e) => (e.bundle['Paket bundle'])).toList();
  List<DataProducts> filteredProducts = [];
  List<List<DataProducts>> a1 = [];
  List<List<DataProducts>> a2 = [];

  if (asa.isEmpty) {
    filteredProducts = [];
    print("${dataProdukk1.map((e) => e.id)} produksasasa");
  } else {
    for (int u = 0; u < asa.length; u++) {
      List<DataProducts> data = dataProdukku
          .where((element) => (element.id_MenuRawatan == id))
          .toList();
      a1.add(dataProdukku
          .where((element) => (asa[u].contains(element.id)))
          .toList());
    }

    // filteredProducts = dataProdukku.where((element) => (element.id_MenuRawatan == id && asa[0].contains(element.id)))!.toList();
  }
  for (int u = 0; u < a1.length; u++) {
    if (a1[u].toString() == "[]") {
    } else {
      List<DataProducts> a3 = [];
      a3.add(dataProdukk[u]);
      for (int ui = 0; ui < a1[u].length; ui++) {
        a3.add(a1[u][ui]);
      }
      a2.add(a3);
    }
  }

  // print("${ a2} produk");

// Tambahkan elemen-elemen yang sudah difilter ke dalam dataProdukk
  dataProdukk.addAll(filteredProducts);

  return [dataProdukk, a2];
}
// List<DataProducts> selectedCategoryList = filterdataByPerusahaan(0);

List filterdata(String jenisdata) {
  List listFilter = dataDosisPengaplikasianObj
      .where((element) => element.jenisPemupukan == jenisdata)
      .toList();
  // print(listFilter);
  return listFilter;
}

// List listDPB = dataDosisPengaplikasianObj
//     .where((element) => element.jenisPemupukan == "Berimbang")
//     .toList();
// List listDPM = dataDosisPengaplikasianObj
//     .where((element) => element.jenisPemupukan == "Majemuk")
//     .toList();
List listDPT = dataDosisPengaplikasianObj
    .where((element) => element.jenisPemupukan == "Tunggal")
    .toList();
// List listOca = dataDosisPengaplikasianObj
//     .where((element) => element.jenisPemupukan == "Oca")
//     .toList();
// List listNiphos = dataDosisPengaplikasianObj
//     .where((element) => element.jenisPemupukan == "Niphos")
//     .toList();

// List listNitrat = dataDosisPengaplikasianObj
//     .where((element) => element.jenisPemupukan == "Nitrat")
//     .toList();

// List listNingrat = dataDosisPengaplikasianObj
//     .where((element) => element.jenisPemupukan == "Ningrat")
//     .toList();

// List listDPHMeroke = dataDosisPengaplikasianObj
//     .where((element) => element.jenisPemupukan == "Meroke Hortikultura")
//     .toList();
// List listDPPMeroke = dataDosisPengaplikasianObj
//     .where((element) => element.jenisPemupukan == "Meroke Pangan")
//     .toList();
//

List<MyData> parentData = [
  MyData(
      komoditi: datatampungKomw[0]['komoditi'],
      boolKom: datatampungKomw[0]['boolKom'],
      boolKomHarga: datatampungKomw[0]['boolKomHarga'],
      visiKom: datatampungKomw[0]['visiKom'],
      pupuk: datatampungKomw[0]['pupuk'],
      luas: datatampungKomw[0]['luas'],
      visiKomHarga: datatampungKomw[0]['visiKomHarga'],
      dataHarga: datatampungKomw[0]['dataHarga'],
      hasilTotal: datatampungKomw[0]['hasilTotal'],
      hasilRp: datatampungKomw[0]['hasilRp'],
      indexsubmenu: datatampungKomw[0]["indexsubmenu"],
      indexmenu: datatampungKomw[0]["indexmenu"],
      idmediatanam: datatampungKomw[0]["idmediatanam"],
      rumus: datatampungKomw[0]["rumus"],
      multi: datatampungKomw[0]["multi"],
      kesimpulansub: datatampungKomw[0]["kesimpulansub"],
      kesimpulanAkhir: datatampungKomw[0]["kesimpulanAkhir"],
      varii: datatampungKomw[0]['varii'],
      kategoriRumusKu: datatampungKomw[0]["kategoriRumusKu"],
      propertyLainnya: datatampungKomw[0]['propertyLainnya'],
      id: datatampungKomw[0]['id'],
      namaId: datatampungKomw[0]['namaId'])
];

List<MyData> parentDataKolam = [
  MyData(
      komoditi: datatampungKomw[0]['komoditi'],
      boolKom: datatampungKomw[0]['boolKom'],
      boolKomHarga: datatampungKomw[0]['boolKomHarga'],
      visiKom: datatampungKomw[0]['visiKom'],
      pupuk: datatampungKomw[0]['pupuk'],
      luas: datatampungKomw[0]['luas'],
      visiKomHarga: datatampungKomw[0]['visiKomHarga'],
      dataHarga: datatampungKomw[0]['dataHarga'],
      hasilTotal: datatampungKomw[0]['hasilTotal'],
      hasilRp: datatampungKomw[0]['hasilRp'],
      indexsubmenu: datatampungKomw[0]["indexsubmenu"],
      indexmenu: datatampungKomw[0]["indexmenu"],
      idmediatanam: datatampungKomw[0]["idmediatanam"],
      rumus: datatampungKomw[0]["rumus"],
      multi: datatampungKomw[0]["multi"],
      kesimpulansub: datatampungKomw[0]["kesimpulansub"],
      kesimpulanAkhir: datatampungKomw[0]["kesimpulanAkhir"],
      varii: datatampungKomw[0]['varii'],
      kategoriRumusKu: datatampungKomw[0]["kategoriRumusKu"],
      propertyLainnya: datatampungKomw[0]['propertyLainnya'],
      id: datatampungKomw[0]['id'],
      namaId: datatampungKolam[0]['namaId'])
];
//
// List<MyData> filterparentData = [MyData(
//     komoditi: datatampungKomw[0]['komoditi'],
//     boolKom: datatampungKomw[0]['boolKom'],
//     boolKomHarga: datatampungKomw[0]['boolKomHarga'],
//     visiKom: datatampungKomw[0]['visiKom'],
//     pupuk: datatampungKomw[0]['pupuk'],
//     luas: datatampungKomw[0]['luas'],
//     visiKomHarga: datatampungKomw[0]['visiKomHarga'],
//     dataHarga: datatampungKomw[0]['dataHarga'],
//     hasilTotal: datatampungKomw[0]['hasilTotal'],
//     hasilRp: datatampungKomw[0]['hasilRp'],
//     indexsubmenu: datatampungKomw[0]["indexsubmenu"],
//     indexmenu: datatampungKomw[0]["indexmenu"],
//     idmediatanam: datatampungKomw[0]["idmediatanam"],
//     rumus: datatampungKomw[0]["rumus"],
//     multi: datatampungKomw[0]["multi"],
//     kesimpulansub: datatampungKomw[0]["kesimpulansub"],
//     kesimpulanAkhir: datatampungKomw[0]["kesimpulanAkhir"],
//     varii: datatampungKomw[0]['varii'],
//     kategoriRumusKu: datatampungKomw[0]["kategoriRumusKu"],
//     propertyLainnya: datatampungKomw[0]['propertyLainnya'], id: datatampungKomw[0]['id'], namaId: datatampungKomw[0]['namaId']
// )];
List KumpulanHarga = [];

class VarController extends GetxController {
  var selectobjPemupukan = 0.obs;

  var lists = [].obs;
  var layerinfo = true.obs;
  var labelLayerinfo = "Lahan".obs;

  var tampungidx = [0, 0].obs;
  var sizes = [].obs;

  // var indpots = 8.obs;
  // var selectedItemprev = 0.obs;
  // var selectedItem = 0.obs;
  // var selectedItemprev2 = 0.obs;
  // var selectedItem2 = 0.obs;
  // var idMassaJenis = 0.obs;
  // var idKomoditis = 0.obs;
  // var indes = 0.obs;
  // var checkeds = false.obs;
  // var datashasilfix = [].obs;

  // CART
  var cartsku = [].obs;
  var totalcart = 0.obs;
  var isLoadButton = false.obs;
  var datasize = Size(0, 0).obs;
  var datadosis = [].obs;
  var namaObj = "".obs;

  // DETAIL PRODUK
  //
  // var produkku = DataProducts(id: 0,
  //   idPerusahaan: 0,
  //   nama: "Urea",
  //   kandungan: 46,
  //   bentuk:"granul",
  //   title: "Pupuk Urea",
  //   color: ["049942", "011d0d", "034f23"],
  //   penjelas: "PT. Petrokimia Gresik",
  //   img: "assets/images/product/subnonsub_urea.png",
  //   brosure: ["assets/images/brosure/urea_1.jpg"],
  //   informasi: {
  //     "spesifikasi": [
  //       "Kadar air maksimal 0,50%",
  //       "Kadar Biuret maksimal 1%",
  //       "Kadar Nitrogen minimal 46%",
  //       "Bentuk butiran tidak berdebu",
  //       "Warna putih (non subsidi)",
  //       "Warna pink untuk Urea Bersubsidi",
  //       "Dikemas dalam kantong dengan isi 50 kg"
  //     ],
  //     "sifat": ["Higroskopis", "Mudah larut dalam air"],
  //     "manfaat": [
  //       "Membuat bagian tanaman lebih hijau dan segar",
  //       "Mempercepat pertumbuhan",
  //       "Menambah kandungan protein hasil panen"
  //     ],
  //     "gejalaKekurangan": [
  //       "Seluruh tanaman berwarna pucat kekuningan",
  //       "Pertumbuhan tanaman lambat dan kerdil",
  //       "Daun tua berwarna kekuningan. Pada tanaman padi dimulai dari ujung daun menjalar ke tulang daun",
  //       "Pertumbuhan buah tidak sempurna seringkali masak sebelum waktunya",
  //       "Jika dalam keadaan kekurangan yang parah daun menjadi kering dimulai dari bagian bawah tanaman terus ke bagian atas tanaman."
  //     ],
  //   },
  //   kategoriProduk: 0, quantity: 0,).obs;

  var produkku = DataProducts(
          id: 0,
          idPerusahaan: 0,
          nama: '',
          bentuk: '',
          kandungan: 0,
          title: '',
          color: [],
          penjelas: '',
          img: '',
          brosure: [],
          informasi: {},
          kategoriProduk: 0,
          quantity: 0,
          harga: "",
          bundle: {},
          diskon: 0,
          id_MenuRawatan: "0",
          countdownku: '',
          linkSp: '')
      .obs;

  // Kalkulasi
  var idTipeMediaTanam = 0.obs;

  //convert
  var indexConvert = 0.obs;
  var hasilconvert = listPHIndikator.obs;

  //card komoditi

  //satuan luas
  var satuan = "m".obs;
  var checked = false.obs;
  var idMassaJenis = 0.obs;
  var selectedItemCalcT = 0.obs;
  var selectedItemCalcTprev = 0.obs;
  var indpots = 8.obs;
  var sizeslayers = [].obs;

  var dataobjectkalkulator = [].obs;

  //hasil kalkulasi pupuk
  var datashasilfix = [
    DataObjHasilTakaran(
      idPerusahaan: 0,
      jenisPemupukan: '',
      dataDosis: {},
      dataPengaplikasian: {},
      penjelas: '',
      dataHarga: {},
    )
  ].obs;

  // //tambah runagan
  // var datatampungField = [
  //   MyData(
  //       komoditi: 'rumah_bagian_utama',
  //       boolKom: false,
  //       boolKomHarga: false,
  //       visiKom: false,
  //       pupuk: [
  //         Pupukw(
  //             boolPup: false,
  //             visiPup: false,
  //             namaPupu: 'Lampu',
  //             watt: '0',
  //             LamaListring: '0',
  //             Rumus: '',
  //             hasil: '0',
  //             img: '')
  //       ],
  //       luas: 'daya 450 VA (Volt Ampere) bersubsidi',
  //       visiKomHarga: false,
  //       dataHarga: [],
  //       hasilTotal: '0', hasilRp: 0, indexsubmenu: 0, indexmenu: 0, )
  // ].obs;

  var isScroll = false.obs;
  var isviewdialog = false.obs;
  var isviewdialogValid = false.obs;
  var indexselectmediaLahan = 0.obs;
  var isviewRegister = false.obs;

  var isdialogPenting = true.obs;

  var isdialogpesan = false.obs;
  var iskoneksi = false.obs;
  var isviewlayer = true.obs;
  var islabelLayer = "Lahan".obs;
  var islabelLayerNow = "Lahan".obs;
  var luasmediaTanam = "".obs;
  var typeTanah = "".obs;
  var volumeTanah1Ha = 0.0.obs;
  var id_type_tanah = 0.obs;
  var dataMenuKalkulasi = [].obs;
  var indexa = 0.obs;
  var massaJenis = 0.0.obs;
  var indexdropdown = 0.obs;

  var dataObjectKalkulator = [].obs;

  var ObjectIndexSelectedEdit = 0.obs;

  // var datahasilfix = [
  //   DataObjHasilTakaran(
  //       idPerusahaan: 0,
  //       jenisPemupukan: '',
  //       dataDosis: {},
  //       dataPengaplikasian: {},
  //       penjelas: '', dataHarga: {})
  // ].obs;

  // var dataParent = [
  //   MyData(
  //   komoditi: datatampungKomw[0]['komoditi'],
  //   boolKom: datatampungKomw[0]['boolKom'],
  //   boolKomHarga: datatampungKomw[0]['boolKomHarga'],
  //   visiKom: datatampungKomw[0]['visiKom'],
  //   pupuk: datatampungKomw[0]['pupuk'],
  //   luas: datatampungKomw[0]['luas'],
  //   visiKomHarga: datatampungKomw[0]['visiKomHarga'],
  //   dataHarga: datatampungKomw[0]['dataHarga'],
  //   hasilTotal: datatampungKomw[0]['hasilTotal'],
  //   hasilRp: datatampungKomw[0]['hasilRp'],
  //   indexsubmenu: datatampungKomw[0]["indexsubmenu"],
  //   indexmenu: datatampungKomw[0]["indexmenu"],
  //   idmediatanam: datatampungKomw[0]["idmediatanam"],
  //   rumus: datatampungKomw[0]["rumus"],
  //   multi: datatampungKomw[0]["multi"],
  //   kesimpulansub: datatampungKomw[0]["kesimpulansub"],
  //   kesimpulanAkhir: datatampungKomw[0]["kesimpulanAkhir"],
  //   varii: datatampungKomw[0]['varii'],
  //     kategoriRumusKu: datatampungKomw[0]["kategoriRumusKu"],
  //      propertyLainnya: datatampungKomw[0]['propertyLainnya'], id: datatampungKomw[0]['id']
  // )].obs;

// var  filterdataParent = [MyData(
//   id: datatampungKomw[0]['id'],
//   komoditi: datatampungKomw[0]['komoditi'],
//   boolKom: datatampungKomw[0]['boolKom'],
//   boolKomHarga: datatampungKomw[0]['boolKomHarga'],
//   visiKom: datatampungKomw[0]['visiKom'],
//   pupuk: datatampungKomw[0]['pupuk'],
//   luas: datatampungKomw[0]['luas'],
//   visiKomHarga: datatampungKomw[0]['visiKomHarga'],
//   dataHarga: datatampungKomw[0]['dataHarga'],
//   hasilTotal: datatampungKomw[0]['hasilTotal'],
//   hasilRp: datatampungKomw[0]['hasilRp'],
//   indexsubmenu: datatampungKomw[0]["indexsubmenu"],
//   indexmenu: datatampungKomw[0]["indexmenu"],
//   idmediatanam: datatampungKomw[0]["idmediatanam"],
//   rumus: datatampungKomw[0]["rumus"],
//   multi: datatampungKomw[0]["multi"],
//   kesimpulansub: datatampungKomw[0]["kesimpulansub"],
//   kesimpulanAkhir: datatampungKomw[0]["kesimpulanAkhir"],
//   varii: datatampungKomw[0]['varii'],
//   kategoriRumusKu: datatampungKomw[0]["kategoriRumusKu"],
//  propertyLainnya: datatampungKomw[0]['propertyLainnya'],
// )].obs;

  // var datahasilfixNew = [
  //   DataObjHasilTakaran(
  //       idPerusahaan: 0,
  //       jenisPemupukan: '',
  //       dataDosis: {},
  //       dataPengaplikasian: {},
  //       penjelas: '', dataHarga: {})
  // ].obs;

  var indexdropdownPrushn = 0.obs;
  var indexdropdownjenisPemupukan = 0.obs;
  var Checksatuandalamtanah = false.obs;

  // var satuandalamtanah = false.obs;

  var control = {}.obs;

  // var dataDosis = [].obs;
  // var sas = onPresosMtT(0).obs;
  // // var dataRumusPerKomoditi = filterdata(String jenisdata);
  // var dataRumusPerKomoditiB = listDPB.obs;
  // var dataRumusPerKomoditiM = listDPM.obs;
  // var dataRumusPerKomoditiT = listDPT.obs;

  // var dataRumusPerKomoditiOca = listOca.obs;
  // var dataRumusPerKomoditiNiphos = listNiphos.obs;
  // var dataRumusPerKomoditiNitrat = listNitrat.obs;
  // var dataRumusPerKomoditiNingrat = listNingrat.obs;

  // var dataRumusHortikulturaMeroke = listDPHMeroke.obs;
  // var dataRumusPanganMeroke = listDPPMeroke.obs;
  // // var dataRumusPerKomoditiT = listDPT.obs;

  // var dataTanamanbuah = listtanamanbuah.obs;
  // var dataTypeLahan = listTypeLahan.obs;
  // var statesTypelahan = 0.obs;
  var indexTanamanbuah = 0.obs;
  var indexMenuRawatan = 0.obs;
  var indexsubMenuRawatan = 0.obs;
  var myUserId = "".obs;
  var connection_e = true.obs;
  var checkKegiatanMenu = true.obs;
  var palette = [
    Colors.white,
    Colors.white24,
    Colors.black45,
    Colors.black87,
    Colors.black
  ].obs;
  var noOfPaletteColors = 4.obs;
  var photos = [].obs;
  var palette_product = [
    Colors.white,
    Colors.white24,
    Colors.black45,
    Colors.black87,
    Colors.black
  ].obs;

  var AcontrolHarga = [].obs;

  final flashOnController = TextEditingController(text: 'Flash on').obs;
  final flashOffController = TextEditingController(text: 'Flash off').obs;
  final cancelController = TextEditingController(text: 'Cancel').obs;

  var aspectTolerance = 0.00.obs;
  var numberOfCameras = 0.obs;
  var selectedCamera = -1.obs;
  var useAutoFocus = true.obs;
  var autoEnableFlash = false.obs;

  var selectsubmenu = 0.obs;

  var selectedItem = 0.obs;
  var indexw = 0.obs;
// var data_inputkus = {}.obs;
// var data_inputkusAwaL = {}.obs;
//
// var temaTerang = Colors.white.obs;
// var temaGelap = Colors.black87.obs;
  var namaTanaman = "".obs;
}

final VarController c = Get.put(VarController());

late Random random;

late Color colorBackground;
late String imageDominan;

// void main() {
//   // var nama = c.dataRumusPerKomoditiB[0].namaKomoditi.obs;
//   print(c.dataRumusPerKomoditiB[0].namaKomoditi);
//   print("Sebelum -> ${c.dataRumusPerKomoditiB[0].namaKomoditi}");
//   c.dataRumusPerKomoditiB.refresh();
//   c.dataRumusPerKomoditiB[0].obs.update((value) {
//     value.namaKomoditi = 'AGUNG ->';
//   });
//   print("Sesudah -> ${c.dataRumusPerKomoditiB[0].namaKomoditi}");
// }
