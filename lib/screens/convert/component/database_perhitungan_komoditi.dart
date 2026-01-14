// import 'package:rawatt/screens/convert/component/Widget_Jenis_Dosis.dart';
// import 'package:rawatt/screens/convert/component/Widget_Jenis_Lahan.dart';
// // import 'package:rawatt/screens/convert/component/Widget_Komoditi.dart';
// import 'package:rawatt/screens/convert/component/database_rumus_komoditi.dart';
// import 'package:rawatt/screens/convert/component/inisialisasi_var.dart';
// // import 'package:get/get.dart';

// // int selectobjPemupukan = c.selectobjPemupukan.value;

// // List<Map<String, dynamic>> datakalkulasitanamanBuah = [
// //   {
// //     "id": 0,
// //     "nama": "Kalkulasi Pupuk\nTanaman Buah",
// //     "img": "",
// //     "input": {
// //       "Luas Lahan": List.from(c
// //           .dataTypeLahan[c.statesTypelahan.value].hasilAkhir.values
// //           .map((e) => e[1]))[0],
// //       "Dosis Pupuk": List.from(listOca[c.selectobjPemupukan.value]
// //           .variabels
// //           .values
// //           .map((e) => e[1])),
// //       "Dosis Pupuk per Lahan": List.from(
// //           listdosisPupuk[stateIDdosis].hasilAkhir.values.map((e) => e[1]))[0],
// //       "Luas Lahan input": List.from(c
// //           .dataTypeLahan[c.statesTypelahan.value].variabels.values
// //           .map((e) => e[1])),
// //       "PLLahan": [0.0],
// //     },
// //     "rumus": {
// //       // "P1Ha": ['10000 * Jarak Tanam * 1'],
// //       "PLLahan": ['( Luas Lahan / 10000)'],
// //       "Rumus Kalkulasi Pupuk Berdasarkan Anjuran Pupuk Petro Ningrat": [
// //         "Dosis Pupuk * PLLahan",
// //       ]
// //     },
// //     "perhitungan": {
// //       // "P1Ha": ["Populasi 1 Ha", "0.0"],
// //       "PLLahan": ["Luas Lahan", "0.0"],
// //       "keperluan": [
// //         "keperluan",
// //         ["1", "2"]
// //       ]
// //     },
// //     "hasilAkhir": {
// //       "0": [
// //         "hasil proses 1",
// //         [0.0]
// //       ]
// //     },
// //   }
// // ];

// List dataHasilPerhitunganDosis(String jenisPemupukanPupuk, List input,
//     List proses, List output, String jenisMediaTanam) {
//   // input
//   List luasLahanInput = List.from(
//       listTypeLahan[stateTypeLahan].variabels.values.map((e) => e[1]));
//   List luasLahanOutput = List.from(
//       listTypeLahan[stateTypeLahan].hasilAkhir.values.map((e) => e[1]))[0];
//   List DosisPupukPerHa = List.from(
//       filterdata(jenisPemupukanPupuk)[c.selectobjPemupukan.value]
//           .variabels
//           .values
//           .map((e) => e[1]));
//   List DosisPupukPerLahan = List.from(
//       listdosisPupuk[stateIDdosis].hasilAkhir.values.map((e) => e[1]))[0];

//   // Proses

//   List datahasil = [jenisPemupukanPupuk, input, proses, output];
//   return datahasil;
// }

// List<Map<String, dynamic>> dataPupukBerdasarkanAnjuranNingrat = [
//   {
//     "id": 0,
//     "nama": "Kalkulasi Pupuk\nDengan Pupuk Ningrat",
//     "img": "",
//     "input": {
//       "Luas Lahan": List.from(
//           listTypeLahan[stateTypeLahan].hasilAkhir.values.map((e) => e[1]))[0],
//       "Dosis Pupuk": List.from(listNingrat[c.selectobjPemupukan.value]
//           .variabels
//           .values
//           .map((e) => e[1])),
//       "Dosis Pupuk per Lahan": List.from(
//           listdosisPupuk[stateIDdosis].hasilAkhir.values.map((e) => e[1]))[0],
//       "Luas Lahan input": List.from(
//           listTypeLahan[stateTypeLahan].variabels.values.map((e) => e[1])),
//       "PLLahan": [0.0],
//     },
//     "rumus": {
//       // "P1Ha": ['10000 * Jarak Tanam * 1'],
//       "PLLahan": ['( Luas Lahan / 10000)'],
//       "Rumus Kalkulasi Pupuk Berdasarkan Anjuran Pupuk Petro Ningrat": [
//         "Dosis Pupuk * PLLahan",
//       ]
//     },
//     "perhitungan": {
//       // "P1Ha": ["Populasi 1 Ha", "0.0"],
//       "PLLahan": ["Luas Lahan", "0.0"],
//       "keperluan": [
//         "keperluan",
//         ["1", "2"]
//       ]
//     },
//     "hasilAkhir": {
//       "0": [
//         "hasil proses 1",
//         [0.0]
//       ]
//     },
//   }
// ];

