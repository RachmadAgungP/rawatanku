import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:rawatt/components/card_judulPetro.dart';
import 'package:rawatt/components/tema_Page.dart';
import 'package:rawatt/constants.dart';
import 'package:rawatt/size_config.dart';

// const dataJson = '''
// [
//   {
//     "category": "Sayuran Daun",
//     "data": [
//       {"Nama Tumbuhan": "Artichoke", "pH": "6.5 – 7.5", "PPM": "560 – 1260"},
//       {"Nama Tumbuhan": "Asparagus", "pH": "6.0 – 6.8", "PPM": "980 – 1200"},
//       {"Nama Tumbuhan": "Bawang Pre", "pH": "6.5 – 7.0", "PPM": "980 – 1260"},
//       {"Nama Tumbuhan": "Bayam", "pH": "6.0 – 7.0", "PPM": "1260 – 1610"},
//       {"Nama Tumbuhan": "Brokoli", "pH": "6.0 – 6.8", "PPM": "1960 – 2450"},
//       {"Nama Tumbuhan": "Brussel Kecambah", "pH": "6.5", "PPM": "1750 – 2100"},
//       {"Nama Tumbuhan": "Endive", "pH": "5.5", "PPM": "1400 – 1680"},
//       {"Nama Tumbuhan": "Kailan", "pH": "5.5 – 6.5", "PPM": "1050 – 1400"},
//       {"Nama Tumbuhan": "Kangkung", "pH": "5.5 – 6.5", "PPM": "1050 – 1400"},
//       {"Nama Tumbuhan": "Kubis", "pH": "6.5 – 7.0", "PPM": "1750 – 2100"},
//       {"Nama Tumbuhan": "Kubis Bunga", "pH": "6.5 – 7.0", "PPM": "1750 – 2100"},
//       {"Nama Tumbuhan": "Pakcoy", "pH": "7.0", "PPM": "1050 – 1400"},
//       {"Nama Tumbuhan": "Sawi Manis", "pH": "5.5 – 6.5", "PPM": "1050 – 1400"},
//       {"Nama Tumbuhan": "Sawi Pahit", "pH": "6.0 – 6.5", "PPM": "840 – 1680"},
//       {"Nama Tumbuhan": "Seledri", "pH": "6.5", "PPM": "1260 – 1680"},
//       {"Nama Tumbuhan": "Selada", "pH": "6.0 – 7.0", "PPM": "560 – 840"},
//       {"Nama Tumbuhan": "Silberbeet", "pH": "6.0 – 7.0", "PPM": "1260 – 1610"}
//     ]
//   },
//   {
//     "category": "Sayuran Buah",
//     "data": [
//       {"Nama Tumbuhan": "Cabe", "pH": "6.0 – 6.5", "PPM": "1260 – 1540"},
//       {"Nama Tumbuhan": "Kacang Polong", "pH": "6.0 – 7.0", "PPM": "980 – 1260"},
//       {"Nama Tumbuhan": "Okra", "pH": "6.5", "PPM": "1400 – 1680"},
//       {"Nama Tumbuhan": "Tomat", "pH": "6.0 – 6.5", "PPM": "1400 – 3500"},
//       {"Nama Tumbuhan": "Terong", "pH": "6.0", "PPM": "1750 – 2450"},
//       {"Nama Tumbuhan": "Timun", "pH": "5.5", "PPM": "1190 – 1750"},
//       {"Nama Tumbuhan": "Timun Jepang", "pH": "6.0", "PPM": "1260 – 1680"}
//     ]
//   },
//   {
//     "category": "Tanaman Buah",
//     "data": [
//       {"Nama Tumbuhan": "Blueberry", "pH": "4.0 – 5.0", "PPM": "1260 – 1400"},
//       {"Nama Tumbuhan": "Kismis Hitam", "pH": "6.0", "PPM": "980 – 1260"},
//       {"Nama Tumbuhan": "Kismis Merah", "pH": "6.0", "PPM": "1400 – 1680"},
//       {"Nama Tumbuhan": "Melon", "pH": "5.5 – 6.0", "PPM": "1400 – 1750"},
//       {"Nama Tumbuhan": "Markisa", "pH": "6.5", "PPM": "840 – 1680"},
//       {"Nama Tumbuhan": "Nanas", "pH": "5.5 – 6.0", "PPM": "1400 – 1680"},
//       {"Nama Tumbuhan": "Pisang", "pH": "5.5 – 6.5", "PPM": "1260 – 1540"},
//       {"Nama Tumbuhan": "Pepaya", "pH": "6.5", "PPM": "840 – 1680"},
//       {"Nama Tumbuhan": "Strawberry", "pH": "6.0", "PPM": "1260 – 1540"},
//       {"Nama Tumbuhan": "Semangka", "pH": "5.8", "PPM": "1260 – 1680"}
//     ]
//   },
//   {
//     "category": "Tanaman Bunga",
//     "data": [
//       {"Nama Tumbuhan": "African Violet", "pH": "6.0 – 7.0", "PPM": "840 – 1050"},
//       {"Nama Tumbuhan": "Anthurium", "pH": "5.0 – 6.0", "PPM": "1120 – 1400"},
//       {"Nama Tumbuhan": "Antirrhinim", "pH": "6.5", "PPM": "1120 – 1400"},
//       {"Nama Tumbuhan": "Aphelandra", "pH": "5.0 – 6.0", "PPM": "1260 – 1680"},
//       {"Nama Tumbuhan": "Aster", "pH": "6.0 – 6.5", "PPM": "1260 – 1680"},
//       {"Nama Tumbuhan": "Begonia", "pH": "6.5", "PPM": "980 – 1260"},
//       {"Nama Tumbuhan": "Bromeliads", "pH": "5.0 -7.5", "PPM": "560 – 840"},
//       {"Nama Tumbuhan": "Caladium", "pH": "6.0 – 7.5", "PPM": "1120 – 1400"},
//       {"Nama Tumbuhan": "Canna", "pH": "6.0", "PPM": "1260 – 1680"},
//       {"Nama Tumbuhan": "Carnation", "pH": "6.0", "PPM": "1260 – 2450"},
//       {"Nama Tumbuhan": "Chrysanthemu", "pH": "6.0 – 6.2", "PPM": "1400 – 1750"},
//       {"Nama Tumbuhan": "Cymbidiums", "pH": "5.5", "PPM": "420 – 560"},
//       {"Nama Tumbuhan": "Dahlia", "pH": "6.0 – 7.0", "PPM": "1050 – 1400"},
//       {"Nama Tumbuhan": "Dieffenbachia", "pH": "5.0", "PPM": "1400 – 1680"},
//       {"Nama Tumbuhan": "Dracaena", "pH": "5.0 – 6.0", "PPM": "1400 – 1680"},
//       {"Nama Tumbuhan": "Ferns", "pH": "6.0", "PPM": "1120 – 1400"},
//       {"Nama Tumbuhan": "Ficus", "pH": "5.5 – 6.0", "PPM": "1120 – 1680"},
//       {"Nama Tumbuhan": "Freesia", "pH": "6.5", "PPM": "700 – 1400"},
//       {"Nama Tumbuhan": "Impatiens", "pH": "5.5 – 6.5", "PPM": "1260 – 1400"},
//       {"Nama Tumbuhan": "Gerbera", "pH": "5.0 – 6.5", "PPM": "1400 – 1750"},
//       {"Nama Tumbuhan": "Gladiolus", "pH": "5.5 – 6.5", "PPM": "1400 – 1680"},
//       {"Nama Tumbuhan": "Monstera", "pH": "5.0 – 6.0", "PPM": "1400 – 1680"},
//       {"Nama Tumbuhan": "Palms", "pH": "6.0 – 7.5", "PPM": "1120 – 1400"},
//       {"Nama Tumbuhan": "Roses", "pH": "5.5 – 6.0", "PPM": "1050 – 1750"},
//       {"Nama Tumbuhan": "Stock", "pH": "6.0 – 7.0", "PPM": "1120 – 1400"}
//     ]
//   },
//   {
//     "category": "Tanaman Umbi",
//     "data": [
//       {"Nama Tumbuhan": "Bawang Merah", "pH": "6.0 – 6.7", "PPM": "980 – 1260"},
//       {"Nama Tumbuhan": "Bawang Putih", "pH": "6.0", "PPM": "980 – 1260"},
//       {"Nama Tumbuhan": "Kentang", "pH": "5.0 – 6.0", "PPM": "1400 – 1750"},
//       {"Nama Tumbuhan": "Lobak", "pH": "6.0 – 6.5", "PPM": "1260 – 1680"},
//       {"Nama Tumbuhan": "Talas", "pH": "5.0 – 5.5", "PPM": "1750 – 2100"},
//       {"Nama Tumbuhan": "Ubi", "pH": "6.0", "PPM": "980 – 1260"},
//       {"Nama Tumbuhan": "Ubi Jalar", "pH": "5.5 – 6.0", "PPM": "1400 – 1750"},
//       {"Nama Tumbuhan": "Wortel", "pH": "6.3", "PPM": "1120 – 1400"}
//     ]
//   },
//   {
//     "category": "Tanaman Herb",
//     "data": [
//       {"Nama Tumbuhan": "Basil (Kemangi)", "pH": "5.5 – 6.5", "PPM": "700 – 1200"},
//       {"Nama Tumbuhan": "Chicory", "pH": "5.5 – 6.0", "PPM": "1400 – 1600"},
//       {"Nama Tumbuhan": "Chives", "pH": "6.0 – 6.5", "PPM": "1260 – 1540"},
//       {"Nama Tumbuhan": "Fennel", "pH": "6.4 – 6.8", "PPM": "700 – 980"},
//       {"Nama Tumbuhan": "Lavender", "pH": "6.4 – 6.8", "PPM": "700 – 980"},
//       {"Nama Tumbuhan": "Lemon Balm", "pH": "5.5 – 6.5", "PPM": "700 – 1120"},
//       {"Nama Tumbuhan": "Marjoram", "pH": "6.0", "PPM": "1120 – 1400"},
//       {"Nama Tumbuhan": "Mint", "pH": "5.5 – 6.0", "PPM": "1400 – 1680"},
//       {"Nama Tumbuhan": "Mustard Cress", "pH": "6.0 – 6.5", "PPM": "840 – 1680"},
//       {"Nama Tumbuhan": "Parsley", "pH": "5.5 – 6.0", "PPM": "560 – 1260"},
//       {"Nama Tumbuhan": "Rosemary", "pH": "5.5 – 6.0", "PPM": "700 – 1120"},
//       {"Nama Tumbuhan": "Sage", "pH": "5.5 – 6.5", "PPM": "700 – 1120"},
//       {"Nama Tumbuhan": "Thyme", "pH": "5.5 – 7.0", "PPM": "560 – 1120"},
//       {"Nama Tumbuhan": "Watercress", "pH": "6.5 – 6.8", "PPM": "280 – 1260"}
//     ]
//   }
// ]
// ''';

