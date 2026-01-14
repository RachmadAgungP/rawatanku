List dataDosisPengaplikasian = [
  {
    "id": 0,"id_MenuRawatan": "1","idKomoditi": 0,
    "idPerusahaan": 0,
    "kategoriProduk": 0,
    "satuan": "Kg/Ha",
    "jenisPemupukan": "LENGKAP",
    "variabels": {
      // "Const_Or": ["Petroganik", 500.0, "kg/ha"],
      // "Const_Np": ["Niphos", 250.0, "kg/ha"],
      "Const_Ur": ["Pupuk POCku", 200.0, "kg/ha"],
      // "Const_Kc": ["KCL", 75, "kg/ha"],
    },
    "fieldValue": [],
    "takaran": {
      "dasar": {
        // "Petroganik": "Const_Or / 1",
        // "Niphos": "Const_Np / 2",
        "Pupuk POCku": "Const_Ur / 4",
        // "KCL": "Const_Kc / 1",
      },
      "susulan I (20 HST)": {
        // "Niphos": "Const_Np / 2",
        "Pupuk POCku": "Const_Ur / 4",
      },
      "susulan II (35 HST)": {
        "Pupuk POCku": "Const_Ur / 2",
      },
    },
    "hasil": {
      "dasar": {
        // "Petroganik": 0.0,
        // "Niphos": 125.0,
        "Pupuk POCku": 50.0,
        // "KCL": 75.0,
      },
      "susulan I (20 HST)": {
        // "Niphos": 125.0,
        "Pupuk POCku": 50.0,
      },
      "susulan II (35 HST)": {
        "Pupuk POCku": 100.0,
      },
    },
    "penjelas": {"Cara Aplikasi": "Ditebar Di Lahan"},
  },

  // {
  //   "id": 0,"id_MenuRawatan": "1","idKomoditi": 0,
  //   "idPerusahaan": 0,
  //   "kategoriProduk": 0,
  //   "satuan": "Kg/Ha",
  //   "jenisPemupukan": "Niphos",
  //   "variabels": {
  //     "Const_Or": ["Petroganik", 500.0, "kg/ha"],
  //     "Const_Np": ["Niphos", 250.0, "kg/ha"],
  //     "Const_Ur": ["Urea", 200.0, "kg/ha"],
  //     "Const_Kc": ["KCL", 75, "kg/ha"],
  //   },
  //   "fieldValue": [],
  //   "takaran": {
  //     "dasar": {
  //       "Petroganik": "Const_Or / 1",
  //       "Niphos": "Const_Np / 2",
  //       "Urea": "Const_Ur / 4",
  //       "KCL": "Const_Kc / 1",
  //     },
  //     "susulan I (20 HST)": {
  //       "Niphos": "Const_Np / 2",
  //       "Urea": "Const_Ur / 4",
  //     },
  //     "susulan II (35 HST)": {
  //       "Urea": "Const_Ur / 2",
  //     },
  //   },
  //   "hasil": {
  //     "dasar": {
  //       "Petroganik": 0.0,
  //       "Niphos": 125.0,
  //       "Urea": 50.0,
  //       "KCL": 75.0,
  //     },
  //     "susulan I (20 HST)": {
  //       "Niphos": 125.0,
  //       "Urea": 50.0,
  //     },
  //     "susulan II (35 HST)": {
  //       "Urea": 100.0,
  //     },
  //   },
  //   "penjelas": {"Cara Aplikasi": "Ditebar Di Lahan"},
  // },

  // {
  //   "id": 2,"id_MenuRawatan": "1","idKomoditi": 0,
  //   "idPerusahaan": 0,
  //   "kategoriProduk": 0,
  //   "satuan": "Kg/Ha",
  //   "jenisPemupukan": "Majemuk",
  //   "variabels": {
  //     "Const_Ur": ["Urea", 200.0, "kg/ha"],
  //     "Const_Ph": ["Phonska Plus", 300.0, "kg/ha"]
  //   },
  //   "fieldValue": [],
  //   "takaran": {
  //     "dasar": {
  //       "Urea": "Const_Ur / 4",
  //       "Phonska Plus": "Const_Ph / 2",
  //     },
  //     "HST20": {
  //       "Urea": "Const_Ur / 4",
  //       "Phonska Plus": "Const_Ph / 2",
  //     },
  //     "HST35": {"Urea": "Const_Ur / 2"},
  //   },
  //   "hasil": {
  //     "dasar": {"Urea": 50.0, "Phonska Plus": 150.0},
  //     "HST20": {"Urea": 50.0, "Phonska Plus": 150.0},
  //     "HST35": {"Urea": 100.0},
  //   },
  //   "penjelas": {
  //     "**)": "Tanah Kahat Belerang 50kg Urea diganti dengan 100kg ZA"
  //   },
  // },
  // {
  //   "id": 3,"id_MenuRawatan": "1","idKomoditi": 0,
  //   "idPerusahaan": 0,
  //   "kategoriProduk": 0,
  //   "satuan": "Kg/Ha",
  //   "jenisPemupukan": "Tunggal",
  //   "variabels": {
  //     "Const_Ur": ["Urea", 300.0, "kg/ha"],
  //     "Const_Sp": ["SP-36", 125.0, "kg/ha"],
  //     "Const_KCL": ["KCL", 75.0, "kg/ha"]
  //   },
  //   "fieldValue": [],
  //   "takaran": {
  //     "dasar": {
  //       "Urea": "Const_Ur / 3",
  //       "SP-36": "Const_Sp / 1",
  //       "KCL": "Const_KCL / 1"
  //     },
  //     "HST20": {"Urea": "Const_Ur / 3"},
  //     "HST35": {"Urea": "Const_Ur / 3"},
  //   },
  //   "hasil": {
  //     "dasar": {"Urea": 100.0, "SP-36": 125.0, "KCL": 75.0},
  //     "HST20": {"Urea": 100.0},
  //     "HST35": {"Urea": 100.0},
  //   },
  //   "penjelas": {
  //     "**)": "Tanah Kahat Belerang 50kg Urea diganti dengan 100kg ZA"
  //   },
  // },
  // {
  //   "id": 4,"id_MenuRawatan": "1","idKomoditi": 0,
  //   "idPerusahaan": 0,
  //   "kategoriProduk": 0,
  //   "satuan": "Kg/Ha",
  //   "jenisPemupukan": "Berimbang",
  //   "variabels": {
  //     "Const_Pet": ["Petroganik", 500.0, "kg/ha"],
  //     "Const_Ph": ["Phonska Plus", 300.0, "kg/ha"],
  //     "Const_Ur": ["Urea", 200.0, "kg/ha"]
  //   },
  //   "fieldValue": [],
  //   "takaran": {
  //     "dasar": {
  //       "Petroganik": "Const_Pet",
  //       "Phonska Plus": "Const_Ph / 2",
  //       "Urea": "Const_Ur / 4",
  //     },
  //     "HST20": {
  //       "Phonska Plus": "Const_Ph / 2",
  //       "Urea": "Const_Ur / 4",
  //     },
  //     "HST35": {"Urea": "Const_Ur / 2"},
  //   },
  //   "hasil": {
  //     "dasar": {"Petroganik": 500.0, "Urea": 50.0, "Phonska Plus": 150.0},
  //     "HST20": {"Urea": 50.0, "Phonska Plus": 150.0},
  //     "HST35": {"Urea": 100.0},
  //   },
  //   "penjelas": {
  //     "**)": "Tanah Kahat Belerang 50kg Urea diganti dengan 100kg ZA"
  //   },
  // },
  // {
  //   "id": 5,"id_MenuRawatan": "1","idKomoditi": 0,
  //   "idPerusahaan": 1,
  //   "kategoriProduk": 0,
  //   "satuan": "Kg/Ha",
  //   "jenisPemupukan": "Meroke Pangan",
  //   "variabels": {
  //     "Const_Mp": ["Mutiara NPK pro", 250.0, "kg/ha"],
  //     "Const_Ur": ["Urea", 200.0, "kg/ha"],
  //     "Const_Kp": ["KARATE PLUS BORONI", 125.0, "kg/ha"],
  //   },
  //   "fieldValue": [],
  //   "takaran": {
  //     "14 HST": {
  //       "Mutiara NPK pro": "Const_Mp",
  //       "Urea": "Const_Ur",
  //     },
  //     "30 HST": {
  //       "Mutiara NPK pro": "Const_Mp",
  //       "Urea": "Const_Ur",
  //     },
  //     "45 HST": {
  //       "KARATE PLUS BORONI": "Const_Kp",
  //     },
  //   },
  //   "hasil": {
  //     "14 HST": {
  //       "Mutiara NPK pro": 100.0,
  //       "Urea": 100.0,
  //     },
  //     "30 HST": {
  //       "Mutiara NPK pro": 150.0,
  //       "Urea": 100.0,
  //     },
  //     "45 HST": {
  //       "KARATE PLUS BORONI": 125.0,
  //     },
  //   },
  //   "penjelas": {"": ""},
  // },
  // {
  //   "id": 6,"id_MenuRawatan": "1","idKomoditi": 1,
  //   "idPerusahaan": 0,
  //   "kategoriProduk": 0,
  //   "satuan": "Kg/Ha",
  //   "jenisPemupukan": "Niphos",
  //   "variabels": {
  //     "Const_Or": ["Petroganik", 500.0, "kg/ha"],
  //     "Const_Np": ["Niphos", 300.0, "kg/ha"],
  //     "Const_Ur": ["Urea", 275.0, "kg/ha"],
  //     "Const_Kc": ["KCL", 75, "kg/ha"],
  //   },
  //   "fieldValue": [],
  //   "takaran": {
  //     "dasar": {
  //       "Petroganik": "Const_Or / 1",
  //       "Niphos": "Const_Np / 2",
  //       "Urea": "Const_Ur / 3.67",
  //       "KCL": "Const_Kc / 1",
  //     },
  //     "susulan I (20 HST)": {
  //       "Niphos": "Const_Np / 2",
  //       "Urea": "Const_Ur / 3.67",
  //     },
  //     "susulan II (35 HST)": {
  //       "Urea": "Const_Ur / 2.2",
  //     },
  //   },
  //   "hasil": {
  //     "dasar": {
  //       "Petroganik": 500.0,
  //       "Niphos": 125.0,
  //       "Urea": 75.0,
  //       "KCL": 75.0,
  //     },
  //     "susulan I (20 HST)": {
  //       "Niphos": 150.0,
  //       "Urea": 75.0,
  //     },
  //     "susulan II (35 HST)": {
  //       "Urea": 125.0,
  //     },
  //   },
  //   "penjelas": {"Cara Aplikasi": "Ditabur / dibenamkan"},
  // },

  // {
  //   "id": 7,"id_MenuRawatan": "1","idKomoditi": 1,
  //   "idPerusahaan": 0,
  //   "kategoriProduk": 0,
  //   "satuan": "Kg/Ha",
  //   "jenisPemupukan": "Majemuk",
  //   "variabels": {
  //     "Const_Ur": ["Urea", 300.0, "kg/ha"],
  //     "Const_Ph": ["Phonska Plus", 300.0, "kg/ha"]
  //   },
  //   "fieldValue": [],
  //   "takaran": {
  //     "dasar": {
  //       "Urea": "Const_Ur / 4",
  //       "Phonska Plus": "Const_Ph / 2",
  //     },
  //     "HST20": {
  //       "Urea": "Const_Ur / 4",
  //       "Phonska Plus": "Const_Ph / 2",
  //     },
  //     "HST35": {"Urea": "Const_Ur / 2"},
  //   },
  //   "hasil": {
  //     "dasar": {"Urea": 0.0, "Phonska Plus": 0.0},
  //     "HST20": {"Urea": 0.0, "Phonska Plus": 0.0},
  //     "HST35": {"Urea": 0.0},
  //   },
  //   "penjelas": {
  //     "**)": "Tanah Kahat Belerang 50kg Urea diganti dengan 100kg ZA"
  //   },
  // },
  // {
  //   "id": 8,"id_MenuRawatan": "1","idKomoditi": 1,
  //   "idPerusahaan": 0,
  //   "kategoriProduk": 0,
  //   "satuan": "Kg/Ha",
  //   "jenisPemupukan": "Tunggal",
  //   "variabels": {
  //     "Const_Ur": ["Urea", 400.0, "kg/ha"],
  //     "Const_Sp": ["SP-36", 150.0, "kg/ha"],
  //     "Const_KCL": ["KCL", 75.0, "kg/ha"]
  //   },
  //   "fieldValue": [],
  //   "takaran": {
  //     "dasar": {
  //       "Urea": "Const_Ur / 3.2",
  //       "SP-36": "Const_Sp / 1",
  //       "KCL": "Const_KCL / 1",
  //     },
  //     "HST20": {"Urea": "Const_Ur / 3.2"},
  //     "HST35": {"Urea": "Const_Ur - ((Const_Ur / 3.2) + (Const_Ur / 3.2))"},
  //   },
  //   "hasil": {
  //     "dasar": {"Urea": 0.0, "SP-36": 0.0, "KCL": 0.0},
  //     "HST20": {"Urea": 0.0},
  //     "HST35": {"Urea": 0.0},
  //   },
  //   "penjelas": {"": ""},
  // },
  // {
  //   "id": 9,"id_MenuRawatan": "1","idKomoditi": 1,
  //   "idPerusahaan": 0,
  //   "kategoriProduk": 0,
  //   "satuan": "Kg/Ha",
  //   "jenisPemupukan": "Berimbang",
  //   "variabels": {
  //     "Const_Pet": ["Petroganik", 500.0, "kg/ha"],
  //     "Const_Ur": ["Urea", 300.0, "kg/ha"],
  //     "Const_Ph": ["Phonska Plus", 300.0, "kg/ha"]
  //   },
  //   "fieldValue": [],
  //   "takaran": {
  //     "dasar": {
  //       "Petroganik": "Const_Pet",
  //       "Phonska Plus": "Const_Ph / 2",
  //       "Urea": "Const_Ur / 4",
  //     },
  //     "HST20": {
  //       "Urea": "Const_Ur / 4",
  //       "Phonska Plus": "Const_Ph / 2",
  //     },
  //     "HST35": {"Urea": "Const_Ur / 2"},
  //   },
  //   "hasil": {
  //     "dasar": {"Petroganik": 0.0, "Urea": 0.0, "Phonska Plus": 0.0},
  //     "HST20": {"Urea": 0.0, "Phonska Plus": 0.0},
  //     "HST35": {"Urea": 0.0},
  //   },
  //   "penjelas": {
  //     "**)": "Tanah Kahat Belerang 50kg Urea diganti dengan 100kg ZA"
  //   },
  // },

  // {
  //   "id": 11,"id_MenuRawatan": "1","idKomoditi": 2,
  //   "idPerusahaan": 0,
  //   "kategoriProduk": 0,
  //   "satuan": "Kg/Ha",
  //   "jenisPemupukan": "Majemuk",
  //   "variabels": {
  //     "Const_Ph": ["Phonska Plus", 250.0, "kg/ha"]
  //   },
  //   "fieldValue": [],
  //   "takaran": {
  //     "dasar": {
  //       "Phonska Plus": "Const_Ph /2",
  //     },
  //     "HST30": {
  //       "Phonska Plus": "Const_Ph /2",
  //     },
  //   },
  //   "hasil": {
  //     "dasar": {"Phonska Plus": 1.0},
  //     "HST30": {"Phonska Plus": 1.0},
  //   },
  //   "penjelas": {"": ""},
  // },
  // {
  //   "id": 12,"id_MenuRawatan": "1","idKomoditi": 2,
  //   "idPerusahaan": 0,
  //   "kategoriProduk": 0,
  //   "satuan": "Kg/Ha",
  //   "jenisPemupukan": "Tunggal",
  //   "variabels": {
  //     "Const_Ur": ["Urea", 75.0, "kg/ha"],
  //     "Const_Sp": ["SP-36", 100.0, "kg/ha"],
  //     "Const_KCL": ["KCL", 50.0, "kg/ha"]
  //   },
  //   "fieldValue": [],
  //   "takaran": {
  //     "dasar": {
  //       "Urea": "Const_Ur - (Const_Ur / 2)",
  //       "SP-36": "Const_Sp / 1",
  //       "KCL": "Const_KCL / 1",
  //     },
  //     "HST30": {"Urea": "Const_Ur / 2"},
  //   },
  //   "hasil": {
  //     "dasar": {"Urea": 0.0, "SP-36": 0.0, "KCL": 0.0},
  //     "HST30": {"Urea": 0.0},
  //   },
  //   "penjelas": {"": ""},
  // },
  // {
  //   "id": 13,"id_MenuRawatan": "1","idKomoditi": 2,
  //   "idPerusahaan": 0,
  //   "kategoriProduk": 0,
  //   "satuan": "Kg/Ha",
  //   "jenisPemupukan": "Berimbang",
  //   "variabels": {
  //     "Const_Pet": ["Petroganik", 500.0, "kg/ha"],
  //     "Const_Ph": ["Phonska Plus", 250.0, "kg/ha"]
  //   },
  //   "fieldValue": [],
  //   "takaran": {
  //     "dasar": {
  //       "Petroganik": "Const_Pet",
  //       "Phonska Plus": "Const_Ph / 2",
  //     },
  //     "HST30": {
  //       "Phonska Plus": "Const_Ph / 2",
  //     },
  //   },
  //   "hasil": {
  //     "dasar": {"Petroganik": 0.0, "Phonska Plus": 0.0},
  //     "HST30": {"Phonska Plus": 0.0},
  //   },
  //   "penjelas": {"": ""},
  // },
  // {
  //   "id": 14,"id_MenuRawatan": "1","idKomoditi": 3,
  //   "idPerusahaan": 1,
  //   "kategoriProduk": 0,
  //   "satuan": "Kg/Ha",
  //   "jenisPemupukan": "Meroke Pangan",
  //   "variabels": {
  //     "Const_Ss": ["SS (AMMOPHOS)", 375.0, "kg/ha"],
  //     "Const_Mp": ["Meroke MOP", 100, "kg/ha"],
  //     "Const_Ur": ["Urea", 375.0, "kg/ha"],
  //   },
  //   "fieldValue": [],
  //   "takaran": {
  //     "2 BST": {
  //       "SS (AMMOPHOS)": "Const_Ss",
  //     },
  //     "6 BST": {
  //       "Meroke MOP": "Const_Mp",
  //       "Urea": "Const_Ur",
  //     },
  //   },
  //   "hasil": {
  //     "2 BST": {"SS (AMMOPHOS)": 375.0},
  //     "6 BST": {"Meroke MOP": 100.0, "Urea": 375.0},
  //   },
  //   "penjelas": {"": ""},
  // },
  // {
  //   "id": 15,"id_MenuRawatan": "1","idKomoditi": 3,
  //   "idPerusahaan": 0,
  //   "kategoriProduk": 0,
  //   "satuan": "Kg/Ha",
  //   "jenisPemupukan": "Majemuk",
  //   "variabels": {
  //     "Const_Ur": ["Urea", 150.0, "kg/ha"],
  //     "Const_Ph": ["Phonska Plus", 300.0, "kg/ha"]
  //   },
  //   "fieldValue": [],
  //   "takaran": {
  //     "dasar": {
  //       "Urea": "Const_Ur / 6",
  //       "Phonska Plus": "Const_Ph / 2",
  //     },
  //     "HST60": {
  //       "Urea": "Const_Ur - Const_Ur / 6",
  //       "Phonska Plus": "Const_Ph / 2",
  //     }
  //   },
  //   "hasil": {
  //     "dasar": {"Urea": 0.0, "Phonska Plus": 0.0},
  //     "HST60": {"Urea": 0.0, "Phonska Plus": 0.0},
  //   },
  //   "penjelas": {"": ""},
  // },
  // {
  //   "id": 16,"id_MenuRawatan": "1","idKomoditi": 3,
  //   "idPerusahaan": 0,
  //   "kategoriProduk": 0,
  //   "satuan": "Kg/Ha",
  //   "jenisPemupukan": "Tunggal",
  //   "variabels": {
  //     "Const_Ur": ["Urea", 250.0, "kg/ha"],
  //     "Const_Sp": ["SP-36", 100.0, "kg/ha"],
  //     "Const_KCL": ["KCL", 75.0, "kg/ha"]
  //   },
  //   "fieldValue": [],
  //   "takaran": {
  //     "dasar": {
  //       "Urea": "Const_Ur / 3.333",
  //       "SP-36": "Const_Sp / 1",
  //       "KCL": "Const_KCL / 3",
  //     },
  //     "HST60": {
  //       "Urea": "Const_Ur - (Const_Ur / 3.333) ",
  //       "KCL": "Const_KCL - (Const_KCL / 3)",
  //     },
  //   },
  //   "hasil": {
  //     "dasar": {"Urea": 0.0, "SP-36": 0.0, "KCL": 0.0},
  //     "HST60": {"Urea": 0.0, "KCL": 0.0},
  //   },
  //   "penjelas": {"": ""},
  // },
  // {
  //   "id": 17,"id_MenuRawatan": "1","idKomoditi": 3,
  //   "idPerusahaan": 0,
  //   "kategoriProduk": 0,
  //   "satuan": "Kg/Ha",
  //   "jenisPemupukan": "Berimbang",
  //   "variabels": {
  //     "Const_Pet": ["Petroganik", 500.0, "kg/ha"],
  //     "Const_Ur": ["Urea", 150.0, "kg/ha"],
  //     "Const_Ph": ["Phonska Plus", 300.0, "kg/ha"]
  //   },
  //   "fieldValue": [],
  //   "takaran": {
  //     "dasar": {
  //       "Petroganik": "Const_Pet",
  //       "Urea": "Const_Ur / 6",
  //       "Phonska Plus": "Const_Ph / 2",
  //     },
  //     "HST60": {
  //       "Urea": "Const_Ur - Const_Ur / 6",
  //       "Phonska Plus": "Const_Ph / 2",
  //     }
  //   },
  //   "hasil": {
  //     "dasar": {"Petroganik": 0.0, "Urea": 0.0, "Phonska Plus": 0.0},
  //     "HST60": {"Urea": 0.0, "Phonska Plus": 0.0},
  //   },
  //   "penjelas": {"": ""},
  // },
  // {
  //   "id": 18,"id_MenuRawatan": "1","idKomoditi": 4,
  //   "idPerusahaan": 0,
  //   "kategoriProduk": 0,
  //   "satuan": "Kg/Ha",
  //   "jenisPemupukan": "Ningrat",
  //   "variabels": {
  //     "Const_Ng": ["Ningrat", 450.0, "kg/ha"],
  //     "Const_ZA": ["ZA", 100.0, "kg/ha"],
  //     "Const_Or": ["Petroganik", 1000.0, "kg/ha"],
  //   },
  //   "fieldValue": [],
  //   "takaran": {
  //     "dasar": {
  //       "Petroganik": "Const_Or / 1",
  //     },
  //     "susulan I (5-7 HST)": {
  //       "Ningrat": "Const_Ng / 2",
  //       "ZA": "Const_ZA / 2",
  //     },
  //     "susulan II (21-25 HST)": {
  //       "Ningrat": "Const_Ng / 2",
  //       "ZA": "Const_ZA / 2",
  //     },
  //   },
  //   "hasil": {
  //     "dasar": {
  //       "Petroganik": 0.0,
  //     },
  //     "susulan I (5-7 HST)": {
  //       "Ningrat": 0.0,
  //       "ZA": 0.0,
  //     },
  //     "susulan II (21-25 HST)": {
  //       "Ningrat": 0.0,
  //       "ZA": 0.0,
  //     },
  //   },
  //   "penjelas": {
  //     "Cara Aplikasi":
  //     "pupuk dibenamkan dalam tanah di sekeliling pohon atau sekitar tanaman."
  //   },
  // },
  // {
  //   "id": 19,"id_MenuRawatan": "1","idKomoditi": 5,
  //   "idPerusahaan": 0,
  //   "kategoriProduk": 0,
  //   "satuan": "Kg/Ha",
  //   "jenisPemupukan": "Ningrat",
  //   "variabels": {
  //     "Const_Ng": ["Ningrat", 500.0, "kg/ha"],
  //     "Const_ZA": ["ZA", 200.0, "kg/ha"],
  //     "Const_Or": ["Petroganik", 2000.0, "kg/ha"],
  //   },
  //   "fieldValue": [],
  //   "takaran": {
  //     "dasar": {
  //       "Petroganik": "Const_Or / 1",
  //       "Ningrat": "Const_Ng / 2",
  //       "ZA": "Const_ZA / 2",
  //     },
  //     "susulan I (30 HST)": {
  //       "Ningrat": "Const_Ng / 2",
  //       "ZA": "Const_ZA / 2",
  //     },
  //   },
  //   "hasil": {
  //     "dasar": {
  //       "Petroganik": 0.0,
  //       "Ningrat": 0.0,
  //       "ZA": 0.0,
  //     },
  //     "susulan I (30 HST)": {
  //       "Ningrat": 0.0,
  //       "ZA": 0.0,
  //     },
  //   },
  //   "penjelas": {
  //     "Cara Aplikasi":
  //     "pupuk dibenamkan dalam tanah di sekeliling pohon atau sekitar tanaman."
  //   },
  // },
  // {
  //   "id": 20,"id_MenuRawatan": "1","idKomoditi": 5,
  //   "idPerusahaan": 0,
  //   "kategoriProduk": 0,
  //   "satuan": "Kg/Ha",
  //   "jenisPemupukan": "Nitrat",
  //   "variabels": {
  //     "Const_Nk": ["Nitrat", 1000.0, "kg/ha"],
  //     "Const_ZA": ["ZA", 200.0, "kg/ha"],
  //     "Const_ZK": ["ZK", 100.0, "kg/ha"],
  //     "Const_Or": ["Petroganik", 2000.0, "kg/ha"],
  //   },
  //   "fieldValue": [],
  //   "takaran": {
  //     "dasar": {
  //       "Nitrat": "Const_Nk / 2",
  //       "ZA": "Const_ZA / 2",
  //       "ZK": "Const_ZK / 2",
  //       "Petroganik": "Const_Or / 1",
  //     },
  //     "susulan I (30 HST)": {
  //       "Nitrat": "Const_Nk / 2",
  //       "ZA": "Const_ZA / 2",
  //       "ZK": "Const_ZK / 2",
  //     },
  //   },
  //   "hasil": {
  //     "dasar": {
  //       "Nitrat": 500.0,
  //       "ZA": 100.0,
  //       "ZK": 50.0,
  //       "Petroganik": 2000.0,
  //     },
  //     "susulan I (30 HST)": {
  //       "Nitrat": 500.0,
  //       "ZA": 100.0,
  //       "ZK": 50.0,
  //     },
  //   },
  //   "penjelas": {"Cara Aplikasi": "Ditebar / Dibenamkan"},
  // },

  // {
  //   "id": 22,"id_MenuRawatan": "1","idKomoditi": 5,
  //   "idPerusahaan": 0,
  //   "kategoriProduk": 0,
  //   "satuan": "Kg/Ha",
  //   "jenisPemupukan": "Majemuk",
  //   "variabels": {
  //     "Const_Ph": ["Phonska Plus", 1000.0, "kg/ha"],
  //     "Const_ZA": ["ZA", 200.0, "kg/ha"],
  //   },
  //   "fieldValue": [],
  //   "takaran": {
  //     "dasar": {
  //       "Phonska Plus": "Const_Ph / 2",
  //       "ZA": "Const_ZA / 2",
  //     },
  //     "HST30": {
  //       "Phonska Plus": "Const_Ph / 2",
  //       "ZA": "Const_ZA / 2",
  //     }
  //   },
  //   "hasil": {
  //     "dasar": {"Phonska Plus": 0.0, "ZA": 0.0},
  //     "HST30": {"Phonska Plus": 0.0, "ZA": 0.0},
  //   },
  //   "penjelas": {"": ""},
  // },
  // {
  //   "id": 23,"id_MenuRawatan": "1","idKomoditi": 5,
  //   "idPerusahaan": 0,
  //   "kategoriProduk": 0,
  //   "satuan": "Kg/Ha",
  //   "jenisPemupukan": "Tunggal",
  //   "variabels": {
  //     "Const_ZA": ["ZA", 900.0, "kg/ha"],
  //     "Const_Sp": ["SP-36", 400.0, "kg/ha"],
  //     "Const_KCL": ["KCL", 250.0, "kg/ha"]
  //   },
  //   "fieldValue": [],
  //   "takaran": {
  //     "dasar": {
  //       "ZA": "Const_ZA / 2",
  //       "SP-36": "Const_Sp",
  //       "KCL": "Const_KCL",
  //     },
  //     "HST30": {
  //       "ZA": "Const_ZA / 2",
  //     },
  //   },
  //   "hasil": {
  //     "dasar": {"ZA": 0.0, "SP-36": 0.0, "KCL": 0.0},
  //     "HST30": {"ZA": 0.0},
  //   },
  //   "penjelas": {"": ""}
  // },
  // {
  //   "id": 24,"id_MenuRawatan": "1","idKomoditi": 5,
  //   "idPerusahaan": 0,
  //   "kategoriProduk": 0,
  //   "satuan": "Kg/Ha",
  //   "jenisPemupukan": "Berimbang",
  //   "variabels": {
  //     "Const_Pet": ["Petroganik", 2000.0, "kg/ha"],
  //     "Const_Ph": ["Phonska Plus", 1000.0, "kg/ha"],
  //     "Const_ZA": ["ZA", 200.0, "kg/ha"],
  //   },
  //   "fieldValue": [],
  //   "takaran": {
  //     "dasar": {
  //       "Petroganik": "Const_Pet",
  //       "Phonska Plus": "Const_Ph / 2",
  //       "ZA": "Const_ZA / 2",
  //     },
  //     "HST30": {
  //       "Phonska Plus": "Const_Ph / 2",
  //       "ZA": "Const_ZA / 2",
  //     }
  //   },
  //   "hasil": {
  //     "dasar": {"Petroganik": 0.0, "Phonska Plus": 0.0, "ZA": 0.0},
  //     "HST30": {"Phonska Plus": 0.0, "ZA": 0.0},
  //   },
  //   "penjelas": {"": ""},
  // },
  // {
  //   "id": 25,"id_MenuRawatan": "1","idKomoditi": 6,
  //   "idPerusahaan": 0,
  //   "kategoriProduk": 0,
  //   "satuan": "Kg/Ha",
  //   "jenisPemupukan": "Ningrat",
  //   "variabels": {
  //     "Const_Ng": ["Ningrat", 500.0, "kg/ha"],
  //     "Const_ZA": ["ZA", 350.0, "kg/ha"],
  //     "Const_Or": ["Petroganik", 2000.0, "kg/ha"],
  //   },
  //   "fieldValue": [],
  //   "takaran": {
  //     "dasar": {
  //       "Petroganik": "Const_Or / 1",
  //       "Ningrat": "Const_Ng / 2.5",
  //     },
  //     "susulan I (15 HST)": {
  //       "Ningrat": "Const_Ng / 3.3333",
  //       "ZA": "Const_ZA / 2.3333",
  //     },
  //     "susulan II (30 HST)": {
  //       "Ningrat": "Const_Ng / 3.3333",
  //       "ZA": "Const_ZA / 1.75",
  //     },
  //   },
  //   "hasil": {
  //     "dasar": {
  //       "Petroganik": 0.0,
  //       "Ningrat": 0.0,
  //     },
  //     "susulan I (15 HST)": {
  //       "Ningrat": 0.0,
  //       "ZA": 0.0,
  //     },
  //     "susulan II (30 HST)": {
  //       "Ningrat": 0.0,
  //       "ZA": 0.0,
  //     },
  //   },
  //   "penjelas": {
  //     "Cara Aplikasi":
  //     "pupuk dibenamkan dalam tanah di sekeliling pohon atau sekitar tanaman."
  //   },
  // },
  // {
  //   "id": 26,"id_MenuRawatan": "1","idKomoditi": 6,
  //   "idPerusahaan": 0,
  //   "kategoriProduk": 0,
  //   "satuan": "Kg/Ha",
  //   "jenisPemupukan": "Berimbang",
  //   "variabels": {
  //     "Const_Nk": ["Nitrat", 700.0, "kg/ha"],
  //     "Const_ZA": ["ZA", 150.0, "kg/ha"],
  //     "Const_ZK": ["ZK", 100.0, "kg/ha"],
  //     "Const_Or": ["Petroganik", 2000.0, "kg/ha"],
  //   },
  //   "fieldValue": [],
  //   "takaran": {
  //     "dasar": {
  //       "Nitrat": "Const_Nk / 2",
  //       "ZK": "Const_ZK / 2",
  //       "Petroganik": "Const_Or / 1",
  //     },
  //     "susulan I (15 - 20 HST)": {
  //       "Nitrat": "Const_Nk / 2",
  //       "ZA": "Const_ZA / 2",
  //       "ZK": "Const_ZK / 4",
  //     },
  //     "susulan II (30 - 40 HST)": {
  //       "ZA": "Const_ZA / 2",
  //       "ZK": "Const_ZK / 4",
  //     },
  //   },
  //   "hasil": {
  //     "dasar": {
  //       "Nitrat": 350.0,
  //       "ZK": 50.0,
  //       "Petroganik": 2000.0,
  //     },
  //     "susulan I (15 - 20 HST)": {
  //       "Nitrat": 350.0,
  //       "ZA": 75.0,
  //       "ZK": 25.0,
  //     },
  //     "susulan II (30 - 40 HST)": {
  //       "ZA": 75.0,
  //       "ZK": 25.0,
  //     },
  //   },
  //   "penjelas": {"Cara Aplikasi": "Ditebar / Dibenamkan"},
  // },
  // {
  //   "id": 28,"id_MenuRawatan": "1","idKomoditi": 6,
  //   "idPerusahaan": 1,
  //   "kategoriProduk": 0,
  //   "satuan": "Kg/Ha",
  //   "jenisPemupukan": "Meroke Hortikultura",
  //   "variabels": {
  //     "Const_Mn": ["Mutiara NPK", 275.0, "kg/ha"],
  //     "Const_Ss": ["SS (AMMOPHOS)", 250.0, "kg/ha"],
  //     "Const_Kp": ["KARATE PLUS BORONI", 225.0, "kg/ha"],
  //     "Const_Mg": ["Mutiara Grower", 300.0, "kg/ha"],
  //     "Const_Sb": ["SUBURKALI BUTIR", 300.0, "kg/ha"],
  //   },
  //   "fieldValue": [],
  //   "takaran": {
  //     "dasar": {
  //       "Mutiara NPK": "Const_Mn/2.2",
  //       "KARATE PLUS BORONI": "Const_Kp/1.8",
  //       "SS (AMMOPHOS)": "Const_Ss"
  //     },
  //     "HST30": {
  //       "Mutiara NPK": "Const_Mg/1.8333333333333333",
  //       "KARATE PLUS BORONI": "Const_Kp/2.25",
  //       "SUBURKALI BUTIR": "Const_Sb/3",
  //     },
  //     "HST45": {
  //       "Mutiara Grower": "Const_Mg",
  //       "SUBURKALI BUTIR": "Const_Sb/1.5",
  //     },
  //   },
  //   "hasil": {
  //     "dasar": {
  //       "Mutiara NPK": 125.0,
  //       "KARATE PLUS BORONI": 100,
  //       "SS (AMMOPHOS)": 250
  //     },
  //     "HST30": {
  //       "Mutiara NPK": 150.0,
  //       "KARATE PLUS BORONI": 100.0,
  //       "SUBURKALI BUTIR": 100
  //     },
  //     "HST45": {"Mutiara Grower": 300.0, "SUBURKALI BUTIR": 100},
  //   },
  //   "penjelas": {"": ""},
  // },
  // {
  //   "id": 29,"id_MenuRawatan": "1","idKomoditi": 6,
  //   "idPerusahaan": 0,
  //   "kategoriProduk": 0,
  //   "satuan": "Kg/Ha",
  //   "jenisPemupukan": "Majemuk",
  //   "variabels": {
  //     "Const_Ph": ["Phonska Plus", 800.0, "kg/ha"],
  //     "Const_ZA": ["ZA", 400.0, "kg/ha"],
  //   },
  //   "fieldValue": [],
  //   "takaran": {
  //     "dasar": {
  //       "Phonska Plus": "Const_Ph / 2",
  //       "ZA": "Const_ZA / 2",
  //     },
  //     "HST30": {
  //       "Phonska Plus": "Const_Ph / 2",
  //       "ZA": "Const_ZA / 2",
  //     }
  //   },
  //   "hasil": {
  //     "dasar": {"Phonska Plus": 0.0, "ZA": 0.0},
  //     "HST30": {"Phonska Plus": 0.0, "ZA": 0.0},
  //   },
  //   "penjelas": {"": ""},
  // },
  // {
  //   "id": 30,"id_MenuRawatan": "1","idKomoditi": 6,
  //   "idPerusahaan": 0,
  //   "kategoriProduk": 0,
  //   "satuan": "Kg/Ha",
  //   "jenisPemupukan": "Tunggal",
  //   "variabels": {
  //     "Const_Ur": ["Urea", 200.0, "kg/ha"],
  //     "Const_ZA": ["ZA", 500.0, "kg/ha"],
  //     "Const_Sp": ["SP-36", 300.0, "kg/ha"],
  //     "Const_KCL": ["KCL", 200.0, "kg/ha"]
  //   },
  //   "fieldValue": [],
  //   "takaran": {
  //     "dasar": {
  //       "Urea": "Const_Ur",
  //       "SP-36": "Const_Sp",
  //       "KCL": "Const_KCL - (Const_KCL / 4)",
  //     },
  //     "HST30": {
  //       "ZA": "Const_ZA ",
  //       "KCL": "Const_KCL / 4",
  //     },
  //   },
  //   "hasil": {
  //     "dasar": {"Urea": 0.0, "SP-36": 0.0, "KCL": 0.0},
  //     "HST30": {"ZA": 0.0, "KCL": 0.0},
  //   },
  //   "penjelas": {"": ""},
  // },
  // {
  //   "id": 31,"id_MenuRawatan": "1","idKomoditi": 6,
  //   "idPerusahaan": 0,
  //   "kategoriProduk": 0,
  //   "satuan": "Kg/Ha",
  //   "jenisPemupukan": "Berimbang",
  //   "variabels": {
  //     "Const_Pet": ["Petroganik", 2000.0, "kg/ha"],
  //     "Const_Ph": ["Phonska Plus", 800.0, "kg/ha"],
  //     "Const_ZA": ["ZA", 400.0, "kg/ha"],
  //   },
  //   "fieldValue": [],
  //   "takaran": {
  //     "dasar": {
  //       "Petroganik": "Const_Pet",
  //       "Phonska Plus": "Const_Ph / 2 + Const_Ph / 16 ",
  //     },
  //     "HST15": {
  //       "Phonska Plus": "(Const_Ph / 2 - Const_Ph / 8) + Const_Ph / 16",
  //       "ZA": "Const_ZA / 4",
  //     },
  //     "HST30": {
  //       "ZA": "Const_ZA - Const_ZA / 4",
  //     }
  //   },
  //   "hasil": {
  //     "dasar": {"Petroganik": 0.0, "Phonska Plus": 0.0},
  //     "HST15": {"Phonska Plus": 0.0, "ZA": 0.0},
  //     "HST30": {"ZA": 0.0},
  //   },
  //   "penjelas": {"": ""},
  // },
  // {
  //   "id": 32,"id_MenuRawatan": "1","idKomoditi": 7,
  //   "idPerusahaan": 0,
  //   "kategoriProduk": 0,
  //   "satuan": "Kg/Ha",
  //   "jenisPemupukan": "Ningrat",
  //   "variabels": {
  //     "Const_Ng": ["Ningrat", 800.0, "kg/ha"],
  //     "Const_ZA": ["ZA", 300.0, "kg/ha"],
  //     "Const_Or": ["Petroganik", 2000.0, "kg/ha"],
  //   },
  //   "fieldValue": [],
  //   "takaran": {
  //     "dasar": {
  //       "Petroganik": "Const_Or / 1",
  //       "Ningrat": "Const_Ng / 2",
  //     },
  //     "susulan I (15 HST)": {
  //       "Ningrat": "Const_Ng / 4",
  //       "ZA": "Const_ZA / 3",
  //     },
  //     "susulan II (30 HST)": {
  //       "Ningrat": "Const_Ng / 4",
  //       "ZA": "Const_ZA / 1.5",
  //     },
  //   },
  //   "hasil": {
  //     "dasar": {
  //       "Petroganik": 0.0,
  //       "Ningrat": 0.0,
  //     },
  //     "susulan I (15 HST)": {
  //       "Ningrat": 0.0,
  //       "ZA": 0.0,
  //     },
  //     "susulan II (30 HST)": {
  //       "Ningrat": 0.0,
  //       "ZA": 0.0,
  //     },
  //   },
  //   "penjelas": {
  //     "Cara Aplikasi":
  //     "pupuk dibenamkan dalam tanah di sekeliling pohon atau sekitar tanaman."
  //   },
  // },
  // {
  //   "id": 34,"id_MenuRawatan": "1","idKomoditi": 7,
  //   "idPerusahaan": 0,
  //   "kategoriProduk": 0,
  //   "satuan": "Kg/Ha",
  //   "jenisPemupukan": "Majemuk",
  //   "variabels": {
  //     "Const_Ph": ["Phonska Plus", 800.0, "kg/ha"],
  //     "Const_ZA": ["ZA", 200.0, "kg/ha"],
  //   },
  //   "fieldValue": [],
  //   "takaran": {
  //     "dasar": {
  //       "Phonska Plus": "Const_Ph / 2",
  //     },
  //     "HST20": {
  //       "Phonska Plus": "Const_Ph / 2",
  //     },
  //     "HST40": {
  //       "ZA": "Const_ZA",
  //     }
  //   },
  //   "hasil": {
  //     "dasar": {"Phonska Plus": 0.0},
  //     "HST20": {"Phonska Plus": 0.0},
  //     "HST40": {"ZA": 0.0},
  //   },
  //   "penjelas": {"": ""},
  // },
  // {
  //   "id": 35,"id_MenuRawatan": "1","idKomoditi": 7,
  //   "idPerusahaan": 0,
  //   "kategoriProduk": 0,
  //   "satuan": "Kg/Ha",
  //   "jenisPemupukan": "Tunggal",
  //   "variabels": {
  //     "Const_ZA": ["ZA", 800.0, "kg/ha"],
  //     "Const_Sp": ["SP-36", 300.0, "kg/ha"],
  //     "Const_KCL": ["KCL", 200.0, "kg/ha"]
  //   },
  //   "fieldValue": [],
  //   "takaran": {
  //     "dasar": {
  //       "ZA": "Const_ZA / 4",
  //       "SP-36": "Const_Sp",
  //       "KCL": "Const_KCL",
  //     },
  //     "HST20": {
  //       "ZA": "Const_ZA - (Const_ZA / 4)",
  //     },
  //     "HST40": {
  //       "ZA": "Const_ZA - (Const_ZA / 4)",
  //     },
  //   },
  //   "hasil": {
  //     "dasar": {"ZA": 0.0, "SP-36": 0.0, "KCL": 0.0},
  //     "HST20": {"ZA": 0.0},
  //     "HST40": {"ZA": 0.0},
  //   },
  //   "penjelas": {"": ""},
  // },
  // {
  //   "id": 36,"id_MenuRawatan": "1","idKomoditi": 7,
  //   "idPerusahaan": 0,
  //   "kategoriProduk": 0,
  //   "satuan": "Kg/Ha",
  //   "jenisPemupukan": "Berimbang",
  //   "variabels": {
  //     "Const_Pet": ["Petroganik", 2000, "kg/ha"],
  //     "Const_Ph": ["Phonska Plus", 800.0, "kg/ha"],
  //     "Const_ZA": ["ZA", 200.0, "kg/ha"],
  //   },
  //   "fieldValue": [],
  //   "takaran": {
  //     "dasar": {
  //       "Petroganik": "Const_Pet",
  //       "Phonska Plus": "Const_Ph / 2",
  //     },
  //     "HST20": {
  //       "Phonska Plus": "Const_Ph / 2",
  //     },
  //     "HST40": {
  //       "ZA": "Const_ZA",
  //     }
  //   },
  //   "hasil": {
  //     "dasar": {"Petroganik": 0.0, "Phonska Plus": 0.0},
  //     "HST20": {"Phonska Plus": 0.0},
  //     "HST40": {"ZA": 0.0},
  //   },
  //   "penjelas": {"": ""},
  // },
  // {
  //   "id": 37,"id_MenuRawatan": "1","idKomoditi": 8,
  //   "idPerusahaan": 0,
  //   "kategoriProduk": 0,
  //   "satuan": "Kg/Ha",
  //   "jenisPemupukan": "Ningrat",
  //   "variabels": {
  //     "Const_Ng": ["Ningrat", 1300.0, "kg/ha"],
  //     "Const_Or": ["Petroganik", 1000.0, "kg/ha"],
  //   },
  //   "fieldValue": [],
  //   "takaran": {
  //     "dasar": {
  //       "Petroganik": "Const_Or / 1",
  //     },
  //     "Awal Musim Hujan": {
  //       "Ningrat": "Const_Ng / 2",
  //     },
  //     "Akhir Musim Hujan": {
  //       "Ningrat": "Const_Ng / 2",
  //     },
  //   },
  //   "hasil": {
  //     "dasar": {
  //       "Petroganik": 0.0,
  //     },
  //     "Awal Musim Hujan": {
  //       "Ningrat": 0.0,
  //     },
  //     "Akhir Musim Hujan": {
  //       "Ningrat": 0.0,
  //     },
  //   },
  //   "penjelas": {
  //     "Cara Aplikasi":
  //     "pupuk dibenamkan dalam tanah di sekeliling pohon atau sekitar tanaman."
  //   },
  // },
  // {
  //   "id": 38,"id_MenuRawatan": "1","idKomoditi": 8,
  //   "idPerusahaan": 0,
  //   "kategoriProduk": 0,
  //   "satuan": "gr/Pohon",
  //   "jenisPemupukan": "Majemuk",
  //   "variabels": {
  //     "Const_Ph": ["Phonska Plus", 1800.0, "gr/pohon"],
  //   },
  //   "fieldValue": [],
  //   "takaran": {
  //     "Setelah Rompes": {
  //       "Phonska Plus": "900.0",
  //     },
  //     "Saat Pembesaran Buah": {
  //       "Phonska Plus": "900.0",
  //     },
  //   },
  //   "hasil": {
  //     "Setelah Rompes": {"Phonska Plus": 0.0},
  //     "Saat Pembesaran Buah": {"Phonska Plus": 0.0},
  //   },
  //   "penjelas": {
  //     "*)":
  //     "Gram/pohon, pupuk diberikan dengan cara dibenamkan dalam alur mengelilingi batang tanaman "
  //   },
  // },
  // {
  //   "id": 39,"id_MenuRawatan": "1","idKomoditi": 8,
  //   "idPerusahaan": 0,
  //   "kategoriProduk": 0,
  //   "satuan": "gr/Pohon",
  //   "jenisPemupukan": "Tunggal",
  //   "variabels": {
  //     "Const_Ur": ["Urea", 300.0, "gr/pohon"],
  //     "Const_ZA": ["ZA", 650.0, "gr/pohon"],
  //     "Const_Sp": ["SP-36", 750.0, "gr/pohon"],
  //     "Const_KCL": ["KCL", 450.0, "gr/pohon"]
  //   },
  //   "fieldValue": [],
  //   "takaran": {
  //     "Setelah Rompes": {
  //       "Urea": "150",
  //       "ZA": "325",
  //       "SP-36": "375",
  //       "KCL": "225",
  //     },
  //     "Saat Pembesaran Buah": {
  //       "Urea": "150",
  //       "ZA": "325",
  //       "SP-36": "375",
  //       "KCL": "225",
  //     },
  //   },
  //   "hasil": {
  //     "Setelah Rompes": {"Urea": 0.0, "ZA": 0.0, "SP-36": 0.0, "KCL": 0.0},
  //     "Saat Pembesaran Buah": {"Urea": 0.0, "ZA": 0.0, "SP-36": 0.0, "KCL": 0.0},
  //   },
  //   "penjelas": {
  //     "*)":
  //     "Gram/pohon, pupuk diberikan dengan cara dibenamkan dalam alur mengelilingi batang tanaman "
  //   },
  // },
  // {
  //   "id": 40,"id_MenuRawatan": "1","idKomoditi": 8,
  //   "idPerusahaan": 0,
  //   "kategoriProduk": 0,
  //   "satuan": "gr/Pohon",
  //   "jenisPemupukan": "Berimbang",
  //   "variabels": {
  //     "Const_Pet": ["Petroganik", 3000, "gr/pohon"],
  //     "Const_Ph": ["Phonska Plus", 1800.0, "gr/pohon"],
  //   },
  //   "fieldValue": [],
  //   "takaran": {
  //     "Setelah Rompes": {
  //       "Petroganik": "3000",
  //       "Phonska Plus": "900",
  //     },
  //     "Saat Pembesaran Buah": {
  //       "Phonska Plus": "900",
  //     },
  //   },
  //   "hasil": {
  //     "Setelah Rompes": {"Petroganik": 0.0, "Phonska Plus": 0.0},
  //     "Saat Pembesaran Buah": {"Phonska Plus": 0.0},
  //   },
  //   "penjelas": {
  //     "*)":
  //     "Gram/pohon, pupuk diberikan dengan cara dibenamkan dalam alur mengelilingi batang tanaman "
  //   },
  // },
  // {
  //   "id": 41,"id_MenuRawatan": "1","idKomoditi": 9,
  //   "idPerusahaan": 0,
  //   "kategoriProduk": 0,
  //   "satuan": "Kg/Ha",
  //   "jenisPemupukan": "Ningrat",
  //   "variabels": {
  //     "Const_Ng": ["Ningrat", 600.0, "kg/ha"],
  //     "Const_ZA": ["ZA", 350.0, "kg/ha"],
  //     "Const_Or": ["Petroganik", 2000.0, "kg/ha"],
  //   },
  //   "fieldValue": [],
  //   "takaran": {
  //     "dasar": {
  //       "Petroganik": "Const_Or / 1",
  //       "Ningrat": "Const_Ng / 2",
  //     },
  //     "susulan I (15 HST)": {
  //       "Ningrat": "Const_Ng / 4",
  //       "ZA": "Const_ZA / 2.3333",
  //     },
  //     "susulan II (30 HST)": {
  //       "Ningrat": "Const_Ng / 4",
  //       "ZA": "Const_ZA / 1.75",
  //     },
  //   },
  //   "hasil": {
  //     "dasar": {
  //       "Petroganik": 0.0,
  //       "Ningrat": 0.0,
  //     },
  //     "susulan I (15 HST)": {
  //       "Ningrat": 0.0,
  //       "ZA": 0.0,
  //     },
  //     "susulan II (30 HST)": {
  //       "Ningrat": 0.0,
  //       "ZA": 0.0,
  //     },
  //   },
  //   "penjelas": {
  //     "Cara Aplikasi":
  //     "pupuk dibenamkan dalam tanah di sekeliling pohon atau sekitar tanaman."
  //   },
  // },
  // {
  //   "id": 42,"id_MenuRawatan": "1","idKomoditi": 9,
  //   "idPerusahaan": 0,
  //   "kategoriProduk": 0,
  //   "satuan": "Kg/Ha",
  //   "jenisPemupukan": "Majemuk",
  //   "variabels": {
  //     "Const_Ph": ["Phonska Plus", 800.0, "kg/ha"],
  //     "Const_ZA": ["ZA", 200.0, "kg/ha"],
  //   },
  //   "fieldValue": [],
  //   "takaran": {
  //     "dasar": {
  //       "Phonska Plus": "Const_Ph / 2",
  //     },
  //     "HST15": {
  //       "Phonska Plus": "Const_Ph / 2",
  //     },
  //     "HST30": {
  //       "ZA": "Const_ZA",
  //     }
  //   },
  //   "hasil": {
  //     "dasar": {"Phonska Plus": 0.0},
  //     "HST15": {"Phonska Plus": 0.0},
  //     "HST30": {"ZA": 0.0},
  //   },
  //   "penjelas": {"": ""},
  // },
  // {
  //   "id": 43,"id_MenuRawatan": "1","idKomoditi": 9,
  //   "idPerusahaan": 0,
  //   "kategoriProduk": 0,
  //   "satuan": "Kg/Ha",
  //   "jenisPemupukan": "Tunggal",
  //   "variabels": {
  //     "Const_Ur": ["Urea", 150.0, "kg/ha"],
  //     "Const_ZA": ["ZA", 400.0, "kg/ha"],
  //     "Const_Sp": ["SP-36", 300.0, "kg/ha"],
  //     "Const_KCL": ["KCL", 200.0, "kg/ha"]
  //   },
  //   "fieldValue": [],
  //   "takaran": {
  //     "dasar": {
  //       "Urea": "Const_Ur - (Const_Ur / 3)",
  //       "SP-36": "Const_Sp",
  //       "KCL": "Const_KCL",
  //     },
  //     "HST15": {
  //       "Urea": "Const_Ur / 3",
  //       "ZA": "Const_ZA - (Const_ZA / 1.6)",
  //     },
  //     "HST30": {
  //       "ZA": "Const_ZA / 1.6",
  //     },
  //   },
  //   "hasil": {
  //     "dasar": {"Urea": 0.0, "SP-36": 0.0, "KCL": 0.0},
  //     "HST15": {"Urea": 0.0, "ZA": 0.0},
  //     "HST30": {"ZA": 0.0},
  //   },
  //   "penjelas": {"": ""},
  // },
  // {
  //   "id": 44,"id_MenuRawatan": "1","idKomoditi": 9,
  //   "idPerusahaan": 0,
  //   "kategoriProduk": 0,
  //   "satuan": "Kg/Ha",
  //   "jenisPemupukan": "Berimbang",
  //   "variabels": {
  //     "Const_Pet": ["Petroganik", 2000, "kg/ha"],
  //     "Const_Ph": ["Phonska Plus", 800.0, "kg/ha"],
  //     "Const_ZA": ["ZA", 200.0, "kg/ha"],
  //   },
  //   "fieldValue": [],
  //   "takaran": {
  //     "dasar": {
  //       "Petroganik": "Const_Pet",
  //       "Phonska Plus": "Const_Ph / 2",
  //     },
  //     "HST15": {
  //       "Phonska Plus": "Const_Ph / 2",
  //     },
  //     "HST30": {
  //       "ZA": "Const_ZA",
  //     }
  //   },
  //   "hasil": {
  //     "dasar": {"Petroganik": 0.0, "Phonska Plus": 0.0},
  //     "HST15": {"Phonska Plus": 0.0},
  //     "HST30": {"ZA": 0.0},
  //   },
  //   "penjelas": {"": ""},
  // },
  // {
  //   "id": 45,"id_MenuRawatan": "1","idKomoditi": 10,
  //   "idPerusahaan": 0,
  //   "kategoriProduk": 0,
  //   "satuan": "Kg/Ha",
  //   "jenisPemupukan": "Ningrat",
  //   "variabels": {
  //     "Const_Ng": ["Ningrat", 3.0, "kg/ha"],
  //     "Const_ZA": ["ZA", 3.0, "kg/ha"],
  //     "Const_Or": ["Petroganik", 60.0, "kg/ha"],
  //   },
  //   "fieldValue": [],
  //   "takaran": {
  //     "dasar": {
  //       "Petroganik": "Const_Or / 3",
  //     },
  //     "Belum Menghasilkan": {
  //       "Ningrat": "1",
  //       "ZA": "1",
  //     },
  //     "Telah Menghasilkan": {
  //       "Ningrat": "2",
  //       "ZA": "2",
  //     },
  //   },
  //   "hasil": {
  //     "dasar": {
  //       "Petroganik": 0.0,
  //     },
  //     "Belum Menghasilkan": {
  //       "Ningrat": 0.0,
  //       "ZA": 0.0,
  //     },
  //     "Telah Menghasilkan": {
  //       "Ningrat": 0.0,
  //       "ZA": 0.0,
  //     },
  //   },
  //   "penjelas": {
  //     "Cara Aplikasi":
  //     "pupuk dibenamkan dalam tanah di sekeliling pohon atau sekitar tanaman."
  //   },
  // },
  // {
  //   "id": 46,"id_MenuRawatan": "1","idKomoditi": 11,
  //   "idPerusahaan": 0,
  //   "kategoriProduk": 0,
  //   "satuan": "Kg/Ha",
  //   "jenisPemupukan": "Ningrat",
  //   "variabels": {
  //     "Const_Ng": ["Ningrat", 3.0, "kg/ha"],
  //     "Const_ZA": ["ZA", 3.0, "kg/ha"],
  //     "Const_Or": ["Petroganik", 60.0, "kg/ha"],
  //   },
  //   "fieldValue": [],
  //   "takaran": {
  //     "dasar": {
  //       "Petroganik": "Const_Or / 3",
  //     },
  //     "Belum Menghasilkan": {
  //       "Ningrat": "Const_Ng /3",
  //       "ZA": "Const_ZA /3",
  //     },
  //     "Telah Menghasilkan": {
  //       "Ningrat": "Const_Ng /3",
  //       "ZA": "Const_ZA /1.5",
  //     },
  //   },
  //   "hasil": {
  //     "dasar": {
  //       "Petroganik": 0.0,
  //     },
  //     "Belum Menghasilkan": {
  //       "Ningrat": 0.0,
  //       "ZA": 0.0,
  //     },
  //     "Telah Menghasilkan": {
  //       "Ningrat": 0.0,
  //       "ZA": 0.0,
  //     },
  //   },
  //   "penjelas": {
  //     "Cara Aplikasi":
  //     "pupuk dibenamkan dalam tanah di sekeliling pohon atau sekitar tanaman."
  //   },
  // },
  // {
  //   "id": 47,"id_MenuRawatan": "1","idKomoditi": 12,
  //   "idPerusahaan": 0,
  //   "kategoriProduk": 0,
  //   "satuan": "gr/Pohon",
  //   "jenisPemupukan": "Ningrat",
  //   "variabels": {
  //     "Const_Ng": ["Ningrat", 1200.0, "kg/ha"],
  //     "Const_ZA": ["ZA", 150.0, "kg/ha"],
  //     "Const_Or": ["Petroganik", 3000.0, "kg/ha"],
  //   },
  //   "fieldValue": [],
  //   "takaran": {
  //     "Awal Musim Hujan": {
  //       "Petroganik": "Const_Or / 1",
  //       "Ningrat": "Const_Ng / 2",
  //       "ZA": "Const_ZA / 2",
  //     },
  //     "Akhir Musim Hujan": {
  //       "Ningrat": "Const_Ng / 2",
  //       "ZA": "Const_ZA / 2",
  //     },
  //   },
  //   "hasil": {
  //     "Awal Musim Hujan": {
  //       "Petroganik": 0.0,
  //       "Ningrat": 0.0,
  //       "ZA": 0.0,
  //     },
  //     "Akhir Musim Hujan": {
  //       "Ningrat": 0.0,
  //       "ZA": 0.0,
  //     },
  //   },
  //   "penjelas": {
  //     "Cara Aplikasi":
  //     "pupuk dibenamkan dalam tanah di sekeliling pohon atau sekitar tanaman."
  //   },
  // },
  // {
  //   "id": 48,"id_MenuRawatan": "1","idKomoditi": 12,
  //   "idPerusahaan": 0,
  //   "kategoriProduk": 0,
  //   "satuan": "gr/Pohon",
  //   "jenisPemupukan": "Nitrat",
  //   "variabels": {
  //     "Const_Nk": ["Nitrat", 1000.0, "gr/pohon"],
  //     "Const_Ki": ["Kieserit", 150.0, "gr/pohon"],
  //     "Const_Or": ["Petroganik", 3000.0, "gr/pohon"],
  //   },
  //   "fieldValue": [],
  //   "takaran": {
  //     "Awal musim hujan (Per Pohon)": {
  //       "Nitrat": "500",
  //       "Kieserit": "75",
  //       "Petroganik": "3000",
  //     },
  //     "Akhir musim hujan (Per Pohon)": {
  //       "Nitrat": "500",
  //       "Kieserit": "75",
  //     },
  //   },
  //   "hasil": {
  //     "Awal musim hujan (Per Pohon)": {
  //       "Nitrat": 500.0,
  //       "Kieserit": 75.0,
  //       "Petroganik": 3000.0,
  //     },
  //     "Akhir musim hujan (Per Pohon)": {
  //       "Nitrat": 500.0,
  //       "Kieserit": 75.0,
  //     },
  //   },
  //   "penjelas": {"Cara Aplikasi": "Ditebar / Dibenamkan"},
  // },
  // {
  //   "id": 49,"id_MenuRawatan": "1","idKomoditi": 12,
  //   "idPerusahaan": 0,
  //   "kategoriProduk": 0,
  //   "satuan": "gr/Pohon",
  //   "jenisPemupukan": "Majemuk",
  //   "variabels": {
  //     "Const_Ph": ["Phonska Plus", 1000.0, "gr/pohon"],
  //     "Const_Kies": ["Kieserit", 150.0, "gr/pohon"]
  //   },
  //   "fieldValue": [],
  //   "takaran": {
  //     "Awal Musim Hujan": {"Phonska Plus": "500", "Kieserit": "75"},
  //     "Akhir Musim Hujan": {"Phonska Plus": "500", "Kieserit": "75"},
  //   },
  //   "hasil": {
  //     "Awal Musim Hujan": {
  //       "Phonska Plus": 0.0,
  //       "Kieserit": 0.0,
  //     },
  //     "Akhir Musim Hujan": {
  //       "Phonska Plus": 0.0,
  //       "Kieserit": 0.0,
  //     },
  //   },
  //   "penjelas": {
  //     "*)":
  //     "Gram/pohon, pupuk diberikan dengan cara dibenamkan dalam alur mengelilingi batang tanaman "
  //   },
  // },
  // {
  //   "id": 50,"id_MenuRawatan": "1","idKomoditi": 12,
  //   "idPerusahaan": 0,
  //   "kategoriProduk": 0,
  //   "satuan": "gr/Pohon",
  //   "jenisPemupukan": "Tunggal",
  //   "variabels": {
  //     "Const_Ur": ["Urea", 150.0, "gr/pohon"],
  //     "Const_ZA": ["ZA", 350.0, "gr/pohon"],
  //     "Const_Sp": ["SP-36", 400.0, "gr/pohon"],
  //     "Const_KCL": ["KCL", 250.0, "gr/pohon"],
  //     "Const_Kies": ["Kieserit", 150.0, "gr/pohon"]
  //   },
  //   "fieldValue": [],
  //   "takaran": {
  //     "Awal Musim Hujan": {
  //       "Urea": "75",
  //       "ZA": "175",
  //       "SP-36": "200",
  //       "KCL": "125",
  //       "Kieserit": "75"
  //     },
  //     "Akhir Musim Hujan": {
  //       "Urea": "75",
  //       "ZA": "175",
  //       "SP-36": "200",
  //       "KCL": "125",
  //       "Kieserit": "75"
  //     },
  //   },
  //   "hasil": {
  //     "Awal Musim Hujan": {
  //       "Urea": 0.0,
  //       "ZA": 0.0,
  //       "SP-36": 0.0,
  //       "KCL": 0.0,
  //       "Kieserit": 0.0
  //     },
  //     "Akhir Musim Hujan": {
  //       "Urea": 0.0,
  //       "ZA": 0.0,
  //       "SP-36": 0.0,
  //       "KCL": 0.0,
  //       "Kieserit": 0.0
  //     },
  //   },
  //   "penjelas": {
  //     "*)":
  //     "Gram/pohon, pupuk diberikan dengan cara dibenamkan dalam alur mengelilingi batang tanaman "
  //   },
  // },
  // {
  //   "id": 51,"id_MenuRawatan": "1","idKomoditi": 13,
  //   "idPerusahaan": 0,
  //   "kategoriProduk": 0,
  //   "satuan": "Kg/Ha",
  //   "jenisPemupukan": "Ningrat",
  //   "variabels": {
  //     "Const_Ng": ["Ningrat", 1200.0, "kg/ha"],
  //     "Const_ZA": ["ZA", 150.0, "kg/ha"],
  //     "Const_Or": ["Petroganik", 3000.0, "kg/ha"],
  //   },
  //   "fieldValue": [],
  //   "takaran": {
  //     "Awal Musim Hujan": {
  //       "Petroganik": "Const_Or / 1",
  //       "Ningrat": "Const_Ng / 2",
  //       "ZA": "Const_ZA / 2",
  //     },
  //     "Akhir Musim Hujan": {
  //       "Ningrat": "Const_Ng / 2",
  //       "ZA": "Const_ZA / 2",
  //     },
  //   },
  //   "hasil": {
  //     "Awal Musim Hujan": {
  //       "Petroganik": 0.0,
  //       "Ningrat": 0.0,
  //       "ZA": 0.0,
  //     },
  //     "Akhir Musim Hujan": {
  //       "Ningrat": 0.0,
  //       "ZA": 0.0,
  //     },
  //   },
  //   "penjelas": {
  //     "Cara Aplikasi":
  //     "pupuk dibenamkan dalam tanah di sekeliling pohon atau sekitar tanaman."
  //   },
  // },
  // {
  //   "id": 52,"id_MenuRawatan": "1","idKomoditi": 13,
  //   "idPerusahaan": 0,
  //   "kategoriProduk": 0,
  //   "satuan": "Kg/Ha",
  //   "jenisPemupukan": "Berimbang",
  //   "variabels": {
  //     "Const_Nk": ["Nitrat", 1000.0, "kg/ha"],
  //     "Const_Ki": ["Kieserit", 150.0, "kg/ha"],
  //     "Const_Or": ["Petroganik", 3000.0, "kg/ha"],
  //   },
  //   "fieldValue": [],
  //   "takaran": {
  //     "Awal musim hujan (Per Pohon)": {
  //       "Nitrat": "500",
  //       "Kieserit": "75",
  //       "Petroganik": "3000",
  //     },
  //     "Akhir musim hujan (Per Pohon)": {
  //       "Nitrat": "500",
  //       "Kieserit": "75",
  //     },
  //   },
  //   "hasil": {
  //     "Awal musim hujan (Per Pohon)": {
  //       "Nitrat": 500.0,
  //       "Kieserit": 75.0,
  //       "Petroganik": 3000.0,
  //     },
  //     "Akhir musim hujan (Per Pohon)": {
  //       "Nitrat": 500.0,
  //       "Kieserit": 75.0,
  //     },
  //   },
  //   "penjelas": {"Cara Aplikasi": "Ditebar / Dibenamkan"},
  // },
  // {
  //   "id": 53,"id_MenuRawatan": "1","idKomoditi": 13,
  //   "idPerusahaan": 0,
  //   "kategoriProduk": 0,
  //   "satuan": "Kg/Ha",
  //   "jenisPemupukan": "Majemuk",
  //   "variabels": {
  //     "Const_Ph": ["Phonska Plus", 1100.0, "kg/ha"],
  //     "Const_Kies": ["Kieserit", 150.0, "kg/ha"]
  //   },
  //   "fieldValue": [],
  //   "takaran": {
  //     "Awal Musim Hujan": {
  //       "Phonska Plus": "Const_Ph/2",
  //       "Kieserit": "Const_Kies / 2"
  //     },
  //     "Akhir Musim Hujan": {
  //       "Phonska Plus": "Const_Ph/2",
  //       "Kieserit": "Const_Kies / 2"
  //     },
  //   },
  //   "hasil": {
  //     "Awal Musim Hujan": {
  //       "Phonska Plus": 0.0,
  //       "Kieserit": 0.0,
  //     },
  //     "Akhir Musim Hujan": {
  //       "Phonska Plus": 0.0,
  //       "Kieserit": 0.0,
  //     },
  //   },
  //   "penjelas": {
  //     "*)":
  //     "Gram/pohon, pupuk diberikan dengan cara dibenamkan dalam alur mengelilingi batang tanaman "
  //   },
  // },
  // {
  //   "id": 54,"id_MenuRawatan": "1","idKomoditi": 13,
  //   "idPerusahaan": 0,
  //   "kategoriProduk": 0,
  //   "satuan": "gr/Pohon",
  //   "jenisPemupukan": "Tunggal",
  //   "variabels": {
  //     "Const_Ur": ["Urea", 200.0, "gr/pohon"],
  //     "Const_ZA": ["ZA", 400.0, "gr/pohon"],
  //     "Const_Sp": ["SP-36", 450.0, "gr/pohon"],
  //     "Const_KCL": ["KCL", 275.0, "gr/pohon"],
  //     "Const_Kies": ["Kieserit", 175.0, "gr/pohon"]
  //   },
  //   "fieldValue": [],
  //   "takaran": {
  //     "Awal Musim Hujan": {
  //       "Urea": "100",
  //       "ZA": "200",
  //       "SP-36": "225",
  //       "KCL": "125",
  //       "Kieserit": "90"
  //     },
  //     "Akhir Musim Hujan": {
  //       "Urea": "100",
  //       "ZA": "200",
  //       "SP-36": "225",
  //       "KCL": "125",
  //       "Kieserit": "90",
  //       "Kieserit": "1.085"
  //     },
  //   },
  //   "hasil": {
  //     "Awal Musim Hujan": {
  //       "Urea": 0.0,
  //       "ZA": 0.0,
  //       "SP-36": 0.0,
  //       "KCL": 0.0,
  //       "Kieserit": 0.0
  //     },
  //     "Akhir Musim Hujan": {
  //       "Urea": 0.0,
  //       "ZA": 0.0,
  //       "SP-36": 0.0,
  //       "KCL": 0.0,
  //       "Kieserit": 0.0
  //     },
  //   },
  //   "penjelas": {
  //     "*)":
  //     "Gram/pohon, pupuk diberikan dengan cara dibenamkan dalam alur mengelilingi batang tanaman "
  //   },
  // },
  // {
  //   "id": 55,"id_MenuRawatan": "1","idKomoditi": 13,
  //   "idPerusahaan": 0,
  //   "kategoriProduk": 0,
  //   "satuan": "gr/Pohon",
  //   "jenisPemupukan": "Berimbang",
  //   "variabels": {
  //     "Const_Pet": ["Petroganik", 3000, "gr/pohon"],
  //     "Const_Ph": ["Phonska Plus", 1100.0, "gr/pohon"],
  //     "Const_Kies": ["Kieserit", 180.0, "gr/pohon"]
  //   },
  //   "fieldValue": [],
  //   "takaran": {
  //     "Awal Musim Hujan": {
  //       "Petroganik": "3000",
  //       "Phonska Plus": "550",
  //       "Kieserit": "90"
  //     },
  //     "Akhir Musim Hujan": {"Phonska Plus": "550", "Kieserit": "90"},
  //   },
  //   "hasil": {
  //     "Awal Musim Hujan": {
  //       "Petroganik": 0.0,
  //       "Phonska Plus": 0.0,
  //       "Kieserit": 0.0,
  //     },
  //     "Akhir Musim Hujan": {
  //       "Phonska Plus": 0.0,
  //       "Kieserit": 0.0,
  //     },
  //   },
  //   "penjelas": {
  //     "*)":
  //     "Gram/pohon, pupuk diberikan dengan cara dibenamkan dalam alur mengelilingi batang tanaman "
  //   },
  // },
  // {
  //   "id": 56,"id_MenuRawatan": "1","idKomoditi": 14,
  //   "idPerusahaan": 0,
  //   "kategoriProduk": 0,
  //   "satuan": "gr/Pohon",
  //   "jenisPemupukan": "Ningrat",
  //   "variabels": {
  //     "Const_Ng": ["Ningrat", 400.0, "kg/ha"],
  //     "Const_ZA": ["ZA", 200.0, "kg/ha"],
  //     "Const_Or": ["Petroganik", 2000.0, "kg/ha"],
  //   },
  //   "fieldValue": [],
  //   "takaran": {
  //     "dasar": {
  //       "Petroganik": "Const_Or / 1",
  //     },
  //     "Susulan (15 HST)": {
  //       "Ningrat": "Const_Ng / 2",
  //       "ZA": "Const_ZA / 2",
  //     },
  //     "Susulan (30 HST)": {
  //       "Ningrat": "Const_Ng / 2",
  //       "ZA": "Const_ZA / 2",
  //     },
  //   },
  //   "hasil": {
  //     "dasar": {
  //       "Petroganik": 0.0,
  //     },
  //     "Susulan (15 HST)": {
  //       "Ningrat": 0.0,
  //       "ZA": 0.0,
  //     },
  //     "Susulan (30 HST)": {
  //       "Ningrat": 0.0,
  //       "ZA": 0.0,
  //     },
  //   },
  //   "penjelas": {
  //     "Cara Aplikasi":
  //     "pupuk dibenamkan dalam tanah di sekeliling pohon atau sekitar tanaman."
  //   },
  // },
  // {
  //   "id": 57,"id_MenuRawatan": "1","idKomoditi": 14,
  //   "idPerusahaan": 0,
  //   "kategoriProduk": 0,
  //   "satuan": "kg/ha",
  //   "jenisPemupukan": "Majemuk",
  //   "variabels": {
  //     "Const_Ph": ["Phonska Plus", 1200.0, "kg/ha"],
  //     "Const_KCL": ["KCL", 200.0, "kg/ha"],
  //   },
  //   "fieldValue": [],
  //   "takaran": {
  //     "dasar": {
  //       "Phonska Plus": "Const_Ph/3",
  //       "KCL": "Const_KCL/2",
  //     },
  //     "1-8 MST": {
  //       "Phonska Plus": "Const_Ph / 1.5",
  //       "KCL": "Const_KCL/2",
  //     },
  //   },
  //   "hasil": {
  //     "dasar": {"Phonska Plus": 0.0, "KCL": 0.0},
  //     "1-8 MST": {"Phonska Plus": 0.0, "KCL": 0.0},
  //   },
  //   "penjelas": {
  //     "Sistem kocoran":
  //     "100-180 Gr/10 ltr untuk 10 tanaman setiap 3 hari sekali"
  //   },
  // },
  // {
  //   "id": 58,"id_MenuRawatan": "1","idKomoditi": 14,
  //   "idPerusahaan": 0,
  //   "kategoriProduk": 0,
  //   "satuan": "gr/Pohon",
  //   "jenisPemupukan": "Tunggal",
  //   "variabels": {
  //     "Const_ZA": ["ZA", 850.0, "kg/ha"],
  //     "Const_Sp": ["SP-36", 500.0, "kg/ha"],
  //     "Const_KCL": ["KCL", 500.0, "kg/ha"]
  //   },
  //   "fieldValue": [],
  //   "takaran": {
  //     "dasar": {
  //       "ZA": "Const_ZA / 2.8333333333",
  //       "SP-36": "Const_Sp",
  //       "KCL": "Const_KCL / 2.5",
  //     },
  //     "MST8": {
  //       "KCL": "Const_KCL - (Const_KCL / 2.5)",
  //       "ZA": "Const_ZA - (Const_ZA / 2.8333333333)",
  //     },
  //   },
  //   "hasil": {
  //     "dasar": {"ZA": 0.0, "SP-36": 0.0, "KCL": 0.0},
  //     "MST8": {"KCL": 0.0, "ZA": 0.0},
  //   },
  //   "penjelas": {"": ""},
  // },
  // {
  //   "id": 59,"id_MenuRawatan": "1","idKomoditi": 14,
  //   "idPerusahaan": 0,
  //   "kategoriProduk": 0,
  //   "satuan": "kg/ha",
  //   "jenisPemupukan": "Berimbang",
  //   "variabels": {
  //     "Const_Pet": ["Petroganik", 2000, "kg/ha"],
  //     "Const_Ph": ["Phonska Plus", 1200.0, "kg/ha"],
  //     "Const_ZK": ["ZK", 250.0, "kg/ha"],
  //   },
  //   "fieldValue": [],
  //   "takaran": {
  //     "dasar": {
  //       "Petroganik": "Const_Pet",
  //       "Phonska Plus": "Const_Ph/3",
  //       "ZK": "Const_ZK/2",
  //     },
  //     "1-8 MST": {
  //       "Phonska Plus": "Const_Ph / 1.5",
  //       "ZK": "Const_ZK/2",
  //     },
  //   },
  //   "hasil": {
  //     "dasar": {"Petroganik": 0.0, "Phonska Plus": 0.0, "ZK": 0.0},
  //     "1-8 MST": {"Phonska Plus": 0.0, "ZK": 0.0},
  //   },
  //   "penjelas": {
  //     "Sistem kocoran":
  //     "100-180 Gr/10 ltr untuk 10 tanaman setiap 3 hari sekali"
  //   },
  // },
  // {
  //   "id": 60,"id_MenuRawatan": "1","idKomoditi": 15,
  //   "idPerusahaan": 0,
  //   "kategoriProduk": 0,
  //   "satuan": "kg/ha",
  //   "jenisPemupukan": "Ningrat",
  //   "variabels": {
  //     "Const_Ng": ["Ningrat", 400.0, "kg/ha"],
  //     "Const_ZA": ["ZA", 200.0, "kg/ha"],
  //     "Const_Or": ["Petroganik", 2000.0, "kg/ha"],
  //   },
  //   "fieldValue": [],
  //   "takaran": {
  //     "dasar": {
  //       "Petroganik": "Const_Or / 1",
  //     },
  //     "Susulan (15 HST)": {
  //       "Ningrat": "Const_Ng / 2",
  //       "ZA": "Const_ZA / 2",
  //     },
  //     "Susulan (30 HST)": {
  //       "Ningrat": "Const_Ng / 2",
  //       "ZA": "Const_ZA / 2",
  //     },
  //   },
  //   "hasil": {
  //     "dasar": {
  //       "Petroganik": 0.0,
  //     },
  //     "Susulan (15 HST)": {
  //       "Ningrat": 0.0,
  //       "ZA": 0.0,
  //     },
  //     "Susulan (30 HST)": {
  //       "Ningrat": 0.0,
  //       "ZA": 0.0,
  //     },
  //   },
  //   "penjelas": {
  //     "Cara Aplikasi":
  //     "pupuk dibenamkan dalam tanah di sekeliling pohon atau sekitar tanaman."
  //   },
  // },
  // {
  //   "id": 61,"id_MenuRawatan": "1","idKomoditi": 15,
  //   "idPerusahaan": 0,
  //   "kategoriProduk": 0,
  //   "satuan": "kg/ha",
  //   "jenisPemupukan": "Majemuk",
  //   "variabels": {
  //     "Const_Ph": ["Phonska Plus", 1200.0, "kg/ha"],
  //     "Const_KCL": ["KCL", 200.0, "kg/ha"],
  //   },
  //   "fieldValue": [],
  //   "takaran": {
  //     "dasar": {
  //       "Phonska Plus": "Const_Ph/3",
  //       "KCL": "Const_KCL/2",
  //     },
  //     "1-8 MST": {
  //       "Phonska Plus": "Const_Ph / 1.5",
  //       "KCL": "Const_KCL/2",
  //     },
  //   },
  //   "hasil": {
  //     "dasar": {"Phonska Plus": 0.0, "KCL": 0.0},
  //     "1-8 MST": {"Phonska Plus": 0.0, "KCL": 0.0},
  //   },
  //   "penjelas": {
  //     "Sistem kocoran":
  //     "100-180 Gr/10 ltr untuk 10 tanaman setiap 3 hari sekali"
  //   },
  // },
  // {
  //   "id": 62,"id_MenuRawatan": "1","idKomoditi": 15,
  //   "idPerusahaan": 0,
  //   "kategoriProduk": 0,
  //   "satuan": "kg/ha",
  //   "jenisPemupukan": "Tunggal",
  //   "variabels": {
  //     "Const_ZA": ["ZA", 850.0, "kg/ha"],
  //     "Const_Sp": ["SP-36", 500.0, "kg/ha"],
  //     "Const_KCL": ["KCL", 500.0, "kg/ha"]
  //   },
  //   "fieldValue": [],
  //   "takaran": {
  //     "dasar": {
  //       "ZA": "Const_ZA / 2.8333333333",
  //       "SP-36": "Const_Sp",
  //       "KCL": "Const_KCL / 2.5",
  //     },
  //     "MST8": {
  //       "KCL": "Const_KCL - (Const_KCL / 2.5)",
  //       "ZA": "Const_ZA - (Const_ZA / 2.8333333333)",
  //     },
  //   },
  //   "hasil": {
  //     "dasar": {"ZA": 0.0, "SP-36": 0.0, "KCL": 0.0},
  //     "MST8": {"KCL": 0.0, "ZA": 0.0},
  //   },
  //   "penjelas": {"": ""},
  // },
  // {
  //   "id": 63,"id_MenuRawatan": "1","idKomoditi": 15,
  //   "idPerusahaan": 0,
  //   "kategoriProduk": 0,
  //   "satuan": "kg/ha",
  //   "jenisPemupukan": "Berimbang",
  //   "variabels": {
  //     "Const_Pet": ["Petroganik", 2000, "kg/ha"],
  //     "Const_Ph": ["Phonska Plus", 1200.0, "kg/ha"],
  //     "Const_ZK": ["ZK", 250.0, "kg/ha"],
  //   },
  //   "fieldValue": [],
  //   "takaran": {
  //     "dasar": {
  //       "Petroganik": "Const_Pet",
  //       "Phonska Plus": "Const_Ph/3",
  //       "ZK": "Const_ZK/2",
  //     },
  //     "1-8 MST": {
  //       "Phonska Plus": "Const_Ph / 1.5",
  //       "ZK": "Const_ZK/2",
  //     },
  //   },
  //   "hasil": {
  //     "dasar": {"Petroganik": 0.0, "Phonska Plus": 0.0, "ZK": 0.0},
  //     "1-8 MST": {"Phonska Plus": 0.0, "ZK": 0.0},
  //   },
  //   "penjelas": {
  //     "Sistem kocoran":
  //     "100-180 Gr/10 ltr untuk 10 tanaman setiap 3 hari sekali"
  //   },
  // },
  // {
  //   "id": 64,"id_MenuRawatan": "1","idKomoditi": 16,
  //   "idPerusahaan": 0,
  //   "kategoriProduk": 0,
  //   "satuan": "Kg/Ha",
  //   "jenisPemupukan": "Nitrat",
  //   "variabels": {
  //     "Const_Nk": ["Nitrat", 700.0, "kg/ha"],
  //     "Const_ZA": ["ZA", 150.0, "kg/ha"],
  //     "Const_ZK": ["ZK", 100.0, "kg/ha"],
  //     "Const_Or": ["Petroganik", 2000.0, "kg/ha"],
  //   },
  //   "fieldValue": [],
  //   "takaran": {
  //     "dasar": {
  //       "Nitrat": "Const_Nk / 2",
  //       "ZK": "Const_ZK / 2",
  //       "Petroganik": "Const_Or / 1",
  //     },
  //     "susulan I (15 - 20 HST)": {
  //       "Nitrat": "Const_Nk / 2",
  //       "ZA": "Const_ZA / 2",
  //       "ZK": "Const_ZK / 4",
  //     },
  //     "susulan II (30 - 40 HST)": {
  //       "ZA": "Const_ZA / 2",
  //       "ZK": "Const_ZK / 4",
  //     },
  //   },
  //   "hasil": {
  //     "dasar": {
  //       "Nitrat": 350.0,
  //       "ZK": 50.0,
  //       "Petroganik": 2000.0,
  //     },
  //     "susulan I (15 - 20 HST)": {
  //       "Nitrat": 350.0,
  //       "ZA": 75.0,
  //       "ZK": 25.0,
  //     },
  //     "susulan II (30 - 40 HST)": {
  //       "ZA": 75.0,
  //       "ZK": 25.0,
  //     },
  //   },
  //   "penjelas": {"Cara Aplikasi": "Ditebar / Dibenamkan"},
  // },
  // {
  //   "id": 65,"id_MenuRawatan": "1","idKomoditi": 16,
  //   "idPerusahaan": 0,
  //   "kategoriProduk": 0,
  //   "satuan": "Kg/Ha",
  //   "jenisPemupukan": "Majemuk",
  //   "variabels": {
  //     "Const_Ph": ["Phonska Plus", 700.0, "kg/ha"],
  //     "Const_ZA": ["ZA", 150.0, "kg/ha"],
  //   },
  //   "fieldValue": [],
  //   "takaran": {
  //     "dasar": {
  //       "Phonska Plus": "Const_Ph - Const_Ph / 7",
  //     },
  //     "HST15": {
  //       "Phonska Plus": "Const_Ph - Const_Ph / 7",
  //     },
  //     "HST30": {
  //       "Phonska Plus": "Const_Ph - Const_Ph / 7",
  //       "ZA": "Const_ZA",
  //     }
  //   },
  //   "hasil": {
  //     "dasar": {"Phonska Plus": 0.0},
  //     "HST15": {"Phonska Plus": 0.0},
  //     "HST30": {"Phonska Plus": 0.0, "ZA": 0.0},
  //   },
  //   "penjelas": {"": ""},
  // },
  // {
  //   "id": 66,"id_MenuRawatan": "1","idKomoditi": 16,
  //   "idPerusahaan": 0,
  //   "kategoriProduk": 0,
  //   "satuan": "Kg/Ha",
  //   "jenisPemupukan": "Tunggal",
  //   "variabels": {
  //     "Const_Ur": ["Urea", 150.0, "kg/ha"],
  //     "Const_ZA": ["ZA", 300.0, "kg/ha"],
  //     "Const_Sp": ["SP-36", 300.0, "kg/ha"],
  //     "Const_KCL": ["KCL", 175.0, "kg/ha"]
  //   },
  //   "fieldValue": [],
  //   "takaran": {
  //     "dasar": {
  //       "Urea": "Const_Ur - (Const_Ur / 3)",
  //       "SP-36": "Const_Sp",
  //       "KCL": "Const_KCL",
  //     },
  //     "HST15": {
  //       "Urea": "Const_Ur / 3",
  //       "ZA": "Const_ZA / 3",
  //     },
  //     "HST30": {
  //       "ZA": "Const_ZA - (Const_ZA / 3)",
  //     },
  //   },
  //   "hasil": {
  //     "dasar": {"Urea": 0.0, "SP-36": 0.0, "KCL": 0.0},
  //     "HST15": {"Urea": 0.0, "ZA": 0.0},
  //     "HST30": {"ZA": 0.0},
  //   },
  //   "penjelas": {"": ""},
  // },
  // {
  //   "id": 67,"id_MenuRawatan": "1","idKomoditi": 16,
  //   "idPerusahaan": 0,
  //   "kategoriProduk": 0,
  //   "satuan": "Kg/Ha",
  //   "jenisPemupukan": "Berimbang",
  //   "variabels": {
  //     "Const_Pet": ["Petroganik", 2000, "kg/ha"],
  //     "Const_Ph": ["Phonska Plus", 700.0, "kg/ha"],
  //     "Const_ZA": ["ZA", 150.0, "kg/ha"],
  //   },
  //   "fieldValue": [],
  //   "takaran": {
  //     "dasar": {
  //       "Petroganik": "Const_Pet",
  //       "Phonska Plus": "Const_Ph - Const_Ph / 7",
  //     },
  //     "HST15": {
  //       "Phonska Plus": "Const_Ph - Const_Ph / 7",
  //     },
  //     "HST30": {
  //       "Phonska Plus": "Const_Ph - Const_Ph / 7",
  //       "ZA": "Const_ZA",
  //     }
  //   },
  //   "hasil": {
  //     "dasar": {"Petroganik": 0.0, "Phonska Plus": 0.0},
  //     "HST15": {"Phonska Plus": 0.0},
  //     "HST30": {"Phonska Plus": 0.0, "ZA": 0.0},
  //   },
  //   "penjelas": {"": ""},
  // },
  // {
  //   "id": 68,"id_MenuRawatan": "1","idKomoditi": 17,
  //   "idPerusahaan": 0,
  //   "kategoriProduk": 0,
  //   "satuan": "kg/ha",
  //   "jenisPemupukan": "Nitrat",
  //   "variabels": {
  //     "Const_Nk": ["Nitrat", 450.0, "kg/ha"],
  //     "Const_ZA": ["ZA", 300.0, "kg/ha"],
  //     "Const_ZK": ["ZK", 100.0, "kg/ha"],
  //     "Const_Or": ["Petroganik", 2000.0, "kg/ha"],
  //   },
  //   "fieldValue": [],
  //   "takaran": {
  //     "dasar": {
  //       "Nitrat": "Const_Nk / 3",
  //       "ZK": "Const_ZK / 2",
  //       "ZA": "Const_ZA / 6",
  //       "Petroganik": "Const_Or / 1",
  //     },
  //     "susulan I (15 - 20 HST)": {
  //       "Nitrat": "Const_Nk / 3",
  //       "ZA": "Const_ZA / 6",
  //       "ZK": "Const_ZK / 2",
  //     },
  //     "susulan II (30 - 40 HST)": {
  //       "Nitrat": "Const_Nk / 3",
  //       "ZA": "Const_ZA / 1.5",
  //     },
  //   },
  //   "hasil": {
  //     "dasar": {
  //       "Nitrat": 150.0,
  //       "ZK": 50.0,
  //       "ZA": 50.0,
  //       "Petroganik": 2000.0,
  //     },
  //     "susulan I (15 - 20 HST)": {
  //       "Nitrat": 150.0,
  //       "ZA": 50.0,
  //       "ZK": 50.0,
  //     },
  //     "susulan II (30 - 40 HST)": {
  //       "Nitrat": 150.0,
  //       "ZA": 200.0,
  //     },
  //   },
  //   "penjelas": {"Cara Aplikasi": "Ditebar / Dibenamkan"},
  // },
  // {
  //   "id": 69,"id_MenuRawatan": "1","idKomoditi": 17,
  //   "idPerusahaan": 1,
  //   "kategoriProduk": 0,
  //   "satuan": "Kg/Ha",
  //   "jenisPemupukan": "Meroke Hortikultura",
  //   "variabels": {
  //     "Const_Mn": ["Mutiara NPK", 50.0, "kg/ha"],
  //     "Const_Ss": ["SS (AMMOPHOS)", 50.0, "kg/ha"],
  //     "Const_Kp": ["KARATE PLUS BORONI", 50.0, "kg/ha"],
  //     "Const_Mg": ["Mutiara Grower", 100.0, "kg/ha"],
  //     "Const_Sb": ["SUBURKALI BUTIR", 50.0, "kg/ha"],
  //   },
  //   "fieldValue": [],
  //   "takaran": {
  //     "dasar": {
  //       "Mutiara NPK": "Const_Mn",
  //       "SS (AMMOPHOS)": "Const_Ss",
  //     },
  //     "HST45": {
  //       "Mutiara Grower": "Const_Mg",
  //       "KARATE PLUS BORONI": "Const_Kp",
  //       "SUBURKALI BUTIR": "Const_Sb",
  //     },
  //   },
  //   "hasil": {
  //     "dasar": {"Mutiara NPK": 50.0, "SS (AMMOPHOS)": 50.0},
  //     "HST45": {
  //       "Mutiara Grower": 50.0,
  //       "KARATE PLUS BORONI": 50.0,
  //       "SUBURKALI BUTIR": 50.0
  //     },
  //   },
  //   "penjelas": {"": ""},
  // },
  // {
  //   "id": 70,"id_MenuRawatan": "1","idKomoditi": 17,
  //   "idPerusahaan": 0,
  //   "kategoriProduk": 0,
  //   "satuan": "Kg/Ha",
  //   "jenisPemupukan": "Majemuk",
  //   "variabels": {
  //     "Const_Ph": ["Phonska Plus", 400.0, "kg/ha", "kg/ha"],
  //     "Const_ZA": ["ZA", 300.0, "kg/ha", "kg/ha"],
  //   },
  //   "fieldValue": [],
  //   "takaran": {
  //     "dasar": {
  //       "Phonska Plus": "Const_Ph / 2",
  //       "ZA": "Const_ZA / 6",
  //     },
  //     "HST15": {
  //       "Phonska Plus": "Const_Ph / 2",
  //       "ZA": "Const_ZA / 6",
  //     },
  //     "HST30": {
  //       "ZA": "Const_ZA - Const_ZA / 3",
  //     }
  //   },
  //   "hasil": {
  //     "dasar": {"Phonska Plus": 0.0, "ZA": 0.0},
  //     "HST15": {"Phonska Plus": 0.0, "ZA": 0.0},
  //     "HST30": {"ZA": 0.0},
  //   },
  //   "penjelas": {"": ""},
  // },
  // {
  //   "id": 71,"id_MenuRawatan": "1","idKomoditi": 17,
  //   "idPerusahaan": 0,
  //   "kategoriProduk": 0,
  //   "satuan": "Kg/Ha",
  //   "jenisPemupukan": "Tunggal",
  //   "variabels": {
  //     "Const_ZA": ["ZA", 600.0, "kg/ha"],
  //     "Const_Sp": ["SP-36", 150.0, "kg/ha"],
  //     "Const_KCL": ["KCL", 100.0, "kg/ha"]
  //   },
  //   "fieldValue": [],
  //   "takaran": {
  //     "dasar": {
  //       "ZA": "Const_ZA - (Const_ZA / 2.4)",
  //       "SP-36": "Const_Sp",
  //       "KCL": "Const_KCL / 2",
  //     },
  //     "HST15": {
  //       "KCL": "Const_KCL / 2",
  //       "ZA": "Const_ZA / 2.4",
  //     },
  //     "HST30": {
  //       "ZA": "Const_ZA / 2.4",
  //     },
  //   },
  //   "hasil": {
  //     "dasar": {"ZA": 0.0, "SP-36": 0.0, "KCL": 0.0},
  //     "HST15": {"KCL": 0.0, "ZA": 0.0},
  //     "HST30": {"ZA": 0.0},
  //   },
  //   "penjelas": {"": ""},
  // },
  // {
  //   "id": 72,"id_MenuRawatan": "1","idKomoditi": 17,
  //   "idPerusahaan": 0,
  //   "kategoriProduk": 0,
  //   "satuan": "Kg/Ha",
  //   "jenisPemupukan": "Berimbang",
  //   "variabels": {
  //     "Const_Pet": ["Petroganik", 2000, "kg/ha"],
  //     "Const_Ph": ["Phonska Plus", 400.0, "kg/ha"],
  //     "Const_ZA": ["ZA", 300.0, "kg/ha"],
  //   },
  //   "fieldValue": [],
  //   "takaran": {
  //     "dasar": {
  //       "Petroganik": "Const_Pet",
  //       "Phonska Plus": "Const_Ph / 2",
  //       "ZA": "Const_ZA / 6",
  //     },
  //     "HST15": {
  //       "Phonska Plus": "Const_Ph / 2",
  //       "ZA": "Const_ZA / 6",
  //     },
  //     "HST30": {
  //       "ZA": "Const_ZA - Const_ZA / 3",
  //     }
  //   },
  //   "hasil": {
  //     "dasar": {"Petroganik": 0.0, "Phonska Plus": 0.0, "ZA": 0.0},
  //     "HST15": {"Phonska Plus": 0.0, "ZA": 0.0},
  //     "HST30": {"ZA": 0.0},
  //   },
  //   "penjelas": {"": ""},
  // },
  // {
  //   "id": 73,"id_MenuRawatan": "1","idKomoditi": 18,
  //   "idPerusahaan": 0,
  //   "kategoriProduk": 0,
  //   "satuan": "Kg/Ha",
  //   "jenisPemupukan": "Nitrat",
  //   "variabels": {
  //     "Const_Nk": ["Nitrat", 450.0, "kg/ha"],
  //     "Const_ZA": ["ZA", 300.0, "kg/ha"],
  //     "Const_ZK": ["ZK", 100.0, "kg/ha"],
  //     "Const_Or": ["Petroganik", 2000.0, "kg/ha"],
  //   },
  //   "fieldValue": [],
  //   "takaran": {
  //     "dasar": {
  //       "Nitrat": "Const_Nk / 3",
  //       "ZK": "Const_ZK / 2",
  //       "ZA": "Const_ZA / 6",
  //       "Petroganik": "Const_Or / 1",
  //     },
  //     "susulan I (15 - 20 HST)": {
  //       "Nitrat": "Const_Nk / 3",
  //       "ZA": "Const_ZA / 6",
  //       "ZK": "Const_ZK / 2",
  //     },
  //     "susulan II (30 - 40 HST)": {
  //       "Nitrat": "Const_Nk / 3",
  //       "ZA": "Const_ZA / 1.5",
  //     },
  //   },
  //   "hasil": {
  //     "dasar": {
  //       "Nitrat": 150.0,
  //       "ZK": 50.0,
  //       "ZA": 50.0,
  //       "Petroganik": 2000.0,
  //     },
  //     "susulan I (15 - 20 HST)": {
  //       "Nitrat": 150.0,
  //       "ZA": 50.0,
  //       "ZK": 50.0,
  //     },
  //     "susulan II (30 - 40 HST)": {
  //       "Nitrat": 150.0,
  //       "ZA": 200.0,
  //     },
  //   },
  //   "penjelas": {"Cara Aplikasi": "Ditebar / Dibenamkan"},
  // },
  // {
  //   "id": 74,"id_MenuRawatan": "1","idKomoditi": 18,
  //   "idPerusahaan": 0,
  //   "kategoriProduk": 0,
  //   "satuan": "Kg/Ha",
  //   "jenisPemupukan": "Niphos",
  //   "variabels": {
  //     "Const_Or": ["Petroganik", 2000.0, "kg/ha"],
  //     "Const_Np": ["Niphos", 700.0, "kg/ha"]
  //   },
  //   "fieldValue": [],
  //   "takaran": {
  //     "dasar": {
  //       "Petroganik": "Const_Or / 1",
  //       "Niphos": "Const_Np / 2.333333333333333",
  //     },
  //     "susulan I (15 HST)": {
  //       "Niphos": "Const_Np / 3.5",
  //     },
  //     "susulan II (30 HST)": {
  //       "Niphos": "Const_Np / 3.5",
  //     },
  //   },
  //   "hasil": {
  //     "dasar": {
  //       "Petroganik": 2000.0,
  //       "Niphos": 300.0,
  //     },
  //     "susulan I (15 HST)": {
  //       "Niphos": 200.0,
  //     },
  //     "susulan II (30 HST)": {
  //       "Niphos": 200.0,
  //     },
  //   },
  //   "penjelas": {"Cara Aplikasi": "Ditabur / dibenamkan"},
  // },
  // {
  //   "id": 75,"id_MenuRawatan": "1","idKomoditi": 18,
  //   "idPerusahaan": 0,
  //   "kategoriProduk": 0,
  //   "satuan": "Kg/Ha",
  //   "jenisPemupukan": "Meroke Hortikultura",
  //   "variabels": {
  //     "Const_Mn": ["Mutiara NPK", 100.0, "kg/ha"],
  //     "Const_Kp": ["KARATE PLUS BORONI", 300.0, "kg/ha"],
  //     "Const_Mg": ["Mutiara Grower", 400.0, "kg/ha"],
  //   },
  //   "fieldValue": [],
  //   "takaran": {
  //     "dasar": {
  //       "Mutiara NPK": "Const_Mn",
  //       "KARATE PLUS BORONI": "Const_Kp",
  //     },
  //     "HST25": {
  //       "Mutiara Grower": "Const_Mg/2",
  //       "KARATE PLUS BORONI": "Const_Kp/3",
  //     },
  //     "HST45": {
  //       "Mutiara Grower": "Const_Mg/2",
  //       "KARATE PLUS BORONI": "Const_Kp/3",
  //     },
  //   },
  //   "hasil": {
  //     "dasar": {"Mutiara NPK": 100.0, "KARATE PLUS BORONI": 100},
  //     "HST25": {"Mutiara Grower": 200.0, "KARATE PLUS BORONI": 100.0},
  //     "HST45": {"Mutiara Grower": 200.0, "KARATE PLUS BORONI": 100.0},
  //   },
  //   "penjelas": {"": ""},
  // },
  // {
  //   "id": 76,"id_MenuRawatan": "1","idKomoditi": 18,
  //   "idPerusahaan": 0,
  //   "kategoriProduk": 0,
  //   "satuan": "Kg/Ha",
  //   "jenisPemupukan": "Majemuk",
  //   "variabels": {
  //     "Const_Ph": ["Phonska Plus", 400.0, "kg/ha"],
  //     "Const_ZA": ["ZA", 300.0, "kg/ha"],
  //   },
  //   "fieldValue": [],
  //   "takaran": {
  //     "dasar": {
  //       "Phonska Plus": "Const_Ph / 2",
  //       "ZA": "Const_ZA / 6",
  //     },
  //     "HST15": {
  //       "Phonska Plus": "Const_Ph / 2",
  //       "ZA": "Const_ZA / 6",
  //     },
  //     "HST30": {
  //       "ZA": "Const_ZA - Const_ZA / 3",
  //     }
  //   },
  //   "hasil": {
  //     "dasar": {"Phonska Plus": 0.0, "ZA": 0.0},
  //     "HST15": {"Phonska Plus": 0.0, "ZA": 0.0},
  //     "HST30": {"ZA": 0.0},
  //   },
  //   "penjelas": {"": ""},
  // },
  // {
  //   "id": 77,"id_MenuRawatan": "1","idKomoditi": 18,
  //   "idPerusahaan": 0,
  //   "kategoriProduk": 0,
  //   "satuan": "Kg/Ha",
  //   "jenisPemupukan": "Tunggal",
  //   "variabels": {
  //     "Const_Ur": ["Urea", 100.0, "kg/ha"],
  //     "Const_ZA": ["ZA", 350.0, "kg/ha"],
  //     "Const_Sp": ["SP-36", 150.0, "kg/ha"],
  //     "Const_KCL": ["KCL", 100.0, "kg/ha"]
  //   },
  //   "fieldValue": [],
  //   "takaran": {
  //     "dasar": {
  //       "Urea": "Const_Ur - (Const_Ur / 4)",
  //       "SP-36": "Const_Sp",
  //       "KCL": "Const_KCL",
  //     },
  //     "HST15": {
  //       "Urea": "Const_Ur / 4",
  //       "ZA": "Const_ZA - (Const_ZA / 1.75)",
  //     },
  //     "HST30": {
  //       "ZA": "Const_ZA / 1.75",
  //     },
  //   },
  //   "hasil": {
  //     "dasar": {"Urea": 0.0, "SP-36": 0.0, "KCL": 0.0},
  //     "HST15": {"Urea": 0.0, "ZA": 0.0},
  //     "HST30": {"ZA": 0.0},
  //   },
  //   "penjelas": {"": ""},
  // },
  // {
  //   "id": 78,"id_MenuRawatan": "1","idKomoditi": 18,
  //   "idPerusahaan": 0,
  //   "kategoriProduk": 0,
  //   "satuan": "Kg/Ha",
  //   "jenisPemupukan": "Berimbang",
  //   "variabels": {
  //     "Const_Pet": ["Petroganik", 2000, "kg/ha"],
  //     "Const_Ph": ["Phonska Plus", 400.0, "kg/ha"],
  //     "Const_ZA": ["ZA", 300.0, "kg/ha"],
  //   },
  //   "fieldValue": [],
  //   "takaran": {
  //     "dasar": {
  //       "Petroganik": "Const_Pet",
  //       "Phonska Plus": "Const_Ph / 2",
  //       "ZA": "Const_ZA / 6",
  //     },
  //     "HST15": {
  //       "Phonska Plus": "Const_Ph / 2",
  //       "ZA": "Const_ZA / 6",
  //     },
  //     "HST30": {
  //       "ZA": "Const_ZA - Const_ZA / 3",
  //     }
  //   },
  //   "hasil": {
  //     "dasar": {"Petroganik": 0.0, "Phonska Plus": 0.0, "ZA": 0.0},
  //     "HST15": {"Phonska Plus": 0.0, "ZA": 0.0},
  //     "HST30": {"ZA": 0.0},
  //   },
  //   "penjelas": {"": ""},
  // },
  // {
  //   "id": 79,"id_MenuRawatan": "1","idKomoditi": 19,
  //   "idPerusahaan": 0,
  //   "kategoriProduk": 0,
  //   "satuan": "Kg/Ha",
  //   "jenisPemupukan": "Nitrat",
  //   "variabels": {
  //     "Const_Nk": ["Nitrat", 450.0, "kg/ha"],
  //     "Const_ZA": ["ZA", 300.0, "kg/ha"],
  //     "Const_ZK": ["ZK", 100.0, "kg/ha"],
  //     "Const_Or": ["Petroganik", 2000.0, "kg/ha"],
  //   },
  //   "fieldValue": [],
  //   "takaran": {
  //     "dasar": {
  //       "Nitrat": "Const_Nk / 3",
  //       "ZK": "Const_ZK / 2",
  //       "ZA": "Const_ZA / 6",
  //       "Petroganik": "Const_Or / 1",
  //     },
  //     "susulan I (15 - 20 HST)": {
  //       "Nitrat": "Const_Nk / 3",
  //       "ZA": "Const_ZA / 6",
  //       "ZK": "Const_ZK / 2",
  //     },
  //     "susulan II (30 - 40 HST)": {
  //       "Nitrat": "Const_Nk / 3",
  //       "ZA": "Const_ZA / 1.5",
  //     },
  //   },
  //   "hasil": {
  //     "dasar": {
  //       "Nitrat": 150.0,
  //       "ZK": 50.0,
  //       "ZA": 50.0,
  //       "Petroganik": 2000.0,
  //     },
  //     "susulan I (15 - 20 HST)": {
  //       "Nitrat": 150.0,
  //       "ZA": 50.0,
  //       "ZK": 50.0,
  //     },
  //     "susulan II (30 - 40 HST)": {
  //       "Nitrat": 150.0,
  //       "ZA": 200.0,
  //     },
  //   },
  //   "penjelas": {"Cara Aplikasi": "Ditebar / Dibenamkan"},
  // },
  // {
  //   "id": 80,"id_MenuRawatan": "1","idKomoditi": 19,
  //   "idPerusahaan": 0,
  //   "kategoriProduk": 0,
  //   "satuan": "Kg/Ha",
  //   "jenisPemupukan": "Niphos",
  //   "variabels": {
  //     "Const_Or": ["Petroganik", 1500.0, "kg/ha"],
  //     "Const_Np": ["Niphos", 600.0, "kg/ha"]
  //   },
  //   "fieldValue": [],
  //   "takaran": {
  //     "dasar": {
  //       "Petroganik": "Const_Or / 1",
  //       "Niphos": "Const_Np / 2",
  //     },
  //     "susulan I (20 HST)": {
  //       "Niphos": "Const_Np / 2",
  //     },
  //   },
  //   "hasil": {
  //     "dasar": {
  //       "Petroganik": 1500.0,
  //       "Niphos": 300.0,
  //     },
  //     "susulan I (20 HST)": {
  //       "Niphos": 300.0,
  //     },
  //   },
  //   "penjelas": {"Cara Aplikasi": "Ditabur / dibenamkan"},
  // },
  // {
  //   "id": 81,"id_MenuRawatan": "1","idKomoditi": 20,
  //   "idPerusahaan": 0,
  //   "kategoriProduk": 0,
  //   "satuan": "Kg/Ha",
  //   "jenisPemupukan": "Nitrat",
  //   "variabels": {
  //     "Const_Nk": ["Nitrat", 450.0, "kg/ha"],
  //     "Const_ZK": ["ZK", 100.0, "kg/ha"],
  //     "Const_Or": ["Petroganik", 2000.0, "kg/ha"],
  //   },
  //   "fieldValue": [],
  //   "takaran": {
  //     "dasar": {
  //       "Nitrat": "Const_Nk / 3",
  //       "ZK": "Const_ZK / 2",
  //       "Petroganik": "Const_Or / 1",
  //     },
  //     "susulan I (15 - 20 HST)": {
  //       "Nitrat": "Const_Nk / 3",
  //       "ZK": "Const_ZK / 2",
  //     },
  //     "susulan II (30 - 40 HST)": {
  //       "Nitrat": "Const_Nk / 3",
  //     },
  //   },
  //   "hasil": {
  //     "dasar": {
  //       "Nitrat": 150.0,
  //       "ZK": 50.0,
  //       "Petroganik": 2000.0,
  //     },
  //     "susulan I (15 - 20 HST)": {
  //       "Nitrat": 150.0,
  //       "ZK": 50.0,
  //     },
  //     "susulan II (30 - 40 HST)": {
  //       "Nitrat": 150.0,
  //     },
  //   },
  //   "penjelas": {"Cara Aplikasi": "Ditebar / Dibenamkan"},
  // },
  // {
  //   "id": 82,"id_MenuRawatan": "1","idKomoditi": 20,
  //   "idPerusahaan": 0,
  //   "kategoriProduk": 0,
  //   "satuan": "Kg/Ha",
  //   "jenisPemupukan": "Majemuk",
  //   "variabels": {
  //     "Const_Ph": ["Phonska Plus", 400.0, "kg/ha"],
  //   },
  //   "fieldValue": [],
  //   "takaran": {
  //     "dasar": {
  //       "Phonska Plus": "Const_Ph / 4",
  //     },
  //     "HST20": {
  //       "Phonska Plus": "Const_Ph / 4 + Const_Ph / 8",
  //     },
  //     "HST35": {
  //       "Phonska Plus": "Const_Ph / 4 + Const_Ph / 8",
  //     }
  //   },
  //   "hasil": {
  //     "dasar": {"Phonska Plus": 0.0},
  //     "HST20": {"Phonska Plus": 0.0},
  //     "HST35": {"Phonska Plus": 0.0},
  //   },
  //   "penjelas": {"": ""},
  // },
  // {
  //   "id": 83,"id_MenuRawatan": "1","idKomoditi": 20,
  //   "idPerusahaan": 0,
  //   "kategoriProduk": 0,
  //   "satuan": "Kg/Ha",
  //   "jenisPemupukan": "Tunggal",
  //   "variabels": {
  //     "Const_ZA": ["ZA", 300.0, "kg/ha"],
  //     "Const_Sp": ["SP-36", 150.0, "kg/ha"],
  //     "Const_KCL": ["KCL", 100.0, "kg/ha"]
  //   },
  //   "fieldValue": [],
  //   "takaran": {
  //     "dasar": {
  //       "ZA": "Const_ZA / 3",
  //       "SP-36": "Const_Sp",
  //       "KCL": "Const_KCL",
  //     },
  //     "HST20": {
  //       "ZA": "Const_ZA / 3",
  //     },
  //     "HST40": {
  //       "ZA": "Const_ZA / 3",
  //     },
  //   },
  //   "hasil": {
  //     "dasar": {"ZA": 0.0, "SP-36": 0.0, "KCL": 0.0},
  //     "HST20": {"ZA": 0.0},
  //     "HST40": {"ZA": 0.0},
  //   },
  //   "penjelas": {"": ""},
  // },
  // {
  //   "id": 84,"id_MenuRawatan": "1","idKomoditi": 20,
  //   "idPerusahaan": 0,
  //   "kategoriProduk": 0,
  //   "satuan": "Kg/Ha",
  //   "jenisPemupukan": "Berimbang",
  //   "variabels": {
  //     "Const_Pet": ["Petroganik", 2000, "kg/ha"],
  //     "Const_Ph": ["Phonska Plus", 400.0, "kg/ha"],
  //   },
  //   "fieldValue": [],
  //   "takaran": {
  //     "dasar": {
  //       "Petroganik": "Const_Pet",
  //       "Phonska Plus": "Const_Ph / 4",
  //     },
  //     "HST20": {
  //       "Phonska Plus": "Const_Ph / 4 + Const_Ph / 8",
  //     },
  //     "HST35": {
  //       "Phonska Plus": "Const_Ph / 4 + Const_Ph / 8",
  //     }
  //   },
  //   "hasil": {
  //     "dasar": {"Petroganik": 0.0, "Phonska Plus": 0.0},
  //     "HST20": {"Phonska Plus": 0.0},
  //     "HST35": {"Phonska Plus": 0.0},
  //   },
  //   "penjelas": {"": ""},
  // },
  // {
  //   "id": 85,"id_MenuRawatan": "1","idKomoditi": 21,
  //   "idPerusahaan": 0,
  //   "kategoriProduk": 0,
  //   "satuan": "gr/Pohon",
  //   "jenisPemupukan": "Nitrat",
  //   "variabels": {
  //     "Const_Nk": ["Nitrat", 1600.0, "gr/pohon"],
  //     "Const_ZK": ["ZK", 100.0, "gr/pohon"],
  //     "Const_Or": ["Petroganik", 5000.0, "gr/Pohon"],
  //   },
  //   "fieldValue": [],
  //   "takaran": {
  //     "Awal musim hujan (Per Pohon)": {
  //       "Nitrat": "800",
  //       "ZK": "50",
  //       "Petroganik": "Const_Or",
  //     },
  //     "Akhir musim hujan (Per Pohon)": {
  //       "Nitrat": "800",
  //       "ZK": "50",
  //     },
  //   },
  //   "hasil": {
  //     "Awal musim hujan (Per Pohon)": {
  //       "Nitrat": 0.0,
  //       "ZK": 0.0,
  //       "Petroganik": 0.0,
  //     },
  //     "Akhir musim hujan (Per Pohon)": {
  //       "Nitrat": 0.0,
  //       "ZK": 0.0,
  //     },
  //   },
  //   "penjelas": {"Cara Aplikasi": "Ditebar / Dibenamkan"},
  // },
  // {
  //   "id": 86,"id_MenuRawatan": "1","idKomoditi": 21,
  //   "idPerusahaan": 0,
  //   "kategoriProduk": 0,
  //   "satuan": "gr/Pohon",
  //   "jenisPemupukan": "Majemuk",
  //   "variabels": {
  //     "Const_Ph": ["Phonska Plus", 1600.0, "gr/Pohon"],
  //   },
  //   "fieldValue": [],
  //   "takaran": {
  //     "Awal Musim Hujan": {
  //       "Phonska Plus": "Const_Ph/2",
  //     },
  //     "Akhir Musim Hujan": {
  //       "Phonska Plus": "Const_Ph/2",
  //     },
  //   },
  //   "hasil": {
  //     "Awal Musim Hujan": {"Phonska Plus": 0.0},
  //     "Akhir Musim Hujan": {"Phonska Plus": 0.0},
  //   },
  //   "penjelas": {
  //     "*)":
  //     "Gram/pohon, pupuk diberikan dengan cara dibenamkan dalam alur mengelilingi batang tanaman "
  //   }
  // },
  // {
  //   "id": 87,"id_MenuRawatan": "1","idKomoditi": 21,
  //   "idPerusahaan": 0,
  //   "kategoriProduk": 0,
  //   "satuan": "gr/Pohon",
  //   "jenisPemupukan": "Tunggal",
  //   "variabels": {
  //     "Const_Ur": ["Urea", 250.0, "gr/Pohon"],
  //     "Const_ZA": ["ZA", 600.0, "gr/Pohon"],
  //     "Const_Sp": ["SP-36", 650.0, "gr/Pohon"],
  //     "Const_KCL": ["KCL", 400.0, "gr/Pohon"]
  //   },
  //   "fieldValue": [],
  //   "takaran": {
  //     "Awal Musim Hujan": {
  //       "Urea": "125",
  //       "ZA": "300",
  //       "SP-36": "325",
  //       "KCL": "200",
  //     },
  //     "Akhir Musim Hujan": {
  //       "Urea": "125",
  //       "ZA": "300",
  //       "SP-36": "325",
  //       "KCL": "200",
  //     },
  //   },
  //   "hasil": {
  //     "Awal Musim Hujan": {"Urea": 0.0, "ZA": 0.0, "SP-36": 0.0, "KCL": 0.0},
  //     "Akhir Musim Hujan": {"Urea": 0.0, "ZA": 0.0, "SP-36": 0.0, "KCL": 0.0},
  //   },
  //   "penjelas": {
  //     "*)":
  //     "Gram/pohon, pupuk diberikan dengan cara dibenamkan dalam alur mengelilingi batang tanaman "
  //   },
  // },
  // {
  //   "id": 88,"id_MenuRawatan": "1","idKomoditi": 21,
  //   "idPerusahaan": 0,
  //   "kategoriProduk": 0,
  //   "satuan": "gr/Pohon",
  //   "jenisPemupukan": "Berimbang",
  //   "variabels": {
  //     "Const_Pet": ["Petroganik", 3000, "gr/Pohon"],
  //     "Const_Ph": ["Phonska Plus", 1600.0, "gr/Pohon"],
  //   },
  //   "fieldValue": [],
  //   "takaran": {
  //     "Awal Musim Hujan": {
  //       "Petroganik": "Const_Pet",
  //       "Phonska Plus": "800",
  //     },
  //     "Akhir Musim Hujan": {
  //       "Phonska Plus": "800",
  //     },
  //   },
  //   "hasil": {
  //     "Awal Musim Hujan": {"Petroganik": 0.0, "Phonska Plus": 0.0},
  //     "Akhir Musim Hujan": {"Phonska Plus": 0.0},
  //   },
  //   "penjelas": {
  //     "*)":
  //     "Gram/pohon, pupuk diberikan dengan cara dibenamkan dalam alur mengelilingi batang tanaman "
  //   },
  // },
  // {
  //   "id": 89,"id_MenuRawatan": "1","idKomoditi": 22,
  //   "idPerusahaan": 0,
  //   "kategoriProduk": 0,
  //   "satuan": "Kg/Ha",
  //   "jenisPemupukan": "Nitrat",
  //   "variabels": {
  //     "Const_Nk": ["Nitrat", 450.0, "kg/ha"],
  //     "Const_ZK": ["ZK", 150.0, "kg/ha"],
  //     "Const_ZA": ["ZA", 100.0, "kg/ha"],
  //     "Const_Ur": ["Urea", 150.0, "kg/ha"],
  //     "Const_Or": ["Petroganik", 2000.0, "kg/ha"],
  //   },
  //   "fieldValue": [],
  //   "takaran": {
  //     "dasar": {
  //       "Nitrat": "Const_Nk / 1",
  //       "ZK": "Const_ZK / 2",
  //       "Urea": "Const_Ur / 6",
  //       "Petroganik": "Const_Or / 1",
  //     },
  //     "susulan I (3 BST)": {
  //       "Urea": "Const_Ur / 1.5",
  //       "ZK": "Const_ZK / 2",
  //     },
  //     "susulan II (10 BST)": {
  //       "ZA": "Const_ZA /1",
  //     },
  //   },
  //   "hasil": {
  //     "dasar": {
  //       "Nitrat": 0.0,
  //       "ZK": 0.0,
  //       "Urea": 0.0,
  //       "Petroganik": 0.0,
  //     },
  //     "susulan I (3 BST)": {
  //       "Urea": 0.0,
  //       "ZK": 0.0,
  //     },
  //     "susulan II (10 BST)": {
  //       "ZA": 0.0,
  //     },
  //   },
  //   "penjelas": {"Cara Aplikasi": "Ditebar / Dibenamkan"},
  // },
  // {
  //   "id": 90,"id_MenuRawatan": "1","idKomoditi": 23,
  //   "idPerusahaan": 0,
  //   "kategoriProduk": 0,
  //   "satuan": "Kg/Ha",
  //   "jenisPemupukan": "Nitrat",
  //   "variabels": {
  //     "Const_Nk": ["Nitrat", 1200.0, "kg/ha"],
  //     "Const_Or": ["Petroganik", 10000.0, "kg/ha"],
  //   },
  //   "fieldValue": [],
  //   "takaran": {
  //     "Setelah Panen (Per Pohon)": {
  //       "Nitrat": "900",
  //       "Petroganik": "10000",
  //     },
  //     "Awal musim hujan (Per Pohon)": {
  //       "Nitrat": "600",
  //     },
  //   },
  //   "hasil": {
  //     "Setelah Panen (Per Pohon)": {
  //       "Nitrat": 0.0,
  //       "Petroganik": 0.0,
  //     },
  //     "Awal musim hujan (Per Pohon)": {
  //       "Nitrat": 0.0,
  //     },
  //   },
  //   "penjelas": {"Cara Aplikasi": "Ditebar / Dibenamkan"},
  // },
  // {
  //   "id": 91,"id_MenuRawatan": "1","idKomoditi": 24,
  //   "idPerusahaan": 0,
  //   "kategoriProduk": 0,
  //   "satuan": "Kg/Ha",
  //   "jenisPemupukan": "Nitrat",
  //   "variabels": {
  //     "Const_Nk": ["Nitrat", 600.0, "kg/ha"],
  //     "Const_ZK": ["ZK", 100.0, "kg/ha"],
  //     "Const_ZA": ["ZA", 300.0, "kg/ha"],
  //     "Const_Or": ["Petroganik", 5000.0, "kg/ha"],
  //   },
  //   "fieldValue": [],
  //   "takaran": {
  //     "dasar": {
  //       "Nitrat": "Const_Nk / 3",
  //       "ZA": "Const_ZA / 6",
  //       "Petroganik": "Const_Or / 1",
  //     },
  //     "susulan I (15 HST)": {
  //       "Nitrat": "Const_Nk / 3",
  //       "ZA": "Const_ZA / 6",
  //     },
  //     "susulan II (3 BST)": {
  //       "Nitrat": "Const_Nk / 3",
  //       "ZA": "Const_ZA /3",
  //       "ZK": "Const_ZK /2",
  //     },
  //     "susulan III (6 BST)": {
  //       "ZA": "Const_ZA /3",
  //       "ZK": "Const_ZK /2",
  //     },
  //   },
  //   "hasil": {
  //     "dasar": {
  //       "Nitrat": 0.0,
  //       "ZA": 0.0,
  //       "Petroganik": 0.0,
  //     },
  //     "susulan I (15 HST)": {
  //       "Nitrat": 0.0,
  //       "ZA": 0.0,
  //     },
  //     "susulan II (3 BST)": {
  //       "Nitrat": 0.0,
  //       "ZA": 0.0,
  //       "ZK": 0.0,
  //     },
  //     "susulan III (6 BST)": {
  //       "ZA": 0.0,
  //       "ZK": 0.0,
  //     },
  //   },
  //   "penjelas": {"Cara Aplikasi": "Ditebar / Dibenamkan"},
  // },
  // {
  //   "id": 92,"id_MenuRawatan": "1","idKomoditi": 25,
  //   "idPerusahaan": 0,
  //   "kategoriProduk": 0,
  //   "satuan": "Kg/Ha",
  //   "jenisPemupukan": "Niphos",
  //   "variabels": {
  //     "Const_Or": ["Petroganik", 1500.0, "kg/ha"],
  //     "Const_Np": ["Niphos", 600.0, "kg/ha"]
  //   },
  //   "fieldValue": [],
  //   "takaran": {
  //     "dasar": {
  //       "Petroganik": "Const_Or / 1",
  //       "Niphos": "Const_Np / 2",
  //     },
  //     "susulan I (20 HST)": {
  //       "Niphos": "Const_Np / 2",
  //     },
  //   },
  //   "hasil": {
  //     "dasar": {
  //       "Petroganik": 1500.0,
  //       "Niphos": 300.0,
  //     },
  //     "susulan I (20 HST)": {
  //       "Niphos": 300.0,
  //     },
  //   },
  //   "penjelas": {"Cara Aplikasi": "Ditabur / dibenamkan"},
  // },
  // {
  //   "id": 93,"id_MenuRawatan": "1","idKomoditi": 26,
  //   "idPerusahaan": 0,
  //   "kategoriProduk": 0,
  //   "satuan": "Kg/Ha",
  //   "jenisPemupukan": "Niphos",
  //   "variabels": {
  //     "Const_Or": ["Petroganik", 1500.0, "kg/ha"],
  //     "Const_Np": ["Niphos", 600.0, "kg/ha"]
  //   },
  //   "fieldValue": [],
  //   "takaran": {
  //     "dasar": {
  //       "Petroganik": "Const_Or / 1",
  //       "Niphos": "Const_Np / 2",
  //     },
  //     "susulan I (20 HST)": {
  //       "Niphos": "Const_Np / 2",
  //     },
  //   },
  //   "hasil": {
  //     "dasar": {
  //       "Petroganik": 1500.0,
  //       "Niphos": 300.0,
  //     },
  //     "susulan I (20 HST)": {
  //       "Niphos": 300.0,
  //     },
  //   },
  //   "penjelas": {"Cara Aplikasi": "Ditabur / dibenamkan"},
  // },
  // {
  //   "id": 94,"id_MenuRawatan": "1","idKomoditi": 27,
  //   "idPerusahaan": 1,
  //   "kategoriProduk": 0,
  //   "satuan": "Kg/Ha",
  //   "jenisPemupukan": "Meroke Hortikultura",
  //   "variabels": {
  //     "Const_Mn": ["Mutiara NPK", 100.0, "kg/ha"],
  //     "Const_Kp": ["KARATE PLUS BORONI", 300.0, "kg/ha"],
  //     "Const_Mg": ["Mutiara Grower", 400.0, "kg/ha"],
  //   },
  //   "fieldValue": [],
  //   "takaran": {
  //     "dasar": {
  //       "Mutiara NPK": "Const_Mn",
  //       "KARATE PLUS BORONI": "Const_Kp",
  //     },
  //     "HST25": {
  //       "Mutiara Grower": "Const_Mg/2",
  //       "KARATE PLUS BORONI": "Const_Kp/3",
  //     },
  //     "HST45": {
  //       "Mutiara Grower": "Const_Mg/2",
  //       "KARATE PLUS BORONI": "Const_Kp/3",
  //     },
  //   },
  //   "hasil": {
  //     "dasar": {"Mutiara NPK": 100.0, "KARATE PLUS BORONI": 100},
  //     "HST25": {"Mutiara Grower": 200.0, "KARATE PLUS BORONI": 100.0},
  //     "HST45": {"Mutiara Grower": 200.0, "KARATE PLUS BORONI": 100.0},
  //   },
  //   "penjelas": {"": ""},
  // },
  // {
  //   "id": 95,"id_MenuRawatan": "1","idKomoditi": 27,
  //   "idPerusahaan": 0,
  //   "kategoriProduk": 0,
  //   "satuan": "Kg/Ha",
  //   "jenisPemupukan": "Niphos",
  //   "variabels": {
  //     "Const_Or": ["Petroganik", 2000.0, "kg/ha"],
  //     "Const_Np": ["Niphos", 700.0, "kg/ha"]
  //   },
  //   "fieldValue": [],
  //   "takaran": {
  //     "dasar": {
  //       "Petroganik": "Const_Or / 1",
  //       "Niphos": "Const_Np / 2.333333333333333",
  //     },
  //     "susulan I (15 HST)": {
  //       "Niphos": "Const_Np / 3.5",
  //     },
  //     "susulan II (30 HST)": {
  //       "Niphos": "Const_Np / 3.5",
  //     },
  //   },
  //   "hasil": {
  //     "dasar": {
  //       "Petroganik": 2000.0,
  //       "Niphos": 300.0,
  //     },
  //     "susulan I (15 HST)": {
  //       "Niphos": 200.0,
  //     },
  //     "susulan II (30 HST)": {
  //       "Niphos": 200.0,
  //     },
  //   },
  //   "penjelas": {"Cara Aplikasi": "Ditabur / dibenamkan"},
  // },
  // {
  //   "id": 96,"id_MenuRawatan": "1","idKomoditi": 28,
  //   "idPerusahaan": 0,
  //   "kategoriProduk": 0,
  //   "satuan": "Kg/Ha",
  //   "jenisPemupukan": "Niphos",
  //   "variabels": {
  //     "Const_Or": ["Petroganik", 2000.0, "kg/ha"],
  //     "Const_Np": ["Niphos", 700.0, "kg/ha"]
  //   },
  //   "fieldValue": [],
  //   "takaran": {
  //     "dasar": {
  //       "Petroganik": "Const_Or / 1",
  //       "Niphos": "Const_Np / 2.333333333333333",
  //     },
  //     "susulan I (15 HST)": {
  //       "Niphos": "Const_Np / 3.5",
  //     },
  //     "susulan II (30 HST)": {
  //       "Niphos": "Const_Np / 3.5",
  //     },
  //   },
  //   "hasil": {
  //     "dasar": {
  //       "Petroganik": 2000.0,
  //       "Niphos": 300.0,
  //     },
  //     "susulan I (15 HST)": {
  //       "Niphos": 200.0,
  //     },
  //     "susulan II (30 HST)": {
  //       "Niphos": 200.0,
  //     },
  //   },
  //   "penjelas": {"Cara Aplikasi": "Ditabur / dibenamkan"},
  // },
  // {
  //   "id": 97,"id_MenuRawatan": "1","idKomoditi": 28,
  //   "idPerusahaan": 1,
  //   "kategoriProduk": 0,
  //   "satuan": "Kg/Ha",
  //   "jenisPemupukan": "Meroke Hortikultura",
  //   "variabels": {
  //     "Const_Mn": ["Mutiara NPK", 100.0, "kg/ha"],
  //     "Const_Kp": ["KARATE PLUS BORONI", 300.0, "kg/ha"],
  //     "Const_Mg": ["Mutiara Grower", 400.0, "kg/ha"],
  //   },
  //   "fieldValue": [],
  //   "takaran": {
  //     "dasar": {
  //       "Mutiara NPK": "Const_Mn",
  //       "KARATE PLUS BORONI": "Const_Kp",
  //     },
  //     "HST25": {
  //       "Mutiara Grower": "Const_Mg/2",
  //       "KARATE PLUS BORONI": "Const_Kp/3",
  //     },
  //     "HST45": {
  //       "Mutiara Grower": "Const_Mg/2",
  //       "KARATE PLUS BORONI": "Const_Kp/3",
  //     },
  //   },
  //   "hasil": {
  //     "dasar": {"Mutiara NPK": 100.0, "KARATE PLUS BORONI": 100},
  //     "HST25": {"Mutiara Grower": 200.0, "KARATE PLUS BORONI": 100.0},
  //     "HST45": {"Mutiara Grower": 200.0, "KARATE PLUS BORONI": 100.0},
  //   },
  //   "penjelas": {"": ""},
  // },
  // {
  //   "id": 98,"id_MenuRawatan": "1","idKomoditi": 28,
  //   "idPerusahaan": 0,
  //   "kategoriProduk": 0,
  //   "satuan": "Kg/Ha",
  //   "jenisPemupukan": "Majemuk",
  //   "variabels": {
  //     "Const_Ph": ["Phonska Plus", 800.0, "kg/ha"],
  //   },
  //   "fieldValue": [],
  //   "takaran": {
  //     "dasar": {
  //       "Phonska Plus": "Const_Ph / 3.2 + Const_Ph/16",
  //     },
  //     "HST15": {
  //       "Phonska Plus": "Const_Ph / 3.2",
  //     },
  //     "HST30": {
  //       "Phonska Plus": "Const_Ph / 3.2",
  //     }
  //   },
  //   "hasil": {
  //     "dasar": {"Phonska Plus": 0.0},
  //     "HST15": {"Phonska Plus": 0.0},
  //     "HST30": {"Phonska Plus": 0.0},
  //   },
  //   "penjelas": {"": ""},
  // },
  // {
  //   "id": 99,"id_MenuRawatan": "1","idKomoditi": 28,
  //   "idPerusahaan": 0,
  //   "kategoriProduk": 0,
  //   "satuan": "Kg/Ha",
  //   "jenisPemupukan": "Tunggal",
  //   "variabels": {
  //     "Const_Ur": ["Urea", 100.0, "kg/ha"],
  //     "Const_ZA": ["ZA", 350.0, "kg/ha"],
  //     "Const_Sp": ["SP-36", 350.0, "kg/ha"],
  //     "Const_KCL": ["KCL", 200.0, "kg/ha"]
  //   },
  //   "fieldValue": [],
  //   "takaran": {
  //     "dasar": {
  //       "Urea": "Const_Ur",
  //       "SP-36": "Const_Sp",
  //       "KCL": "Const_KCL",
  //     },
  //     "HST15": {
  //       "ZA": "Const_ZA / 2",
  //     },
  //     "HST30": {
  //       "ZA": "Const_ZA / 2",
  //     },
  //   },
  //   "hasil": {
  //     "dasar": {"Urea": 0.0, "SP-36": 0.0, "KCL": 0.0},
  //     "HST15": {"ZA": 0.0},
  //     "HST30": {"ZA": 0.0},
  //   },
  //   "penjelas": {"": ""},
  // },
  // {
  //   "id": 100,"id_MenuRawatan": "1","idKomoditi": 28,
  //   "idPerusahaan": 0,
  //   "kategoriProduk": 0,
  //   "satuan": "Kg/Ha",
  //   "jenisPemupukan": "Berimbang",
  //   "variabels": {
  //     "Const_Pet": ["Petroganik", 2000, "kg/ha"],
  //     "Const_Ph": ["Phonska Plus", 800.0, "kg/ha"],
  //   },
  //   "fieldValue": [],
  //   "takaran": {
  //     "dasar": {
  //       "Petroganik": "Const_Pet",
  //       "Phonska Plus": "Const_Ph / 3.2 + Const_Ph/16",
  //     },
  //     "HST15": {
  //       "Phonska Plus": "Const_Ph / 3.2",
  //     },
  //     "HST30": {
  //       "Phonska Plus": "Const_Ph / 3.2",
  //     }
  //   },
  //   "hasil": {
  //     "dasar": {"Petroganik": 0.0, "Phonska Plus": 0.0},
  //     "HST15": {"Phonska Plus": 0.0},
  //     "HST30": {"Phonska Plus": 0.0},
  //   },
  //   "penjelas": {"": ""},
  // },
  // {
  //   "id": 101,"id_MenuRawatan": "1","idKomoditi": 29,
  //   "idPerusahaan": 0,
  //   "kategoriProduk": 0,
  //   "satuan": "Kg/Ha",
  //   "jenisPemupukan": "Niphos",
  //   "variabels": {
  //     "Const_Or": ["Petroganik", 2000.0, "kg/ha"],
  //     "Const_Np": ["Niphos", 700.0, "kg/ha"]
  //   },
  //   "fieldValue": [],
  //   "takaran": {
  //     "dasar": {
  //       "Petroganik": "Const_Or / 1",
  //       "Niphos": "Const_Np / 2.333333333333333",
  //     },
  //     "susulan I (15 HST)": {
  //       "Niphos": "Const_Np / 3.5",
  //     },
  //     "susulan II (30 HST)": {
  //       "Niphos": "Const_Np / 3.5",
  //     },
  //   },
  //   "hasil": {
  //     "dasar": {
  //       "Petroganik": 2000.0,
  //       "Niphos": 300.0,
  //     },
  //     "susulan I (15 HST)": {
  //       "Niphos": 200.0,
  //     },
  //     "susulan II (30 HST)": {
  //       "Niphos": 200.0,
  //     },
  //   },
  //   "penjelas": {"Cara Aplikasi": "Ditabur / dibenamkan"},
  // },
  // {
  //   "id": 103,"id_MenuRawatan": "1","idKomoditi": 30,
  //   "idPerusahaan": 0,
  //   "kategoriProduk": 0,
  //   "satuan": "Kg/Ha",
  //   "jenisPemupukan": "Berimbang",
  //   "variabels": {
  //     "Const_Pet": ["Petroganik", 1000, "kg/ha"],
  //     "Const_Ph": ["Phonska Plus", 500.0, "kg/ha"],
  //     "Const_ZA": ["ZA", 450.0, "kg/ha"],
  //     "Const_KCL": ["KCL", 80.0, "kg/ha"],
  //   },
  //   "fieldValue": [],
  //   "takaran": {
  //     "dasar": {
  //       "Petroganik": "Const_Pet",
  //       "Phonska Plus": "Const_Ph/2",
  //       "ZA": "Const_ZA/2",
  //     },
  //     "35 HST": {
  //       "Phonska Plus": "Const_Ph / 2",
  //       "ZA": "Const_ZA/2",
  //       "KCL": "Const_KCL",
  //     },
  //   },
  //   "hasil": {
  //     "dasar": {"Petroganik": 0.0, "Phonska Plus": 0.0, "ZA": 0.0},
  //     "35 HST": {"Phonska Plus": 0.0, "ZA": 0.0, "KCL": 0.0},
  //   },
  //   "penjelas": {"": ""},
  // },
  // {
  //   "id": 104,"id_MenuRawatan": "1","idKomoditi": 31,
  //   "idPerusahaan": 1,
  //   "kategoriProduk": 0,
  //   "satuan": "Kg/Ha",
  //   "jenisPemupukan": "Meroke Hortikultura",
  //   "variabels": {
  //     "Const_Mp": ["Mutiara NPK pro", 250.0, "kg/ha"],
  //     "Const_Kp": ["KARATE PLUS BORONI", 50, "kg/ha"]
  //   },
  //   "fieldValue": [],
  //   "takaran": {
  //     "dasar": {
  //       "Mutiara NPK pro": "Const_Mp/1.6666666666666667",
  //     },
  //     "HST35": {
  //       "Mutiara NPK pro": "Const_Mp/2.5",
  //       "KARATE PLUS BORONI": "Const_Kp",
  //     },
  //   },
  //   "hasil": {
  //     "dasar": {"Mutiara NPK pro": 150.0},
  //     "HST35": {"Mutiara NPK pro": 100.0, "KARATE PLUS BORONI": 50.0},
  //   },
  //   "penjelas": {"": ""},
  // },
  // {
  //   "id": 105,"id_MenuRawatan": "1","idKomoditi": 32,
  //   "idPerusahaan": 1,
  //   "kategoriProduk": 0,
  //   "satuan": "Kg/Ha",
  //   "jenisPemupukan": "Meroke Hortikultura",
  //   "variabels": {
  //     "Const_Mn": ["Mutiara NPK", 200.0, "kg/ha"],
  //     "Const_Ss": ["SS (AMMOPHOS)", 200.0, "kg/ha"],
  //     "Const_Mp": ["Mutiara NPK pro", 400.0, "kg/ha"],
  //     "Const_Kp": ["KARATE PLUS BORONI", 100.0, "kg/ha"],
  //     "Const_Sb": ["SUBURKALI BUTIR", 100.0, "kg/ha"],
  //   },
  //   "fieldValue": [],
  //   "takaran": {
  //     "dasar": {
  //       "Mutiara NPK": "Const_Mn",
  //       "SS (AMMOPHOS)": "Const_Ss",
  //     },
  //     "HST25": {
  //       "Mutiara NPK pro": "Const_Mp/2",
  //       "KARATE PLUS BORONI": "Const_Kp",
  //     },
  //     "HST55": {
  //       "Mutiara NPK pro": "Const_Mp/2",
  //       "SUBURKALI BUTIR": "Const_Sb",
  //     },
  //   },
  //   "hasil": {
  //     "dasar": {"Mutiara NPK": 200.0, "SS (AMMOPHOS)": 200},
  //     "HST25": {"Mutiara NPK pro": 200.0, "KARATE PLUS BORONI": 100.0},
  //     "HST55": {"Mutiara NPK pro": 100.0, "SUBURKALI BUTIR": 100.0},
  //   },
  //   "penjelas": {"": ""},
  // },
  // {
  //   "id": 106,"id_MenuRawatan": "1","idKomoditi": 32,
  //   "idPerusahaan": 0,
  //   "kategoriProduk": 0,
  //   "satuan": "Kg/Ha",
  //   "jenisPemupukan": "Majemuk",
  //   "variabels": {
  //     "Const_Ph": ["Phonska Plus", 800.0, "kg/ha"],
  //     "Const_ZA": ["ZA", 400.0, "kg/ha"],
  //   },
  //   "fieldValue": [],
  //   "takaran": {
  //     "dasar": {
  //       "Phonska Plus": "Const_Ph / 2",
  //     },
  //     "HST20": {
  //       "Phonska Plus": "Const_Ph / 2",
  //       "ZA": "Const_ZA / 8",
  //     },
  //     "HST40": {
  //       "ZA": "Const_ZA - Const_ZA / 8",
  //     }
  //   },
  //   "hasil": {
  //     "dasar": {"ZA": 0.0},
  //     "HST20": {"Phonska Plus": 0.0, "ZA": 0.0},
  //     "HST40": {"ZA": 0.0},
  //   },
  //   "penjelas": {"": ""},
  // },
  // {
  //   "id": 107,"id_MenuRawatan": "1","idKomoditi": 32,
  //   "idPerusahaan": 0,
  //   "kategoriProduk": 0,
  //   "satuan": "Kg/Ha",
  //   "jenisPemupukan": "Tunggal",
  //   "variabels": {
  //     "Const_ZA": ["ZA", 1000.0, "kg/ha"],
  //     "Const_Sp": ["SP-36", 300.0, "kg/ha"],
  //     "Const_KCL": ["KCL", 200.0, "kg/ha"]
  //   },
  //   "fieldValue": [],
  //   "takaran": {
  //     "dasar": {
  //       "ZA": "Const_ZA / 3.333333",
  //       "SP-36": "Const_Sp",
  //       "KCL": "Const_KCL",
  //     },
  //     "HST20": {
  //       "ZA": "Const_ZA - (Const_ZA / 3.333333)",
  //     },
  //     "HST40": {
  //       "ZA": "Const_ZA - (Const_ZA / 3.33333333)",
  //     },
  //   },
  //   "hasil": {
  //     "dasar": {"ZA": 0.0, "SP-36": 0.0, "KCL": 0.0},
  //     "HST20": {"ZA": 0.0},
  //     "HST40": {"ZA": 0.0},
  //   },
  //   "penjelas": {"": ""},
  // },
  // {
  //   "id": 108,"id_MenuRawatan": "1","idKomoditi": 32,
  //   "idPerusahaan": 0,
  //   "kategoriProduk": 0,
  //   "satuan": "Kg/Ha",
  //   "jenisPemupukan": "Berimbang",
  //   "variabels": {
  //     "Const_Pet": ["Petroganik", 2000, "kg/ha"],
  //     "Const_Ph": ["Phonska Plus", 800.0, "kg/ha"],
  //     "Const_ZA": ["ZA", 400.0, "kg/ha"],
  //   },
  //   "fieldValue": [],
  //   "takaran": {
  //     "dasar": {
  //       "Petroganik": "Const_Pet",
  //       "Phonska Plus": "Const_Ph / 2",
  //     },
  //     "HST20": {
  //       "Phonska Plus": "Const_Ph / 2",
  //       "ZA": "Const_ZA / 8",
  //     },
  //     "HST40": {
  //       "ZA": "Const_ZA - Const_ZA / 8",
  //     }
  //   },
  //   "hasil": {
  //     "dasar": {"Petroganik": 0.0, "Phonska Plus": 0.0},
  //     "HST20": {"Phonska Plus": 0.0, "ZA": 0.0},
  //     "HST40": {"ZA": 0.0},
  //   },
  //   "penjelas": {"": ""},
  // },
  // {
  //   "id": 109,"id_MenuRawatan": "1","idKomoditi": 33,
  //   "idPerusahaan": 0,
  //   "kategoriProduk": 0,
  //   "satuan": "Kg/Ha",
  //   "jenisPemupukan": "Majemuk",
  //   "variabels": {
  //     "Const_Ur": ["Urea", 100.0, "kg/ha"],
  //     "Const_Ph": ["Phonska Plus", 300.0, "kg/ha"]
  //   },
  //   "fieldValue": [],
  //   "takaran": {
  //     "dasar": {
  //       "Urea": "Const_Ur / 4",
  //       "Phonska Plus": "Const_Ph / 2",
  //     },
  //     "HST60": {
  //       "Urea": "Const_Ur - Const_Ur / 4",
  //       "Phonska Plus": "Const_Ph / 2",
  //     }
  //   },
  //   "hasil": {
  //     "dasar": {"Urea": 0.0, "Phonska Plus": 0.0},
  //     "HST60": {"Urea": 0.0, "Phonska Plus": 0.0},
  //   },
  //   "penjelas": {"": ""},
  // },
  // {
  //   "id": 110,"id_MenuRawatan": "1","idKomoditi": 33,
  //   "idPerusahaan": 0,
  //   "kategoriProduk": 0,
  //   "satuan": "Kg/Ha",
  //   "jenisPemupukan": "Tunggal",
  //   "variabels": {
  //     "Const_Ur": ["Urea", 200.0, "kg/ha"],
  //     "Const_Sp": ["SP-36", 100.0, "kg/ha"],
  //     "Const_KCL": ["KCL", 75.0, "kg/ha"]
  //   },
  //   "fieldValue": [],
  //   "takaran": {
  //     "dasar": {
  //       "Urea": "Const_Ur / 4",
  //       "SP-36": "Const_Sp / 1",
  //       "KCL": "Const_KCL / 3",
  //     },
  //     "HST30": {
  //       "Urea": "Const_Ur - (Const_Ur / 4) ",
  //       "KCL": "Const_KCL - (Const_KCL / 3)",
  //     },
  //   },
  //   "hasil": {
  //     "dasar": {"Urea": 0.0, "SP-36": 0.0, "KCL": 0.0},
  //     "HST30": {"Urea": 0.0, "KCL": 0.0},
  //   },
  //   "penjelas": {"": ""},
  // },
  // {
  //   "id": 111,"id_MenuRawatan": "1","idKomoditi": 33,
  //   "idPerusahaan": 0,
  //   "kategoriProduk": 0,
  //   "satuan": "Kg/Ha",
  //   "jenisPemupukan": "Berimbang",
  //   "variabels": {
  //     "Const_Pet": ["Petroganik", 500.0, "kg/ha"],
  //     "Const_Ur": ["Urea", 100.0, "kg/ha"],
  //     "Const_Ph": ["Phonska Plus", 300.0, "kg/ha"]
  //   },
  //   "fieldValue": [],
  //   "takaran": {
  //     "dasar": {
  //       "Petroganik": "Const_Pet",
  //       "Urea": "Const_Ur / 4",
  //       "Phonska Plus": "Const_Ph / 2",
  //     },
  //     "HST60": {
  //       "Urea": "Const_Ur - Const_Ur / 4",
  //       "Phonska Plus": "Const_Ph / 2",
  //     }
  //   },
  //   "hasil": {
  //     "dasar": {"Petroganik": 0.0, "Urea": 0.0, "Phonska Plus": 0.0},
  //     "HST60": {"Urea": 0.0, "Phonska Plus": 0.0},
  //   },
  //   "penjelas": {"": ""},
  // },
  // {
  //   "id": 112,"id_MenuRawatan": "1","idKomoditi": 34,
  //   "idPerusahaan": 0,
  //   "kategoriProduk": 0,
  //   "satuan": "Kg/Ha",
  //   "jenisPemupukan": "Majemuk",
  //   "variabels": {
  //     "Const_Ph": ["Phonska Plus", 450.0, "kg/ha"],
  //   },
  //   "fieldValue": [],
  //   "takaran": {
  //     "dasar": {
  //       "Phonska Plus": "Const_Ph / 3",
  //     },
  //     "HST15": {
  //       "Phonska Plus": "Const_Ph / 3",
  //     },
  //     "HST30": {
  //       "Phonska Plus": "Const_Ph / 3",
  //     }
  //   },
  //   "hasil": {
  //     "dasar": {"Phonska Plus": 0.0},
  //     "HST15": {"Phonska Plus": 0.0},
  //     "HST30": {"Phonska Plus": 0.0},
  //   },
  //   "penjelas": {"": ""},
  // },
  // {
  //   "id": 113,"id_MenuRawatan": "1","idKomoditi": 34,
  //   "idPerusahaan": 0,
  //   "kategoriProduk": 0,
  //   "satuan": "Kg/Ha",
  //   "jenisPemupukan": "Tunggal",
  //   "variabels": {
  //     "Const_ZA": ["ZA", 300.0, "kg/ha"],
  //     "Const_Sp": ["SP-36", 200.0, "kg/ha"],
  //     "Const_KCL": ["KCL", 100.0, "kg/ha"]
  //   },
  //   "fieldValue": [],
  //   "takaran": {
  //     "dasar": {
  //       "ZA": "Const_ZA - (Const_ZA / 3)",
  //       "SP-36": "Const_Sp",
  //       "KCL": "Const_KCL",
  //     },
  //     "HST15": {
  //       "ZA": "Const_ZA / 3",
  //     },
  //     "HST30": {
  //       "ZA": "Const_ZA / 3",
  //     },
  //   },
  //   "hasil": {
  //     "dasar": {"ZA": 0.0, "SP-36": 0.0, "KCL": 0.0},
  //     "HST15": {"ZA": 0.0},
  //     "HST30": {"ZA": 0.0},
  //   },
  //   "penjelas": {"": ""},
  // },
  // {
  //   "id": 114,"id_MenuRawatan": "1","idKomoditi": 34,
  //   "idPerusahaan": 0,
  //   "kategoriProduk": 0,
  //   "satuan": "Kg/Ha",
  //   "jenisPemupukan": "Berimbang",
  //   "variabels": {
  //     "Const_Pet": ["Petroganik", 2000.0, "kg/ha"],
  //     "Const_Ph": ["Phonska Plus", 450.0, "kg/ha"],
  //   },
  //   "fieldValue": [],
  //   "takaran": {
  //     "dasar": {
  //       "Petroganik": "Const_Pet",
  //       "Phonska Plus": "Const_Ph / 3",
  //     },
  //     "HST15": {
  //       "Phonska Plus": "Const_Ph / 3",
  //     },
  //     "HST30": {
  //       "Phonska Plus": "Const_Ph / 3",
  //     }
  //   },
  //   "hasil": {
  //     "dasar": {"Petroganik": 0.0, "Phonska Plus": 0.0},
  //     "HST15": {"Phonska Plus": 0.0},
  //     "HST30": {"Phonska Plus": 0.0},
  //   },
  //   "penjelas": {"": ""},
  // },
  // {
  //   "id": 115,"id_MenuRawatan": "1","idKomoditi": 39,
  //   "idPerusahaan": 0,
  //   "kategoriProduk": 0,
  //   "satuan": "Kg/Ha",
  //   "jenisPemupukan": "Majemuk",
  //   "variabels": {
  //     "Const_Ph": ["Phonska Plus", 450.0, "kg/ha"],
  //   },
  //   "fieldValue": [],
  //   "takaran": {
  //     "dasar": {
  //       "Phonska Plus": "Const_Ph / 3",
  //     },
  //     "HST15": {
  //       "Phonska Plus": "Const_Ph / 3",
  //     },
  //     "HST30": {
  //       "Phonska Plus": "Const_Ph / 3",
  //     }
  //   },
  //   "hasil": {
  //     "dasar": {"Phonska Plus": 0.0},
  //     "HST15": {"Phonska Plus": 0.0},
  //     "HST30": {"Phonska Plus": 0.0},
  //   },
  //   "penjelas": {"": ""},
  // },
  // {
  //   "id": 116,"id_MenuRawatan": "1","idKomoditi": 39,
  //   "idPerusahaan": 0,
  //   "kategoriProduk": 0,
  //   "satuan": "Kg/Ha",
  //   "jenisPemupukan": "Tunggal",
  //   "variabels": {
  //     "Const_ZA": ["ZA", 300.0, "kg/ha"],
  //     "Const_Sp": ["SP-36", 200.0, "kg/ha"],
  //     "Const_KCL": ["KCL", 100.0, "kg/ha"]
  //   },
  //   "fieldValue": [],
  //   "takaran": {
  //     "dasar": {
  //       "ZA": "Const_ZA - (Const_ZA / 3)",
  //       "SP-36": "Const_Sp",
  //       "KCL": "Const_KCL",
  //     },
  //     "HST15": {
  //       "ZA": "Const_ZA / 3",
  //     },
  //     "HST30": {
  //       "ZA": "Const_ZA / 3",
  //     },
  //   },
  //   "hasil": {
  //     "dasar": {"ZA": 0.0, "SP-36": 0.0, "KCL": 0.0},
  //     "HST15": {"ZA": 0.0},
  //     "HST30": {"ZA": 0.0},
  //   },
  //   "penjelas": {"": ""},
  // },
  // {
  //   "id": 117,"id_MenuRawatan": "1","idKomoditi": 39,
  //   "idPerusahaan": 0,
  //   "kategoriProduk": 0,
  //   "satuan": "Kg/Ha",
  //   "jenisPemupukan": "Berimbang",
  //   "variabels": {
  //     "Const_Pet": ["Petroganik", 2000.0, "kg/ha"],
  //     "Const_Ph": ["Phonska Plus", 450.0, "kg/ha"],
  //   },
  //   "fieldValue": [],
  //   "takaran": {
  //     "dasar": {
  //       "Petroganik": "Const_Pet",
  //       "Phonska Plus": "Const_Ph / 3",
  //     },
  //     "HST15": {
  //       "Phonska Plus": "Const_Ph / 3",
  //     },
  //     "HST30": {
  //       "Phonska Plus": "Const_Ph / 3",
  //     }
  //   },
  //   "hasil": {
  //     "dasar": {"Petroganik": 0.0, "Phonska Plus": 0.0},
  //     "HST15": {"Phonska Plus": 0.0},
  //     "HST30": {"Phonska Plus": 0.0},
  //   },
  //   "penjelas": {"": ""},
  // },
  // {
  //   "id": 118,"id_MenuRawatan": "1","idKomoditi": 35,
  //   "idPerusahaan": 0,
  //   "kategoriProduk": 0,
  //   "satuan": "gr/Pohon",
  //   "jenisPemupukan": "Majemuk",
  //   "variabels": {
  //     "Const_Ph": ["Phonska Plus", 1600.0, "gr/Pohon"],
  //   },
  //   "fieldValue": [],
  //   "takaran": {
  //     "Setelah Rompes": {
  //       "Phonska Plus": "800",
  //     },
  //     "Saat Pembesaran Buah": {
  //       "Phonska Plus": "800",
  //     },
  //   },
  //   "hasil": {
  //     "Setelah Rompes": {"Phonska Plus": 0.0},
  //     "Saat Pembesaran Buah": {"Phonska Plus": 0.0},
  //   },
  //   "penjelas": {
  //     "*)":
  //     "Gram/pohon, pupuk diberikan dengan cara dibenamkan dalam alur mengelilingi batang tanaman "
  //   },
  // },
  // {
  //   "id": 119,"id_MenuRawatan": "1","idKomoditi": 35,
  //   "idPerusahaan": 0,
  //   "kategoriProduk": 0,
  //   "satuan": "gr/Pohon",
  //   "jenisPemupukan": "Tunggal",
  //   "variabels": {
  //     "Const_Ur": ["Urea", 250.0, "gr/Pohon"],
  //     "Const_ZA": ["ZA", 600.0, "gr/Pohon"],
  //     "Const_Sp": ["SP-36", 650.0, "gr/Pohon"],
  //     "Const_KCL": ["KCL", 400.0, "gr/Pohon"]
  //   },
  //   "fieldValue": [],
  //   "takaran": {
  //     "Setelah Rompes": {
  //       "Urea": "125",
  //       "ZA": "300",
  //       "SP-36": "325",
  //       "KCL": "200",
  //     },
  //     "Saat Pembesaran Buah": {
  //       "Urea": "125",
  //       "ZA": "300",
  //       "SP-36": "325",
  //       "KCL": "200",
  //     },
  //   },
  //   "hasil": {
  //     "Setelah Rompes": {"Urea": 0.0, "ZA": 0.0, "SP-36": 0.0, "KCL": 0.0},
  //     "Saat Pembesaran Buah": {"Urea": 0.0, "ZA": 0.0, "SP-36": 0.0, "KCL": 0.0},
  //   },
  //   "penjelas": {
  //     "*)":
  //     "Gram/pohon, pupuk diberikan dengan cara dibenamkan dalam alur mengelilingi batang tanaman "
  //   },
  // },
  // {
  //   "id": 120,"id_MenuRawatan": "1","idKomoditi": 35,
  //   "idPerusahaan": 0,
  //   "kategoriProduk": 0,
  //   "satuan": "gr/Pohon",
  //   "jenisPemupukan": "Berimbang",
  //   "variabels": {
  //     "Const_Pet": ["Petroganik", 3000, "gr/Pohon"],
  //     "Const_Ph": ["Phonska Plus", 1600.0, "gr/Pohon"],
  //   },
  //   "fieldValue": [],
  //   "takaran": {
  //     "Setelah Rompes": {
  //       "Petroganik": "Const_Pet",
  //       "Phonska Plus": "800",
  //     },
  //     "Saat Pembesaran Buah": {
  //       "Phonska Plus": "800",
  //     },
  //   },
  //   "hasil": {
  //     "Setelah Rompes": {"Petroganik": 0.0, "Phonska Plus": 0.0},
  //     "Saat Pembesaran Buah": {"Phonska Plus": 0.0},
  //   },
  //   "penjelas": {
  //     "*)":
  //     "Gram/pohon, pupuk diberikan dengan cara dibenamkan dalam alur mengelilingi batang tanaman "
  //   },
  // },
  // {
  //   "id": 121,"id_MenuRawatan": "1","idKomoditi": 36,
  //   "idPerusahaan": 0,
  //   "kategoriProduk": 0,
  //   "satuan": "gr/Pohon",
  //   "jenisPemupukan": "Majemuk",
  //   "variabels": {
  //     "Const_Ph": ["Phonska Plus", 5500.0, "gr/Pohon"],
  //     "Const_KCL": ["KCL", 1000.0, "gr/Pohon"],
  //     "Const_Kies": ["Kieserit", 1000.0, "gr/Pohon"]
  //   },
  //   "fieldValue": [],
  //   "takaran": {
  //     "Awal Musim Hujan": {"Phonska Plus": "2750", "KCL": "500", "Kieserit": "500"},
  //     "Akhir Musim Hujan": {
  //       "Phonska Plus": "2750",
  //       "KCL": "500",
  //       "Kieserit": "500"
  //     },
  //   },
  //   "hasil": {
  //     "Awal Musim Hujan": {
  //       "Phonska Plus": 0.0,
  //       "KCL": 0.0,
  //       "Kieserit": 0.0,
  //     },
  //     "Akhir Musim Hujan": {
  //       "Phonska Plus": 0.0,
  //       "KCL": 0.0,
  //       "Kieserit": 0.0,
  //     },
  //   },
  //   "penjelas": {
  //     "*)":
  //     "Gram/pohon, pupuk diberikan dengan cara dibenamkan dalam alur mengelilingi batang tanaman "
  //   },
  // },
  // {
  //   "id": 122,"id_MenuRawatan": "1","idKomoditi": 36,
  //   "idPerusahaan": 0,
  //   "kategoriProduk": 0,
  //   "satuan": "gr/Pohon",
  //   "jenisPemupukan": "Tunggal",
  //   "variabels": {
  //     "Const_Ur": ["Urea", 900.0, "gr/Pohon"],
  //     "Const_ZA": ["ZA", 2000.0, "gr/Pohon"],
  //     "Const_Sp": ["SP-36", 2300.0, "gr/Pohon"],
  //     "Const_KCL": ["KCL", 2400.0, "gr/Pohon"],
  //     "Const_Kies": ["Kieserit", 1000.0, "gr/Pohon"]
  //   },
  //   "fieldValue": [],
  //   "takaran": {
  //     "Awal Musim Hujan": {
  //       "Urea": "450",
  //       "ZA": "1000",
  //       "SP-36": "1150",
  //       "KCL": "2200",
  //       "Kieserit": "500"
  //     },
  //     "Akhir Musim Hujan": {
  //       "Urea": "450",
  //       "ZA": "1000",
  //       "SP-36": "1150",
  //       "KCL": "2200",
  //       "Kieserit": "500"
  //     },
  //   },
  //   "hasil": {
  //     "Awal Musim Hujan": {
  //       "Urea": 0.0,
  //       "ZA": 0.0,
  //       "SP-36": 0.0,
  //       "KCL": 0.0,
  //       "Kieserit": 0.0
  //     },
  //     "Akhir Musim Hujan": {
  //       "Urea": 0.0,
  //       "ZA": 0.0,
  //       "SP-36": 0.0,
  //       "KCL": 0.0,
  //       "Kieserit": 0.0
  //     },
  //   },
  //   "penjelas": {
  //     "*)":
  //     "Gram/pohon, pupuk diberikan dengan cara dibenamkan dalam alur mengelilingi batang tanaman "
  //   },
  // },
  // {
  //   "id": 123,"id_MenuRawatan": "1","idKomoditi": 37,
  //   "idPerusahaan": 0,
  //   "kategoriProduk": 0,
  //   "satuan": "gr/Pohon",
  //   "jenisPemupukan": "Majemuk",
  //   "variabels": {
  //     "Const_Ph": ["Phonska Plus", 3160.0, "gr/Pohon"],
  //     "Const_KCL": ["KCL", 300.0, "gr/Pohon"],
  //     "Const_Kies": ["Kieserit", 275.0, "gr/Pohon"]
  //   },
  //   "fieldValue": [],
  //   "takaran": {
  //     "Awal Musim Hujan": {"Phonska Plus": "1500", "KCL": "120", "Kieserit": "100"},
  //     "Susulan I": {"Phonska Plus": "850", "KCL": "90", "Kieserit": "85"},
  //     "Susulan II": {"Phonska Plus": "540", "KCL": "60", "Kieserit": "60"},
  //     "Susulan III": {"Phonska Plus": "270", "KCL": "30", "Kieserit": "30"},
  //   },
  //   "hasil": {
  //     "Awal Musim Hujan": {"Phonska Plus": 0.0, "KCL": 0.0, "Kieserit": 0.0},
  //     "Susulan I": {"Phonska Plus": 0.0, "KCL": 0.0, "Kieserit": 0.0},
  //     "Susulan II": {"Phonska Plus": 0.0, "KCL": 0.0, "Kieserit": 0.0},
  //     "Susulan III": {"Phonska Plus": 0.0, "KCL": 0.0, "Kieserit": 0.0},
  //   },
  //   "penjelas": {
  //     "*)":
  //     "Gram/pohon, pupuk diberikan dengan cara dibenamkan dalam alur mengelilingi batang tanaman ",
  //     "Catatan": "Catatan : interval pemupukan 40-45 hari"
  //   },
  // },
  // {
  //   "id": 124,"id_MenuRawatan": "1","idKomoditi": 37,
  //   "idPerusahaan": 0,
  //   "kategoriProduk": 0,
  //   "satuan": "gr/Pohon",
  //   "jenisPemupukan": "Tunggal",
  //   "variabels": {
  //     "Const_Ur": ["Urea", 500.0, "gr/Pohon"],
  //     "Const_ZA": ["ZA", 1100.0, "gr/Pohon"],
  //     "Const_Sp": ["SP-36", 1300.0, "gr/Pohon"],
  //     "Const_KCL": ["KCL", 1100.0, "gr/Pohon"],
  //     "Const_Kies": ["Kieserit", 275.0, "gr/Pohon"]
  //   },
  //   "fieldValue": [],
  //   'takaran': {
  //     'Awal Musim Hujan': {
  //       'Urea': '500.0',
  //       'ZA': '1100.0',
  //       'SP-36': '1300.0',
  //       'KCL': '1100.0',
  //       'Kieserit': '275.0'
  //     },
  //     'Susulan I': {
  //       'Urea': '500.0',
  //       'ZA': '1100.0',
  //       'SP-36': '1300.0',
  //       'KCL': '1100.0',
  //       'Kieserit': '275.0'
  //     },
  //     'Susulan II': {
  //       'Urea': '500.0',
  //       'ZA': '1100.0',
  //       'SP-36': '1300.0',
  //       'KCL': '1100.0',
  //       'Kieserit': '275.0'
  //     },
  //     'Susulan III': {
  //       'Urea': '500.0',
  //       'ZA': '1100.0',
  //       'SP-36': '1300.0',
  //       'KCL': '1100.0',
  //       'Kieserit': '275.0'
  //     }
  //   },
  //   "hasil": {
  //     "Awal Musim Hujan": {
  //       "Urea": 0.0,
  //       "ZA": 0.0,
  //       "SP-36": 0.0,
  //       "KCL": 0.0,
  //       "Kieserit": 0.0
  //     },
  //     "Susulan I": {
  //       "Urea": 0.0,
  //       "ZA": 0.0,
  //       "SP-36": 0.0,
  //       "KCL": 0.0,
  //       "Kieserit": 0.0
  //     },
  //     "Susulan II": {
  //       "Urea": 0.0,
  //       "ZA": 0.0,
  //       "SP-36": 0.0,
  //       "KCL": 0.0,
  //       "Kieserit": 0.0
  //     },
  //     "Susulan III": {
  //       "Urea": 0.0,
  //       "ZA": 0.0,
  //       "SP-36": 0.0,
  //       "KCL": 0.0,
  //       "Kieserit": 0.0
  //     },
  //   },
  //   "penjelas": {
  //     "*)":
  //     "Gram/pohon, pupuk diberikan dengan cara dibenamkan dalam alur mengelilingi batang tanaman ",
  //     "Catatan": "Catatan : interval pemupukan 40-45 hari"
  //   },
  // },
  // {
  //   "id": 125,"id_MenuRawatan": "1","idKomoditi": 38,
  //   "idPerusahaan": 0,
  //   "kategoriProduk": 0,
  //   "satuan": "gr/Pohon",
  //   "jenisPemupukan": "Tunggal",
  //   "variabels": {
  //     "Const_Ur": ["Urea", 2000.0, "gr/Pohon"],
  //     "Const_ZA": ["ZA", 4500.0, "gr/Pohon"],
  //     "Const_Sp": ["SP-36", 2000.0, "gr/Pohon"],
  //     "Const_KCL": ["KCL", 1250.0, "gr/Pohon"],
  //   },
  //   "fieldValue": [],
  //   "takaran": {
  //     "Awal Musim Hujan": {
  //       "Urea": "2000",
  //       "ZA": "4500",
  //       "SP-36": "2000",
  //       "KCL": "1250",
  //     },
  //     "Akhir Musim Hujan": {
  //       "Urea": "2000",
  //       "ZA": "4500",
  //       "SP-36": "2000",
  //       "KCL": "1250",
  //     },
  //   },
  //   "hasil": {
  //     "Awal Musim Hujan": {"Urea": 0.0, "ZA": 0.0, "SP-36": 0.0, "KCL": 0.0},
  //     "Akhir Musim Hujan": {"Urea": 0.0, "ZA": 0.0, "SP-36": 0.0, "KCL": 0.0},
  //   },
  //   "penjelas": {
  //     "*)":
  //     "Gram/pohon, pupuk diberikan dengan cara dibenamkan dalam alur mengelilingi batang tanaman ",
  //   },
  // }, {
  //   "id": 127,"id_MenuRawatan": "1","idKomoditi": 1,
  //   "idPerusahaan": 2,
  //   "kategoriProduk": 0,
  //   "jenisPemupukan": "hortikultura",
  //   "satuan": "kg/ha",
  //   "variabels": {
  //     "Const_fe": ["Fertibio", 500.0, "kg/ha"],
  //     "Const_Fe": ["Fertiphos", 150.0, "kg/ha"],
  //     "Const_za": ["ZA Pak Tani", 100.0, "kg/ha"],
  //     "Const_ur": ["Urecote", 150.0, "kg/ha"],
  //     "Const_kc": ["KCL Putih", 50.0, "kg/ha"],
  //     "Const_CN": ["CNG", 1.0, "kg/ha"],
  //     "Const_Ul": ["Ultradap", 10.0, "gr/lt"],
  //     "Const_MK": ["MKP", 7.5, "gr/lt"],
  //     "Const_Ne": ["NEO KRISTALON Boron", 3.0, "gr/lt"]
  //   },
  //   "fieldValue": [],
  //   "takaran": {
  //     "Sebelum Tanam": {
  //       "Fertibio": "Const_fe / 1.0"
  //     },
  //     "10 HST": {
  //       "Fertiphos": "Const_Fe / 1.0",
  //       "ZA Pak Tani": "Const_za / 1.0",
  //       "Urecote": "Const_ur / 1.0",
  //       "KCL Putih": "Const_kc / 1.0",
  //       "CNG": "Const_CN / 1.0"
  //     },
  //     "15 HST": {
  //       "Ultradap": "10.0"
  //     },
  //     "30-50 HST (KONDISI Normal) atau 30-40-50-60 HST (KONDISI Serangan Bulai)": {
  //       "MKP": "7.5"
  //     },
  //     "50 HST ": {
  //       "NEO KRISTALON Boron": "3.0"
  //     }
  //   },
  //   "hasil": {
  //     "Sebelum Tanam": {
  //       "Fertibio": 500.0
  //     },
  //     "10 HST": {
  //       "Fertiphos": 150.0,
  //       "ZA Pak Tani": 100.0,
  //       "Urecote": 150.0,
  //       "KCL Putih": 50.0,
  //       "CNG": 1.0
  //     },
  //     "15 HST": {
  //       "Ultradap": 10.0
  //     },
  //     "30-50 HST (KONDISI Normal) atau 30-40-50-60 HST (KONDISI Serangan Bulai)": {
  //       "MKP": 7.5
  //     },
  //     "50 HST ": {
  //       "NEO KRISTALON Boron": 3.0
  //     }
  //   },
  //   "penjelas": {
  //     "Cara Aplikasi": ["."]
  //   },
  //   "category": 0
  // }, {
  //   "id": 128,"id_MenuRawatan": "1","idKomoditi": 5,
  //   "idPerusahaan": 2,
  //   "kategoriProduk": 0,
  //   "jenisPemupukan": "hortikultura",
  //   "satuan": "kg/ha",
  //   "variabels": {
  //     "Const_Sa": ["Saprodap", 250.0, "kg/ha"],
  //     "Const_NP": ["NPK 16-16-16 Biru", 250.0, "kg/ha"],
  //     "Const_ur": ["Urecote", 100.0, "kg/ha"],
  //     "Const_Pu": ["Pupuk Kandang", 20.0, "ton/ha"],
  //     "Const_Ul": ["Ultradap", 3.0, "gr/lt"],
  //     "Const_KA": ["Kamas", 300.0, "kg/ha"],
  //     "Const_PN": ["PNP", 25.0, "kg/ha"],
  //     "Const_MK": ["MKP", 5.0, "gr/lt"],
  //     "Const_Po": ["Poston 250 SC", 2.0, "ml/lt"]
  //   },
  //   "fieldValue": [],
  //   "takaran": {
  //     "Ditabur (7 hari sebelum tanam)": {
  //       "Saprodap": "Const_Sa / 1.0",
  //       "NPK 16-16-16 Biru": "Const_NP / 1.0",
  //       "Urecote": "Const_ur / 1.0",
  //       "Pupuk Kandang": "20.0"
  //     },
  //     " Disemprot (pada umur 25 HST)": {
  //       "Ultradap": "3.0"
  //     },
  //     " Ditabur (pada umur 35-40 HST)": {
  //       "NPK 16-16-16 Biru": "Const_NP / 1.0",
  //       "Kamas": "Const_KA / 1.0",
  //       "PNP": "Const_PN / 1.0"
  //     },
  //     "Disemprot (pada umur 35-45-55-65-75 HST)": {
  //       "MKP": "5.0"
  //     },
  //     "Disemprot pada umur 35 HST ( Bisa dicampur dengan MKP Pak Tani )": {
  //       "Poston 250 SC": "2.0"
  //     }
  //   },
  //   "hasil": {
  //     "Ditabur (7 hari sebelum tanam)": {
  //       "Saprodap": 250.0,
  //       "NPK 16-16-16 Biru": 250.0,
  //       "Urecote": 100.0,
  //       "Pupuk Kandang": 20.0
  //     },
  //     " Disemprot (pada umur 25 HST)": {
  //       "Ultradap": 3.0
  //     },
  //     " Ditabur (pada umur 35-40 HST)": {
  //       "NPK 16-16-16 Biru": 250.0,
  //       "Kamas": 300.0,
  //       "PNP": 25.0
  //     },
  //     "Disemprot (pada umur 35-45-55-65-75 HST)": {
  //       "MKP": 5.0
  //     },
  //     "Disemprot pada umur 35 HST ( Bisa dicampur dengan MKP Pak Tani )": {
  //       "Poston 250 SC": 2.0
  //     }
  //   },
  //   "penjelas": {
  //     "Cara Aplikasi": ["."]
  //   },
  //   "category": 0
  // }, {
  //   "id": 129,"id_MenuRawatan": "1","idKomoditi": 0,
  //   "idPerusahaan": 2,
  //   "kategoriProduk": 0,
  //   "jenisPemupukan": "hortikultura",
  //   "satuan": "kg/ha",
  //   "variabels": {
  //     "Const_Fe": ["Fertiphos", 100.0, "kg/ha"],
  //     "Const_Sa": ["Saprodap", 50.0, "kg/ha"],
  //     "Const_NP": ["NPK Padi", 200.0, "kg/ha"],
  //     "Const_ur": ["Urecote", 50.0, "kg/ha"],
  //     "Const_kc": ["KCL Putih", 50.0, "kg/ha"],
  //     "Const_Ne": ["Neo Kristalon Hijau", 3.0, "gr/lt"],
  //     "Const_MK": ["MKP", 7.0, "gr/lt"],
  //     "Const_Po": ["Poston 250 SC", 250.0, "ml/ha"]
  //   },
  //   "fieldValue": [],
  //   "takaran": {
  //     "Pupuk I ( Umur 10-14 HST )": {
  //       "Fertiphos": "Const_Fe / 1.0",
  //       "Saprodap": "Const_Sa / 1.0",
  //       "NPK Padi": "Const_NP / 4.0",
  //       "Urecote": "Const_ur / 1.0"
  //     },
  //     " Pupuk II ( Umur 30 HST )": {
  //       "NPK Padi": "Const_NP / 1.3333333333333333",
  //       "KCL Putih": "Const_kc / 1.0"
  //     },
  //     "20-30 HST": {
  //       "Neo Kristalon Hijau": "3.0"
  //     },
  //     "40-50-60 HST": {
  //       "MKP": "7.0"
  //     },
  //     "Disemprotkan (antara umur 30-40 HST)": {
  //       "Poston 250 SC": "250.0"
  //     }
  //   },
  //   "hasil": {
  //     "Pupuk I ( Umur 10-14 HST )": {
  //       "Fertiphos": 100.0,
  //       "Saprodap": 50.0,
  //       "NPK Padi": 50.0,
  //       "Urecote": 50.0
  //     },
  //     " Pupuk II ( Umur 30 HST )": {
  //       "NPK Padi": 150.0,
  //       "KCL Putih": 50.0
  //     },
  //     "20-30 HST": {
  //       "Neo Kristalon Hijau": 3.0
  //     },
  //     "40-50-60 HST": {
  //       "MKP": 7.0
  //     },
  //     "Disemprotkan (antara umur 30-40 HST)": {
  //       "Poston 250 SC": 250.0
  //     }
  //   },
  //   "penjelas": {
  //     "Cara Aplikasi": ["."]
  //   },
  //   "category": 0
  // },

  // {
  //   "id": 131,"id_MenuRawatan": "3","idKomoditi": 44,
  //   "idPerusahaan": 3,
  //   "kategoriProduk": 0,
  //   "satuan": "Kg/Ha",
  //   "jenisPemupukan": "Niphos",
  //   "variabels": {
  //     "Const_Or": ["Petroganik", 500.0, "kg/ha"],
  //     "Const_Np": ["Niphos", 250.0, "kg/ha"],
  //     "Const_Ur": ["Urea", 200.0, "kg/ha"],
  //     "Const_Kc": ["KCL", 75, "kg/ha"],
  //   },
  //   "fieldValue": [],
  //   "takaran": {
  //     "dasar": {
  //       "Petroganik": "Const_Or / 1",
  //       "Niphos": "Const_Np / 2",
  //       "Urea": "Const_Ur / 4",
  //       "KCL": "Const_Kc / 1",
  //     },
  //     "susulan I (20 HST)": {
  //       "Niphos": "Const_Np / 2",
  //       "Urea": "Const_Ur / 4",
  //     },
  //     "susulan II (35 HST)": {
  //       "Urea": "Const_Ur / 2",
  //     },
  //   },
  //   "hasil": {
  //     "dasar": {
  //       "Petroganik": 0.0,
  //       "Niphos": 125.0,
  //       "Urea": 50.0,
  //       "KCL": 75.0,
  //     },
  //     "susulan I (20 HST)": {
  //       "Niphos": 125.0,
  //       "Urea": 50.0,
  //     },
  //     "susulan II (35 HST)": {
  //       "Urea": 100.0,
  //     },
  //   },
  //   "penjelas": {"Cara Aplikasi": "Ditebar Di Lahan"},
  // },
  // {
  //   "id": 132,"id_MenuRawatan": "3","idKomoditi": 44,
  //   "idPerusahaan": 3,
  //   "kategoriProduk": 0,
  //   "satuan": "Kg/Ha",
  //   "jenisPemupukan": "Pakan ikan",
  //   "variabels": {
  //     // "Const_Or": ["Petroganik", 500.0, "kg/ha"],
  //     // "Const_Np": ["Niphos", 250.0, "kg/ha"],
  //     "Const_Ur": ["Urea", 200.0, "kg/ha"],
  //     // "Const_Kc": ["KCL", 75, "kg/ha"],
  //   },
  //   "fieldValue": [],
  //   "takaran": {
  //     "dasar": {
  //       // "Petroganik": "Const_Or / 1",
  //       // "Niphos": "Const_Np / 2",
  //       "Urea": "Const_Ur / 4",
  //       // "KCL": "Const_Kc / 1",
  //     },
  //     "susulan I (20 HST)": {
  //       // "Niphos": "Const_Np / 2",
  //       "Urea": "Const_Ur / 4",
  //     },
  //     "susulan II (35 HST)": {
  //       "Urea": "Const_Ur / 2",
  //     },
  //   },
  //   "hasil": {
  //     "dasar": {
  //       // "Petroganik": 0.0,
  //       // "Niphos": 125.0,
  //       "Urea": 50.0,
  //       // "KCL": 75.0,
  //     },
  //     "susulan I (20 HST)": {
  //       // "Niphos": 125.0,
  //       "Urea": 50.0,
  //     },
  //     "susulan II (35 HST)": {
  //       "Urea": 100.0,
  //     },
  //   },
  //   "penjelas": {"Cara Aplikasi": "Ditebar Di Lahan"},
  // },
  
  {
    "id": 132,"id_MenuRawatan": "3","idKomoditi": 0,
    "idPerusahaan": 3,
    "kategoriProduk": 0,
    "satuan": "Kg/Ha",
    "jenisPemupukan": "Pakan ikan",
    "variabels": {
      // "Const_Or": ["Petroganik", 500.0, "kg/ha"],
      // "Const_Np": ["Niphos", 250.0, "kg/ha"],
      "Const_Ur": ["Urea", 200.0, "kg/ha"],
      // "Const_Kc": ["KCL", 75, "kg/ha"],
    },
    "fieldValue": [],
    "takaran": {
      "dasar": {
        // "Petroganik": "Const_Or / 1",
        // "Niphos": "Const_Np / 2",
        "Urea": "Const_Ur / 4",
        // "KCL": "Const_Kc / 1",
      },
      "susulan I (20 HST)": {
        // "Niphos": "Const_Np / 2",
        "Urea": "Const_Ur / 4",
      },
      "susulan II (35 HST)": {
        "Urea": "Const_Ur / 2",
      },
    },
    "hasil": {
      "dasar": {
        // "Petroganik": 0.0,
        // "Niphos": 125.0,
        "Urea": 50.0,
        // "KCL": 75.0,
      },
      "susulan I (20 HST)": {
        // "Niphos": 125.0,
        "Urea": 50.0,
      },
      "susulan II (35 HST)": {
        "Urea": 100.0,
      },
    },
    "penjelas": {"Cara Aplikasi": "Ditebar Di Lahan"},
  },
  {
    "id": 133,"id_MenuRawatan": "4","idKomoditi": 0,
    "idPerusahaan": 3,
    "kategoriProduk": 0,
    "satuan": "Kg/Ha",
    "jenisPemupukan": "Maggot",
    "variabels": {
      // "Const_Or": ["Petroganik", 500.0, "kg/ha"],
      // "Const_Np": ["Niphos", 250.0, "kg/ha"],
      "Const_Ur": ["Urea", 200.0, "kg/ha"],
      // "Const_Kc": ["KCL", 75, "kg/ha"],
    },
    "fieldValue": [],
    "takaran": {
      "dasar": {
        // "Petroganik": "Const_Or / 1",
        // "Niphos": "Const_Np / 2",
        "Urea": "Const_Ur / 4",
        // "KCL": "Const_Kc / 1",
      },
      "susulan I (20 HST)": {
        // "Niphos": "Const_Np / 2",
        "Urea": "Const_Ur / 4",
      },
      "susulan II (35 HST)": {
        "Urea": "Const_Ur / 2",
      },
    },
    "hasil": {
      "dasar": {
        // "Petroganik": 0.0,
        // "Niphos": 125.0,
        "Urea": 50.0,
        // "KCL": 75.0,
      },
      "susulan I (20 HST)": {
        // "Niphos": 125.0,
        "Urea": 50.0,
      },
      "susulan II (35 HST)": {
        "Urea": 100.0,
      },
    },
    "penjelas": {"Cara Aplikasi": "Ditebar Di biopond"},
  },
  // Rumah Listrik
  // {
  //   "id": 131,"id_MenuRawatan": "1","idKomoditi": 43,
  //   "idPerusahaan": 3,
  //   "kategoriProduk": 5,
  //   "jenisPemupukan": "listrik Rumah",
  //   "satuan": "Watt/jam",
  //   "variabels": {
  //     "lampu": ["Lampu", 100.0, "Watt"],
  //     "komputer": ["Komputer", 140.0, "Watt"],
  //   },
  //   "fieldValue": [],
  //   "takaran": {
  //     "waktu": {
  //       "jam": "lampu * 1.0",
  //     },
  //
  //   },
  //   "hasil": {
  //     "waktu": {
  //       "jam": 100.0,
  //     },
  //   },
  //   "penjelas": {
  //     "Cara Aplikasi": ["."]
  //   },
  //   "category": 5
  // },
  // {
  //   "id": 131,"id_MenuRawatan": "1","idKomoditi": 44,
  //   "idPerusahaan": 3,
  //   "kategoriProduk": 5,
  //   "jenisPemupukan": "listrik Bisnis",
  //   "satuan": "Watt/jam",
  //   "variabels": {
  //     "lampu": ["Lampu", 100.0, "Watt"],
  //     "komputer": ["Komputer", 140.0, "Watt"],
  //   },
  //   "fieldValue": [],
  //   "takaran": {
  //     "waktu": {
  //       "jam": "lampu * 1.0",
  //     },
  //
  //   },
  //   "hasil": {
  //     "waktu": {
  //       "jam": 100.0,
  //     },
  //   },
  //   "penjelas": {
  //     "Cara Aplikasi": ["."]
  //   },
  //   "category": 5
  // },
  // {
  //   "id": 131,"id_MenuRawatan": "1","idKomoditi": 45,
  //   "idPerusahaan": 3,
  //   "kategoriProduk": 5,
  //   "jenisPemupukan": "listrik Industri",
  //   "satuan": "Watt/jam",
  //   "variabels": {
  //     "lampu": ["Lampu", 100.0, "Watt"],
  //     "komputer": ["Komputer", 140.0, "Watt"],
  //   },
  //   "fieldValue": [],
  //   "takaran": {
  //     "waktu": {
  //       "jam": "lampu * 1.0",
  //     },
  //
  //   },
  //   "hasil": {
  //     "waktu": {
  //       "jam": 100.0,
  //     },
  //   },
  //   "penjelas": {
  //     "Cara Aplikasi": ["."]
  //   },
  //   "category": 5
  // },

];

