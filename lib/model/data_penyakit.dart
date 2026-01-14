Map<String, dynamic> filterData(int idMenu, List dataPenyakit, String tipe) {
  Map<String, dynamic> resultaa = {};

 List s= dataPenyakit.where((element) => element['idmenu'] == idMenu).toList();
  for (Map entry in s) {
    resultaa[entry.keys.first] = entry.values.first;
  }
  Map<String, dynamic> resulthasil = resultaa;
  // print(" ssdssa  ${resultaa}  - Lele ${resultaa["Lele"]}");
  // for (var entry in dataPenyakit) {
  //   // Cek apakah entry memiliki 'idmenu'
  //   if (entry.containsKey('idmenu') && entry['idmenu'] == idMenu) {
  //     // Ambil data penyakit di dalam sub-map
  //     var penyakitData = entry[tipe];
  //     // print("${penyakitData} ssdssa ${entry}");
  //     // Tambahkan data penyakit ke result
  //     result.addAll({tipe:penyakitData});
  //   }
  // }

  return resultaa;
}

List dataPenyakit =[
  {'Ayam':{
    'CRD (Chronic Respiratory Disease)': {
      'gejala': [
        'kesulitan bernapas',
        'mukus berlebih di hidung',
        'batuk',
        'bersin',
        'penurunan nafsu makan',
        'depresi',
        'penurunan berat badan'
      ],
      'penyebab': 'Mycoplasma gallisepticum',
      'pengobatan': [
        'Penggunaan antibiotik yang efektif seperti Tylosin, Tiamulin, atau Doxycycline',
        'Pemberian vitamin dan mineral untuk meningkatkan daya tahan tubuh',
        'Terapi suportif untuk mengurangi gejala klinis'
      ],
      'pencegahan': [
        'Penerapan biosekuriti yang ketat',
        'Menghindari kepadatan yang berlebihan dalam kandang',
        'Menjaga kebersihan kandang dan lingkungan sekitar',
        'Vaksinasi dengan vaksin yang tepat'
      ],
      'nama_ilmiah': 'Mycoplasmosis',
      'faktor_pemicu': [
        'Stres',
        'Kepadatan kandang yang tinggi',
        'Ventilasi buruk',
        'Infeksi sekunder (virus atau bakteri lain)'
      ],
      'prognosis': 'Bervariasi, dapat kronis jika tidak ditangani dengan tepat',
      'dampak_ekonomi': [
        'Penurunan produksi telur',
        'Penurunan konversi pakan',
        'Peningkatan biaya pengobatan'
      ],
      'metode_diagnosis': [
        'Gejala klinis',
        'Kultur bakteri',
        'Serologi (ELISA, Rapid Plate Agglutination)',
        'PCR'
      ],
      'gambar': 'assets/images/MenuRawatan/RawatTanam/ayam_CRD (Chronic Respiratory Disease).jpg',
      'sumber': 'Journal of Veterinary Medicine, 2023'
    },
    'Gumboro': {
      'gejala': [
        'pembesaran dan peradangan bursa Fabrisius',
        'penurunan berat badan',
        'penurunan imunitas',
        'penurunan nafsu makan',
        'depresi',
        'bulu kusam dan berdiri',
        'diare berwarna putih hingga kekuningan',
        'pembengkakan bursa Fabrisius',
        'kematian mendadak pada ayam muda'
      ],
      'penyebab': 'Virus Infectious Bursal Disease (IBD)',
      'pengobatan': [
        'Tidak ada pengobatan spesifik untuk Gumboro, namun pemberian multivitamin dapat membantu mengurangi stres dan meningkatkan daya tahan tubuh ayam',
        'Terapi suportif untuk membantu mengurangi gejala'
      ],
      'pencegahan': [
        'Vaksinasi tepat waktu dengan vaksin Gumboro',
        'Penerapan biosekuriti yang ketat',
        'Pemisahan ayam berdasarkan umur untuk mengurangi risiko penularan',
        'Pengelolaan kandang yang baik untuk menghindari stres pada ayam'
      ],
      'nama_ilmiah': 'Infectious Bursal Disease (IBD)',
      'faktor_pemicu': [
        'Sistem kekebalan yang belum matang',
        'Stres lingkungan',
        'Vaksinasi yang tidak tepat'
      ],
      'prognosis': 'Buruk jika tidak ditangani sejak dini, dapat menyebabkan kematian tinggi',
      'dampak_ekonomi': [
        'Kematian tinggi pada ayam muda',
        'Imunosupresi yang menyebabkan kerentanan terhadap penyakit lain',
        'Penurunan performa produksi jangka panjang'
      ],
      'metode_diagnosis': [
        'Nekropsi (pemeriksaan bursa Fabricius)',
        'ELISA',
        'PCR',
        'Histopatologi'
      ],
      'gambar': 'assets/images/MenuRawatan/RawatTanam/ayam_Gumboro.jpg',
      'sumber': 'World Organisation for Animal Health (OIE), 2022'
    },
    'Coryza': {
      'gejala': [
        'pembengkakan pada wajah terutama di sekitar mata',
        'keluar cairan dari hidung yang berbau busuk',
        'bersin',
        'kesulitan bernapas',
        'penurunan produksi telur',
        'depresi',
        'pilek',
        'mata berair',
        'penurunan nafsu makan'
      ],
      'penyebab': 'Bakteri Haemophilus paragallinarum',
      'pengobatan': [
        'Penggunaan antibiotik seperti Erythromycin, Tetracycline, atau sulfonamides',
        'Pemberian multivitamin untuk mempercepat pemulihan dan terapi suportif',
        'Desinfeksi kandang secara rutin'
      ],
      'pencegahan': [
        'Vaksinasi terhadap Coryza',
        'Biosekuriti yang ketat untuk mencegah penyebaran bakteri',
        'Pemisahan unggas yang terinfeksi dari yang sehat',
        'Sanitasi yang baik di kandang dan area sekitarnya'
      ],
      'nama_ilmiah': 'Infectious Coryza',
      'faktor_pemicu': [
        'Stres',
        'Perubahan cuaca',
        'Sistem kekebalan yang lemah'
      ],
      'prognosis': 'Baik jika ditangani dengan cepat, namun dapat menjadi kronis',
      'dampak_ekonomi': [
        'Penurunan produksi telur',
        'Penurunan kualitas karkas',
        'Peningkatan biaya pengobatan'
      ],
      'metode_diagnosis': [
        'Gejala klinis',
        'Isolasi dan identifikasi bakteri',
        'PCR'
      ],
      'gambar': 'assets/images/MenuRawatan/RawatTanam/ayam_Coryza.jpg',
      'sumber': 'Avian Pathology Journal, 2023'
    },
    'Fowl Cholera': {
      'gejala': [
        'gangguan pernapasan',
        'kebengkakan pada area kepala (kalkun)',
        'mata berair',
        'bersin-bersin',
        'depresi',
        'leleran mukus dari mulut',
        'bulu kusam dan berdiri',
        'peningkatan frekuensi pernapasan',
        'diare',
        'lendir pada trakea (itik)',
        'ayam bernapas dengan memanjangkan leher',
        'leleran keluar dari hidung'
      ],
      'penyebab': 'Bakteri Pasteurella multocida',
      'pengobatan': [
        'Seleksi dan culling pada unggas yang terinfeksi parah',
        'Desinfeksi kandang secara rutin',
        'Pengobatan dengan antibiotik yang efektif terhadap bakteri Gram negatif seperti sulfa, amoxicillin, dan tetracyclines',
        'Pemberian terapi suportif seperti multivitamin',
        'Pengobatan hepatoprotektor untuk kerusakan hati',
        'Gunakan produk sesuai anjuran seperti Neo Meditril atau Rofotyl untuk hasil optimal',
        'Untuk pengobatan cepat, bisa menggunakan antibiotik injeksi seperti Gentamin, Tinolin injeksi, atau Lincomed-LA',
        'Penggunaan dosis berdasarkan berat badan ayam dan aplikasi yang sesuai dengan anjuran produsen'
      ],
      'pencegahan': [
        'Menghilangkan sumber infeksi bakteri P. multocida dan vektornya',
        'Manajemen pemeliharaan yang baik',
        'Biosekuriti yang ketat',
        'Pemisahan kandang berdasarkan jenis unggas',
        'Pembersihan dan desinfeksi kandang secara rutin',
        'Pembasmian vektor penyakit seperti lalat dan tikus',
        'Pemberian multivitamin dan obat herbal peningkat sistem imun',
        'Vaksinasi menggunakan Medivac Fowl Cholera',
        'Penggunaan obat herbal seperti Fithera sebagai alternatif pengobatan',
        'Lakukan rolling antimikroba secara periodik setiap 3-4 kali periode pengobatan untuk mencegah resistensi antimikroba',
        'Uji resistensi antimikroba atau Antimicrobial Susceptibility Test secara berkala untuk memastikan efektivitas obat yang digunakan'
      ],
      'nama_ilmiah': 'Pasteurellosis',
      'faktor_pemicu': [
        'Stres',
        'Kondisi sanitasi yang buruk',
        'Infeksi sekunder'
      ],
      'prognosis': 'Bervariasi, dapat akut hingga kronis',
      'dampak_ekonomi': [
        'Kematian tinggi pada kasus akut',
        'Penurunan produksi telur dan daging',
        'Peningkatan biaya pengobatan'
      ],
      'metode_diagnosis': [
        'Gejala klinis',
        'Nekropsi',
        'Kultur bakteri dan uji biokimia',
        'PCR'
      ],
      'gambar': 'assets/images/MenuRawatan/RawatTanam/ayam_Fowl Cholera.jpg',
      'sumber': 'Poultry Science Journal, 2024'
    },
    'Koksidiosis': {
      'gejala': [
        'diare yang sering dan berat',
        'kotoran berwarna merah atau hitam',
        'depresi',
        'penurunan nafsu makan',
        'penurunan berat badan',
        'kelemahan',
        'penurunan produksi telur',
        'kematian mendadak pada kasus berat',
        'kelainan pada usus'
      ],
      'penyebab': 'Protozoa Eimeria spp.',
      'pengobatan': [
        'Pemberian coccidiostats atau coccidiocides seperti Amprolium, Sulfaquinoxaline, atau Toltrazuril',
        'Pemberian suplemen vitamin dan mineral untuk meningkatkan daya tahan tubuh',
        'Desinfeksi kandang dan lingkungan',
        'Pemisahan unggas yang terinfeksi'
      ],
      'pencegahan': [
        'Penggunaan vaksin koksidiosis',
        'Penerapan biosekuriti yang ketat',
        'Sanitasi dan pembersihan kandang secara rutin',
        'Menjaga kepadatan populasi ayam',
        'Penggunaan pakan yang berkualitas dan tidak terkontaminasi'
      ],
      'nama_ilmiah': 'Coccidiosis',
      'faktor_pemicu': [
        'Kepadatan tinggi dalam kandang',
        'Sanitasi yang buruk',
        'Kondisi lingkungan yang lembab'
      ],
      'prognosis': 'Baik jika ditangani dengan cepat, namun dapat menyebabkan kematian jika tidak diobati',
      'dampak_ekonomi': [
        'Penurunan berat badan dan produksi telur',
        'Peningkatan biaya pakan dan pengobatan',
        'Kematian unggas yang tinggi'
      ],
      'metode_diagnosis': [
        'Gejala klinis',
        'Nekropsi dan pemeriksaan kotoran',
        'Identifikasi oocyst pada kotoran',
        'PCR'
      ],
      'gambar': 'assets/images/MenuRawatan/RawatTanam/ayam_Koksidiosis.jpg',
      'sumber': 'Poultry Veterinary Journal, 2023'
    },
    'Leucocytozoonosis (Malaria Like)': {
      'gejala': [
        'kelemahan',
        'penurunan nafsu makan',
        'penurunan berat badan',
        'demam',
        'pucat',
        'perubahan warna pada kaki dan paruh',
        'pembesaran hati dan limpa',
        'pembengkakan pada bagian tubuh'
      ],
      'penyebab': 'Protozoa Leucocytozoon spp.',
      'pengobatan': [
        'Pemberian obat anti-protozoa seperti Chloroquine atau Primaquine',
        'Terapi suportif dengan vitamin dan mineral',
        'Pengobatan dengan antibiotik untuk infeksi sekunder'
      ],
      'pencegahan': [
        'Pengendalian vektor seperti nyamuk dan lalat',
        'Sanitasi lingkungan kandang',
        'Penerapan biosekuriti yang ketat'
      ],
      'nama_ilmiah': 'Leucocytozoonosis',
      'faktor_pemicu': [
        'Kehadiran vektor penyakit',
        'Sanitasi yang buruk',
        'Kepadatan tinggi dalam kandang'
      ],
      'prognosis': 'Baik jika ditangani dengan cepat, dapat menyebabkan kematian jika tidak diobati',
      'dampak_ekonomi': [
        'Penurunan produksi telur',
        'Peningkatan biaya pengobatan',
        'Kematian unggas'
      ],
      'metode_diagnosis': [
        'Gejala klinis',
        'Nekropsi dan pemeriksaan darah',
        'Identifikasi protozoa dalam darah',
        'PCR'
      ],
      'gambar': 'assets/images/MenuRawatan/RawatTanam/ayam_Leucocytozoonosis (Malaria Like).jpg',
      'sumber': 'Journal of Avian Medicine and Surgery, 2023'
    },
    'Ascariasis': {
      'gejala': [
        'penurunan berat badan',
        'diare',
        'batuk',
        'depresi',
        'penurunan nafsu makan',
        'kelemahan',
        'gangguan pernapasan',
        'penurunan produksi telur'
      ],
      'penyebab': 'Cacing Ascaridia galli',
      'pengobatan': [
        'Pemberian anthelmintik seperti Piperazine, Albendazole, atau Ivermectin',
        'Sanitasi dan pembersihan kandang secara rutin',
        'Pemberian suplemen vitamin dan mineral untuk meningkatkan daya tahan tubuh'
      ],
      'pencegahan': [
        'Pengendalian cacing dengan obat cacing secara rutin',
        'Penerapan biosekuriti',
        'Sanitasi kandang',
        'Pemberian pakan yang bersih dan tidak terkontaminasi'
      ],
      'nama_ilmiah': 'Ascariasis',
      'faktor_pemicu': [
        'Sanitasi yang buruk',
        'Kepadatan tinggi dalam kandang',
        'Pakan yang terkontaminasi'
      ],
      'prognosis': 'Baik jika diobati dengan benar, dapat menyebabkan masalah serius jika tidak ditangani',
      'dampak_ekonomi': [
        'Penurunan berat badan',
        'Penurunan produksi telur',
        'Peningkatan biaya pengobatan'
      ],
      'metode_diagnosis': [
        'Gejala klinis',
        'Pemeriksaan kotoran',
        'Identifikasi telur cacing dalam kotoran',
        'PCR'
      ],
      'gambar': 'assets/images/MenuRawatan/RawatTanam/ayam_Ascariasis.jpg',
      'sumber': 'Veterinary Parasitology Journal, 2023'
    },
    'Ektoparasit': {
      'gejala': [
        'gatal-gatal pada kulit',
        'perubahan bulu',
        'penurunan produksi telur',
        'depresi',
        'infeksi sekunder pada kulit',
        'kotoran atau debu parasit terlihat di bulu',
        'penurunan berat badan'
      ],
      'penyebab': 'Parasit eksternal seperti kutu, tungau, dan lalat',
      'pengobatan': [
        'Pemberian obat antiparasit seperti Ivermectin atau Permethrin',
        'Sanitasi dan pembersihan lingkungan kandang',
        'Penerapan pest control untuk menghilangkan vektor'
      ],
      'pencegahan': [
        'Penerapan biosekuriti',
        'Sanitasi dan pembersihan rutin kandang',
        'Penggunaan produk antiparasit secara berkala',
        'Pengendalian vektor seperti lalat dan kutu'
      ],
      'nama_ilmiah': 'Ectoparasitosis',
      'faktor_pemicu': [
        'Sanitasi buruk',
        'Kepadatan tinggi dalam kandang',
        'Kurangnya pengendalian vektor'
      ],
      'prognosis': 'Baik jika diobati dengan benar, dapat menyebabkan infeksi sekunder jika tidak diobati',
      'dampak_ekonomi': [
        'Penurunan produksi telur',
        'Penurunan kualitas daging',
        'Peningkatan biaya pengobatan'
      ],
      'metode_diagnosis': [
        'Gejala klinis',
        'Pemeriksaan kulit dan bulu',
        'Identifikasi parasit secara langsung',
        'PCR'
      ],
      'gambar': 'assets/images/MenuRawatan/RawatTanam/ayam_Ektoparasit.jpg',
      'sumber': 'Journal of Parasitology Research, 2023'
    },
    'Avian Influenza': {
      'gejala': [
        'demam tinggi',
        'batuk',
        'sesak napas',
        'pembengkakan kepala dan leher',
        'mata berair',
        'penurunan produksi telur',
        'diare',
        'depresi',
        'kematian mendadak'
      ],
      'penyebab': 'Virus Avian Influenza (AIV)',
      'pengobatan': [
        'Tidak ada pengobatan spesifik, terapi suportif seperti vitamin dan mineral',
        'Pemberian antivirus dalam kasus tertentu seperti Oseltamivir',
        'Desinfeksi kandang dan lingkungan'
      ],
      'pencegahan': [
        'Vaksinasi terhadap Avian Influenza',
        'Penerapan biosekuriti yang ketat',
        'Sanitasi lingkungan secara rutin',
        'Pemisahan unggas berdasarkan umur dan sumber'
      ],
      'nama_ilmiah': 'Influenza A Virus Subtype H5N1',
      'faktor_pemicu': [
        'Penyebaran oleh vektor seperti burung liar',
        'Sanitasi yang buruk',
        'Kepadatan tinggi dalam kandang'
      ],
      'prognosis': 'Bervariasi, dapat akut hingga kronis, dengan potensi wabah besar',
      'dampak_ekonomi': [
        'Kematian tinggi pada unggas',
        'Penurunan produksi telur dan daging',
        'Peningkatan biaya pengobatan dan biosekuriti'
      ],
      'metode_diagnosis': [
        'Gejala klinis',
        'Nekropsi dan pemeriksaan histopatologi',
        'Identifikasi virus melalui PCR',
        'ELISA'
      ],
      'gambar': 'assets/images/MenuRawatan/RawatTanam/ayam_Avian Influenza.jpg',
      'sumber': 'Journal of Avian Diseases, 2024'
    },
    'Newcastle Disease (ND)': {
      'gejala': [
        'kesulitan bernapas',
        'penurunan produksi telur',
        'gangguan saraf',
        'kematian mendadak',
        'gejala pencernaan seperti diare'
      ],
      'penyebab': 'Virus Newcastle Disease (ND) Genotipe VII',
      'pengobatan': [
        'Pengobatan suportif dan terapi',
        'Pemberian antibiotik untuk infeksi sekunder'
      ],
      'pencegahan': [
        'Vaksinasi secara rutin dengan vaksin ND yang efektif',
        'Penerapan biosekuriti dan desinfeksi lingkungan kandang',
        'Pengawasan dan monitoring kesehatan ayam secara berkala'
      ],
      'nama_ilmiah': 'Avian Paramyxovirus-1 infection',
      'faktor_pemicu': [
        'Vaksinasi yang tidak tepat',
        'Biosekuriti yang buruk',
        'Stres'
      ],
      'prognosis': 'Bervariasi tergantung pada strain virus, dapat sangat fatal',
      'dampak_ekonomi': [
        'Kematian tinggi',
        'Penurunan produksi telur',
        'Pembatasan perdagangan'
      ],
      'metode_diagnosis': [
        'RT-PCR',
        'Isolasi virus',
        'Serologi (HI test, ELISA)'
      ],
      'gambar': 'assets/images/MenuRawatan/RawatTanam/ayam_Newcastle Disease (ND).jpg',
      'sumber': 'Avian Pathology Journal, 2024'
    },
    'Mareks Disease': {
      'gejala': [
        'Kelumpuhan pada sayap dan kaki',
        'Kehilangan berat badan',
        'Kebutaan',
        'Kulit yang tidak normal',
        'Tumor pada organ internal'
      ],
      'penyebab': 'Virus Marek\'s Disease (MDV)',
      'pengobatan': [
        'Tidak ada pengobatan spesifik',
        'Ayam yang terinfeksi harus dipisahkan atau dimusnahkan'
      ],
      'pencegahan': [
        'Vaksinasi pada usia satu hari',
        'Pembersihan dan desinfeksi kandang secara menyeluruh',
        'Breeding untuk ketahanan genetik'
      ],
      'nama_ilmiah': 'Marek\'s Disease',
      'faktor_pemicu': [
        'Stres',
        'Imunosupresi',
        'Kepadatan kandang yang tinggi'
      ],
      'prognosis': 'Buruk, seringkali fatal',
      'dampak_ekonomi': [
        'Penurunan produksi telur',
        'Peningkatan angka kematian',
        'Biaya vaksinasi'
      ],
      'metode_diagnosis': [
        'Gejala klinis',
        'Nekropsi',
        'Histopatologi',
        'PCR'
      ],
      'gambar': 'assets/images/MenuRawatan/RawatTanam/ayam_Mareks Disease.jpg',
      'sumber': 'Journal of Avian Pathology, 2024'
    },
    'Infectious Bronchitis': {
      'gejala': [
        'Batuk',
        'Bersin',
        'Ngorok',
        'Penurunan produksi telur',
        'Kualitas telur yang buruk (cangkang tipis atau lunak)'
      ],
      'penyebab': 'Virus Infectious Bronchitis (IBV)',
      'pengobatan': [
        'Tidak ada pengobatan spesifik',
        'Terapi suportif seperti pemberian vitamin dan elektrolit',
        'Antibiotik untuk mencegah infeksi sekunder'
      ],
      'pencegahan': [
        'Vaksinasi rutin',
        'Biosekuriti yang ketat',
        'Manajemen kandang yang baik'
      ],
      'nama_ilmiah': 'Infectious Bronchitis',
      'faktor_pemicu': [
        'Stres',
        'Ventilasi yang buruk',
        'Kepadatan kandang yang tinggi'
      ],
      'prognosis': 'Bervariasi, tergantung pada strain virus dan kondisi ayam',
      'dampak_ekonomi': [
        'Penurunan produksi telur',
        'Penurunan kualitas telur',
        'Peningkatan biaya pengobatan'
      ],
      'metode_diagnosis': [
        'Gejala klinis',
        'Serologi (ELISA)',
        'RT-PCR',
        'Isolasi virus'
      ],
      'gambar': 'assets/images/MenuRawatan/RawatTanam/ayam_Infectious Bronchitis.jpg',
      'sumber': 'World Organisation for Animal Health (OIE), 2024'
    },
    'Salmonellosis': {
      'gejala': [
        'Diare',
        'Lesu',
        'Penurunan nafsu makan',
        'Peningkatan konsumsi air',
        'Penurunan produksi telur'
      ],
      'penyebab': 'Bakteri Salmonella sp. (terutama S. enteritidis dan S. typhimurium)',
      'pengobatan': [
        'Antibiotik sesuai dengan uji sensitivitas',
        'Terapi suportif',
        'Pemberian probiotik'
      ],
      'pencegahan': [
        'Biosekuriti yang ketat',
        'Sanitasi yang baik',
        'Vaksinasi',
        'Penggunaan pakan bebas Salmonella'
      ],
      'nama_ilmiah': 'Salmonellosis',
      'faktor_pemicu': [
        'Sanitasi yang buruk',
        'Kontaminasi pakan atau air',
        'Stres'
      ],
      'prognosis': 'Bervariasi, dapat menjadi kronis pada ayam dewasa',
      'dampak_ekonomi': [
        'Penurunan produksi telur',
        'Peningkatan angka kematian pada anak ayam',
        'Biaya pengobatan dan kontrol'
      ],
      'metode_diagnosis': [
        'Kultur bakteri',
        'PCR',
        'Serologi (ELISA)',
        'Nekropsi'
      ],
      'gambar': '',
      'sumber': 'Poultry Disease Manual, 2023'
    },
    'Egg Drop Syndrome': {
      'gejala': [
        'Penurunan produksi telur yang tiba-tiba',
        'Telur dengan cangkang lunak atau tipis',
        'Telur tanpa cangkang',
        'Perubahan warna cangkang telur'
      ],
      'penyebab': 'Virus Egg Drop Syndrome (EDS)',
      'pengobatan': [
        'Tidak ada pengobatan spesifik',
        'Manajemen untuk mengurangi stres',
        'Suplementasi kalsium'
      ],
      'pencegahan': [
        'Vaksinasi',
        'Biosekuriti yang ketat',
        'Pemisahan unggas liar dari peternakan'
      ],
      'nama_ilmiah': 'Egg Drop Syndrome 1976',
      'faktor_pemicu': [
        'Stres',
        'Infeksi pada saat produksi telur tinggi',
        'Imunosupresi'
      ],
      'prognosis': 'Baik untuk kesehatan ayam, namun produksi telur mungkin tidak pulih sepenuhnya',
      'dampak_ekonomi': [
        'Penurunan signifikan dalam produksi telur',
        'Penurunan kualitas telur',
        'Biaya vaksinasi'
      ],
      'metode_diagnosis': [
        'Gejala klinis',
        'Serologi (HI test)',
        'PCR',
        'ELISA'
      ],
      'gambar': 'assets/images/MenuRawatan/RawatTanam/ayam_Egg Drop Syndrome.jpg',
      'sumber': 'Avian Diseases, 2024'
    }
  },
    'idmenu':5,
  },
  {'Lele': {
    "Bintik Putih (White Spot Disease)": {
      "nama_ilmiah": "Ichthyophthirius multifiliis",
      "gejala": [
        "bintik putih", "menggesek tubuh", "lendir berlebihan",
        "nafsu makan menurun", "berenang tidak normal", "insang pucat",
        "bintik putih 0.5-1 mm", "flashing", "produksi lendir berlebihan",
        "ikan lesu", "insang rusak", "kematian ikan"
      ],
      "penyebab": "Parasit protozoa Ichthyophthirius multifiliis",
      "faktor_pemicu": [
        "kualitas air buruk",
        "penyebaran dari ikan baru yang tidak dikarantina",
        "fluktuasi suhu air yang drastis",
      ],
      "pengobatan": [
        "Perendaman dalam larutan garam 2-3% selama 5-10 menit",
        "Perendaman dalam formalin 25-50 ppm selama 1 jam",
        "Penggunaan obat anti-parasit seperti malachite green 0.1 ppm",
        "Meningkatkan suhu air secara bertahap hingga 30°C",
      ],
      "pencegahan": [
        "Menjaga kualitas air dengan pergantian air rutin",
        "Karantina ikan baru selama minimal 2 minggu",
        "Sterilisasi peralatan seperti jaring dan ember",
        "Menghindari fluktuasi suhu air yang drastis",
        "Memberikan pakan berkualitas untuk meningkatkan sistem imun ikan",
      ],
      "prognosis": "Dapat menyebabkan kematian massal jika tidak ditangani segera",
      "dampak_ekonomi": "Kerugian besar karena mortalitas ikan tinggi",
      "metode_diagnosis": [
        "pemeriksaan gejala klinis",
        "mikroskopi untuk mengidentifikasi parasit",
      ],
      "gambar": "assets/images/MenuRawatan/RawatTanam/Lele_WhiteSpotDisease.jpg",
      "sumber": "Noga, E.J. (2010). Fish Disease: Diagnosis and Treatment, 2nd Edition. Wiley-Blackwell."
    },
    "Columnaris": {
      "nama_ilmiah": "Flavobacterium columnare",
      "gejala": [
        "lesi putih atau abu-abu di kulit", "sirip rusak", "insang pucat",
        "nafsu makan menurun", "berenang di permukaan", "lesi seperti pelana di punggung",
        "mulut berlendir", "insang membusuk", "ekor atau sirip membusuk",
      ],
      "penyebab": "Bakteri Flavobacterium columnare",
      "faktor_pemicu": [
        "kualitas air buruk",
        "kepadatan ikan tinggi",
        "stres pada ikan",
      ],
      "pengobatan": [
        "Antibiotik seperti oxytetracycline atau sulfadimethoxine-ormetoprim",
        "Perendaman dalam larutan garam 1-3% selama 30 menit",
        "Penggunaan vaksin untuk pencegahan",
        "Perbaikan kualitas air dan mengurangi kepadatan ikan",
      ],
      "pencegahan": [
        "Menjaga kualitas air yang baik",
        "Menghindari overpopulasi dalam kolam",
        "Mengurangi stres pada ikan",
        "Karantina ikan baru",
        "Pemberian pakan yang seimbang dan berkualitas",
      ],
      "prognosis": "Sering kali fatal jika tidak diobati",
      "dampak_ekonomi": "Kerugian besar karena mortalitas tinggi dan biaya pengobatan",
      "metode_diagnosis": [
        "pemeriksaan gejala klinis",
        "mikroskopi untuk mengidentifikasi bakteri",
      ],
      "gambar": "assets/images/MenuRawatan/RawatTanam/Lele_Columnaris.jpg",
      "sumber": "Declercq, A.M., et al. (2013). Columnaris disease in fish: a review with emphasis on bacterium-host interactions. Veterinary Research, 44(1), 27."
    },
    "Infeksi Aeromonas": {
      "nama_ilmiah": "Aeromonas hydrophila dan spesies Aeromonas lainnya",
      "gejala": [
        "borok pada kulit", "perut membengkak", "mata menonjol",
        "sisik berdiri", "pendarahan pada sirip dan insang", "kehilangan nafsu makan",
        "berenang tidak normal", "lesi merah pada kulit",
      ],
      "penyebab": "Bakteri Aeromonas hydrophila dan spesies Aeromonas lainnya",
      "faktor_pemicu": [
        "kualitas air buruk",
        "kepadatan ikan tinggi",
        "stres pada ikan",
      ],
      "pengobatan": [
        "Antibiotik seperti oxytetracycline atau florfenicol",
        "Perendaman dalam larutan garam 1-3% selama 30 menit",
        "Penggunaan probiotik untuk meningkatkan sistem imun",
        "Perbaikan kualitas air dan mengurangi kepadatan ikan",
      ],
      "pencegahan": [
        "Menjaga kebersihan kolam",
        "Menghindari fluktuasi suhu air",
        "Pemberian pakan berkualitas tinggi",
        "Mengurangi stres pada ikan",
        "Vaksinasi ikan",
      ],
      "prognosis": "Dapat menyebabkan kematian massal jika tidak ditangani",
      "dampak_ekonomi": "Kerugian besar karena penyebaran penyakit yang cepat",
      "metode_diagnosis": [
        "pemeriksaan gejala klinis",
        "kultur bakteri dan uji sensitivitas antibiotik",
      ],
      "gambar": "assets/images/MenuRawatan/RawatTanam/Lele_Aeromonas.jpg",
      "sumber": "Austin, B., & Austin, D.A. (2016). Bacterial Fish Pathogens: Disease of Farmed and Wild Fish. Springer."
    },
    "Enteric Septicemia of Catfish (ESC)": {
      "nama_ilmiah": "Edwardsiella ictaluri",
      "gejala": [
        "perut membengkak", "lesi merah di kulit", "pendarahan di organ dalam",
        "mata menonjol", "kehilangan nafsu makan", "berenang tidak normal",
        "lesi di hati dan ginjal", "cairan di rongga perut",
      ],
      "penyebab": "Bakteri Edwardsiella ictaluri",
      "faktor_pemicu": [
        "kualitas air buruk",
        "kepadatan ikan tinggi",
        "stres pada ikan",
      ],
      "pengobatan": [
        "Antibiotik seperti terramycin atau romet",
        "Peningkatan kualitas air",
        "Pemberian pakan yang mengandung antibiotik",
        "Isolasi ikan yang terinfeksi",
      ],
      "pencegahan": [
        "Vaksinasi ikan",
        "Menjaga kualitas air yang baik",
        "Menghindari stres pada ikan",
        "Pemberian pakan yang seimbang",
        "Karantina ikan baru",
      ],
      "prognosis": "Sering kali fatal jika tidak ditangani",
      "dampak_ekonomi": "Kerugian ekonomi besar karena penyebaran penyakit yang cepat",
      "metode_diagnosis": [
        "pemeriksaan gejala klinis",
        "kultur bakteri dan uji sensitivitas antibiotik",
      ],
      "gambar": "assets/images/MenuRawatan/RawatTanam/Lele_ESC.jpg",
      "sumber": "Wise, D.J., et al. (2004). Vaccination of channel catfish against Enteric Septicemia of Catfish (ESC) disease. Journal of the World Aquaculture Society, 35(2), 185-195."
    },
    "Channel Catfish Virus Disease (CCVD)": {
      "nama_ilmiah": "Channel Catfish Virus (CCV)",
      "gejala": [
        "pendarahan di dasar sirip", "perut membengkak", "eksoftalmus (mata menonjol)",
        "berenang tidak normal", "kehilangan keseimbangan", "pendarahan di organ dalam",
        "kematian massal pada ikan muda", "lesi di hati dan ginjal",
      ],
      "penyebab": "Channel Catfish Virus (CCV), anggota keluarga Herpesviridae",
      "faktor_pemicu": [
        "kepadatan ikan tinggi",
        "kualitas air buruk",
        "stres pada ikan",
      ],
      "pengobatan": [
        "Tidak ada pengobatan spesifik yang efektif",
        "Pengelolaan stres dan kualitas air",
        "Isolasi ikan yang terinfeksi",
        "Pemusnahan ikan yang terinfeksi parah untuk mencegah penyebaran",
      ],
      "pencegahan": [
        "Pemilihan induk yang tahan terhadap CCVD",
        "Menjaga kualitas air yang optimal",
        "Menghindari kepadatan ikan yang berlebihan",
        "Karantina ikan baru",
        "Sterilisasi peralatan dan fasilitas budidaya",
      ],
      "prognosis": "Dapat menyebabkan kematian massal terutama pada ikan muda",
      "dampak_ekonomi": "Kerugian besar karena kematian massal dan biaya kontrol penyakit",
      "metode_diagnosis": [
        "pemeriksaan gejala klinis",
        "uji PCR (Polymerase Chain Reaction)",
        "histopatologi",
      ],
      "gambar": "assets/images/MenuRawatan/RawatTanam/Lele_CCVD.jpg",
      "sumber": "Hanson, L.A., et al. (2011). The channel catfish virus (IcHV-1): a new look at an old nemesis. Viruses, 3(11), 2130-2159."
    },
    "Trichodiniasis": {
      "nama_ilmiah": "Trichodina spp.",
      "gejala": [
        "kulit berlendir berlebihan", "sisik terkelupas", "nafsu makan menurun",
        "berenang tidak normal", "flashing", "insang pucat",
        "lesi pada kulit", "pergerakan operkulum yang cepat",
      ],
      "penyebab": "Parasit protozoa dari genus Trichodina",
      "faktor_pemicu": [
        "kualitas air buruk",
        "kepadatan ikan tinggi",
        "stres pada ikan",
      ],
      "pengobatan": [
        "Perendaman dalam formalin 25 ppm selama 24 jam",
        "Penggunaan garam 2-3% selama 5-10 menit",
        "Penggunaan obat anti-parasit seperti praziquantel",
        "Peningkatan sirkulasi air dan oksigen terlarut",
      ],
      "pencegahan": [
        "Menjaga kualitas air yang baik",
        "Karantina ikan baru",
        "Sterilisasi peralatan dan fasilitas budidaya",
        "Pemberian pakan yang seimbang untuk meningkatkan sistem imun",
        "Menghindari kepadatan ikan yang berlebihan",
      ],
      "prognosis": "Dapat menyebabkan kerugian besar jika tidak ditangani",
      "dampak_ekonomi": "Kerugian besar karena penyebaran yang cepat",
      "metode_diagnosis": [
        "pemeriksaan gejala klinis",
        "mikroskopi untuk identifikasi parasit",
      ],
      "gambar": "assets/images/MenuRawatan/RawatTanam/Nila_Trichodiniasis.jpg",
      "sumber": "Martins, M.L., et al. (2015). Protozoan infections in farmed fish from Brazil: diagnosis and pathogenesis. Revista Brasileira de Parasitologia Veterinária, 24, 1-20."
    }
  },
   'idmenu':3
  },
  {
    'Nila': {
      "Streptococcosis": {
        "nama_ilmiah": "Streptococcus iniae, S. agalactiae",
        "gejala": [
          "berenang tidak beraturan",
          "kehilangan keseimbangan",
          "mata menonjol (exopthalmia)",
          "pendarahan pada mata",
          "pendarahan pada dasar sirip",
          "warna tubuh gelap",
          "luka pada kulit",
          "pembengkakan organ dalam",
          "nafsu makan menurun"
        ],
        "penyebab": "Bakteri Streptococcus iniae atau Streptococcus agalactiae",
        "faktor_pemicu": [
          "kualitas air buruk",
          "kepadatan ikan tinggi",
          "perubahan suhu air yang drastis",
          "penanganan ikan yang kasar",
          "pakan yang terkontaminasi"
        ],
        "pengobatan": [
          "pemberian antibiotik seperti erythromycin atau oxytetracycline melalui pakan",
          "perendaman dalam larutan antibiotik untuk infeksi ringan",
          "isolasi ikan yang terinfeksi",
          "peningkatan kualitas air"
        ],
        "pencegahan": [
          "menjaga kualitas air tetap optimal",
          "menghindari kepadatan ikan yang berlebihan",
          "vaksinasi ikan",
          "karantina ikan baru",
          "pemberian pakan berkualitas tinggi",
          "menghindari stres pada ikan"
        ],
        "prognosis": "Dapat menyebabkan kematian massal jika tidak ditangani dengan cepat",
        "dampak_ekonomi": "Kerugian ekonomi signifikan karena tingkat kematian tinggi dan biaya pengobatan",
        "metode_diagnosis": [
          "pemeriksaan gejala klinis",
          "isolasi dan identifikasi bakteri",
          "uji PCR (Polymerase Chain Reaction)",
          "histopatologi"
        ],
        "gambar": "assets/images/MenuRawatan/RawatTanam/Nila_Streptococcosis.jpg",
        "sumber": "Amal, M.N.A., et al. (2020). Streptococcosis in Tilapia (Oreochromis niloticus): A Review. Aquaculture Research, 51(6), 2375-2386."
      },
      "Tilapia Lake Virus (TiLV)": {
        "nama_ilmiah": "Tilapia Lake Virus",
        "gejala": [
          "mata cekung",
          "perubahan warna kulit",
          "lesi dan erosi pada kulit",
          "pendarahan pada organ dalam",
          "pembengkakan hati dan ginjal",
          "nafsu makan hilang",
          "berenang lambat di permukaan",
          "kematian massal"
        ],
        "penyebab": "Virus RNA dari genus Tilapinevirus",
        "faktor_pemicu": [
          "stres lingkungan",
          "perubahan suhu air",
          "transportasi ikan jarak jauh",
          "kepadatan ikan yang tinggi"
        ],
        "pengobatan": [
          "tidak ada pengobatan spesifik untuk infeksi virus",
          "pengobatan suportif untuk mencegah infeksi sekunder",
          "peningkatan kualitas air",
          "isolasi ikan yang terinfeksi"
        ],
        "pencegahan": [
          "implementasi biosecurity yang ketat",
          "karantina ikan baru",
          "penggunaan induk bebas TiLV",
          "vaksinasi (sedang dalam pengembangan)",
          "monitoring rutin kesehatan ikan"
        ],
        "prognosis": "Dapat menyebabkan kematian hingga 90% populasi dalam waktu singkat",
        "dampak_ekonomi": "Kerugian ekonomi sangat besar karena tingkat kematian yang tinggi dan tidak adanya pengobatan efektif",
        "metode_diagnosis": [
          "RT-PCR (Reverse Transcription Polymerase Chain Reaction)",
          "sekuensing gen",
          "histopatologi",
          "isolasi virus pada kultur sel"
        ],
        "gambar": "assets/images/MenuRawatan/RawatTanam/Nila_TiLV.jpg",
        "sumber": "Jansen, M.D., et al. (2018). Tilapia lake virus (TiLV): A threat to the global tilapia industry? Reviews in Aquaculture, 10(3), 725-739."
      },
      "Columnaris": {
        "nama_ilmiah": "Flavobacterium columnare",
        "gejala": [
          "lesi putih atau abu-abu pada kulit, sirip, atau insang",
          "erosi pada sirip",
          "nekrosis pada insang",
          "produksi lendir berlebihan",
          "pendarahan pada dasar sirip",
          "kehilangan nafsu makan",
          "berenang di permukaan air"
        ],
        "penyebab": "Bakteri Flavobacterium columnare",
        "faktor_pemicu": [
          "suhu air tinggi (di atas 25°C)",
          "kualitas air buruk",
          "kepadatan ikan tinggi",
          "penanganan kasar",
          "infeksi parasit"
        ],
        "pengobatan": [
          "perendaman dalam larutan garam 1-3% selama 1-2 menit",
          "penggunaan antibiotik seperti oxytetracycline atau florfenicol",
          "peningkatan sirkulasi air",
          "penambahan probiotik ke dalam air"
        ],
        "pencegahan": [
          "menjaga kualitas air optimal",
          "mengurangi kepadatan ikan",
          "menghindari fluktuasi suhu air",
          "pemberian pakan berkualitas tinggi",
          "disinfeksi peralatan budidaya secara rutin"
        ],
        "prognosis": "Dapat menyebabkan kematian cepat pada ikan muda, namun ikan dewasa memiliki ketahanan lebih baik",
        "dampak_ekonomi": "Kerugian ekonomi sedang hingga besar tergantung pada tingkat keparahan wabah",
        "metode_diagnosis": [
          "pemeriksaan mikroskopis lesi",
          "kultur bakteri dan identifikasi",
          "PCR untuk konfirmasi spesies bakteri",
          "histopatologi"
        ],
        "gambar": "assets/images/MenuRawatan/RawatTanam/Nila_Columnaris.jpg",
        "sumber": "Declercq, A.M., et al. (2013). Columnaris disease in fish: a review with emphasis on bacterium-host interactions. Veterinary Research, 44(1), 27."
      },
      "Saprolegniasis": {
        "nama_ilmiah": "Saprolegnia sp.",
        "gejala": [
          "pertumbuhan kapas putih pada kulit, sirip, atau insang",
          "erosi pada kulit dan sirip",
          "kehilangan nafsu makan",
          "letargi",
          "berenang tidak normal"
        ],
        "penyebab": "Jamur air Saprolegnia sp.",
        "faktor_pemicu": [
          "kualitas air buruk",
          "stres lingkungan",
          "luka fisik pada kulit",
          "infeksi bakteri atau parasit",
          "penurunan sistem imun"
        ],
        "pengobatan": [
          "perendaman dalam larutan garam 3% selama 10-30 menit",
          "penggunaan fungisida seperti malachite green (di negara yang mengizinkan)",
          "perendaman dalam larutan formalin 150-250 ppm selama 30-60 menit",
          "peningkatan suhu air secara bertahap",
        ],
        "pencegahan": [
          "menjaga kualitas air tetap baik",
          "mengurangi faktor stres",
          "pemberian pakan yang seimbang",
          "sterilisasi peralatan budidaya",
          "penanganan ikan dengan hati-hati untuk menghindari luka"
        ],
        "prognosis": "Dapat menyebabkan kematian jika tidak diobati, terutama pada telur dan ikan muda",
        "dampak_ekonomi": "Kerugian ekonomi sedang, terutama jika menyerang telur atau benih ikan",
        "metode_diagnosis": [
          "pemeriksaan visual pertumbuhan jamur",
          "pemeriksaan mikroskopis sampel",
          "kultur jamur pada media khusus",
          "PCR untuk identifikasi spesies"
        ],
        "gambar": "assets/images/MenuRawatan/RawatTanam/Nila_saprolegnia.jpg",
        "sumber": "van West, P. (2006). Saprolegnia parasitica, an oomycete pathogen with a fishy appetite: new challenges for an old problem. Mycologist, 20(3), 99-104."
      },
      "Trichodiniasis": {
        "nama_ilmiah": "Trichodina sp.",
        "gejala": [
          "produksi lendir berlebihan pada kulit dan insang",
          "perubahan warna kulit menjadi lebih gelap",
          "ikan menggesekkan tubuh pada benda di sekitarnya",
          "nafsu makan menurun",
          "berenang tidak beraturan",
          "insang pucat",
        ],
        "penyebab": "Protozoa parasit dari genus Trichodina",
        "faktor_pemicu": [
          "kualitas air buruk",
          "kepadatan ikan tinggi",
          "akumulasi bahan organik dalam air",
          "stres pada ikan",
          "sistem imun ikan yang lemah"
        ],
        "pengobatan": [
          "perendaman dalam larutan formalin 25 ppm selama 24 jam",
          "perendaman dalam larutan garam 2-3% selama 5-10 menit",
          "penggunaan praziquantel 2-10 mg/L selama 24 jam",
          "peningkatan aerasi air",
        ],
        "pencegahan": [
          "menjaga kualitas air tetap optimal",
          "mengurangi kepadatan ikan",
          "pembersihan rutin dasar kolam",
          "karantina ikan baru",
          "sterilisasi peralatan budidaya"
        ],
        "prognosis": "Umumnya tidak fatal pada ikan dewasa, namun dapat menyebabkan kematian pada benih ikan jika tidak diobati",
        "dampak_ekonomi": "Kerugian ekonomi sedang karena pertumbuhan ikan terhambat dan biaya pengobatan",
        "metode_diagnosis": [
          "pemeriksaan mikroskopis lendir kulit dan insang",
          "identifikasi morfologi parasit",
          "pewarnaan perak untuk detail struktur parasit",
          "PCR untuk identifikasi spesies"
        ],
        "gambar": "assets/images/MenuRawatan/RawatTanam/Nila_Trichodiniasis.jpg",
        "sumber": "Abdel-Baki, A.S., et al. (2018). Trichodina heterodentata (Ciliophora: Trichodinidae) from the Nile tilapia, Oreochromis niloticus, in the River Nile, Egypt. Parasitology Research, 117(9), 2749-2754."
      },
      "Gyrodactylosis": {
        "nama_ilmiah": "Gyrodactylus sp.",
        "gejala": [
          "ikan menggesekkan tubuh pada benda di sekitarnya",
          "produksi lendir berlebihan",
          "bintik-bintik merah pada kulit",
          "sirip rusak atau sobek",
          "nafsu makan menurun",
          "berenang tidak normal",
          "kematian pada infeksi berat"
        ],
        "penyebab": "Cacing monogenea dari genus Gyrodactylus",
        "faktor_pemicu": [
          "kualitas air buruk",
          "kepadatan ikan tinggi",
          "stres pada ikan",
          "introduksi ikan baru yang terinfeksi",
          "fluktuasi suhu air"
        ],
        "pengobatan": [
          "perendaman dalam formalin 250 ppm selama 30-60 menit",
          "penggunaan praziquantel 2-10 mg/L selama 24 jam",
          "perendaman dalam larutan garam 3% selama 5-10 menit",
          "penggunaan obat anthelmintik seperti levamisole",
        ],
        "pencegahan": [
          "karantina ikan baru",
          "menjaga kualitas air optimal",
          "mengurangi kepadatan ikan",
          "sterilisasi peralatan budidaya",
          "pemeriksaan rutin sampel ikan"
        ],
        "prognosis": "Dapat menyebabkan kematian massal pada benih ikan, namun ikan dewasa umumnya lebih tahan",
        "dampak_ekonomi": "Kerugian ekonomi sedang hingga besar, terutama pada pembenihan",
        "metode_diagnosis": [
          "pemeriksaan mikroskopis kulit dan sirip",
          "identifikasi morfologi parasit",
          "PCR untuk identifikasi spesies",
          "histopatologi",
        ],
        "gambar": "",
        "sumber": "García-Vásquez, A., et al. (2011). Gyrodactylus species (Monogenea) infecting the Nile tilapia Oreochromis niloticus in southern Mexico. Parasitology Research, 108(5), 1141-1147."
      }
    },
    'idmenu':3
  },{
  'Tanaman':{
    "Downy Mildew": {
      "gejala": [
        "Bercak kuning pada daun",
        "Daun menggulung",
        "Jamur berwarna keunguan di bawah daun",
        "Pertumbuhan tanaman terhambat"
      ],
      "penyebab": "Jamur Peronospora parasitica dan spesies lain dari genus Peronospora",
      "pengobatan": [
        "Penggunaan fungisida sistemik dan kontak sesuai anjuran",
        "Mengurangi kelembaban lingkungan",
        "Meningkatkan sirkulasi udara",
        "Pemangkasan bagian tanaman yang terinfeksi"
      ],
      "pencegahan": [
        "Menghindari penyiraman berlebihan",
        "Menjaga kebersihan lingkungan tanam",
        "Menanam varietas tahan penyakit",
        "Rotasi tanaman dengan spesies yang tidak rentan",
        "Pada hidroponik: menjaga sterilitas sistem dan nutrisi"
      ],
      "nama_ilmiah": "Peronospora spp.",
      "faktor_pemicu": [
        "Kelembaban tinggi",
        "Kondisi lingkungan lembab dan dingin",
        "Sirkulasi udara yang buruk",
        "Suhu antara 10-18°C"
      ],
      "prognosis": "Dapat menurunkan hasil panen secara signifikan jika tidak dikendalikan dengan cepat",
      "dampak_ekonomi": [
        "Penurunan hasil panen hingga 70% pada kasus parah",
        "Peningkatan biaya pengendalian penyakit",
        "Penurunan kualitas produk pertanian"
      ],
      "metode_diagnosis": [
        "Pengamatan visual gejala pada tanaman",
        "Kultur jamur untuk identifikasi lebih lanjut",
        "Analisis PCR untuk identifikasi spesies yang tepat"
      ],
      "gambar": "",
      "sumber": "Plant Disease Management, 2023"
    },
    "Penyakit Busuk Akar": {
      "gejala": [
        "Akar berubah warna menjadi coklat atau hitam",
        "Daun menguning dan layu",
        "Pertumbuhan tanaman terhambat",
        "Tanaman mudah dicabut karena akar rusak"
      ],
      "penyebab": "Jamur Phytophthora spp., Pythium spp., Rhizoctonia solani, dan Fusarium spp.",
      "pengobatan": [
        "Mengurangi kelembaban media tanam",
        "Penggunaan fungisida sistemik dan kontak sesuai anjuran",
        "Mengganti media tanam yang terkontaminasi",
        "Perbaikan drainase tanah",
        "Pada hidroponik: sterilisasi sistem dan penggantian larutan nutrisi"
      ],
      "pencegahan": [
        "Menggunakan media tanam yang steril",
        "Mengatur irigasi yang tepat",
        "Menjaga kebersihan sistem hidroponik",
        "Rotasi tanaman dengan spesies yang tahan",
        "Pada hidroponik: menjaga oksigenasi larutan nutrisi"
      ],
      "nama_ilmiah": "Phytophthora root rot, Pythium root rot, dll.",
      "faktor_pemicu": [
        "Kelembaban yang berlebihan",
        "Media tanam yang tidak steril",
        "Drainase yang buruk",
        "Suhu tanah yang optimal bagi patogen",
        "Pada hidroponik: kurangnya oksigen dalam larutan nutrisi"
      ],
      "prognosis": "Dapat menyebabkan kematian tanaman jika tidak diobati, terutama pada tanaman muda",
      "dampak_ekonomi": [
        "Kerugian hasil panen hingga 100% pada kasus parah",
        "Biaya penggantian tanaman yang mati",
        "Peningkatan biaya pengendalian dan pencegahan jangka panjang"
      ],
      "metode_diagnosis": [
        "Pengamatan visual akar dan daun",
        "Kultur jamur untuk identifikasi",
        "Analisis PCR untuk identifikasi spesies patogen yang spesifik"
      ],
      "gambar": "",
      "sumber": "Plant Pathology Handbook, 2023"
    },
    "Serangan Kutu Daun": {
      "gejala": [
        "Daun menggulung atau berkerut",
        "Pertumbuhan tanaman terhambat",
        "Daun menguning dan rontok",
        "Adanya embun madu pada daun"
      ],
      "penyebab": "Berbagai jenis kutu daun (Aphidoidea)",
      "pengobatan": [
        "Penggunaan insektisida sistemik atau kontak",
        "Penyemprotan dengan larutan sabun",
        "Pelepasan predator alami seperti kumbang koksi"
      ],
      "pencegahan": [
        "Menjaga kebersihan area tanam",
        "Penggunaan mulsa reflektif",
        "Menanam tanaman pengusir hama seperti bawang putih atau kemangi",
        "Pada hidroponik: penggunaan jaring serangga"
      ],
      "nama_ilmiah": "Aphidoidea spp.",
      "faktor_pemicu": [
        "Cuaca hangat dan lembab",
        "Tanaman stres karena kekurangan nutrisi",
        "Populasi predator alami yang rendah"
      ],
      "prognosis": "Dapat menyebabkan kerusakan serius pada tanaman dan penurunan hasil panen jika tidak dikendalikan",
      "dampak_ekonomi": [
        "Penurunan hasil panen hingga 40%",
        "Penurunan kualitas produk pertanian",
        "Biaya tambahan untuk pengendalian hama"
      ],
      "metode_diagnosis": [
        "Pengamatan visual pada daun dan batang",
        "Penggunaan sticky trap untuk monitoring populasi",
        "Analisis mikroskopis untuk identifikasi spesies"
      ],
      "gambar": "",
      "sumber": "Integrated Pest Management Guide, 2023"
    },
    "Serangan Ulat Grayak": {
      "gejala": [
        "Daun berlubang-lubang",
        "Kerusakan pada buah",
        "Adanya kotoran ulat di permukaan tanaman",
        "Pertumbuhan tanaman terhambat"
      ],
      "penyebab": "Ulat dari ngengat Spodoptera spp.",
      "pengobatan": [
        "Penyemprotan insektisida sesuai anjuran",
        "Penggunaan Bacillus thuringiensis (Bt)",
        "Pemangkasan dan pemusnahan bagian tanaman yang terserang parah"
      ],
      "pencegahan": [
        "Rotasi tanaman",
        "Pemasangan perangkap feromon",
        "Penanaman tanaman penghalang",
        "Menjaga kebersihan lahan"
      ],
      "nama_ilmiah": "Spodoptera spp.",
      "faktor_pemicu": [
        "Cuaca hangat dan lembab",
        "Tanaman inang yang berlimpah",
        "Kurangnya predator alami"
      ],
      "prognosis": "Dapat menyebabkan kerusakan berat pada tanaman dan penurunan hasil panen yang signifikan",
      "dampak_ekonomi": [
        "Penurunan hasil panen hingga 70% pada serangan berat",
        "Peningkatan biaya pengendalian hama",
        "Penurunan kualitas produk pertanian"
      ],
      "metode_diagnosis": [
        "Pengamatan visual gejala pada tanaman",
        "Identifikasi ulat dan ngengat dewasa",
        "Penggunaan perangkap feromon untuk monitoring populasi"
      ],
      "gambar": "",
      "sumber": "Integrated Pest Management Guide, 2023"
    },
    "Penyakit Busuk Batang": {
      "gejala": [
        "Batang membusuk dan berwarna coklat",
        "Daun layu dan menguning",
        "Tanaman roboh",
        "Pertumbuhan tanaman terhambat"
      ],
      "penyebab": "Jamur Sclerotium rolfsii",
      "pengobatan": [
        "Pemberian fungisida sistemik",
        "Pemangkasan bagian tanaman yang terinfeksi",
        "Perbaikan drainase tanah"
      ],
      "pencegahan": [
        "Rotasi tanaman dengan tanaman yang tidak rentan",
        "Penggunaan mulsa organik",
        "Menjaga kelembaban tanah yang optimal",
        "Sterilisasi tanah sebelum penanaman"
      ],
      "nama_ilmiah": "Sclerotium rolfsii",
      "faktor_pemicu": [
        "Kelembaban tanah yang tinggi",
        "Suhu tanah yang hangat (25-35°C)",
        "Tanah yang kurang drainase"
      ],
      "prognosis": "Dapat menyebabkan kematian tanaman jika tidak ditangani dengan cepat",
      "dampak_ekonomi": [
        "Penurunan hasil panen hingga 80% pada serangan berat",
        "Peningkatan biaya produksi untuk pengendalian penyakit",
        "Penurunan kualitas produk pertanian"
      ],
      "metode_diagnosis": [
        "Pengamatan visual gejala pada batang dan daun",
        "Identifikasi sklerotia (struktur bertahan jamur) di sekitar batang",
        "Kultur jamur untuk konfirmasi"
      ],
      "gambar": "",
      "sumber": "Tropical Plant Pathology, 2023"
    },
    "Serangan Thrips": {
      "gejala": [
        "Daun berubah warna keperakan atau kecoklatan",
        "Daun menggulung atau berkerut",
        "Bunga dan buah cacat",
        "Pertumbuhan tanaman terhambat"
      ],
      "penyebab": "Serangga kecil dari ordo Thysanoptera",
      "pengobatan": [
        "Penyemprotan insektisida sistemik atau kontak",
        "Penggunaan sabun insektisida",
        "Pelepasan predator alami seperti Orius spp."
      ],
      "pencegahan": [
        "Penggunaan jaring serangga",
        "Pemasangan perangkap berwarna biru atau kuning",
        "Menjaga kebersihan lahan",
        "Rotasi tanaman"
      ],
      "nama_ilmiah": "Thrips spp.",
      "faktor_pemicu": [
        "Cuaca panas dan kering",
        "Tanaman stres karena kekurangan air atau nutrisi",
        "Populasi predator alami yang rendah"
      ],
      "prognosis": "Dapat menyebabkan kerusakan serius pada tanaman dan penurunan kualitas hasil panen",
      "dampak_ekonomi": [
        "Penurunan hasil panen hingga 50% pada serangan berat",
        "Penurunan kualitas produk, terutama pada tanaman hias dan sayuran",
        "Peningkatan biaya pengendalian hama"
      ],
      "metode_diagnosis": [
        "Pengamatan visual gejala pada daun dan bunga",
        "Penggunaan kaca pembesar untuk identifikasi thrips",
        "Penggunaan perangkap berwarna untuk monitoring populasi"
      ],
      "gambar": "",
      "sumber": "Horticultural Entomology, 2023"
    },
    "Penyakit_Kuning_daun": {
      "gejala": [
        "Daun menguning secara progresif",
        "Pola kuning mosaik atau bintik-bintik pada daun",
        "Pertumbuhan tanaman terhambat",
        "Daun menggulung atau berkerut"
      ],
      "penyebab": "Virus, terutama Cucumber Mosaic Virus (CMV) atau Tomato Yellow Leaf Curl Virus (TYLCV)",
      "pengobatan": [
        "Tidak ada pengobatan langsung untuk virus",
        "Pemangkasan dan pemusnahan tanaman yang terinfeksi parah",
        "Pengendalian serangga vektor seperti kutu daun atau whitefly"
      ],
      "pencegahan": [
        "Menggunakan bibit bebas virus",
        "Mengendalikan populasi serangga vektor",
        "Menanam varietas tahan virus",
        "Menjaga kebersihan kebun dan peralatan"
      ],
      "nama_ilmiah": "Cucumber Mosaic Virus (CMV) atau Tomato Yellow Leaf Curl Virus (TYLCV)",
      "faktor_pemicu": [
        "Keberadaan serangga vektor",
        "Tanaman inang yang terinfeksi di sekitar area tanam",
        "Penggunaan alat yang terkontaminasi"
      ],
      "prognosis": "Dapat menyebabkan penurunan hasil panen yang signifikan, terutama jika infeksi terjadi pada tahap awal pertumbuhan",
      "dampak_ekonomi": [
        "Penurunan hasil panen hingga 100% pada kasus parah",
        "Peningkatan biaya pengendalian serangga vektor",
        "Kerugian akibat pemusnahan tanaman yang terinfeksi"
      ],
      "metode_diagnosis": [
        "Pengamatan visual gejala pada daun",
        "Uji serologi seperti ELISA",
        "Analisis PCR untuk identifikasi virus yang spesifik"
      ],
      "gambar": "",
      "sumber": "Virus Diseases of Plants, 2023"
    },
    "Penyakit_Bercak_Brown_Spot": {
      "gejala": [
        "Bercak coklat dengan tepi kuning pada daun",
        "Bercak membesar dan menyatu",
        "Daun mengering dan rontok prematur",
        "Pertumbuhan tanaman terhambat"
      ],
      "penyebab": "Jamur Alternaria spp., terutama Alternaria solani pada tomat dan kentang",
      "pengobatan": [
        "Penggunaan fungisida sistemik atau kontak sesuai anjuran",
        "Pemangkasan dan pemusnahan daun yang terinfeksi parah",
        "Perbaikan sirkulasi udara di sekitar tanaman"
      ],
      "pencegahan": [
        "Rotasi tanaman dengan spesies yang tidak rentan",
        "Menjaga kebersihan kebun",
        "Menggunakan bibit bebas penyakit",
        "Menghindari penyiraman daun di sore hari"
      ],
      "nama_ilmiah": "Alternaria spp.",
      "faktor_pemicu": [
        "Kelembaban tinggi",
        "Suhu hangat (24-29°C)",
        "Curah hujan atau irigasi berlebihan",
        "Kepadatan tanaman yang tinggi"
      ],
      "prognosis": "Dapat menyebabkan defoliasi (gugur daun) yang parah dan penurunan hasil panen jika tidak dikendalikan",
      "dampak_ekonomi": [
        "Penurunan hasil panen hingga 50% pada serangan berat",
        "Penurunan kualitas buah atau umbi",
        "Peningkatan biaya pengendalian penyakit"
      ],
      "metode_diagnosis": [
        "Pengamatan visual gejala pada daun",
        "Pemeriksaan mikroskopis untuk identifikasi spora jamur",
        "Kultur jamur untuk konfirmasi spesies"
      ],
      "gambar": "",
      "sumber": "Vegetable Diseases and Their Management, 2023"
    },
    "Penyakit_Mosaik": {
      "gejala": [
        "Pola mosaik (belang-belang) pada daun",
        "Daun berkerut atau terdistorsi",
        "Pertumbuhan tanaman terhambat",
        "Buah cacat atau berukuran kecil"
      ],
      "penyebab": "Berbagai jenis virus, termasuk Tobacco Mosaic Virus (TMV) dan Cucumber Mosaic Virus (CMV)",
      "pengobatan": [
        "Tidak ada pengobatan langsung untuk virus",
        "Pemangkasan dan pemusnahan tanaman yang terinfeksi parah",
        "Pengendalian serangga vektor"
      ],
      "pencegahan": [
        "Menggunakan bibit bebas virus",
        "Mengendalikan populasi serangga vektor",
        "Menanam varietas tahan virus",
        "Sanitasi peralatan dan tangan saat bekerja dengan tanaman"
      ],
      "nama_ilmiah": "Tobacco Mosaic Virus (TMV), Cucumber Mosaic Virus (CMV), dll.",
      "faktor_pemicu": [
        "Kontak dengan tanaman terinfeksi",
        "Penggunaan alat yang terkontaminasi",
        "Transmisi melalui serangga vektor",
        "Transmisi melalui benih yang terinfeksi"
      ],
      "prognosis": "Dapat menyebabkan penurunan hasil panen yang signifikan, terutama jika infeksi terjadi pada tahap awal pertumbuhan",
      "dampak_ekonomi": [
        "Penurunan hasil panen hingga 70% pada kasus parah",
        "Penurunan kualitas produk",
        "Peningkatan biaya pengendalian dan pencegahan"
      ],
      "metode_diagnosis": [
        "Pengamatan visual gejala pada daun dan buah",
        "Uji serologi seperti ELISA",
        "Analisis PCR untuk identifikasi virus yang spesifik"
      ],

      "gambar": "",
      "sumber": "Plant Virology, 2023"
    },
    "Serangan Nematoda Akar": {
      "gejala": [
        "Pertumbuhan tanaman terhambat",
        "Daun menguning dan layu",
        "Pembentukan bintil atau benjolan pada akar",
        "Akar membusuk"
      ],
      "penyebab": "Nematoda parasit tanaman, terutama Meloidogyne spp. (nematoda puru akar)",
      "pengobatan": [
        "Aplikasi nematisida sesuai anjuran",
        "Penggunaan agen hayati seperti jamur Paecilomyces lilacinus",
        "Rotasi tanaman dengan spesies yang bukan inang",
        "Solarisasi tanah untuk mengurangi populasi nematoda"
      ],
      "pencegahan": [
        "Menggunakan bibit bebas nematoda",
        "Rotasi tanaman dengan spesies yang tahan atau bukan inang",
        "Menjaga kebersihan peralatan pertanian",
        "Meningkatkan kandungan bahan organik tanah"
      ],
      "nama_ilmiah": "Meloidogyne spp.",
      "faktor_pemicu": [
        "Tanah berpasir yang hangat",
        "Monokultur tanaman rentan",
        "Perpindahan tanah yang terkontaminasi",
        "Penggunaan bibit atau bahan tanam yang terinfeksi"
      ],
      "prognosis": "Dapat menyebabkan penurunan hasil panen yang signifikan dan kerusakan akar yang parah jika tidak dikendalikan",
      "dampak_ekonomi": [
        "Penurunan hasil panen hingga 80% pada serangan berat",
        "Peningkatan biaya pengendalian nematoda",
        "Penurunan kualitas produk pertanian"
      ],
      "metode_diagnosis": [
        "Pengamatan visual gejala pada akar dan bagian atas tanaman",
        "Ekstraksi dan identifikasi nematoda dari sampel tanah",
        "Analisis PCR untuk identifikasi spesies nematoda"
      ],

      "gambar": "",
      "sumber": "Nematology in Agriculture, 2023"
    },
    "Penyakit Layu Fusarium": {
      "gejala": [
        "Daun menguning dan layu dimulai dari bawah",
        "Batang menunjukkan garis-garis cokelat saat dipotong",
        "Pertumbuhan tanaman terhambat",
        "Tanaman layu dan mati prematur"
      ],
      "penyebab": "Jamur Fusarium oxysporum",
      "pengobatan": [
        "Tidak ada pengobatan efektif setelah terinfeksi",
        "Pencabutan dan pemusnahan tanaman yang terinfeksi",
        "Sterilisasi tanah atau media tanam"
      ],
      "pencegahan": [
        "Penggunaan bibit bebas penyakit",
        "Rotasi tanaman dengan spesies yang tidak rentan",
        "Menjaga drainase tanah yang baik",
        "Penggunaan varietas tahan Fusarium"
      ],
      "nama_ilmiah": "Fusarium oxysporum",
      "faktor_pemicu": [
        "Suhu tanah yang hangat (20-30°C)",
        "Kelembaban tanah tinggi",
        "pH tanah yang rendah",
        "Stress pada tanaman"
      ],
      "prognosis": "Penyakit ini dapat menyebabkan kematian tanaman dan kerugian panen yang signifikan",
      "dampak_ekonomi": [
        "Penurunan hasil panen hingga 80% pada tanaman rentan",
        "Biaya tinggi untuk pengendalian dan pencegahan jangka panjang",
        "Kerugian akibat pemusnahan tanaman yang terinfeksi"
      ],
      "metode_diagnosis": [
        "Pengamatan gejala visual",
        "Kultur jamur pada media selektif",
        "Analisis PCR untuk identifikasi spesies Fusarium"
      ],

      "gambar": "",
      "sumber": "Soilborne Plant Pathogens, 2023"
    },
    "Powdery Mildew": {
      "gejala": [
        "Bercak putih pada daun dan batang",
        "Pertumbuhan tanaman terhambat",
        "Daun menguning dan rontok"
      ],
      "penyebab": "Jamur Erysiphe cichoracearum",
      "pengobatan": [
        "Penggunaan fungisida yang efektif",
        "Mengurangi kelembaban lingkungan",
        "Meningkatkan sirkulasi udara"
      ],
      "pencegahan": [
        "Menanam varietas tahan penyakit",
        "Menjaga kebersihan lingkungan tanam",
        "Mengatur jarak tanam yang cukup"
      ],
      "nama_ilmiah": "Erysiphe cichoracearum",
      "faktor_pemicu": [
        "Kelembaban tinggi",
        "Sirkulasi udara yang buruk",
        "Penyiraman yang berlebihan"
      ],
      "prognosis": "Jika tidak diobati, dapat menyebabkan penurunan hasil panen",
      "dampak_ekonomi": [
        "Penurunan hasil panen",
        "Peningkatan biaya pengendalian penyakit"
      ],
      "metode_diagnosis": [
        "Pengamatan visual pada daun dan batang",
        "Kultur jamur untuk konfirmasi"
      ],
      "gambar": "",
      "sumber": "Integrated Pest Management Guide, 2023"
    },
    "Blossom End Rot": {
      "gejala": [
        "Bercak coklat atau hitam di ujung buah",
        "Buah terasa keras di bagian bercak",
        "Buah menjadi cacat dan membusuk",
        "Gejala biasanya muncul saat buah masih muda"
      ],
      "penyebab": "Kekurangan kalsium pada buah, bukan disebabkan oleh patogen",
      "pengobatan": [
        "Pemberian suplemen kalsium melalui daun atau tanah",
        "Mengatur keseimbangan pH dan nutrisi",
        "Mengurangi fluktuasi air pada tanaman",
        "Memastikan pasokan air yang konsisten"
      ],
      "pencegahan": [
        "Mengatur irigasi yang konsisten",
        "Memastikan pasokan nutrisi yang cukup, terutama kalsium",
        "Menggunakan varietas tahan penyakit",
        "Menjaga pH tanah antara 6.0-6.5 untuk penyerapan kalsium optimal"
      ],
      "nama_ilmiah": "Blossom End Rot (BER)",
      "faktor_pemicu": [
        "Fluktuasi kelembaban tanah",
        "Ketidakseimbangan nutrisi, terutama kekurangan kalsium",
        "Irigasi yang tidak merata",
        "Pertumbuhan vegetatif yang terlalu cepat"
      ],
      "prognosis": "Dapat menyebabkan kerugian hasil panen jika tidak ditangani, terutama pada tanaman tomat, cabai, dan terong",
      "dampak_ekonomi": [
        "Penurunan kualitas dan kuantitas buah hingga 50%",
        "Biaya tambahan untuk pengelolaan nutrisi dan irigasi",
        "Penurunan nilai jual produk"
      ],
      "metode_diagnosis": [
        "Pengamatan visual pada buah",
        "Analisis kadar kalsium pada tanaman dan tanah",
        "Pemeriksaan pH dan EC (Electrical Conductivity) tanah"
      ],
      "gambar": "",
      "sumber": "Vegetable Crop Diseases, 2023"
    },
    "Karat Daun": {
      "gejala": [
        "Bintik-bintik kecil berwarna oranye atau cokelat pada daun",
        "Pustula berspora di bawah daun",
        "Daun mengering dan gugur prematur"
      ],
      "penyebab": "Berbagai spesies jamur dari ordo Pucciniales",
      "pengobatan": [
        "Aplikasi fungisida sistemik",
        "Pemangkasan dan pemusnahan bagian tanaman yang terinfeksi",
        "Penyemprotan larutan belerang"
      ],
      "pencegahan": [
        "Menanam varietas tahan karat",
        "Menjaga jarak tanam yang tepat untuk sirkulasi udara",
        "Menghindari penyiraman di sore hari"
      ],
      "nama_ilmiah": "Puccinia spp., Uromyces spp., dll.",
      "faktor_pemicu": [
        "Kelembaban tinggi",
        "Suhu moderat",
        "Angin yang membawa spora"
      ],
      "prognosis": "Dapat mengurangi fotosintesis dan menurunkan produktivitas tanaman",
      "dampak_ekonomi": [
        "Penurunan kualitas dan kuantitas hasil panen",
        "Peningkatan biaya pengendalian penyakit"
      ],
      "metode_diagnosis": [
        "Pengamatan visual pustula karat",
        "Pemeriksaan mikroskopik spora",
        "Uji serologi atau molekuler untuk identifikasi spesies"
      ],
      "gambar": "",
      "sumber": "Annual Review of Phytopathology, 2022"
    },
    "Antraknosa": {
      "gejala": [
        "Bercak cokelat gelap pada daun, buah, atau batang",
        "Lesi cekung pada buah",
        "Daun mengering dan gugur"
      ],
      "penyebab": "Jamur genus Colletotrichum",
      "pengobatan": [
        "Penggunaan fungisida berbasis tembaga",
        "Pemangkasan bagian tanaman yang terinfeksi",
        "Perbaikan drainase tanah"
      ],
      "pencegahan": [
        "Rotasi tanaman",
        "Penggunaan benih bebas penyakit",
        "Menjaga kebersihan alat pertanian"
      ],
      "nama_ilmiah": "Colletotrichum spp.",
      "faktor_pemicu": [
        "Kelembaban tinggi",
        "Suhu hangat",
        "Hujan yang berkepanjangan"
      ],
      "prognosis": "Dapat menyebabkan kerusakan serius pada tanaman dan penurunan kualitas buah",
      "dampak_ekonomi": [
        "Penurunan nilai jual produk pertanian",
        "Peningkatan biaya pengendalian penyakit"
      ],
      "metode_diagnosis": [
        "Pengamatan visual gejala",
        "Kultur jamur di laboratorium",
        "Analisis PCR untuk identifikasi spesies"
      ],
      "gambar": "",
      "sumber": "Tropical Plant Pathology Journal, 2022"
    },
  },
    'idmenu':1
  }
]

;