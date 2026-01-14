List kategoriMenurawatan = [
  {
    "id": 0,
    "namaMenurawatan": "Rawat Motor",
    "img": "assets/images/MenuRawatan/Rawat_Motor.png",
    "colorku": ["020101", "FFFFFF", "5B5B5B"],
    "tagline1": "Motor Terawat",
    "tagline2": "Kepedulian Terwujud",
    "fitur": ["Kalkulator Efisiensi Bahan Bakar"],
    'img_banner': [
      "assets/images/MenuRawatan/RawatMotor/productmotor.png",
      "assets/images/MenuRawatan/RawatMotor/productmotor.png"
    ],
    "img_produks": ["assets/images/MenuRawatan/RawatMotor/motor.png"],
    "perlengkapan": [
      "Lampu",
      "Body Motor",
      "Service",
      "Ganti Oli",
    ],
    "multi": false,
    "Diketahui": {
      "formula": true,
      "dosisKomoditas": [],
    },
    "rumus": [
      {"LMt": 0.0, "KPprLn": 0.0, "hrgaPPerLhn": 0.0},
      {"LMt": 0.0, "KPprPot": 0.0, "hrgaPPerLhn": 0.0},
      {"LMt": 0.0, "LJt": 0.0, "Popt": 0.0, "KPprPT": 0.0, "hrgaPPerLhn": 0.0}
    ],
  },
  {
    "id": 1,
    "namaMenurawatan": "Rawat Tanam",
    "img": "assets/images/MenuRawatan/Rawat_Tanam.png",
    "colorku": ["447053", "FFFFFF", "38585D"],
    "tagline1": "Tanaman Terawat",
    "tagline2": "Kepedulian Terwujud",
    "fitur": ["Kalkulator Tanaman"],
    'img_banner': [
      "assets/images/MenuRawatan/RawatTanam/tanaman.png",
      "assets/images/MenuRawatan/RawatTanam/tanaman.png",
      "assets/images/MenuRawatan/RawatTanam/backgrond motor-03.jpg"
    ],
    "img_produks": ["assets/images/MenuRawatan/RawatTanam/tanamanpro.png"],
    "perlengkapan": ["Peptisida", "Pupuk Lainnya", "Pupuk AB mix", "Mulsa"],
    "multi": true,
    "Diketahui": {
      "dosisKomoditas": [],
    },
    "rumus": [
      {
        "JPk": [],
        "Jpk": [
          {
            "id": 0,
            "idKalkulasi": 0,
            "idMediaTanam": 999,
            "vari": "Jpk",
            "nama": "Pupuk input",
            "rumus": {"Jpk": ""},
            "value": {},
            "fieldValue": [
              {"a": "alas"}
            ],
            "id_MenuRawatan": 0,
            "typeProses": "Diketahui",
            "img": "",
            "select": 0
          },
          {
            "id": 27,
            "idKalkulasi": 0,
            "idMediaTanam": 999,
            "vari": "Jpk",
            "nama": "Pupuk input",
            "rumus": {"Jpk": ""},
            "value": {},
            "fieldValue": [
              {"a": "alas"}
            ],
            "id_MenuRawatan": 0,
            "typeProses": "Diketahui",
            "img": "",
            "select": 0
          },
        ],
        "LMt": [
          {
            "id": 0,
            "idKalkulasi": 0,
            "idMediaTanam": 0,
            "vari": "LMt",
            "nama": "hasil Select",
            "rumus": {"LMt": "(1/2)*a*t"},
            "value": {},
            "fieldValue": [
              {"a": "Alas"},
              {"t": "Tinggi"},
              {"LMt": "Luas Media Tanam"}
            ],
            "id_MenuRawatan": 1,
            "typeProses": "Diketahui",
            "img": "",
            "select": 0
          },
          {
            "id": 0,
            "idKalkulasi": 0,
            "idMediaTanam": 0,
            "vari": "LMt",
            "nama": "Segitiga",
            "rumus": {"LMt": "(1/2)*a*t"},
            "value": {},
            "fieldValue": [
              {"a": "Alas"},
              {"t": "Tinggi"},
              {"LMt": "Luas Media Tanam"}
            ],
            "id_MenuRawatan": 1,
            "typeProses": "Diketahui",
            "img": "",
            "select": 0
          },
          {
            "id": 1,
            "idKalkulasi": 0,
            "idMediaTanam": 0,
            "vari": "LMt",
            "nama": "Persegi",
            "rumus": {"LMt": "s*s"},
            "value": {},
            "fieldValue": [
              {"s": "Sisi"},
              {"LMt": "Luas Media Tanam"}
            ],
            "img": "",
            "select": 1,
            "id_MenuRawatan": 1,
            "typeProses": "Diketahui",
          },
          {
            "id": 2,
            "idKalkulasi": 0,
            "idMediaTanam": 0,
            "vari": "LMt",
            "nama": "Persegi Panjang",
            "rumus": {"LMt": "p*l"},
            "value": {},
            "fieldValue": [
              {"p": "Panjang"},
              {"l": "lebar"},
              {"LMt": "Luas Media Tanam"}
            ],
            "img": "",
            "select": 2,
            "id_MenuRawatan": 1,
            "typeProses": "Diketahui",
          },
          {
            "id": 3,
            "idKalkulasi": 0,
            "idMediaTanam": 0,
            "vari": "LMt",
            "nama": "Jajar Genjang",
            "rumus": {"LMt": "a*t"},
            "value": {},
            "fieldValue": [
              {"a": "alas"},
              {"t": "tinggi"},
              {"LMt": "Luas Media Tanam"}
            ],
            "img": "",
            "select": 3,
            "id_MenuRawatan": 1,
            "typeProses": "Diketahui",
          },
          {
            "id": 4,
            "idKalkulasi": 0,
            "idMediaTanam": 0,
            "vari": "LMt",
            "nama": "Belah Ketupat",
            "rumus": {"LMt": "(1/2)*d*f"},
            "value": {},
            "fieldValue": [
              {"d": "Diagonal1"},
              {"f": "Diagonal2"},
              {"LMt": "Luas Media Tanam"}
            ],
            "img": "",
            "select": 4,
            "id_MenuRawatan": 1,
            "typeProses": "Diketahui",
          },
          {
            "id": 5,
            "idKalkulasi": 0,
            "idMediaTanam": 0,
            "vari": "LMt",
            "nama": "Layang-layang",
            "rumus": {"LMt": "(1/2)*d*f"},
            "value": {},
            "fieldValue": [
              {"d": "Diagonal1"},
              {"f": "Diagonal2"},
              {"LMt": "Luas Media Tanam"}
            ],
            "img": "",
            "select": 5,
            "id_MenuRawatan": 1,
            "typeProses": "Diketahui",
          },
          {
            "id": 6,
            "idKalkulasi": 0,
            "idMediaTanam": 0,
            "vari": "LMt",
            "nama": "Trapesium",
            "rumus": {"LMt": "(1/2)*(a+b)*t"},
            "value": {},
            "fieldValue": [
              {"a": "Alas a"},
              {"b": "alas b"},
              {"t": "tinggi"},
              {"LMt": "Luas Media Tanam"}
            ],
            "img": "",
            "select": 6,
            "id_MenuRawatan": 1,
            "typeProses": "Diketahui",
          },
          {
            "id": 7,
            "idKalkulasi": 0,
            "idMediaTanam": 0,
            "vari": "LMt",
            "nama": "Lingkaran",
            "rumus": {"LMt": "3.14*r*r"},
            "value": {},
            "fieldValue": [
              {"r": "Jari - jari"},
              {"LMt": "Luas Media Tanam"}
            ],
            "img": "",
            "select": 7,
            "id_MenuRawatan": 1,
            "typeProses": "Diketahui",
          },
        ],
        "KPprLn": [
          {
            "id": 0,
            "idKalkulasi": 0,
            "idMediaTanam": 999,
            "vari": "KPprLn",
            "nama": "hasil select",
            // "rumus": {"KPprLn": {"rumus":"(LMt/10000)*Jpk","type":"msTm"},"hrg": {"rumus":"Jpk*hrga","type":"mmTm"}

            "rumus": {"KPprLn": "(LMt/10000)*Jpk", "hrga": "KPprLn*hrg"},
            "value": {},
            "fieldValue": [
              {"JPk": "Takaran"},
              {"LMt": "Luas Media Tanam"},
              {"KPprLn": "Keperluan Puouk Per Lahan"}
            ],
            "img": "", "select": 0,
            "id_MenuRawatan": 1,
            "typeProses": "Dijawab",
          },
          {
            "id": 19,
            "idKalkulasi": 0,
            "idMediaTanam": 999,
            "vari": "KPprLn",
            "nama": "Kebutuhan Pupuk Per Lahan",
            "rumus": {"KPprLn": "(LMt/10000)*Jpk", "hrga": "KPprLn*hrg"},
            "value": {},
            "fieldValue": [
              {"JPk": "Takaran"},
              {"LMt": "Luas Media Tanam"},
              {"KPprLn": "Keperluan Puouk Per Lahan"}
            ],
            "img": "",
            "select": 0,
            "id_MenuRawatan": 1,
            "typeProses": "Dijawab",
          },
        ],
      },
      {
        "JPk": [],
      },
      {
        "JPk": [],
      },
    ],
  },
  {
    "id": 2,
    "namaMenurawatan": "Rawat Rumah",
    "img": "assets/images/MenuRawatan/Rawat_Rumah.png",
    "colorku": ["27374D", "FFFFFF", "758E9B"],
    "tagline1": "Rumah Terawat",
    "tagline2": "Kepedulian Terwujud",
    "fitur": ["Konsumsi Listrik"],
    'img_banner': [
      "assets/images/MenuRawatan/RawatRumah/rumah.png",
      "assets/images/MenuRawatan/RawatRumah/rumah.png",
      "assets/images/MenuRawatan/RawatTanam/backgrond motor-02.jpg"
    ],
    "img_produks": ["assets/images/MenuRawatan/RawatRumah/rumahpro.png"],
    "perlengkapan": [
      "Lampu",
      "Kulkas",
      "Kompor",
      "Mesin Cuci",
      "AC (Air Conditioner)",
      "TV",
      "Pompa Air",
      "Kipas Angin",
      "Blender",
      "Pemanas Air (Water Heater)",
      "Kompresor Udara",
      "Setrika",
    ],
    "multi": false,
    "Diketahui": {
      "formula": true,
    },
    "rumus": [
      {"LMt": 0.0, "KPprLn": 0.0, "hrgaPPerLhn": 0.0},
      {"LMt": 0.0, "KPprPot": 0.0, "hrgaPPerLhn": 0.0},
      {"LMt": 0.0, "LJt": 0.0, "Popt": 0.0, "KPprPT": 0.0, "hrgaPPerLhn": 0.0}
    ],
  },
  {
    "id": 3,
    "namaMenurawatan": "Rawat Ikan",
    "img": "assets/images/MenuRawatan/Rawat_Ikan.png",
    "colorku": ["67A69D", "FFFFFF", "31625B"],
    "tagline1": "Ikan Terawat",
    "tagline2": "Kepedulian Terwujud",
    "fitur": ["Kalkulator pembesaran"],
    'img_banner': [
      "assets/images/MenuRawatan/RawatTanam/kolam_tanaman.png",
      "assets/images/MenuRawatan/RawatTanam/kolam_tanaman.png",
      "assets/images/MenuRawatan/RawatTanam/backgrond motor-04.jpg"
    ],
    "img_produks": [
      "assets/images/MenuRawatan/RawatTanam/kolam_tanamanpro.png"
    ],
    "perlengkapan": ["Bibit", "Pakan", "Kolam", "Obat"],
    "multi": true,
    "Diketahui": {
      "dosisKomoditas": [],
    },
    "rumus": [
      {
        "JPk": [],
        "Jpk": [
          {
            "id": 0,
            "idKalkulasi": 0,
            "idMediaTanam": 999,
            "vari": "Jpk",
            "nama": "Pupuk input",
            "rumus": {"Jpk": ""},
            "value": {},
            "fieldValue": [
              {"a": "alas"}
            ],
            "id_MenuRawatan": 3,
            "typeProses": "Diketahui",
            "img": "",
            "select": 0
          },
          {
            "id": 27,
            "idKalkulasi": 0,
            "idMediaTanam": 999,
            "vari": "Jpk",
            "nama": "Pupuk input",
            "rumus": {"Jpk": ""},
            "value": {},
            "fieldValue": [
              {"a": "alas"}
            ],
            "id_MenuRawatan": 3,
            "typeProses": "Diketahui",
            "img": "",
            "select": 0
          },
        ],
        "LMt": [
          {
            "id": 0,
            "idKalkulasi": 0,
            "idMediaTanam": 0,
            "vari": "LMt",
            "nama": "hasil Select",
            "rumus": {"LMt": "(1/2)*a*t"},
            "value": {},
            "fieldValue": [
              {"a": "Alas"},
              {"t": "Tinggi"},
              {"LMt": "Luas Media Tanam"}
            ],
            "id_MenuRawatan": 3,
            "typeProses": "Diketahui",
            "img": "",
            "select": 0
          },
          {
            "id": 0,
            "idKalkulasi": 0,
            "idMediaTanam": 0,
            "vari": "LMt",
            "nama": "Segitiga",
            "rumus": {"LMt": "(1/2)*a*t"},
            "value": {},
            "fieldValue": [
              {"a": "Alas"},
              {"t": "Tinggi"},
              {"LMt": "Luas Media Tanam"}
            ],
            "id_MenuRawatan": 3,
            "typeProses": "Diketahui",
            "img": "",
            "select": 0
          },
          {
            "id": 1,
            "idKalkulasi": 0,
            "idMediaTanam": 0,
            "vari": "LMt",
            "nama": "Persegi",
            "rumus": {"LMt": "s*s"},
            "value": {},
            "fieldValue": [
              {"s": "Sisi"},
              {"LMt": "Luas Media Tanam"}
            ],
            "img": "",
            "select": 1,
            "id_MenuRawatan": 3,
            "typeProses": "Diketahui",
          },
          {
            "id": 2,
            "idKalkulasi": 0,
            "idMediaTanam": 0,
            "vari": "LMt",
            "nama": "Persegi Panjang",
            "rumus": {"LMt": "p*l"},
            "value": {},
            "fieldValue": [
              {"p": "Panjang"},
              {"l": "lebar"},
              {"LMt": "Luas Media Tanam"}
            ],
            "img": "",
            "select": 2,
            "id_MenuRawatan": 3,
            "typeProses": "Diketahui",
          },
          {
            "id": 3,
            "idKalkulasi": 0,
            "idMediaTanam": 0,
            "vari": "LMt",
            "nama": "Jajar Genjang",
            "rumus": {"LMt": "a*t"},
            "value": {},
            "fieldValue": [
              {"a": "alas"},
              {"t": "tinggi"},
              {"LMt": "Luas Media Tanam"}
            ],
            "img": "",
            "select": 3,
            "id_MenuRawatan": 3,
            "typeProses": "Diketahui",
          },
          {
            "id": 4,
            "idKalkulasi": 0,
            "idMediaTanam": 0,
            "vari": "LMt",
            "nama": "Belah Ketupat",
            "rumus": {"LMt": "(1/2)*d*f"},
            "value": {},
            "fieldValue": [
              {"d": "Diagonal1"},
              {"f": "Diagonal2"},
              {"LMt": "Luas Media Tanam"}
            ],
            "img": "",
            "select": 4,
            "id_MenuRawatan": 3,
            "typeProses": "Diketahui",
          },
          {
            "id": 5,
            "idKalkulasi": 0,
            "idMediaTanam": 0,
            "vari": "LMt",
            "nama": "Layang-layang",
            "rumus": {"LMt": "(1/2)*d*f"},
            "value": {},
            "fieldValue": [
              {"d": "Diagonal1"},
              {"f": "Diagonal2"},
              {"LMt": "Luas Media Tanam"}
            ],
            "img": "",
            "select": 5,
            "id_MenuRawatan": 3,
            "typeProses": "Diketahui",
          },
          {
            "id": 6,
            "idKalkulasi": 0,
            "idMediaTanam": 0,
            "vari": "LMt",
            "nama": "Trapesium",
            "rumus": {"LMt": "(1/2)*(a+b)*t"},
            "value": {},
            "fieldValue": [
              {"a": "Alas a"},
              {"b": "alas b"},
              {"t": "tinggi"},
              {"LMt": "Luas Media Tanam"}
            ],
            "img": "",
            "select": 6,
            "id_MenuRawatan": 3,
            "typeProses": "Diketahui",
          },
          {
            "id": 7,
            "idKalkulasi": 0,
            "idMediaTanam": 0,
            "vari": "LMt",
            "nama": "Lingkaran",
            "rumus": {"LMt": "3.14*r*r"},
            "value": {},
            "fieldValue": [
              {"r": "Jari - jari"},
              {"LMt": "Luas Media Tanam"}
            ],
            "img": "",
            "select": 7,
            "id_MenuRawatan": 3,
            "typeProses": "Diketahui",
          },
        ],
        "KPprLn": [
          {
            "id": 0,
            "idKalkulasi": 0,
            "idMediaTanam": 999,
            "vari": "KPprLn",
            "nama": "hasil select",
            // "rumus": {"KPprLn": {"rumus":"(LMt/10000)*Jpk","type":"msTm"},"hrg": {"rumus":"Jpk*hrga","type":"mmTm"}

            "rumus": {"KPprLn": "(LMt/10000)*Jpk", "hrga": "KPprLn*hrg"},
            "value": {},
            "fieldValue": [
              {"JPk": "Takaran"},
              {"LMt": "Luas Media Tanam"},
              {"KPprLn": "Keperluan Puouk Per Lahan"}
            ],
            "img": "", "select": 0,
            "id_MenuRawatan": 3,
            "typeProses": "Dijawab",
          },
          {
            "id": 19,
            "idKalkulasi": 0,
            "idMediaTanam": 999,
            "vari": "KPprLn",
            "nama": "Kebutuhan Pupuk Per Lahan",
            "rumus": {"KPprLn": "(LMt/10000)*Jpk", "hrga": "KPprLn*hrg"},
            "value": {},
            "fieldValue": [
              {"JPk": "Takaran"},
              {"LMt": "Luas Media Tanam"},
              {"KPprLn": "Keperluan Puouk Per Lahan"}
            ],
            "img": "",
            "select": 0,
            "id_MenuRawatan": 3,
            "typeProses": "Dijawab",
          },
        ],
      },
      {
        "JPk": [],
      },
      {
        "JPk": [],
      },
    ],
  },
  {
    "id": 4,
    "namaMenurawatan": "Rawat Maggot",
    "img": "assets/images/MenuRawatan/Rawat_Maggot.png",
    "colorku": ["4D7C75", "FFFFFF", "2E8276"],
    "tagline1": "Maggot Terawat",
    "tagline2": "Kepedulian Terwujud",
    "fitur": ["Kalkulator pembesaran"],
    'img_banner': [
      "assets/images/MenuRawatan/RawatTanam/kolam_maggot.png",
      "assets/images/MenuRawatan/RawatTanam/kolam_maggot.png",
      "assets/images/MenuRawatan/RawatTanam/backgrond motor-06.jpg"
    ],
    "img_produks": ["assets/images/MenuRawatan/RawatTanam/kolam_maggotpro.png"],
    "perlengkapan": ["Bibit", "Pakan", "Kolam", "Obat"],
    "multi": true,
    "Diketahui": {
      "dosisKomoditas": [],
    },
    "rumus": [
      {
        "JPk": [],
        "Jpk": [
          {
            "id": 0,
            "idKalkulasi": 0,
            "idMediaTanam": 999,
            "vari": "Jpk",
            "nama": "Pupuk input",
            "rumus": {"Jpk": ""},
            "value": {},
            "fieldValue": [
              {"a": "alas"}
            ],
            "id_MenuRawatan": 4,
            "typeProses": "Diketahui",
            "img": "",
            "select": 0
          },
          {
            "id": 27,
            "idKalkulasi": 0,
            "idMediaTanam": 999,
            "vari": "Jpk",
            "nama": "Pupuk input",
            "rumus": {"Jpk": ""},
            "value": {},
            "fieldValue": [
              {"a": "alas"}
            ],
            "id_MenuRawatan": 4,
            "typeProses": "Diketahui",
            "img": "",
            "select": 0
          },
        ],
        "LMt": [
          {
            "id": 0,
            "idKalkulasi": 0,
            "idMediaTanam": 0,
            "vari": "LMt",
            "nama": "hasil Select",
            "rumus": {"LMt": "(1/2)*a*t"},
            "value": {},
            "fieldValue": [
              {"a": "Alas"},
              {"t": "Tinggi"},
              {"LMt": "Luas Media Tanam"}
            ],
            "id_MenuRawatan": 4,
            "typeProses": "Diketahui",
            "img": "",
            "select": 0
          },
          {
            "id": 0,
            "idKalkulasi": 0,
            "idMediaTanam": 0,
            "vari": "LMt",
            "nama": "Segitiga",
            "rumus": {"LMt": "(1/2)*a*t"},
            "value": {},
            "fieldValue": [
              {"a": "Alas"},
              {"t": "Tinggi"},
              {"LMt": "Luas Media Tanam"}
            ],
            "id_MenuRawatan": 4,
            "typeProses": "Diketahui",
            "img": "",
            "select": 0
          },
          {
            "id": 1,
            "idKalkulasi": 0,
            "idMediaTanam": 0,
            "vari": "LMt",
            "nama": "Persegi",
            "rumus": {"LMt": "s*s"},
            "value": {},
            "fieldValue": [
              {"s": "Sisi"},
              {"LMt": "Luas Media Tanam"}
            ],
            "img": "",
            "select": 1,
            "id_MenuRawatan": 4,
            "typeProses": "Diketahui",
          },
          {
            "id": 2,
            "idKalkulasi": 0,
            "idMediaTanam": 0,
            "vari": "LMt",
            "nama": "Persegi Panjang",
            "rumus": {"LMt": "p*l"},
            "value": {},
            "fieldValue": [
              {"p": "Panjang"},
              {"l": "lebar"},
              {"LMt": "Luas Media Tanam"}
            ],
            "img": "",
            "select": 2,
            "id_MenuRawatan": 4,
            "typeProses": "Diketahui",
          },
          {
            "id": 3,
            "idKalkulasi": 0,
            "idMediaTanam": 0,
            "vari": "LMt",
            "nama": "Jajar Genjang",
            "rumus": {"LMt": "a*t"},
            "value": {},
            "fieldValue": [
              {"a": "alas"},
              {"t": "tinggi"},
              {"LMt": "Luas Media Tanam"}
            ],
            "img": "",
            "select": 3,
            "id_MenuRawatan": 4,
            "typeProses": "Diketahui",
          },
          {
            "id": 4,
            "idKalkulasi": 0,
            "idMediaTanam": 0,
            "vari": "LMt",
            "nama": "Belah Ketupat",
            "rumus": {"LMt": "(1/2)*d*f"},
            "value": {},
            "fieldValue": [
              {"d": "Diagonal1"},
              {"f": "Diagonal2"},
              {"LMt": "Luas Media Tanam"}
            ],
            "img": "",
            "select": 4,
            "id_MenuRawatan": 4,
            "typeProses": "Diketahui",
          },
          {
            "id": 5,
            "idKalkulasi": 0,
            "idMediaTanam": 0,
            "vari": "LMt",
            "nama": "Layang-layang",
            "rumus": {"LMt": "(1/2)*d*f"},
            "value": {},
            "fieldValue": [
              {"d": "Diagonal1"},
              {"f": "Diagonal2"},
              {"LMt": "Luas Media Tanam"}
            ],
            "img": "",
            "select": 5,
            "id_MenuRawatan": 4,
            "typeProses": "Diketahui",
          },
          {
            "id": 6,
            "idKalkulasi": 0,
            "idMediaTanam": 0,
            "vari": "LMt",
            "nama": "Trapesium",
            "rumus": {"LMt": "(1/2)*(a+b)*t"},
            "value": {},
            "fieldValue": [
              {"a": "Alas a"},
              {"b": "alas b"},
              {"t": "tinggi"},
              {"LMt": "Luas Media Tanam"}
            ],
            "img": "",
            "select": 6,
            "id_MenuRawatan": 4,
            "typeProses": "Diketahui",
          },
          {
            "id": 7,
            "idKalkulasi": 0,
            "idMediaTanam": 0,
            "vari": "LMt",
            "nama": "Lingkaran",
            "rumus": {"LMt": "3.14*r*r"},
            "value": {},
            "fieldValue": [
              {"r": "Jari - jari"},
              {"LMt": "Luas Media Tanam"}
            ],
            "img": "",
            "select": 7,
            "id_MenuRawatan": 4,
            "typeProses": "Diketahui",
          },
        ],
        "KPprLn": [
          {
            "id": 0,
            "idKalkulasi": 0,
            "idMediaTanam": 999,
            "vari": "KPprLn",
            "nama": "hasil select",
            // "rumus": {"KPprLn": {"rumus":"(LMt/10000)*Jpk","type":"msTm"},"hrg": {"rumus":"Jpk*hrga","type":"mmTm"}

            "rumus": {"KPprLn": "(LMt/10000)*Jpk", "hrga": "KPprLn*hrg"},
            "value": {},
            "fieldValue": [
              {"JPk": "Takaran"},
              {"LMt": "Luas Media Tanam"},
              {"KPprLn": "Keperluan Puouk Per Lahan"}
            ],
            "img": "", "select": 0,
            "id_MenuRawatan": 4,
            "typeProses": "Dijawab",
          },
          {
            "id": 19,
            "idKalkulasi": 0,
            "idMediaTanam": 999,
            "vari": "KPprLn",
            "nama": "Kebutuhan Pupuk Per Lahan",
            "rumus": {"KPprLn": "(LMt/10000)*Jpk", "hrga": "KPprLn*hrg"},
            "value": {},
            "fieldValue": [
              {"JPk": "Takaran"},
              {"LMt": "Luas Media Tanam"},
              {"KPprLn": "Keperluan Puouk Per Lahan"}
            ],
            "img": "",
            "select": 0,
            "id_MenuRawatan": 4,
            "typeProses": "Dijawab",
          },
        ],
      },
      {
        "JPk": [],
      },
      {
        "JPk": [],
      },
    ],
  },
  {
    "id": 5,
    "namaMenurawatan": "Rawat Ayam",
    "img": "assets/images/MenuRawatan/Rawat_Ayam.png",
    "colorku": ["C9761C", "FFFFFF", "754418"],
    "tagline1": "Ayam Terawat",
    "tagline2": "Kepedulian Terwujud",
    "fitur": ["Kalkulator pembesaran "],
    'img_banner': [
      "assets/images/MenuRawatan/RawatTanam/kolam_ayam.png",
      "assets/images/MenuRawatan/RawatTanam/kolam_ayam.png",
      "assets/images/MenuRawatan/RawatTanam/backgrond motor-05.jpg"
    ],
    "img_produks": ["assets/images/MenuRawatan/RawatTanam/kolam_ayampro.png"],
    "perlengkapan": ["Bibit", "Pakan", "Kolam", "Obat"],
    "multi": true,
    "Diketahui": {
      "dosisKomoditas": [],
    },
    "rumus": [
      {
        "JPk": [],
      },
      {
        "JPk": [],
      }
    ],
  },
];

