// // import 'package:rawatt/screens/convert/component/Widget_Komoditi.dart';
// import 'package:rawatt/screens/convert/component/inisialisasi_var.dart';

// List<Map<String, dynamic>> dataSP26 = [
//   {
//     "id": 0,
//     "namaKomoditi": "Padi",
//     "img": "assets/images/komoditi/padi.png",
//     "satuan": "Kg/Ha",
//     "variabels": {
//       "Const_Sp": ["SP-26", 125.0],
//       "Const_Ur": ["Urea", 300.0],
//       "Const_KL": ["KCL", 75.0],
//       "Const_Or": ["Petroganik", 500.0],
//     },
//     "fieldValue": [],
//     "takaran": {
//       "dasar": {
//         "petroganik": "Const_Or / 1",
//         "urea": "Const_Ur / 3",
//         "sp-26": "Const_Sp / 1",
//         "kcl": "Const_KL / 1",
//       },
//       "susulan I (20 HST)": {
//         "urea": "Const_Ur / 3",
//       },
//       "susulan II (35 HST)": {
//         "urea": "Const_Ur / 3",
//       },
//     },
//     "hasil": {
//       "dasar": {
//         "petroganik": 500.0,
//         "urea": 100.0,
//         "sp-26": 125.0,
//         "kcl": 75.0,
//       },
//       "susulan I (20 HST)": {
//         "urea": 100.0,
//       },
//       "susulan II (35 HST)": {
//         "urea": 100.0,
//       },
//     },
//     "penjelas": {"Cara Aplikasi": "Ditebar di Lahan"},
//     "category": 0
//   },
//   {
//     "id": 1,
//     "namaKomoditi": "Jagung",
//     "img": "assets/images/komoditi/jagung.png",
//     "satuan": "Kg/Ha",
//     "variabels": {
//       "Const_Sp": ["SP-26", 150.0],
//       "Const_Ur": ["Urea", 400.0],
//       "Const_KL": ["KCL", 75.0],
//       "Const_Or": ["Petroganik", 500.0],
//     },
//     "fieldValue": [],
//     "takaran": {
//       "dasar": {
//         "petroganik": "Const_Or / 1",
//         "urea": "Const_Ur / 3.2",
//         "sp-26": "Const_Sp / 1",
//         "kcl": "Const_KL / 1",
//       },
//       "susulan I (20 HST)": {
//         "urea": "Const_Ur / 3.2",
//       },
//       "susulan II (35 HST)": {
//         "urea": "Const_Ur / 2,667",
//       },
//     },
//     "hasil": {
//       "dasar": {
//         "petroganik": 500.0,
//         "urea": 125.0,
//         "sp-26": 150.0,
//         "kcl": 75.0,
//       },
//       "susulan I (20 HST)": {
//         "urea": 125.0,
//       },
//       "susulan II (35 HST)": {
//         "urea": 150.0,
//       },
//     },
//     "penjelas": {"Cara Aplikasi": "Ditabur / dibenamkan"},
//     "category": 0
//   },
//   {
//     "id": 2,
//     "namaKomoditi": "Kedelai / Kacang Tanah",
//     "img": "assets/images/komoditi/kedelai.png",
//     "satuan": "Kg/Ha",
//     "variabels": {
//       "Const_Sp": ["SP-26", 100.0],
//       "Const_Ur": ["Urea", 75.0],
//       "Const_KL": ["KCL", 50.0],
//       "Const_Or": ["Petroganik", 500.0],
//     },
//     "fieldValue": [],
//     "takaran": {
//       "dasar": {
//         "petroganik": "Const_Or / 1",
//         "urea": "Const_Ur / 3",
//         "sp-26": "Const_Sp / 1",
//         "kcl": "Const_KL / 1",
//       },
//       "susulan I (30 HST)": {
//         "urea": "Const_Ur / 1.5",
//       },
//     },
//     "hasil": {
//       "dasar": {
//         "petroganik": 500.0,
//         "urea": 25.0,
//         "sp-26": 100.0,
//         "kcl": 50.0,
//       },
//       "susulan I (30 HST)": {
//         "urea": 50,
//       },
//     },
//     "penjelas": {"Cara Aplikasi": "Ditabur / dibenamkan"},
//     "category": 0
//   },
//   {
//     "id": 3,
//     "namaKomoditi": "Ubi Kayu",
//     "img": "assets/images/komoditi/ubikayu.png",
//     "satuan": "Kg/Ha",
//     "variabels": {
//       "Const_Or": ["Petroganik", 500.0],
//       "Const_Ur": ["Urea", 200.0],
//       "Const_Sp": ["SP-26", 100.0],
//       "Const_KL": ["KCL", 75.0],
//     },
//     "fieldValue": [],
//     "takaran": {
//       "dasar": {
//         "petroganik": "Const_Or / 1",
//         "urea": "Const_Ur / 3.333",
//         "sp-26": "Const_Sp / 1",
//         "kcl": "Const_KL / 3",
//       },
//       "susulan I (20 HST)": {
//         "urea": "Const_Ur / 1,428571428571429",
//         "kcl": "Const_KL / 1.5",
//       },
//     },
//     "hasil": {
//       "dasar": {
//         "petroganik": 500.0,
//         "urea": 75.0,
//         "sp-26": 100.0,
//         "kcl": 25,
//       },
//       "susulan I (20 HST)": {
//         "urea": 175.0,
//         "kcl": 50.0,
//       },
//     },
//     "penjelas": {"Cara Aplikasi": "Ditabur / dibenamkan"},
//     "category": 0
//   },
// ];

// List<Map<String, dynamic>> dataNingrat = [
//   {
//     "id": 0,
//     "namaKomoditi": "Tembakau",
//     "img": "assets/images/komoditi/tembakau.png",
//     "satuan": "Kg/Ha",
//     "variabels": {
//       "Const_Ng": ["Ningrat", 450.0],
//       "Const_Za": ["ZA", 100.0],
//       "Const_Or": ["Petroganik", 1000.0],
//     },
//     "fieldValue": [],
//     "takaran": {
//       "dasar": {
//         "petroganik": "Const_Or / 1",
//       },
//       "susulan I (5-7 HST)": {
//         "nigrat": "Const_Ng / 2",
//         "za": "Const_Za / 2",
//       },
//       "susulan II (21-25 HST)": {
//         "nigrat": "Const_Ng / 2",
//         "za": "Const_Za / 2",
//       },
//     },
//     "hasil": {
//       "dasar": {
//         "petroganik": 0.0,
//       },
//       "susulan I (5-7 HST)": {
//         "nigrat": 0.0,
//         "za": 0.0,
//       },
//       "susulan II (21-25 HST)": {
//         "nigrat": 0.0,
//         "za": 0.0,
//       },
//     },
//     "penjelas": {
//       "Cara Aplikasi":
//           "pupuk dibenamkan dalam tanah di sekeliling pohon atau sekitar tanaman."
//     },
//     "category": 0
//   },
//   {
//     "id": 1,
//     "namaKomoditi": "Kentang",
//     "img": "assets/images/komoditi/kentang.png",
//     "satuan": "Kg/Ha",
//     "variabels": {
//       "Const_Ng": ["Ningrat", 500.0],
//       "Const_Za": ["ZA", 200.0],
//       "Const_Or": ["Petroganik", 2000.0],
//     },
//     "fieldValue": [],
//     "takaran": {
//       "dasar": {
//         "petroganik": "Const_Or / 1",
//         "nigrat": "Const_Ng / 2",
//         "za": "Const_Za / 2",
//       },
//       "susulan I (30 HST)": {
//         "nigrat": "Const_Ng / 2",
//         "za": "Const_Za / 2",
//       },
//     },
//     "hasil": {
//       "dasar": {
//         "petroganik": 0.0,
//         "nigrat": 0.0,
//         "za": 0.0,
//       },
//       "susulan I (30 HST)": {
//         "nigrat": 0.0,
//         "za": 0.0,
//       },
//     },
//     "penjelas": {
//       "Cara Aplikasi":
//           "pupuk dibenamkan dalam tanah di sekeliling pohon atau sekitar tanaman."
//     },
//     "category": 0
//   },
//   {
//     "id": 2,
//     "namaKomoditi": "Bawang Merah",
//     "img": "assets/images/komoditi/bawang.png",
//     "satuan": "Kg/Ha",
//     "variabels": {
//       "Const_Ng": ["Ningrat", 500.0],
//       "Const_Za": ["ZA", 350.0],
//       "Const_Or": ["Petroganik", 2000.0],
//     },
//     "fieldValue": [],
//     "takaran": {
//       "dasar": {
//         "petroganik": "Const_Or / 1",
//         "nigrat": "Const_Ng / 2.5",
//       },
//       "susulan I (15 HST)": {
//         "nigrat": "Const_Ng / 3.3333",
//         "za": "Const_Za / 2.3333",
//       },
//       "susulan II (30 HST)": {
//         "nigrat": "Const_Ng / 3.3333",
//         "za": "Const_Za / 1.75",
//       },
//     },
//     "hasil": {
//       "dasar": {
//         "petroganik": 0.0,
//         "nigrat": 0.0,
//       },
//       "susulan I (15 HST)": {
//         "nigrat": 0.0,
//         "za": 0.0,
//       },
//       "susulan II (30 HST)": {
//         "nigrat": 0.0,
//         "za": 0.0,
//       },
//     },
//     "penjelas": {
//       "Cara Aplikasi":
//           "pupuk dibenamkan dalam tanah di sekeliling pohon atau sekitar tanaman."
//     },
//     "category": 0
//   },
//   {
//     "id": 3,
//     "namaKomoditi": "Cabai",
//     "img": "assets/images/komoditi/lombok.png",
//     "satuan": "Kg/Ha",
//     "variabels": {
//       "Const_Ng": ["Ningrat", 800.0],
//       "Const_Za": ["ZA", 300.0],
//       "Const_Or": ["Petroganik", 2000.0],
//     },
//     "fieldValue": [],
//     "takaran": {
//       "dasar": {
//         "petroganik": "Const_Or / 1",
//         "nigrat": "Const_Ng / 2",
//       },
//       "susulan I (15 HST)": {
//         "nigrat": "Const_Ng / 4",
//         "za": "Const_Za / 3",
//       },
//       "susulan II (30 HST)": {
//         "nigrat": "Const_Ng / 4",
//         "za": "Const_Za / 1.5",
//       },
//     },
//     "hasil": {
//       "dasar": {
//         "petroganik": 0.0,
//         "nigrat": 0.0,
//       },
//       "susulan I (15 HST)": {
//         "nigrat": 0.0,
//         "za": 0.0,
//       },
//       "susulan II (30 HST)": {
//         "nigrat": 0.0,
//         "za": 0.0,
//       },
//     },
//     "penjelas": {
//       "Cara Aplikasi":
//           "pupuk dibenamkan dalam tanah di sekeliling pohon atau sekitar tanaman."
//     },
//     "category": 0
//   },
//   {
//     "id": 4,
//     "namaKomoditi": "Anggur",
//     "img": "assets/images/komoditi/anggur.png",
//     "satuan": "Kg/Ha",
//     "variabels": {
//       "Const_Ng": ["Ningrat", 1300.0],
//       "Const_Or": ["Petroganik", 1000.0],
//     },
//     "fieldValue": [],
//     "takaran": {
//       "dasar": {
//         "petroganik": "Const_Or / 1",
//       },
//       "Awal Musim Hujan": {
//         "nigrat": "Const_Ng / 2",
//       },
//       "Akhir Musim Hujan": {
//         "nigrat": "Const_Ng / 2",
//       },
//     },
//     "hasil": {
//       "dasar": {
//         "petroganik": 0.0,
//       },
//       "Awal Musim Hujan": {
//         "nigrat": 0.0,
//       },
//       "Akhir Musim Hujan": {
//         "nigrat": 0.0,
//       },
//     },
//     "penjelas": {
//       "Cara Aplikasi":
//           "pupuk dibenamkan dalam tanah di sekeliling pohon atau sekitar tanaman."
//     },
//     "category": 0
//   },
//   {
//     "id": 5,
//     "namaKomoditi": "Tomat",
//     "img": "assets/images/komoditi/tomat.png",
//     "satuan": "Kg/Ha",
//     "variabels": {
//       "Const_Ng": ["Ningrat", 600.0],
//       "Const_Za": ["ZA", 350.0],
//       "Const_Or": ["Petroganik", 2000.0],
//     },
//     "fieldValue": [],
//     "takaran": {
//       "dasar": {
//         "petroganik": "Const_Or / 1",
//         "nigrat": "Const_Ng / 2",
//       },
//       "susulan I (15 HST)": {
//         "nigrat": "Const_Ng / 4",
//         "za": "Const_Za / 2.3333",
//       },
//       "susulan II (30 HST)": {
//         "nigrat": "Const_Ng / 4",
//         "za": "Const_Za / 1.75",
//       },
//     },
//     "hasil": {
//       "dasar": {
//         "petroganik": 0.0,
//         "nigrat": 0.0,
//       },
//       "susulan I (15 HST)": {
//         "nigrat": 0.0,
//         "za": 0.0,
//       },
//       "susulan II (30 HST)": {
//         "nigrat": 0.0,
//         "za": 0.0,
//       },
//     },
//     "penjelas": {
//       "Cara Aplikasi":
//           "pupuk dibenamkan dalam tanah di sekeliling pohon atau sekitar tanaman."
//     },
//     "category": 0
//   },
//   {
//     "id": 6,
//     "namaKomoditi": "Mangga",
//     "img": "assets/images/komoditi/mangga.png",
//     "satuan": "Kg/Pohon",
//     "variabels": {
//       "Const_Ng": ["Ningrat", 3.0],
//       "Const_Za": ["ZA", 3.0],
//       "Const_Or": ["Petroganik", 60.0],
//     },
//     "fieldValue": [],
//     "takaran": {
//       "dasar": {
//         "petroganik": "Const_Or / 3",
//       },
//       "Belum Menghasilkan": {
//         "nigrat": "1",
//         "za": "1",
//       },
//       "Telah Menghasilkan": {
//         "nigrat": "2",
//         "za": "2",
//       },
//     },
//     "hasil": {
//       "dasar": {
//         "petroganik": 0.0,
//       },
//       "Belum Menghasilkan": {
//         "nigrat": 0.0,
//         "za": 0.0,
//       },
//       "Telah Menghasilkan": {
//         "nigrat": 0.0,
//         "za": 0.0,
//       },
//     },
//     "penjelas": {
//       "Cara Aplikasi":
//           "pupuk dibenamkan dalam tanah di sekeliling pohon atau sekitar tanaman."
//     },
//     "category": 0
//   },
//   {
//     "id": 7,
//     "namaKomoditi": "Blimbing",
//     "img": "assets/images/komoditi/blimbing.png",
//     "satuan": "Kg/Pohon",
//     "variabels": {
//       "Const_Ng": ["Ningrat", 3.0],
//       "Const_Za": ["ZA", 3.0],
//       "Const_Or": ["Petroganik", 60.0],
//     },
//     "fieldValue": [],
//     "takaran": {
//       "dasar": {
//         "petroganik": "Const_Or / 3",
//       },
//       "Belum Menghasilkan": {
//         "nigrat": "1",
//         "za": "1",
//       },
//       "Telah Menghasilkan": {
//         "nigrat": "2",
//         "za": "2",
//       },
//     },
//     "hasil": {
//       "dasar": {
//         "petroganik": 0.0,
//       },
//       "Belum Menghasilkan": {
//         "nigrat": 0.0,
//         "za": 0.0,
//       },
//       "Telah Menghasilkan": {
//         "nigrat": 0.0,
//         "za": 0.0,
//       },
//     },
//     "penjelas": {
//       "Cara Aplikasi":
//           "pupuk dibenamkan dalam tanah di sekeliling pohon atau sekitar tanaman."
//     },
//     "category": 0
//   },
//   {
//     "id": 8,
//     "namaKomoditi": "Kakao",
//     "img": "assets/images/komoditi/kakao.png",
//     "satuan": "Kg/Ha",
//     "variabels": {
//       "Const_Ng": ["Ningrat", 1200.0],
//       "Const_Za": ["ZA", 150.0],
//       "Const_Or": ["Petroganik", 3000.0],
//     },
//     "fieldValue": [],
//     "takaran": {
//       "Awal Musim Hujan": {
//         "petroganik": "Const_Or / 1",
//         "nigrat": "Const_Ng / 2",
//         "za": "Const_Za / 2",
//       },
//       "Akhir Musim Hujan": {
//         "nigrat": "Const_Ng / 2",
//         "za": "Const_Za / 2",
//       },
//     },
//     "hasil": {
//       "Awal Musim Hujan": {
//         "petroganik": 0.0,
//         "nigrat": 0.0,
//         "za": 0.0,
//       },
//       "Akhir Musim Hujan": {
//         "nigrat": 0.0,
//         "za": 0.0,
//       },
//     },
//     "penjelas": {
//       "Cara Aplikasi":
//           "pupuk dibenamkan dalam tanah di sekeliling pohon atau sekitar tanaman."
//     },
//     "category": 0
//   },
//   {
//     "id": 9,
//     "namaKomoditi": "Kopi",
//     "img": "assets/images/komoditi/kopi.png",
//     "satuan": "Kg/Ha",
//     "variabels": {
//       "Const_Ng": ["Ningrat", 1200.0],
//       "Const_Za": ["ZA", 150.0],
//       "Const_Or": ["Petroganik", 3000.0],
//     },
//     "fieldValue": [],
//     "takaran": {
//       "Awal Musim Hujan": {
//         "petroganik": "Const_Or / 1",
//         "nigrat": "Const_Ng / 2",
//         "za": "Const_Za / 2",
//       },
//       "Akhir Musim Hujan": {
//         "nigrat": "Const_Ng / 2",
//         "za": "Const_Za / 2",
//       },
//     },
//     "hasil": {
//       "Awal Musim Hujan": {
//         "petroganik": 0.0,
//         "nigrat": 0.0,
//         "za": 0.0,
//       },
//       "Akhir Musim Hujan": {
//         "nigrat": 0.0,
//         "za": 0.0,
//       },
//     },
//     "penjelas": {
//       "Cara Aplikasi":
//           "pupuk dibenamkan dalam tanah di sekeliling pohon atau sekitar tanaman."
//     },
//     "category": 0
//   },
//   {
//     "id": 10,
//     "namaKomoditi": "Semanga",
//     "img": "assets/images/komoditi/semangka.png",
//     "satuan": "Kg/Ha",
//     "variabels": {
//       "Const_Ng": ["Ningrat", 400.0],
//       "Const_Za": ["ZA", 200.0],
//       "Const_Or": ["Petroganik", 2000.0],
//     },
//     "fieldValue": [],
//     "takaran": {
//       "dasar": {
//         "petroganik": "Const_Or / 1",
//       },
//       "Susulan (15 HST)": {
//         "nigrat": "Const_Ng / 2",
//         "za": "Const_Za / 2",
//       },
//       "Susulan (30 HST)": {
//         "nigrat": "Const_Ng / 2",
//         "za": "Const_Za / 2",
//       },
//     },
//     "hasil": {
//       "dasar": {
//         "petroganik": 0.0,
//       },
//       "Susulan (15 HST)": {
//         "nigrat": 0.0,
//         "za": 0.0,
//       },
//       "Susulan (30 HST)": {
//         "nigrat": 0.0,
//         "za": 0.0,
//       },
//     },
//     "penjelas": {
//       "Cara Aplikasi":
//           "pupuk dibenamkan dalam tanah di sekeliling pohon atau sekitar tanaman."
//     },
//     "category": 0
//   },
//   {
//     "id": 11,
//     "namaKomoditi": "Melon",
//     "img": "assets/images/komoditi/semangka.png",
//     "satuan": "Kg/Ha",
//     "variabels": {
//       "Const_Ng": ["Ningrat", 400.0],
//       "Const_Za": ["ZA", 200.0],
//       "Const_Or": ["Petroganik", 2000.0],
//     },
//     "fieldValue": [],
//     "takaran": {
//       "dasar": {
//         "petroganik": "Const_Or / 1",
//       },
//       "Susulan (15 HST)": {
//         "nigrat": "Const_Ng / 2",
//         "za": "Const_Za / 2",
//       },
//       "Susulan (30 HST)": {
//         "nigrat": "Const_Ng / 2",
//         "za": "Const_Za / 2",
//       },
//     },
//     "hasil": {
//       "dasar": {
//         "petroganik": 0.0,
//       },
//       "Susulan (15 HST)": {
//         "nigrat": 0.0,
//         "za": 0.0,
//       },
//       "Susulan (30 HST)": {
//         "nigrat": 0.0,
//         "za": 0.0,
//       },
//     },
//     "penjelas": {
//       "Cara Aplikasi":
//           "pupuk dibenamkan dalam tanah di sekeliling pohon atau sekitar tanaman."
//     },
//     "category": 0
//   },
// ];