// List<Map<String, dynamic>> dataPupukBerdasarkanAnjuranNitrat = [
//   {
//     "id": 0,
//     "nama": "Kalkulasi Pupuk\nDengan Pupuk Nitrat",
//     "img": "",
//     "input": {
//       "Luas Lahan": List.from(
//           listTypeLahan[stateTypeLahan].hasilAkhir.values.map((e) => e[1]))[0],
//       "Dosis Pupuk": List.from(listNitrat[c.selectobjPemupukan.value]
//           .variabels
//           .values
//           .map((e) => e[1])),
//       "Dosis Pupuk per Lahan": List.from(
//           listdosisPupuk[stateIDdosis].hasilAkhir.values.map((e) => e[1]))[0],
//       "Luas Lahan input": List.from(
//           listTypeLahan[stateTypeLahan].variabels.values.map((e) => e[1])),
//       "PLLahan": [0.0],
//     },
//     "rumus": {
//       // "P1Ha": ['10000 * Jarak Tanam * 1'],
//       "PLLahan": ['( Luas Lahan / 10000)'],
//       "Rumus Kalkulasi Pupuk Berdasarkan Anjuran Pupuk Petro Nitrat": [
//         "Dosis Pupuk * PLLahan",
//       ]
//     },
//     "perhitungan": {
//       // "P1Ha": ["Populasi 1 Ha", "0.0"],
//       "PLLahan": ["Luas Lahan", "0.0"],
//       "keperluan": [
//         "keperluan",
//         ["1", "2"]
//       ]
//     },
//     "hasilAkhir": {
//       "0": [
//         "hasil proses 1",
//         [0.0]
//       ]
//     },
//   }
// ];

// List<Map<String, dynamic>> dataPupukBerdasarkanAnjuranNiphos = [
//   {
//     "id": 0,
//     "nama": "Kalkulasi Pupuk\nDengan Pupuk Niphos",
//     "img": "",
//     "input": {
//       "Luas Lahan": List.from(
//           listTypeLahan[stateTypeLahan].hasilAkhir.values.map((e) => e[1]))[0],
//       "Dosis Pupuk": List.from(listNiphos[c.selectobjPemupukan.value]
//           .variabels
//           .values
//           .map((e) => e[1])),
//       "Dosis Pupuk per Lahan": List.from(
//           listdosisPupuk[stateIDdosis].hasilAkhir.values.map((e) => e[1]))[0],
//       "Luas Lahan input": List.from(
//           listTypeLahan[stateTypeLahan].variabels.values.map((e) => e[1])),
//       "PLLahan": [0.0],
//     },
//     "rumus": {
//       // "P1Ha": ['10000 * Jarak Tanam * 1'],
//       "PLLahan": ['( Luas Lahan / 10000)'],
//       "Rumus Kalkulasi Pupuk Berdasarkan Anjuran Pupuk Petro Niphos": [
//         "Dosis Pupuk * PLLahan",
//       ]
//     },
//     "perhitungan": {
//       // "P1Ha": ["Populasi 1 Ha", "0.0"],
//       "PLLahan": ["Luas Lahan", "0.0"],
//       "keperluan": [
//         "keperluan",
//         ["1", "2"]
//       ]
//     },
//     "hasilAkhir": {
//       "0": [
//         "hasil proses 1",
//         [0.0]
//       ]
//     },
//   }
// ];

// List<Map<String, dynamic>> dataPupukBerdasarkanAnjuranOca = [
//   {
//     "id": 0,
//     "nama": "Kalkulasi Pupuk\nDengan Pupuk Phonska Oca",
//     "img": "",
//     "input": {
//       "Luas Lahan": List.from(
//           listTypeLahan[stateTypeLahan].hasilAkhir.values.map((e) => e[1]))[0],
//       "Dosis Pupuk": List.from(listOca[c.selectobjPemupukan.value]
//           .variabels
//           .values
//           .map((e) => e[1])),
//       "Dosis Pupuk per Lahan": List.from(
//           listdosisPupuk[stateIDdosis].hasilAkhir.values.map((e) => e[1]))[0],
//       "Luas Lahan input": List.from(
//           listTypeLahan[stateTypeLahan].variabels.values.map((e) => e[1])),
//       "PLLahan": [0.0],
//     },
//     "rumus": {
//       // "P1Ha": ['10000 * Jarak Tanam * 1'],
//       "PLLahan": ['( Luas Lahan / 10000)'],
//       "Rumus Kalkulasi Pupuk Berdasarkan Anjuran Pupuk Phonska Oca": [
//         "Dosis Pupuk * PLLahan",
//       ]
//     },
//     "perhitungan": {
//       // "P1Ha": ["Populasi 1 Ha", "0.0"],
//       "PLLahan": ["Luas Lahan", "0.0"],
//       "keperluan": [
//         "keperluan",
//         ["1", "2"]
//       ]
//     },
//     "hasilAkhir": {
//       "0": [
//         "hasil proses 1",
//         [0.0]
//       ]
//     },
//   }
// ];