class KategoriRumusNew {
  int id;
  int idKalkulasi;
  int idMediaTanam;
  String vari;
  String nama;
  Map rumus;
  Map valuess;
  List fieldValue;
  String img;
  int id_MenuRawatan;
  int select;
  String typeProses;
  KategoriRumusNew(
      {required this.id,
      required this.idKalkulasi,
      required this.idMediaTanam,
      required this.vari,
      required this.nama,
      required this.rumus,
      required this.valuess,
      required this.fieldValue,
      required this.img,
      required this.id_MenuRawatan,
      required this.select,
      required this.typeProses});
}

//
// List<KategoriRumusNew> dataKategoriRumusNew = [
//   for (var i = 0; i < kategoriRumusNew.length; i++)
//     KategoriRumusNew(
//         id: i,
//         idKalkulasi: kategoriRumus[i]["idKalkulasi"],
//         idMediaTanam: kategoriRumus[i]["idMediaTanam"],
//         vari: kategoriRumus[i]["vari"],
//         nama: kategoriRumus[i]["nama"],
//         rumus: kategoriRumus[i]["rumus"],
//         valuess: kategoriRumus[i]["value"],
//         fieldValue: kategoriRumus[i]["fieldValue"],
//         img: kategoriRumus[i]["img"],
//         id_MenuRawatan: kategoriRumus[i]["id_MenuRawatan"])
// ];