// List<DosisPupuk> listNingrat = [
//   for (var i = 0; i < dataNingrat.length; i++)
//     DosisPupuk(
//         id: i,
//         namaKomoditi: dataNingrat[i]["namaKomoditi"],
//         img: dataNingrat[i]["img"],
//         satuan: dataNingrat[i]["satuan"],
//         variabels: dataNingrat[i]["variabels"],
//         fieldValue: dataNingrat[i]["fieldValue"],
//         takaran: dataNingrat[i]["takaran"],
//         hasil: dataNingrat[i]["hasil"],
//         penjelas: dataNingrat[i]["penjelas"],
//         category: dataNingrat[i]["category"])
// ];

// List<Map<String, dynamic>> dataNitrat = [
//   {
//     "id": 0,
//     "namaKomoditi": "Kentang",
//     "img": "assets/images/komoditi/kentang.png",
//     "satuan": "Kg/Ha",
//     "variabels": {
//       "Const_Nk": ["Nitrat", 1000.0],
//       "Const_Za": ["ZA", 200.0],
//       "Const_Zk": ["ZK", 100.0],
//       "Const_Or": ["Petroganik", 2000.0],
//     },
//     "fieldValue": [],
//     "takaran": {
//       "dasar": {
//         "nitrat": "Const_Nk / 2",
//         "za": "Const_Za / 2",
//         "zk": "Const_Zk / 2",
//         "petroganik": "Const_Or / 1",
//       },
//       "susulan I (30 HST)": {
//         "nitrat": "Const_Nk / 2",
//         "za": "Const_Za / 2",
//         "zk": "Const_Zk / 2",
//       },
//     },
//     "hasil": {
//       "dasar": {
//         "nitrat": 500.0,
//         "za": 100.0,
//         "zk": 50.0,
//         "petroganik": 2000.0,
//       },
//       "susulan I (30 HST)": {
//         "nitrat": 500.0,
//         "za": 100.0,
//         "zk": 50.0,
//       },
//     },
//     "penjelas": {"Cara Aplikasi": "Ditebar / Dibenamkan"},
//     "category": 0
//   },
//   {
//     "id": 1,
//     "namaKomoditi": "Bawang Merah",
//     "img": "assets/images/komoditi/bawang.png",
//     "satuan": "Kg/Ha",
//     "variabels": {
//       "Const_Nk": ["Nitrat", 700.0],
//       "Const_Za": ["ZA", 150.0],
//       "Const_Zk": ["ZK", 100.0],
//       "Const_Or": ["Petroganik", 2000.0],
//     },
//     "fieldValue": [],
//     "takaran": {
//       "dasar": {
//         "nitrat": "Const_Nk / 2",
//         "zk": "Const_Zk / 2",
//         "petroganik": "Const_Or / 1",
//       },
//       "susulan I (15 - 20 HST)": {
//         "nitrat": "Const_Nk / 2",
//         "za": "Const_Za / 2",
//         "zk": "Const_Zk / 4",
//       },
//       "susulan II (30 - 40 HST)": {
//         "za": "Const_Za / 2",
//         "zk": "Const_Zk / 4",
//       },
//     },
//     "hasil": {
//       "dasar": {
//         "nitrat": 350.0,
//         "zk": 50.0,
//         "petroganik": 2000.0,
//       },
//       "susulan I (15 - 20 HST)": {
//         "nitrat": 350.0,
//         "za": 75.0,
//         "zk": 25.0,
//       },
//       "susulan II (30 - 40 HST)": {
//         "za": 75.0,
//         "zk": 25.0,
//       },
//     },
//     "penjelas": {"Cara Aplikasi": "Ditebar / Dibenamkan"},
//     "category": 0
//   },
//   // {
//   //   "id": 3,
//   //   "namaKomoditi": "Cabai",
//   //   "img": "assets/images/komoditi/Lombok.png",
//   //   "satuan": "Kg/Ha",
//   //   "variabels": {
//   //     "Const_Nk": ["Nitrat", 700.0],
//   //     "Const_Za": ["ZA", 150.0],
//   //     "Const_Zk": ["ZK", 100.0],
//   //     "Const_Or": ["Petroganik", 2000.0],
//   //   },
//   //   "fieldValue": [],
//   //   "takaran": {
//   //     "dasar": {
//   //       "nitrat": "Const_Nk / 2",
//   //       "zk": "Const_Zk / 2",
//   //       "petroganik": "Const_Or / 1",
//   //     },
//   //     "susulan I (15 - 20 HST s/d Panen Ke-9) :\n Dilakukan setiap 7-10 hari dengan melarutkan pupuk NPK": {
//   //       "nitrat": "Const_Nk / 2",
//   //     },
//   //     "susulan II (30 - 40 HST)": {
//   //       "za": "Const_Za / 2",
//   //       "zk": "Const_Zk / 4",
//   //     },
//   //   },
//   //   "hasil": {
//   //     "dasar": {
//   //       "nitrat": 350.0,
//   //       "zk": 50.0,
//   //       "petroganik": 2000.0,
//   //     },
//   //     "susulan I (15 - 20 HST)": {
//   //       "nitrat": 350.0,
//   //       "za": 75.0,
//   //       "zk": 25.0,
//   //     },
//   //     "susulan II (30 - 40 HST)": {
//   //       "za": 75.0,
//   //       "zk": 25.0,
//   //     },
//   //   },
//   //   "penjelas": {"Cara Aplikasi": "Ditebar / Dibenamkan"},
//   //   "category": 0
//   // },
//   {
//     "id": 2,
//     "namaKomoditi": "Terong",
//     "img": "assets/images/komoditi/terong.png",
//     "satuan": "Kg/Ha",
//     "variabels": {
//       "Const_Nk": ["Nitrat", 700.0],
//       "Const_Za": ["ZA", 150.0],
//       "Const_Zk": ["ZK", 100.0],
//       "Const_Or": ["Petroganik", 2000.0],
//     },
//     "fieldValue": [],
//     "takaran": {
//       "dasar": {
//         "nitrat": "Const_Nk / 2",
//         "zk": "Const_Zk / 2",
//         "petroganik": "Const_Or / 1",
//       },
//       "susulan I (15 - 20 HST)": {
//         "nitrat": "Const_Nk / 2",
//         "za": "Const_Za / 2",
//         "zk": "Const_Zk / 4",
//       },
//       "susulan II (30 - 40 HST)": {
//         "za": "Const_Za / 2",
//         "zk": "Const_Zk / 4",
//       },
//     },
//     "hasil": {
//       "dasar": {
//         "nitrat": 350.0,
//         "zk": 50.0,
//         "petroganik": 2000.0,
//       },
//       "susulan I (15 - 20 HST)": {
//         "nitrat": 350.0,
//         "za": 75.0,
//         "zk": 25.0,
//       },
//       "susulan II (30 - 40 HST)": {
//         "za": 75.0,
//         "zk": 25.0,
//       },
//     },
//     "penjelas": {"Cara Aplikasi": "Ditebar / Dibenamkan"},
//     "category": 0
//   },
//   {
//     "id": 3,
//     "namaKomoditi": "Wortel",
//     "img": "assets/images/komoditi/wortel.png",
//     "satuan": "Kg/Ha",
//     "variabels": {
//       "Const_Nk": ["Nitrat", 450.0],
//       "Const_Za": ["ZA", 300.0],
//       "Const_Zk": ["ZK", 100.0],
//       "Const_Or": ["Petroganik", 2000.0],
//     },
//     "fieldValue": [],
//     "takaran": {
//       "dasar": {
//         "nitrat": "Const_Nk / 3",
//         "zk": "Const_Zk / 2",
//         "za": "Const_Za / 6",
//         "petroganik": "Const_Or / 1",
//       },
//       "susulan I (15 - 20 HST)": {
//         "nitrat": "Const_Nk / 3",
//         "za": "Const_Za / 6",
//         "zk": "Const_Zk / 2",
//       },
//       "susulan II (30 - 40 HST)": {
//         "nitrat": "Const_Nk / 3",
//         "za": "Const_Za / 1.5",
//       },
//     },
//     "hasil": {
//       "dasar": {
//         "nitrat": 150.0,
//         "zk": 50.0,
//         "za": 50.0,
//         "petroganik": 2000.0,
//       },
//       "susulan I (15 - 20 HST)": {
//         "nitrat": 150.0,
//         "za": 50.0,
//         "zk": 50.0,
//       },
//       "susulan II (30 - 40 HST)": {
//         "nitrat": 150.0,
//         "za": 200.0,
//       },
//     },
//     "penjelas": {"Cara Aplikasi": "Ditebar / Dibenamkan"},
//     "category": 0
//   },
//   {
//     "id": 4,
//     "namaKomoditi": "Kubis",
//     "img": "assets/images/komoditi/kubis.png",
//     "satuan": "Kg/Ha",
//     "variabels": {
//       "Const_Nk": ["Nitrat", 450.0],
//       "Const_Za": ["ZA", 300.0],
//       "Const_Zk": ["ZK", 100.0],
//       "Const_Or": ["Petroganik", 2000.0],
//     },
//     "fieldValue": [],
//     "takaran": {
//       "dasar": {
//         "nitrat": "Const_Nk / 3",
//         "zk": "Const_Zk / 2",
//         "za": "Const_Za / 6",
//         "petroganik": "Const_Or / 1",
//       },
//       "susulan I (15 - 20 HST)": {
//         "nitrat": "Const_Nk / 3",
//         "za": "Const_Za / 6",
//         "zk": "Const_Zk / 2",
//       },
//       "susulan II (30 - 40 HST)": {
//         "nitrat": "Const_Nk / 3",
//         "za": "Const_Za / 1.5",
//       },
//     },
//     "hasil": {
//       "dasar": {
//         "nitrat": 150.0,
//         "zk": 50.0,
//         "za": 50.0,
//         "petroganik": 2000.0,
//       },
//       "susulan I (15 - 20 HST)": {
//         "nitrat": 150.0,
//         "za": 50.0,
//         "zk": 50.0,
//       },
//       "susulan II (30 - 40 HST)": {
//         "nitrat": 150.0,
//         "za": 200.0,
//       },
//     },
//     "penjelas": {"Cara Aplikasi": "Ditebar / Dibenamkan"},
//     "category": 0
//   },
//   {
//     "id": 5,
//     "namaKomoditi": "Sawi",
//     "img": "assets/images/komoditi/sawi.png",
//     "satuan": "Kg/Ha",
//     "variabels": {
//       "Const_Nk": ["Nitrat", 450.0],
//       "Const_Za": ["ZA", 300.0],
//       "Const_Zk": ["ZK", 100.0],
//       "Const_Or": ["Petroganik", 2000.0],
//     },
//     "fieldValue": [],
//     "takaran": {
//       "dasar": {
//         "nitrat": "Const_Nk / 3",
//         "zk": "Const_Zk / 2",
//         "za": "Const_Za / 6",
//         "petroganik": "Const_Or / 1",
//       },
//       "susulan I (15 - 20 HST)": {
//         "nitrat": "Const_Nk / 3",
//         "za": "Const_Za / 6",
//         "zk": "Const_Zk / 2",
//       },
//       "susulan II (30 - 40 HST)": {
//         "nitrat": "Const_Nk / 3",
//         "za": "Const_Za / 1.5",
//       },
//     },
//     "hasil": {
//       "dasar": {
//         "nitrat": 150.0,
//         "zk": 50.0,
//         "za": 50.0,
//         "petroganik": 2000.0,
//       },
//       "susulan I (15 - 20 HST)": {
//         "nitrat": 150.0,
//         "za": 50.0,
//         "zk": 50.0,
//       },
//       "susulan II (30 - 40 HST)": {
//         "nitrat": 150.0,
//         "za": 200.0,
//       },
//     },
//     "penjelas": {"Cara Aplikasi": "Ditebar / Dibenamkan"},
//     "category": 0
//   },
//   {
//     "id": 6,
//     "namaKomoditi": "Mentimun",
//     "img": "assets/images/komoditi/mentimun.png",
//     "satuan": "Kg/Ha",
//     "variabels": {
//       "Const_Nk": ["Nitrat", 450.0],
//       "Const_Zk": ["ZK", 100.0],
//       "Const_Or": ["Petroganik", 2000.0],
//     },
//     "fieldValue": [],
//     "takaran": {
//       "dasar": {
//         "nitrat": "Const_Nk / 3",
//         "zk": "Const_Zk / 2",
//         "petroganik": "Const_Or / 1",
//       },
//       "susulan I (15 - 20 HST)": {
//         "nitrat": "Const_Nk / 3",
//         "zk": "Const_Zk / 2",
//       },
//       "susulan II (30 - 40 HST)": {
//         "nitrat": "Const_Nk / 3",
//       },
//     },
//     "hasil": {
//       "dasar": {
//         "nitrat": 150.0,
//         "zk": 50.0,
//         "petroganik": 2000.0,
//       },
//       "susulan I (15 - 20 HST)": {
//         "nitrat": 150.0,
//         "zk": 50.0,
//       },
//       "susulan II (30 - 40 HST)": {
//         "nitrat": 150.0,
//       },
//     },
//     "penjelas": {"Cara Aplikasi": "Ditebar / Dibenamkan"},
//     "category": 0
//   },
//   {
//     "id": 7,
//     "namaKomoditi": "Jeruk",
//     "img": "assets/images/komoditi/jeruk.png",
//     "satuan": "gr/Pohon",
//     "variabels": {
//       "Const_Nk": ["Nitrat", 1600.0],
//       "Const_Zk": ["ZK", 100.0],
//       "Const_Or": ["Petroganik", 5000.0],
//     },
//     "fieldValue": [],
//     "takaran": {
//       "Awal musim hujan (Per Pohon)": {
//         "nitrat": "800",
//         "zk": "50",
//         "petroganik": "5000",
//       },
//       "Akhir musim hujan (Per Pohon)": {
//         "nitrat": "800",
//         "zk": "50",
//       },
//     },
//     "hasil": {
//       "Awal musim hujan (Per Pohon)": {
//         "nitrat": 0.0,
//         "zk": 0.0,
//         "petroganik": 0.0,
//       },
//       "Akhir musim hujan (Per Pohon)": {
//         "nitrat": 0.0,
//         "zk": 0.0,
//       },
//     },
//     "penjelas": {"Cara Aplikasi": "Ditebar / Dibenamkan"},
//     "category": 0
//   },
//   {
//     "id": 8,
//     "namaKomoditi": "Kopi",
//     "img": "assets/images/komoditi/kopi.png",
//     "satuan": "gr/Pohon",
//     "variabels": {
//       "Const_Nk": ["Nitrat", 1000.0],
//       "Const_Ki": ["Kiserit", 150.0],
//       "Const_Or": ["Petroganik", 3000.0],
//     },
//     "fieldValue": [],
//     "takaran": {
//       "Awal musim hujan (Per Pohon)": {
//         "nitrat": "500",
//         "kiserit": "75",
//         "petroganik": "3000",
//       },
//       "Akhir musim hujan (Per Pohon)": {
//         "nitrat": "500",
//         "kiserit": "75",
//       },
//     },
//     "hasil": {
//       "Awal musim hujan (Per Pohon)": {
//         "nitrat": 500.0,
//         "kiserit": 75.0,
//         "petroganik": 3000.0,
//       },
//       "Akhir musim hujan (Per Pohon)": {
//         "nitrat": 500.0,
//         "kiserit": 75.0,
//       },
//     },
//     "penjelas": {"Cara Aplikasi": "Ditebar / Dibenamkan"},
//     "category": 0
//   },
//   {
//     "id": 9,
//     "namaKomoditi": "Kakao",
//     "img": "assets/images/komoditi/kakao.png",
//     "satuan": "gr/Pohon",
//     "variabels": {
//       "Const_Nk": ["Nitrat", 1000.0],
//       "Const_Ki": ["Kiserit", 150.0],
//       "Const_Or": ["Petroganik", 3000.0],
//     },
//     "fieldValue": [],
//     "takaran": {
//       "Awal musim hujan (Per Pohon)": {
//         "nitrat": "500",
//         "kiserit": "75",
//         "petroganik": "3000",
//       },
//       "Akhir musim hujan (Per Pohon)": {
//         "nitrat": "500",
//         "kiserit": "75",
//       },
//     },
//     "hasil": {
//       "Awal musim hujan (Per Pohon)": {
//         "nitrat": 500.0,
//         "kiserit": 75.0,
//         "petroganik": 3000.0,
//       },
//       "Akhir musim hujan (Per Pohon)": {
//         "nitrat": 500.0,
//         "kiserit": 75.0,
//       },
//     },
//     "penjelas": {"Cara Aplikasi": "Ditebar / Dibenamkan"},
//     "category": 0
//   },
//   {
//     "id": 10,
//     "namaKomoditi": "Nanas",
//     "img": "assets/images/komoditi/nanas.png",
//     "satuan": "Kg/Ha",
//     "variabels": {
//       "Const_Nk": ["Nitrat", 450.0],
//       "Const_Zk": ["ZK", 150.0],
//       "Const_Za": ["ZA", 100.0],
//       "Const_Ur": ["Urea", 150.0],
//       "Const_Or": ["Petroganik", 2000.0],
//     },
//     "fieldValue": [],
//     "takaran": {
//       "dasar": {
//         "nitrat": "Const_Nk / 1",
//         "zk": "Const_Zk / 2",
//         "urea": "Const_Ur / 6",
//         "petroganik": "Const_Or / 1",
//       },
//       "susulan I (3 BST)": {
//         "urea": "Const_Ur / 1.5",
//         "zk": "Const_Zk / 2",
//       },
//       "susulan II (10 BST)": {
//         "za": "Const_Za /1",
//       },
//     },
//     "hasil": {
//       "dasar": {
//         "nitrat": 0.0,
//         "zk": 0.0,
//         "urea": 0.0,
//         "petroganik": 0.0,
//       },
//       "susulan I (3 BST)": {
//         "urea": 0.0,
//         "zk": 0.0,
//       },
//       "susulan II (10 BST)": {
//         "za": 0.0,
//       },
//     },
//     "penjelas": {"Cara Aplikasi": "Ditebar / Dibenamkan"},
//     "category": 0
//   },
//   {
//     "id": 11,
//     "namaKomoditi": "Manggis",
//     "img": "assets/images/komoditi/manggis.png",
//     "satuan": "gr/Pohon",
//     "variabels": {
//       "Const_Nk": ["Nitrat", 1200.0],
//       "Const_Or": ["Petroganik", 10000.0],
//     },
//     "fieldValue": [],
//     "takaran": {
//       "Setelah Panen (Per Pohon)": {
//         "nitrat": "900",
//         "petroganik": "10000",
//       },
//       "Awal musim hujan (Per Pohon)": {
//         "nitrat": "600",
//       },
//     },
//     "hasil": {
//       "Setelah Panen (Per Pohon)": {
//         "nitrat": 0.0,
//         "petroganik": 0.0,
//       },
//       "Awal musim hujan (Per Pohon)": {
//         "nitrat": 0.0,
//       },
//     },
//     "penjelas": {"Cara Aplikasi": "Ditebar / Dibenamkan"},
//     "category": 0
//   },
//   {
//     "id": 12,
//     "namaKomoditi": "Pisang",
//     "img": "assets/images/komoditi/pisang.png",
//     "satuan": "Kg/Ha",
//     "variabels": {
//       "Const_Nk": ["Nitrat", 600.0],
//       "Const_Zk": ["ZK", 100.0],
//       "Const_Za": ["ZA", 300.0],
//       "Const_Or": ["Petroganik", 5000.0],
//     },
//     "fieldValue": [],
//     "takaran": {
//       "dasar": {
//         "nitrat": "Const_Nk / 3",
//         "za": "Const_Za / 6",
//         "petroganik": "Const_Or / 1",
//       },
//       "susulan I (15 HST)": {
//         "nitrat": "Const_Nk / 3",
//         "za": "Const_Za / 6",
//       },
//       "susulan II (3 BST)": {
//         "nitrat": "Const_Nk / 3",
//         "za": "Const_Za /3",
//         "zk": "Const_Zk /2",
//       },
//       "susulan III (6 BST)": {
//         "za": "Const_Za /3",
//         "zk": "Const_Zk /2",
//       },
//     },
//     "hasil": {
//       "dasar": {
//         "nitrat": 0.0,
//         "za": 0.0,
//         "petroganik": 0.0,
//       },
//       "susulan I (15 HST)": {
//         "nitrat": 0.0,
//         "za": 0.0,
//       },
//       "susulan II (3 BST)": {
//         "nitrat": 0.0,
//         "za": 0.0,
//         "zk": 0.0,
//       },
//       "susulan III (6 BST)": {
//         "za": 0.0,
//         "zk": 0.0,
//       },
//     },
//     "penjelas": {"Cara Aplikasi": "Ditebar / Dibenamkan"},
//     "category": 0
//   },
// ];

// List<DosisPupuk> listNitrat = [
//   for (var i = 0; i < dataNitrat.length; i++)
//     DosisPupuk(
//         id: i,
//         namaKomoditi: dataNitrat[i]["namaKomoditi"],
//         img: dataNitrat[i]["img"],
//         satuan: dataNitrat[i]["satuan"],
//         variabels: dataNitrat[i]["variabels"],
//         fieldValue: dataNitrat[i]["fieldValue"],
//         takaran: dataNitrat[i]["takaran"],
//         hasil: dataNitrat[i]["hasil"],
//         penjelas: dataNitrat[i]["penjelas"],
//         category: dataNitrat[i]["category"])
// ];