// List<Map<String, dynamic>> dataPupukBerdasarkanAnjuranPanganM = [
//   {
//     "id": 0,
//     "nama": "Kalkulasi Pupuk\nBerdasarkan Anjuran Pangan",
//     "img": "",
//     "input": {
//       "Luas Lahan": List.from(
//           listTypeLahan[stateTypeLahan].hasilAkhir.values.map((e) => e[1]))[0],
//       "Dosis Pupuk": List.from(listDPHMeroke[c.selectobjPemupukan.value]
//           .variabels
//           .values
//           .map((e) => e[1])),
//       "Dosis Pupuk per Lahan": List.from(
//           listdosisPupuk[stateIDdosis].hasilAkhir.values.map((e) => e[1]))[0],
//       "Luas Lahan input": List.from(
//           listTypeLahan[stateTypeLahan].variabels.values.map((e) => e[1])),
//       "PLLahan": [0.0],
//     },
//     "rumus": {
//       // "P1Ha": ['10000 * Jarak Tanam * 1'],
//       "PLLahan": ['( Luas Lahan / 10000)'],
//       "Rumus Kalkulasi Pupuk Berdasarkan Anjuran Pupuk Pangan": [
//         "Dosis Pupuk * PLLahan",
//       ]
//     },
//     "perhitungan": {
//       // "P1Ha": ["Populasi 1 Ha", "0.0"],
//       "PLLahan": ["Luas Lahan", "0.0"],
//       "keperluan": [
//         "keperluan",
//         ["1", "2"]
//       ]
//     },
//     "hasilAkhir": {
//       "0": [
//         "hasil proses 1",
//         [0.0]
//       ]
//     },
//   }
// ];

// List<Map<String, dynamic>> dataPupukBerdasarkanAnjuranHortikulturaM = [
//   {
//     "id": 0,
//     "nama": "Kalkulasi Pupuk\nBerdasarkan Anjuran Hortikultura",
//     "img": "",
//     "input": {
//       "Luas Lahan": List.from(
//           listTypeLahan[stateTypeLahan].hasilAkhir.values.map((e) => e[1]))[0],
//       "Dosis Pupuk": List.from(listDPHMeroke[c.selectobjPemupukan.value]
//           .variabels
//           .values
//           .map((e) => e[1])),
//       "Dosis Pupuk per Lahan": List.from(
//           listdosisPupuk[stateIDdosis].hasilAkhir.values.map((e) => e[1]))[0],
//       "Luas Lahan input": List.from(
//           listTypeLahan[stateTypeLahan].variabels.values.map((e) => e[1])),
//       "PLLahan": [0.0],
//     },
//     "rumus": {
//       // "P1Ha": ['10000 * Jarak Tanam * 1'],
//       "PLLahan": ['( Luas Lahan / 10000)'],
//       "Rumus Kalkulasi Pupuk Berdasarkan Anjuran Pupuk Hortikultura": [
//         "Dosis Pupuk * PLLahan",
//       ]
//     },
//     "perhitungan": {
//       // "P1Ha": ["Populasi 1 Ha", "0.0"],
//       "PLLahan": ["Luas Lahan", "0.0"],
//       "keperluan": [
//         "keperluan",
//         ["1", "2"]
//       ]
//     },
//     "hasilAkhir": {
//       "0": [
//         "hasil proses 1",
//         [0.0]
//       ]
//     },
//   }
// ];

