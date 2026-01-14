import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:rawatt/screens/convert/component/Widget_Jenis_Tanah.dart';

import '../../rumus.dart';
import 'package:function_tree/function_tree.dart';

import '../../screens/convert/component/inisialisasi_var.dart';
import '../dosis/fieldku_campur.dart';

List kategoriInisialisasi = [
  {
    "id": 0,
    "var": "a",
    "nilai": 0.0,
    "satuan": "m",
    "id_MenuRawatan": 1,
    "ket": "alas"
  },
  {
    "id": 1,
    "var": "t",
    "nilai": 0.0,
    "satuan": "m",
    "id_MenuRawatan": 1,
    "ket": "tinggi"
  },
  {
    "id": 2,
    "var": "s",
    "nilai": 0.0,
    "satuan": "m",
    "id_MenuRawatan": 1,
    "ket": "sisi"
  },
  {
    "id": 3,
    "var": "p",
    "nilai": 0.0,
    "satuan": "m",
    "id_MenuRawatan": 1,
    "ket": "panjang"
  },
  {
    "id": 4,
    "var": "l",
    "nilai": 0.0,
    "satuan": "m",
    "id_MenuRawatan": 1,
    "ket": "lebar"
  },
  {
    "id": 5,
    "var": "d",
    "nilai": 0.0,
    "satuan": "m",
    "id_MenuRawatan": 1,
    "ket": "Diagonal 1"
  },
  {
    "id": 6,
    "var": "f",
    "nilai": 0.0,
    "satuan": "m",
    "id_MenuRawatan": 1,
    "ket": "Diagonal 2"
  },
  {
    "id": 7,
    "var": "b",
    "nilai": 0.0,
    "satuan": "m",
    "id_MenuRawatan": 1,
    "ket": "sisi miring"
  },
  {
    "id": 8,
    "var": "r",
    "nilai": 0.0,
    "satuan": "m",
    "id_MenuRawatan": 1,
    "ket": "jari-jari"
  },
  {
    "id": 10,
    "var": "q",
    "nilai": 0.0,
    "satuan": "Kg/m³",
    "id_MenuRawatan": 1,
    "ket": "massa jenis"
  },
  {
    "id": 11,
    "var": "vTHa",
    "nilai": 0.0,
    "satuan": "m³",
    "id_MenuRawatan": 1,
    "ket": "Volume Tanah 1 Ha"
  },
  {
    "id": 12,
    "var": "vTPt",
    "nilai": 0.0,
    "satuan": "m³",
    "id_MenuRawatan": 1,
    "ket": "Volume Tanah Pot"
  },
  {
    "id": 13,
    "var": "LMt",
    "nilai": 0.0,
    "satuan": "m²",
    "id_MenuRawatan": 1,
    "ket": "Luas Media Tanam"
  },
  {
    "id": 14,
    "var": "LJt",
    "nilai": 0.0,
    "satuan": "m²",
    "id_MenuRawatan": 1,
    "ket": "Luas Jarak Tanam"
  },
  {
    "id": 15,
    "var": "bdgn",
    "nilai": 0.0,
    "satuan": "m²",
    "id_MenuRawatan": 1,
    "ket": "Bedengan"
  },
  {
    "id": 16,
    "var": "N",
    "nilai": 0.0,
    "satuan": "Kg",
    "id_MenuRawatan": 1,
    "ket": "Nitrogen"
  },
  {
    "id": 17,
    "var": "P",
    "nilai": 0.0,
    "satuan": "Kg",
    "id_MenuRawatan": 1,
    "ket": "Fosfor"
  },
  {
    "id": 18,
    "var": "K",
    "nilai": 0.0,
    "satuan": "Kg",
    "id_MenuRawatan": 1,
    "ket": "Kalium"
  },
  {
    "id": 19,
    "var": "bTHa",
    "nilai": 0.0,
    "satuan": "Kg",
    "id_MenuRawatan": 1,
    "ket": "Berat Tanah 1 Ha"
  },
  {
    "id": 20,
    "var": "bTPt",
    "nilai": 0.0,
    "satuan": "Kg",
    "id_MenuRawatan": 1,
    "ket": "Berat Tanah Pot"
  },
  {
    "id": 21,
    "var": "GN",
    "nilai": 0.0,
    "satuan": "%",
    "id_MenuRawatan": 1,
    "ket": "Gride Fertilizer Nitrogen"
  },
  {
    "id": 22,
    "var": "GP",
    "nilai": 0.0,
    "satuan": "%",
    "id_MenuRawatan": 1,
    "ket": "Gride Fertilizer Fosfor"
  },
  {
    "id": 23,
    "var": "GK",
    "nilai": 0.0,
    "satuan": "%",
    "id_MenuRawatan": 1,
    "ket": "Gride Fertilizer Kalium"
  },
  {
    "id": 24,
    "var": "bPK",
    "nilai": 0.0,
    "satuan": "Kg",
    "id_MenuRawatan": 1,
    "ket": "Berat Pupuk"
  },
  {
    "id": 25,
    "var": "GNPK",
    "nilai": 0.0,
    "satuan": "%",
    "id_MenuRawatan": 1,
    "ket": "Gride Fertilizer NPK"
  },
  {
    "id": 26,
    "var": "JPk",
    "nilai": 0.0,
    "satuan": "Kg",
    "id_MenuRawatan": 1,
    "ket": "Pupuk"
  },
  {
    "id": 27,
    "var": "Ri",
    "nilai": 0.0,
    "satuan": "m",
    "id_MenuRawatan": 1,
    "ket": "jari-jari 1"
  },
  {
    "id": 28,
    "var": "tPt",
    "nilai": 0.0,
    "satuan": "m",
    "id_MenuRawatan": 1,
    "ket": "Kedalaman Pot (t)"
  },
  {
    "id": 29,
    "var": "peJt",
    "nilai": 0.0,
    "satuan": "m",
    "id_MenuRawatan": 1,
    "ket": "Jarak Tanam Vertikal"
  },
  {
    "id": 30,
    "var": "kkJt",
    "nilai": 0.0,
    "satuan": "m",
    "id_MenuRawatan": 1,
    "ket": "Jarak Tanam Horizontal"
  },
  {
    "id": 31,
    "var": "Popt",
    "nilai": 0.0,
    "satuan": "m",
    "id_MenuRawatan": 1,
    "ket": "Populasi Tanaman"
  },
  {
    "id": 32,
    "var": "KPprPT",
    "nilai": 0.0,
    "satuan": "m",
    "id_MenuRawatan": 1,
    "ket": "Kebutuhan Pupuk Per Populasi Tanaman"
  },
  {
    "id": 33,
    "var": "pH",
    "nilai": 0.0,
    "satuan": "",
    "id_MenuRawatan": 1,
    "ket": "Tingkatan pH"
  },
  {
    "id": 33,
    "var": "KpH",
    "nilai": 0.0,
    "satuan": "Ton",
    "id_MenuRawatan": 1,
    "ket": "Kebutuhan kapur pH"
  },
  {
    "id": 34,
    "var": "VMt",
    "nilai": 0.0,
    "satuan": "m³",
    "id_MenuRawatan": 1,
    "ket": "Volume Media Tanam"
  },
  {
    "id": 35,
    "var": "JTaw",
    "nilai": 0.0,
    "satuan": "km",
    "id_MenuRawatan": 0,
    "ket": "Angka odometer Awal"
  },
  {
    "id": 36,
    "var": "JTah",
    "nilai": 0.0,
    "satuan": "km",
    "id_MenuRawatan": 0,
    "ket": "Angka odometer Akhir"
  },
  {
    "id": 37,
    "var": "JKbBkr",
    "nilai": 0.0,
    "satuan": "l",
    "id_MenuRawatan": 0,
    "ket": "Jumlah Konsumsi Bahan Bakar"
  },
  {
    "id": 38,
    "var": "KBBM",
    "nilai": 0.0,
    "satuan": "km/l",
    "id_MenuRawatan": 0,
    "ket": "Konsumsi BBM"
  },
  {
    "id": 39,
    "var": "hrgaP",
    "nilai": 0.0,
    "satuan": "Rp",
    "id_MenuRawatan": 1,
    "ket": "Harga Pupuk"
  },
  {
    "id": 40,
    "var": "hrgaLstrk",
    "nilai": 0.0,
    "satuan": "Rp",
    "id_MenuRawatan": 2,
    "ket": "Harga Kolam"
  },
  {
    "id": 41,
    "var": "hrgaPPerLhn",
    "nilai": 0.0,
    "satuan": "Rp",
    "id_MenuRawatan": 1,
    "ket": "Harga pupuk per media tanam"
  },

  //kolam ====?

  {
    "id": 0,
    "var": "a",
    "nilai": 0.0,
    "satuan": "m",
    "id_MenuRawatan": 3,
    "ket": "alas"
  },
  {
    "id": 1,
    "var": "t",
    "nilai": 0.0,
    "satuan": "m",
    "id_MenuRawatan": 3,
    "ket": "tinggi"
  },
  {
    "id": 2,
    "var": "s",
    "nilai": 0.0,
    "satuan": "m",
    "id_MenuRawatan": 3,
    "ket": "sisi"
  },
  {
    "id": 3,
    "var": "p",
    "nilai": 0.0,
    "satuan": "m",
    "id_MenuRawatan": 3,
    "ket": "panjang"
  },
  {
    "id": 4,
    "var": "l",
    "nilai": 0.0,
    "satuan": "m",
    "id_MenuRawatan": 3,
    "ket": "lebar"
  },
  {
    "id": 5,
    "var": "d",
    "nilai": 0.0,
    "satuan": "m",
    "id_MenuRawatan": 3,
    "ket": "Diagonal 1"
  },
  {
    "id": 6,
    "var": "f",
    "nilai": 0.0,
    "satuan": "m",
    "id_MenuRawatan": 3,
    "ket": "Diagonal 2"
  },
  {
    "id": 7,
    "var": "b",
    "nilai": 0.0,
    "satuan": "m",
    "id_MenuRawatan": 3,
    "ket": "sisi miring"
  },
  {
    "id": 8,
    "var": "r",
    "nilai": 0.0,
    "satuan": "m",
    "id_MenuRawatan": 3,
    "ket": "jari-jari"
  },
  {
    "id": 10,
    "var": "q",
    "nilai": 0.0,
    "satuan": "Kg/m³",
    "id_MenuRawatan": 3,
    "ket": "massa jenis"
  },
  {
    "id": 11,
    "var": "vTHa",
    "nilai": 0.0,
    "satuan": "m³",
    "id_MenuRawatan": 3,
    "ket": "Volume Tanah 1 Ha"
  },
  {
    "id": 12,
    "var": "vTPt",
    "nilai": 0.0,
    "satuan": "m³",
    "id_MenuRawatan": 3,
    "ket": "Volume Tanah Pot"
  },
  {
    "id": 13,
    "var": "LMt",
    "nilai": 0.0,
    "satuan": "m²",
    "id_MenuRawatan": 3,
    "ket": "Luas Media Tanam"
  },
  {
    "id": 14,
    "var": "LJt",
    "nilai": 0.0,
    "satuan": "m²",
    "id_MenuRawatan": 3,
    "ket": "Luas Jarak Tanam"
  },
  {
    "id": 15,
    "var": "bdgn",
    "nilai": 0.0,
    "satuan": "m²",
    "id_MenuRawatan": 3,
    "ket": "Bedengan"
  },
  {
    "id": 16,
    "var": "N",
    "nilai": 0.0,
    "satuan": "Kg",
    "id_MenuRawatan": 3,
    "ket": "Nitrogen"
  },
  {
    "id": 17,
    "var": "P",
    "nilai": 0.0,
    "satuan": "Kg",
    "id_MenuRawatan": 3,
    "ket": "Fosfor"
  },
  {
    "id": 18,
    "var": "K",
    "nilai": 0.0,
    "satuan": "Kg",
    "id_MenuRawatan": 3,
    "ket": "Kalium"
  },
  {
    "id": 19,
    "var": "bTHa",
    "nilai": 0.0,
    "satuan": "Kg",
    "id_MenuRawatan": 3,
    "ket": "Berat Tanah 1 Ha"
  },
  {
    "id": 20,
    "var": "bTPt",
    "nilai": 0.0,
    "satuan": "Kg",
    "id_MenuRawatan": 3,
    "ket": "Berat Tanah Pot"
  },
  {
    "id": 21,
    "var": "GN",
    "nilai": 0.0,
    "satuan": "%",
    "id_MenuRawatan": 3,
    "ket": "Gride Fertilizer Nitrogen"
  },
  {
    "id": 22,
    "var": "GP",
    "nilai": 0.0,
    "satuan": "%",
    "id_MenuRawatan": 3,
    "ket": "Gride Fertilizer Fosfor"
  },
  {
    "id": 23,
    "var": "GK",
    "nilai": 0.0,
    "satuan": "%",
    "id_MenuRawatan": 3,
    "ket": "Gride Fertilizer Kalium"
  },
  {
    "id": 24,
    "var": "bPK",
    "nilai": 0.0,
    "satuan": "Kg",
    "id_MenuRawatan": 3,
    "ket": "Berat Pupuk"
  },
  {
    "id": 25,
    "var": "GNPK",
    "nilai": 0.0,
    "satuan": "%",
    "id_MenuRawatan": 3,
    "ket": "Gride Fertilizer NPK"
  },
  {
    "id": 26,
    "var": "JPk",
    "nilai": 0.0,
    "satuan": "Kg",
    "id_MenuRawatan": 3,
    "ket": "Pupuk"
  },
  {
    "id": 27,
    "var": "Ri",
    "nilai": 0.0,
    "satuan": "m",
    "id_MenuRawatan": 3,
    "ket": "jari-jari 1"
  },
  {
    "id": 28,
    "var": "tPt",
    "nilai": 0.0,
    "satuan": "m",
    "id_MenuRawatan": 3,
    "ket": "Kedalaman Pot (t)"
  },
  {
    "id": 29,
    "var": "peJt",
    "nilai": 0.0,
    "satuan": "m",
    "id_MenuRawatan": 3,
    "ket": "Jarak Tanam Vertikal"
  },
  {
    "id": 30,
    "var": "kkJt",
    "nilai": 0.0,
    "satuan": "m",
    "id_MenuRawatan": 3,
    "ket": "Jarak Tanam Horizontal"
  },
  {
    "id": 31,
    "var": "Popt",
    "nilai": 0.0,
    "satuan": "m",
    "id_MenuRawatan": 3,
    "ket": "Populasi Tanaman"
  },
  {
    "id": 32,
    "var": "KPprPT",
    "nilai": 0.0,
    "satuan": "m",
    "id_MenuRawatan": 3,
    "ket": "Kebutuhan Pupuk Per Populasi Tanaman"
  },
  {
    "id": 33,
    "var": "pH",
    "nilai": 0.0,
    "satuan": "",
    "id_MenuRawatan": 3,
    "ket": "Tingkatan pH"
  },
  {
    "id": 33,
    "var": "KpH",
    "nilai": 0.0,
    "satuan": "Ton",
    "id_MenuRawatan": 3,
    "ket": "Kebutuhan kapur pH"
  },
  {
    "id": 34,
    "var": "VMt",
    "nilai": 0.0,
    "satuan": "m³",
    "id_MenuRawatan": 3,
    "ket": "Volume Media Tanam"
  },
];