class KategoriMenuRawatan {
  String id;
  String namaMenurawatan;
  String img;
  List colorku;
  String tagline1;
  String tagline2;
  List fitur;
  List img_banner;
  List img_produks;
  List perlengkapan;
  bool multi;
  List rumus;
  Map diketahui;

  KategoriMenuRawatan(
      {required this.id,
      required this.namaMenurawatan,
      required this.img,
      required this.colorku,
      required this.tagline1,
      required this.tagline2,
      required this.fitur,
      required this.img_banner,
      required this.img_produks,
      required this.perlengkapan,
      required this.multi,
      required this.rumus,
      required this.diketahui});

  KategoriMenuRawatan.fromJson(Map json)
      : id = json["id"],
        namaMenurawatan = json["namaMenurawatan"],
        img = json["img"],
        colorku = json["colorku"],
        tagline1 = json["tagline1"],
        tagline2 = json["tagline2"],
        fitur = json["fitur"],
        img_banner = json["img_banner"],
        img_produks = json["img_produks"],
        perlengkapan = json["perlengkapan"],
        multi = json["multi"],
        rumus = json["rumus"],
        diketahui = json["Diketahui"];

  static List<KategoriMenuRawatan> decodew(List<dynamic> listData) {
    return (listData).map<KategoriMenuRawatan>((item) {
      return KategoriMenuRawatan.fromJson(item);
    }).toList();
  }
}

List<KategoriMenuRawatan> dataKategoriMenuRawatan = [
  for (var i = 0; i < kategoriMenurawatan.length; i++)
    KategoriMenuRawatan(
        id: i.toString(),
        namaMenurawatan: kategoriMenurawatan[i]["namaMenurawatan"],
        img: kategoriMenurawatan[i]["img"],
        colorku: kategoriMenurawatan[i]["colorku"],
        tagline1: kategoriMenurawatan[i]["tagline1"],
        tagline2: kategoriMenurawatan[i]["tagline2"],
        fitur: kategoriMenurawatan[i]["fitur"],
        img_banner: kategoriMenurawatan[i]["img_banner"],
        img_produks: kategoriMenurawatan[i]["img_produks"],
        perlengkapan: kategoriMenurawatan[i]['perlengkapan'],
        multi: kategoriMenurawatan[i]["multi"],
        rumus: kategoriMenurawatan[i]["rumus"],
        diketahui: kategoriMenurawatan[i]["Diketahui"])
];

// class Updateku extends GetxController {
//   var data_inputku = {};
