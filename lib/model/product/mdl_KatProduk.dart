List kategoriProduk = [
  {"id": 0, "produk": "Pupuk", "img": ""},
  {"id": 2, "produk": "Peptisida", "img": ""},
  {"id": 3, "produk": "Bahan Kimia", "img": ""},
  {"id": 4, "produk": "Tanaman", "img": ""},
  {"id": 5, "produk": "Lainnya", "img": ""},
  {"id": 6, "produk": "Pakan", "img": ""},
  {"id": 7, "produk": "Obat", "img": ""},
  {"id": 9, "produk": "Listrik", "img": ""},
];

class KategoriProduk {
  int id;
  String produk;
  String img;
  KategoriProduk({required this.id, required this.produk, required this.img});
}

List<KategoriProduk> dataKategoriProduk = [
  for (var i = 0; i < kategoriProduk.length; i++)
    KategoriProduk(
      id: i,
      produk: kategoriProduk[i]["produk"],
      img: kategoriProduk[i]["img"],
    )
];
