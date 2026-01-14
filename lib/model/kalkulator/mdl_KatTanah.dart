List kategoriTanah = [
  {"id": 0, "tanah": "Mineral", "masaJenis": 1.0, "img": ""},
  {"id": 1, "tanah": "Andisols", "masaJenis": 1.1, "img": ""},
  {"id": 2, "tanah": "Gambut", "masaJenis": 0.5, "img": ""},
  {"id": 3, "tanah": "Pasir", "masaJenis": 1.55, "img": ""},
  {"id": 4, "tanah": "Liat", "masaJenis": 1.075, "img": ""},
];

class KategoriTanah {
  int id;
  String tanah;
  double masaJenis;
  String img;
  KategoriTanah({required this.id, required this.tanah, required this.masaJenis, required this.img});
}

List<KategoriTanah> dataKategoriTanah = [
  for (var i = 0; i < kategoriTanah.length; i++)
    KategoriTanah(
      id: i,
      tanah: kategoriTanah[i]["tanah"],
      masaJenis: kategoriTanah[i]["masaJenis"],
      img: kategoriTanah[i]["img"],
    )
];
