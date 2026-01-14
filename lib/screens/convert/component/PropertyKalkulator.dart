// import 'package:rawatt/screens/convert/component/Widget_Komoditi.dart';
// import 'package:rawatt/screens/convert/screens/anjuran_pupuk_berimbang/myMainPupukBerimbang.dart';
// import 'package:rawatt/screens/convert/screens/anjuran_pupuk_majemuk/myMainPupukMajemuk.dart';
// import 'package:rawatt/screens/convert/screens/anjuran_pupuk_tunggal/myMainPupukTunggal.dart';
import 'package:rawatt/screens/convert/screens/dolomit/myMainDolomit.dart';
import 'package:flutter/material.dart';

import '../screens/dolomit/Dolomit_display.dart';
import 'inisialisasi_var.dart';

class PropertyKalkulator {
  Color tema;
  String typeTema;
  String judul;
  String subjudul;
  String judulimg;
  List imgs;
  String temalendingPotrait;

  List<Widget> widgets;
  PropertyKalkulator(
      {required this.judul,
      required this.subjudul,
      required this.judulimg,
      required this.tema,
      required this.imgs,
      required this.typeTema,
      required this.temalendingPotrait,
      required this.widgets});
}

List<PropertyKalkulator> dataPropertyKalkulator = [
  PropertyKalkulator(
    judul: "Menghitung Kebutuhan Kapur",
    tema: Colors.green,
    subjudul: "Untuk Meningkatkan pH Tanah",
    judulimg: "Kapur Dolomit",
    typeTema: "dolomit",
    temalendingPotrait: "dolomit",
    imgs: ["assets/images/product/Kapur.png"],
    widgets: [
      DolomitBerdasarkanLuas(
        tema: Colors.green,
        indexmenu: c.indexMenuRawatan.value,
        indexsubmenu: c.indexsubMenuRawatan.value,
        onchange: () {},
      ),
      HasilConvertDol(tema: Colors.green)
    ],
  ),
//   PropertyKalkulator(
//       judul: "Conversi Pupuk Majemuk ke Tunggal",
//       tema: Colors.red[800]!,
//       subjudul: "Konversi",
//       judulimg: "Kapur Dolomit",
//       typeTema: "m2t",
//       temalendingPotrait: "m2t",
//       imgs: ["assets/images/product/phonska-plus.png"],
//       widgets: [ConvertMajemuk2Tunggal(
//         tema: Colors.red[800]!,
//       ),
//
//         HasilConvertM2T(tema:Colors.red[800]!)
//       ]),
//   PropertyKalkulator(
//       judul: "Conversi Pupuk Tunggal ke Majemuk",
//       tema: Colors.deepOrange[900]!,
//       subjudul: "Konversi",
//       judulimg: "Kapur Dolomit",
//       typeTema: "t2m",
//       temalendingPotrait: "t2m",
//       imgs: ["assets/images/product/npk-kebomas.png"],
//       widgets: [ConvertTunggal2Majemuk(
//         tema: Colors.deepOrange[900]!,
//       ),HasilConvertT2M()]),
];

List<PropertyKalkulator> dataPropertyKalkulatorMeroke = [];