const dataJson = '''
[
  {
    "category": "Sayuran Daun",
    "data": [
      {"Nama Tumbuhan": "Bawang Pre", "pH": 7.0, "PPM": 1260.0, "umurPanen": 16, "frekuensiPanenMinggu": 1, "umurTidakProduktif": 16, "pemupukanML": 6.0, "hasilPanenPerTanaman": 0.2, "jaraktanam": 25},
      {"Nama Tumbuhan": "Bayam", "pH": 7.0, "PPM": 1610.0, "umurPanen": 4, "frekuensiPanenMinggu": 1, "umurTidakProduktif": 4, "pemupukanML": 5.0, "hasilPanenPerTanaman": 0.15, "jaraktanam": 20},
      {"Nama Tumbuhan": "Brokoli", "pH": 6.8, "PPM": 2450.0, "umurPanen": 10, "frekuensiPanenMinggu": 1, "umurTidakProduktif": 10, "pemupukanML": 7.0, "hasilPanenPerTanaman": 0.4, "jaraktanam": 40},
      {"Nama Tumbuhan": "Brussel Kecambah", "pH": 6.5, "PPM": 2100.0, "umurPanen": 26, "frekuensiPanenMinggu": 1, "umurTidakProduktif": 26, "pemupukanML": 9.0, "hasilPanenPerTanaman": 0.5, "jaraktanam": 45},
      {"Nama Tumbuhan": "Endive", "pH": 5.5, "PPM": 1680.0, "umurPanen": 12, "frekuensiPanenMinggu": 1, "umurTidakProduktif": 12, "pemupukanML": 6.5, "hasilPanenPerTanaman": 0.25, "jaraktanam": 30},
      {"Nama Tumbuhan": "Kailan", "pH": 6.5, "PPM": 1400.0, "umurPanen": 8, "frekuensiPanenMinggu": 1, "umurTidakProduktif": 8, "pemupukanML": 5.5, "hasilPanenPerTanaman": 0.2, "jaraktanam": 20},
      {"Nama Tumbuhan": "Kangkung", "pH": 6.5, "PPM": 1400.0, "umurPanen": 4, "frekuensiPanenMinggu": 1, "umurTidakProduktif": 4, "pemupukanML": 5.0, "hasilPanenPerTanaman": 0.15, "jaraktanam": 20},
      {"Nama Tumbuhan": "Kubis", "pH": 7.0, "PPM": 2100.0, "umurPanen": 16, "frekuensiPanenMinggu": 1, "umurTidakProduktif": 16, "pemupukanML": 7.5, "hasilPanenPerTanaman": 0.3, "jaraktanam": 30},
      {"Nama Tumbuhan": "Kubis Bunga", "pH": 7.0, "PPM": 2100.0, "umurPanen": 16, "frekuensiPanenMinggu": 1, "umurTidakProduktif": 16, "pemupukanML": 7.5, "hasilPanenPerTanaman": 0.3, "jaraktanam": 30},
      {"Nama Tumbuhan": "Pakcoy", "pH": 7.0, "PPM": 1400.0, "umurPanen": 6, "frekuensiPanenMinggu": 1, "umurTidakProduktif": 6, "pemupukanML": 6.0, "hasilPanenPerTanaman": 0.2, "jaraktanam": 20},
      {"Nama Tumbuhan": "Sawi Manis", "pH": 6.5, "PPM": 1400.0, "umurPanen": 8, "frekuensiPanenMinggu": 1, "umurTidakProduktif": 8, "pemupukanML": 6.0, "hasilPanenPerTanaman": 0.2, "jaraktanam": 20},
      {"Nama Tumbuhan": "Sawi Pahit", "pH": 6.5, "PPM": 1680.0, "umurPanen": 8, "frekuensiPanenMinggu": 1, "umurTidakProduktif": 8, "pemupukanML": 6.0, "hasilPanenPerTanaman": 0.2, "jaraktanam": 20},
      {"Nama Tumbuhan": "Seledri", "pH": 6.5, "PPM": 1680.0, "umurPanen": 12, "frekuensiPanenMinggu": 1, "umurTidakProduktif": 12, "pemupukanML": 6.5, "hasilPanenPerTanaman": 0.25, "jaraktanam": 25},
      {"Nama Tumbuhan": "Selada", "pH": 7.0, "PPM": 840.0, "umurPanen": 4, "frekuensiPanenMinggu": 1, "umurTidakProduktif": 4, "pemupukanML": 5.0, "hasilPanenPerTanaman": 0.15, "jaraktanam": 20},
      {"Nama Tumbuhan": "Silberbeet", "pH": 7.0, "PPM": 1610.0, "umurPanen": 6, "frekuensiPanenMinggu": 1, "umurTidakProduktif": 6, "pemupukanML": 5.5, "hasilPanenPerTanaman": 0.2, "jaraktanam": 20}
    ]
  },
  {
    "category": "Sayuran Buah",
    "data": [
      {"Nama Tumbuhan": "Cabe", "pH": 6.5, "PPM": 1540.0, "umurPanen": 12, "frekuensiPanenMinggu": 2, "umurTidakProduktif": 36, "pemupukanML": 7.5, "hasilPanenPerTanaman": 0.275, "jaraktanam": 30},
      {"Nama Tumbuhan": "Kacang Polong", "pH": 7.0, "PPM": 1260.0, "umurPanen": 14, "frekuensiPanenMinggu": 1, "umurTidakProduktif": 48, "pemupukanML": 5.0, "hasilPanenPerTanaman": 0.4, "jaraktanam": 20},
      {"Nama Tumbuhan": "Okra", "pH": 6.5, "PPM": 1680.0, "umurPanen": 10, "frekuensiPanenMinggu": 2, "umurTidakProduktif": 24, "pemupukanML": 6.5, "hasilPanenPerTanaman": 0.3, "jaraktanam": 25},
      {"Nama Tumbuhan": "Tomat", "pH": 6.5, "PPM": 3500.0, "umurPanen": 8, "frekuensiPanenMinggu": 2, "umurTidakProduktif": 24, "pemupukanML": 8.0, "hasilPanenPerTanaman": 0.4, "jaraktanam": 40},
      {"Nama Tumbuhan": "Terong", "pH": 6.5, "PPM": 2450.0, "umurPanen": 12, "frekuensiPanenMinggu": 1, "umurTidakProduktif": 36, "pemupukanML": 7.5, "hasilPanenPerTanaman": 0.5, "jaraktanam": 50},
      {"Nama Tumbuhan": "Mentimun", "pH": 6.0, "PPM": 1750.0, "umurPanen": 6, "frekuensiPanenMinggu": 2, "umurTidakProduktif": 18, "pemupukanML": 7.0, "hasilPanenPerTanaman": 0.35, "jaraktanam": 30},
      {"Nama Tumbuhan": "Paprika", "pH": 6.5, "PPM": 1540.0, "umurPanen": 10, "frekuensiPanenMinggu": 1, "umurTidakProduktif": 30, "pemupukanML": 7.0, "hasilPanenPerTanaman": 0.3, "jaraktanam": 40},
      {"Nama Tumbuhan": "Melon", "pH": 6.5, "PPM": 1540.0, "umurPanen": 14, "frekuensiPanenMinggu": 1, "umurTidakProduktif": 36, "pemupukanML": 8.5, "hasilPanenPerTanaman": 0.5, "jaraktanam": 50},
      {"Nama Tumbuhan": "Semangka", "pH": 6.8, "PPM": 1680.0, "umurPanen": 16, "frekuensiPanenMinggu": 1, "umurTidakProduktif": 48, "pemupukanML": 9.0, "hasilPanenPerTanaman": 0.6, "jaraktanam": 60},
      {"Nama Tumbuhan": "Labusiam", "pH": 6.8, "PPM": 1750.0, "umurPanen": 14, "frekuensiPanenMinggu": 1, "umurTidakProduktif": 36, "pemupukanML": 8.0, "hasilPanenPerTanaman": 0.5, "jaraktanam": 50},
      {"Nama Tumbuhan": "Zucchini", "pH": 7.5, "PPM": 1680.0, "umurPanen": 8, "frekuensiPanenMinggu": 2, "umurTidakProduktif": 24, "pemupukanML": 7.5, "hasilPanenPerTanaman": 0.35, "jaraktanam": 30}
    ]
  },
  {
    "category": "Tanaman Paku Air",
    "data": [
      {
        "Nama Tumbuhan": "Azolla",
        "pH": 6.0,
        "PPM": 1600.0,
        "umurPanen": 1,
        "frekuensiPanenMinggu": 1,
        "umurTidakProduktif": 10,
        "pemupukanML": 10.0,
        "hasilPanenPerTanaman": 0.5,
        "jaraktanam": 1
      },
      {
        "Nama Tumbuhan": "Lemna",
        "pH": 6.5,
        "PPM": 1200.0,
        "umurPanen": 1,
        "frekuensiPanenMinggu": 1,
        "umurTidakProduktif": 10,
        "pemupukanML": 8.0,
        "hasilPanenPerTanaman": 0.3,
        "jaraktanam": 1
      },
      {
        "Nama Tumbuhan": "Wolffia",
        "pH": 6.5,
        "PPM": 1200.0,
        "umurPanen": 1,
        "frekuensiPanenMinggu": 1,
        "umurTidakProduktif": 90,
        "pemupukanML": 8.0,
        "hasilPanenPerTanaman": 0.2,
        "jaraktanam": 1
      }
    ]
  }
]
''';

