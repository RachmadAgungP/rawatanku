import 'dart:convert';

List<dynamic> dataProducts = [
  {
    "id": 0,
    "idPerusahaan": 0,
    "nama": "Urea",
    "kandungan": 4,
    "bentuk": "cair",
    "title": "Pupuk Urea",
    "color": ["049942", "FFFFFF", "034f23"],
    "penjelas": "PT. Petrokimia Gresik",
    "img": "assets/images/product/subnonsub_urea.png",
    "brosure": ["assets/images/brosure/urea_1.jpg"],
    "informasi": {
      "spesifikasi": [
        "Hormon (Giberelin, Auksin, Sitokin)",
        "Asam Amino",
        "Unsur Hara Makro Mikro",
      ],
      "sifat": ["Cair", "Mudah larut dalam air"],
      "manfaat": [
        "Mempercepat Fase Perkecambahan Benih",
        "Menjaga Kelestarian Lingkungan",
        "Mempercepat Fase Pertumbuhan tanaman (Vegetatif dan Generatif)",
        "Mudah dalam Aplikasi di Lahan Mengurangi Biaya Produksi Tanam"
      ],
      "gejalaKekurangan": [""],
    },
    "bundle": {"Paket bundle": []},
    "countdownku": "00:00:00",
    "diskon": 0,
    "kategoriProduk": 0,
    "id_MenuRawatan": "1",
    "linkSp": "",
    "harga": "0"
  },
  // {
  //   "id": 1,
  //   "idPerusahaan": 0,
  //   "nama": "SP-36",
  //   "kandungan": 36,
  //   "bentuk": "granul",
  //   "title": "Pupuk SP-36",
  //   "color": ["747474", "011d0d", "034f23"],
  //   "penjelas": "PT. Petrokimia Gresik",
  //   "img": "assets/images/product/subnonsub_sp36.png",
  //   "brosure": ["assets/images/brosure/sp36_1.jpg"],
  //   "informasi": {
  //     "spesifikasi": [
  //       "Kadar P2O5 total minimal 36%",
  //       "Kadar P2O5 larut Asam Sitrat minimal 34%",
  //       "Kadar P2O5 larut dalam air minimal 30%",
  //       "Kadar air maksimal 5%",
  //       "Kadar Asam Bebas sebagai H3PO4 maksimal 6%",
  //       "Bentuk butiran",
  //       "Warna abu-abu",
  //       "Dikemas dalam kantong bercap Kerbau Emas dengan isi 50 kg"
  //     ],
  //     "sifat": ["Tidak higroskopis", "Mudah larut dalam air"],
  //     "manfaat": [
  //       "Sebagai sumber unsur hara Fosfor bagi tanaman",
  //       "Memacu pertumbuhan akar dan sistim perakaran yang baik",
  //       "Memacu pembentukan bunga dan masaknya buah/biji",
  //       "Mempercepat panen",
  //       "Memperbesar prosentase terbentuknya bunga menjadi buah/biji",
  //       "Menambah daya tahan tanaman terhadap gangguan hama, penyakit dan kekeringan"
  //     ],
  //     "gejalaKekurangan": [
  //       "Seluruh tanaman berwarna pucat kekuningan",
  //       "Pertumbuhan tanaman lambat dan kerdil"
  //     ]
  //   },
  //   "bundle": {"Paket bundle": []},
  //   "countdownku": "00:00:00",
  //   "diskon": 0,
  //   "kategoriProduk": 0,
  //   "id_MenuRawatan": "1",
  //   "linkSp":"","harga": "0"
  // },
//   {
//     "id": 2,
//     "idPerusahaan": 0,
//     "nama": "KCL",
//     "kandungan": 60,
//     "bentuk": "granul",
//     "title": "Pupuk KCL",
//     "color": ["049942", "011d0d", "034f23"],
//     "penjelas": "PT. Petrokimia Gresik",
//     "img": "assets/images/product/KCL.png",
//     "brosure": ["assets/images/brosure/KCL.png"],
//     "informasi": {
//       "spesifikasi": [
//         "Kadar K2O : 60%",
//         "Warna : Merah / Putih",
//         "Bentuk : Kristal"
//       ],
//       "sifat": ["Larut dalam air"],
//       "manfaat": [
//         "Membuat tanaman lebih tegak dan kokoh",
//         "Meningkatkan daya tahan tanaman terhadap serangan hama, penyakit, dan kekeringan",
//         "Meningkatkan pembentukan gula dan pati",
//         "Meningkatkan ketahanan hasil panen selama pengangkutan dan penyimpanan"
//       ],
//       "gejalaKekurangan": ["Daun Pucat diujung daun", "Daun mudah gugur"],
//     },
//     "bundle": {"Paket bundle": []},
//     "countdownku": "00:00:00",
//     "diskon": 0,
//     "kategoriProduk": 0,
//     "id_MenuRawatan": "1",
//     "linkSp":"","harga": "0"
//   },
//   {
//     "id": 3,
//     "idPerusahaan": 0,
//     "nama": "Phonska Plus",
//     "kandungan": 0,
//     "bentuk": "granul",
//     "title": "Phonska Plus",
//     "color": ["d11e25", "011d0d", "034f23"],
//     "penjelas": "PT. Petrokimia Gresik",
//     "img": "assets/images/product/phonska-plus.png",
//     "brosure": ["assets/images/brosure/phonskaplus_1.jpg"],
//     "informasi": {
//       "spesifikasi": [
//         "N (Nitrogen) : 15%",
//         "P2O5 (Fosfat) : 15%",
//         "K (Kalium) : 15%",
//         "S (Sulfur) : 9%",
//         "Zn (Zink) : 2.000 ppm",
//         "Bentuk : Granul",
//         "Warna : Putih (Natural White)",
//         "Kemasan : 25kg"
//       ],
//       "sifat": ["Larut dalam air"],
//       "manfaat": [
//         "Pupuk Majemuk NPK yang diperkaya dengan unsur Sulfur dan Zink",
//         "Meningkatkan efektifitas & efisiensi penggunaan pupuk",
//         "Meningkatkan jumlah & mutu hasil panen",
//         "Hasil racikan bahan baku melalui proses yang tepat sehingga menghasilkan kualitas campuran produk yang homogen"
//       ],
//       "gejalaKekurangan": [],
//     },
//     "bundle": {"Paket bundle": []},
//     "countdownku": "00:00:00",
//     "diskon": 0,
//     "kategoriProduk": 0,
//     "id_MenuRawatan": "1",
//     "linkSp":"","harga": "0"
//   },
//   {
//     "id": 4,
//     "idPerusahaan": 0,
//     "nama": "Ningrat",
//     "kandungan": 0,
//     "bentuk": "granul",
//     "title": "Petro Ningrat",
//     "color": ["917735", "011d0d", "034f23"],
//     "penjelas": "PT. Petrokimia Gresik",
//     "img": "assets/images/product/ningrat.png",
//     "brosure": ["assets/images/brosure/ningrat_1.jpg"],
//     "informasi": {
//       "spesifikasi": [
//         "N (Nitrogen) : 12%",
//         "P2O5 (Fosfat) : 11%,",
//         "K2O (Kalium) : 20%"
//       ],
//       "sifat": ["Larut dalam air"],
//       "manfaat": [
//         "Memiliki unsur hara yang sesuai dengan kebutuhan tanaman tembakau dan tanaman holtikultura",
//         "Rendah hara chlor (Cl) sehingga meningkatkan kualitas daun tembakau serta kualitas tanaman hortikultura sensitif chlor",
//         "Memperbaiki warna, aroma, rasa, dan kelenturan tembakau",
//         "Membuat tanaman tegak dan kokoh serta lebih tahan serangan hama penyakit",
//         "Merangsang pertumbuhan umbi dan buah",
//         "Cocok untuk lahan kering",
//         "Mengandung Nitrogen (N) berbasis Nitrat (NO3) yang mudah diserap tanaman"
//       ],
//       "gejalaKekurangan": [],
//     },
//     "bundle": {"Paket bundle": []},
//     "countdownku": "00:00:00",
//     "diskon": 0,
//     "kategoriProduk": 0,
//     "id_MenuRawatan": "1",
//     "linkSp":"","harga": "0"
//   },
//   {
//     "id": 5,
//     "idPerusahaan": 0,
//     "nama": "Nitrat",
//     "kandungan": 0,
//     "bentuk": "granul",
//     "title": "Petro Nitrat",
//     "color": ["005a82", "011d0d", "034f23"],
//     "penjelas": "PT. Petrokimia Gresik",
//     "img": "assets/images/product/nitrat.png",
//     "brosure": ["assets/images/brosure/nitrat_1.jpg"],
//     "informasi": {
//       "spesifikasi": [
//         "N (Nitrogen) : 16%",
//         "P2O5 (Fosfat) : 16 %,",
//         "K2O (Kalium) : 16%"
//       ],
//       "sifat": ["Larut dalam air"],
//       "manfaat": [
//         "Mengandung Nitrogen bentuk Nitrat",
//         "Unsur hara tersedia bagi tanaman",
//         "Kandungan Hara NPK Seimbang"
//       ],
//       "gejalaKekurangan": [],
//     },
//     "bundle": {"Paket bundle": []},
//     "countdownku": "00:00:00",
//     "diskon": 0,
//     "kategoriProduk": 0,
//     "id_MenuRawatan": "1",
//     "linkSp":"","harga": "0"
//   },
//   {
//     "id": 6,
//     "idPerusahaan": 0,
//     "nama": "BioFertil",
//     "kandungan": 0,
//     "bentuk": "granul",
//     "title": "Petro Bio Fertil",
//     "color": ["049942", "011d0d", "034f23"],
//     "penjelas": "PT. Petrokimia Gresik",
//     "img": "assets/images/product/Biofertille.png",
//     "brosure": [
//       "assets/images/brosure/biofertil_1.jpg",
//       "assets/images/brosure/biofertil_2.jpg"
//     ],
//     "informasi": {
//       "spesifikasi": [
//         "Bahan Aktif :\nMikroba penambat N dan penghasil zat pengatur tumbuh (ZPT)\nMikroba pelarut fosfat.\nMikroba perombak bahan organik.",
//         "Bahan Pembawa : Mineral dan bahan organik",
//         "Warna : Kecoklatan",
//         "Bentuk : Granul",
//         "Kemasan : 2kg, 5kg, dan 10kg",
//         "Masa simpan : 1 (satu) tahun"
//       ],
//       "sifat": ["Larut dalam air"],
//       "manfaat": [
//         "Mengefektifkan penggunaan pupuk an-organik, khususnya N dan P",
//         "Meningkatkan ketersediaan hara N dan P dalam tanah sehingga meningkatkan hasil panen."
//       ],
//       "gejalaKekurangan": [],
//     },
//     "bundle": {"Paket bundle": []},
//     "countdownku": "00:00:00",
//     "diskon": 0,
//     "kategoriProduk": 0,
//     "id_MenuRawatan": "1",
//     "linkSp":"","harga": "0"
//   },
//   {
//     "id": 7,
//     "idPerusahaan": 0,
//     "nama": "ZA",
//     "kandungan": 0,
//     "bentuk": "granul",
//     "title": "Pupuk ZA",
//     "color": ["e3b500", "011d0d", "034f23"],
//     "penjelas": "PT. Petrokimia Gresik",
//     "img": "assets/images/product/subnonsub_za.png",
//     "brosure": ["assets/images/brosure/za_1.jpg"],
//     "informasi": {
//       "spesifikasi": [
//         "Nitrogen minimal 20,8%",
//         "belerang minimal 23,8%",
//         "Kadar air maksimal 1%",
//         "kadar Asam Bebas sebagai H2SO4 maksimal 0,1%",
//         "Bentuk kristal",
//         "Warna putih",
//         "Warna orange untuk ZA bersubsidi",
//         "Dikemas dalam kantong bercap Kerbau Emas dengan isi 50 kg"
//       ],
//       "sifat": ["Larut dalam air"],
//       "manfaat": [
//         "Meningkatkan produksi hasil tebu & hablur gula (Rendeman)",
//         "Meningkatkan kelas mutu hasil panen dengan memperbaiki warna, aroma, rasa, dan besar umbi serta lebih kesat",
//         "Membantu tanaman lebih hijau",
//         "Unsur hara tersedia bagi tanaman",
//         "Membuat tanaman lebih hijau segar",
//         "Mempercepat dan m eningkatkan pertumbuhan tanaman yaitu tinggi tanaman, jumlah cabang, dan jumlah anakan",
//         "Meningkatkan kandungan protein hasil panen"
//       ],
//       "gejalaKekurangan": [],
//     },
//     "bundle": {"Paket bundle": []},
//     "countdownku": "00:00:00",
//     "diskon": 0,
//     "kategoriProduk": 0,
//     "id_MenuRawatan": "1",
//     "linkSp":"","harga": "0"
//   },
//   {
//     "id": 8,
//     "idPerusahaan": 0,
//     "nama": "phonska1",
//     "kandungan": 0,
//     "bentuk": "granul",
//     "title": "Phonska",
//     "color": ["007cc3", "011d0d", "034f23"],
//     "penjelas": "PT. Petrokimia Gresik",
//     "img": "assets/images/product/PHONSKA.png",
//     "brosure": [
//       "assets/images/brosure/phonska_1.jpg",
//       "assets/images/brosure/phonska_2.jpg"
//     ],
//     "informasi": {
//       "spesifikasi": [
//         "N (Nitrogen) : 15%",
//         "P2O5 (Fosfat) : 15%",
//         "K (Kalium) : 15%",
//         "S (Sulfur) : 10%",
//         "Bentuk granul",
//         "Warna pink/merah muda",
//         "Kemasan 50kg"
//       ],
//       "sifat": ["Larut dalam air"],
//       "manfaat": [
//         "Unsur hara tersedia bagi tanaman",
//         "Kandungan Hara NPK Seimbang"
//       ],
//       "gejalaKekurangan": [],
//     },
//     "bundle": {"Paket bundle": []},
//     "countdownku": "00:00:00",
//     "diskon": 0,
//     "kategoriProduk": 0,
//     "id_MenuRawatan": "1",
//     "linkSp":"","harga": "0"
//   },
//   {
//     "id": 9,
//     "idPerusahaan": 0,
//     "nama": "Petroganik",
//     "kandungan": 0,
//     "bentuk": "granul",
//     "title": "Pupuk Petroganik",
//     "color": ["84c225", "011d0d", "034f23"],
//     "penjelas": "PT. Petrokimia Gresik",
//     "img": "assets/images/product/PETROGANIK.png",
//     "brosure": [
//       "assets/images/brosure/petroganik_1.jpg",
//       "assets/images/brosure/petroganik_2.jpg"
//     ],
//     "informasi": {
//       "spesifikasi": [
//         "C-organik : Minimal 15%",
//         "C/N : ratio 15 - 25",
//         "Kadar air : Maksimal 8-20%",
//         "pH : 4 - 9",
//         "Warna : Coklat kehitaman",
//         "Bentuk : Granul",
//         "Padi dan Palawijaya : 500 - 1.000 kg per ha",
//         "Hortikultura : 2.000 kg per ha",
//         "Tanaman keras : 3 kg per pohon",
//         "Tambak : 300 - 500 kg per ha",
//         "Penggunaan: Penggunaan pupuk Petroganik pada tanaman pangan dan hortikultura diberikan seluruhnya pada pemupukan dasar, sedangkan pada tanaman keras diberikan pada awal dan akhir musim hujan"
//       ],
//       "sifat": ["Larut dalam air"],
//       "manfaat": [
//         "Memperbaiki struktur dan tata udara tanah sehingga penyerapan unsur hara oleh akar tanaman menjadi lebih baik",
//         "Meningkatkan daya sangga air tanah sehingga ketersediaan air dalam tanah menjadi lebih baik",
//         "Menjadi penyangga unsur hara dalam tanah sehingga pemupukan menjadi lebih efisien",
//         "Sesuai untuk semua jenis tanah dan jenis tanaman",
//         "Kadar C-organik tinggi",
//         "Berbentuk granul sehingga mudah dalam aplikasi",
//         "Aman dan ramah lingkungan (bebas mikroba patogen)",
//         "Bebas dari biji-bijian gulma",
//         "Kadar air rendah sehingga lebih efisien dalam pengangkutan dan penyimpanan",
//         "Dikemas dalam kantong kedap air"
//       ],
//       "gejalaKekurangan": [],
//     },
//     "bundle": {"Paket bundle": []},
//     "countdownku": "00:00:00",
//     "diskon": 0,
//     "kategoriProduk": 0,
//     "id_MenuRawatan": "1",
//     "linkSp":"","harga": "0"
//   },
//   {
//     "id": 11,
//     "idPerusahaan": 0,
//     "nama": "Spesifikasi Komoditi",
//     "kandungan": 0,
//     "bentuk": "granul",
//     "title": "Pupuk Spesifikasi Komoditi",
//     "color": ["ec9500", "011d0d", "034f23"],
//     "penjelas": "PT. Petrokimia Gresik",
//     "img": "assets/images/product/npk-kebomas.png",
//     "brosure": ["assets/images/brosure/kebomas_1.jpg"],
//     "informasi": {
//       "spesifikasi": [
//         "Teknologi pupuk dan pemupukan berkembang ke arah peningkatan efisiensi pemupukan, sehingga untuk mengefisienkan penggunaan pupuk dibutuhkan formula pupuk yang sesuai yaitu pupuk spesifik komoditi dan spesifik lokasi"
//       ],
//       "sifat": ["Larut dalam air"],
//       "manfaat": [
//         "Aplikasi pemupukan lebih praktis karena tidak perlu mencampur beberapa jenis pupuk tunggal",
//         "Mampu meningkatkan efisiensi dan efektivitas penggunaan pupuk",
//         "Mampu meningkatkan jumlah dan mutu hasil pertanian",
//         "Formula, bentuk, dan jenis bahan baku menyesuaikan permintaan konsumen",
//         "Antisipasi dan atasi masalah jika terjadi kelangkaan salah satu jenis pupuk tunggal",
//         "Memudahkan transportasi, penyimpanan, dan penanganan lainnya"
//       ],
//       "gejalaKekurangan": [],
//       "Formula": [
//         "Beberapa formula pupuk spesifik komoditi dan spesifik lokasi antara lain",
//         "NPK 10-11-10-4Mg : Kakao",
//         "NPK 12-10-16-2Mg : Lada",
//         "NPK 12-6-22-3Mg : Kelapa Sawit",
//         "NPK 13-6-27-4Mg-0,65B : Kelapa Sawit",
//         "Petro Kalimas : Hortikultura",
//         "Petromina (NP 20-10) : Tambak",
//         "NPK 20-6-6 : Tebu dan padi",
//         "NPK 15-15-6-4Mg : Kelapa sawit",
//         "NPK 12-12-17-2Mg : Kelapa sawit",
//         "NPK 12-12-12 : Padi, jagung",
//         "NPK 17-0-28 : Kelapa sawit",
//         "NPK 10-15-20-1TE-0,1HA : Kelapa sawit",
//         "NPK 12-11-20 (bebas Chlor) : Tembakau",
//         "NPK 14-13-9-2,5Mg : Kelapa Sawit"
//       ],
//     },
//     "bundle": {"Paket bundle": []},
//     "countdownku": "00:00:00",
//     "diskon": 0,
//     "kategoriProduk": 0,
//     "id_MenuRawatan": "1",
//     "linkSp":"","harga": "0"
//   },
//   {
//     "id": 12,
//     "idPerusahaan": 0,
//     "nama": "ZK",
//     "kandungan": 0,
//     "bentuk": "granul",
//     "title": "Pupuk ZK",
//     "color": ["ee5f00", "011d0d", "034f23"],
//     "penjelas": "PT. Petrokimia Gresik",
//     "img": "assets/images/product/ZK.png",
//     "brosure": ["assets/images/brosure/zk_1.jpg"],
//     "informasi": {
//       "spesifikasi": [
//         "Kalium K20 : 50%",
//         "Sulfur : 17%",
//         "Bentuk Warna : Serbuk Putih",
//         "Kelarutan dalam Air : 9,205gr / 100ml H20"
//       ],
//       "sifat": ["Larut dalam air"],
//       "manfaat": [
//         "Sumber Unsur Kalium (K) dan Belerang (S) dengan kadar tinggi",
//         "Aman digunakan untuk semua jenis tanaman",
//         "Larut dalam air dan mudah diserap tanaman",
//         "Dapat dicampur dengan pupuk lainnya",
//         "Tidak mudah menyerap air",
//         "Meningkatkan penyerapan unsur hara khususnya Nitrogen dan fosfor"
//       ],
//       "gejalaKekurangan": [],
//     },
//     "bundle": {"Paket bundle": []},
//     "countdownku": "00:00:00",
//     "diskon": 0,
//     "kategoriProduk": 0,
//     "id_MenuRawatan": "1",
//     "linkSp":"","harga": "0"
//   },
//   {
//     "id": 13,
//     "idPerusahaan": 0,
//     "nama": "rock phospate",
//     "kandungan": 0,
//     "bentuk": "granul",
//     "title": "Pupuk Rock Phospate",
//     "color": ["e0c691", "011d0d", "034f23"],
//     "penjelas": "PT. Petrokimia Gresik",
//     "img": "assets/images/product/Phosphate.png",
//     "brosure": ["assets/images/brosure/rockphosphate_1.jpg"],
//     "informasi": {
//       "spesifikasi": [
//         "Kadar P2O5 : min. 28%",
//         "Kadar air : maks. 1,59%",
//         "Warna : kuning abu-abu",
//         "Bentuk : Tepung",
//         "Kemasan : karung plastik dengan berat 50 kg"
//       ],
//       "sifat": ["Larut dalam air"],
//       "manfaat": [
//         "Memacu pertumbuhan akar dan pembentukan perakaran yang baik",
//         "Mempercepat pembentukan bunga serta masaknya buah dan biji",
//         "Meningkatkan komponen hasil panen tanaman biji-bijian"
//       ],
//       "gejalaKekurangan": [],
//     },
//     "bundle": {"Paket bundle": []},
//     "countdownku": "00:00:00",
//     "diskon": 0,
//     "kategoriProduk": 0,
//     "id_MenuRawatan": "1",
//     "linkSp":"","harga": "0"
//   },
//   {
//     "id": 14,
//     "idPerusahaan": 0,
//     "nama": "Niphos",
//     "kandungan": 0,
//     "bentuk": "granul",
//     "title": "Petro Niphos",
//     "color": ["003963", "011d0d", "034f23"],
//     "penjelas": "PT. Petrokimia Gresik",
//     "img": "assets/images/product/NPS.png",
//     "brosure": [
//       "assets/images/brosure/niphos_1.jpg",
//       "assets/images/brosure/niphos_2.jpg"
//     ],
//     "informasi": {
//       "spesifikasi": [
//         "N (Nitrogen) : 20%",
//         "P2O5 (Fosfat) : 20%",
//         "S (Sulfur) : 13%"
//       ],
//       "sifat": ["Larut dalam air"],
//       "manfaat": [
//         "Diperkaya dengan unsur Nitrogen, Fosfat, dan Sulfur",
//         "Larut dalam air (mudah untuk aplikasi kocor)",
//         "Meningkatkan efisiensi dan efektifitas penggunaan pupuk",
//         "Meningkatkan jumlah dan mutu hasil panen",
//         "Hasil racikan bahan baku melalui proses produksi yang tepat sehingga menghasilkan kualitas campuran produk yang homogen"
//       ],
//       "gejalaKekurangan": [],
//     },
//     "bundle": {"Paket bundle": []},
//     "countdownku": "00:00:00",
//     "diskon": 0,
//     "kategoriProduk": 0,
//     "id_MenuRawatan": "1",
//     "linkSp":"","harga": "0"
//   },
//   {
//     "id": 15,
//     "idPerusahaan": 1,
//     "nama": "Meroke MOP",
//     "kandungan": 0,
//     "bentuk": "granul",
//     "title": "Meroke MOP",
//     "color": ["F05f99", "011d0d", "939799"],
//     "penjelas": "PT. MEROKE TETAP JAYA",
//     "img": "assets/images/product/m_MOP.png",
//     "brosure": [],
//     "informasi": {
//       "spesifikasi": [],
//       "sifat": [],
//       "manfaat": [
//         "Dengan memakai pupuk Meroke MOP, tanaman akan lebih kuat, tahan stres lingkungan, toleran terhadap penyakit dan kualitas buah (warna kulit buah, warna daging buah, berat, besar, manis dan daya simpan buah) yang dihasilkan lebih baik.",
//         "Pemakaian Pupuk Meroke MOP sebaiknya pada awal pertumbuhan atau sebagai pupuk dasar dan tahap pembesaran dan pematangan buah.",
//       ],
//       "gejalaKekurangan": [
//         "Pertumbuhan tanaman tidak kuat, daun tipis dan lemah",
//         "Daun tua menguning di mulai dari tepi daun.",
//         "Pada tanaman Kelapa Sawit, daun menunjukkan gejala bintik-bintik berwarna oranye tembus pandang dan kadar minyak pada buah berkurang.",
//         "Buah mengecil dan pematangannya tidak sempurna. Warna kulit buah kusam, warna isi buah pucat dan rasa buah menjadi masam.",
//       ],
//     },
//     "bundle": {"Paket bundle": []},
//     "countdownku": "00:00:00",
//     "diskon": 0,
//     "kategoriProduk": 0,
//     "id_MenuRawatan": "1",
//     "linkSp":"","harga": "0"
//   },
//   {
//     "id": 16,
//     "idPerusahaan": 1,
//     "nama": "Meroke ZA",
//     "kandungan": 0,
//     "bentuk": "granul",
//     "title": "Meroke ZA",
//     "color": ["f68d39", "011d0d", "939799"],
//     "penjelas": "PT. MEROKE TETAP JAYA",
//     "img": "assets/images/product/m_ZA.png",
//     "brosure": [],
//     "informasi": {
//       "spesifikasi": [],
//       "sifat": [],
//       "manfaat": [
//         "Merangsang pertumbuhan vegetatif",
//         "Berfungsi untuk sintesa amino dan protein",
//         "Memproduksi pigmen hijau yang membuat tumbuhan hijau",
//         "Tanaman yang mempunyai Nitrogen yang cukup, pertumbuhannya akan kuat/vigor dan berwarna hijau tua.",
//         "dibandingkan dengan Urea, Pupuk ZA lebih tidak Volatil(menguap ke udara) dan Tidak Higroskopis sehingga lebih tahan lama.",
//         "Dipakai untuk tanaman yang kekurangan Nitrogen dan Sulfur"
//       ],
//       "gejalaKekurangan": [],
//     },
//     "bundle": {"Paket bundle": []},
//     "countdownku": "00:00:00",
//     "diskon": 0,
//     "kategoriProduk": 0,
//     "id_MenuRawatan": "1",
//     "linkSp":"","harga": "0"
//   },
//   {
//     "id": 17,
//     "idPerusahaan": 1,
//     "nama": "Meroke ROCK",
//     "kandungan": 0,
//     "bentuk": "granul",
//     "title": "Meroke ROCK",
//     "color": ["003e6b", "011d0d", "939799"],
//     "penjelas": "PT. MEROKE TETAP JAYA",
//     "img": "assets/images/product/m_ROCK.png",
//     "brosure": [],
//     "informasi": {
//       "spesifikasi": [],
//       "sifat": [],
//       "manfaat": [
//         "Dengan memakai pupuk MerokeROCK, gejala-gejala tanaman kerdil dan masalah pembuahan dapat diperbaiki",
//         "Pemakaian MerokeROCK sebaiknya pada awal pertumbuhan atau sebagi pupuk dasar dan sebelum pembungaan."
//       ],
//       "gejalaKekurangan": [],
//     },
//     "bundle": {"Paket bundle": []},
//     "countdownku": "00:00:00",
//     "diskon": 0,
//     "kategoriProduk": 0,
//     "id_MenuRawatan": "1",
//     "linkSp":"","harga": "0"
//   },
//   {
//     "id": 18,
//     "idPerusahaan": 1,
//     "nama": "Mutiara NPK",
//     "kandungan": 0,
//     "bentuk": "granul",
//     "title": "Mutiara NPK",
//     "color": ["00b2ba", "011d0d", "939799"],
//     "penjelas": "Meroke NPK 16-16-16",
//     "img": "assets/images/product/m_NPK.png",
//     "brosure": [],
//     "informasi": {
//       "spesifikasi": [],
//       "sifat": [],
//       "manfaat": [
//         "Memberikan respon pertumbuhan tanaman lebih cepat dan hasil panen lebih banyak",
//         "Pengatur keseimbangan air di dalam sel, turgor sel, kehilangan air karena transpirasi",
//         "Bertanggung jawab dalam produksi dan pembentukan protein",
//         "meningkatkan toleransi tanaman terhadap stres kekeringan atau dingin serta serangan hama dan penyakit",
//         "Meningkatkan kualitas hasil produksi baik warna, rasa, dan daya simpannya"
//       ],
//       "gejalaKekurangan": [],
//     },
//     "bundle": {"Paket bundle": []},
//     "countdownku": "00:00:00",
//     "diskon": 0,
//     "kategoriProduk": 0,
//     "id_MenuRawatan": "1",
//     "linkSp":"","harga": "0"
//   },
//   {
//     "id": 19,
//     "idPerusahaan": 1,
//     "nama": "Mutiara NPK pro",
//     "kandungan": 0,
//     "bentuk": "granul",
//     "title": "Mutiara NPK pro",
//     "color": ["f48152", "011d0d", "939799"],
//     "penjelas": "Meroke NPK Pro 9-25-25",
//     "img": "assets/images/product/m_NPKpro.png",
//     "brosure": [],
//     "informasi": {
//       "spesifikasi": ["Mudah Dikombinasikan dengan UREA"],
//       "sifat": [],
//       "manfaat": [
//         "Memberikan respon pertumbuhan tanaman lebih cepat dan hasil panen lebih banyak",
//         "Pengatur keseimbangan air di dalam sel, turgor sel, kehilangan air karena transpirasi",
//         "Bertanggung jawab dalam produksi dan pembentukan protein",
//         "meningkatkan toleransi tanaman terhadap stres kekeringan atau dingin serta serangan hama dan penyakit",
//         "Meningkatkan kualitas hasil produksi baik warna, rasa, dan daya simpannya"
//       ],
//       "gejalaKekurangan": [],
//     },
//     "bundle": {"Paket bundle": []},
//     "countdownku": "00:00:00",
//     "diskon": 0,
//     "kategoriProduk": 0,
//     "id_MenuRawatan": "1",
//     "linkSp":"","harga": "0"
//   },
//   {
//     "id": 20,
//     "idPerusahaan": 1,
//     "nama": "Meroke SPRINTER",
//     "kandungan": 0,
//     "bentuk": "granul",
//     "title": "NPK SPRINTER",
//     "color": ["0d5417", "011d0d", "939799"],
//     "penjelas": "NPK Mutiara SPRINTER 20-10-10",
//     "img": "assets/images/product/m_SPRINTER.png",
//     "brosure": [],
//     "informasi": {
//       "spesifikasi": ["Mudah Dikombinasikan dengan UREA"],
//       "sifat": [],
//       "manfaat": [
//         "Mengandung hara yang seimbang di setiap butiran pupuknya",
//         "Pengatur keseimbangan air di dalam sel, turgor sel, kehilangan air karena transpirasi",
//         "Nitrogen dalam bentuk Amonium dan Nitrat",
//         "meningkatkan toleransi tanaman terhadap stres kekeringan atau dingin serta serangan hama dan penyakit",
//         "Meningkatkan kualitas hasil produksi baik warna, rasa, dan daya simpannya",
//         "Kualitasnya sudah terbukti Rendah debu"
//       ],
//       "gejalaKekurangan": [],
//     },
//     "bundle": {"Paket bundle": []},
//     "countdownku": "00:00:00",
//     "diskon": 0,
//     "kategoriProduk": 0,
//     "id_MenuRawatan": "1",
//     "linkSp":"","harga": "0"
//   },
//   {
//     "id": 21,
//     "idPerusahaan": 1,
//     "nama": "Meroke CPN",
//     "kandungan": 0,
//     "bentuk": "granul",
//     "title": "NPK CPN",
//     "color": ["b4035b", "011d0d", "939799"],
//     "penjelas": "NK Mutiara CPN 15-15-TE",
//     "img": "assets/images/product/m_NPKcpn.png",
//     "brosure": [],
//     "informasi": {
//       "spesifikasi": [],
//       "sifat": [],
//       "manfaat": [
//         "Pupuk KNO Potasium Nitrat (KNO3) Pupuk N, K, dan Na yang larut air, dapat digunakan pada fase vegetatif dan generatif.",
//         "Bentuknya dalam butiran prill",
//         "Kelarutan di air sangat cepat.",
//         "Membantu kontrol kehilangan air pada saat cuaca panas dan meningkatkan toleransi stres tanaman terhadap panas/kering atau dingin",
//       ],
//       "gejalaKekurangan": [],
//     },
//     "bundle": {"Paket bundle": []},
//     "countdownku": "00:00:00",
//     "diskon": 0,
//     "kategoriProduk": 0,
//     "id_MenuRawatan": "1",
//     "linkSp":"","harga": "0"
//   },
//   {
//     "id": 22,
//     "idPerusahaan": 1,
//     "nama": "MerokeSOP KALI",
//     "kandungan": 0,
//     "bentuk": "granul",
//     "title": "MerokeSOP KALI",
//     "color": ["682d8e", "011d0d", "939799"],
//     "penjelas": "SOP KALI",
//     "img": "assets/images/product/m_SOP.png",
//     "brosure": [],
//     "informasi": {
//       "spesifikasi": [],
//       "sifat": [],
//       "manfaat": [
//         "Tanaman tumbuh dengan sehat dan memaksimalkan produktivitas jangka panjang.",
//         "Hasil produksi meningkat dengan meningkatkan jumlah dan juga ukuran buah atau umbi.",
//         "Meningkatkan kualitas, rasa, warna kesegaran dan daya simpan buah atau umbi.",
//         "Mengandung Kalium (K) yang tinggi dan Sulfat (S) menjadi pilihan yang sesuai untuk tanaman hortikultura secara luas.",
//         "Kandungan rasio Kalium dan Sulfur yang seimbang dapat meningkatkan fungsi enzim, sintesa protein dan pembentukan umbi sehingga hasil panden dan kualitas meningkat serta memperkaya rasa dan warna."
//       ],
//       "gejalaKekurangan": [],
//     },
//     "bundle": {"Paket bundle": []},
//     "countdownku": "00:00:00",
//     "diskon": 0,
//     "kategoriProduk": 0,
//     "id_MenuRawatan": "1",
//     "linkSp":"","harga": "0"
//   },
//   {
//     "id": 23,
//     "idPerusahaan": 1,
//     "nama": "Meroke KKB",
//     "kandungan": 0,
//     "bentuk": "granul",
//     "title": "Meroke KKB",
//     "color": ["ee2e4f", "011d0d", "939799"],
//     "penjelas": "KKB",
//     "img": "assets/images/product/m_KKB.png",
//     "brosure": [],
//     "informasi": {
//       "spesifikasi": [],
//       "sifat": [],
//       "manfaat": [
//         "Mengoptimalkan keseimbangan unsur hara K : Mg di dalam tanah agar dapat diserap secara efisien oleh tanaman.",
//         "Kualitas buah lebih besar, lebih manis dan warna lebih mengkilat.",
//         "Produk pupuk bermutu tinggi dari Jerman.",
//         "Menghemat biaya aplikasi pemupukan hingga 3x jadwal pemupukan.",
//       ],
//       "gejalaKekurangan": [],
//     },
//     "bundle": {"Paket bundle": []},
//     "countdownku": "00:00:00",
//     "diskon": 0,
//     "kategoriProduk": 0,
//     "id_MenuRawatan": "1",
//     "linkSp":"","harga": "0"
//   },
//   {
//     "id": 24,
//     "idPerusahaan": 1,
//     "nama": "SUBURKALI BUTIR",
//     "kandungan": 0,
//     "bentuk": "granul",
//     "title": "SUBURKALI BUTIR",
//     "color": ["eedb00", "011d0d", "939799"],
//     "penjelas": "KKB",
//     "img": "assets/images/product/m_SUBURKALI.png",
//     "brosure": [],
//     "informasi": {
//       "spesifikasi": [],
//       "sifat": [],
//       "manfaat": [
//         "Meningkatkan fungsi enzim",
//         "Sintesa protein dan pembentukan umbi sehingga hasil panen dan kualitas meningkat serta memperkaya rasa dan warna",
//       ],
//       "gejalaKekurangan": [],
//     },
//     "bundle": {"Paket bundle": []},
//     "countdownku": "00:00:00",
//     "diskon": 0,
//     "kategoriProduk": 0,
//     "id_MenuRawatan": "1",
//     "linkSp":"","harga": "0"
//   },
//   {
//     "id": 25,
//     "idPerusahaan": 1,
//     "nama": "KARATE PLUS BORONI",
//     "kandungan": 0,
//     "bentuk": "granul",
//     "title": "KARATE PLUS BORONI",
//     "color": ["f99d2b", "011d0d", "939799"],
//     "penjelas": "KARATE PLUS BORONI",
//     "img": "assets/images/product/m_KARATEPLUS.png",
//     "brosure": [],
//     "informasi": {
//       "spesifikasi": [],
//       "sifat": [],
//       "manfaat": [
//         "Tanaman tumbuh dengan sehat dan memaksimalkan produktivitas jangka panjang.",
//         "Hasil produksi meningkat dengan meningkatnya jumlah dan juga ukuran buah atau umbi.",
//         "Meningkatkan kualitas, rasa, warna, kesegaran dan daya simpan buah atau umbi."
//       ],
//       "gejalaKekurangan": [],
//     },
//     "bundle": {"Paket bundle": []},
//     "countdownku": "00:00:00",
//     "diskon": 0,
//     "kategoriProduk": 0,
//     "id_MenuRawatan": "1",
//     "linkSp":"","harga": "0"
//   },
//   {
//     "id": 26,
//     "idPerusahaan": 1,
//     "nama": "Mutiara Grower",
//     "kandungan": 0,
//     "bentuk": "granul",
//     "title": "Mutiara Grower",
//     "color": ["7bb040", "011d0d", "939799"],
//     "penjelas": "NPK Grower 15-09-20+TE",
//     "img": "assets/images/product/m_NPKgrow.png",
//     "brosure": [],
//     "informasi": {
//       "spesifikasi": [],
//       "sifat": [],
//       "manfaat": [
//         "Penanganan dan cara aplikasi yang mudah dan merata",
//         "Kualitasnya sudah terbukti",
//         "Rendah debu"
//       ],
//       "gejalaKekurangan": [],
//     },
//     "bundle": {"Paket bundle": []},
//     "countdownku": "00:00:00",
//     "diskon": 0,
//     "kategoriProduk": 0,
//     "id_MenuRawatan": "1",
//     "linkSp":"","harga": "0"
//   },
//   {
//     "id": 27,
//     "idPerusahaan": 1,
//     "nama": "Meroke FITOFLEX",
//     "kandungan": 0,
//     "bentuk": "granul",
//     "title": "Meroke FITOFLEX",
//     "color": ["7bb040", "011d0d", "939799"],
//     "penjelas": "Mikro Majemuk",
//     "img": "assets/images/product/m_FITOFLEX.png",
//     "brosure": [],
//     "informasi": {
//       "spesifikasi": [],
//       "sifat": [],
//       "manfaat": [
//         "Tanaman tumbuh dengan sehat dan memaksimalkan produktivitas jangka panjang.",
//         "Hasil produksi meningkat dengan meningkatnya jumlah dan juga ukuran buah atau umbi.",
//         "Meningkatkan kualitas, rasa, warna, kesegaran dan daya simpan buah atau umbi.",
//         "Diformulasi sesuai dengan kecukupan kebutuhan tanaman dan tanah di Indonesia.",
//         "Aman dicampur dalam aplikasinya dengan pestisida yang umum dipakai oleh petani di Indonesia."
//       ],
//       "gejalaKekurangan": [],
//     },
//     "bundle": {"Paket bundle": []},
//     "countdownku": "00:00:00",
//     "diskon": 0,
//     "kategoriProduk": 0,
//     "id_MenuRawatan": "1",
//     "linkSp":"","harga": "0"
//   },
//   {
//     "id": 28,
//     "idPerusahaan": 1,
//     "nama": "PROVIT ORANGE",
//     "kandungan": 0,
//     "bentuk": "granul",
//     "title": "PROVIT ORANGE",
//     "color": ["ffcd34", "011d0d", "939799"],
//     "penjelas": "NPK 8-9-39+3Mgo+TE",
//     "img": "assets/images/product/m_PROVITORANGE.png",
//     "brosure": [],
//     "informasi": {
//       "spesifikasi": [],
//       "sifat": [],
//       "manfaat": [
//         "Tanaman tumbuh dengan sehat dan memaksimalkan produktivitas jangka panjang.",
//         "Hasil produksi meningkat dengan meningkatnya jumlah dan juga ukuran buah atau umbi.",
//         "Meningkatkan kualitas, rasa, warna, kesegaran dan daya simpan buah atau umbi.",
//       ],
//       "gejalaKekurangan": [],
//     },
//     "bundle": {"Paket bundle": []},
//     "countdownku": "00:00:00",
//     "diskon": 0,
//     "kategoriProduk": 0,
//     "id_MenuRawatan": "1",
//     "linkSp":"","harga": "0"
//   },
//   {
//     "id": 29,
//     "idPerusahaan": 1,
//     "nama": "PROVIT MERAH",
//     "kandungan": 0,
//     "bentuk": "granul",
//     "title": "PROVIT MERAH",
//     "color": ["e72623", "011d0d", "939799"],
//     "penjelas": "NPK 15-30-15+1,4Mgo+TE",
//     "img": "assets/images/product/m_PROVITMERAH.png",
//     "brosure": [],
//     "informasi": {
//       "spesifikasi": [],
//       "sifat": [],
//       "manfaat": [
//         "Tanaman tumbuh dengan sehat dan memaksimalkan produktivitas jangka panjang.",
//         "Hasil produksi meningkat dengan meningkatnya jumlah dan juga ukuran buah atau umbi.",
//         "Meningkatkan kualitas, rasa, warna, kesegaran dan daya simpan buah atau umbi.",
//       ],
//       "gejalaKekurangan": [],
//     },
//     "bundle": {"Paket bundle": []},
//     "countdownku": "00:00:00",
//     "diskon": 0,
//     "kategoriProduk": 0,
//     "id_MenuRawatan": "1",
//     "linkSp":"","harga": "0"
//   },
//   {
//     "id": 30,
//     "idPerusahaan": 1,
//     "nama": "PROVIT HIJAU",
//     "kandungan": 0,
//     "bentuk": "granul",
//     "title": "PROVIT HIJAU",
//     "color": ["009347", "011d0d", "939799"],
//     "penjelas": "NPK 27-18-9+1Mgo+TE",
//     "img": "assets/images/product/m_PROVITHIJAU.png",
//     "brosure": [],
//     "informasi": {
//       "spesifikasi": [],
//       "sifat": [],
//       "manfaat": [
//         "Tanaman tumbuh dengan sehat dan memaksimalkan produktivitas jangka panjang.",
//         "Hasil produksi meningkat dengan meningkatnya jumlah dan juga ukuran buah atau umbi.",
//         "Meningkatkan kualitas, rasa, warna, kesegaran dan daya simpan buah atau umbi.",
//       ],
//       "gejalaKekurangan": [],
//     },
//     "bundle": {"Paket bundle": []},
//     "countdownku": "00:00:00",
//     "diskon": 0,
//     "kategoriProduk": 0,
//     "id_MenuRawatan": "1",
//     "linkSp":"","harga": "0"
//   },
//   {
//     "id": 31,
//     "idPerusahaan": 1,
//     "nama": "SS (AMMOPHOS)",
//     "kandungan": 0,
//     "bentuk": "granul",
//     "title": "SS (AMMOPHOS)",
//     "color": ["e72623", "011d0d", "939799"],
//     "penjelas": "NPK 27-18-9+1Mgo+TE",
//     "img": "assets/images/product/m_SS.png",
//     "brosure": [],
//     "informasi": {
//       "spesifikasi": [],
//       "sifat": [],
//       "manfaat": [
//         "Memacu pertumbuhan dan perkembangan akar",
//         "Mempengaruhi ketersediaan dan meningkatkan penyerapan P.",
//         "Meningkatkan efisiensi pemupukan N"
//       ],
//       "gejalaKekurangan": [],
//     },
//     "bundle": {"Paket bundle": []},
//     "countdownku": "00:00:00",
//     "diskon": 0,
//     "kategoriProduk": 0,
//     "id_MenuRawatan": "1",
//     "linkSp":"","harga": "0"
//   },
//   {
//     "id": 32,
//     "idPerusahaan": 2,
//     "nama": "NPK 16-16-16 Biru",
//     "kandungan": 0,
//     "bentuk": "granul",
//     "title": "Pupuk NPK 16-16-16 Biru",
//     "color": ["049942", "011d0d", "034f23"],
//     "penjelas": "CV. Saprotan Utama",
//     "img": "assets/images/product/NPK16-16-16Biru.png",
//     "brosure": ["assets/images/brosure/NPK16-16-16BiruB.jpg"],
//     "informasi": {
//       "spesifikasi": [
//         "KOMPOSISI:",
//         "Nitrogen (N) : 16%",
//         "Pospat (P2O5 ) : 16%",
//         "Kalium (K2O) : 16%",
//         "Magnesium (MgO) : 1%",
//         "Kalsium (CaO) : 5.15%",
//         "Sulfur (S) : 0.09%",
//         "Nitrat (NO3) : 7%",
//         "Boron (B2O3 ) : 90 ppm",
//         "Zinc (Zn) : 60 ppm",
//         "Copper (Cu) : 60 ppm",
//         "Mangan (Mn) : 55 ppm"
//       ],
//       "sifat": ["Larut dalam air"],
//       "manfaat": [
//         "Memacu pertumbuhan tanaman pada vase vegetatif",
//         "Memaksimalkan pertumbuhan generatif sesuai kebutuhan tanaman",
//         "pembungaan maupun pembuahan dan pengisian buah"
//       ],
//       "gejalaKekurangan": [],
//     },
//     "bundle": {"Paket bundle": []},
//     "countdownku": "00:00:00",
//     "diskon": 0,
//     "kategoriProduk": 0,
//     "id_MenuRawatan": "1",
//     "linkSp":"","harga": "0"
//   },
//   // {
//   //   "id": 33,
//   //   "idPerusahaan": 2,
//   //   "nama": "NPK Padi",
//   //   "kandungan": 0,
//   //   "bentuk": "granul",
//   //   "title": "Pupuk NPK Padi",
//   //   "color": ["049942", "011d0d", "034f23"],
//   //   "penjelas": "CV. Saprotan Utama",
//   //   "img": "assets/images/product/NPKPadi.png",
//   //   "brosure": ["assets/images/brosure/NPKPadiB.jpg"],
//   //   "informasi": {
//   //     "spesifikasi": [
//   //       "P2O5 (Phosphate) : 14%",
//   //       "N (Nitrogen) : 21%",
//   //       "K2O (Potassium Oxide) : 7%",
//   //       "MgO (Magnesium Oxide) : 2%",
//   //       "S (Sulfur) : 2% TE (Cu, Zn, Fe, Mn) : 1%"
//   //     ],
//   //     "sifat": ["Larut dalam air"],
//   //     "manfaat": [
//   //       "Mengandung unsur hara Nitrogen tinggi yang baik untuk memacu pertumbuhan dan menambah anakan tanaman.",
//   //       "Unsur hara Phosphate yang mudah diserap sehingga batang menjadi lebih kokoh, perakaran baik, dan daun lebih hijau.",
//   //       "Mengandung unsur mikro Magnesium dan Sulfur yang penting untuk proses fotosintesis tanaman."
//   //     ],
//   //     "gejalaKekurangan": [],
//   //   },
//   //   "bundle": {"Paket bundle": []},
//   //   "countdownku": "00:00:00",
//   //   "diskon": 0,
//   //   "kategoriProduk": 0,
//   //   "id_MenuRawatan": "1",
//   //   "linkSp":"","harga": "0"
//   // },
//   // {
//   //   "id": 34,
//   //   "idPerusahaan": 2,
//   //   "nama": "ZA Pak Tani",
//   //   "kandungan": 0,
//   //   "bentuk": "Kristal",
//   //   "title": "Pupuk ZA Pak Tani",
//   //   "color": ["049942", "011d0d", "034f23"],
//   //   "penjelas": "CV. Saprotan Utama",
//   //   "img": "assets/images/product/ZAPakTani.png",
//   //   "brosure": ["assets/images/brosure/ZAPakTaniB.jpg"],
//   //   "informasi": {
//   //     "spesifikasi": [
//   //       "P2O5 (Phosphate) : 14%",
//   //       "Sulfur (S) : 24%",
//   //     ],
//   //     "sifat": ["Larut dalam air"],
//   //     "manfaat": [
//   //       "Merupakan pupuk sumber Sulfur dan Nitrogen yang tinggi.",
//   //       "Meningkatkan kualitas daun, meningkatkan kadar minyak tanaman, meningkatkan aroma dan rasa.",
//   //       "Meningkatkan produksi dan memperbaiki kualitas hasil panen.",
//   //       "Meningkatkan ketahanan tanaman terhadap suhu rendah maupun serangan hama penyakit."
//   //     ],
//   //     "gejalaKekurangan": [],
//   //   },
//   //   "bundle": {"Paket bundle": []},
//   //   "countdownku": "00:00:00",
//   //   "diskon": 0,
//   //   "kategoriProduk": 0,
//   //   "id_MenuRawatan": "1",
//   //   "linkSp":"","harga": "0"
//   // },
//   // {
//   //   "id": 35,
//   //   "idPerusahaan": 2,
//   //   "nama": "PNP",
//   //   "kandungan": 0,
//   //   "bentuk": "Kristal",
//   //   "title": "Pupuk PNP",
//   //   "color": ["049942", "011d0d", "034f23"],
//   //   "penjelas": "CV. Saprotan Utama",
//   //   "img": "assets/images/product/PNP.png",
//   //   "brosure": ["assets/images/brosure/PNPB.jpg"],
//   //   "informasi": {
//   //     "spesifikasi": [
//   //       "N (Nitrogen) : 13%",
//   //       "K2O (Potassium Oxide) : 45%",
//   //     ],
//   //     "sifat": ["Larut dalam air"],
//   //     "manfaat": [
//   //       "Nitrogen dalam bentuk Nitrat cepat diserap oleh tanaman.",
//   //       "Mudah larut dan tidak mengendap sehingga mudah diaplikasikan dan cepat tersedia bagi tanaman.",
//   //       "Tidak mengandung Chlor sehingga tidak meracuni tanaman yang sensitif terhadap Chlor.",
//   //       "Meningkatkan hasil panen dan kualitas tanaman dan buah- buahan."
//   //     ],
//   //     "gejalaKekurangan": [],
//   //   },
//   //   "bundle": {"Paket bundle": []},
//   //   "countdownku": "00:00:00",
//   //   "diskon": 0,
//   //   "kategoriProduk": 0,
//   //   "id_MenuRawatan": "1",
//   //   "linkSp":"","harga": "0"
//   // },
//   // {
//   //   "id": 36,
//   //   "idPerusahaan": 2,
//   //   "nama": "CSN",
//   //   "kandungan": 0,
//   //   "bentuk": "Prill",
//   //   "title": "Pupuk CSN",
//   //   "color": ["049942", "011d0d", "034f23"],
//   //   "penjelas": "CV. Saprotan Utama",
//   //   "img": "assets/images/product/CSN.png",
//   //   "brosure": ["assets/images/brosure/CSNB.jpg"],
//   //   "informasi": {
//   //     "spesifikasi": [
//   //       "N-Nitrat : 15%",
//   //       "Potassium Oxide (K2O): 14%",
//   //       "Natrium (Na) : 18%",
//   //       "Boron (B) : 0,05%"
//   //     ],
//   //     "sifat": ["Larut dalam air"],
//   //     "manfaat": [
//   //       "Nitrogen dalam bentuk Nitrat cepat diserap oleh tanaman.",
//   //       "Mudah larut dan tidak mengendap sehingga mudah diaplikasikan dan cepat tersedia bagi tanaman.",
//   //       "Sangat cocok digunakan untuk starter dan memacu pertumbuhan vegetatif.",
//   //       "Mengandung Boron yang sangat berguna dalam pembentukan dinding sel dan proses penyerbukan bunga pada tanaman."
//   //     ],
//   //     "gejalaKekurangan": [],
//   //   },
//   //   "bundle": {"Paket bundle": []},
//   //   "countdownku": "00:00:00",
//   //   "diskon": 0,
//   //   "kategoriProduk": 0,
//   //   "id_MenuRawatan": "1",
//   //   "linkSp":"","harga": "0"
//   // },
//   // {
//   //   "id": 37,
//   //   "idPerusahaan": 2,
//   //   "nama": "Pupuk Kandang",
//   //   "kandungan": 0,
//   //   "bentuk": "tanah",
//   //   "title": "Pupuk Kandang",
//   //   "color": ["049942", "011d0d", "034f23"],
//   //   "penjelas": "CV. Saprotan Utama",
//   //   "img": "assets/images/BGA.jpg",
//   //   "brosure": ["assets/images/BGA.jpg"],
//   //   "informasi": {
//   //     "spesifikasi": [""],
//   //     "sifat": ["Larut dalam air"],
//   //     "manfaat": [
//   //       "sebagai sumber hara terutama N bagi tanaman dan dapat memperbaiki sifat kimia, biologi, dan fisik tanah.",
//   //     ],
//   //     "gejalaKekurangan": [],
//   //   },
//   //   "bundle": {"Paket bundle": []},
//   //   "countdownku": "00:00:00",
//   //   "diskon": 0,
//   //   "kategoriProduk": 0,
//   //   "id_MenuRawatan": "1",
//   //   "linkSp":"","harga": "0"
//   // },
//   // {
//   //   "id": 38,
//   //   "idPerusahaan": 2,
//   //   "nama": "Fertiphos",
//   //   "kandungan": 0,
//   //   "bentuk": "granul",
//   //   "title": "Pupuk Fertiphos",
//   //   "color": ["049942", "011d0d", "034f23"],
//   //   "penjelas": "CV. Saprotan Utama",
//   //   "img": "assets/images/product/Fertiphos.png",
//   //   "brosure": [],
//   //   "informasi": {
//   //     "spesifikasi": [
//   //       "P2O5 (Phosphate) max : 20%",
//   //       "MgO (Magnesium Oxide) : 0.5%",
//   //       "S (Sulfur) : 1%",
//   //       "SiO2 (Silika) : 10%",
//   //       "B2O3 (Boron) : 0,5%",
//   //       "CaO (Calcium Oxide) : 15%"
//   //     ],
//   //     "sifat": ["Larut dalam air"],
//   //     "manfaat": [
//   //       " Merangsang pertumbuhan dan perkembangan akar, meningkatkan produksi dan kualitas hasil terutama untuk tanaman biji-bijian.",
//   //       "Mengandung Kalsium (Ca) yang dapat memperbaiki struktur tanah dan menetralkan pH tanah.",
//   //       "Meningkatkan daya tahan tanaman terhadap suhu rendah."
//   //     ],
//   //     "gejalaKekurangan": [],
//   //   },
//   //   "bundle": {"Paket bundle": []},
//   //   "countdownku": "00:00:00",
//   //   "diskon": 0,
//   //   "kategoriProduk": 0,
//   //   "id_MenuRawatan": "1",
//   //   "linkSp":"","harga": "0"
//   // },
//   // {
//   //   "id": 39,
//   //   "idPerusahaan": 2,
//   //   "nama": "MKP",
//   //   "kandungan": 0,
//   //   "bentuk": "kristal",
//   //   "title": "Pupuk MKP",
//   //   "color": ["049942", "011d0d", "034f23"],
//   //   "penjelas": "CV. Saprotan Utama",
//   //   "img": "assets/images/product/MKP.png",
//   //   "brosure": [],
//   //   "informasi": {
//   //     "spesifikasi": [
//   //       "P2O5 (Phosphate) : 52%",
//   //       "K2O (Potassium Oxide)  : 34%",
//   //     ],
//   //     "sifat": ["Larut dalam air"],
//   //     "manfaat": [
//   //       "MKP PAK TANI berbentuk kristal, sangat mudah larut dalam air.",
//   //       "Mudah diaplikasikan dengan cara ditabur, dikocor/disiram, semprot atau sistem hidroponik.",
//   //       "Merangsang pertumbuhan akar dan pembungaan serta mencegah kerontokan bunga dan buah."
//   //     ],
//   //     "gejalaKekurangan": [],
//   //   },
//   //   "bundle": {"Paket bundle": []},
//   //   "countdownku": "00:00:00",
//   //   "diskon": 0,
//   //   "kategoriProduk": 0,
//   //   "id_MenuRawatan": "1",
//   //   "linkSp":"","harga": "0"
//   // },
//   // {
//   //   "id": 40,
//   //   "idPerusahaan": 2,
//   //   "nama": "CNG",
//   //   "kandungan": 0,
//   //   "bentuk": "Bubuk",
//   //   "title": "Pupuk CNG",
//   //   "color": ["049942", "011d0d", "034f23"],
//   //   "penjelas": "CV. Saprotan Utama",
//   //   "img": "assets/images/product/CNG.png",
//   //   "brosure": [],
//   //   "informasi": {
//   //     "spesifikasi": [
//   //       "NO3 (Nitrogen) : 15,5%",
//   //       "(Nitrat) : 14,4%",
//   //       "NH4 (Ammonium) : 1,1%",
//   //       "CaO (Calsium Oxide) : 26%"
//   //     ],
//   //     "sifat": ["Larut dalam air"],
//   //     "manfaat": [
//   //       "Mengurangi serangan jamur pada tanaman.",
//   //       "Mengurangi blossom-end-rot (busuk ujung buah) pada tomat dan paprika, serta bitter-pit pada buah apel.",
//   //       "Meningkatkan hasil dan kualitas panen.",
//   //       "Meningkatkan daya tahan dan umur buah serta umbi- umbian pada penyimpanan paska panen.",
//   //       "Membuat bunga potong lebih tahan lama."
//   //     ],
//   //     "gejalaKekurangan": [],
//   //   },
//   //   "bundle": {"Paket bundle": []},
//   //   "countdownku": "00:00:00",
//   //   "diskon": 0,
//   //   "kategoriProduk": 0,
//   //   "id_MenuRawatan": "1",
//   //   "linkSp":"","harga": "0"
//   // },
//   // {
//   //   "id": 41,
//   //   "idPerusahaan": 2,
//   //   "nama": "Neo Kristalon Hijau",
//   //   "kandungan": 0,
//   //   "bentuk": "Bubuk",
//   //   "title": "Pupuk Neo Kristalon Hijau",
//   //   "color": ["049942", "011d0d", "034f23"],
//   //   "penjelas": "CV. Saprotan Utama",
//   //   "img": "assets/images/product/NeoKristalonH.png",
//   //   "brosure": [],
//   //   "informasi": {
//   //     "spesifikasi": ["NPK : 18% N,18% P,18% K, 3% MgO, 2% S"],
//   //     "sifat": ["Larut dalam air"],
//   //     "manfaat": [
//   //       "Neo Kristalon merupakan pupuk kristal 100% larut dalam air.",
//   //       "Mengandung unsur mikro dalam bentuk Chelated sehingga cepat terserap oleh tanaman.",
//   //       " Tersedia dalam 3 jenis varian formulasi yang dapat digunakan sesuai dengan fase pertumbuhan tanaman.",
//   //     ],
//   //     "gejalaKekurangan": [],
//   //   },
//   //   "bundle": {"Paket bundle": []},
//   //   "countdownku": "00:00:00",
//   //   "diskon": 0,
//   //   "kategoriProduk": 0,
//   //   "id_MenuRawatan": "1",
//   //   "linkSp":"","harga": "0"
//   // },
//   // {
//   //   "id": 42,
//   //   "idPerusahaan": 2,
//   //   "nama": "Kamas",
//   //   "kandungan": 0,
//   //   "bentuk": "Flake",
//   //   "title": "Pupuk Kamas",
//   //   "color": ["049942", "011d0d", "034f23"],
//   //   "penjelas": "CV. Saprotan Utama",
//   //   "img": "assets/images/product/Kamas.png",
//   //   "brosure": [],
//   //   "informasi": {
//   //     "spesifikasi": [
//   //       "K2O (Potassium Oxide) : 30%",
//   //       "MgO (Magnesium Oxide) : 11%",
//   //       "S (Sulfur) : 17%"
//   //     ],
//   //     "sifat": ["Larut dalam air"],
//   //     "manfaat": [
//   //       "Merupakan pupuk majemuk yang mengandung Kalium (Potassium).",
//   //       "Magnesium dan Sulfur yang seimbang.",
//   //       "Memaksimalkan hasil produksi dan kualitas hasil panen.",
//   //       "Memaksimalkan pengisian buah dan umbi serta meningkatkan warna dan rasanya.",
//   //       "Pada tanaman bawang mempertajam warna dan aroma. 6. Sangat cocok dikombinasikan dengan pupuk SAPRODAP untuk melengkapi unsur Nitrogen dan Phosphate."
//   //     ],
//   //     "gejalaKekurangan": [],
//   //   },
//   //   "bundle": {"Paket bundle": []},
//   //   "countdownku": "00:00:00",
//   //   "diskon": 0,
//   //   "kategoriProduk": 0,
//   //   "id_MenuRawatan": "1",
//   //   "linkSp":"","harga": "0"
//   // },
//   // {
//   //   "id": 43,
//   //   "idPerusahaan": 2,
//   //   "nama": "Fertibio",
//   //   "kandungan": 0,
//   //   "bentuk": "Flake",
//   //   "title": "Pupuk Fertibio",
//   //   "color": ["049942", "011d0d", "034f23"],
//   //   "penjelas": "CV. Saprotan Utama",
//   //   "img": "assets/images/product/Fertibio.png",
//   //   "brosure": [],
//   //   "informasi": {
//   //     "spesifikasi": [
//   //       "Unsur Makro :\nNitrogen (N) : 0.82%\nPhosphate (P2O5) : 1.03%\nKalium (K2O) : 0.61%\npH : 6-8\nC-Organik : >12%\nC/N Ratio : 10-25\nKadar Air : 15-20%\nUnsur Mikro :\nFe : 7.378 ppm\nZn : 144 ppm\nMn : 523 ppm\nB : 1.548 ppm\nCu : 39 ppm\nMo : < 0.200 ppm",
//   //     ],
//   //     "sifat": ["Larut dalam air"],
//   //     "manfaat": [
//   //       "Memperbaiki kesuburan fisika tanah sehingga tanah menjadi gembur dan dapat menahan air,yang membuat perakaran menjadi lebih besar dan sempurna perkembangannya.",
//   //       "Mengurangi jumlah penggunaan pupuk kimia sebanyak 30-50% karena penyerapan lebih efisien dan tidak hilang melalui pencucian.",
//   //       "Mengandung unsur hara makro dan mikro yang dibutuhkan oleh tanaman.",
//   //     ],
//   //     "gejalaKekurangan": [],
//   //   },
//   //   "bundle": {"Paket bundle": []},
//   //   "countdownku": "00:00:00",
//   //   "diskon": 0,
//   //   "kategoriProduk": 0,
//   //   "id_MenuRawatan": "1",
//   //   "linkSp":"","harga": "0"
//   // },
//   // {
//   //   "id": 44,
//   //   "idPerusahaan": 2,
//   //   "nama": "NEO KRISTALON Boron",
//   //   "kandungan": 0,
//   //   "bentuk": "Flake",
//   //   "title": "Pupuk NEO KRISTALON Boron",
//   //   "color": ["049942", "011d0d", "034f23"],
//   //   "penjelas": "CV. Saprotan Utama",
//   //   "img": "assets/images/product/NeoKristalonBoron.png",
//   //   "brosure": [],
//   //   "informasi": {
//   //     "spesifikasi": [
//   //       "Mengandung B2O3 : 55% atau 17% Boron (B)",
//   //     ],
//   //     "sifat": ["Larut dalam air"],
//   //     "manfaat": [
//   //       "Neo Kristalon Boron merupakan pupuk kristal 100% yang larut dalam air.",
//   //       "Dapat diaplikasikan pada daun dan kanopi pada tanaman.",
//   //       "Neo Kristalon Boron adalah turunan asam borat, satu-satunya Boron  yang diserap tanaman.",
//   //       "Memperbaiki pembentukan buah dan meningkatkan produktivitas."
//   //     ],
//   //     "gejalaKekurangan": [],
//   //   },
//   //   "bundle": {"Paket bundle": []},
//   //   "countdownku": "00:00:00",
//   //   "diskon": 0,
//   //   "kategoriProduk": 0,
//   //   "id_MenuRawatan": "1",
//   //   "linkSp":"","harga": "0"
//   // },
//   // {
//   //   "id": 45,
//   //   "idPerusahaan": 2,
//   //   "nama": "Saprodap",
//   //   "kandungan": 0,
//   //   "bentuk": "Flake",
//   //   "title": "Pupuk Saprodap",
//   //   "color": ["049942", "011d0d", "034f23"],
//   //   "penjelas": "CV. Saprotan Utama",
//   //   "img": "assets/images/product/Saprodap.png",
//   //   "brosure": [],
//   //   "informasi": {
//   //     "spesifikasi": [
//   //       "N (Nitrogen) : 16%\nP2O5 (Phosphate) : 20%\nS (Sulfur) : 12%",
//   //     ],
//   //     "sifat": ["Larut dalam air"],
//   //     "manfaat": [
//   //       "Pertumbuhannya lebih cepat",
//   //       "batang kokoh",
//   //       "warna daun lebih hijau",
//   //       "serta perakaran yang sempurna."
//   //     ],
//   //     "gejalaKekurangan": [],
//   //   },
//   //   "bundle": {"Paket bundle": []},
//   //   "countdownku": "00:00:00",
//   //   "diskon": 0,
//   //   "kategoriProduk": 0,
//   //   "id_MenuRawatan": "1",
//   //   "linkSp":"","harga": "0"
//   // },
//   // {
//   //   "id": 46,
//   //   "idPerusahaan": 2,
//   //   "nama": "KCL Putih",
//   //   "kandungan": 0,
//   //   "bentuk": "Flake",
//   //   "title": "Pupuk KCL Putih",
//   //   "color": ["049942", "011d0d", "034f23"],
//   //   "penjelas": "CV. Saprotan Utama",
//   //   "img": "assets/images/product/KCLPutih.png",
//   //   "brosure": [],
//   //   "informasi": {
//   //     "spesifikasi": [
//   //       "K2O (Potassium Oxide) : 60%",
//   //     ],
//   //     "sifat": ["Larut dalam air"],
//   //     "manfaat": [
//   //       "Kandungan Kalium (Potassium) yang tinggi sehingga cocok untuk fase generatif, yaitu untuk pengisian dan pembesaran buah.",
//   //       "100% larut dalam air, sehingga mampu diserap dengan baik oleh tanaman.",
//   //       " Diformulasikan dalam bentuk flake, sehingga mudah dalam aplikasi di lapangan."
//   //     ],
//   //     "gejalaKekurangan": [],
//   //   },
//   //   "bundle": {"Paket bundle": []},
//   //   "countdownku": "00:00:00",
//   //   "diskon": 0,
//   //   "kategoriProduk": 0,
//   //   "id_MenuRawatan": "1",
//   //   "linkSp":"","harga": "0"
//   // },
//   // {
//   //   "id": 47,
//   //   "idPerusahaan": 2,
//   //   "nama": "CPN",
//   //   "kandungan": 0,
//   //   "bentuk": "Flake",
//   //   "title": "Pupuk CPN",
//   //   "color": ["049942", "011d0d", "034f23"],
//   //   "penjelas": "CV. Saprotan Utama",
//   //   "img": "assets/images/product/CPN.png",
//   //   "brosure": [],
//   //   "informasi": {
//   //     "spesifikasi": [
//   //       "N (Nitrogen) : min 15%",
//   //       "K2O (Potassium Oxide)  : min 14%"
//   //     ],
//   //     "sifat": ["Larut dalam air"],
//   //     "manfaat": [
//   //       "Nitrogen dalam bentuk Nitrat cepat diserap oleh tanaman.",
//   //       "Mudah larut dan tidak mengendap sehingga mudah diaplikasikan dan cepat tersedia bagi tanaman.",
//   //       "Mengandung Natrium sehingga bisa menetralkan pH tanah yang asam."
//   //     ],
//   //     "gejalaKekurangan": [],
//   //   },
//   //   "bundle": {"Paket bundle": []},
//   //   "countdownku": "00:00:00",
//   //   "diskon": 0,
//   //   "kategoriProduk": 0,
//   //   "id_MenuRawatan": "1",
//   //   "linkSp":"","harga": "0"
//   // },
//   // {
//   //   "id": 48,
//   //   "idPerusahaan": 2,
//   //   "nama": "Urecote",
//   //   "kandungan": 0,
//   //   "bentuk": "Flake",
//   //   "title": "Pupuk Urecote",
//   //   "color": ["049942", "011d0d", "034f23"],
//   //   "penjelas": "CV. Saprotan Utama",
//   //   "img": "assets/images/product/Urecote.png",
//   //   "brosure": [],
//   //   "informasi": {
//   //     "spesifikasi": [
//   //       "Perpaduan antara Urea (46-0-0) dengan senyawa Agrotain 20%",
//   //     ],
//   //     "sifat": ["Larut dalam air"],
//   //     "manfaat": [
//   //       "Mengoptimalkan hasil produksi tanaman.",
//   //       "Dosis URECOTE lebih hemat dibandingkan Urea.",
//   //       "Menghambat kehilangan Amoniak melalui penguapan sehingga lebih banyak Nitrogen yang terserap oleh tanaman.",
//   //     ],
//   //     "gejalaKekurangan": [],
//   //   },
//   //   "bundle": {"Paket bundle": []},
//   //   "countdownku": "00:00:00",
//   //   "diskon": 0,
//   //   "kategoriProduk": 0,
//   //   "id_MenuRawatan": "1",
//   //   "linkSp":"","harga": "0"
//   // },
//   // {
//   //   "id": 49,
//   //   "idPerusahaan": 2,
//   //   "nama": "Ultradap",
//   //   "kandungan": 0,
//   //   "bentuk": "Flake",
//   //   "title": "Pupuk Ultradap",
//   //   "color": ["049942", "011d0d", "034f23"],
//   //   "penjelas": "CV. Saprotan Utama",
//   //   "img": "assets/images/product/Ultradap.png",
//   //   "brosure": [],
//   //   "informasi": {
//   //     "spesifikasi": ["N (Nitrogen) : 12%", "P2O5 (Phosphate) : 60%"],
//   //     "sifat": ["Larut dalam air"],
//   //     "manfaat": [
//   //       "ULTRADAP PAK TANI berbentuk kristal, sangat mudah larut dalam air (100% larut).",
//   //       "Mudah diaplikasikan dengan cara ditabur, dikocor/disiram, semprot atau sistem hidroponik.",
//   //       "Merangsang pertumbuhan akar, pembentukan batang dan merangsang pembentukan bunga.",
//   //       "Cocok dipakai untuk semua jenis tanaman sayuran, buah- buahan, tanaman hias/bunga, padi, jagung, palawija dan tanaman perkebunan serta tanaman yang ditanam di green house atau hidroponik."
//   //     ],
//   //     "gejalaKekurangan": [],
//   //   },
//   //   "bundle": {"Paket bundle": []},
//   //   "countdownku": "00:00:00",
//   //   "diskon": 0,
//   //   "kategoriProduk": 0,
//   //   "id_MenuRawatan": "1",
//   //   "linkSp":"","harga": "0"
//   // },
//   // {
//   //   "id": 50,
//   //   "idPerusahaan": 2,
//   //   "nama": "Poston 250 SC",
//   //   "kandungan": 0,
//   //   "bentuk": "cair",
//   //   "title": "Pupuk Poston 250 SC",
//   //   "color": ["049942", "011d0d", "034f23"],
//   //   "penjelas": "CV. Saprotan Utama",
//   //   "img": "assets/images/product/Poston250SC.png",
//   //   "brosure": [],
//   //   "informasi": {
//   //     "spesifikasi": ["Paklobutrazol 250 g/l"],
//   //     "sifat": ["Larut dalam air"],
//   //     "manfaat": [
//   //       "Mempercepat & meningkatkan pembungaan dan pembuahan.",
//   //       "Meningkatkan jumlah buah per pohon.",
//   //       "Memperbaiki kualitas buah.",
//   //       "Meningkatkan banyaknya ranting produktif pada tanaman."
//   //     ],
//   //     "gejalaKekurangan": [],
//   //   },
//   //   "bundle": {"Paket bundle": []},
//   //   "countdownku": "00:00:00",
//   //   "diskon": 0,
//   //   "kategoriProduk": 0,
//   //   "id_MenuRawatan": "1",
//   //   "linkSp":"","harga": "0"
//   // },
  {
    "id": 51,
    "idPerusahaan": 4,
    "nama": "Spons busa",
    "kandungan": 100,
    "bentuk": "Spons",
    "title": "Spons busa",
    "color": ["dbab2d", "FFFFFF", "F1F44B"],
    "penjelas": "Rawatan",
    "img": "assets/images/MenuRawatan/RawatMotor/spons.png",
    "brosure": [],
    "informasi": {
      "spesifikasi": [
        "Sponge poles mobil / motor yang sangat lembut dan berstruktur rapat sehingga memberikan keamanan dan kenyamanan pada saat proses aplikasi polishing ataupun waxing.",
        "- Warna Kuning\n- Diameter : 10 cm\n- Tebal : 2cm\n- Kualitas busa dijamin bagus\n- Lebih padat dan kenyal tidak gampang rusak jika di pakai poles"
      ],
      "sifat": ["spons"],
      "manfaat": [
        "Bebas Goresan",
        "Proses Aplikasi Wax Cepat Dan Mudah",
        "Melapisi seluruh permukaan secara merata",
        "Bahan sponge lembut"
      ],
      "gejalaKekurangan": [""]
    },
    "bundle": {"Paket bundle": []},
    "countdownku": "00:00:00",
    "diskon": 0,
    "kategoriProduk": 0,
    "id_MenuRawatan": "0",
    "linkSp": "",
    "harga": "4000"
  },
  {
    "id": 52,
    "idPerusahaan": 4,
    "nama": "KAIN LAP MICROFIBER",
    "kandungan": 30,
    "bentuk": "Microfiber",
    "title": "Microfiber",
    "color": ["1410b0", "FFFFFF", "F1F44B"],
    "penjelas": "Rawatan",
    "img": "assets/images/MenuRawatan/RawatMotor/microfiber.png",
    "brosure": [],
    "informasi": {
      "spesifikasi": ["Warna Random", "Terbuat dari High Quality Micro Fiber"],
      "sifat": ["microfiber"],
      "manfaat": [
        "Bahan Halus tidak menimbulkan Baret/Luka pada Mobil",
        "Menyerap dengan sempurna",
        "Membersihkan dengan efektif"
      ],
      "gejalaKekurangan": [""]
    },
    "bundle": {"Paket bundle": []},
    "countdownku": "00:00:00",
    "diskon": 0,
    "kategoriProduk": 0,
    "id_MenuRawatan": "0",
    "linkSp": "",
    "harga": "5000"
  },
  {
    "id": 53,
    "idPerusahaan": 4,
    "nama": "Sarung Tangan (Nitrile Glove)",
    "kandungan": 30,
    "bentuk": "Nitrile Glove",
    "title": "Sarung Tangan (Nitrile Glove)",
    "color": ["0e0e0e", "FFFFFF", "F1F44B"],
    "penjelas": "Rawatan",
    "img": "assets/images/MenuRawatan/RawatMotor/Sarung Tangan.png",
    "brosure": [],
    "informasi": {
      "spesifikasi": ["Warna hitam pekat", "Handscoon Nitril Onehealth Black"],
      "sifat": ["Bahan Nitrile (Non Latex)"],
      "manfaat": [
        "Non alergi",
        "Ideal tebalnya",
        "Elastis",
        "Nyaman dipakai untuk lindungi tangan Anda di beberapa aktivitas"
            "Nyaman dipakai untuk lindungi tangan Anda di beberapa aktivitas"
      ],
      "gejalaKekurangan": [""]
    },
    "bundle": {"Paket bundle": []},
    "countdownku": "00:00:00",
    "diskon": 0,
    "kategoriProduk": 0,
    "id_MenuRawatan": "0",
    "linkSp": "",
    "harga": "3000"
  },
  {
    "id": 54,
    "idPerusahaan": 4,
    "nama": "Kuas Pembersih Mesin Serbaguna",
    "kandungan": 30,
    "bentuk": "Kuas",
    "title": "Kuas Pembersih Mesin Serbaguna",
    "color": ["a58856", "FFFFFF", "F1F44B"],
    "penjelas": "Rawatan",
    "img": "assets/images/MenuRawatan/RawatMotor/Kuas.png",
    "brosure": [],
    "informasi": {
      "spesifikasi": [
        "Kuas Pembersih ini, Anda dapat membersihkan kendaraan Anda dengan mudah dan efisien, bahkan pada bagian-bagian yang sulit dijangkau."
      ],
      "sifat": ["Kuas Pembersih"],
      "manfaat": [
        "Membersihkan Noda di Sela-sela Sulit",
        "Bulu Kuas yang Kuat dan Elastis",
        "Cocok untuk Produk Cleaning"
      ],
      "gejalaKekurangan": [""]
    },
    "bundle": {"Paket bundle": []},
    "countdownku": "00:00:00",
    "diskon": 0,
    "kategoriProduk": 0,
    "id_MenuRawatan": "0",
    "linkSp": "",
    "harga": "4000"
  },

  // {
  //   "id": 55,
  //   "idPerusahaan": 3,
  //   "nama": "POC",
  //   "kandungan": 36,
  //   "bentuk": "cair",
  //   "title": "POC",
  //   "color": ["0d5417", "011d0d", "939799"],
  //   "penjelas": "Petani Gen Z",
  //   "img": "assets/images/MenuRawatan/RawatTanam/poc.png",
  //   "brosure": [],
  //   "informasi": {
  //     "spesifikasi": [
  //       "Cara Pemakaian :",
  //       "Semprotkan pada tanaman bagian batang atau daun. 3-5 Semprotan",
  //       "ulangi 2 hari sekali jika tanaman sering di siram jika tidak sering disiram beri 3 hari sekali",
  //     ],
  //     "sifat": ["Larut dalam air"],
  //     "manfaat": [
  //       "Penggunaannya dapat meningkatkan proses fotosintesis",
  //       "Mencegah kerontokan bunga dan buah",
  //       "Meningkatkan kualitas",
  //       "Meningkatkan hasil produksi"
  //     ],
  //     "gejalaKekurangan": [""]
  //   },
  //   "bundle": {
  //     "Paket bundle": [53]
  //   },
  //   "countdownku": "2023-09-23 00:00:00.000",
  //   "diskon": 0,
  //   "kategoriProduk": 0,
  //   "id_MenuRawatan": "1",
  //   "linkSp":"https://shopee.co.id/Pupuk-POC-(Pupuk-Organik-Cair)-i.1100212693.20685533874?sp_atk=47e81373-47ad-4e50-9b49-85eb49c4abfc","harga": "20.000"
  // },

  {
    "id": 55,
    "idPerusahaan": 3,
    "nama": "Nutrisi ABmix Hidroponik",
    "kandungan": 2,
    "bentuk": "cair",
    "title": "Nutrisi Lengkap Hidroponik",
    "color": ["8B4513", "008000", "FFFFFF"],
    "penjelas": "Nutrisi Lengkap Hidroponik",
    "img": "assets/images/product/rawat/abmix.png",
    "brosure": [],
    "informasi": {
      "spesifikasi": [
        "Nutrisi A: Larutan konsentrat makronutrien",
        "Nutrisi B: Larutan konsentrat mikronutrien",
        "Volume: 500 ml per botol"
      ],
      "sifat": ["Cair", "Larutan konsentrat", "Mudah larut dalam air"],
      "manfaat": [
        "Menyediakan nutrisi lengkap untuk tanaman hidroponik",
        "Mendukung pertumbuhan optimal tanaman",
        "Meningkatkan hasil panen",
        "Mudah diaplikasikan dalam sistem hidroponik",
        "Formulasi seimbang untuk berbagai jenis tanaman"
      ],
      "gejalaKekurangan": [
        "Pertumbuhan tanaman terhambat",
        "Daun menguning atau layu",
        "Buah atau hasil panen berkurang",
        "Tanaman lebih rentan terhadap penyakit"
      ]
    },
    "bundle": {"Paket bundle": []},
    "countdownku": "00:00:00",
    "diskon": 0,
    "kategoriProduk": 0,
    "id_MenuRawatan": "1",
    "linkSp": "https://shopee.co.id/",
    "harga": "100000"
  },
  {
    "id": 56,
    "idPerusahaan": 3,
    "nama": "pH UP & DOWN Hidroponik",
    "kandungan": 2,
    "bentuk": "cair",
    "title": "Pengatur pH Hidroponik",
    "color": ["00A9B5", "009245", "FFFFFF"],
    "penjelas": "nam",
    "img": "assets/images/product/rawat/pH.png",
    "brosure": [],
    "informasi": {
      "spesifikasi": [
        "pH UP: Menaikan pH larutan nutrisi",
        "pH DOWN: Menurunkan pH larutan nutrisi",
        "Volume: 500 ml per botol"
      ],
      "sifat": ["Cair", "Mudah larut dalam air", "Konsentrat"],
      "manfaat": [
        "Mengatur pH larutan nutrisi sesuai kebutuhan tanaman",
        "Memastikan penyerapan nutrisi optimal oleh tanaman",
        "Meningkatkan pertumbuhan dan hasil panen tanaman hidroponik",
        "Mencegah masalah defisiensi atau toksisitas nutrisi",
        "Mudah diaplikasikan dalam sistem hidroponik"
      ],
      "gejalaKekurangan": [
        "pH tidak sesuai dapat menyebabkan pertumbuhan tanaman terhambat",
        "Penyerapan nutrisi tidak optimal",
        "Daun menguning atau layu"
      ]
    },
    "bundle": {"Paket bundle": []},
    "countdownku": "00:00:00",
    "diskon": 0,
    "kategoriProduk": 0,
    "id_MenuRawatan": "1",
    "linkSp": "https://shopee.co.id/",
    "harga": "500000"
  },

  // {
  //   "id": 56,
  //   "idPerusahaan": 3,
  //   "nama": "ZPT",
  //   "kandungan": 36,
  //   "bentuk": "cair",
  //   "title": "ZPT",
  //   "color": ["0d5417", "011d0d", "939799"],
  //   "penjelas": "Petani Gen Z",
  //   "img": "assets/images/MenuRawatan/RawatTanam/zpt.png",
  //   "brosure": [],
  //   "informasi": {
  //     "spesifikasi": [
  //       "CARA PAKAI:",
  //       "Semprotkan pada tanaman bagian batang atau daun, 3-5 Semprotan.",
  //       "Ulangi 7 hari sekali jika tanaman sering di siram jika tidak sering disiram beri 14 hari sekali ",
  //     ],
  //     "sifat": ["Larut dalam air"],
  //     "manfaat": [
  //       "Perangsang Pertumbuhan Batang",
  //       "Perangsang Pembungaan dan Pembuahan",
  //       "Pertumbuhan Daun",
  //       "Pembentukan Akar",
  //       "Penting dalam pertanian, untuk memastikan pertumbuhan yang optimal dan hasil yang baik"
  //     ],
  //     "gejalaKekurangan": [""]
  //   },
  //   "bundle": {
  //     "Paket bundle": [53]
  //   },
  //   "countdownku": "2023-09-23 00:00:00.000",
  //   "diskon": 0,
  //   "kategoriProduk": 0,
  //   "id_MenuRawatan": "1",
  //   "linkSp":"https://shopee.co.id/Hormon-ZPT-(Zat-Pengatur-Tumbuh)-i.1100212693.23184236997?sp_atk=d810bf61-752d-4a35-a4a1-9df4b0a79415","harga": "20.000"
  // },
  // {
  //   "id": 57,
  //   "idPerusahaan": 3,
  //   "nama": "Anti Ulat",
  //   "kandungan": 36,
  //   "bentuk": "cair",
  //   "title": "Anti Ulat",
  //   "color": ["0d5417", "011d0d", "939799"],
  //   "penjelas": "Petani Gen Z",
  //   "img": "assets/images/MenuRawatan/RawatTanam/antiulat.png",
  //   "brosure": [],
  //   "informasi": {
  //     "spesifikasi": [
  //       "Semprotkan pada tanaman atau bagian yang banyak ulat",
  //       "Ulangi jika masih ada ulat",
  //     ],
  //     "sifat": ["Larut dalam air"],
  //     "manfaat": [
  //       "Rawatlah tanaman kalian dalam mengendalikan ulat. Insektisida ini menggunakan formula konsentrat emulsi yang bekerja sebagai racun kontak dan lambung, memberikan perlindungan maksimal bagi tanaman kalian."
  //     ],
  //     "gejalaKekurangan": [""]
  //   },
  //   "bundle": {
  //     "Paket bundle": [53]
  //   },
  //   "countdownku": "2023-09-23 00:00:00.000",
  //   "diskon": 0,
  //   "kategoriProduk": 0,
  //   "id_MenuRawatan": "1",
  //   "linkSp":"","harga": "20.000"
  // },
  // {
  //   "id": 58,
  //   "idPerusahaan": 3,
  //   "nama": "Anti Rumput",
  //   "kandungan": 36,
  //   "bentuk": "cair",
  //   "title": "Anti Rumput",
  //   "color": ["0d5417", "011d0d", "939799"],
  //   "penjelas": "Petani Gen Z",
  //   "img": "assets/images/MenuRawatan/RawatTanam/antirumput.png",
  //   "brosure": [],
  //   "informasi": {
  //     "spesifikasi": [
  //       "Semprotkan pada rumput yang mengganggu pertumbuhan tanamanmu",
  //       "tunggu 3-4 hari jika masih ada rumput ulangi semprot pada rumput yang mengganggu",
  //     ],
  //     "sifat": ["Larut dalam air"],
  //     "manfaat": [
  //       "Sangat ampuh untuk membasmi segala jenis rumput",
  //       "Bekerja dengan sangat cepat membunuh rumput (48 jam rumput pasti kering)",
  //       "Dapat diaplikasikan dlaam segala cuaca baik hujan maupun kering",
  //       "Aman untuk tanaman di sekitar area yang yg disemprot",
  //     ],
  //     "gejalaKekurangan": [""]
  //   },
  //   "bundle": {
  //     "Paket bundle": [53]
  //   },
  //   "countdownku": "2023-09-23 00:00:00.000",
  //   "diskon": 0,
  //   "kategoriProduk": 0,
  //   "id_MenuRawatan": "1",
  //   "linkSp":"https://shopee.co.id/Anti-Rumput-(Anti-Gulma)-100-ml-i.1100212693.17396480056?sp_atk=4545de51-1acd-4810-af05-92915964ac2e","harga": "20.000"
  // },
  {
    "id": 60,
    "idPerusahaan": 3,
    "nama": "Black Pro",
    "kandungan": 100,
    "bentuk": "cair",
    "title": "Black Pro",
    "color": ["020101", "FFFFFF", "034f23"],
    "penjelas": "Rawatan",
    "img": "assets/images/MenuRawatan/RawatMotor/Botol_MotorRawat_1.png",
    "brosure": [],
    "informasi": {
      "spesifikasi": [
        '''Cara Penggunaan :\n1. Mulailah dengan mengambil Aplikator busa.\n2. Selanjutnya, tuangkan Produk ini ke busa dalam jumlah yang sesuai. \n3. Usapkan produk ini ke area yang ingin Anda berikan warna hitam.\n4. Jika hasilnya belum mencapai kepuasan, 5. Anda dapat mengulangi langkah ini 2-3 kali.\n''',
        '''Bisa di gunakan di seluruh bagian exterior/interior berwarna Hitam yg memiki pori-pori di kendaraan apapun.\nContoh :\n1.Door Trim\n2.Back Leading\n3.Trim Kaca Depan\n4.Bumper\n5.Seluruh Yang berbahan hitam Plastik Kasar(Bukan Body)'''
      ],
      "sifat": ["Penghitam"],
      "manfaat": [
        "Menghitamkan Trim berbahan plastik hitam",
        "Shiny (Mengkilapkan trim dengan alami)",
        "Moisture dan menjaga trim agar tidak mudah rusak",
      ],
      "gejalaKekurangan": [],
    },
    "bundle": {
      "Paket bundle": [51, 53]
    },
    "countdownku": "2023-09-23 00:00:00.000",
    "diskon": 0,
    "kategoriProduk": 0,
    "id_MenuRawatan": "0",
    "linkSp":
        "https://shopee.co.id/Black-Pro-(Penghitam-body-Plastik-Kasar)-i.1100212693.22358749969?sp_atk=69637ec0-b7c5-4ae3-9556-996bdde20789&xptdk=69637ec0-b7c5-4ae3-9556-996bdde20789",
    "harga": "20.000"
  },
  {
    "id": 61,
    "idPerusahaan": 3,
    "nama": "Shine Pro",
    "kandungan": 100,
    "bentuk": "cair",
    "title": "Shine Pro",
    "color": ["020101", "FFFFFF", "034f23"],
    "penjelas": "Rawatan",
    "img": "assets/images/MenuRawatan/RawatMotor/Botol_MotorRawat_5.png",
    "brosure": [],
    "informasi": {
      "spesifikasi": [
        '''Cara Penggunaan :\n1. Mulailah dengan mengambil Aplikator busa.\n2. Selanjutnya, tuangkan Produk ini ke busa dalam jumlah yang sesuai. \n3. Usapkan produk ini ke area yang ingin Anda bersihkan.\n''',
        '''Nano coating melibatkan penggunaan teknologi struktur nano, yang memberikan lapisan tambahan perlindungan pada cat mobil Anda, bahkan hingga ke partikel terkecil (partikel nano).'''
      ],
      "sifat": ["pengkilap"],
      "manfaat": [
        "MengKilaukan dan Perlindungan Cat",
        "Tampilan Basah Berkilau Sangat Tinggi",
        "Sangat Bagus untuk Penggunaan Manual",
        "Efek Hidrofobikk",
      ],
      "gejalaKekurangan": [],
    },
    "bundle": {
      "Paket bundle": [52, 53]
    },
    "countdownku": "2023-09-23 00:00:00.000",
    "diskon": 0,
    "kategoriProduk": 0,
    "id_MenuRawatan": "0",
    "linkSp":
        "https://shopee.co.id/Shine-Pro-(Pengkilap-body-Motor)-i.1100212693.23784245876?sp_atk=adda3f86-1f15-4bbb-a7dc-0dc3ad490b24",
    "harga": "18.000"
  },
  {
    "id": 62,
    "idPerusahaan": 3,
    "nama": "Shampo wax",
    "kandungan": 100,
    "bentuk": "cair",
    "title": "Shampo wax",
    "color": ["020101", "FFFFFF", "034f23"],
    "penjelas": "Rawatan",
    "img": "assets/images/MenuRawatan/RawatMotor/Botol_MotorRawat_4.png",
    "brosure": [],
    "informasi": {
      "spesifikasi": [
        '''Cara Penggunaan :\n1. tuangkan shampo secukup nya ke ember untuk tabung salju ( snow & ice cream )\n1. untuk busa snow ukuran 20 liter tuangkan shampo 600-800 ml ke tabung salju lalu isi air tabung salju hingga penuh lalu goyangkan tabung salju nya. untuk busa ice cream tuangkan shampo 1200 ml-1500 ml\n2. untuk busa snow ukuran 40 liter tuangkan shampo 1500 ml- 2000 ml ke tabung salju lalu isi air tabung salju hingga penuh lalu goyangkan tabung salju nya untuk busa ice cream tuangkan 2500 ml- 3000 ml\n''',
        '''Menghadirkan aroma yang segar.\nTidak mengandung bahan berbahaya seperti soda api atau labs.\nMemiliki pH sekitar 7, aman digunakan setiap hari.\nTidak menggunakan zat konsentrat yang dapat merusak cat. '''
      ],
      "sifat": ["pembersih"],
      "manfaat": [
        "Shiny (Mengkilapkan dan membersihkan motor ataupun mobil) dan Mengandung wax yang memberikan kilau.",
      ],
      "gejalaKekurangan": [],
    },
    "bundle": {
      "Paket bundle": [52, 53]
    },
    "countdownku": "2023-09-23 00:00:00.000",
    "diskon": 0,
    "kategoriProduk": 0,
    "id_MenuRawatan": "0",
    "linkSp": "",
    "harga": "17.000"
  },
  {
    "id": 63,
    "idPerusahaan": 3,
    "nama": "Rust Remover",
    "kandungan": 100,
    "bentuk": "cair",
    "title": "Rust Remover",
    "color": ["020101", "FFFFFF", "034f23"],
    "penjelas": "Rawatan",
    "img": "assets/images/MenuRawatan/RawatMotor/Botol_MotorRawat_3.png",
    "brosure": [],
    "informasi": {
      "spesifikasi": [
        '''Cara Penggunaan :\nTuangkan cairan ke dalam wadah plastik.\nPotong kuas sekitar 2 cm atau gunakan sikat gigi bekas sebagai pengganti kuas.\nSapukan cairan ini pada area blok mesin yang berkerak dengan sedikit tekanan.\nBiarkan selama sekitar 10 menit agar kerak, kotoran, dan karat dapat terbakar atau larut dalam cairan.\nSetelah 10 menit, bersihkan area tersebut dan bilas dengan menggunakan air bersih.\nJika setelah proses ini masih ada kotoran yang tersisa, ulangi langkah-langkah dari nomor 3.\nPastikan mencuci dan menyiram bagian mesin yang telah selesai dibersihkan untuk mengurangi risiko perubahan warna (kuning) di sekitar blok mesin akibat kontak dengan cairan ini.\n''',
      ],
      "sifat": ["pengkilap"],
      "manfaat": [
        "Mampu Menghilangkan Kerak di Sela-Sela Bodi Mobil: Pastikan pembersih ini dapat mengatasi kerak dan kotoran yang menempel pada permukaan bodi mobil, termasuk di sela-sela bodi yang sulit dijangkau.",
        " Efektif Membersihkan Velg dan Lubang Baut yang Berkarat: Pembersih ini harus mampu mengatasi karat pada velg dan membantu membersihkan dengan baik, termasuk lubang baut pada velg.",
        "Mampu Membersihkan Kerak dan Karat di Semua Bagian Kendaraan: Pastikan produk tersebut dapat digunakan untuk membersihkan kerak dan karat di seluruh bagian kendaraan, termasuk bagian bawah mobil, roda, dan area lainnya.",
        " Dapat Membersihkan Kerak di Panel Mobil (seperti Panel K13): Produk ini harus cukup kuat untuk mengatasi kerak di panel mobil, termasuk panel K13 atau bagian lain yang terkena kotoran dan debu.",
        "Mampu Menghilangkan Sisa Oli, Aspal, dan Pasir yang Menempel: Pastikan pembersih ini dapat menghilangkan sisa oli, aspal, dan pasir yang menempel pada kendaraan.",
        "Mampu Merontokkan Kotoran akibat Rembesan Oli: Produk ini sebaiknya memiliki kemampuan untuk mengatasi kotoran yang muncul akibat rembesan oli atau cairan lainnya.",
      ],
      "gejalaKekurangan": [],
    },
    "bundle": {
      "Paket bundle": [54, 53]
    },
    "countdownku": "2023-09-23 00:00:00.000",
    "diskon": 0,
    "kategoriProduk": 0,
    "id_MenuRawatan": "0",
    "linkSp":
        "https://shopee.co.id/Rust-Remover-(Pembersih-Karat-Ringan)-i.1100212693.20994494183?sp_atk=44bdb68d-5a98-4ef9-8c36-2dd7416dff1a",
    "harga": "18.000"
  },
  {
    "id": 64,
    "idPerusahaan": 3,
    "nama": "Glass Cleaner",
    "kandungan": 100,
    "bentuk": "cair",
    "title": "Glass Cleaner",
    "color": ["020101", "FFFFFF", "034f23"],
    "penjelas": "Rawatan",
    "img": "assets/images/MenuRawatan/RawatMotor/Botol_MotorRawat_2.png",
    "brosure": [],
    "informasi": {
      "spesifikasi": [
        '''Cara Penggunaan :Cara Penggunaan :\n1. Mulailah dengan mengambil Aplikator busa.\n2. Selanjutnya, tuangkan Produk ini ke busa dalam jumlah yang sesuai. \n3. Usapkan produk ini ke area yang ingin Anda bersihkan.\n''',
      ],
      "sifat": ["pengkilap"],
      "manfaat": [
        "Campuran formula khusus Glass Cleaner yang juga berfungsi sebagai obat jamur atau penghilang kerak untuk kaca dan bodi mobil yang sangat ampuh telah menjadi pilihan yang banyak digunakan oleh dealer mobil bekas di Jakarta. Produk ini telah terbukti efektif dalam membersihkan dan merawat kendaraan, membantu menghilangkan jamur, kerak, dan kotoran yang menempel pada permukaan kaca dan bodi mobil. Keamanan dan keampuhannya telah mendapatkan pengakuan dari para profesional otomotif, menjadikannya pilihan yang baik untuk menjaga tampilan kendaraan Anda dalam kondisi terbaik."
      ],
      "gejalaKekurangan": [],
    },
    "bundle": {
      "Paket bundle": [52, 53]
    },
    "countdownku": "2023-09-23 00:00:00.000",
    "diskon": 0,
    "kategoriProduk": 0,
    "id_MenuRawatan": "0",
    "linkSp": "",
    "harga": "18.000"
  },
  // {
  //   "id": 65,
  //   "idPerusahaan": 3,
  //   "nama": "Anti Semut",
  //   "kandungan": 36,
  //   "bentuk": "cair",
  //   "title": "Anti Semut",
  //   "color": ["27374D", "FFFFFF", "27374D"],
  //   "penjelas": "Rawatan",
  //   "img": "assets/images/MenuRawatan/RawatRumah/usirsemut.png",
  //   "brosure": [],
  //   "informasi": {
  //     "spesifikasi": [
  //       "Semprotkan pada tanaman atau bagian yang banyak semut",
  //       "Ulangi jika masih ada semut",
  //     ],
  //     "sifat": ["Larut dalam air"],
  //     "manfaat": [
  //       "Anti Semut adalah pengusir semut yang mengganggu dengan solusi hebat untuk mengatasi masalah semut. Produk ini merupakan insektisida sistemik yang mampu menghentikan jalur ion klorida yang mengantar asam gama-amino-butirik (GABA) ke pusat saraf serangga. Ketika semut terpapar produk ini, efeknya akan menyebar ke seluruh populasi atau koloni semut di sekitarnya, menjadikannya metode yang sangat efektif untuk membasmi semut yang meresahkan.",
  //     ],
  //     "gejalaKekurangan": [""]
  //   },
  //   "bundle": {
  //     "Paket bundle": [53]
  //   },
  //   "countdownku": "2023-09-23 00:00:00.000",
  //   "diskon": 0,
  //   "kategoriProduk": 0,
  //   "id_MenuRawatan": "2",
  //   "linkSp":"https://shopee.co.id/Anti-Semut-(Insektisida-Semut)-i.1100212693.23284242331?sp_atk=3485d939-3baa-4559-8f08-1621ebd8da4c","harga": "20.000"
  // },
//   {
//     "id": 66,
//     "idPerusahaan": 3,
//     "nama": "Pengusir Kucing",
//     "kandungan": 150,
//     "bentuk": "cair",
//     "title": "Pengusir Kucing",
//     "color": ["27374D", "FFFFFF", "27374D"],
//     "penjelas": "Rawatan",
//     "img": "assets/images/MenuRawatan/RawatRumah/usirkucing.png",
//     "brosure": [],
//     "informasi": {
//       "spesifikasi": [
//         ''' Cara Pengunaan\n
// 1. Goyangkan botol \n
// 2. Semprotkan produk ke area yang ingin\n
// 3. Biarkan produk mengering.\n
// 4. Jika terkena air atau hujan, ulangi penyemprotan sesuai kebutuhan.\n''',
//       ],
//       "sifat": ["Larut dalam air"],
//       "manfaat": [
//         "Manfaat : Terbuat dari 100% bahan alami, tanpa merugikan kucing Non-toksik, aman bagi hewan peliharaan Sesuai untuk digunakan di Taman atau pekarangan rumah Atap rumah Pagar rumah atau kantor Gudang"
//       ],
//       "gejalaKekurangan": [],
//     },
//     "bundle": {
//       "Paket bundle": [52, 53]
//     },
//     "countdownku": "2023-09-23 00:00:00.000",
//     "diskon": 0,
//     "kategoriProduk": 0,
//     "id_MenuRawatan": "2",
//     "linkSp":"https://shopee.co.id/Pengusir-Kucing-Tanpa-Menyakiti-i.1100212693.18185967198?sp_atk=c5a1b8a1-6292-4c13-ba5a-3efb8970d625","harga": "18.000"
//   },
  // {
  //   "id": 67,
  //   "idPerusahaan": 3,
  //   "nama": "Anti Tikus",
  //   "kandungan": 150,
  //   "bentuk": "cair",
  //   "title": "Anyi Tikus",
  //   "color": ["27374D", "FFFFFF", "27374D"],
  //   "penjelas": "Rawatan",
  //   "img": "assets/images/MenuRawatan/RawatRumah/usirtikus.png",
  //   "brosure": [],
  //   "informasi": {
  //     "spesifikasi": [
  //       ''' Semprotkan pada daerah yang menjadi lalu lalang Tikus. Seperti di selokan kamar mandi, sela-sela dapur, lemari yang lembab, dan area yang memiliki kelembapan''',
  //     ],
  //     "sifat": ["Larut dalam air"],
  //     "manfaat": [
  //       """Manfaat : \n1. Menghalangi reproduksi tikus\n
  // 2. Mencegah kedatangan ulang\n
  // 3. Tidak berbahaya bagi tanaman\n
  // 4. Aman untuk hewan peliharaan\n
  // 5. Tanpa zat beracun.\n"""
  //     ],
  //     "gejalaKekurangan": [],
  //   },
  //   "bundle": {
  //     "Paket bundle": [52, 53]
  //   },
  //   "countdownku": "2023-09-23 00:00:00.000",
  //   "diskon": 0,
  //   "kategoriProduk": 0,
  //   "id_MenuRawatan": "2",
  //   "linkSp":"https://shopee.co.id/Pengusir-Tikus-ANTI-TIKUS-i.1100212693.23285410054?sp_atk=d84bd9db-058c-4cc0-b214-6476700a4fa9","harga": "18.000"
  // },
  {
    "id": 4,
    "idPerusahaan": 3,
    "nama": "Rat Poison",
    "kandungan": 1,
    "bentuk": "kotak kecil-kecil",
    "title": "Racun Tikus",
    "color": ["000000", "FFFFFF", "FF0000"],
    "penjelas": "Racun Tikus",
    "img": "assets/images/product/rawat/tikus.png",
    "brosure": [],
    "informasi": {
      "spesifikasi": ["Racun khusus untuk tikus", "Produk dari Indonesia"],
      "sifat": ["umpan", "Beracun jika tertelan"],
      "manfaat": [
        "Mengendalikan populasi tikus",
        "Melindungi properti dan hasil panen dari kerusakan tikus"
      ],
      "gejalaKekurangan": ["Tidak relevan untuk produk ini"]
    },
    "bundle": {"Paket bundle": []},
    "countdownku": "00:00:00",
    "diskon": 0,
    "kategoriProduk": 0,
    "id_MenuRawatan": "2",
    "linkSp": "",
    "harga": "25000"
  },
  {
    "id": 68,
    "idPerusahaan": 0,
    "nama": "dolomit",
    "kandungan": 60,
    "bentuk": "granul",
    "title": "Dolomit",
    "color": ["049942", "011d0d", "034f23"],
    "penjelas": "PT. Petrokimia Gresik",
    "img": "assets/images/product/Kapur.png",
    "brosure": [],
    "informasi": {
      "spesifikasi": [
        "Meningkatkan pH tanah",
        "Warna : Putih",
        "Bentuk : Kristal"
      ],
      "sifat": ["Larut dalam air"],
      "manfaat": [
        "Membersihkan tanah dari senyawa racun",
        "Meningkatkan populasi mikroba baik",
        "Menetralkan unsur kimia Al",
      ],
      "gejalaKekurangan": [],
    },
    "bundle": {"Paket bundle": []},
    "countdownku": "00:00:00",
    "diskon": 0,
    "kategoriProduk": 0,
    "id_MenuRawatan": "1",
    "linkSp": "",
    "harga": "0"
  },
  {
    "id": 69,
    "idPerusahaan": 3,
    "nama": "Pelet Hi-Pro-Vite 781-1",
    "kandungan": 30,
    "bentuk": "Pelet",
    "title": "Pelet Hi-Pro-Vite 781-1",
    "color": ["549370", "011d0d", "034f23"],
    "penjelas": "Pelet ikan",
    "img": "assets/images/product/pelet.png",
    "brosure": [],
    "informasi": {
      "spesifikasi": [
        "pakan ikan tipe terapung",
        "Warna : Coklat",
        "Bentuk : granul"
      ],
      "sifat": ["ikan tipe terapung"],
      "manfaat": [
        "mengandung komposisi nutrisi yang lengkap dan berkualitas tinggi dengan kandungan protein (asam amino esensial dan esensial), lemak, serat kasar dan mineral yang sesuai untuk pertumbuhan ikan",
        " mengandung atraktan yang kuat yang merangsang nafsu makan ikan lele sehingga pertumbuhan menjadi optimal"
      ],
      "gejalaKekurangan": [],
    },
    "bundle": {"Paket bundle": []},
    "countdownku": "00:00:00",
    "diskon": 0,
    "kategoriProduk": 6,
    "id_MenuRawatan": "3",
    "linkSp": "",
    "harga": "0"
  },
  {
    "id": 70,
    "idPerusahaan": 3,
    "nama": "Pelet Hi-Pro-Vite 782",
    "kandungan": 30,
    "bentuk": "Pelet",
    "title": "Pelet Hi-Pro-Vite 782",
    "color": ["549370", "011d0d", "034f23"],
    "penjelas": "Pelet ikan",
    "img": "assets/images/product/pelet.png",
    "brosure": [],
    "informasi": {
      "spesifikasi": [
        "pakan ikan tipe terapung",
        "Warna : Coklat",
        "Bentuk : granul"
      ],
      "sifat": ["ikan tipe terapung"],
      "manfaat": [
        "mengandung komposisi nutrisi yang lengkap dan berkualitas tinggi dengan kandungan protein (asam amino esensial dan esensial), lemak, serat kasar dan mineral yang sesuai untuk pertumbuhan ikan",
        " mengandung atraktan yang kuat yang merangsang nafsu makan ikan lele sehingga pertumbuhan menjadi optimal"
      ],
      "gejalaKekurangan": [],
    },
    "bundle": {"Paket bundle": []},
    "countdownku": "00:00:00",
    "diskon": 0,
    "kategoriProduk": 6,
    "id_MenuRawatan": "3",
    "linkSp": "",
    "harga": "0"
  },

  {
    "id": 71,
    "idPerusahaan": 3,
    "nama": "Coarse Salt",
    "kandungan": 1,
    "bentuk": "kristal",
    "title": "Garam Kasar",
    "color": ["000000", "FFFFFF", "008080"],
    "penjelas": "Garam Kasar",
    "img": "assets/images/product/rawat/garam.png",
    "brosure": [],
    "informasi": {
      "spesifikasi": ["Garam berbutir kasar", "Produk dari Indonesia"],
      "sifat": ["Kristal kasar", "Mudah larut dalam air"],
      "manfaat": ["Pengawet alami", "Penyedap makanan", "Bahan baku industri"],
      "gejalaKekurangan": ["Tidak relevan untuk produk ini"]
    },
    "bundle": {"Paket bundle": []},
    "countdownku": "00:00:00",
    "diskon": 0,
    "kategoriProduk": 0,
    "id_MenuRawatan": "3",
    "linkSp": "",
    "harga": "15000"
  },
  // {
  //   "id": 71,
  //   "idPerusahaan": 3,
  //   "nama": "Pelet Comfeed",
  //   "kandungan": 30,
  //   "bentuk": "Pelet",
  //   "title": "Pelet Comfeed",
  //   "color": ["049942", "011d0d", "034f23"],
  //   "penjelas": "Pelet ikan",
  //   "img": "assets/images/product/Kapur.png",
  //   "brosure": [],
  //   "informasi": {
  //     "spesifikasi": [
  //       "pakan ikan tipe terapung",
  //       "Warna : Coklat",
  //       "Bentuk : granul"
  //     ],
  //     "sifat": ["ikan tipe terapung"],
  //     "manfaat": [
  //       "Nutrisi lengkap dan seimbang",
  //       "Kualitas pakan yang seragam",
  //       "Jaminan ketersediaan pakan secara tepat waktu dan jumlah",
  //       "Ramah lingkungan"
  //     ],
  //     "gejalaKekurangan": [],
  //   },
  //   "bundle": {"Paket bundle": []},
  //   "countdownku": "00:00:00",
  //   "diskon": 0,
  //   "kategoriProduk":  6,
  //   "id_MenuRawatan": "3",
  //   "linkSp":"","harga": "0"
  // },
  // {
  //   "id": 72,
  //   "idPerusahaan": 3,
  //   "nama": "Pelet MS Preo 891",
  //   "kandungan": 30,
  //   "bentuk": "Pelet",
  //   "title": "Pelet MS Preo 891",
  //   "color": ["049942", "011d0d", "034f23"],
  //   "penjelas": "Pelet ikan",
  //   "img": "assets/images/product/Kapur.png",
  //   "brosure": [],
  //   "informasi": {
  //     "spesifikasi": [
  //       "pakan ikan tipe terapung",
  //       "Warna : Coklat",
  //       "Bentuk : granul"
  //     ],
  //     "sifat": ["ikan tipe terapung"],
  //     "manfaat": [
  //       "Pakan yang menyediakan nutrisi lengkap dan seimbang",
  //       "Kualitas pakan yang konsisten",
  //       "Pemenuhan pakan secara tepat waktu dan jumlah yang terjamin"
  //     ],
  //     "gejalaKekurangan": [],
  //   },
  //   "bundle": {"Paket bundle": []},
  //   "countdownku": "00:00:00",
  //   "diskon": 0,
  //   "kategoriProduk":  6,
  //   "id_MenuRawatan": "3",
  //   "linkSp":"","harga": "0"
  // },

  {
    "id": 73,
    "idPerusahaan": 3,
    "nama": "Urea",
    "kandungan": 46,
    "bentuk": "granul",
    "title": "Pupuk Urea",
    "color": ["049942", "FFFFFF", "034f23"],
    "penjelas": "PT. Petrokimia Gresik",
    "img": "assets/images/product/subnonsub_urea.png",
    "brosure": ["assets/images/brosure/urea_1.jpg"],
    "informasi": {
      "spesifikasi": [
        "Kadar air maksimal 0,50%",
        "Kadar Biuret maksimal 1%",
        "Kadar Nitrogen minimal 46%",
        "Bentuk butiran tidak berdebu",
        "Warna putih (non subsidi)",
        "Warna pink untuk Urea Bersubsidi",
        "Dikemas dalam kantong dengan isi 50 kg"
      ],
      "sifat": ["Higroskopis", "Mudah larut dalam air"],
      "manfaat": [
        "Membuat bagian tanaman lebih hijau dan segar",
        "Mempercepat pertumbuhan",
        "Menambah kandungan protein hasil panen"
      ],
      "gejalaKekurangan": [
        "Seluruh tanaman berwarna pucat kekuningan",
        "Pertumbuhan tanaman lambat dan kerdil",
        "Daun tua berwarna kekuningan. Pada tanaman padi dimulai dari ujung daun menjalar ke tulang daun",
        "Pertumbuhan buah tidak sempurna seringkali masak sebelum waktunya",
        "Jika dalam keadaan kekurangan yang parah daun menjadi kering dimulai dari bagian bawah tanaman terus ke bagian atas tanaman."
      ],
    },
    "bundle": {"Paket bundle": []},
    "countdownku": "00:00:00",
    "diskon": 0,
    "kategoriProduk": 0,
    "id_MenuRawatan": "3",
    "linkSp": "",
    "harga": "0"
  },
  {
    "id": 74,
    "idPerusahaan": 3,
    "nama": "Pakan Ayam",
    "kandungan": 46,
    "bentuk": "granul",
    "title": "Pakan Ayam",
    "color": ["049942", "FFFFFF", "034f23"],
    "penjelas": "Rawatan",
    "img": "assets/images/product/pakan_ayam.png",
    "brosure": ["assets/images/MenuRawatan/label_ayam.png"],
    "informasi": {
      "spesifikasi": [
        "Pakan Ayam",
      ],
      "sifat": [""],
      "manfaat": ["Memenuhi Kebutuhan pakan Pada Ayam"],
      "gejalaKekurangan": [""],
    },
    "bundle": {"Paket bundle": []},
    "countdownku": "00:00:00",
    "diskon": 0,
    "kategoriProduk": 0,
    "id_MenuRawatan": "5",
    "linkSp": "",
    "harga": "0"
  },
  {
    "id": 75,
    "idPerusahaan": 3,
    "nama": "Maggot",
    "kandungan": 46,
    "bentuk": "Maggot",
    "title": "Maggot",
    "color": ["049942", "FFFFFF", "034f23"],
    "penjelas": "Rawatan",
    "img": "assets/images/MenuRawatan/label_magot.png",
    "brosure": ["assets/images/MenuRawatan/label_magot.png"],
    "informasi": {
      "spesifikasi": [
        "Protein 30-40%",
      ],
      "sifat": ["Larba", "Hidup"],
      "manfaat": [
        "Pakan Alternatif Ayam",
        "Pakan Alternatif Ikan",
        "Menambah kandungan protein hasil panen"
      ],
      "gejalaKekurangan": [""],
    },
    "bundle": {"Paket bundle": []},
    "countdownku": "00:00:00",
    "diskon": 0,
    "kategoriProduk": 0,
    "id_MenuRawatan": "4",
    "linkSp": "",
    "harga": "0"
  },
  // {
  //   "id": 74,
  //   "idPerusahaan": 3,
  //   "nama": "Niphos",
  //   "kandungan": 0,
  //   "bentuk": "granul",
  //   "title": "Petro Niphos",
  //   "color": ["003963", "011d0d", "034f23"],
  //   "penjelas": "PT. Petrokimia Gresik",
  //   "img": "assets/images/product/NPS.png",
  //   "brosure": [
  //     "assets/images/brosure/niphos_1.jpg",
  //     "assets/images/brosure/niphos_2.jpg"
  //   ],
  //   "informasi": {
  //     "spesifikasi": [
  //       "N (Nitrogen) : 20%",
  //       "P2O5 (Fosfat) : 20%",
  //       "S (Sulfur) : 13%"
  //     ],
  //     "sifat": ["Larut dalam air"],
  //     "manfaat": [
  //       "Diperkaya dengan unsur Nitrogen, Fosfat, dan Sulfur",
  //       "Larut dalam air (mudah untuk aplikasi kocor)",
  //       "Meningkatkan efisiensi dan efektifitas penggunaan pupuk",
  //       "Meningkatkan jumlah dan mutu hasil panen",
  //       "Hasil racikan bahan baku melalui proses produksi yang tepat sehingga menghasilkan kualitas campuran produk yang homogen"
  //     ],
  //     "gejalaKekurangan": [],
  //   },
  //   "bundle": {"Paket bundle": []},
  //   "countdownku": "00:00:00",
  //   "diskon": 0,
  //   "kategoriProduk": 0,
  //   "id_MenuRawatan": "3",
  //   "linkSp":"","harga": "0"
  // },
  // {
  //   "id": 75,
  //   "idPerusahaan": 3,
  //   "nama": "Petroganik",
  //   "kandungan": 0,
  //   "bentuk": "granul",
  //   "title": "Pupuk Petroganik",
  //   "color": ["84c225", "011d0d", "034f23"],
  //   "penjelas": "PT. Petrokimia Gresik",
  //   "img": "assets/images/product/PETROGANIK.png",
  //   "brosure": [
  //     "assets/images/brosure/petroganik_1.jpg",
  //     "assets/images/brosure/petroganik_2.jpg"
  //   ],
  //   "informasi": {
  //     "spesifikasi": [
  //       "C-organik : Minimal 15%",
  //       "C/N : ratio 15 - 25",
  //       "Kadar air : Maksimal 8-20%",
  //       "pH : 4 - 9",
  //       "Warna : Coklat kehitaman",
  //       "Bentuk : Granul",
  //       "Padi dan Palawijaya : 500 - 1.000 kg per ha",
  //       "Hortikultura : 2.000 kg per ha",
  //       "Tanaman keras : 3 kg per pohon",
  //       "Tambak : 300 - 500 kg per ha",
  //       "Penggunaan: Penggunaan pupuk Petroganik pada tanaman pangan dan hortikultura diberikan seluruhnya pada pemupukan dasar, sedangkan pada tanaman keras diberikan pada awal dan akhir musim hujan"
  //     ],
  //     "sifat": ["Larut dalam air"],
  //     "manfaat": [
  //       "Memperbaiki struktur dan tata udara tanah sehingga penyerapan unsur hara oleh akar tanaman menjadi lebih baik",
  //       "Meningkatkan daya sangga air tanah sehingga ketersediaan air dalam tanah menjadi lebih baik",
  //       "Menjadi penyangga unsur hara dalam tanah sehingga pemupukan menjadi lebih efisien",
  //       "Sesuai untuk semua jenis tanah dan jenis tanaman",
  //       "Kadar C-organik tinggi",
  //       "Berbentuk granul sehingga mudah dalam aplikasi",
  //       "Aman dan ramah lingkungan (bebas mikroba patogen)",
  //       "Bebas dari biji-bijian gulma",
  //       "Kadar air rendah sehingga lebih efisien dalam pengangkutan dan penyimpanan",
  //       "Dikemas dalam kantong kedap air"
  //     ],
  //     "gejalaKekurangan": [],
  //   },
  //   "bundle": {"Paket bundle": []},
  //   "countdownku": "00:00:00",
  //   "diskon": 0,
  //   "kategoriProduk": 0,
  //   "id_MenuRawatan": "3",
  //   "linkSp":"","harga": "0"
  // },{
  //   "id": 76,
  //   "idPerusahaan": 3,
  //   "nama": "KCL",
  //   "kandungan": 60,
  //   "bentuk": "granul",
  //   "title": "Pupuk KCL",
  //   "color": ["049942", "011d0d", "034f23"],
  //   "penjelas": "PT. Petrokimia Gresik",
  //   "img": "assets/images/product/KCL.png",
  //   "brosure": ["assets/images/brosure/KCL.png"],
  //   "informasi": {
  //     "spesifikasi": [
  //       "Kadar K2O : 60%",
  //       "Warna : Merah / Putih",
  //       "Bentuk : Kristal"
  //     ],
  //     "sifat": ["Larut dalam air"],
  //     "manfaat": [
  //       "Membuat tanaman lebih tegak dan kokoh",
  //       "Meningkatkan daya tahan tanaman terhadap serangan hama, penyakit, dan kekeringan",
  //       "Meningkatkan pembentukan gula dan pati",
  //       "Meningkatkan ketahanan hasil panen selama pengangkutan dan penyimpanan"
  //     ],
  //     "gejalaKekurangan": ["Daun Pucat diujung daun", "Daun mudah gugur"],
  //   },
  //   "bundle": {"Paket bundle": []},
  //   "countdownku": "00:00:00",
  //   "diskon": 0,
  //   "kategoriProduk": 0,
  //   "id_MenuRawatan": "3",
  //   "linkSp":"","harga": "0"
  // },
  {
    "id": 999,
    "idPerusahaan": 999,
    "nama": "Kieserit",
    "kandungan": 0,
    "bentuk": "granul",
    "title": "Kieserit",
    "color": ["917735", "011d0d", "034f23"],
    "penjelas": "Kiserit",
    "img": "assets/images/BGA.jpg",
    "brosure": [],
    "informasi": {
      "spesifikasi": ["Kiserit"],
      "sifat": ["Kiserit"],
      "manfaat": ["Kiserit"],
      "gejalaKekurangan": [],
    },
    "bundle": {"Paket bundle": []},
    "countdownku": "00:00:00",
    "diskon": 0,
    "kategoriProduk": 0,
    "id_MenuRawatan": "1",
    "linkSp": "",
    "harga": "0"
  },
];

