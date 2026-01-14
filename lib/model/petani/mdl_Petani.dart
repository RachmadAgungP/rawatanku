List dataPetani = [
  {
    "id": 0,
    "id_user": "dasdasdaaf",
    "nama": "Agung",
    "notelp": "089687308071",
    "alamat": {
      "prov": "Jawa Timur",
      "kab": "Gresik",
      "kec": "Duduk Sampeyan",
      "desa": "Tebaloan"
    },
    "pertanian": [
      {
        "komoditi": "Padi",
        "boolKom": false,
        "visiKom": false,
        "pupuk": [
          {"boolPup": false, "visiPup": false, "namaPupu": "urea"}
        ],
        "luas": "10000"
      }
    ]
  }
];

class DataPetani {
  int id;
  String id_user;
  String nama;
  String notelp;
  Map<String, String> alamat;
  List<Map<String, dynamic>> pertanian;
  bool isMine;
  DataPetani(
      {required this.id,
      required this.id_user,
      required this.nama,
      required this.notelp,
      required this.alamat,
      required this.pertanian,
      required this.isMine});

  DataPetani.fromMap({
    required Map<String, dynamic> map,
    required String myUserId,
  })  : id = map['id'],
        id_user = map["id_user"],
        nama = map["nama"],
        notelp = map["notelp"],
        alamat = map["alamat"],
        pertanian = map["pertanian"],
        isMine = myUserId == map['id_user'];
}

DataPetani dataPetanisObj = DataPetani(
  id: 0,
  id_user: dataPetani[0]["id_user"],
  nama: dataPetani[0]["nama"],
  notelp: dataPetani[0]["notelp"],
  alamat: dataPetani[0]["alamat"],
  pertanian: dataPetani[0]["pertanian"],
  isMine: true,
);
