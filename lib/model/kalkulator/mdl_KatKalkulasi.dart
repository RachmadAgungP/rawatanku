
List kategoriKalkulasi = [
  {"id": 0, "nama": "Luas Media Tanam", "hasil": 0.5, "img": ""},
  {"id": 1, "nama": "Populasi Tanaman", "hasil": 1.1, "img": ""},
  {"id": 2, "nama": "Berat Tanah", "hasil": 1.0, "img": ""},
  {"id": 3, "nama": "Jenis Pemupukan", "hasil": 0.5, "img": ""},
  {"id": 4, "nama": "Kebutuhan Kapur", "hasil": 0.5, "img": ""},
  {"id": 5, "nama": "Jenis Produk Pupuk Perusahaan", "hasil": 0.5, "img": ""},
  {"id": 6, "nama": "Conversi Pupuk", "hasil": 0.5, "img": ""},
];

class KategoriKalkulasi {
  late int id;
  late String nama;
  late double hasil;
  late String img;
  KategoriKalkulasi({required this.id, required this.nama, required this.hasil, required this.img});
}

List<KategoriKalkulasi> dataKategoriKalkulasi = [
  for (var i = 0; i < kategoriKalkulasi.length; i++)
    KategoriKalkulasi(
      id: i,
      nama: kategoriKalkulasi[i]["nama"],
      hasil: kategoriKalkulasi[i]["hasil"],
      img: kategoriKalkulasi[i]["img"],
    )
];