class DataProducts {
  int id;
  int idPerusahaan;
  String nama;
  String bentuk;
  int kandungan;
  String title;
  List color;
  String penjelas;
  String img;
  List brosure;
  String countdownku;
  Map<String, dynamic> informasi;
  int kategoriProduk;
  int quantity;
  String id_MenuRawatan;
  String harga;
  Map<String, dynamic> bundle;
  int diskon;
  String linkSp;

  DataProducts({
    required this.id,
    required this.idPerusahaan,
    required this.nama,
    required this.bentuk,
    required this.kandungan,
    required this.title,
    required this.color,
    required this.penjelas,
    required this.img,
    required this.brosure,
    required this.informasi,
    required this.kategoriProduk,
    required this.quantity,
    required this.id_MenuRawatan,
    required this.harga,
    required this.bundle,
    required this.diskon,
    required this.countdownku,
    required this.linkSp,
  });

  static Map<String, dynamic> toMap(DataProducts dataProducts) => {
        'id': dataProducts.id,
        'idPerusahaan': dataProducts.idPerusahaan,
        'nama': dataProducts.nama,
        'bentuk': dataProducts.bentuk,
        'kandungan': dataProducts.kandungan,
        'title': dataProducts.title,
        'color': dataProducts.color,
        'penjelas': dataProducts.penjelas,
        'img': dataProducts.img,
        'brosure': dataProducts.brosure,
        'informasi': dataProducts.informasi,
        'kategoriProduk': dataProducts.kategoriProduk,
        'quantity': dataProducts.quantity,
        'id_MenuRawatan': dataProducts.id_MenuRawatan,
        'harga': dataProducts.harga,
        'bundle': dataProducts.bundle,
        'diskon': dataProducts.diskon,
        'countdownku': dataProducts.countdownku,
        "linkSp": dataProducts.linkSp
      };