class KategoriInisialisasi {
  int id;
  String vari;
  double nilai;
  String satuan;
  String ket;
  int id_MenuRawatan;

  KategoriInisialisasi(
      {required this.id,
      required this.vari,
      required this.nilai,
      required this.satuan,
      required this.ket,
      required this.id_MenuRawatan});
}

List<KategoriInisialisasi> dataKategoriInisialisasi = [
  for (var i = 0; i < kategoriInisialisasi.length; i++)
    KategoriInisialisasi(
        id: i,
        vari: kategoriInisialisasi[i]["var"],
        nilai: kategoriInisialisasi[i]["nilai"],
        satuan: kategoriInisialisasi[i]["satuan"],
        ket: kategoriInisialisasi[i]["ket"],
        id_MenuRawatan: kategoriInisialisasi[i]["id_MenuRawatan"])
];

List kategoriRumus = [
  {
    "id": 0,
    "idKalkulasi": 0,
    "idMediaTanam": 0,
    "vari": "LMt",
    "nama": "Persegi Panjang",
    "rumus": "p*l",
    "value": {},
    "fieldValue": [],
    "id_MenuRawatan": 1,
    "img": ""
  },
  // {
  //   "id": 1,
  //   "idKalkulasi": 0,
  //   "idMediaTanam": 0,
  //   "vari": "LMt",
  //   "nama": "Persegi",
  //   "rumus": "s*s",
  //   "value": {},
  //   "fieldValue": [],
  //   "id_MenuRawatan": 1,
  //   "img": ""
  // },
  // {
  //   "id": 2,
  //   "idKalkulasi": 0,
  //   "idMediaTanam": 0,
  //   "vari": "LMt",
  //   "nama": "Segitiga",
  //   "rumus": "(1/2)*a*t",
  //   "value": {},
  //   "fieldValue": [],
  //   "id_MenuRawatan": 1,
  //   "img": ""
  // },
  //
  // {
  //   "id": 3,
  //   "idKalkulasi": 0,
  //   "idMediaTanam": 0,
  //   "vari": "LMt",
  //   "nama": "Jajar Genjang",
  //   "rumus": "a*t",
  //   "value": {},
  //   "fieldValue": [],
  //   "id_MenuRawatan": 1,
  //   "img": ""
  // },
  // {
  //   "id": 4,
  //   "idKalkulasi": 0,
  //   "idMediaTanam": 0,
  //   "vari": "LMt",
  //   "nama": "Belah Ketupat",
  //   "rumus": "(1/2)*d*f",
  //   "value": {},
  //   "fieldValue": [],
  //   "id_MenuRawatan": 1,
  //   "img": ""
  // },
  // {
  //   "id": 5,
  //   "idKalkulasi": 0,
  //   "idMediaTanam": 0,
  //   "vari": "LMt",
  //   "nama": "Layang-layang",
  //   "rumus": "(1/2)*d*f",
  //   "value": {},
  //   "fieldValue": [],
  //   "id_MenuRawatan": 1,
  //   "img": ""
  // },
  // {
  //   "id": 6,
  //   "idKalkulasi": 0,
  //   "idMediaTanam": 0,
  //   "vari": "LMt",
  //   "nama": "Trapesium",
  //   "rumus": "(1/2)*(a+b)*t",
  //   "value": {},
  //   "fieldValue": [],
  //   "id_MenuRawatan": 1,
  //   "img": ""
  // },
  // {
  //   "id": 7,
  //   "idKalkulasi": 0,
  //   "idMediaTanam": 0,
  //   "vari": "LMt",
  //   "nama": "Lingkaran",
  //   "rumus": "3.14*r*r",
  //   "value": {},
  //   "fieldValue": [],
  //   "id_MenuRawatan": 1,
  //   "img": ""
  // },
  {
    "id": 8,
    "idKalkulasi": 0,
    "idMediaTanam": 1,
    "vari": "LMt",
    "nama": "Balok",
    "rumus": "p * l * t",
    "value": {},
    "fieldValue": [],
    "id_MenuRawatan": 1,
    "img": "assets/images/pot/balok.png"
  },
  {
    "id": 9,
    "idKalkulasi": 0,
    "idMediaTanam": 1,
    "vari": "LMt",
    "nama": "Kerucut Potong",
    "rumus": "(1/3) * 3.14 * t * (r^2 + (r * Ri) + Ri^2)",
    "value": {},
    "fieldValue": [],
    "id_MenuRawatan": 1,
    "img": "assets/images/pot/kerucutTerpotong.png"
  },
  {
    "id": 10,
    "idKalkulasi": 0,
    "idMediaTanam": 1,
    "vari": "LMt",
    "nama": "Setengah Bola",
    "rumus": "(2/3) * 3.14 * t^3 ",
    "value": {},
    "fieldValue": [],
    "id_MenuRawatan": 1,
    "img": "assets/images/pot/setengahBola.png"
  },
  {
    "id": 11,
    "idKalkulasi": 0,
    "idMediaTanam": 1,
    "vari": "LMt",
    "nama": "Tabung",
    "rumus": "3.14 * t * r^3",
    "value": {},
    "fieldValue": [],
    "id_MenuRawatan": 1,
    "img": "assets/images/pot/tabung.png"
  },
  {
    "id": 12,
    "idKalkulasi": 0,
    "idMediaTanam": 1,
    "vari": "LMt",
    "nama": "Zona Bola",
    "rumus": "(3.14  * t)/ 6 * ((3 * r^2) + (3 * r^2) + t^2 )",
    "value": {},
    "fieldValue": [],
    "id_MenuRawatan": 1,
    "img": "assets/images/pot/zonabola.png"
  },
  {
    "id": 13,
    "idKalkulasi": 2,
    "idMediaTanam": 999,
    "vari": "vTHa",
    "nama": "Volume Tanah 1 Ha",
    "rumus": "(tPt*10000)",
    "value": {},
    "fieldValue": [],
    "id_MenuRawatan": 1,
    "img": ""
  },
  {
    "id": 14,
    "idKalkulasi": 2,
    "idMediaTanam": 999,
    "vari": "bTHa",
    "nama": "Berat Tanah 1 Ha",
    "rumus": "(q) * vTHa",
    "value": {},
    "fieldValue": [],
    "id_MenuRawatan": 1,
    "img": ""
  },
  {
    "id": 15,
    "idKalkulasi": 2,
    "idMediaTanam": 999,
    "vari": "vTPt",
    "nama": "Volume Tanah Pot",
    "rumus": "LMt",
    "value": {},
    "fieldValue": [],
    "id_MenuRawatan": 1,
    "img": ""
  },
  {
    "id": 16,
    "idKalkulasi": 2,
    "idMediaTanam": 999,
    "vari": "bTPt",
    "nama": "Massa Tanah Pot",
    "rumus": "q * vTPt",
    "value": {},
    "fieldValue": [],
    "id_MenuRawatan": 1,
    "img": ""
  },
  {
    "id": 17,
    "idKalkulasi": 1,
    "idMediaTanam": 2,
    "vari": "LJt",
    "nama": "Luas Jarak Tanam",
    "rumus": "peJt * kkJt",
    "value": {},
    "fieldValue": [],
    "id_MenuRawatan": 1,
    "img": ""
  },
  // {
  //   "id": 18,
  //   "idKalkulasi": 0,
  //   "idMediaTanam": 0,
  //   "vari": "LMt",
  //   "nama": "Luas Bedengan",
  //   "rumus": "(p * l)*bdgn",
  //   "value": {},
  //   "fieldValue": [],
  //   "id_MenuRawatan": 1,
  //   "img": ""
  // },
  {
    "id": 19,
    "idKalkulasi": 0,
    "idMediaTanam": 999,
    "vari": "KPprLn",
    "nama": "Kebutuhan Pupuk Per Lahan",
    "rumus": "(LMt/10000)*JPk",
    "value": {},
    "fieldValue": [],
    "id_MenuRawatan": 1,
    "img": ""
  },
  {
    "id": 20,
    "idKalkulasi": 0,
    "idMediaTanam": 999,
    "vari": "KPprPot",
    "nama": "Kebutuhan Pupuk Per Pot",
    "rumus": "(bTPt/bTHa)*JPk",
    "value": {},
    "fieldValue": [],
    "id_MenuRawatan": 1,
    "img": ""
  },
  {
    "id": 21,
    "idKalkulasi": 0,
    "idMediaTanam": 999,
    "vari": "tPt",
    "nama": "Kedalaman Pot",
    "rumus": "t",
    "value": {},
    "fieldValue": [],
    "id_MenuRawatan": 1,
    "img": ""
  },
  {
    "id": 22,
    "idKalkulasi": 0,
    "idMediaTanam": 999,
    "vari": "Popt",
    "nama": "Populasi Tanaman",
    "rumus": "LMt/LJt",
    "value": {},
    "fieldValue": [],
    "id_MenuRawatan": 1,
    "img": ""
  },
  {
    "id": 23,
    "idKalkulasi": 0,
    "idMediaTanam": 999,
    "vari": "KPprPT",
    "nama": "Kebutuhan Pupuk Per Populasi Tanaman",
    "rumus": "(4/Popt)*JPk",
    "value": {},
    "fieldValue": [],
    "id_MenuRawatan": 1,
    "img": ""
  },
  {
    "id": 24,
    "idKalkulasi": 0,
    "idMediaTanam": 999,
    "vari": "KpH",
    "nama": "Kebutuhan Kapur untuk pH Tanah",
    "rumus": "(LMt/10000)*pH",
    "value": {},
    "fieldValue": [],
    "id_MenuRawatan": 1,
    "img": ""
  },
  // {
  //   "id": 25,
  //   "idKalkulasi": 0,
  //   "idMediaTanam": 999,
  //   "vari": "KpH",
  //   "nama": "Kebutuhan Kapur untuk pH Tanah",
  //   "rumus": "(LMt/10000)*pH",
  //   "value": {},
  //   "fieldValue": [],
  //   "id_MenuRawatan": 1,
  //   "img": ""
  // },
  {
    "id": 25,
    "idKalkulasi": 0,
    "idMediaTanam": 4,
    "vari": "KBBM",
    "nama": "Konsumsi BBM",
    "rumus": "(JTah - JTaw)/JKbBkr",
    "value": {},
    "fieldValue": [],
    "id_MenuRawatan": 0,
    "img": ""
  },
  {
    "id": 26,
    "idKalkulasi": 0,
    "idMediaTanam": 999,
    "vari": "hrgaPPerLhn",
    "nama": "Harga kebutuhan pupuk perlahan",
    "rumus": "KPprLn*hrgaP",
    "value": {},
    "fieldValue": [],
    "id_MenuRawatan": 1,
    "img": ""
  },
  {
    "id": 27,
    "idKalkulasi": 0,
    "idMediaTanam": 999,
    "vari": "JPkPrpp",
    "nama": "Multi Pupuk",
    "rumus": "Jpk*hrgaP",
    "value": {},
    "fieldValue": [],
    "id_MenuRawatan": 1,
    "img": ""
  },

  //KOlam ======?
  {
    "id": 28,
    "idKalkulasi": 0,
    "idMediaTanam": 1,
    "vari": "LMt",
    "nama": "Balok",
    "rumus": "p * l * t",
    "value": {},
    "fieldValue": [],
    "id_MenuRawatan": 3,
    "img": "assets/images/pot/balok.png"
  },
  {
    "id": 29,
    "idKalkulasi": 0,
    "idMediaTanam": 1,
    "vari": "LMt",
    "nama": "Kerucut Potong",
    "rumus": "(1/3) * 3.14 * t * (r^2 + (r * Ri) + Ri^2)",
    "value": {},
    "fieldValue": [],
    "id_MenuRawatan": 3,
    "img": "assets/images/pot/kerucutTerpotong.png"
  },
  {
    "id": 30,
    "idKalkulasi": 0,
    "idMediaTanam": 1,
    "vari": "LMt",
    "nama": "Setengah Bola",
    "rumus": "(2/3) * 3.14 * t^3 ",
    "value": {},
    "fieldValue": [],
    "id_MenuRawatan": 3,
    "img": "assets/images/pot/setengahBola.png"
  },
  {
    "id": 31,
    "idKalkulasi": 0,
    "idMediaTanam": 1,
    "vari": "LMt",
    "nama": "Tabung",
    "rumus": "3.14 * t * r^3",
    "value": {},
    "fieldValue": [],
    "id_MenuRawatan": 3,
    "img": "assets/images/pot/tabung.png"
  },
  {
    "id": 32,
    "idKalkulasi": 0,
    "idMediaTanam": 1,
    "vari": "LMt",
    "nama": "Zona Bola",
    "rumus": "(3.14  * t)/ 6 * ((3 * r^2) + (3 * r^2) + t^2 )",
    "value": {},
    "fieldValue": [],
    "id_MenuRawatan": 3,
    "img": "assets/images/pot/zonabola.png"
  },
  {
    "id": 33,
    "idKalkulasi": 2,
    "idMediaTanam": 999,
    "vari": "vTHa",
    "nama": "Volume Tanah 1 Ha",
    "rumus": "(tPt*10000)",
    "value": {},
    "fieldValue": [],
    "id_MenuRawatan": 3,
    "img": ""
  },
  {
    "id": 34,
    "idKalkulasi": 2,
    "idMediaTanam": 999,
    "vari": "bTHa",
    "nama": "Berat Tanah 1 Ha",
    "rumus": "(q) * vTHa",
    "value": {},
    "fieldValue": [],
    "id_MenuRawatan": 3,
    "img": ""
  },
  {
    "id": 35,
    "idKalkulasi": 2,
    "idMediaTanam": 999,
    "vari": "vTPt",
    "nama": "Volume Tanah Pot",
    "rumus": "LMt",
    "value": {},
    "fieldValue": [],
    "id_MenuRawatan": 3,
    "img": ""
  },
  {
    "id": 36,
    "idKalkulasi": 2,
    "idMediaTanam": 999,
    "vari": "bTPt",
    "nama": "Massa Tanah Pot",
    "rumus": "q * vTPt",
    "value": {},
    "fieldValue": [],
    "id_MenuRawatan": 3,
    "img": ""
  },
  {
    "id": 37,
    "idKalkulasi": 1,
    "idMediaTanam": 2,
    "vari": "LJt",
    "nama": "Luas Jarak Tanam",
    "rumus": "peJt * kkJt",
    "value": {},
    "fieldValue": [],
    "id_MenuRawatan": 3,
    "img": ""
  },
  // {
  //   "id": 38,
  //   "idKalkulasi": 0,
  //   "idMediaTanam": 0,
  //   "vari": "LMt",
  //   "nama": "Luas Bedengan",
  //   "rumus": "(p * l)*bdgn",
  //   "value": {},
  //   "fieldValue": [],
  //   "id_MenuRawatan": 3,
  //   "img": ""
  // },
  {
    "id": 39,
    "idKalkulasi": 0,
    "idMediaTanam": 999,
    "vari": "KPprLn",
    "nama": "Kebutuhan Pupuk Per Lahan",
    "rumus": "(LMt/10000)*JPk",
    "value": {},
    "fieldValue": [],
    "id_MenuRawatan": 3,
    "img": ""
  },
  {
    "id": 40,
    "idKalkulasi": 0,
    "idMediaTanam": 999,
    "vari": "KPprPot",
    "nama": "Kebutuhan Pupuk Per Pot",
    "rumus": "(bTPt/bTHa)*JPk",
    "value": {},
    "fieldValue": [],
    "id_MenuRawatan": 3,
    "img": ""
  },
  {
    "id": 41,
    "idKalkulasi": 0,
    "idMediaTanam": 999,
    "vari": "tPt",
    "nama": "Kedalaman Pot",
    "rumus": "t",
    "value": {},
    "fieldValue": [],
    "id_MenuRawatan": 3,
    "img": ""
  },
  {
    "id": 42,
    "idKalkulasi": 0,
    "idMediaTanam": 999,
    "vari": "Popt",
    "nama": "Populasi Tanaman",
    "rumus": "LMt/LJt",
    "value": {},
    "fieldValue": [],
    "id_MenuRawatan": 3,
    "img": ""
  },
  {
    "id": 43,
    "idKalkulasi": 0,
    "idMediaTanam": 999,
    "vari": "KPprPT",
    "nama": "Kebutuhan Pupuk Per Populasi Tanaman",
    "rumus": "(4/Popt)*JPk",
    "value": {},
    "fieldValue": [],
    "id_MenuRawatan": 3,
    "img": ""
  },
  {
    "id": 44,
    "idKalkulasi": 0,
    "idMediaTanam": 999,
    "vari": "KpH",
    "nama": "Kebutuhan Kapur untuk pH Tanah",
    "rumus": "(LMt/10000)*pH",
    "value": {},
    "fieldValue": [],
    "id_MenuRawatan": 3,
    "img": ""
  },

  {
    "id": 46,
    "idKalkulasi": 0,
    "idMediaTanam": 999,
    "vari": "hrgaPPerLhn",
    "nama": "Harga kebutuhan pupuk perlahan",
    "rumus": "KPprLn*hrgaP",
    "value": {},
    "fieldValue": [],
    "id_MenuRawatan": 3,
    "img": ""
  },
  {
    "id": 47,
    "idKalkulasi": 0,
    "idMediaTanam": 999,
    "vari": "JPkPrpp",
    "nama": "Multi Pupuk",
    "rumus": "Jpk*hrgaP",
    "value": {},
    "fieldValue": [],
    "id_MenuRawatan": 3,
    "img": ""
  },
];

