List<Map<String, dynamic>> datastypeLahan = [
  {
    "id": 0,
    "nama": "Lahan Rata",
    "img": "assets/images/pot/balok.png",
    "variabels": {
      "P_0": ["Panjang Lahan", 0.0],
      "L_0": ["Lebar Lahan", 0.0]
    },
    "fieldValue": [],
    "satuan": "m",
    "typeLahan": "Lahan Rata",
    "hasil": {
      "OutputPanjangLahan_0": ["Out Panjang Lahan", 0.0],
      "OutputLebarLahan_0": ["Out Lebar Lahan", 0.0]
    },
    "rumusStr": {
      "0": ["proses1", "(P_0 * L_0)"],
    },
    "perhitungan": {
      "P_0": ["Panjang Lahan", "P"],
      "L_0": ["Lebar Lahan", "L"],
      "luas": [
        "Luas",
        ["1", "2"]
      ]
    },
    "hasilAkhir": {
      "0": [
        "hasil proses 1",
        [0.0]
      ]
    },
    "luas": 0.0,
  },
  {
    "id": 1,
    "nama": "Lahan Bedengan",
    "img": "assets/images/pot/balok.png",
    "variabels": {
      "P_0": ["Panjang Bedengan", 0.0],
      "L_0": ["Lebar Bedengan", 0.0],
      "TB_0": ["Banyak Bedengan", 0],
    },
    "fieldValue": [],
    "satuan": "m",
    "typeLahan": "Lahan Bedengan",
    "hasil": {
      "OutputPanjangLahan_0": ["Panjang Bedengan", 0.0],
      "OutputLebarLahan_0": ["Lebar Bedengan", 0.0],
      "OutTotalBedengan_0": ["Banyak Bedengan", 0]
    },
    "rumusStr": {
      "0": ["proses1", "(P_0 * L_0)"]
    },
    "perhitungan": {
      "P_0": ["Panjang Bedengan", "0.0"],
      "L_0": ["Lebar Bedengan", "0.0"],
      "TB_0": ["Banyak Bedengan", "Bedengan"],
      "luas": [
        "Luas",
        ["1", "2"]
      ]
    },
    "hasilAkhir": {
      "0": [
        "hasil proses 1",
        [0.0]
      ]
    },
    "luas": 0.0
  },
];
// int stateTypeLahan = 0;

class TypeLahan {
  int id;
  String nama;
  String img;
  Map<String, dynamic> variabels;
  List<dynamic> fieldValue;
  String satuan;
  String typeLahan;
  Map<String, dynamic> hasil;
  Map<String, dynamic> rumusStr;
  Map<String, dynamic> perhitungan;
  Map<String, dynamic> hasilAkhir;
  double luas;

  TypeLahan(
      {required this.id,
      required this.nama,
      required this.img,
      required this.variabels,
      required this.fieldValue,
      required this.satuan,
      required this.typeLahan,
      required this.hasil,
      required this.rumusStr,
      required this.perhitungan,
      required this.hasilAkhir,
      required this.luas});
}

List<TypeLahan> listTypeLahan = [
  for (var i = 0; i < datastypeLahan.length; i++)
    TypeLahan(
        id: i,
        nama: datastypeLahan[i]["nama"],
        img: datastypeLahan[i]["img"],
        variabels: datastypeLahan[i]["variabels"],
        fieldValue: datastypeLahan[i]["fieldValue"],
        satuan: datastypeLahan[i]["satuan"],
        typeLahan: datastypeLahan[i]["typeLahan"],
        hasil: datastypeLahan[i]["hasil"],
        rumusStr: datastypeLahan[i]["rumusStr"],
        perhitungan: datastypeLahan[i]["perhitungan"],
        hasilAkhir: datastypeLahan[i]["hasilAkhir"],
        luas: datastypeLahan[i]["luas"])
];