class SayuranBuah {
  final String nama;
  final double ph;
  final double ppm;
  final int umurPanen;
  final int frekuensiPanenMinggu;
  final int umurTidakProduktif;
  final double pemupukanML;
  final double hasilPanenPerTanaman;
  final int jaraktanam;

  SayuranBuah({
    required this.nama,
    required this.ph,
    required this.ppm,
    required this.umurPanen,
    required this.frekuensiPanenMinggu,
    required this.umurTidakProduktif,
    required this.pemupukanML,
    required this.hasilPanenPerTanaman,
    required this.jaraktanam,
  });

  factory SayuranBuah.fromJson(Map<String, dynamic> json) {
    return SayuranBuah(
      nama: json['Nama Tumbuhan'],
      ph: json['pH'].toDouble(),
      ppm: json['PPM'].toDouble(),
      umurPanen: json['umurPanen'],
      frekuensiPanenMinggu: json['frekuensiPanenMinggu'],
      umurTidakProduktif: json['umurTidakProduktif'],
      pemupukanML: json['pemupukanML'],
      hasilPanenPerTanaman: json['hasilPanenPerTanaman'],
      jaraktanam: json['jaraktanam'],
    );
  }
}

class SayuranBuahCategory {
  final String category;
  final List<SayuranBuah> data;