  DataProducts.fromJson(Map json)
      : id = json["id"],
        idPerusahaan = json["idPerusahaan"],
        nama = json["nama"],
        bentuk = json["bentuk"],
        kandungan = json["kandungan"],
        title = json["title"],
        color = json["color"],
        penjelas = json["penjelas"],
        img = json["img"],
        brosure = json["brosure"],
        informasi = json["informasi"],
        kategoriProduk = json["kategoriProduk"],
        quantity = json["quantity"],
        id_MenuRawatan = json["id_MenuRawatan"],
        harga = json["harga"],
        bundle = json["bundle"],
        diskon = json["diskon"],
        countdownku = json["countdownku"],
        linkSp = json["linkSp"];

  static String encode(List<DataProducts> dataProductss) => json.encode(
        dataProductss
            .map<Map<String, dynamic>>(
                (dataProducts) => DataProducts.toMap(dataProducts))
            .toList(),
      );

  static List<DataProducts> decode(String dataProductss) =>
      (json.decode(dataProductss) as List<dynamic>)
          .map<DataProducts>((item) => DataProducts.fromJson(item))
          .toList();

  static List<DataProducts> decodew(List<dynamic> listData) {
    return (listData).map<DataProducts>((item) {
      // print(item["id_MenuRawatan"].runtimeType);
      return DataProducts.fromJson(item);
    }).toList();
  }
}