// List<Map<String, dynamic>> dataNiphos = [
//   {
//     "id": 0,
//     "namaKomoditi": "Padi Sawah **)",
//     "img": "assets/images/komoditi/padi.png",
//     "satuan": "Kg/Ha",
//     "variabels": {
//       "Const_Or": ["Petroganik", 500.0],
//       "Const_Np": ["Niphos", 250.0],
//       "Const_Ur": ["Urea", 200.0],
//       "Const_Kc": ["KCL", 75],
//     },
//     "fieldValue": [],
//     "takaran": {
//       "dasar": {
//         "petroganik": "Const_Or / 1",
//         "niphos": "Const_Np / 2",
//         "urea": "Const_Ur / 4",
//         "kcl": "Const_Kc / 1",
//       },
//       "susulan I (20 HST)": {
//         "niphos": "Const_Np / 2",
//         "urea": "Const_Ur / 4",
//       },
//       "susulan II (35 HST)": {
//         "urea": "Const_Ur / 2",
//       },
//     },
//     "hasil": {
//       "dasar": {
//         "petroganik": 500.0,
//         "niphos": 125.0,
//         "urea": 50.0,
//         "kcl": 75.0,
//       },
//       "susulan I (20 HST)": {
//         "niphos": 125.0,
//         "urea": 50.0,
//       },
//       "susulan II (35 HST)": {
//         "urea": 100.0,
//       },
//     },
//     "penjelas": {"Cara Aplikasi": "Ditebar Di Lahan"},
//     "category": 0
//   },
//   {
//     "id": 1,
//     "namaKomoditi": "Jagung",
//     "img": "assets/images/komoditi/jagung.png",
//     "satuan": "Kg/Ha",
//     "variabels": {
//       "Const_Or": ["Petroganik", 500.0],
//       "Const_Np": ["Niphos", 300.0],
//       "Const_Ur": ["Urea", 275.0],
//       "Const_Kc": ["KCL", 75],
//     },
//     "fieldValue": [],
//     "takaran": {
//       "dasar": {
//         "petroganik": "Const_Or / 1",
//         "niphos": "Const_Np / 2",
//         "urea": "Const_Ur / 3.67",
//         "kcl": "Const_Kc / 1",
//       },
//       "susulan I (20 HST)": {
//         "niphos": "Const_Np / 2",
//         "urea": "Const_Ur / 3.67",
//       },
//       "susulan II (35 HST)": {
//         "urea": "Const_Ur / 2.2",
//       },
//     },
//     "hasil": {
//       "dasar": {
//         "petroganik": 500.0,
//         "niphos": 125.0,
//         "urea": 75.0,
//         "kcl": 75.0,
//       },
//       "susulan I (20 HST)": {
//         "niphos": 150.0,
//         "urea": 75.0,
//       },
//       "susulan II (35 HST)": {
//         "urea": 125.0,
//       },
//     },
//     "penjelas": {"Cara Aplikasi": "Ditabur / dibenamkan"},
//     "category": 0
//   },
//   {
//     "id": 2,
//     "namaKomoditi": "Sawi",
//     "img": "assets/images/komoditi/sawi.png",
//     "satuan": "Kg/Ha",
//     "variabels": {
//       "Const_Or": ["Petroganik", 1500.0],
//       "Const_Np": ["Niphos", 600.0]
//     },
//     "fieldValue": [],
//     "takaran": {
//       "dasar": {
//         "petroganik": "Const_Or / 1",
//         "niphos": "Const_Np / 2",
//       },
//       "susulan I (20 HST)": {
//         "niphos": "Const_Np / 2",
//       },
//     },
//     "hasil": {
//       "dasar": {
//         "petroganik": 1500.0,
//         "niphos": 300.0,
//       },
//       "susulan I (20 HST)": {
//         "niphos": 300.0,
//       },
//     },
//     "penjelas": {"Cara Aplikasi": "Ditabur / dibenamkan"},
//     "category": 0
//   },
//   {
//     "id": 3,
//     "namaKomoditi": "Selada",
//     "img": "assets/images/komoditi/sawi.png",
//     "satuan": "Kg/Ha",
//     "variabels": {
//       "Const_Or": ["Petroganik", 1500.0],
//       "Const_Np": ["Niphos", 600.0]
//     },
//     "fieldValue": [],
//     "takaran": {
//       "dasar": {
//         "petroganik": "Const_Or / 1",
//         "niphos": "Const_Np / 2",
//       },
//       "susulan I (20 HST)": {
//         "niphos": "Const_Np / 2",
//       },
//     },
//     "hasil": {
//       "dasar": {
//         "petroganik": 1500.0,
//         "niphos": 300.0,
//       },
//       "susulan I (20 HST)": {
//         "niphos": 300.0,
//       },
//     },
//     "penjelas": {"Cara Aplikasi": "Ditabur / dibenamkan"},
//     "category": 0
//   },
//   {
//     "id": 4,
//     "namaKomoditi": "Kangkung",
//     "img": "assets/images/komoditi/sawi.png",
//     "satuan": "Kg/Ha",
//     "variabels": {
//       "Const_Or": ["Petroganik", 1500.0],
//       "Const_Np": ["Niphos", 600.0]
//     },
//     "fieldValue": [],
//     "takaran": {
//       "dasar": {
//         "petroganik": "Const_Or / 1",
//         "niphos": "Const_Np / 2",
//       },
//       "susulan I (20 HST)": {
//         "niphos": "Const_Np / 2",
//       },
//     },
//     "hasil": {
//       "dasar": {
//         "petroganik": 1500.0,
//         "niphos": 300.0,
//       },
//       "susulan I (20 HST)": {
//         "niphos": 300.0,
//       },
//     },
//     "penjelas": {"Cara Aplikasi": "Ditabur / dibenamkan"},
//     "category": 0
//   },
//   {
//     "id": 5,
//     "namaKomoditi": "Kubis",
//     "img": "assets/images/komoditi/kubis.png",
//     "satuan": "Kg/Ha",
//     "variabels": {
//       "Const_Or": ["Petroganik", 2000.0],
//       "Const_Np": ["Niphos", 700.0]
//     },
//     "fieldValue": [],
//     "takaran": {
//       "dasar": {
//         "petroganik": "Const_Or / 1",
//         "niphos": "Const_Np / 2.333333333333333",
//       },
//       "susulan I (15 HST)": {
//         "niphos": "Const_Np / 3.5",
//       },
//       "susulan II (30 HST)": {
//         "niphos": "Const_Np / 3.5",
//       },
//     },
//     "hasil": {
//       "dasar": {
//         "petroganik": 2000.0,
//         "niphos": 300.0,
//       },
//       "susulan I (15 HST)": {
//         "niphos": 200.0,
//       },
//       "susulan II (30 HST)": {
//         "niphos": 200.0,
//       },
//     },
//     "penjelas": {"Cara Aplikasi": "Ditabur / dibenamkan"},
//     "category": 0
//   },
//   {
//     "id": 6,
//     "namaKomoditi": "Kembang Kol",
//     "img": "assets/images/komoditi/kubisbunga.png",
//     "satuan": "Kg/Ha",
//     "variabels": {
//       "Const_Or": ["Petroganik", 2000.0],
//       "Const_Np": ["Niphos", 700.0]
//     },
//     "fieldValue": [],
//     "takaran": {
//       "dasar": {
//         "petroganik": "Const_Or / 1",
//         "niphos": "Const_Np / 2.333333333333333",
//       },
//       "susulan I (15 HST)": {
//         "niphos": "Const_Np / 3.5",
//       },
//       "susulan II (30 HST)": {
//         "niphos": "Const_Np / 3.5",
//       },
//     },
//     "hasil": {
//       "dasar": {
//         "petroganik": 2000.0,
//         "niphos": 300.0,
//       },
//       "susulan I (15 HST)": {
//         "niphos": 200.0,
//       },
//       "susulan II (30 HST)": {
//         "niphos": 200.0,
//       },
//     },
//     "penjelas": {"Cara Aplikasi": "Ditabur / dibenamkan"},
//     "category": 0
//   },
//   {
//     "id": 7,
//     "namaKomoditi": "Brokoli",
//     "img": "assets/images/komoditi/kubisbunga.png",
//     "satuan": "Kg/Ha",
//     "variabels": {
//       "Const_Or": ["Petroganik", 2000.0],
//       "Const_Np": ["Niphos", 700.0]
//     },
//     "fieldValue": [],
//     "takaran": {
//       "dasar": {
//         "petroganik": "Const_Or / 1",
//         "niphos": "Const_Np / 2.333333333333333",
//       },
//       "susulan I (15 HST)": {
//         "niphos": "Const_Np / 3.5",
//       },
//       "susulan II (30 HST)": {
//         "niphos": "Const_Np / 3.5",
//       },
//     },
//     "hasil": {
//       "dasar": {
//         "petroganik": 2000.0,
//         "niphos": 300.0,
//       },
//       "susulan I (15 HST)": {
//         "niphos": 200.0,
//       },
//       "susulan II (30 HST)": {
//         "niphos": 200.0,
//       },
//     },
//     "penjelas": {"Cara Aplikasi": "Ditabur / dibenamkan"},
//     "category": 0
//   },
//   {
//     "id": 8,
//     "namaKomoditi": "Bawang Daun",
//     "img": "assets/images/komoditi/bawang.png",
//     "satuan": "Kg/Ha",
//     "variabels": {
//       "Const_Or": ["Petroganik", 2000.0],
//       "Const_Np": ["Niphos", 700.0]
//     },
//     "fieldValue": [],
//     "takaran": {
//       "dasar": {
//         "petroganik": "Const_Or / 1",
//         "niphos": "Const_Np / 2.333333333333333",
//       },
//       "susulan I (15 HST)": {
//         "niphos": "Const_Np / 3.5",
//       },
//       "susulan II (30 HST)": {
//         "niphos": "Const_Np / 3.5",
//       },
//     },
//     "hasil": {
//       "dasar": {
//         "petroganik": 2000.0,
//         "niphos": 300.0,
//       },
//       "susulan I (15 HST)": {
//         "niphos": 200.0,
//       },
//       "susulan II (30 HST)": {
//         "niphos": 200.0,
//       },
//     },
//     "penjelas": {"Cara Aplikasi": "Ditabur / dibenamkan"},
//     "category": 0
//   },
// ];

// List<DosisPupuk> listNiphos = [
//   for (var i = 0; i < dataNiphos.length; i++)
//     DosisPupuk(
//         id: i,
//         namaKomoditi: dataNiphos[i]["namaKomoditi"],
//         img: dataNiphos[i]["img"],
//         satuan: dataNiphos[i]["satuan"],
//         variabels: dataNiphos[i]["variabels"],
//         fieldValue: dataNiphos[i]["fieldValue"],
//         takaran: dataNiphos[i]["takaran"],
//         hasil: dataNiphos[i]["hasil"],
//         penjelas: dataNiphos[i]["penjelas"],
//         category: dataNiphos[i]["category"])
// ];

// List<Map<String, dynamic>> dataOca = [
//   {
//     "id": 0,
//     "namaKomoditi": "Padi Sawah **)",
//     "img": "assets/images/komoditi/padi.png",
//     "satuan": "Kg/Ha",
//     "variabels": {
//       "Const_Or": ["Petroganik", 500.0],
//       "Const_Ph": ["Nitrat", 300.0],
//       "Const_Ur": ["Urea", 200.0],
//       "Const_Oc": ["Oca", 5],
//     },
//     "fieldValue": [],
//     "takaran": {
//       "Persemaian": {
//         "oca": "Const_Oc/10",
//       },
//       "dasar": {
//         "petroganik": "Const_Or / 1",
//         "urea": "Const_Ur / 4",
//         "phonska": "Const_Ph / 2",
//       },
//       "susulan I (15-20 HST)": {
//         "urea": "Const_Ur / 4",
//         "phonska": "Const_Ph / 2",
//         "oca": "Const_Oc / 2.5",
//       },
//       "susulan II (30-35 HST)": {
//         "urea": "Const_Ur / 2",
//         "oca": "Const_Oc / 2",
//       },
//     },
//     "hasil": {
//       "Persemaian": {
//         "oca": 0.5,
//       },
//       "dasar": {
//         "petroganik": 500.0,
//         "urea": 50.0,
//         "phonska": 150.0,
//       },
//       "susulan I (15-20 HST)": {
//         "urea": 50.0,
//         "phonska": 150.0,
//         "oca": 2,
//       },
//       "susulan II (30-35 HST)": {
//         "urea": 100.0,
//         "oca": 2.5,
//       },
//     },
//     "penjelas": {
//       "Cara Aplikasi":
//           "Larutan 1 tutp botol Phonska Oca dalam 2 liter air atau 1 botol Phonska Oca dalam 100 liter air\n Aplikasikan larutan tersebut dengan spray/disemprot/dikocor ke tanaman (permukaan daun, bunga dan buah) atau tanah sekitar perakaran tanaman \n Waktu aplikasi 2-3 minggu setelah tanam \n Dilakukan pengulangan dengan interval 2 minggu sekali"
//     },
//     "category": 0
//   },
//   {
//     "id": 1,
//     "namaKomoditi": "Jagung Hibrida",
//     "img": "assets/images/komoditi/jagung.png",
//     "satuan": "Kg/Ha",
//     "variabels": {
//       "Const_Or": ["Petroganik", 500.0],
//       "Const_Ph": ["Nitrat", 300.0],
//       "Const_Ur": ["Urea", 300.0],
//       "Const_Oc": ["Oca", 5],
//     },
//     "fieldValue": [],
//     "takaran": {
//       "dasar": {
//         "petroganik": "Const_Or / 1",
//         "phonska": "Const_Ph / 2",
//         "urea": "Const_Ur / 4",
//       },
//       "susulan I (15-20 HST)": {
//         "phonska": "Const_Ph / 2",
//         "urea": "Const_Ur / 4",
//         "oca": "Const_Oc /2",
//       },
//       "susulan II (30-35 HST)": {
//         "urea": "Const_Ur / 2",
//         "oca": "Const_Oc /2",
//       },
//     },
//     "hasil": {
//       "dasar": {
//         "petroganik": 500.0,
//         "phonska": 150.0,
//         "urea": 75.0,
//       },
//       "susulan I (15-20 HST)": {
//         "phonska": 150.0,
//         "urea": 75.0,
//         "oca": 2.5,
//       },
//       "susulan II (30-35 HST)": {
//         "urea": 150.0,
//         "oca": 2.5,
//       },
//     },
//     "penjelas": {
//       "Cara Aplikasi":
//           "Larutan 1 tutp botol Phonska Oca dalam 2 liter air atau 1 botol Phonska Oca dalam 100 liter air\n Aplikasikan larutan tersebut dengan spray/disemprot/dikocor ke tanaman (permukaan daun, bunga dan buah) atau tanah sekitar perakaran tanaman \n Waktu aplikasi 2-3 minggu setelah tanam \n Dilakukan pengulangan dengan interval 2 minggu sekali"
//     },
//     "category": 0
//   },
//   {
//     "id": 2,
//     "namaKomoditi": "Kedelai",
//     "img": "assets/images/komoditi/kedelai.png",
//     "satuan": "Kg/Ha",
//     "variabels": {
//       "Const_Or": ["Petroganik", 500.0],
//       "Const_Ph": ["Nitrat", 250.0],
//       "Const_Oc": ["Oca", 5],
//     },
//     "fieldValue": [],
//     "takaran": {
//       "dasar": {
//         "petroganik": "Const_Or / 1",
//         "phonska": "Const_Ph / 2",
//       },
//       "susulan I (15 HST)": {
//         "oca": "Const_Oc /2",
//       },
//       "susulan II (30 HST)": {
//         "phonska": "Const_Ph / 2",
//         "oca": "Const_Oc /2",
//       },
//     },
//     "hasil": {
//       "dasar": {
//         "petroganik": 500.0,
//         "phonska": 125.0,
//       },
//       "susulan I (15 HST)": {
//         "oca": 2.5,
//       },
//       "susulan II (30 HST)": {
//         "phonska": 125.0,
//         "oca": 2.5,
//       },
//     },
//     "penjelas": {
//       "Cara Aplikasi":
//           "Larutan 1 tutp botol Phonska Oca dalam 2 liter air atau 1 botol Phonska Oca dalam 100 liter air\n Aplikasikan larutan tersebut dengan spray/disemprot/dikocor ke tanaman (permukaan daun, bunga dan buah) atau tanah sekitar perakaran tanaman \n Waktu aplikasi 2-3 minggu setelah tanam \n Dilakukan pengulangan dengan interval 2 minggu sekali"
//     },
//     "category": 0
//   },
//   {
//     "id": 3,
//     "namaKomoditi": "Bawang Merah",
//     "img": "assets/images/komoditi/bawang.png",
//     "satuan": "Kg/Ha",
//     "variabels": {
//       "Const_Or": ["Petroganik", 2000.0],
//       "Const_Ph": ["Nitrat", 800.0],
//       "Const_Za": ["Za", 400.0],
//       "Const_Oc": ["Oca", 5],
//     },
//     "fieldValue": [],
//     "takaran": {
//       "dasar": {
//         "petroganik": "Const_Or / 1",
//         "phonska": "Const_Ph / 1.78",
//       },
//       "susulan I (15 HST)": {
//         "phonska": "Const_Ph / 2.286",
//         "za": "Const_Za/4",
//         "oca": "Const_Oc /2",
//       },
//       "susulan II (30 HST)": {
//         "za": "Const_Za / 1.34",
//         "oca": "Const_Oc /2",
//       },
//     },
//     "hasil": {
//       "dasar": {
//         "petroganik": 2000.0,
//         "phonska": 450.0,
//       },
//       "susulan I (15 HST)": {
//         "phonska": 350.0,
//         "za": 100.0,
//         "oca": 2.5,
//       },
//       "susulan II (30 HST)": {
//         "za": 300.0,
//         "oca": 2.5,
//       },
//     },
//     "penjelas": {
//       "Cara Aplikasi":
//           "Larutan 1 tutp botol Phonska Oca dalam 2 liter air atau 1 botol Phonska Oca dalam 100 liter air\n Aplikasikan larutan tersebut dengan spray/disemprot/dikocor ke tanaman (permukaan daun, bunga dan buah) atau tanah sekitar perakaran tanaman \n Waktu aplikasi 2-3 minggu setelah tanam \n Dilakukan pengulangan dengan interval 2 minggu sekali"
//     },
//     "category": 0
//   },
//   {
//     "id": 6,
//     "namaKomoditi": "Kentang",
//     "img": "assets/images/komoditi/kentang.png",
//     "satuan": "Kg/Ha",
//     "variabels": {
//       "Const_Or": ["Petroganik", 2000.0],
//       "Const_Ph": ["Nitrat", 1000.0],
//       "Const_Za": ["Za", 200.0],
//       "Const_Oc": ["Oca", 5],
//     },
//     "fieldValue": [],
//     "takaran": {
//       "dasar": {
//         "petroganik": "Const_Or / 1",
//         "phonska": "Const_Ph / 2",
//         "za": "Const_Za/2",
//       },
//       "susulan I (15 HST)": {
//         "oca": "Const_Oc /2",
//       },
//       "susulan II (30 HST)": {
//         "phonska": "Const_Ph / 2",
//         "za": "Const_Za /2",
//         "oca": "Const_Oc /2",
//       },
//     },
//     "hasil": {
//       "dasar": {
//         "petroganik": 2000.0,
//         "phonska": 500.0,
//         "za": 100.0,
//       },
//       "susulan I (15 HST)": {
//         "oca": 2.5,
//       },
//       "susulan II (30 HST)": {
//         "phonska": 500.0,
//         "za": 100.0,
//         "oca": 2.5,
//       },
//     },
//     "penjelas": {
//       "Cara Aplikasi":
//           "Larutan 1 tutp botol Phonska Oca dalam 2 liter air atau 1 botol Phonska Oca dalam 100 liter air\n Aplikasikan larutan tersebut dengan spray/disemprot/dikocor ke tanaman (permukaan daun, bunga dan buah) atau tanah sekitar perakaran tanaman \n Waktu aplikasi 2-3 minggu setelah tanam \n Dilakukan pengulangan dengan interval 2 minggu sekali"
//     },
//     "category": 0
//   },
//   {
//     "id": 7,
//     "namaKomoditi": "Lombok",
//     "img": "assets/images/komoditi/lombok.png",
//     "satuan": "Kg/Ha",
//     "variabels": {
//       "Const_Or": ["Petroganik", 2000.0],
//       "Const_Ph": ["Nitrat", 800.0],
//       "Const_Za": ["Za", 200.0],
//       "Const_Oc": ["Oca", 5],
//     },
//     "fieldValue": [],
//     "takaran": {
//       "dasar": {
//         "petroganik": "Const_Or / 1",
//         "phonska": "Const_Ph / 2",
//       },
//       "susulan I (20 HST)": {
//         "phonska": "Const_Ph / 2",
//         "oca": "Const_Oc /2",
//       },
//       "susulan II (40 HST)": {
//         "za": "Const_Za /1",
//         "oca": "Const_Oc /2",
//       },
//     },
//     "hasil": {
//       "dasar": {
//         "petroganik": 2000.0,
//         "phonska": 400.0,
//       },
//       "susulan I (20 HST)": {
//         "phonska": 400.0,
//         "oca": 2.5,
//       },
//       "susulan II (40 HST)": {
//         "za": 200.0,
//         "oca": 2.5,
//       },
//     },
//     "penjelas": {
//       "Cara Aplikasi":
//           "Larutan 1 tutp botol Phonska Oca dalam 2 liter air atau 1 botol Phonska Oca dalam 100 liter air\n Aplikasikan larutan tersebut dengan spray/disemprot/dikocor ke tanaman (permukaan daun, bunga dan buah) atau tanah sekitar perakaran tanaman \n Waktu aplikasi 2-3 minggu setelah tanam \n Dilakukan pengulangan dengan interval 2 minggu sekali"
//     },
//     "category": 0
//   },
//   {
//     "id": 8,
//     "namaKomoditi": "Tebu",
//     "img": "assets/images/komoditi/tebu.png",
//     "satuan": "Kg/Ha",
//     "variabels": {
//       "Const_Or": ["Petroganik", 2000.0],
//       "Const_Ph": ["Nitrat", 480.0],
//       "Const_Za": ["Za", 440.0],
//       "Const_Kc": ["Kcl", 80.0],
//       "Const_Oc": ["Oca", 5],
//     },
//     "fieldValue": [],
//     "takaran": {
//       "0-7 HST": {
//         "petroganik": "Const_Or / 1",
//         "phonska": "Const_Ph / 2",
//         "za": "Const_Za/2",
//         "oca": "Const_Oc /2",
//       },
//       "35-45 HST": {
//         "phonska": "Const_Ph / 2",
//         "za": "Const_Za/2",
//         "oca": "Const_Kc /1",
//       },
//     },
//     "hasil": {
//       "0-7 HST": {
//         "petroganik": 2000.0,
//         "phonska": 240.0,
//         "za": 220.0,
//         "oca": 2.5,
//       },
//       "35-45 HST": {
//         "petroganik": 2000.0,
//         "phonska": 240.0,
//         "za": 220.0,
//         "kcl": 80.0,
//         "oca": 2.5,
//       },
//     },
//     "penjelas": {
//       "Cara Aplikasi":
//           "Larutan 1 tutp botol Phonska Oca dalam 2 liter air atau 1 botol Phonska Oca dalam 100 liter air\n Aplikasikan larutan tersebut dengan spray/disemprot/dikocor ke tanaman (permukaan daun, bunga dan buah) atau tanah sekitar perakaran tanaman \n Waktu aplikasi 2-3 minggu setelah tanam \n Dilakukan pengulangan dengan interval 2 minggu sekali"
//     },
//     "category": 0
//   },
// ];