// List<Map<String, dynamic>> dataPupukBerdasarkanAnjuranPupukMajemuk = [
//   {
//     "id": 0,
//     "nama": "Kalkulasi Pupuk\nBerdasarkan Anjuran Pupuk Majemuk",
//     "img": "",
//     "input": {
//       "Luas Lahan": List.from(
//           listTypeLahan[stateTypeLahan].hasilAkhir.values.map((e) => e[1]))[0],
//       "Dosis Pupuk": List.from(listDPM[c.selectobjPemupukan.value]
//           .variabels
//           .values
//           .map((e) => e[1])),
//       "Dosis Pupuk per Lahan": List.from(
//           listdosisPupuk[stateIDdosis].hasilAkhir.values.map((e) => e[1]))[0],
//       "Luas Lahan input": List.from(
//           listTypeLahan[stateTypeLahan].variabels.values.map((e) => e[1])),
//       "PLLahan": [0.0],
//     },
//     "rumus": {
//       // "P1Ha": ['10000 * Jarak Tanam * 1'],
//       "PLLahan": ['( Luas Lahan / 10000)'],
//       "Rumus Kalkulasi Pupuk Berdasarkan Anjuran Pupuk Majemuk": [
//         "Dosis Pupuk * PLLahan",
//       ]
//     },
//     "perhitungan": {
//       // "P1Ha": ["Populasi 1 Ha", "0.0"],
//       "PLLahan": ["Luas Lahan", "0.0"],
//       "keperluan": [
//         "keperluan",
//         ["1", "2"]
//       ]
//     },
//     "hasilAkhir": {
//       "0": [
//         "hasil proses 1",
//         [0.0]
//       ]
//     },
//   }
// ];

// List<Map<String, dynamic>> dataPupukBerdasarkanAnjuranPupukBerimbang = [
//   {
//     "id": 0,
//     "nama": "Kalkulasi Pupuk\nBerdasarkan Anjuran Pupuk Berimbang",
//     "img": "",
//     "input": {
//       "Luas Lahan": List.from(
//           listTypeLahan[stateTypeLahan].hasilAkhir.values.map((e) => e[1]))[0],
//       "Dosis Pupuk": List.from(listDPB[c.selectobjPemupukan.value]
//           .variabels
//           .values
//           .map((e) => e[1])),
//       "Dosis Pupuk per Lahan": List.from(
//           listdosisPupuk[stateIDdosis].hasilAkhir.values.map((e) => e[1]))[0],
//       "Luas Lahan input": List.from(
//           listTypeLahan[stateTypeLahan].variabels.values.map((e) => e[1])),
//       "PLLahan": [0.0],
//     },
//     "rumus": {
//       // "P1Ha": ['10000 * Jarak Tanam * 1'],
//       "PLLahan": ['( Luas Lahan / 10000)'],
//       "Rumus Kalkulasi Pupuk Berdasarkan Anjuran Pupuk Berimbang": [
//         "Dosis Pupuk * PLLahan",
//       ]
//     },
//     "perhitungan": {
//       // "P1Ha": ["Populasi 1 Ha", "0.0"],
//       "PLLahan": ["Luas Lahan", "0.0"],
//       "keperluan": [
//         "keperluan",
//         ["1", "2"]
//       ]
//     },
//     "hasilAkhir": {
//       "0": [
//         "hasil proses 1",
//         [0.0]
//       ]
//     },
//   }
// ];

// List<Map<String, dynamic>> dataPupukBerdasarkanAnjuranPupukTunggal = [
//   {
//     "id": 0,
//     "nama": "Kalkulasi Pupuk\nBerdasarkan Anjuran Pupuk Tunggal",
//     "img": "",
//     "input": {
//       "Luas Lahan": List.from(
//           listTypeLahan[stateTypeLahan].hasilAkhir.values.map((e) => e[1]))[0],
//       "Dosis Pupuk": List.from(listDPT[c.selectobjPemupukan.value]
//           .variabels
//           .values
//           .map((e) => e[1])),
//       "Dosis Pupuk per Lahan": List.from(
//           listdosisPupuk[stateIDdosis].hasilAkhir.values.map((e) => e[1]))[0],
//       "Luas Lahan input": List.from(
//           listTypeLahan[stateTypeLahan].variabels.values.map((e) => e[1])),
//       "PLLahan": [0.0],
//     },
//     "rumus": {
//       // "P1Ha": ['10000 * Jarak Tanam * 1'],
//       "PLLahan": ['( Luas Lahan / 10000)'],
//       "Rumus Kalkulasi Pupuk Berdasarkan Anjuran Pupuk Tunggal": [
//         "Dosis Pupuk * PLLahan",
//       ]
//     },
//     "perhitungan": {
//       // "P1Ha": ["Populasi 1 Ha", "0.0"],
//       "PLLahan": ["Luas Lahan", "0.0"],
//       "keperluan": [
//         "keperluan",
//         ["1", "2"]
//       ]
//     },
//     "hasilAkhir": {
//       "0": [
//         "hasil proses 1",
//         [0.0]
//       ]
//     },
//   }
// ];