class KategoriRumus {
  int id;
  int idKalkulasi;
  int idMediaTanam;
  String vari;
  String nama;
  String rumus;
  Map valuess;
  // List fieldValue;
  String img;
  int id_MenuRawatan;

  KategoriRumus(
      {required this.id,
      required this.idKalkulasi,
      required this.idMediaTanam,
      required this.vari,
      required this.nama,
      required this.rumus,
      required this.valuess,
      // required this.fieldValue,
      required this.img,
      required this.id_MenuRawatan});

  static Map<String, dynamic> toMap(KategoriRumus kategoriRumus) => {
        'id': kategoriRumus.id,
        'idKalkulasi': kategoriRumus.idKalkulasi,
        'idMediaTanam': kategoriRumus.idMediaTanam,
        'vari': kategoriRumus.vari,
        'nama': kategoriRumus.nama,
        'rumus': kategoriRumus.rumus,
        'valuess': kategoriRumus.valuess,
        // 'fieldValue': kategoriRumus.fieldValue,
        'img': kategoriRumus.img,
        'id_MenuRawatan': kategoriRumus.id_MenuRawatan
      };

  KategoriRumus.fromJson(Map json)
      : id = json['id'],
        idKalkulasi = json['idKalkulasi'],
        idMediaTanam = json['idMediaTanam'],
        vari = json['vari'],
        nama = json['nama'],
        rumus = json['rumus'],
        valuess = json['valuess'],
        // fieldValue = json['fieldValue'],
        img = json['img'],
        id_MenuRawatan = json['id_MenuRawatan'];

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'idKalkulasi': idKalkulasi,
      'idMediaTanam': idMediaTanam,
      'vari': vari,
      'nama': nama,
      'rumus': rumus,
      'valuess': valuess,
      'img': img,
      'id_MenuRawatan': id_MenuRawatan,
    };
  }

  static String encode(List<KategoriRumus> kategoriRumus) => json.encode(
        kategoriRumus
            .map<Map<String, dynamic>>(
              (kategoriRumus) => KategoriRumus.toMap(kategoriRumus),
            )
            .toList(),
      );

  static List<KategoriRumus> decodeList(String kategoriRumus) =>
      (json.decode(kategoriRumus) as List<dynamic>)
          .map<KategoriRumus>(
            (item) => KategoriRumus.fromJson(item),
          )
          .toList();
}