  SayuranBuahCategory({required this.category, required this.data});

  factory SayuranBuahCategory.fromJson(Map<String, dynamic> json) {
    var dataList = (json['data'] as List)
        .map((item) => SayuranBuah.fromJson(item))
        .toList();

    return SayuranBuahCategory(
      category: json['category'],
      data: dataList,
    );
  }
}

List<SayuranBuahCategory> parseSayuranBuahData(String jsonString) {
  final parsed = json.decode(jsonString).cast<Map<String, dynamic>>();
  return parsed
      .map<SayuranBuahCategory>((json) => SayuranBuahCategory.fromJson(json))
      .toList();
}

// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Sayuran Hidroponik',
//       theme: ThemeData(
//         primarySwatch: Colors.green,
//       ),
//       home: MyHomePage(),
//     );
//   }
// }

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late List<SayuranBuahCategory> _sayuranBuahData;
  String _searchQuery = '';
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _sayuranBuahData = parseSayuranBuahData(dataJson);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: (SizeConfig.screenWidth! > 600) ? false : true,
        appBar: (SizeConfig.screenWidth! > 600)
            ? appBarLanscape()
            : appBarPotrait(),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.white,
          child: BackgraundPotrait(
            judul: "Hidroponik",
            penjelas: "Tanam hidroponik mu",
            widgets: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(defaultPadding),
                  child: CardListProduct(
                    key: Key("s"),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(defaultPadding / 2),
                  child: _buildCategoryTabs(),
                ),
                Padding(
                  padding: EdgeInsets.all(defaultPadding),
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Cari Sayuran Buah',
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) {
                      setState(() {
                        _searchQuery = value;
                      });
                    },
                  ),
                ),
                SizedBox(
                  height: defaultPadding / 3,
                ),
                Container(
                  // width: 500,
                  height: heightfit(350),
                  padding: EdgeInsets.all(defaultPadding),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10)),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 10,
                          offset: Offset(0, 5),
                          color: Colors.black.withOpacity(.3))
                    ],
                  ),
                  child: _buildCategoryView(),
                ),
                Container()
              ],
            ),
            tema: Colors.green,
            key: Key("s"),
          ),
        ));
  }

  Widget _buildCategoryTabs() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(_sayuranBuahData.length, (index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                _selectedIndex = index;
              });
            },
            child: Container(
              alignment: Alignment.center,
              height: 60,
              margin: EdgeInsets.symmetric(horizontal: 4.0),
              padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              decoration: BoxDecoration(
                color: _selectedIndex == index ? Colors.green : Colors.white,
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(color: Colors.green),
              ),
              child: Text(
                _sayuranBuahData[index].category,
                style: TextStyle(
                    color:
                        _selectedIndex == index ? Colors.white : Colors.green,
                    fontSize: 20),
              ),
            ),
          );
        }),
      ),
    );
  }

  Widget _buildCategoryView() {
    var category = _sayuranBuahData[_selectedIndex];
    var filteredData = category.data
        .where((item) =>
            item.nama.toLowerCase().contains(_searchQuery.toLowerCase()))
        .toList();

    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: filteredData.length,
      itemBuilder: (context, index) {
        var item = filteredData[index];
        return Padding(
          padding: EdgeInsets.all(defaultPadding / 2),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10)),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    blurRadius: 10,
                    offset: Offset(0, 5),
                    color: Colors.black.withOpacity(.3))
              ],
            ),
            child: ListTile(
              title: Text(item.nama),
              subtitle: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Text('pH: ${item.ph}, PPM: ${item.ppm}')),
                  Container(
                      padding: EdgeInsets.all(defaultPadding / 2),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(3),
                            bottomRight: Radius.circular(3),
                            topLeft: Radius.circular(3),
                            topRight: Radius.circular(3)),
                        color: Colors.green[900],
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 10,
                              offset: Offset(0, 5),
                              color: Colors.black.withOpacity(.1))
                        ],
                      ),
                      child: Text(
                        'Cara Ukur',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                            color: Colors.white),
                      )),
                ],
              ),
              onTap: () {
                showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Center(
                            child: Text(
                          'Cara pengukuran : ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 30),
                        )),
                        content: SingleChildScrollView(
                          child: Column(
                            children: [
                              Text(
                                "Perhitungan ini menggunakan Perbandingan yang sudah ditetapkan dari perusahaan, jadi dengan menggunakan ini kalian harus tetap memperhatikan dosis yang sesuai dengan keperluan tani kalian.",
                                style: TextStyle(
                                    color: Colors.black54, fontSize: 16),
                              ),
                              SizedBox(
                                height: defaultPadding / 2,
                              ),
                              Container(
                                // height: 80,
                                // width: 200,
                                child: Image.asset(
                                  "assets/images/TDS pH.png",
                                  fit: BoxFit.fitHeight,
                                ),
                              ),
                              SizedBox(
                                height: defaultPadding / 2,
                              ),
                              Text(
                                "1. Siapkan TDS meter dan larutan nutrisi yang akan diukur.",
                                style: TextStyle(
                                    color: Colors.black54, fontSize: 16),
                              ),
                              Text(
                                "2. Nyalakan TDS meter dan celupkan pangkal TDS meter ke dalam larutan nutrisi sampai angka digital pada alat tersebut berubah.",
                                style: TextStyle(
                                    color: Colors.black54, fontSize: 16),
                              ),
                              Text(
                                "3. Setelah pergerakan angka mulai stabil, tekan tombol hold.",
                                style: TextStyle(
                                    color: Colors.black54, fontSize: 16),
                              ),
                              Text(
                                "4. Ambil TDS meter dan perhatikan angka yang muncul pada alat tersebut, yang menunjukkan kadar PPM dari larutan nutrisi yang diukur. Jika PPM larutan tersebut terlalu rendah, tambahkan larutan nutrisi AB Mix sambil terus mengukur dengan TDS meter hingga angka yang muncul sesuai dengan kebutuhan nutrisi tanaman hidroponik yang sedang ditanam.",
                                style: TextStyle(
                                    color: Colors.black54, fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                        actions: <Widget>[
                          ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.all(1),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                elevation: 0,
                                backgroundColor: Colors.orange),
                            child: Padding(
                              padding:
                                  EdgeInsets.all(heightfit(defaultPadding / 2)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.check_circle,
                                    size: 15,
                                    color: Colors.white,
                                  ),
                                  Text("OK",
                                      style: TextStyle(color: Colors.black))
                                ],
                              ),
                            ),
                          ),
                        ],
                      );
                    });
              },
            ),
          ),
        );
      },
    );
  }
}