class PengaplikasianDosisPupuk {
  int id;
  String id_MenuRawatan;
  int idKomoditi;
  int idPerusahaan;
  int kategori;
  String satuan;
  String jenisPemupukan;
  Map<String, dynamic> variabels;
  List<dynamic> fieldValue;
  Map<String, dynamic> takaran;
  Map<String, dynamic> hasil;
  Map<String, dynamic> penjelas;

  PengaplikasianDosisPupuk({
    required this.id,
    required this.id_MenuRawatan,
    required this.idKomoditi,
    required this.idPerusahaan,
    required this.kategori,
    required this.satuan,
    required this.jenisPemupukan,
    required this.variabels,
    required this.fieldValue,
    required this.takaran,
    required this.hasil,
    required this.penjelas,
  });
}

List<PengaplikasianDosisPupuk> dataDosisPengaplikasianObj = [
  for (var i = 0; i < dataDosisPengaplikasian.length; i++)
    PengaplikasianDosisPupuk(
      id: i,
      idKomoditi: dataDosisPengaplikasian[i]['idKomoditi'],
      idPerusahaan: dataDosisPengaplikasian[i]["idPerusahaan"],
      kategori: dataDosisPengaplikasian[i]["kategoriProduk"],
      satuan: dataDosisPengaplikasian[i]["satuan"],
      jenisPemupukan: dataDosisPengaplikasian[i]["jenisPemupukan"],
      variabels: dataDosisPengaplikasian[i]["variabels"],
      fieldValue: dataDosisPengaplikasian[i]["fieldValue"],
      takaran: dataDosisPengaplikasian[i]["takaran"],
      hasil: dataDosisPengaplikasian[i]["hasil"],
      penjelas: dataDosisPengaplikasian[i]["penjelas"], id_MenuRawatan: dataDosisPengaplikasian[i]["id_MenuRawatan"],
    )
];