// List<DosisPupuk> listOca = [
//   for (var i = 0; i < dataOca.length; i++)
//     DosisPupuk(
//         id: i,
//         namaKomoditi: dataOca[i]["namaKomoditi"],
//         img: dataOca[i]["img"],
//         satuan: dataOca[i]["satuan"],
//         variabels: dataOca[i]["variabels"],
//         fieldValue: dataOca[i]["fieldValue"],
//         takaran: dataOca[i]["takaran"],
//         hasil: dataOca[i]["hasil"],
//         penjelas: dataOca[i]["penjelas"],
//         category: dataOca[i]["category"])
// ];

// List<Map<String, dynamic>> dataDPPMeroke = [
//   {
//     "id": 0,
//     "namaKomoditi": "Ubi Kayu",
//     "img": "assets/images/komoditi/ubikayu.png",
//     "satuan": "Kg/Ha",
//     "variabels": {
//       "Const_Ss": ["SS (AMMOPHOS)", 375.0],
//       "Const_Mp": ["MerokeMOP", 100],
//       "Const_Ur": ["Urea", 375.0],
//     },
//     "fieldValue": [],
//     "takaran": {
//       "2 BST": {
//         "SS (AMMOPHOS)": "Const_Ss",
//       },
//       "6 BST": {
//         "MerokeMOP": "Const_Mp",
//         "Urea": "Const_Ur",
//       },
//     },
//     "hasil": {
//       "2 BST": {"SS (AMMOPHOS)": 375.0},
//       "6 BST": {"MerokeMOP": 100.0, "Urea": 375.0},
//     },
//     "penjelas": {"": ""},
//     "category": 1 // jenia perusahaan
//   },
//   {
//     "id": 1,
//     "namaKomoditi": "Padi",
//     "img": "assets/images/komoditi/padi.png",
//     "satuan": "Kg/Ha",
//     "variabels": {
//       "Const_Mp": ["Mutiara NPK pro", 250.0],
//       "Const_Ur": ["Urea", 200.0],
//       "Const_Kp": ["KARATE PLUS BORONI", 125.0],
//     },
//     "fieldValue": [],
//     "takaran": {
//       "14 HST": {
//         "Mutiara NPK pro": "Const_Mp",
//         "Urea": "Const_Ur",
//       },
//       "30 HST": {
//         "Mutiara NPK pro": "Const_Mp",
//         "Urea": "Const_Ur",
//       },
//       "45 HST": {
//         "KARATE PLUS BORONI": "Const_Kp",
//       },
//     },
//     "hasil": {
//       "14 HST": {
//         "Mutiara NPK pro": 100.0,
//         "Urea": 100.0,
//       },
//       "30 HST": {
//         "Mutiara NPK pro": 150.0,
//         "Urea": 100.0,
//       },
//       "45 HST": {
//         "KARATE PLUS BORONI": 125.0,
//       },
//     },
//     "penjelas": {"": ""},
//     "category": 1 // jenia perusahaan
//   },
// ];
// List<DosisPupuk> listDPPMeroke = [
//   for (var i = 0; i < dataDPPMeroke.length; i++)
//     DosisPupuk(
//         id: i,
//         namaKomoditi: dataDPPMeroke[i]["namaKomoditi"],
//         img: dataDPPMeroke[i]["img"],
//         satuan: dataDPPMeroke[i]["satuan"],
//         variabels: dataDPPMeroke[i]["variabels"],
//         fieldValue: dataDPPMeroke[i]["fieldValue"],
//         takaran: dataDPPMeroke[i]["takaran"],
//         hasil: dataDPPMeroke[i]["hasil"],
//         penjelas: dataDPPMeroke[i]["penjelas"],
//         category: dataDPPMeroke[i]["category"])
// ];
// List<Map<String, dynamic>> dataDPHMeroke = [
//   {
//     "id": 0,
//     "namaKomoditi": "Kacang Tanah",
//     "img": "assets/images/komoditi/buncis.png",
//     "satuan": "Kg/Ha",
//     "variabels": {
//       "Const_Mp": ["Mutiara NPK pro", 250.0],
//       "Const_Kp": ["KARATE PLUS BORONI", 50]
//     },
//     "fieldValue": [],
//     "takaran": {
//       "dasar": {
//         "Mutiara NPK pro": "Const_Mp/1.6666666666666667",
//       },
//       "HST35": {
//         "Mutiara NPK pro": "Const_Mp/2.5",
//         "KARATE PLUS BORONI": "Const_Kp",
//       },
//     },
//     "hasil": {
//       "dasar": {"Mutiara NPK pro": 150.0},
//       "HST35": {"Mutiara NPK pro": 100.0, "KARATE PLUS BORONI": 50.0},
//     },
//     "penjelas": {"": ""},
//     "category": 1 // jenia perusahaan
//   },
//   {
//     "id": 1,
//     "namaKomoditi": "Wortel",
//     "img": "assets/images/komoditi/wortel.png",
//     "satuan": "Kg/Ha",
//     "variabels": {
//       "Const_Mn": ["Mutiara NPK", 50.0],
//       "Const_Ss": ["SS (AMMOPHOS)", 50.0],
//       "Const_Kp": ["KARATE PLUS BORONI", 50.0],
//       "Const_Mg": ["Mutiara Grower", 100.0],
//       "Const_Sb": ["SUBURKALI BUTIR", 50.0],
//     },
//     "fieldValue": [],
//     "takaran": {
//       "dasar": {
//         "Mutiara NPK": "Const_Mn",
//         "SS (AMMOPHOS)": "Const_Ss",
//       },
//       "HST45": {
//         "Mutiara Grower": "Const_Mg",
//         "KARATE PLUS BORONI": "Const_Kp",
//         "SUBURKALI BUTIR": "Const_Sb",
//       },
//     },
//     "hasil": {
//       "dasar": {"Mutiara NPK": 50.0, "SS (AMMOPHOS)": 50.0},
//       "HST45": {
//         "Mutiara Grower": 50.0,
//         "KARATE PLUS BORONI": 50.0,
//         "SUBURKALI BUTIR": 50.0
//       },
//     },
//     "penjelas": {"": ""},
//     "category": 1
//   },
//   {
//     "id": 2,
//     "namaKomoditi": "Bawang Putih",
//     "img": "assets/images/komoditi/bawangputih.png",
//     "satuan": "Kg/Ha",
//     "variabels": {
//       "Const_Mn": ["Mutiara NPK", 200.0],
//       "Const_Ss": ["SS (AMMOPHOS)", 200.0],
//       "Const_Mp": ["Mutiara NPK pro", 400.0],
//       "Const_Kp": ["KARATE PLUS BORONI", 100.0],
//       "Const_Sb": ["SUBURKALI BUTIR", 100.0],
//     },
//     "fieldValue": [],
//     "takaran": {
//       "dasar": {
//         "Mutiara NPK": "Const_Mn",
//         "SS (AMMOPHOS)": "Const_Ss",
//       },
//       "HST25": {
//         "Mutiara NPK pro": "Const_Mp/2",
//         "KARATE PLUS BORONI": "Const_Kp",
//       },
//       "HST55": {
//         "Mutiara NPK pro": "Const_Mp/2",
//         "SUBURKALI BUTIR": "Const_Sb",
//       },
//     },
//     "hasil": {
//       "dasar": {"Mutiara NPK": 200.0, "SS (AMMOPHOS)": 200},
//       "HST25": {"Mutiara NPK pro": 200.0, "KARATE PLUS BORONI": 100.0},
//       "HST55": {"Mutiara NPK pro": 100.0, "SUBURKALI BUTIR": 100.0},
//     },
//     "penjelas": {"": ""},
//     "category": 1
//   },
//   {
//     "id": 3,
//     "namaKomoditi": "Brokoli",
//     "img": "assets/images/komoditi/kubis.png",
//     "satuan": "Kg/Ha",
//     "variabels": {
//       "Const_Mn": ["Mutiara NPK", 100.0],
//       "Const_Kp": ["KARATE PLUS BORONI", 300.0],
//       "Const_Mg": ["Mutiara Grower", 400.0],
//     },
//     "fieldValue": [],
//     "takaran": {
//       "dasar": {
//         "Mutiara NPK": "Const_Mn",
//         "KARATE PLUS BORONI": "Const_Kp",
//       },
//       "HST25": {
//         "Mutiara Grower": "Const_Mg/2",
//         "KARATE PLUS BORONI": "Const_Kp/3",
//       },
//       "HST45": {
//         "Mutiara Grower": "Const_Mg/2",
//         "KARATE PLUS BORONI": "Const_Kp/3",
//       },
//     },
//     "hasil": {
//       "dasar": {"Mutiara NPK": 100.0, "KARATE PLUS BORONI": 100},
//       "HST25": {"Mutiara Grower": 200.0, "KARATE PLUS BORONI": 100.0},
//       "HST45": {"Mutiara Grower": 200.0, "KARATE PLUS BORONI": 100.0},
//     },
//     "penjelas": {"": ""},
//     "category": 1
//   },
//   {
//     "id": 4,
//     "namaKomoditi": "Bunga Kol",
//     "img": "assets/images/komoditi/kubisbunga.png",
//     "satuan": "Kg/Ha",
//     "variabels": {
//       "Const_Mn": ["Mutiara NPK", 100.0],
//       "Const_Kp": ["KARATE PLUS BORONI", 300.0],
//       "Const_Mg": ["Mutiara Grower", 400.0],
//     },
//     "fieldValue": [],
//     "takaran": {
//       "dasar": {
//         "Mutiara NPK": "Const_Mn",
//         "KARATE PLUS BORONI": "Const_Kp",
//       },
//       "HST25": {
//         "Mutiara Grower": "Const_Mg/2",
//         "KARATE PLUS BORONI": "Const_Kp/3",
//       },
//       "HST45": {
//         "Mutiara Grower": "Const_Mg/2",
//         "KARATE PLUS BORONI": "Const_Kp/3",
//       },
//     },
//     "hasil": {
//       "dasar": {"Mutiara NPK": 100.0, "KARATE PLUS BORONI": 100},
//       "HST25": {"Mutiara Grower": 200.0, "KARATE PLUS BORONI": 100.0},
//       "HST45": {"Mutiara Grower": 200.0, "KARATE PLUS BORONI": 100.0},
//     },
//     "penjelas": {"": ""},
//     "category": 1
//   },
//   {
//     "id": 5,
//     "namaKomoditi": "Bawang Merah",
//     "img": "assets/images/komoditi/bawang.png",
//     "satuan": "Kg/Ha",
//     "variabels": {
//       "Const_Mn": ["Mutiara NPK", 275.0],
//       "Const_Ss": ["SS (AMMOPHOS)", 250.0],
//       "Const_Kp": ["KARATE PLUS BORONI", 225.0],
//       "Const_Mg": ["Mutiara Grower", 300.0],
//       "Const_Sb": ["SUBURKALI BUTIR", 300.0],
//     },
//     "fieldValue": [],
//     "takaran": {
//       "dasar": {
//         "Mutiara NPK": "Const_Mn/2.2",
//         "KARATE PLUS BORONI": "Const_Kp/1.8",
//         "SS (AMMOPHOS)": "Const_Ss"
//       },
//       "HST30": {
//         "Mutiara NPK": "Const_Mg/1.8333333333333333",
//         "KARATE PLUS BORONI": "Const_Kp/2.25",
//         "SUBURKALI BUTIR": "Const_Sb/3",
//       },
//       "HST45": {
//         "Mutiara Grower": "Const_Mg",
//         "SUBURKALI BUTIR": "Const_Sb/1.5",
//       },
//     },
//     "hasil": {
//       "dasar": {
//         "Mutiara NPK": 125.0,
//         "KARATE PLUS BORONI": 100,
//         "SS (AMMOPHOS)": 250
//       },
//       "HST30": {
//         "Mutiara NPK": 150.0,
//         "KARATE PLUS BORONI": 100.0,
//         "SUBURKALI BUTIR": 100
//       },
//       "HST45": {"Mutiara Grower": 300.0, "SUBURKALI BUTIR": 100},
//     },
//     "penjelas": {"": ""},
//     "category": 1
//   },
//   {
//     "id": 6,
//     "namaKomoditi": "Kubis",
//     "img": "assets/images/komoditi/kubis.png",
//     "satuan": "Kg/Ha",
//     "variabels": {
//       "Const_Mn": ["Mutiara NPK", 100.0],
//       "Const_Kp": ["KARATE PLUS BORONI", 300.0],
//       "Const_Mg": ["Mutiara Grower", 400.0],
//     },
//     "fieldValue": [],
//     "takaran": {
//       "dasar": {
//         "Mutiara NPK": "Const_Mn",
//         "KARATE PLUS BORONI": "Const_Kp",
//       },
//       "HST25": {
//         "Mutiara Grower": "Const_Mg/2",
//         "KARATE PLUS BORONI": "Const_Kp/3",
//       },
//       "HST45": {
//         "Mutiara Grower": "Const_Mg/2",
//         "KARATE PLUS BORONI": "Const_Kp/3",
//       },
//     },
//     "hasil": {
//       "dasar": {"Mutiara NPK": 100.0, "KARATE PLUS BORONI": 100},
//       "HST25": {"Mutiara Grower": 200.0, "KARATE PLUS BORONI": 100.0},
//       "HST45": {"Mutiara Grower": 200.0, "KARATE PLUS BORONI": 100.0},
//     },
//     "penjelas": {"": ""},
//     "category": 1
//   },
// ];

// List<DosisPupuk> listDPHMeroke = [
//   for (var i = 0; i < dataDPHMeroke.length; i++)
//     DosisPupuk(
//         id: i,
//         namaKomoditi: dataDPHMeroke[i]["namaKomoditi"],
//         img: dataDPHMeroke[i]["img"],
//         satuan: dataDPHMeroke[i]["satuan"],
//         variabels: dataDPHMeroke[i]["variabels"],
//         fieldValue: dataDPHMeroke[i]["fieldValue"],
//         takaran: dataDPHMeroke[i]["takaran"],
//         hasil: dataDPHMeroke[i]["hasil"],
//         penjelas: dataDPHMeroke[i]["penjelas"],
//         category: dataDPHMeroke[i]["category"])
// ];

