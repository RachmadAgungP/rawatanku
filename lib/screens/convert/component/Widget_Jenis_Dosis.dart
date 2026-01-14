List<Map<String, dynamic>> dosisPupuk = [
  {
    "id": 0,
    "nama": "Berat Senyawa Aktif",
    "img": "assets/images/pot/balok.png",
    "variabels": {
      "DosisUrea_0": ["N", 0.0],
      "DosisSp36_0": ["P2O5", 0.0],
      "DosisKCL_0": ["K2O", 0.0]
    },
    "fieldValue": [],
    "satuan": "Kg/Ha",
    "satuanBahan": "Berat Senyawa Aktif",
    "typePemupukan": "Tunggal",
    "hasil": {
      "OutputDosisUrea_0": ["Out Dosis Urea0", 0.0],
      "OutputDosisSp36_0": ["Out Dosis Sp360", 0.0],
      "OutputDosisKCL_0": ["Out Dosis KCL0", 0.0]
    },
    "rumusStr": {
      "DosisUrea_0": [
        "NH4",
        "DosisUrea_0 / 46 * 100",
      ],
      "DosisSp36_0": [
        "P2O5",
        "DosisSp36_0 / 36 * 100",
      ],
      "DosisKCL_0": ["K2O", "DosisKCL_0 / 60 * 100"]
    },
    "perhitungan": {
      "DosisUrea_0": ["N", "0.0"],
      "DosisSp36_0": ["P2O5", "0.0"],
      "DosisKCL_0": ["K2O", "0.0"],
      "luas": [
        "Luas",
        ["1", "2","3"]
      ]
    },
    "hasilAkhir": {
      "0": [
        "hasil proses 1",
        0.0
      ],
      "1": [
        "hasil proses 1",
        0.0
      ],
      "2": [
        "hasil proses 1",
        0.0
      ]
    },
    "luas": 0.0,
  },
  {
    "id": 1,
    "nama": "Berat Pupuk",
    "img": "assets/images/pot/balok.png",
    "variabels": {
      "DosisUrea_0": ["Urea", 0.0],
      "DosisSp36_0": ["Sp36", 0.0],
      "DosisKCL_0": ["KCL", 0.0]
    },
    "fieldValue": [],
    "satuan": "Kg/Ha",
    "satuanBahan": "Berat Pupuk",
    "typePemupukan": "Tunggal",
    "hasil": {
      "OutputDosisUrea_0": ["Out Dosis Urea0", 0.0],
      "OutputDosisSp36_0": ["Out Dosis Sp360", 0.0],
      "OutputDosisKCL_0": ["Out Dosis KCL0", 0.0]
    },
    "rumusStr": {
      "DosisUrea_0": [
        "Urea",
        "DosisUrea_0",
      ],
      "DosisSp36_0": [
        "Sp36",
        "DosisSp36_0",
      ],
      "DosisKCL_0": ["KCL", "DosisKCL_0"]
    },
    "perhitungan": {
      "DosisUrea_0": ["Urea", "0.0"],
      "DosisSp36_0": ["Sp36", "0.0"],
      "DosisKCL_0": ["KCL", "0.0"],
      "luas": [
        "Berat",
        ["1", "2","3"]
      ]
    },
    "hasilAkhir": {
      "0": [
        "hasil proses 1",
        0.0
      ],
      "1": [
        "hasil proses 1",
        0.0
      ],
      "2": [
        "hasil proses 1",
        0.0
      ]
    },
    "luas": 0.0,
  }
];
int stateIDdosis = 0;

class DosisPupuk {
  int id;
  String nama;
  String img;
  Map<String, dynamic> variabels;
  List<dynamic> fieldValue;
  String satuanBahan;
  String satuan;
  String typePemupukan;
  Map<String, dynamic> hasil;
  Map<String, dynamic> rumusStr;
  Map<String, dynamic> perhitungan;
  Map<String, dynamic> hasilAkhir;
  double luas;

  DosisPupuk(
      {required this.id,
      required this.nama,
      required this.img,
      required this.variabels,
      required this.fieldValue,
      required this.satuanBahan,
      required this.satuan,
      required this.typePemupukan,
      required this.hasil,
      required this.rumusStr,
      required this.perhitungan,
      required this.hasilAkhir,
      required this.luas});
}

List<DosisPupuk> listdosisPupuk = [
  for (var i = 0; i < dosisPupuk.length; i++)
    DosisPupuk(
        id: i,
        nama: dosisPupuk[i]["nama"],
        img: dosisPupuk[i]["img"],
        variabels: dosisPupuk[i]["variabels"],
        fieldValue: dosisPupuk[i]["fieldValue"],
        satuanBahan: dosisPupuk[i]["satuanBahan"],
        satuan: dosisPupuk[i]["satuan"],
        typePemupukan: dosisPupuk[i]["typePemupukan"],
        hasil: dosisPupuk[i]["hasil"],
        rumusStr: dosisPupuk[i]["rumusStr"],
        perhitungan: dosisPupuk[i]["perhitungan"],
        hasilAkhir: dosisPupuk[i]["hasilAkhir"],
        luas: dosisPupuk[i]["luas"])
];