List<KategoriRumus> dataKategoriRumus = [
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
];

List<KategoriRumus> dataKategoriRumus1 = [
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
];

List<List<KategoriRumus>> dataKategoriRumusku = [];

List<KategoriRumus> FdatakategoryRumus(int idMenuRawatan,
    List<KategoriRumus> dataKategoriRumua, int idMediaTanam) {
  List<KategoriRumus>? data;
  data = dataKategoriRumua
      .where((element) =>
          element.id_MenuRawatan == idMenuRawatan &&
          element.idMediaTanam == idMediaTanam)
      .toList();
  return data;
}

Map satuanpengaplikasianPupuk = {};

List multiVarHasilNew(
  Map dosisawal,
  Map<String, Map> takaran,
  String varYangBerkaitan,
  String varYangMulti,
  double hasillahan,
) {
  print("1. dosisawal $dosisawal");

  print("2. takaran $takaran");

  print("3. varYangBerkaitan $varYangBerkaitan");

  print("4. varYangMulti $varYangMulti");
  List hasilTotal = [];
  Map waktuPengaplikasian = {};

  Map datab = {};
  Map datac = {};

  // String elemente = "";
  dosisawal.forEach((k, elementi) {
    // rumus.forEach((element) {
    List varrumus = varYangBerkaitan
        .replaceAll(RegExp(r'([^a-zA-Z_])'), '-')
        .split("-")
        .toSet()
        .toList();
    bool varss = varrumus.remove("");

    for (int o = 0; o < varrumus.length; o++) {
      datab[varrumus[o]] = varrumus[o] == varYangMulti
          ? [
              (dataKategoriInisialisasi
                  .where((element) => element.vari == varrumus[o])
                  .first
                  .ket),
              elementi[1]
            ]
          : [
              (dataKategoriInisialisasi
                  .where((element) => element.vari == varrumus[o])
                  .first
                  .ket),
              hasillahan
            ];
    }

    datac[elementi[0]] =
        "${convertRumus(datab, varYangBerkaitan).interpret().toDouble()} ${elementi[2]}";
    satuanpengaplikasianPupuk[elementi[0]] = elementi[2];
  });
  // print("5. datac ${datac}");
  int e = 0;
  takaran.forEach((key, eli) {
    Map dosisPengaplikasian = {};
    String elements = "";
    eli.forEach((keyi, el) {
      Map vars = {};
      List varrumus = varYangBerkaitan
          .replaceAll(RegExp(r'([^a-zA-Z_])'), '-')
          .split("-")
          .toSet()
          .toList();
      bool varss = varrumus.remove("");
      for (int o = 0; o < varrumus.length; o++) {
        vars[varrumus[o]] = varrumus[o] == varYangMulti
            ? [
                (dataKategoriInisialisasi
                    .where((varYangBerkaitan) =>
                        varYangBerkaitan.vari == varrumus[o])
                    .first
                    .ket),
                el
              ]
            : [
                (dataKategoriInisialisasi
                    .where((element) => element.vari == varrumus[o])
                    .first
                    .ket),
                hasillahan
              ];
      }
      dosisPengaplikasian[keyi] =
          "${convertRumus(vars, varYangBerkaitan).interpret().toDouble()} ${List.of(dosisawal.values.where((element) => element[0] == keyi).last).last}";
      hasilTotal
          .add(convertRumus(vars, varYangBerkaitan).interpret().toDouble());
      elements = varYangBerkaitan;
      waktuPengaplikasian[key] = dosisPengaplikasian;
    });
    e += 1;
  });

  return [waktuPengaplikasian, hasilTotal, datac];
}

