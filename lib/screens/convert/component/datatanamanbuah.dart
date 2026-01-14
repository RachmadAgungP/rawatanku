import 'package:rawatt/screens/convert/component/inisialisasi_var.dart';

// List<Map<String, dynamic>> produkPerusahaan = [
//   {
//     "id": 0,
//     "nama": "Petrokimia Gresik",
//     "img": "assets/images/Petrokimia_logo.png",
//     "produk": getData(0),
//     'isExpanded': false
//   },
//   {
//     "id": 1,
//     "nama": "Meroke",
//     "img": "assets/images/meroke-tetap-jaya-logo.png",
//     "produk": getData(1),
//     'isExpanded': false
//   },
// ];

List<Map<String, dynamic>> datatanamanbuah = [
  {
    "id": 0,
    "namaKomoditi": "Padi",
    "img": "assets/images/komoditi/padi.png",
    "satuan": "Kg/Ha",
    "fieldValue": [],
    "menu": {
      "kalkulator": {
        "nama": "Pupuk tanaman ",
        "rumus": 0,
        "link": "/kalkulator/",
        "penjelasan": "Penjelasnya apa untuk kalkulator ini"
      },
      "peptisida": {
        "nama": "Peptisida tanaman ",
        "rumus": 0,
        "link": "/peptisida/",
        "penjelasan": "Penjelasnya apa untuk kalkulator ini"
      },
    }
  },
  {
    "id": 1,
    "namaKomoditi": "Jagung",
    "img": "assets/images/komoditi/jagung.png",
    "satuan": "Kg/Ha",
    "menu": {
      "kalkulator": {
        "nama": "Pupuk tanaman ",
        "rumus": 1,
        "link": "/kalkulator/",
        "penjelasan": "Penjelasnya apa untuk kalkulator ini"
      },
      "peptisida": {
        "nama": "Peptisida tanaman ",
        "rumus": 1,
        "link": "/peptisida/",
        "penjelasan": "Penjelasnya apa untuk kalkulator ini"
      },
      "perawatan": {
        "nama": "Cara Perawatan ",
        "link": "/perawatan/",
        "penjelasan": "Cara Perawatan"
      },
    }
  },
  {
    "id": 2,
    "namaKomoditi": "Kedelai / Kacang Tanah",
    "img": "assets/images/komoditi/kedelai.png",
    "satuan": "Kg/Ha",
    "menu": {
      "kalkulator": {
        "nama": "Pupuk tanaman ",
        "rumus": 2,
        "link": "/kalkulator/",
        "penjelasan": "Penjelasnya apa untuk kalkulator ini"
      },
      "peptisida": {
        "nama": "Peptisida tanaman ",
        "rumus": 2,
        "link": "/peptisida/",
        "penjelasan": "Penjelasnya apa untuk kalkulator ini"
      },
      "perawatan": {
        "nama": "Cara Perawatan ",
        "link": "/perawatan/",
        "penjelasan": "Cara Perawatan"
      },
    }
  },
  {
    "id": 3,
    "namaKomoditi": "Ubi Kayu",
    "img": "assets/images/komoditi/ubikayu.png",
    "satuan": "Kg/Ha",
    "menu": {
      "kalkulator": {
        "nama": "Pupuk tanaman ",
        "rumus": 3,
        "link": "/kalkulator/",
        "penjelasan": "Penjelasnya apa untuk kalkulator ini"
      },
      "peptisida": {
        "nama": "Peptisida tanaman ",
        "rumus": 3,
        "link": "/peptisida/",
        "penjelasan": "Penjelasnya apa untuk kalkulator ini"
      },
      "perawatan": {
        "nama": "Cara Perawatan ",
        "link": "/perawatan/",
        "penjelasan": "Cara Perawatan"
      },
    }
  },
  {
    "id": 4,
    "namaKomoditi": "Tembakau",
    "img": "assets/images/komoditi/tembakau.png",
    "satuan": "Kg/Ha",
    "menu": {
      "kalkulator": {
        "nama": "Pupuk tanaman ",
        "rumus": 4,
        "link": "/kalkulator/",
        "penjelasan": "Penjelasnya apa untuk kalkulator ini"
      },
      "peptisida": {
        "nama": "Peptisida tanaman ",
        "rumus": 4,
        "link": "/peptisida/",
        "penjelasan": "Penjelasnya apa untuk kalkulator ini"
      },
      "perawatan": {
        "nama": "Cara Perawatan ",
        "link": "/perawatan/",
        "penjelasan": "Cara Perawatan"
      },
    }
  }
];

List<Tanamanbuah> listtanamanbuah = [
  for (var i = 0; i < datatanamanbuah.length; i++)
    Tanamanbuah(
      id: i,
      namaKomoditi: datatanamanbuah[i]["namaKomoditi"],
      img: datatanamanbuah[i]["img"],
      satuan: datatanamanbuah[i]["satuan"],
      fieldValue: datatanamanbuah[i]["fieldValue"],
      menu: datatanamanbuah[i]["menu"],
    )
];

