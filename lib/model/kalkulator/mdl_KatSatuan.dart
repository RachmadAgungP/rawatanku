List kategoriSatuan = [
  {"id": 1, "satuan": "m"},
  {"id": 2, "satuan": "m²"},
  {"id": 3, "satuan": "m³"},
  {"id": 4, "satuan": "cm"},
  {"id": 5, "satuan": "cm²"},
  {"id": 6, "satuan": "cm³"},
  {"id": 7, "satuan": "kg/ha"},
  {"id": 8, "satuan": "gr/Pohon"},
  {"id": 9, "satuan": "L/Ha"},
  {"id": 10, "satuan": "L"},
  {"id": 11, "satuan": "Ha"},
  {"id": 12, "satuan": "Pohon"},
  {"id": 13, "satuan": "Kg"},
  {"id": 14, "satuan": "gr"},
  {"id": 15, "satuan": "Bedegan"},
  {"id": 16, "satuan": "Kg/m"},
  {"id": 17, "satuan": "Kg/m²"},
  {"id": 18, "satuan": "Kg/m³"},
  {"id": 19, "satuan": "gr/cm"},
  {"id": 20, "satuan": "gr/cm²"},
  {"id": 21, "satuan": "gr/cm³"},
  {"id": 21, "satuan": "%"},
];

class KategoriSatuan {
  int id;
  String satuan;

  KategoriSatuan({required this.id, required this.satuan});
}

List<KategoriSatuan> dataKategoriSatuan = [
  for (var i = 0; i < kategoriSatuan.length; i++)
    KategoriSatuan(id: i, satuan: kategoriSatuan[i]["satuan"])
];