// List<Map<String, dynamic>> dataDPM = [
//   {
//     "id": 0,
//     "namaKomoditi": "Padi Sawah **)",
//     "img": "assets/images/komoditi/padi.png",
//     "satuan": "Kg/Ha",
//     "variabels": {
//       "Const_Ur": ["Urea", 200.0],
//       "Const_Ph": ["Phonska Plus", 300.0]
//     },
//     "fieldValue": [],
//     "takaran": {
//       "dasar": {
//         "urea": "Const_Ur / 4",
//         "phonska": "Const_Ph / 2",
//       },
//       "HST20": {
//         "urea": "Const_Ur / 4",
//         "phonska": "Const_Ph / 2",
//       },
//       "HST35": {"urea": "Const_Ur / 2"},
//     },
//     "hasil": {
//       "dasar": {"urea": 50.0, "phonska": 150.0},
//       "HST20": {"urea": 50.0, "phonska": 150.0},
//       "HST35": {"urea": 100.0},
//     },
//     "penjelas": {
//       "**)": "Tanah Kahat Belerang 50kg Urea diganti dengan 100kg ZA"
//     },
//     "category": 0
//   },
//   {
//     "id": 1,
//     "namaKomoditi": "Jagung Hibrida",
//     "img": "assets/images/komoditi/jagung.png",
//     "satuan": "Kg/Ha",
//     "variabels": {
//       "Const_Ur": ["Urea", 300.0],
//       "Const_Ph": ["Phonska Plus", 300.0]
//     },
//     "fieldValue": [],
//     "takaran": {
//       "dasar": {
//         "urea": "Const_Ur / 4",
//         "phonska": "Const_Ph / 2",
//       },
//       "HST20": {
//         "urea": "Const_Ur / 4",
//         "phonska": "Const_Ph / 2",
//       },
//       "HST35": {"urea": "Const_Ur / 2"},
//     },
//     "hasil": {
//       "dasar": {"urea": 0.0, "phonska": 0.0},
//       "HST20": {"urea": 0.0, "phonska": 0.0},
//       "HST35": {"urea": 0.0},
//     },
//     "penjelas": {
//       "**)": "Tanah Kahat Belerang 50kg Urea diganti dengan 100kg ZA"
//     },
//     "category": 0
//   },
//   {
//     "id": 2,
//     "namaKomoditi": "Kedelai",
//     "img": "assets/images/komoditi/kedelai.png",
//     "satuan": "Kg/Ha",
//     "variabels": {
//       "Const_Ph": ["Phonska Plus", 250.0]
//     },
//     "fieldValue": [],
//     "takaran": {
//       "dasar": {
//         "phonska": "Const_Ph / 2",
//       },
//       "HST30": {
//         "phonska": "Const_Ph / 2",
//       },
//     },
//     "hasil": {
//       "dasar": {"phonska": 0.0},
//       "HST30": {"phonska": 0.0},
//     },
//     "penjelas": {"": ""},
//     "category": 0
//   },
//   {
//     "id": 3,
//     "namaKomoditi": "Ubi Kayu",
//     "img": "assets/images/komoditi/ubikayu.png",
//     "satuan": "Kg/Ha",
//     "variabels": {
//       "Const_Ur": ["Urea", 150.0],
//       "Const_Ph": ["Phonska Plus", 300.0]
//     },
//     "fieldValue": [],
//     "takaran": {
//       "dasar": {
//         "urea": "Const_Ur / 6",
//         "phonska": "Const_Ph / 2",
//       },
//       "HST60": {
//         "urea": "Const_Ur - Const_Ur / 6",
//         "phonska": "Const_Ph / 2",
//       }
//     },
//     "hasil": {
//       "dasar": {"urea": 0.0, "phonska": 0.0},
//       "HST60": {"urea": 0.0, "phonska": 0.0},
//     },
//     "penjelas": {"": ""},
//     "category": 0
//   },
//   {
//     "id": 4,
//     "namaKomoditi": "Ubi Jalar",
//     "img": "assets/images/komoditi/ubijalar.png",
//     "satuan": "Kg/Ha",
//     "variabels": {
//       "Const_Ur": ["Urea", 100.0],
//       "Const_Ph": ["Phonska Plus", 300.0]
//     },
//     "fieldValue": [],
//     "takaran": {
//       "dasar": {
//         "urea": "Const_Ur / 4",
//         "phonska": "Const_Ph / 2",
//       },
//       "HST60": {
//         "urea": "Const_Ur - Const_Ur / 4",
//         "phonska": "Const_Ph / 2",
//       }
//     },
//     "hasil": {
//       "dasar": {"urea": 0.0, "phonska": 0.0},
//       "HST60": {"urea": 0.0, "phonska": 0.0},
//     },
//     "penjelas": {"": ""},
//     "category": 0
//   },
//   {
//     "id": 5,
//     "namaKomoditi": "Bawang Merah",
//     "img": "assets/images/komoditi/bawang.png",
//     "satuan": "Kg/Ha",
//     "variabels": {
//       "Const_Ph": ["Phonska Plus", 800.0],
//       "Const_Za": ["ZA", 400.0],
//     },
//     "fieldValue": [],
//     "takaran": {
//       "dasar": {
//         "phonska": "Const_Ph / 2",
//         "za": "Const_Za / 2",
//       },
//       "HST30": {
//         "phonska": "Const_Ph / 2",
//         "za": "Const_Za / 2",
//       }
//     },
//     "hasil": {
//       "dasar": {"phonska": 0.0, "za": 0.0},
//       "HST30": {"phonska": 0.0, "za": 0.0},
//     },
//     "penjelas": {"": ""},
//     "category": 0
//   },
//   {
//     "id": 6,
//     "namaKomoditi": "Kentang",
//     "img": "assets/images/komoditi/kentang.png",
//     "satuan": "Kg/Ha",
//     "variabels": {
//       "Const_Ph": ["Phonska Plus", 1000.0],
//       "Const_Za": ["ZA", 200.0],
//     },
//     "fieldValue": [],
//     "takaran": {
//       "dasar": {
//         "phonska": "Const_Ph / 2",
//         "za": "Const_Za / 2",
//       },
//       "HST30": {
//         "phonska": "Const_Ph / 2",
//         "za": "Const_Za / 2",
//       }
//     },
//     "hasil": {
//       "dasar": {"phonska": 0.0, "za": 0.0},
//       "HST30": {"phonska": 0.0, "za": 0.0},
//     },
//     "penjelas": {"": ""},
//     "category": 0
//   },
//   {
//     "id": 7,
//     "namaKomoditi": "Kubis",
//     "img": "assets/images/komoditi/kubis.png",
//     "satuan": "Kg/Ha",
//     "variabels": {
//       "Const_Ph": ["Phonska Plus", 400.0],
//       "Const_Za": ["ZA", 300.0],
//     },
//     "fieldValue": [],
//     "takaran": {
//       "dasar": {
//         "phonska": "Const_Ph / 2",
//         "za": "Const_Za / 6",
//       },
//       "HST15": {
//         "phonska": "Const_Ph / 2",
//         "za": "Const_Za / 6",
//       },
//       "HST30": {
//         "za": "Const_Za - Const_Za / 3",
//       }
//     },
//     "hasil": {
//       "dasar": {"phonska": 0.0, "za": 0.0},
//       "HST15": {"phonska": 0.0, "za": 0.0},
//       "HST30": {"za": 0.0},
//     },
//     "penjelas": {"": ""},
//     "category": 0
//   },
//   {
//     "id": 8,
//     "namaKomoditi": "Tomat",
//     "img": "assets/images/komoditi/tomat.png",
//     "satuan": "Kg/Ha",
//     "variabels": {
//       "Const_Ph": ["Phonska Plus", 800.0],
//       "Const_Za": ["ZA", 200.0],
//     },
//     "fieldValue": [],
//     "takaran": {
//       "dasar": {
//         "phonska": "Const_Ph / 2",
//       },
//       "HST15": {
//         "phonska": "Const_Ph / 2",
//       },
//       "HST30": {
//         "za": "Const_Za",
//       }
//     },
//     "hasil": {
//       "dasar": {"phonska": 0.0},
//       "HST15": {"phonska": 0.0},
//       "HST30": {"za": 0.0},
//     },
//     "penjelas": {"": ""},
//     "category": 0
//   },
//   {
//     "id": 9,
//     "namaKomoditi": "Wortel",
//     "img": "assets/images/komoditi/wortel.png",
//     "satuan": "Kg/Ha",
//     "variabels": {
//       "Const_Ph": ["Phonska Plus", 400.0],
//       "Const_Za": ["ZA", 300.0],
//     },
//     "fieldValue": [],
//     "takaran": {
//       "dasar": {
//         "phonska": "Const_Ph / 2",
//         "za": "Const_Za / 6",
//       },
//       "HST15": {
//         "phonska": "Const_Ph / 2",
//         "za": "Const_Za / 6",
//       },
//       "HST30": {
//         "za": "Const_Za - Const_Za / 3",
//       }
//     },
//     "hasil": {
//       "dasar": {"phonska": 0.0, "za": 0.0},
//       "HST15": {"phonska": 0.0, "za": 0.0},
//       "HST30": {"za": 0.0},
//     },
//     "penjelas": {"": ""},
//     "category": 0
//   },
//   {
//     "id": 10,
//     "namaKomoditi": "Buncis / Kacang Panjang",
//     "img": "assets/images/pot/balok.png",
//     "satuan": "Kg/Ha",
//     "variabels": {
//       "Const_Ph": ["Phonska Plus", 450.0],
//     },
//     "fieldValue": [],
//     "takaran": {
//       "dasar": {
//         "phonska": "Const_Ph / 3",
//       },
//       "HST15": {
//         "phonska": "Const_Ph / 3",
//       },
//       "HST30": {
//         "phonska": "Const_Ph / 3",
//       }
//     },
//     "hasil": {
//       "dasar": {"phonska": 0.0},
//       "HST15": {"phonska": 0.0},
//       "HST30": {"phonska": 0.0},
//     },
//     "penjelas": {"": ""},
//     "category": 0
//   },
//   {
//     "id": 11,
//     "namaKomoditi": "Bawang Putih",
//     "img": "assets/images/komoditi/bawangputih.png",
//     "satuan": "Kg/Ha",
//     "variabels": {
//       "Const_Ph": ["Phonska Plus", 800.0],
//       "Const_Za": ["ZA", 400.0],
//     },
//     "fieldValue": [],
//     "takaran": {
//       "dasar": {
//         "phonska": "Const_Ph / 2",
//       },
//       "HST20": {
//         "phonska": "Const_Ph / 2",
//         "za": "Const_Za / 8",
//       },
//       "HST40": {
//         "za": "Const_Za - Const_Za / 8",
//       }
//     },
//     "hasil": {
//       "dasar": {"za": 0.0},
//       "HST20": {"phonska": 0.0, "za": 0.0},
//       "HST40": {"za": 0.0},
//     },
//     "penjelas": {"": ""},
//     "category": 0
//   },
//   {
//     "id": 12,
//     "namaKomoditi": "Lombok",
//     "img": "assets/images/komoditi/lombok.png",
//     "satuan": "Kg/Ha",
//     "variabels": {
//       "Const_Ph": ["Phonska Plus", 800.0],
//       "Const_Za": ["ZA", 200.0],
//     },
//     "fieldValue": [],
//     "takaran": {
//       "dasar": {
//         "phonska": "Const_Ph / 2",
//       },
//       "HST20": {
//         "phonska": "Const_Ph / 2",
//       },
//       "HST40": {
//         "za": "Const_Za",
//       }
//     },
//     "hasil": {
//       "dasar": {"phonska": 0.0},
//       "HST20": {"phonska": 0.0},
//       "HST40": {"za": 0.0},
//     },
//     "penjelas": {"": ""},
//     "category": 0
//   },
//   {
//     "id": 13,
//     "namaKomoditi": "Mentimun",
//     "img": "assets/images/komoditi/mentimun.png",
//     "satuan": "Kg/Ha",
//     "variabels": {
//       "Const_Ph": ["Phonska Plus", 400.0],
//     },
//     "fieldValue": [],
//     "takaran": {
//       "dasar": {
//         "phonska": "Const_Ph / 4",
//       },
//       "HST20": {
//         "phonska": "Const_Ph / 4 + Const_Ph / 8",
//       },
//       "HST35": {
//         "phonska": "Const_Ph / 4 + Const_Ph / 8",
//       }
//     },
//     "hasil": {
//       "dasar": {"phonska": 0.0},
//       "HST20": {"phonska": 0.0},
//       "HST35": {"phonska": 0.0},
//     },
//     "penjelas": {"": ""},
//     "category": 0
//   },
//   {
//     "id": 14,
//     "namaKomoditi": "Terong",
//     "img": "assets/images/komoditi/terong.png",
//     "satuan": "Kg/Ha",
//     "variabels": {
//       "Const_Ph": ["Phonska Plus", 700.0],
//       "Const_Za": ["ZA", 150.0],
//     },
//     "fieldValue": [],
//     "takaran": {
//       "dasar": {
//         "phonska": "Const_Ph - Const_Ph / 7",
//       },
//       "HST15": {
//         "phonska": "Const_Ph - Const_Ph / 7",
//       },
//       "HST30": {
//         "phonska": "Const_Ph - Const_Ph / 7",
//         "za": "Const_Za",
//       }
//     },
//     "hasil": {
//       "dasar": {"phonska": 0.0},
//       "HST15": {"phonska": 0.0},
//       "HST30": {"phonska": 0.0, "za": 0.0},
//     },
//     "penjelas": {"": ""},
//     "category": 0
//   },
//   {
//     "id": 15,
//     "namaKomoditi": "Brokoli / Kubis bunga",
//     "img": "assets/images/komoditi/kubisbunga.png",
//     "satuan": "Kg/Ha",
//     "variabels": {
//       "Const_Ph": ["Phonska Plus", 800.0],
//     },
//     "fieldValue": [],
//     "takaran": {
//       "dasar": {
//         "phonska": "Const_Ph / 3.2 + Const_Ph/16",
//       },
//       "HST15": {
//         "phonska": "Const_Ph / 3.2",
//       },
//       "HST30": {
//         "phonska": "Const_Ph / 3.2",
//       }
//     },
//     "hasil": {
//       "dasar": {"phonska": 0.0},
//       "HST15": {"phonska": 0.0},
//       "HST30": {"phonska": 0.0},
//     },
//     "penjelas": {"": ""},
//     "category": 0
//   },
//   {
//     "id": 16,
//     "namaKomoditi": "Semangka / Melon",
//     "img": "assets/images/komoditi/semangka.png",
//     "satuan": "gr/Pohon",
//     "variabels": {
//       "Const_Ph": ["Phonska Plus", 1200.0],
//       "Const_Kcl": ["KCL", 200.0],
//     },
//     "fieldValue": [],
//     "takaran": {
//       "dasar": {
//         "phonska": "Const_Ph/3",
//         "kcl": "Const_Kcl/2",
//       },
//       "1-8 MST": {
//         "phonska": "Const_Ph / 1.5",
//         "kcl": "Const_Kcl/2",
//       },
//     },
//     "hasil": {
//       "dasar": {"phonska": 0.0, "kcl": 0.0},
//       "1-8 MST": {"phonska": 0.0, "kcl": 0.0},
//     },
//     "penjelas": {
//       "Sistem kocoran":
//           "100-180 Gr/10 ltr untuk 10 tanaman setiap 3 hari sekali"
//     },
//     "category": 0
//   },
//   {
//     "id": 17,
//     "namaKomoditi": "Jeruk *)",
//     "img": "assets/images/komoditi/jeruk.png",
//     "satuan": "gr/Pohon",
//     "variabels": {
//       "Const_Ph": ["Phonska Plus", 1600.0],
//     },
//     "fieldValue": [],
//     "takaran": {
//       "Awal Musim Hujan": {
//         "phonska": "Const_Ph/2",
//       },
//       "Akhir Musim Hujan": {
//         "phonska": "Const_Ph/2",
//       },
//     },
//     "hasil": {
//       "Awal Musim Hujan": {"phonska": 0.0},
//       "Akhir Musim Hujan": {"phonska": 0.0},
//     },
//     "penjelas": {
//       "*)":
//           "Gram/pohon, pupuk diberikan dengan cara dibenamkan dalam alur mengelilingi batang tanaman "
//     },
//     "category": 0
//   },
//   {
//     "id": 18,
//     "namaKomoditi": "Apel *)",
//     "img": "assets/images/komoditi/apel.png",
//     "satuan": "gr/pohon",
//     "variabels": {
//       "Const_Ph": ["Phonska Plus", 1600.0],
//     },
//     "fieldValue": [],
//     "takaran": {
//       "Setelah Rompes": {
//         "phonska": "Const_Ph/2",
//       },
//       "Saat Pembesaran Buah": {
//         "phonska": "Const_Ph/2",
//       },
//     },
//     "hasil": {
//       "Setelah Rompes": {"phonska": 0.0},
//       "Saat Pembesaran Buah": {"phonska": 0.0},
//     },
//     "penjelas": {
//       "*)":
//           "Gram/pohon, pupuk diberikan dengan cara dibenamkan dalam alur mengelilingi batang tanaman "
//     },
//     "category": 0
//   },
//   {
//     "id": 19,
//     "namaKomoditi": "Anggur *)",
//     "img": "assets/images/komoditi/anggur.png",
//     "satuan": "gr/pohon",
//     "variabels": {
//       "Const_Ph": ["Phonska Plus", 1800.0],
//     },
//     "fieldValue": [],
//     "takaran": {
//       "Setelah Rompes": {
//         "phonska": "Const_Ph/2",
//       },
//       "Saat Pembesaran Buah": {
//         "phonska": "Const_Ph/2",
//       },
//     },
//     "hasil": {
//       "Setelah Rompes": {"phonska": 0.0},
//       "Saat Pembesaran Buah": {"phonska": 0.0},
//     },
//     "penjelas": {
//       "*)":
//           "Gram/pohon, pupuk diberikan dengan cara dibenamkan dalam alur mengelilingi batang tanaman "
//     },
//     "category": 0
//   },
//   {
//     "id": 20,
//     "namaKomoditi": "Kopi *)",
//     "img": "assets/images/komoditi/kopi.png",
//     "satuan": "gr/pohon",
//     "variabels": {
//       "Const_Ph": ["Phonska Plus", 1100.0],
//       "Const_Kies": ["Kieserit", 150.0]
//     },
//     "fieldValue": [],
//     "takaran": {
//       "Awal Musim Hujan": {
//         "phonska": "Const_Ph/2",
//         "kieserit": "Const_Kies / 2"
//       },
//       "Akhir Musim Hujan": {
//         "phonska": "Const_Ph/2",
//         "kieserit": "Const_Kies / 2"
//       },
//     },
//     "hasil": {
//       "Awal Musim Hujan": {
//         "phonska": 0.0,
//         "kieserit": 0.0,
//       },
//       "Akhir Musim Hujan": {
//         "phonska": 0.0,
//         "kieserit": 0.0,
//       },
//     },
//     "penjelas": {
//       "*)":
//           "Gram/pohon, pupuk diberikan dengan cara dibenamkan dalam alur mengelilingi batang tanaman "
//     },
//     "category": 0
//   },
//   {
//     "id": 21,
//     "namaKomoditi": "Kakao",
//     "img": "assets/images/komoditi/kakao.png",
//     "satuan": "gr/pohon",
//     "variabels": {
//       "Const_Ph": ["Phonska Plus", 1000.0],
//       "Const_Kies": ["Kieserit", 150.0]
//     },
//     "fieldValue": [],
//     "takaran": {
//       "Awal Musim Hujan": {
//         "phonska": "Const_Ph/2",
//         "kieserit": "Const_Kies / 2"
//       },
//       "Akhir Musim Hujan": {
//         "phonska": "Const_Ph/2",
//         "kieserit": "Const_Kies / 2"
//       },
//     },
//     "hasil": {
//       "Awal Musim Hujan": {
//         "phonska": 0.0,
//         "kieserit": 0.0,
//       },
//       "Akhir Musim Hujan": {
//         "phonska": 0.0,
//         "kieserit": 0.0,
//       },
//     },
//     "penjelas": {
//       "*)":
//           "Gram/pohon, pupuk diberikan dengan cara dibenamkan dalam alur mengelilingi batang tanaman "
//     },
//     "category": 0
//   },
//   {
//     "id": 22,
//     "namaKomoditi": "Kelapa Sawit",
//     "img": "assets/images/komoditi/kelapasawit.png",
//     "satuan": "gr/pohon",
//     "variabels": {
//       "Const_Ph": ["Phonska Plus", 5500.0],
//       "Const_Kcl": ["KCL", 1000.0],
//       "Const_Kies": ["Kieserit", 1000.0]
//     },
//     "fieldValue": [],
//     "takaran": {
//       "Awal Musim Hujan": {
//         "phonska": "Const_Ph/2",
//         "kcl": "Const_Kcl/2",
//         "kieserit": "Const_Kies / 2"
//       },
//       "Akhir Musim Hujan": {
//         "phonska": "Const_Ph/2",
//         "kcl": "Const_Kcl/2",
//         "kieserit": "Const_Kies / 2"
//       },
//     },
//     "hasil": {
//       "Awal Musim Hujan": {
//         "phonska": 0.0,
//         "kcl": 0.0,
//         "kieserit": 0.0,
//       },
//       "Akhir Musim Hujan": {
//         "phonska": 0.0,
//         "kcl": 0.0,
//         "kieserit": 0.0,
//       },
//     },
//     "penjelas": {
//       "*)":
//           "Gram/pohon, pupuk diberikan dengan cara dibenamkan dalam alur mengelilingi batang tanaman "
//     },
//     "category": 0
//   },
//   {
//     "id": 23,
//     "namaKomoditi": "Lada",
//     "img": "assets/images/pot/balok.png",
//     "satuan": "gr/pohon",
//     "variabels": {
//       "Const_Ph": ["Phonska Plus", 3160.0],
//       "Const_Kcl": ["KCL", 300.0],
//       "Const_Kies": ["Kieserit", 275.0]
//     },
//     "fieldValue": [],
//     "takaran": {
//       "Awal Musim Hujan": {"phonska": "1500", "kcl": "120", "kieserit": "100"},
//       "Susulan I": {"phonska": "850", "kcl": "90", "kieserit": "85"},
//       "Susulan II": {"phonska": "540", "kcl": "60", "kieserit": "60"},
//       "Susulan III": {"phonska": "270", "kcl": "30", "kieserit": "30"},
//     },
//     "hasil": {
//       "Awal Musim Hujan": {"phonska": 0.0, "kcl": 0.0, "kieserit": 0.0},
//       "Susulan I": {"phonska": 0.0, "kcl": 0.0, "kieserit": 0.0},
//       "Susulan II": {"phonska": 0.0, "kcl": 0.0, "kieserit": 0.0},
//       "Susulan III": {"phonska": 0.0, "kcl": 0.0, "kieserit": 0.0},
//     },
//     "penjelas": {
//       "*)":
//           "Gram/pohon, pupuk diberikan dengan cara dibenamkan dalam alur mengelilingi batang tanaman ",
//       "Catatan": "Catatan : interval pemupukan 40-45 hari"
//     },
//     "category": 0
//   },
//   // {
//   //   "id": 24,
//   //   "namaKomoditi": "Cengkeh",
//   //   "img": "assets/images/pot/balok.png",
//   //   "satuan": "gr/Pohon",
//   //   "variabels": {
//   //     "Const_Ur": ["Urea", 2000.0],
//   //     "Const_ZA": ["ZA", 4500.0],
//   //     "Const_Sp": ["Sp-36", 2000.0],
//   //     "Const_KCL": ["KCL", 1250.0],
//   //   },
//   //   "fieldValue": [],
//   //   "takaran": {
//   //     "Awal Musim Hujan": {
//   //       "urea": "Const_Ur/2",
//   //       "za": "Const_ZA / 2",
//   //       "sp36": "Const_Sp / 2",
//   //       "kcl": "Const_KCL / 2",
//   //     },
//   //     "Akhir Musim Hujan": {
//   //       "urea": "Const_Ur/2",
//   //       "za": "Const_ZA / 2",
//   //       "sp36": "Const_Sp / 2",
//   //       "kcl": "Const_KCL / 2",
//   //     },
//   //   },
//   //   "hasil": {
//   //     "Awal Musim Hujan": {"urea": 0.0, "za": 0.0, "sp36": 0.0, "kcl": 0.0},
//   //     "Akhir Musim Hujan": {"urea": 0.0, "za": 0.0, "sp36": 0.0, "kcl": 0.0},
//   //   },
//   //   "penjelas": {
//   //     "*)":
//   //         "Gram/pohon, pupuk diberikan dengan cara dibenamkan dalam alur mengelilingi batang tanaman ",
//   //   }
//   // },
// ];

