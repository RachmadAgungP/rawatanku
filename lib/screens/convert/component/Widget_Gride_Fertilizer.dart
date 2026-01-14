List<Map<String, dynamic>> dataGFertilizer = [
  {
    "id": 0,
    "nama": "Gride Fertilizer",
    "img": "assets/images/pot/balok.png",
    "variabels": {
      "GF_N": ["Gride Fertilizer N", 0.0],
      "GF_P": ["Gride Fertilizer P", 0.0],
      "GF_K": ["Gride Fertilizer K", 0.0],
      "berat": ["Berat NPK", 0.0]
    },
    "fieldValue": [],
    "satuan": "%",
    "hasil": {
      "GF_N": ["Bahan Aktif NH4", 0.0],
      "GF_P": ["Bahan Aktif P2O5", 0.0],
      "GF_K": ["Bahan Aktif K2O", 0.0],
      "berat": ["Berat NPK", 0.0]
    },
    "rumusStr": {
      "GF_N": [
        "NH4",
        "(GF_N / 100) * berat",
      ],
      "GF_P": [
        "P2O5",
        "(GF_P / 100) * berat",
      ],
      "GF_K": ["K2O", "(GF_K / 100) * berat"],
    },
    "perhitungan": {
      "DosisUrea_0": ["Urea", "0.0"],
      "DosisSp36_0": ["Sp36", "0.0"],
      "DosisKCL_0": ["KCL", "0.0"],
      "berat": ["Berat NPK", "0.0"],
      "luas": [
        "Hasil",
        ["1", "2"]
      ]
    },
    "hasilAkhir": {
      "0": [
        "hasil proses 1",
        [0.0,0.0,0.0]
      ]
    },
    "luas": 0.0,
  },
];

class GrideFer {
  int id;
  String nama;
  String img;
  Map<String, dynamic> variabels;
  List<dynamic> fieldValue;
  String satuan;
  Map<String, dynamic> hasil;
  Map<String, dynamic> rumusStr;
  Map<String, dynamic> perhitungan;
  Map<String, dynamic> hasilAkhir;

  GrideFer(
      {required this.id,
      required this.nama,
      required this.img,
      required this.variabels,
      required this.fieldValue,
      required this.satuan,
      required this.hasil,
      required this.rumusStr,
      required this.perhitungan,
      required this.hasilAkhir});
}

List<GrideFer> listGrideFer = [
  for (var i = 0; i < dataGFertilizer.length; i++)
    GrideFer(
        id: i,
        nama: dataGFertilizer[i]["nama"],
        img: dataGFertilizer[i]["img"],
        variabels: dataGFertilizer[i]["variabels"],
        fieldValue: dataGFertilizer[i]["fieldValue"],
        satuan: dataGFertilizer[i]["satuan"],
        hasil: dataGFertilizer[i]["hasil"],
        rumusStr: dataGFertilizer[i]["rumusStr"],
        perhitungan: dataGFertilizer[i]["perhitungan"],
        hasilAkhir: dataGFertilizer[i]["hasilAkhir"])
];