List<Map<String, dynamic>> datadosistanaman = [
  {
    "id_komoditi": 0,
    "pengaplikasian": [
      {
        "id_perusahaan": 0,
        "data_dosis": [
          {
            "id_dosis": 0,
            "jenis pemupukan": "Niphos",
            "variabels": {
              "Const_Or": ["Petroganik", 500.0],
              "Const_Np": ["Niphos", 250.0],
              "Const_Ur": ["Urea", 200.0],
              "Const_Kc": ["KCL", 75],
            },
            "takaran": {
              "dasar": {
                "Petroganik": "Const_Or / 1",
                "Niphos": "Const_Np / 2",
                "Urea": "Const_Ur / 4",
                "KCL": "Const_Kc / 1",
              },
              "susulan I (20 HST)": {
                "Niphos": "Const_Np / 2",
                "Urea": "Const_Ur / 4",
              },
              "susulan II (35 HST)": {
                "Urea": "Const_Ur / 2",
              },
            },
            "hasil": {
              "dasar": {
                "Petroganik": 500.0,
                "Niphos": 125.0,
                "Urea": 50.0,
                "KCL": 75.0,
              },
              "susulan I (20 HST)": {
                "Niphos": 125.0,
                "Urea": 50.0,
              },
              "susulan II (35 HST)": {
                "Urea": 100.0,
              },
            },
            "penjelas": {"Cara Aplikasi": "Ditebar Di Lahan"},
            'isExpanded': false
          },
          {
            "id_dosis": 2,
            "jenis pemupukan": "Majemuk",
            "variabels": {
              "Const_Ur": ["Urea", 200.0],
              "Const_Ph": ["Phonska Plus", 300.0]
            },
            "takaran": {
              "dasar": {
                "Urea": "Const_Ur / 4",
                "Phonska Plus": "Const_Ph / 2",
              },
              "HST20": {
                "Urea": "Const_Ur / 4",
                "Phonska Plus": "Const_Ph / 2",
              },
              "HST35": {"Urea": "Const_Ur / 2"},
            },
            "hasil": {
              "dasar": {"Urea": 50.0, "Phonska Plus": 150.0},
              "HST20": {"Urea": 50.0, "Phonska Plus": 150.0},
              "HST35": {"Urea": 100.0},
            },
            "penjelas": {
              "**)": "Tanah Kahat Belerang 50kg Urea diganti dengan 100kg ZA"
            },
            'isExpanded': false
          },
          {
            "id_dosis": 3,
            "jenis pemupukan": "Tunggal",
            "variabels": {
              "Const_Ur": ["Urea", 300.0],
              "Const_Sp": ["Sp-36", 125.0],
              "Const_KCL": ["KCL", 75.0]
            },
            "takaran": {
              "dasar": {
                "Urea": "Const_Ur / 3",
                "SP36": "Const_Sp / 1",
                "KCL": "Const_KCL / 1"
              },
              "HST20": {"Urea": "Const_Ur / 3"},
              "HST35": {"Urea": "Const_Ur / 3"},
            },
            "hasil": {
              "dasar": {"Urea": 100.0, "SP36": 125.0, "KCL": 75.0},
              "HST20": {"Urea": 100.0},
              "HST35": {"Urea": 100.0},
            },
            "penjelas": {
              "**)": "Tanah Kahat Belerang 50kg Urea diganti dengan 100kg ZA"
            },
            'isExpanded': false
          },
          {
            "id_dosis": 4,
            "jenis pemupukan": "Berimbang",
            "variabels": {
              "Const_Pet": ["Petroganik", 500.0],
              "Const_Ph": ["Phonska Plus", 300.0],
              "Const_Ur": ["Urea", 200.0]
            },
            "takaran": {
              "dasar": {
                "Petroganik": "Const_Pet",
                "Phonska Plus": "Const_Ph / 2",
                "Urea": "Const_Ur / 4",
              },
              "HST20": {
                "Phonska Plus": "Const_Ph / 2",
                "Urea": "Const_Ur / 4",
              },
              "HST35": {"Urea": "Const_Ur / 2"},
            },
            "hasil": {
              "dasar": {
                "Petroganik": 500.0,
                "Urea": 50.0,
                "Phonska Plus": 150.0
              },
              "HST20": {"Urea": 50.0, "Phonska Plus": 150.0},
              "HST35": {"Urea": 100.0},
            },
            "penjelas": {
              "**)": "Tanah Kahat Belerang 50kg Urea diganti dengan 100kg ZA"
            },
            'isExpanded': false
          }
        ],
      },
      {
        "id_perusahaan": 1,
        "data_dosis": [
          {
            "id_dosis": 0,
            "jenis pemupukan": "Meroke",
            "variabels": {
              "Const_Mp": ["Mutiara NPK pro", 250.0],
              "Const_Ur": ["Urea", 200.0],
              "Const_Kp": ["KARATE PLUS BORONI", 125.0],
            },
            "takaran": {
              "14 HST": {
                "Mutiara NPK pro": "Const_Mp",
                "Urea": "Const_Ur",
              },
              "30 HST": {
                "Mutiara NPK pro": "Const_Mp",
                "Urea": "Const_Ur",
              },
              "45 HST": {
                "KARATE PLUS BORONI": "Const_Kp",
              },
            },
            "hasil": {
              "14 HST": {
                "Mutiara NPK pro": 100.0,
                "Urea": 100.0,
              },
              "30 HST": {
                "Mutiara NPK pro": 150.0,
                "Urea": 100.0,
              },
              "45 HST": {
                "KARATE PLUS BORONI": 125.0,
              },
            },
            "penjelas": {"": ""},
            'isExpanded': false
          }
        ],
      }
    ]
  },
];

// List<DosisPupukTanaman> listdosistanaman = [
//   for (var i = 0; i < datadosistanaman.length; i++)
//     DosisPupukTanaman(
//       idKomoditi: i,
//       pengaplikasian: datadosistanaman[i]["pengaplikasian"],
//     )
// ];
