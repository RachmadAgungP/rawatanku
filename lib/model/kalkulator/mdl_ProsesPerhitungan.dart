List dataPerhitunganLuasMediaTanam = [
  {
    "id": 0,
    "idMediaTanam": 0,
    "idRumus": 2,
    "variabels": {},
    "fieldValue": [],
    "satuan": "m",
    "luas": 0.0,
  },
  {
    "id": 1,
    "idMediaTanam": 0,
    "idRumus": 1,
    "variabels": {},
    "fieldValue": [],
    "satuan": "m",
    "luas": 0.0,
  },
  {
    "id": 2,
    "idMediaTanam": 2,
    "idRumus": 17,
    "variabels": {},
    "fieldValue": [],
    "satuan": "m",
    "luas": 0.0,
  },
];

class DataPerhitunganLuasMediaTanam {
  int id;
  int idmediatanam;
  int idRumus;
  Map variabels;
  List fieldValue;
  String satuan;
  double luas;
  DataPerhitunganLuasMediaTanam({
    required this.id,
    required this.idmediatanam,
    required this.idRumus,
    required this.variabels,
    required this.fieldValue,
    required this.satuan,
    required this.luas,
  });
}

List<DataPerhitunganLuasMediaTanam> dataPerhitunganLuasMediaTanamObj = [
  for (var i = 0; i < dataPerhitunganLuasMediaTanam.length; i++)
    DataPerhitunganLuasMediaTanam(
      id: i,
      idmediatanam: dataPerhitunganLuasMediaTanam[i]["idMediaTanam"],
      idRumus: dataPerhitunganLuasMediaTanam[i]["idRumus"],
      variabels: dataPerhitunganLuasMediaTanam[i]["variabels"],
      fieldValue: dataPerhitunganLuasMediaTanam[i]["fieldValue"],
      satuan: dataPerhitunganLuasMediaTanam[i]["satuan"],
      luas: dataPerhitunganLuasMediaTanam[i]["luas"],
    )
];