// List<DosisPupuk> listDPM = [
//   for (var i = 0; i < dataDPM.length; i++)
//     DosisPupuk(
//         id: i,
//         namaKomoditi: dataDPM[i]["namaKomoditi"],
//         img: dataDPM[i]["img"],
//         satuan: dataDPM[i]["satuan"],
//         variabels: dataDPM[i]["variabels"],
//         fieldValue: dataDPM[i]["fieldValue"],
//         takaran: dataDPM[i]["takaran"],
//         hasil: dataDPM[i]["hasil"],
//         penjelas: dataDPM[i]["penjelas"],
//         category: dataDPM[i]["category"])
// ];

// List<Map<String, dynamic>> dataDPT = [
//   {
//     "id": 0,
//     "namaKomoditi": "Padi Sawah",
//     "img": "assets/images/komoditi/padi.png",
//     "satuan": "Kg/Ha",
//     "variabels": {
//       "Const_Ur": ["Urea", 300.0],
//       "Const_Sp": ["Sp-36", 125.0],
//       "Const_KCL": ["KCL", 75.0]
//     },
//     "fieldValue": [],
//     "takaran": {
//       "dasar": {
//         "urea": "Const_Ur / 3",
//         "sp36": "Const_Sp / 1",
//         "kcl": "Const_KCL / 1"
//       },
//       "HST20": {"urea": "Const_Ur / 3"},
//       "HST35": {"urea": "Const_Ur / 3"},
//     },
//     "hasil": {
//       "dasar": {"urea": 100.0, "sp36": 125.0, "kcl": 75.0},
//       "HST20": {"urea": 100.0},
//       "HST35": {"urea": 100.0},
//     },
//     "penjelas": {
//       "**)": "Tanah Kahat Belerang 50kg Urea diganti dengan 100kg ZA"
//     },
//     "category": 0
//   },
//   {
//     "id": 1,
//     "namaKomoditi": "Jagung",
//     "img": "assets/images/komoditi/jagung.png",
//     "satuan": "Kg/Ha",
//     "variabels": {
//       "Const_Ur": ["Urea", 400.0],
//       "Const_Sp": ["Sp-36", 150.0],
//       "Const_KCL": ["KCL", 75.0]
//     },
//     "fieldValue": [],
//     "takaran": {
//       "dasar": {
//         "urea": "Const_Ur / 3.2",
//         "sp36": "Const_Sp / 1",
//         "kcl": "Const_KCL / 1",
//       },
//       "HST20": {"urea": "Const_Ur / 3.2"},
//       "HST35": {"urea": "Const_Ur - ((Const_Ur / 3.2) + (Const_Ur / 3.2))"},
//     },
//     "hasil": {
//       "dasar": {"urea": 0.0, "sp36": 0.0, "kcl": 0.0},
//       "HST20": {"urea": 0.0},
//       "HST35": {"urea": 0.0},
//     },
//     "penjelas": {"": ""},
//     "category": 0
//   },
//   {
//     "id": 2,
//     "namaKomoditi": "Kedelai",
//     "img": "assets/images/komoditi/kedelai.png",
//     "satuan": "Kg/Ha",
//     "variabels": {
//       "Const_Ur": ["Urea", 75.0],
//       "Const_Sp": ["Sp-36", 100.0],
//       "Const_KCL": ["KCL", 50.0]
//     },
//     "fieldValue": [],
//     "takaran": {
//       "dasar": {
//         "urea": "Const_Ur - (Const_Ur / 2)",
//         "sp36": "Const_Sp / 1",
//         "kcl": "Const_KCL / 1",
//       },
//       "HST30": {"urea": "Const_Ur / 2"},
//     },
//     "hasil": {
//       "dasar": {"urea": 0.0, "sp36": 0.0, "kcl": 0.0},
//       "HST30": {"urea": 0.0},
//     },
//     "penjelas": {"": ""},
//     "category": 0
//   },
//   {
//     "id": 3,
//     "namaKomoditi": "Ubi Kayu",
//     "img": "assets/images/komoditi/ubikayu.png",
//     "satuan": "Kg/Ha",
//     "variabels": {
//       "Const_Ur": ["Urea", 250.0],
//       "Const_Sp": ["Sp-36", 100.0],
//       "Const_KCL": ["KCL", 75.0]
//     },
//     "fieldValue": [],
//     "takaran": {
//       "dasar": {
//         "urea": "Const_Ur / 3.333",
//         "sp36": "Const_Sp / 1",
//         "kcl": "Const_KCL / 3",
//       },
//       "HST60": {
//         "urea": "Const_Ur - (Const_Ur / 3.333) ",
//         "kcl": "Const_KCL - (Const_KCL / 3)",
//       },
//     },
//     "hasil": {
//       "dasar": {"urea": 0.0, "sp36": 0.0, "kcl": 0.0},
//       "HST60": {"urea": 0.0, "kcl": 0.0},
//     },
//     "penjelas": {"": ""},
//     "category": 0
//   },
//   {
//     "id": 4,
//     "namaKomoditi": "Ubi Jalar",
//     "img": "assets/images/komoditi/ubijalar.png",
//     "satuan": "Kg/Ha",
//     "variabels": {
//       "Const_Ur": ["Urea", 200.0],
//       "Const_Sp": ["Sp-36", 100.0],
//       "Const_KCL": ["KCL", 75.0]
//     },
//     "fieldValue": [],
//     "takaran": {
//       "dasar": {
//         "urea": "Const_Ur / 4",
//         "sp36": "Const_Sp / 1",
//         "kcl": "Const_KCL / 3",
//       },
//       "HST30": {
//         "urea": "Const_Ur - (Const_Ur / 4) ",
//         "kcl": "Const_KCL - (Const_KCL / 3)",
//       },
//     },
//     "hasil": {
//       "dasar": {"urea": 0.0, "sp36": 0.0, "kcl": 0.0},
//       "HST30": {"urea": 0.0, "kcl": 0.0},
//     },
//     "penjelas": {"": ""},
//     "category": 0
//   },
//   {
//     "id": 5,
//     "namaKomoditi": "Bawang Merah",
//     "img": "assets/images/komoditi/bawang.png",
//     "satuan": "Kg/Ha",
//     "variabels": {
//       "Const_Ur": ["Urea", 200.0],
//       "Const_ZA": ["ZA", 500.0],
//       "Const_Sp": ["Sp-36", 300.0],
//       "Const_KCL": ["KCL", 200.0]
//     },
//     "fieldValue": [],
//     "takaran": {
//       "dasar": {
//         "urea": "Const_Ur",
//         "sp36": "Const_Sp",
//         "kcl": "Const_KCL - (Const_KCL / 4)",
//       },
//       "HST30": {
//         "za": "Const_ZA ",
//         "kcl": "Const_KCL / 4",
//       },
//     },
//     "hasil": {
//       "dasar": {"urea": 0.0, "sp36": 0.0, "kcl": 0.0},
//       "HST30": {"za": 0.0, "kcl": 0.0},
//     },
//     "penjelas": {"": ""},
//     "category": 0
//   },
//   {
//     "id": 6,
//     "namaKomoditi": "Kentang",
//     "img": "assets/images/komoditi/kentang.png",
//     "satuan": "Kg/Ha",
//     "variabels": {
//       "Const_ZA": ["ZA", 900.0],
//       "Const_Sp": ["Sp-36", 400.0],
//       "Const_KCL": ["KCL", 250.0]
//     },
//     "fieldValue": [],
//     "takaran": {
//       "dasar": {
//         "za": "Const_ZA / 2",
//         "sp36": "Const_Sp",
//         "kcl": "Const_KCL",
//       },
//       "HST30": {
//         "za": "Const_ZA / 2",
//       },
//     },
//     "hasil": {
//       "dasar": {"za": 0.0, "sp36": 0.0, "kcl": 0.0},
//       "HST30": {"za": 0.0},
//     },
//     "penjelas": {"": ""},
//     "category": 0
//   },
//   {
//     "id": 7,
//     "namaKomoditi": "Kubis",
//     "img": "assets/images/komoditi/kubis.png",
//     "satuan": "Kg/Ha",
//     "variabels": {
//       "Const_Ur": ["Urea", 100.0],
//       "Const_ZA": ["ZA", 350.0],
//       "Const_Sp": ["Sp-36", 150.0],
//       "Const_KCL": ["KCL", 100.0]
//     },
//     "fieldValue": [],
//     "takaran": {
//       "dasar": {
//         "urea": "Const_Ur - (Const_Ur / 4)",
//         "sp36": "Const_Sp",
//         "kcl": "Const_KCL",
//       },
//       "HST15": {
//         "urea": "Const_Ur / 4",
//         "za": "Const_ZA - (Const_ZA / 1.75)",
//       },
//       "HST30": {
//         "za": "Const_ZA / 1.75",
//       },
//     },
//     "hasil": {
//       "dasar": {"urea": 0.0, "sp36": 0.0, "kcl": 0.0},
//       "HST15": {"urea": 0.0, "za": 0.0},
//       "HST30": {"za": 0.0},
//     },
//     "penjelas": {"": ""},
//     "category": 0
//   },
//   {
//     "id": 8,
//     "namaKomoditi": "Tomat",
//     "img": "assets/images/komoditi/tomat.png",
//     "satuan": "Kg/Ha",
//     "variabels": {
//       "Const_Ur": ["Urea", 150.0],
//       "Const_ZA": ["ZA", 400.0],
//       "Const_Sp": ["Sp-36", 300.0],
//       "Const_KCL": ["KCL", 200.0]
//     },
//     "fieldValue": [],
//     "takaran": {
//       "dasar": {
//         "urea": "Const_Ur - (Const_Ur / 3)",
//         "sp36": "Const_Sp",
//         "kcl": "Const_KCL",
//       },
//       "HST15": {
//         "urea": "Const_Ur / 3",
//         "za": "Const_ZA - (Const_ZA / 1.6)",
//       },
//       "HST30": {
//         "za": "Const_ZA / 1.6",
//       },
//     },
//     "hasil": {
//       "dasar": {"urea": 0.0, "sp36": 0.0, "kcl": 0.0},
//       "HST15": {"urea": 0.0, "za": 0.0},
//       "HST30": {"za": 0.0},
//     },
//     "penjelas": {"": ""},
//     "category": 0
//   },
//   {
//     "id": 9,
//     "namaKomoditi": "Wortel",
//     "img": "assets/images/komoditi/wortel.png",
//     "satuan": "Kg/Ha",
//     "variabels": {
//       "Const_ZA": ["ZA", 600.0],
//       "Const_Sp": ["Sp-36", 150.0],
//       "Const_KCL": ["KCL", 100.0]
//     },
//     "fieldValue": [],
//     "takaran": {
//       "dasar": {
//         "za": "Const_ZA - (Const_ZA / 2.4)",
//         "sp36": "Const_Sp",
//         "kcl": "Const_KCL / 2",
//       },
//       "HST15": {
//         "kcl": "Const_KCL / 2",
//         "za": "Const_ZA / 2.4",
//       },
//       "HST30": {
//         "za": "Const_ZA / 2.4",
//       },
//     },
//     "hasil": {
//       "dasar": {"za": 0.0, "sp36": 0.0, "kcl": 0.0},
//       "HST15": {"kcl": 0.0, "za": 0.0},
//       "HST30": {"za": 0.0},
//     },
//     "penjelas": {"": ""},
//     "category": 0
//   },
//   {
//     "id": 10,
//     "namaKomoditi": "Buncis / Kacang Panjang",
//     "img": "assets/images/pot/balok.png",
//     "satuan": "Kg/Ha",
//     "variabels": {
//       "Const_ZA": ["ZA", 300.0],
//       "Const_Sp": ["Sp-36", 200.0],
//       "Const_KCL": ["KCL", 100.0]
//     },
//     "fieldValue": [],
//     "takaran": {
//       "dasar": {
//         "za": "Const_ZA - (Const_ZA / 3)",
//         "sp36": "Const_Sp",
//         "kcl": "Const_KCL",
//       },
//       "HST15": {
//         "za": "Const_ZA / 3",
//       },
//       "HST30": {
//         "za": "Const_ZA / 3",
//       },
//     },
//     "hasil": {
//       "dasar": {"za": 0.0, "sp36": 0.0, "kcl": 0.0},
//       "HST15": {"za": 0.0},
//       "HST30": {"za": 0.0},
//     },
//     "penjelas": {"": ""},
//     "category": 0
//   },
//   {
//     "id": 11,
//     "namaKomoditi": "Bawang Putih",
//     "img": "assets/images/komoditi/bawangputih.png",
//     "satuan": "Kg/Ha",
//     "variabels": {
//       "Const_ZA": ["ZA", 1000.0],
//       "Const_Sp": ["Sp-36", 300.0],
//       "Const_KCL": ["KCL", 200.0]
//     },
//     "fieldValue": [],
//     "takaran": {
//       "dasar": {
//         "za": "Const_ZA / 3.333333",
//         "sp36": "Const_Sp",
//         "kcl": "Const_KCL",
//       },
//       "HST20": {
//         "za": "Const_ZA - (Const_ZA / 3.333333)",
//       },
//       "HST40": {
//         "za": "Const_ZA - (Const_ZA / 3.33333333)",
//       },
//     },
//     "hasil": {
//       "dasar": {"za": 0.0, "sp36": 0.0, "kcl": 0.0},
//       "HST20": {"za": 0.0},
//       "HST40": {"za": 0.0},
//     },
//     "penjelas": {"": ""},
//     "category": 0
//   },
//   {
//     "id": 12,
//     "namaKomoditi": "Lombok",
//     "img": "assets/images/komoditi/lombok.png",
//     "satuan": "Kg/Ha",
//     "variabels": {
//       "Const_ZA": ["ZA", 800.0],
//       "Const_Sp": ["Sp-36", 300.0],
//       "Const_KCL": ["KCL", 200.0]
//     },
//     "fieldValue": [],
//     "takaran": {
//       "dasar": {
//         "za": "Const_ZA / 4",
//         "sp36": "Const_Sp",
//         "kcl": "Const_KCL",
//       },
//       "HST20": {
//         "za": "Const_ZA - (Const_ZA / 4)",
//       },
//       "HST40": {
//         "za": "Const_ZA - (Const_ZA / 4)",
//       },
//     },
//     "hasil": {
//       "dasar": {"za": 0.0, "sp36": 0.0, "kcl": 0.0},
//       "HST20": {"za": 0.0},
//       "HST40": {"za": 0.0},
//     },
//     "penjelas": {"": ""},
//     "category": 0
//   },
//   {
//     "id": 13,
//     "namaKomoditi": "Mentimun",
//     "img": "assets/images/komoditi/mentimun.png",
//     "satuan": "Kg/Ha",
//     "variabels": {
//       "Const_ZA": ["ZA", 300.0],
//       "Const_Sp": ["Sp-36", 150.0],
//       "Const_KCL": ["KCL", 100.0]
//     },
//     "fieldValue": [],
//     "takaran": {
//       "dasar": {
//         "za": "Const_ZA / 3",
//         "sp36": "Const_Sp",
//         "kcl": "Const_KCL",
//       },
//       "HST20": {
//         "za": "Const_ZA / 3",
//       },
//       "HST40": {
//         "za": "Const_ZA / 3",
//       },
//     },
//     "hasil": {
//       "dasar": {"za": 0.0, "sp36": 0.0, "kcl": 0.0},
//       "HST20": {"za": 0.0},
//       "HST40": {"za": 0.0},
//     },
//     "penjelas": {"": ""},
//     "category": 0
//   },
//   {
//     "id": 14,
//     "namaKomoditi": "Terong",
//     "img": "assets/images/komoditi/terong.png",
//     "satuan": "Kg/Ha",
//     "variabels": {
//       "Const_Ur": ["Urea", 150.0],
//       "Const_ZA": ["ZA", 300.0],
//       "Const_Sp": ["Sp-36", 300.0],
//       "Const_KCL": ["KCL", 175.0]
//     },
//     "fieldValue": [],
//     "takaran": {
//       "dasar": {
//         "urea": "Const_Ur - (Const_Ur / 3)",
//         "sp36": "Const_Sp",
//         "kcl": "Const_KCL",
//       },
//       "HST15": {
//         "urea": "Const_Ur / 3",
//         "za": "Const_ZA / 3",
//       },
//       "HST30": {
//         "za": "Const_ZA - (Const_ZA / 3)",
//       },
//     },
//     "hasil": {
//       "dasar": {"urea": 0.0, "sp36": 0.0, "kcl": 0.0},
//       "HST15": {"urea": 0.0, "za": 0.0},
//       "HST30": {"za": 0.0},
//     },
//     "penjelas": {"": ""},
//     "category": 0
//   },
//   {
//     "id": 15,
//     "namaKomoditi": "Brokoli / Kubis bunga",
//     "img": "assets/images/komoditi/kubisbunga.png",
//     "satuan": "Kg/Ha",
//     "variabels": {
//       "Const_Ur": ["Urea", 100.0],
//       "Const_ZA": ["ZA", 350.0],
//       "Const_Sp": ["Sp-36", 350.0],
//       "Const_KCL": ["KCL", 200.0]
//     },
//     "fieldValue": [],
//     "takaran": {
//       "dasar": {
//         "urea": "Const_Ur",
//         "sp36": "Const_Sp",
//         "kcl": "Const_KCL",
//       },
//       "HST15": {
//         "za": "Const_ZA / 2",
//       },
//       "HST30": {
//         "za": "Const_ZA / 2",
//       },
//     },
//     "hasil": {
//       "dasar": {"urea": 0.0, "sp36": 0.0, "kcl": 0.0},
//       "HST15": {"za": 0.0},
//       "HST30": {"za": 0.0},
//     },
//     "penjelas": {"": ""},
//     "category": 0
//   },
//   {
//     "id": 16,
//     "namaKomoditi": "Semangka / Melon",
//     "img": "assets/images/komoditi/semangka.png",
//     "satuan": "gr/Pohon",
//     "variabels": {
//       "Const_ZA": ["ZA", 850.0],
//       "Const_Sp": ["Sp-36", 500.0],
//       "Const_KCL": ["KCL", 500.0]
//     },
//     "fieldValue": [],
//     "takaran": {
//       "dasar": {
//         "za": "Const_ZA / 2.8333333333",
//         "sp36": "Const_Sp",
//         "kcl": "Const_KCL / 2.5",
//       },
//       "MST8": {
//         "kcl": "Const_KCL - (Const_KCL / 2.5)",
//         "za": "Const_ZA - (Const_ZA / 2.8333333333)",
//       },
//     },
//     "hasil": {
//       "dasar": {"za": 0.0, "sp36": 0.0, "kcl": 0.0},
//       "MST8": {"kcl": 0.0, "za": 0.0},
//     },
//     "penjelas": {"": ""},
//     "category": 0
//   },
//   {
//     "id": 17,
//     "namaKomoditi": "Jeruk",
//     "img": "assets/images/komoditi/jeruk.png",
//     "satuan": "gr/Pohon",
//     "variabels": {
//       "Const_Ur": ["Urea", 250.0],
//       "Const_ZA": ["ZA", 600.0],
//       "Const_Sp": ["Sp-36", 650.0],
//       "Const_KCL": ["KCL", 400.0]
//     },
//     "fieldValue": [],
//     "takaran": {
//       "Awal Musim Hujan": {
//         "urea": "Const_Ur/2",
//         "za": "Const_ZA / 2",
//         "sp36": "Const_Sp / 2",
//         "kcl": "Const_KCL / 2",
//       },
//       "Akhir Musim Hujan": {
//         "urea": "Const_Ur/2",
//         "za": "Const_ZA / 2",
//         "sp36": "Const_Sp / 2",
//         "kcl": "Const_KCL / 2",
//       },
//     },
//     "hasil": {
//       "Awal Musim Hujan": {"urea": 0.0, "za": 0.0, "sp36": 0.0, "kcl": 0.0},
//       "Akhir Musim Hujan": {"urea": 0.0, "za": 0.0, "sp36": 0.0, "kcl": 0.0},
//     },
//     "penjelas": {
//       "*)":
//           "Gram/pohon, pupuk diberikan dengan cara dibenamkan dalam alur mengelilingi batang tanaman "
//     },
//     "category": 0
//   },
//   {
//     "id": 18,
//     "namaKomoditi": "Apel",
//     "img": "assets/images/komoditi/apel.png",
//     "satuan": "gr/Pohon",
//     "variabels": {
//       "Const_Ur": ["Urea", 250.0],
//       "Const_ZA": ["ZA", 600.0],
//       "Const_Sp": ["Sp-36", 650.0],
//       "Const_KCL": ["KCL", 400.0]
//     },
//     "fieldValue": [],
//     "takaran": {
//       "Setelah Rompes": {
//         "urea": "Const_Ur/2",
//         "za": "Const_ZA / 2",
//         "sp36": "Const_Sp / 2",
//         "kcl": "Const_KCL / 2",
//       },
//       "Saat Pembesaran Buah": {
//         "urea": "Const_Ur/2",
//         "za": "Const_ZA / 2",
//         "sp36": "Const_Sp / 2",
//         "kcl": "Const_KCL / 2",
//       },
//     },
//     "hasil": {
//       "Setelah Rompes": {"urea": 0.0, "za": 0.0, "sp36": 0.0, "kcl": 0.0},
//       "Saat Pembesaran Buah": {"urea": 0.0, "za": 0.0, "sp36": 0.0, "kcl": 0.0},
//     },
//     "penjelas": {
//       "*)":
//           "Gram/pohon, pupuk diberikan dengan cara dibenamkan dalam alur mengelilingi batang tanaman "
//     },
//     "category": 0
//   },
//   {
//     "id": 19,
//     "namaKomoditi": "Anggur",
//     "img": "assets/images/komoditi/anggur.png",
//     "satuan": "gr/Pohon",
//     "variabels": {
//       "Const_Ur": ["Urea", 300.0],
//       "Const_ZA": ["ZA", 650.0],
//       "Const_Sp": ["Sp-36", 750.0],
//       "Const_KCL": ["KCL", 450.0]
//     },
//     "fieldValue": [],
//     "takaran": {
//       "Setelah Rompes": {
//         "urea": "Const_Ur/2",
//         "za": "Const_ZA / 2",
//         "sp36": "Const_Sp / 2",
//         "kcl": "Const_KCL / 2",
//       },
//       "Saat Pembesaran Buah": {
//         "urea": "Const_Ur/2",
//         "za": "Const_ZA / 2",
//         "sp36": "Const_Sp / 2",
//         "kcl": "Const_KCL / 2",
//       },
//     },
//     "hasil": {
//       "Setelah Rompes": {"urea": 0.0, "za": 0.0, "sp36": 0.0, "kcl": 0.0},
//       "Saat Pembesaran Buah": {"urea": 0.0, "za": 0.0, "sp36": 0.0, "kcl": 0.0},
//     },
//     "penjelas": {
//       "*)":
//           "Gram/pohon, pupuk diberikan dengan cara dibenamkan dalam alur mengelilingi batang tanaman "
//     },
//     "category": 0
//   },
//   {
//     "id": 20,
//     "namaKomoditi": "Kopi",
//     "img": "assets/images/komoditi/kopi.png",
//     "satuan": "gr/Pohon",
//     "variabels": {
//       "Const_Ur": ["Urea", 200.0],
//       "Const_ZA": ["ZA", 400.0],
//       "Const_Sp": ["Sp-36", 450.0],
//       "Const_KCL": ["KCL", 275.0],
//       "Const_Kies": ["Kieserit", 175.0]
//     },
//     "fieldValue": [],
//     "takaran": {
//       "Awal Musim Hujan": {
//         "urea": "Const_Ur/2",
//         "za": "Const_ZA / 2",
//         "sp36": "Const_Sp / 2",
//         "kcl": "Const_KCL / 2.2",
//         "kieserit": "Const_Kies / 1.9444"
//       },
//       "Akhir Musim Hujan": {
//         "urea": "Const_Ur/2",
//         "za": "Const_ZA / 2",
//         "sp36": "Const_Sp / 2",
//         "kcl": "Const_KCL / 2.2",
//         "kieserit": "Const_Kies - (Const_Kies / 1.9444)"
//       },
//     },
//     "hasil": {
//       "Awal Musim Hujan": {
//         "urea": 0.0,
//         "za": 0.0,
//         "sp36": 0.0,
//         "kcl": 0.0,
//         "kieserit": 0.0
//       },
//       "Akhir Musim Hujan": {
//         "urea": 0.0,
//         "za": 0.0,
//         "sp36": 0.0,
//         "kcl": 0.0,
//         "kieserit": 0.0
//       },
//     },
//     "penjelas": {
//       "*)":
//           "Gram/pohon, pupuk diberikan dengan cara dibenamkan dalam alur mengelilingi batang tanaman "
//     },
//     "category": 0
//   },
//   {
//     "id": 21,
//     "namaKomoditi": "Kakao",
//     "img": "assets/images/komoditi/kakao.png",
//     "satuan": "gr/Pohon",
//     "variabels": {
//       "Const_Ur": ["Urea", 150.0],
//       "Const_ZA": ["ZA", 350.0],
//       "Const_Sp": ["Sp-36", 400.0],
//       "Const_KCL": ["KCL", 250.0],
//       "Const_Kies": ["Kieserit", 150.0]
//     },
//     "fieldValue": [],
//     "takaran": {
//       "Awal Musim Hujan": {
//         "urea": "Const_Ur/2",
//         "za": "Const_ZA / 2",
//         "sp36": "Const_Sp / 2",
//         "kcl": "Const_KCL / 2",
//         "kieserit": "Const_Kies / 2"
//       },
//       "Akhir Musim Hujan": {
//         "urea": "Const_Ur/2",
//         "za": "Const_ZA / 2",
//         "sp36": "Const_Sp / 2",
//         "kcl": "Const_KCL / 2",
//         "kieserit": "Const_Kies / 2"
//       },
//     },
//     "hasil": {
//       "Awal Musim Hujan": {
//         "urea": 0.0,
//         "za": 0.0,
//         "sp36": 0.0,
//         "kcl": 0.0,
//         "kieserit": 0.0
//       },
//       "Akhir Musim Hujan": {
//         "urea": 0.0,
//         "za": 0.0,
//         "sp36": 0.0,
//         "kcl": 0.0,
//         "kieserit": 0.0
//       },
//     },
//     "penjelas": {
//       "*)":
//           "Gram/pohon, pupuk diberikan dengan cara dibenamkan dalam alur mengelilingi batang tanaman "
//     },
//     "category": 0
//   },
//   {
//     "id": 22,
//     "namaKomoditi": "Kelapa Sawit",
//     "img": "assets/images/komoditi/kelapasawit.png",
//     "satuan": "gr/Pohon",
//     "variabels": {
//       "Const_Ur": ["Urea", 900.0],
//       "Const_ZA": ["ZA", 2000.0],
//       "Const_Sp": ["Sp-36", 2300.0],
//       "Const_KCL": ["KCL", 2400.0],
//       "Const_Kies": ["Kieserit", 1000.0]
//     },
//     "fieldValue": [],
//     "takaran": {
//       "Awal Musim Hujan": {
//         "urea": "Const_Ur/2",
//         "za": "Const_ZA / 2",
//         "sp36": "Const_Sp / 2",
//         "kcl": "Const_KCL / 2",
//         "kieserit": "Const_Kies / 2"
//       },
//       "Akhir Musim Hujan": {
//         "urea": "Const_Ur/2",
//         "za": "Const_ZA / 2",
//         "sp36": "Const_Sp / 2",
//         "kcl": "Const_KCL / 2",
//         "kieserit": "Const_Kies / 2"
//       },
//     },
//     "hasil": {
//       "Awal Musim Hujan": {
//         "urea": 0.0,
//         "za": 0.0,
//         "sp36": 0.0,
//         "kcl": 0.0,
//         "kieserit": 0.0
//       },
//       "Akhir Musim Hujan": {
//         "urea": 0.0,
//         "za": 0.0,
//         "sp36": 0.0,
//         "kcl": 0.0,
//         "kieserit": 0.0
//       },
//     },
//     "penjelas": {
//       "*)":
//           "Gram/pohon, pupuk diberikan dengan cara dibenamkan dalam alur mengelilingi batang tanaman "
//     },
//     "category": 0
//   },
//   {
//     "id": 23,
//     "namaKomoditi": "Lada",
//     "img": "assets/images/pot/balok.png",
//     "satuan": "gr/Pohon",
//     "variabels": {
//       "Const_Ur": ["Urea", 500.0],
//       "Const_ZA": ["ZA", 1100.0],
//       "Const_Sp": ["Sp-36", 1300.0],
//       "Const_KCL": ["KCL", 1100.0],
//       "Const_Kies": ["Kieserit", 275.0]
//     },
//     "fieldValue": [],
//     "takaran": {
//       "Awal Musim Hujan": {
//         "urea": "Const_Ur/2.5",
//         "za": "Const_ZA / 2.5",
//         "sp36": "Const_Sp / 2.5",
//         "kcl": "Const_KCL / 2.5",
//         "kieserit": "Const_Kies / 2.75"
//       },
//       "Susulan I": {
//         "urea": "Const_Ur - (Const_Ur / 2.5 + Const_Ur / 5 + Const_Ur / 10)",
//         "za": "Const_ZA - (Const_ZA / 2.5 + Const_ZA / 5 + Const_ZA / 10)",
//         "sp36": "Const_Sp - (Const_Sp / 2.5 + Const_Sp / 5 + Const_Sp / 10)",
//         "kcl": "Const_KCL - (Const_KCL / 2.5 + Const_KCL / 5 + Const_KCL / 10)",
//         "kieserit":
//             "Const_Kies - (Const_Kies / 2.75 + Const_Kies / 4.6 + Const_Kies / 9.2)"
//       },
//       "Susulan II": {
//         "urea": "Const_Ur / 5",
//         "za": "Const_ZA / 5",
//         "sp36": "Const_Sp / 5",
//         "kcl": "Const_KCL / 5",
//         "kieserit": "Const_Kies / 4.6"
//       },
//       "Susulan III": {
//         "urea": "Const_Ur / 10",
//         "za": "Const_ZA / 10",
//         "sp36": "Const_Sp / 10",
//         "kcl": "Const_KCL / 10",
//         "kieserit": "Const_Kies / 9.2"
//       },
//     },
//     "hasil": {
//       "Awal Musim Hujan": {
//         "urea": 0.0,
//         "za": 0.0,
//         "sp36": 0.0,
//         "kcl": 0.0,
//         "kieserit": 0.0
//       },
//       "Susulan I": {
//         "urea": 0.0,
//         "za": 0.0,
//         "sp36": 0.0,
//         "kcl": 0.0,
//         "kieserit": 0.0
//       },
//       "Susulan II": {
//         "urea": 0.0,
//         "za": 0.0,
//         "sp36": 0.0,
//         "kcl": 0.0,
//         "kieserit": 0.0
//       },
//       "Susulan III": {
//         "urea": 0.0,
//         "za": 0.0,
//         "sp36": 0.0,
//         "kcl": 0.0,
//         "kieserit": 0.0
//       },
//     },
//     "penjelas": {
//       "*)":
//           "Gram/pohon, pupuk diberikan dengan cara dibenamkan dalam alur mengelilingi batang tanaman ",
//       "Catatan": "Catatan : interval pemupukan 40-45 hari"
//     },
//     "category": 0
//   },
//   {
//     "id": 24,
//     "namaKomoditi": "Cengkeh",
//     "img": "assets/images/pot/balok.png",
//     "satuan": "gr/Pohon",
//     "variabels": {
//       "Const_Ur": ["Urea", 2000.0],
//       "Const_ZA": ["ZA", 4500.0],
//       "Const_Sp": ["Sp-36", 2000.0],
//       "Const_KCL": ["KCL", 1250.0],
//     },
//     "fieldValue": [],
//     "takaran": {
//       "Awal Musim Hujan": {
//         "urea": "Const_Ur/2",
//         "za": "Const_ZA / 2",
//         "sp36": "Const_Sp / 2",
//         "kcl": "Const_KCL / 2",
//       },
//       "Akhir Musim Hujan": {
//         "urea": "Const_Ur/2",
//         "za": "Const_ZA / 2",
//         "sp36": "Const_Sp / 2",
//         "kcl": "Const_KCL / 2",
//       },
//     },
//     "hasil": {
//       "Awal Musim Hujan": {"urea": 0.0, "za": 0.0, "sp36": 0.0, "kcl": 0.0},
//       "Akhir Musim Hujan": {"urea": 0.0, "za": 0.0, "sp36": 0.0, "kcl": 0.0},
//     },
//     "penjelas": {
//       "*)":
//           "Gram/pohon, pupuk diberikan dengan cara dibenamkan dalam alur mengelilingi batang tanaman ",
//     },
//     "category": 0
//   },
// ];