List multiVarHasil(Map dosisawal, Map<String, Map> takaran,
    String varYangBerkaitan, String varYangMulti) {
  // print("1. dosisawal ${dosisawal}");
  //
  // print("2. takaran ${takaran}");
  //
  // print("3. varYangBerkaitan ${varYangBerkaitan}");
  //
  // print("4. varYangMulti ${varYangMulti}");
  List hasilTotal = [];
  Map waktuPengaplikasian = {};

  Map datab = {};
  Map datac = {};

  // String elemente = "";
  dosisawal.forEach((k, elementi) {
    // rumus.forEach((element) {
    List varrumus = varYangBerkaitan
        .replaceAll(RegExp(r'([^a-zA-Z_])'), '-')
        .split("-")
        .toSet()
        .toList();
    bool varss = varrumus.remove("");

    for (int o = 0; o < varrumus.length; o++) {
      datab[varrumus[o]] = varrumus[o] == varYangMulti
          ? [
              (dataKategoriInisialisasi
                  .where((element) => element.vari == varrumus[o])
                  .first
                  .ket),
              elementi[1]
            ]
          : [
              (dataKategoriInisialisasi
                  .where((element) => element.vari == varrumus[o])
                  .first
                  .ket),
              dataKategoriInisialisasi
                  .where((element) => element.vari == varrumus[o])
                  .first
                  .nilai
            ];
    }

    datac[elementi[0]] =
        "${(convertRumus(datab, varYangBerkaitan).interpret().isNaN) ? 0.toDouble() : convertRumus(datab, varYangBerkaitan).interpret().toDouble()} ${elementi[2]}";

    satuanpengaplikasianPupuk[elementi[0]] = elementi[2];
  });

  int e = 0;
  takaran.forEach((key, eli) {
    Map dosisPengaplikasian = {};
    String elements = "";
    eli.forEach((keyi, el) {
      Map vars = {};
      List varrumus = varYangBerkaitan
          .replaceAll(RegExp(r'([^a-zA-Z_])'), '-')
          .split("-")
          .toSet()
          .toList();
      bool varss = varrumus.remove("");
      for (int o = 0; o < varrumus.length; o++) {
        vars[varrumus[o]] = varrumus[o] == varYangMulti
            ? [
                (dataKategoriInisialisasi
                    .where((varYangBerkaitan) =>
                        varYangBerkaitan.vari == varrumus[o])
                    .first
                    .ket),
                el
              ]
            : [
                (dataKategoriInisialisasi
                    .where((element) => element.vari == varrumus[o])
                    .first
                    .ket),
                dataKategoriInisialisasi
                    .where((element) => element.vari == varrumus[o])
                    .first
                    .nilai
              ];
      }
      dosisPengaplikasian[keyi] =
          "${(convertRumus(vars, varYangBerkaitan).interpret().isNaN) ? 0.0 : convertRumus(vars, varYangBerkaitan).interpret().toDouble()} ${List.of(dosisawal.values.where((element) => element[0] == keyi).last).last}";
      hasilTotal.add((convertRumus(vars, varYangBerkaitan).interpret().isNaN)
          ? 0.0
          : convertRumus(vars, varYangBerkaitan).interpret().toDouble());
      elements = varYangBerkaitan;
      waktuPengaplikasian[key] = dosisPengaplikasian;
    });
    e += 1;
  });

  return [waktuPengaplikasian, hasilTotal, datac];
}

