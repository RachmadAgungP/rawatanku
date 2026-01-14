List kategoriPerusahaan = [
  {
    "id": 0,
    "perusahaan": "PT.Petrokimia Gresik",
    "img": "assets/images/Petrokimia_logo.png"
  },
  {
    "id": 1,
    "perusahaan": "PT.Meroke Tetap Jaya",
    "img": "assets/images/meroke-tetap-jaya-logo.png"
  },
  {
    "id": 2,
    "perusahaan": "CV. Saprotan Utama",
    "img": "assets/images/logo-saprotan.png"
  },
  {
    "id": 3,
    "perusahaan": "Rawatan",
    "img": "assets/images/logo.png"
  },
  {
    "id": 4,
    "perusahaan": "Aplikator",
    "img": "assets/images/logo-saprotan.png"
  },
  // {
  //   "id": 3,
  //   "perusahaan": "PT Pupuk Kalimantan Timur",
  //   "img": "assets/images/meroke-tetap-jaya-logo.png"
  // },
  // {
  //   "id": 4,
  //   "perusahaan": "PT Pupuk Iskandar Muda",
  //   "img": "assets/images/meroke-tetap-jaya-logo.png"
  // },
  // {
  //   "id": 5,
  //   "perusahaan": "PT Pupuk Sriwidjaja Palembang",
  //   "img": "assets/images/meroke-tetap-jaya-logo.png"
  // },
];

class KategoriPerusahaan {
  int id;
  String perusahaan;
  String img;
  KategoriPerusahaan({
    required this.id,
    required this.perusahaan,
    required this.img,
  });
}

List<KategoriPerusahaan> dataKategoriPerusahaan = [
  for (var i = 0; i < kategoriPerusahaan.length; i++)
    KategoriPerusahaan(
      id: i,
      perusahaan: kategoriPerusahaan[i]["perusahaan"],
      img: kategoriPerusahaan[i]["img"],
    )
];