// List<DosisPupuk> listDPT = [
//   for (var i = 0; i < dataDPT.length; i++)
//     DosisPupuk(
//         id: i,
//         namaKomoditi: dataDPT[i]["namaKomoditi"],
//         img: dataDPT[i]["img"],
//         satuan: dataDPT[i]["satuan"],
//         variabels: dataDPT[i]["variabels"],
//         fieldValue: dataDPT[i]["fieldValue"],
//         takaran: dataDPT[i]["takaran"],
//         hasil: dataDPT[i]["hasil"],
//         penjelas: dataDPT[i]["penjelas"],
//         category: dataDPT[i]["category"])
// ];

// List<Map<String, dynamic>> dataDPB = [
//   {
//     "id": 0,
//     "namaKomoditi": "Padi Sawah",
//     "img": "assets/images/komoditi/padi.png",
//     "satuan": "Kg/Ha",
//     "variabels": {
//       "Const_Pet": ["Petroganik", 500.0],
//       "Const_Ph": ["Phonska Plus", 300.0],
//       "Const_Ur": ["Urea", 200.0]
//     },
//     "fieldValue": [],
//     "takaran": {
//       "dasar": {
//         "petroganik": "Const_Pet",
//         "phonska": "Const_Ph / 2",
//         "urea": "Const_Ur / 4",
//       },
//       "HST20": {
//         "phonska": "Const_Ph / 2",
//         "urea": "Const_Ur / 4",
//       },
//       "HST35": {"urea": "Const_Ur / 2"},
//     },
//     "hasil": {
//       "dasar": {"petroganik": 500.0, "urea": 50.0, "phonska": 150.0},
//       "HST20": {"urea": 50.0, "phonska": 150.0},
//       "HST35": {"urea": 100.0},
//     },
//     "penjelas": {
//       "**)": "Tanah Kahat Belerang 50kg Urea diganti dengan 100kg ZA"
//     },
//     "category": 0
//   },
//   {
//     "id": 1,
//     "namaKomoditi": "Jagung Hibrida",
//     "img": "assets/images/komoditi/jagung.png",
//     "satuan": "Kg/Ha",
//     "variabels": {
//       "Const_Pet": ["Petroganik", 500.0],
//       "Const_Ur": ["Urea", 300.0],
//       "Const_Ph": ["Phonska Plus", 300.0]
//     },
//     "fieldValue": [],
//     "takaran": {
//       "dasar": {
//         "petroganik": "Const_Pet",
//         "phonska": "Const_Ph / 2",
//         "urea": "Const_Ur / 4",
//       },
//       "HST20": {
//         "urea": "Const_Ur / 4",
//         "phonska": "Const_Ph / 2",
//       },
//       "HST35": {"urea": "Const_Ur / 2"},
//     },
//     "hasil": {
//       "dasar": {"petroganik": 0.0, "urea": 0.0, "phonska": 0.0},
//       "HST20": {"urea": 0.0, "phonska": 0.0},
//       "HST35": {"urea": 0.0},
//     },
//     "penjelas": {
//       "**)": "Tanah Kahat Belerang 50kg Urea diganti dengan 100kg ZA"
//     },
//     "category": 0
//   },
//   {
//     "id": 2,
//     "namaKomoditi": "Kedelai",
//     "img": "assets/images/komoditi/kedelai.png",
//     "satuan": "Kg/Ha",
//     "variabels": {
//       "Const_Pet": ["Petroganik", 500.0],
//       "Const_Ph": ["Phonska Plus", 250.0]
//     },
//     "fieldValue": [],
//     "takaran": {
//       "dasar": {
//         "petroganik": "Const_Pet",
//         "phonska": "Const_Ph / 2",
//       },
//       "HST30": {
//         "phonska": "Const_Ph / 2",
//       },
//     },
//     "hasil": {
//       "dasar": {"petroganik": 0.0, "phonska": 0.0},
//       "HST30": {"phonska": 0.0},
//     },
//     "penjelas": {"": ""},
//     "category": 0
//   },
//   {
//     "id": 3,
//     "namaKomoditi": "Ubi Kayu",
//     "img": "assets/images/komoditi/ubikayu.png",
//     "satuan": "Kg/Ha",
//     "variabels": {
//       "Const_Pet": ["Petroganik", 500.0],
//       "Const_Ur": ["Urea", 150.0],
//       "Const_Ph": ["Phonska Plus", 300.0]
//     },
//     "fieldValue": [],
//     "takaran": {
//       "dasar": {
//         "petroganik": "Const_Pet",
//         "urea": "Const_Ur / 6",
//         "phonska": "Const_Ph / 2",
//       },
//       "HST60": {
//         "urea": "Const_Ur - Const_Ur / 6",
//         "phonska": "Const_Ph / 2",
//       }
//     },
//     "hasil": {
//       "dasar": {"petroganik": 0.0, "urea": 0.0, "phonska": 0.0},
//       "HST60": {"urea": 0.0, "phonska": 0.0},
//     },
//     "penjelas": {"": ""},
//     "category": 0
//   },
//   {
//     "id": 4,
//     "namaKomoditi": "Ubi Jalar",
//     "img": "assets/images/komoditi/ubijalar.png",
//     "satuan": "Kg/Ha",
//     "variabels": {
//       "Const_Pet": ["Petroganik", 500.0],
//       "Const_Ur": ["Urea", 100.0],
//       "Const_Ph": ["Phonska Plus", 300.0]
//     },
//     "fieldValue": [],
//     "takaran": {
//       "dasar": {
//         "petroganik": "Const_Pet",
//         "urea": "Const_Ur / 4",
//         "phonska": "Const_Ph / 2",
//       },
//       "HST60": {
//         "urea": "Const_Ur - Const_Ur / 4",
//         "phonska": "Const_Ph / 2",
//       }
//     },
//     "hasil": {
//       "dasar": {"petroganik": 0.0, "urea": 0.0, "phonska": 0.0},
//       "HST60": {"urea": 0.0, "phonska": 0.0},
//     },
//     "penjelas": {"": ""},
//     "category": 0
//   },
//   {
//     "id": 5,
//     "namaKomoditi": "Bawang Merah",
//     "img": "assets/images/komoditi/bawang.png",
//     "satuan": "Kg/Ha",
//     "variabels": {
//       "Const_Pet": ["Petroganik", 2000.0],
//       "Const_Ph": ["Phonska Plus", 800.0],
//       "Const_Za": ["ZA", 400.0],
//     },
//     "fieldValue": [],
//     "takaran": {
//       "dasar": {
//         "petroganik": "Const_Pet",
//         "phonska": "Const_Ph / 2 + Const_Ph / 16 ",
//       },
//       "HST15": {
//         "phonska": "(Const_Ph / 2 - Const_Ph / 8) + Const_Ph / 16",
//         "za": "Const_Za / 4",
//       },
//       "HST30": {
//         "za": "Const_Za - Const_Za / 4",
//       }
//     },
//     "hasil": {
//       "dasar": {"petroganik": 0.0, "phonska": 0.0},
//       "HST15": {"phonska": 0.0, "za": 0.0},
//       "HST30": {"za": 0.0},
//     },
//     "penjelas": {"": ""},
//     "category": 0
//   },
//   {
//     "id": 6,
//     "namaKomoditi": "Kentang",
//     "img": "assets/images/komoditi/kentang.png",
//     "satuan": "Kg/Ha",
//     "variabels": {
//       "Const_Pet": ["Petroganik", 2000.0],
//       "Const_Ph": ["Phonska Plus", 1000.0],
//       "Const_Za": ["ZA", 200.0],
//     },
//     "fieldValue": [],
//     "takaran": {
//       "dasar": {
//         "petroganik": "Const_Pet",
//         "phonska": "Const_Ph / 2",
//         "za": "Const_Za / 2",
//       },
//       "HST30": {
//         "phonska": "Const_Ph / 2",
//         "za": "Const_Za / 2",
//       }
//     },
//     "hasil": {
//       "dasar": {"petroganik": 0.0, "phonska": 0.0, "za": 0.0},
//       "HST30": {"phonska": 0.0, "za": 0.0},
//     },
//     "penjelas": {"": ""},
//     "category": 0
//   },
//   {
//     "id": 7,
//     "namaKomoditi": "Kubis",
//     "img": "assets/images/komoditi/kubis.png",
//     "satuan": "Kg/Ha",
//     "variabels": {
//       "Const_Pet": ["Petroganik", 2000],
//       "Const_Ph": ["Phonska Plus", 400.0],
//       "Const_Za": ["ZA", 300.0],
//     },
//     "fieldValue": [],
//     "takaran": {
//       "dasar": {
//         "petroganik": "Const_Pet",
//         "phonska": "Const_Ph / 2",
//         "za": "Const_Za / 6",
//       },
//       "HST15": {
//         "phonska": "Const_Ph / 2",
//         "za": "Const_Za / 6",
//       },
//       "HST30": {
//         "za": "Const_Za - Const_Za / 3",
//       }
//     },
//     "hasil": {
//       "dasar": {"petroganik": 0.0, "phonska": 0.0, "za": 0.0},
//       "HST15": {"phonska": 0.0, "za": 0.0},
//       "HST30": {"za": 0.0},
//     },
//     "penjelas": {"": ""},
//     "category": 0
//   },
//   {
//     "id": 8,
//     "namaKomoditi": "Tomat",
//     "img": "assets/images/komoditi/tomat.png",
//     "satuan": "Kg/Ha",
//     "variabels": {
//       "Const_Pet": ["Petroganik", 2000],
//       "Const_Ph": ["Phonska Plus", 800.0],
//       "Const_Za": ["ZA", 200.0],
//     },
//     "fieldValue": [],
//     "takaran": {
//       "dasar": {
//         "petroganik": "Const_Pet",
//         "phonska": "Const_Ph / 2",
//       },
//       "HST15": {
//         "phonska": "Const_Ph / 2",
//       },
//       "HST30": {
//         "za": "Const_Za",
//       }
//     },
//     "hasil": {
//       "dasar": {"petroganik": 0.0, "phonska": 0.0},
//       "HST15": {"phonska": 0.0},
//       "HST30": {"za": 0.0},
//     },
//     "penjelas": {"": ""},
//     "category": 0
//   },
//   {
//     "id": 9,
//     "namaKomoditi": "Wortel",
//     "img": "assets/images/komoditi/wortel.png",
//     "satuan": "Kg/Ha",
//     "variabels": {
//       "Const_Pet": ["Petroganik", 2000],
//       "Const_Ph": ["Phonska Plus", 400.0],
//       "Const_Za": ["ZA", 300.0],
//     },
//     "fieldValue": [],
//     "takaran": {
//       "dasar": {
//         "petroganik": "Const_Pet",
//         "phonska": "Const_Ph / 2",
//         "za": "Const_Za / 6",
//       },
//       "HST15": {
//         "phonska": "Const_Ph / 2",
//         "za": "Const_Za / 6",
//       },
//       "HST30": {
//         "za": "Const_Za - Const_Za / 3",
//       }
//     },
//     "hasil": {
//       "dasar": {"petroganik": 0.0, "phonska": 0.0, "za": 0.0},
//       "HST15": {"phonska": 0.0, "za": 0.0},
//       "HST30": {"za": 0.0},
//     },
//     "penjelas": {"": ""},
//     "category": 0
//   },
//   {
//     "id": 10,
//     "namaKomoditi": "Buncis / Kacang Panjang",
//     "img": "assets/images/pot/balok.png",
//     "satuan": "Kg/Ha",
//     "variabels": {
//       "Const_Pet": ["Petroganik", 2000.0],
//       "Const_Ph": ["Phonska Plus", 450.0],
//     },
//     "fieldValue": [],
//     "takaran": {
//       "dasar": {
//         "petroganik": "Const_Pet",
//         "phonska": "Const_Ph / 3",
//       },
//       "HST15": {
//         "phonska": "Const_Ph / 3",
//       },
//       "HST30": {
//         "phonska": "Const_Ph / 3",
//       }
//     },
//     "hasil": {
//       "dasar": {"petroganik": 0.0, "phonska": 0.0},
//       "HST15": {"phonska": 0.0},
//       "HST30": {"phonska": 0.0},
//     },
//     "penjelas": {"": ""},
//     "category": 0
//   },
//   {
//     "id": 11,
//     "namaKomoditi": "Bawang Putih",
//     "img": "assets/images/komoditi/bawangputih.png",
//     "satuan": "Kg/Ha",
//     "variabels": {
//       "Const_Pet": ["Petroganik", 2000],
//       "Const_Ph": ["Phonska Plus", 800.0],
//       "Const_Za": ["ZA", 400.0],
//     },
//     "fieldValue": [],
//     "takaran": {
//       "dasar": {
//         "petroganik": "Const_Pet",
//         "phonska": "Const_Ph / 2",
//       },
//       "HST20": {
//         "phonska": "Const_Ph / 2",
//         "za": "Const_Za / 8",
//       },
//       "HST40": {
//         "za": "Const_Za - Const_Za / 8",
//       }
//     },
//     "hasil": {
//       "dasar": {"petroganik": 0.0, "phonska": 0.0},
//       "HST20": {"phonska": 0.0, "za": 0.0},
//       "HST40": {"za": 0.0},
//     },
//     "penjelas": {"": ""},
//     "category": 0
//   },
//   {
//     "id": 12,
//     "namaKomoditi": "Lombok",
//     "img": "assets/images/komoditi/lombok.png",
//     "satuan": "Kg/Ha",
//     "variabels": {
//       "Const_Pet": ["Petroganik", 2000],
//       "Const_Ph": ["Phonska Plus", 800.0],
//       "Const_Za": ["ZA", 200.0],
//     },
//     "fieldValue": [],
//     "takaran": {
//       "dasar": {
//         "petroganik": "Const_Pet",
//         "phonska": "Const_Ph / 2",
//       },
//       "HST20": {
//         "phonska": "Const_Ph / 2",
//       },
//       "HST40": {
//         "za": "Const_Za",
//       }
//     },
//     "hasil": {
//       "dasar": {"petroganik": 0.0, "phonska": 0.0},
//       "HST20": {"phonska": 0.0},
//       "HST40": {"za": 0.0},
//     },
//     "penjelas": {"": ""},
//     "category": 0
//   },
//   {
//     "id": 13,
//     "namaKomoditi": "Mentimun",
//     "img": "assets/images/komoditi/mentimun.png",
//     "satuan": "Kg/Ha",
//     "variabels": {
//       "Const_Pet": ["Petroganik", 2000],
//       "Const_Ph": ["Phonska Plus", 400.0],
//     },
//     "fieldValue": [],
//     "takaran": {
//       "dasar": {
//         "petroganik": "Const_Pet",
//         "phonska": "Const_Ph / 4",
//       },
//       "HST20": {
//         "phonska": "Const_Ph / 4 + Const_Ph / 8",
//       },
//       "HST35": {
//         "phonska": "Const_Ph / 4 + Const_Ph / 8",
//       }
//     },
//     "hasil": {
//       "dasar": {"petroganik": 0.0, "phonska": 0.0},
//       "HST20": {"phonska": 0.0},
//       "HST35": {"phonska": 0.0},
//     },
//     "penjelas": {"": ""},
//     "category": 0
//   },
//   {
//     "id": 14,
//     "namaKomoditi": "Terong",
//     "img": "assets/images/komoditi/terong.png",
//     "satuan": "Kg/Ha",
//     "variabels": {
//       "Const_Pet": ["Petroganik", 2000],
//       "Const_Ph": ["Phonska Plus", 700.0],
//       "Const_Za": ["ZA", 150.0],
//     },
//     "fieldValue": [],
//     "takaran": {
//       "dasar": {
//         "petroganik": "Const_Pet",
//         "phonska": "Const_Ph - Const_Ph / 7",
//       },
//       "HST15": {
//         "phonska": "Const_Ph - Const_Ph / 7",
//       },
//       "HST30": {
//         "phonska": "Const_Ph - Const_Ph / 7",
//         "za": "Const_Za",
//       }
//     },
//     "hasil": {
//       "dasar": {"petroganik": 0.0, "phonska": 0.0},
//       "HST15": {"phonska": 0.0},
//       "HST30": {"phonska": 0.0, "za": 0.0},
//     },
//     "penjelas": {"": ""},
//     "category": 0
//   },
//   {
//     "id": 15,
//     "namaKomoditi": "Brokoli / Kubis bunga",
//     "img": "assets/images/komoditi/kubisbunga.png",
//     "satuan": "Kg/Ha",
//     "variabels": {
//       "Const_Pet": ["Petroganik", 2000],
//       "Const_Ph": ["Phonska Plus", 800.0],
//     },
//     "fieldValue": [],
//     "takaran": {
//       "dasar": {
//         "petroganik": "Const_Pet",
//         "phonska": "Const_Ph / 3.2 + Const_Ph/16",
//       },
//       "HST15": {
//         "phonska": "Const_Ph / 3.2",
//       },
//       "HST30": {
//         "phonska": "Const_Ph / 3.2",
//       }
//     },
//     "hasil": {
//       "dasar": {"petroganik": 0.0, "phonska": 0.0},
//       "HST15": {"phonska": 0.0},
//       "HST30": {"phonska": 0.0},
//     },
//     "penjelas": {"": ""},
//     "category": 0
//   },
//   {
//     "id": 16,
//     "namaKomoditi": "Tebu",
//     "img": "assets/images/komoditi/tebu.png",
//     "satuan": "Kg/Ha",
//     "variabels": {
//       "Const_Pet": ["Petroganik", 1000],
//       "Const_Ph": ["Phonska Plus", 500.0],
//       "Const_Za": ["ZA", 450.0],
//       "Const_Kcl": ["KCL", 80.0],
//     },
//     "fieldValue": [],
//     "takaran": {
//       "dasar": {
//         "petroganik": "Const_Pet",
//         "phonska": "Const_Ph/2",
//         "za": "Const_Za/2",
//       },
//       "35 HST": {
//         "phonska": "Const_Ph / 2",
//         "za": "Const_Za/2",
//         "kcl": "Const_Kcl",
//       },
//     },
//     "hasil": {
//       "dasar": {"petroganik": 0.0, "phonska": 0.0, "za": 0.0},
//       "35 HST": {"phonska": 0.0, "za": 0.0, "kcl": 0.0},
//     },
//     "penjelas": {"": ""},
//     "category": 0
//   },
//   {
//     "id": 17,
//     "namaKomoditi": "Semangka / Melon",
//     "img": "assets/images/komoditi/semangka.png",
//     "satuan": "gr/Pohon",
//     "variabels": {
//       "Const_Pet": ["Petroganik", 2000],
//       "Const_Ph": ["Phonska Plus", 1200.0],
//       "Const_Zk": ["ZK", 250.0],
//     },
//     "fieldValue": [],
//     "takaran": {
//       "dasar": {
//         "petroganik": "Const_Pet",
//         "phonska": "Const_Ph/3",
//         "zk": "Const_Zk/2",
//       },
//       "1-8 MST": {
//         "phonska": "Const_Ph / 1.5",
//         "zk": "Const_Zk/2",
//       },
//     },
//     "hasil": {
//       "dasar": {"petroganik": 0.0, "phonska": 0.0, "zk": 0.0},
//       "1-8 MST": {"phonska": 0.0, "zk": 0.0},
//     },
//     "penjelas": {
//       "Sistem kocoran":
//           "100-180 Gr/10 ltr untuk 10 tanaman setiap 3 hari sekali"
//     },
//     "category": 0
//   },
//   {
//     "id": 18,
//     "namaKomoditi": "Jeruk *)",
//     "img": "assets/images/komoditi/jeruk.png",
//     "satuan": "gr Phonska/Pohon",
//     "variabels": {
//       "Const_Pet": ["Petroganik", 3000],
//       "Const_Ph": ["Phonska Plus", 1600.0],
//     },
//     "fieldValue": [],
//     "takaran": {
//       "Awal Musim Hujan": {
//         "petroganik": "Const_Pet",
//         "phonska": "Const_Ph/2",
//       },
//       "Akhir Musim Hujan": {
//         "phonska": "Const_Ph/2",
//       },
//     },
//     "hasil": {
//       "Awal Musim Hujan": {"petroganik": 0.0, "phonska": 0.0},
//       "Akhir Musim Hujan": {"phonska": 0.0},
//     },
//     "penjelas": {
//       "*)":
//           "Gram/pohon, pupuk diberikan dengan cara dibenamkan dalam alur mengelilingi batang tanaman "
//     },
//     "category": 0
//   },
//   {
//     "id": 19,
//     "namaKomoditi": "Apel *)",
//     "img": "assets/images/komoditi/apel.png",
//     "satuan": "gr/pohon",
//     "variabels": {
//       "Const_Pet": ["Petroganik", 3000],
//       "Const_Ph": ["Phonska Plus", 1600.0],
//     },
//     "fieldValue": [],
//     "takaran": {
//       "Setelah Rompes": {
//         "petroganik": "Const_Pet",
//         "phonska": "Const_Ph/2",
//       },
//       "Saat Pembesaran Buah": {
//         "phonska": "Const_Ph/2",
//       },
//     },
//     "hasil": {
//       "Setelah Rompes": {"petroganik": 0.0, "phonska": 0.0},
//       "Saat Pembesaran Buah": {"phonska": 0.0},
//     },
//     "penjelas": {
//       "*)":
//           "Gram/pohon, pupuk diberikan dengan cara dibenamkan dalam alur mengelilingi batang tanaman "
//     },
//     "category": 0
//   },
//   {
//     "id": 20,
//     "namaKomoditi": "Anggur *)",
//     "img": "assets/images/komoditi/anggur.png",
//     "satuan": "gr/pohon",
//     "variabels": {
//       "Const_Pet": ["Petroganik", 3000],
//       "Const_Ph": ["Phonska Plus", 1800.0],
//     },
//     "fieldValue": [],
//     "takaran": {
//       "Setelah Rompes": {
//         "petroganik": "Const_Pet",
//         "phonska": "Const_Ph/2",
//       },
//       "Saat Pembesaran Buah": {
//         "phonska": "Const_Ph/2",
//       },
//     },
//     "hasil": {
//       "Setelah Rompes": {"petroganik": 0.0, "phonska": 0.0},
//       "Saat Pembesaran Buah": {"phonska": 0.0},
//     },
//     "penjelas": {
//       "*)":
//           "Gram/pohon, pupuk diberikan dengan cara dibenamkan dalam alur mengelilingi batang tanaman "
//     },
//     "category": 0
//   },
//   {
//     "id": 21,
//     "namaKomoditi": "Kopi *)",
//     "img": "assets/images/komoditi/kopi.png",
//     "satuan": "gr/pohon",
//     "variabels": {
//       "Const_Pet": ["Petroganik", 3000],
//       "Const_Ph": ["Phonska Plus", 1100.0],
//       "Const_Kies": ["Kieserit", 180.0]
//     },
//     "fieldValue": [],
//     "takaran": {
//       "Awal Musim Hujan": {
//         "petroganik": "Const_Pet",
//         "phonska": "Const_Ph/2",
//         "kieserit": "Const_Kies / 2"
//       },
//       "Akhir Musim Hujan": {
//         "phonska": "Const_Ph/2",
//         "kieserit": "Const_Kies / 2"
//       },
//     },
//     "hasil": {
//       "Awal Musim Hujan": {
//         "petroganik": 0.0,
//         "phonska": 0.0,
//         "kieserit": 0.0,
//       },
//       "Akhir Musim Hujan": {
//         "phonska": 0.0,
//         "kieserit": 0.0,
//       },
//     },
//     "penjelas": {
//       "*)":
//           "Gram/pohon, pupuk diberikan dengan cara dibenamkan dalam alur mengelilingi batang tanaman "
//     },
//     "category": 0
//   },
//   // {
//   //   "id": 21,
//   //   "namaKomoditi": "Kakao",
//   //   "img": "assets/images/pot/balok.png",
//   //   "satuan": "gr/pohon",
//   //   "variabels": {
//   //     "Const_Pet": ["Petroganik", 3000],
//   //     "Const_Ph": ["Phonska Plus", 1000.0],
//   //     "Const_Kies": ["Kieserit", 150.0]
//   //   },
//   //   "fieldValue": [],
//   //   "takaran": {
//   //     "Awal Musim Hujan": {
//   //       "petroganik": "Const_Pet",
//   //       "phonska": "Const_Ph/2",
//   //       "kieserit": "Const_Kies / 2"
//   //     },
//   //     "Akhir Musim Hujan": {
//   //       "phonska": "Const_Ph/2",
//   //       "kieserit": "Const_Kies / 2"
//   //     },
//   //   },
//   //   "hasil": {
//   //     "Awal Musim Hujan": {
//   //       "petroganik": 0.0,
//   //       "phonska": 0.0,
//   //       "kieserit": 0.0,
//   //     },
//   //     "Akhir Musim Hujan": {
//   //       "phonska": 0.0,
//   //       "kieserit": 0.0,
//   //     },
//   //   },
//   //   "penjelas": {
//   //     "*)":
//   //         "Gram/pohon, pupuk diberikan dengan cara dibenamkan dalam alur mengelilingi batang tanaman "
//   //   },
//   //   "category": 0
//   // },
//   // {
//   //   "id": 22,
//   //   "namaKomoditi": "Kelapa Sawit",
//   //   "img": "assets/images/pot/balok.png",
//   //   "satuan": "gr/pohon",
//   //   "variabels": {
//   //     "Const_Ph": ["Phonska Plus", 5500.0],
//   //     "Const_Kcl": ["KCL", 1000.0],
//   //     "Const_Kies": ["Kieserit", 1000.0]
//   //   },
//   //   "fieldValue": [],
//   //   "takaran": {
//   //     "Awal Musim Hujan": {
//   //       "phonska": "Const_Ph/2",
//   //       "kcl": "Const_Ph/2",
//   //       "kieserit": "Const_Kies / 2"
//   //     },
//   //     "Akhir Musim Hujan": {
//   //       "phonska": "Const_Ph/2",
//   //       "kcl": "Const_Ph/2",
//   //       "kieserit": "Const_Kies / 2"
//   //     },
//   //   },
//   //   "hasil": {
//   //     "Awal Musim Hujan": {
//   //       "phonska": 0.0,
//   //       "kcl": 0.0,
//   //       "kieserit": 0.0,
//   //     },
//   //     "Akhir Musim Hujan": {
//   //       "phonska": 0.0,
//   //       "kcl": 0.0,
//   //       "kieserit": 0.0,
//   //     },
//   //   },
//   //   "penjelas": {
//   //     "*)":
//   //         "Gram/pohon, pupuk diberikan dengan cara dibenamkan dalam alur mengelilingi batang tanaman "
//   //   }
//   // },
//   // {
//   //   "id": 23,
//   //   "namaKomoditi": "Lada",
//   //   "img": "assets/images/pot/balok.png",
//   //   "satuan": "gr/pohon",
//   //   "variabels": {
//   //     "Const_Ph": ["Phonska Plus", 3160.0],
//   //     "Const_Kcl": ["KCL", 300.0],
//   //     "Const_Kies": ["Kieserit", 275.0]
//   //   },
//   //   "fieldValue": [],
//   //   "takaran": {
//   //     "Awal Musim Hujan": {"phonska": "1500", "kcl": "120", "kieserit": "100"},
//   //     "Susulan I": {"phonska": "850", "kcl": "90", "kieserit": "85"},
//   //     "Susulan II": {"phonska": "540", "kcl": "60", "kieserit": "60"},
//   //     "Susulan III": {"phonska": "270", "kcl": "30", "kieserit": "30"},
//   //   },
//   //   "hasil": {
//   //     "Awal Musim Hujan": {"phonska": 0.0, "kcl": 0.0, "kieserit": 0.0},
//   //     "Susulan I": {"phonska": 0.0, "kcl": 0.0, "kieserit": 0.0},
//   //     "Susulan II": {"phonska": 0.0, "kcl": 0.0, "kieserit": 0.0},
//   //     "Susulan III": {"phonska": 0.0, "kcl": 0.0, "kieserit": 0.0},
//   //   },
//   //   "penjelas": {
//   //     "*)":
//   //         "Gram/pohon, pupuk diberikan dengan cara dibenamkan dalam alur mengelilingi batang tanaman ",
//   //     "Catatan": "Catatan : interval pemupukan 40-45 hari"
//   //   }
//   // },
//   // {
//   //   "id": 24,
//   //   "namaKomoditi": "Cengkeh",
//   //   "img": "assets/images/pot/balok.png",
//   //   "satuan": "gr/Pohon",
//   //   "variabels": {
//   //     "Const_Ur": ["Urea", 2000.0],
//   //     "Const_ZA": ["ZA", 4500.0],
//   //     "Const_Sp": ["Sp-36", 2000.0],
//   //     "Const_KCL": ["KCL", 1250.0],
//   //   },
//   //   "fieldValue": [],
//   //   "takaran": {
//   //     "Awal Musim Hujan": {
//   //       "urea": "Const_Ur/2",
//   //       "za": "Const_ZA / 2",
//   //       "sp36": "Const_Sp / 2",
//   //       "kcl": "Const_KCL / 2",
//   //     },
//   //     "Akhir Musim Hujan": {
//   //       "urea": "Const_Ur/2",
//   //       "za": "Const_ZA / 2",
//   //       "sp36": "Const_Sp / 2",
//   //       "kcl": "Const_KCL / 2",
//   //     },
//   //   },
//   //   "hasil": {
//   //     "Awal Musim Hujan": {"urea": 0.0, "za": 0.0, "sp36": 0.0, "kcl": 0.0},
//   //     "Akhir Musim Hujan": {"urea": 0.0, "za": 0.0, "sp36": 0.0, "kcl": 0.0},
//   //   },
//   //   "penjelas": {
//   //     "*)":
//   //         "Gram/pohon, pupuk diberikan dengan cara dibenamkan dalam alur mengelilingi batang tanaman ",
//   //   }
//   // },
// ];

// List<DosisPupuk> listDPB = [
//   for (var i = 0; i < dataDPB.length; i++)
//     DosisPupuk(
//         id: i,
//         namaKomoditi: dataDPB[i]["namaKomoditi"],
//         img: dataDPB[i]["img"],
//         satuan: dataDPB[i]["satuan"],
//         variabels: dataDPB[i]["variabels"],
//         fieldValue: dataDPB[i]["fieldValue"],
//         takaran: dataDPB[i]["takaran"],
//         hasil: dataDPB[i]["hasil"],
//         penjelas: dataDPB[i]["penjelas"],
//         category: dataDPB[i]["category"])
// ];