Map variablesNew(String rumus, double valuenya) {
  Map vars = {};
  List varrumus = rumus
      .replaceAll(RegExp(r'([^a-zA-Z_])'), '-')
      .split("-")
      .toSet()
      .toList();
  bool varss = varrumus.remove("");
  // print("varrumus ${varrumus}");
  for (int o = 0; o < varrumus.length; o++) {
    vars[varrumus[o]] = [
      (dataKategoriInisialisasi
          .where((element) => element.vari == varrumus[o])
          .first
          .ket),
      valuenya
    ];
  }
  // print("varrumus ${vars}");
  dataKategoriRumus.where((element) => element.rumus == rumus).first.valuess =
      vars;
  return (vars);
}

Map variables(String rumus) {
  Map vars = {};
  List varrumus = rumus
      .replaceAll(RegExp(r'([^a-zA-Z_])'), '-')
      .split("-")
      .toSet()
      .toList();
  bool varss = varrumus.remove("");
  // print("varrumus ${varrumus}");
  for (int o = 0; o < varrumus.length; o++) {
    vars[varrumus[o]] = [
      (dataKategoriInisialisasi
          .where((element) => element.vari == varrumus[o])
          .first
          .ket),
      dataKategoriInisialisasi
          .where((element) => element.vari == varrumus[o])
          .first
          .nilai
    ];
  }
  print("varrumus $vars");
  // try {
  //   // Potensial untuk menghasilkan pengecualian
  //   dataKategoriRumus.where((element) => element.rumus == rumus).first.valuess =
  //       vars;// Pembagian dengan nol akan menyebabkan pengecualian// Baris ini tidak akan dijalankan jika terjadi pengecualian
  //   return (vars);
  // } catch (e) {
  //   // Blok catch menangkap dan menangani pengecualian
  //   print('Terjadi pengecualian: $e');
  //   return (vars);
  // }
  dataKategoriRumus.where((element) => element.rumus == rumus).first.valuess =
      vars; //

  return (vars);
}