List<DataProducts> dataProductsObj = [
  for (var i = 0; i < dataProducts.length; i++)
    DataProducts(
        id: dataProducts[i]["id"],
        idPerusahaan: dataProducts[i]["idPerusahaan"],
        nama: dataProducts[i]["nama"],
        bentuk: dataProducts[i]["bentuk"],
        kandungan: dataProducts[i]["kandungan"],
        title: dataProducts[i]["title"],
        color: dataProducts[i]["color"],
        penjelas: dataProducts[i]["penjelas"],
        img: dataProducts[i]["img"],
        brosure: dataProducts[i]["brosure"],
        informasi: dataProducts[i]["informasi"],
        kategoriProduk: dataProducts[i]["kategoriProduk"],
        quantity: 0,
        id_MenuRawatan: dataProducts[i]["id_MenuRawatan"],
        harga: dataProducts[i]["harga"],
        bundle: dataProducts[i]["bundle"],
        diskon: dataProducts[i]["diskon"],
        countdownku: dataProducts[i]["countdownku"],
        linkSp: dataProducts[i]["linkSp"])
];
// List<DataProducts> dataProductsObjOnLine = [
//   for (var i = 0; i < dataProducts.length; i++)
//     DataProducts(
//         id: i,
//         idPerusahaan: dataProducts[i]["idPerusahaan"],
//         nama: dataProducts[i]["nama"],
//         bentuk : dataProducts[i]["bentuk"],
//         kandungan: dataProducts[i]["kandungan"],
//         title: dataProducts[i]["title"],
//         color: dataProducts[i]["color"],
//         penjelas: dataProducts[i]["penjelas"],
//         img: dataProducts[i]["img"],
//         brosure: dataProducts[i]["brosure"],
//         informasi: dataProducts[i]["informasi"],
//         kategoriProduk: dataProducts[i]["kategoriProduk"],
//         quantity: 0, id_MenuRawatan: dataProducts[i]["id_MenuRawatan"],harga: dataProducts[i]["harga"], bundle :dataProducts[i]["bundle"]
//         ,diskon: dataProducts[i]["diskon"],
//         countdownku:dataProducts[i]["countdownku"]
//     )
// ];