Map variab(String rumus, double newValue) {
  Map vars = {};
  List varrumus = rumus
      .replaceAll(RegExp(r'([^a-zA-Z_])'), '-')
      .split("-")
      .toSet()
      .toList();
  bool varss = varrumus.remove("");
  // print("varrumus ${varrumus}");
  for (int o = 0; o < varrumus.length; o++) {
    vars[varrumus[o]] = [varrumus[o], newValue];
  }
  print("varrumus $vars");
  // dataKategoriRumus.where((element) => element.rumus == rumus).first.valuess =
  //     vars;
  return (vars);
}

Map variabNew(String rumus, double newValue) {
  Map vars = {};
  List varrumus = rumus
      .replaceAll(RegExp(r'([^a-zA-Z_])'), '-')
      .split("-")
      .toSet()
      .toList();
  bool varss = varrumus.remove("");
  // print("varrumus ${varrumus}");
  for (int o = 0; o < varrumus.length; o++) {
    vars[varrumus[o]] = [varrumus[o], newValue];
  }
  print("varrumus $vars");
  // dataKategoriRumus.where((element) => element.rumus == rumus).first.valuess =
  //     vars;
  return (vars);
}

Map variableTextEditing(String rumus) {
  Map vars = {};
  List varrumus = rumus
      .replaceAll(RegExp(r'([^a-zA-Z_])'), '-')
      .split("-")
      .toSet()
      .toList();
  bool varss = varrumus.remove("");
  // print("varrumus ${varrumus}");
  for (int o = 0; o < varrumus.length; o++) {
    vars[varrumus[o]] = [varrumus[o], 0, "m", 0];
  }
  print("opopvae $vars");
  // dataKategoriRumus.where((element) => element.rumus == rumus).first.valuess =
  //     vars;
  return (vars);
}

List a = [
  {
    "rumus": [
      {"LMt": 0.0},
      {"KPprLn": 0.0},
      {"hrgaPPerLhn": 0.0}
    ]
  }
];
