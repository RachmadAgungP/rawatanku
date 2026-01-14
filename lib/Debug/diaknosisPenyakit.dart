import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rawatt/components/card_judulPetro.dart';
import 'package:rawatt/components/tema_Page.dart';
import 'dart:math' as math;

import 'package:rawatt/constants.dart';
import 'package:rawatt/model/data_penyakit.dart';
import 'package:rawatt/screens/convert/component/inisialisasi_var.dart';
import 'package:rawatt/screens/home/home_screen.dart';
import 'package:rawatt/size_config.dart';
import 'package:string_similarity/string_similarity.dart';

class IdentifikasiPenyakitPage extends StatefulWidget {
  const IdentifikasiPenyakitPage({super.key});

  @override
  _IdentifikasiPenyakitPageState createState() =>
      _IdentifikasiPenyakitPageState();
}

class _IdentifikasiPenyakitPageState extends State<IdentifikasiPenyakitPage> {
  final TextEditingController _controller = TextEditingController();
  String _hasil = '';
  List<String> _suggestions = [];
  List<String> _penyakitList = [];
  String _gambarUrl = '';
  String _prompt = '';
  String _selectedFish = 'Lele'; // Default selected fish
  String text1 = "";
  String bidang = "";

  void dataString(int idmenu) {
    List data = _datatampung
        .where((element) => element["idmenu"] == c.indexMenuRawatan.value)
        .toList();
    text1 = (c.indexMenuRawatan.value == 1)
        ? "${data.first["text1"]} $_selectedFish"
        : _selectedFish;
    bidang = data.first["text2"];
  }

  final List<Map<String, dynamic>> _datatampung = [
    {"idmenu": 1, "text1": "Tanaman", "text2": "Hortikultura"},
    {
      "idmenu": 3,
      "text1": "Ikan",
      "text2": "Akuakultur",
    },
    {
      "idmenu": 3,
      "text1": "Ayam",
      "text2": "Peternakan",
    },
  ];

  Map<String, dynamic> _penyakitData = {
    'Lele': {
      "Bintik Putih (White Spot Disease)": {
        "nama_ilmiah": "Ichthyophthirius multifiliis",
        "gejala": [
          "bintik putih",
          "menggesek tubuh",
          "lendir berlebihan",
          "nafsu makan menurun",
          "berenang tidak normal",
          "insang pucat",
          "bintik putih 0.5-1 mm",
          "flashing",
          "produksi lendir berlebihan",
          "ikan lesu",
          "insang rusak",
          "kematian ikan"
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
        "prognosis":
            "Dapat menyebabkan kematian massal jika tidak ditangani segera",
        "dampak_ekonomi": "Kerugian besar karena mortalitas ikan tinggi",
        "metode_diagnosis": [
          "pemeriksaan gejala klinis",
          "mikroskopi untuk mengidentifikasi parasit",
        ],
        "gambar":
            "assets/images/MenuRawatan/RawatTanam/Lele_WhiteSpotDisease.jpg",
        "sumber":
            "Noga, E.J. (2010). Fish Disease: Diagnosis and Treatment, 2nd Edition. Wiley-Blackwell."
      },
      "Columnaris": {
        "nama_ilmiah": "Flavobacterium columnare",
        "gejala": [
          "lesi putih atau abu-abu di kulit",
          "sirip rusak",
          "insang pucat",
          "nafsu makan menurun",
          "berenang di permukaan",
          "lesi seperti pelana di punggung",
          "mulut berlendir",
          "insang membusuk",
          "ekor atau sirip membusuk",
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
        "dampak_ekonomi":
            "Kerugian besar karena mortalitas tinggi dan biaya pengobatan",
        "metode_diagnosis": [
          "pemeriksaan gejala klinis",
          "mikroskopi untuk mengidentifikasi bakteri",
        ],
        "gambar": "assets/images/MenuRawatan/RawatTanam/Lele_Columnaris.jpg",
        "sumber":
            "Declercq, A.M., et al. (2013). Columnaris disease in fish: a review with emphasis on bacterium-host interactions. Veterinary Research, 44(1), 27."
      },
      "Infeksi Aeromonas": {
        "nama_ilmiah": "Aeromonas hydrophila dan spesies Aeromonas lainnya",
        "gejala": [
          "borok pada kulit",
          "perut membengkak",
          "mata menonjol",
          "sisik berdiri",
          "pendarahan pada sirip dan insang",
          "kehilangan nafsu makan",
          "berenang tidak normal",
          "lesi merah pada kulit",
        ],
        "penyebab":
            "Bakteri Aeromonas hydrophila dan spesies Aeromonas lainnya",
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
        "dampak_ekonomi":
            "Kerugian besar karena penyebaran penyakit yang cepat",
        "metode_diagnosis": [
          "pemeriksaan gejala klinis",
          "kultur bakteri dan uji sensitivitas antibiotik",
        ],
        "gambar": "assets/images/MenuRawatan/RawatTanam/Lele_Aeromonas.jpg",
        "sumber":
            "Austin, B., & Austin, D.A. (2016). Bacterial Fish Pathogens: Disease of Farmed and Wild Fish. Springer."
      },
      "Enteric Septicemia of Catfish (ESC)": {
        "nama_ilmiah": "Edwardsiella ictaluri",
        "gejala": [
          "perut membengkak",
          "lesi merah di kulit",
          "pendarahan di organ dalam",
          "mata menonjol",
          "kehilangan nafsu makan",
          "berenang tidak normal",
          "lesi di hati dan ginjal",
          "cairan di rongga perut",
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
        "dampak_ekonomi":
            "Kerugian ekonomi besar karena penyebaran penyakit yang cepat",
        "metode_diagnosis": [
          "pemeriksaan gejala klinis",
          "kultur bakteri dan uji sensitivitas antibiotik",
        ],
        "gambar": "assets/images/MenuRawatan/RawatTanam/Lele_ESC.jpg",
        "sumber":
            "Wise, D.J., et al. (2004). Vaccination of channel catfish against Enteric Septicemia of Catfish (ESC) disease. Journal of the World Aquaculture Society, 35(2), 185-195."
      },
      "Channel Catfish Virus Disease (CCVD)": {
        "nama_ilmiah": "Channel Catfish Virus (CCV)",
        "gejala": [
          "pendarahan di dasar sirip",
          "perut membengkak",
          "eksoftalmus (mata menonjol)",
          "berenang tidak normal",
          "kehilangan keseimbangan",
          "pendarahan di organ dalam",
          "kematian massal pada ikan muda",
          "lesi di hati dan ginjal",
        ],
        "penyebab":
            "Channel Catfish Virus (CCV), anggota keluarga Herpesviridae",
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
        "prognosis":
            "Dapat menyebabkan kematian massal terutama pada ikan muda",
        "dampak_ekonomi":
            "Kerugian besar karena kematian massal dan biaya kontrol penyakit",
        "metode_diagnosis": [
          "pemeriksaan gejala klinis",
          "uji PCR (Polymerase Chain Reaction)",
          "histopatologi",
        ],
        "gambar": "assets/images/MenuRawatan/RawatTanam/Lele_CCVD.jpg",
        "sumber":
            "Hanson, L.A., et al. (2011). The channel catfish virus (IcHV-1): a new look at an old nemesis. Viruses, 3(11), 2130-2159."
      },
      "Trichodiniasis": {
        "nama_ilmiah": "Trichodina spp.",
        "gejala": [
          "kulit berlendir berlebihan",
          "sisik terkelupas",
          "nafsu makan menurun",
          "berenang tidak normal",
          "flashing",
          "insang pucat",
          "lesi pada kulit",
          "pergerakan operkulum yang cepat",
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
        "gambar":
            "assets/images/MenuRawatan/RawatTanam/Nila_Trichodiniasis.jpg",
        "sumber":
            "Martins, M.L., et al. (2015). Protozoan infections in farmed fish from Brazil: diagnosis and pathogenesis. Revista Brasileira de Parasitologia Veterinária, 24, 1-20."
      }
    },
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
        "prognosis":
            "Dapat menyebabkan kematian massal jika tidak ditangani dengan cepat",
        "dampak_ekonomi":
            "Kerugian ekonomi signifikan karena tingkat kematian tinggi dan biaya pengobatan",
        "metode_diagnosis": [
          "pemeriksaan gejala klinis",
          "isolasi dan identifikasi bakteri",
          "uji PCR (Polymerase Chain Reaction)",
          "histopatologi"
        ],
        "gambar":
            "assets/images/MenuRawatan/RawatTanam/Nila_Streptococcosis.jpg",
        "sumber":
            "Amal, M.N.A., et al. (2020). Streptococcosis in Tilapia (Oreochromis niloticus): A Review. Aquaculture Research, 51(6), 2375-2386."
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
        "prognosis":
            "Dapat menyebabkan kematian hingga 90% populasi dalam waktu singkat",
        "dampak_ekonomi":
            "Kerugian ekonomi sangat besar karena tingkat kematian yang tinggi dan tidak adanya pengobatan efektif",
        "metode_diagnosis": [
          "RT-PCR (Reverse Transcription Polymerase Chain Reaction)",
          "sekuensing gen",
          "histopatologi",
          "isolasi virus pada kultur sel"
        ],
        "gambar": "assets/images/MenuRawatan/RawatTanam/Nila_TiLV.jpg",
        "sumber":
            "Jansen, M.D., et al. (2018). Tilapia lake virus (TiLV): A threat to the global tilapia industry? Reviews in Aquaculture, 10(3), 725-739."
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
        "prognosis":
            "Dapat menyebabkan kematian cepat pada ikan muda, namun ikan dewasa memiliki ketahanan lebih baik",
        "dampak_ekonomi":
            "Kerugian ekonomi sedang hingga besar tergantung pada tingkat keparahan wabah",
        "metode_diagnosis": [
          "pemeriksaan mikroskopis lesi",
          "kultur bakteri dan identifikasi",
          "PCR untuk konfirmasi spesies bakteri",
          "histopatologi"
        ],
        "gambar": "assets/images/MenuRawatan/RawatTanam/Nila_Columnaris.jpg",
        "sumber":
            "Declercq, A.M., et al. (2013). Columnaris disease in fish: a review with emphasis on bacterium-host interactions. Veterinary Research, 44(1), 27."
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
        "prognosis":
            "Dapat menyebabkan kematian jika tidak diobati, terutama pada telur dan ikan muda",
        "dampak_ekonomi":
            "Kerugian ekonomi sedang, terutama jika menyerang telur atau benih ikan",
        "metode_diagnosis": [
          "pemeriksaan visual pertumbuhan jamur",
          "pemeriksaan mikroskopis sampel",
          "kultur jamur pada media khusus",
          "PCR untuk identifikasi spesies"
        ],
        "gambar": "assets/images/MenuRawatan/RawatTanam/Nila_saprolegnia.jpg",
        "sumber":
            "van West, P. (2006). Saprolegnia parasitica, an oomycete pathogen with a fishy appetite: new challenges for an old problem. Mycologist, 20(3), 99-104."
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
        "prognosis":
            "Umumnya tidak fatal pada ikan dewasa, namun dapat menyebabkan kematian pada benih ikan jika tidak diobati",
        "dampak_ekonomi":
            "Kerugian ekonomi sedang karena pertumbuhan ikan terhambat dan biaya pengobatan",
        "metode_diagnosis": [
          "pemeriksaan mikroskopis lendir kulit dan insang",
          "identifikasi morfologi parasit",
          "pewarnaan perak untuk detail struktur parasit",
          "PCR untuk identifikasi spesies"
        ],
        "gambar":
            "assets/images/MenuRawatan/RawatTanam/Nila_Trichodiniasis.jpg",
        "sumber":
            "Abdel-Baki, A.S., et al. (2018). Trichodina heterodentata (Ciliophora: Trichodinidae) from the Nile tilapia, Oreochromis niloticus, in the River Nile, Egypt. Parasitology Research, 117(9), 2749-2754."
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
        "prognosis":
            "Dapat menyebabkan kematian massal pada benih ikan, namun ikan dewasa umumnya lebih tahan",
        "dampak_ekonomi":
            "Kerugian ekonomi sedang hingga besar, terutama pada pembenihan",
        "metode_diagnosis": [
          "pemeriksaan mikroskopis kulit dan sirip",
          "identifikasi morfologi parasit",
          "PCR untuk identifikasi spesies",
          "histopatologi",
        ],
        "gambar": "",
        "sumber":
            "García-Vásquez, A., et al. (2011). Gyrodactylus species (Monogenea) infecting the Nile tilapia Oreochromis niloticus in southern Mexico. Parasitology Research, 108(5), 1141-1147."
      }
    },
  };

  @override
  void initState() {
    super.initState();
    _selectedFish = (c.indexMenuRawatan.value == 1)
        ? "Tanaman"
        : (c.indexMenuRawatan.value == 3)
            ? 'Lele'
            : 'Ayam';
    _penyakitData =
        filterData(c.indexMenuRawatan.value, dataPenyakit, _selectedFish);
    _updatePenyakitList();
    _controller.addListener(_onTextChanged);
  }

  bool isGeneralQuery(String input) {
    List<String> generalKeywords = ['umum', 'daftar', 'list', 'semua'];
    return generalKeywords.any((keyword) => input.contains(keyword));
  }

  @override
  void dispose() {
    _controller.removeListener(_onTextChanged);
    _controller.dispose();
    super.dispose();
  }

  void _updatePenyakitList() {
    setState(() {
      _penyakitList = _penyakitData[_selectedFish]!.keys.toList();
    });
  }

  void _onTextChanged() {
    if (_controller.text.isEmpty) {
      setState(() {
        _suggestions = [];
      });
    } else {
      _updateSuggestions(_controller.text);
    }
  }

  // void _identifikasiPenyakit(String input) {
  //   input = input.toLowerCase();
  //
  //   if (_isGeneralQuery(input)) {
  //     setState(() {
  //       _hasil = 'Daftar penyakit $text1 yang umum:\n\n' +
  //           _penyakitList.join('\n');
  //       _gambarUrl = '';
  //       _generatePrompt('');
  //     });
  //     return;
  //   }
  //
  //   Map<String, int> scores = {};
  //
  //   _penyakitData[_selectedFish]!.forEach((penyakit, data) {
  //     int score = 0;
  //
  //     for (String gejala in data['gejala']) {
  //       print('sasa ${gejala} -> ${input}');
  //       if (input.contains(gejala)) {
  //         score++;
  //       }
  //     }
  //     if (score > 0) {
  //       scores[penyakit] = score;
  //     }
  //   });
  //
  //   if (scores.isEmpty) {
  //     setState(() {
  //       _hasil =
  //       'Tidak dapat mengidentifikasi penyakit berdasarkan gejala yang diinputkan.';
  //       _gambarUrl = '';
  //       _generatePrompt(input);
  //     });
  //   } else {
  //     String penyakitTeridentifikasi =
  //         scores.entries.reduce((a, b) => a.value > b.value ? a : b).key;
  //     var data = _penyakitData[_selectedFish]![penyakitTeridentifikasi]!;
  //     setState(() {
  //       _hasil = 'Kemungkinan penyakit: $penyakitTeridentifikasi\n\n'
  //           'Nama Ilmiah: ${data['nama_ilmiah']}\n\n'
  //           'Penyebab: ${data['penyebab']}\n\n'
  //           'Gejala: ${data['gejala'].join(', ')}\n\n'
  //           'Pengobatan:\n${data['pengobatan'].map((e) => '- $e').join('\n')}\n\n'
  //           'Pencegahan:\n${data['pencegahan'].map((e) => '- $e').join('\n')}\n\n'
  //           'Sumber: ${data['sumber']}';
  //       _gambarUrl = data['gambar'];
  //       _generatePrompt(penyakitTeridentifikasi);
  //     });
  //   }
  // }

  void _identifikasiPenyakit(String input) {
    input = input.toLowerCase();

    if (isGeneralQuery(input)) {
      setState(() {
        _hasil =
            'Daftar penyakit $_selectedFish yang umum:\n\n${_penyakitList.join('\n')}';
        _gambarUrl = '';
        _generatePrompt('');
      });
      // return;
    }

    Map<String, double> scores = {};

    _penyakitData[_selectedFish]!.forEach((penyakit, data) {
      double score = 0;
      List<String> inputWords = input.split(' ');

      for (String gejala in data['gejala']) {
        double maxSimilarity = 0;
        for (String inputWord in inputWords) {
          double similarity = inputWord.similarityTo(gejala);
          maxSimilarity =
              similarity > maxSimilarity ? similarity : maxSimilarity;
        }
        score += maxSimilarity;
      }

      if (score > 0) {
        scores[penyakit] = score;
      }
    });

    if (scores.isEmpty) {
      setState(() {
        _hasil =
            'Tidak dapat mengidentifikasi penyakit berdasarkan gejala yang diinputkan.';
        _gambarUrl = '';
        _generatePrompt(input);
      });
    } else {
      String penyakitTeridentifikasi =
          scores.entries.reduce((a, b) => a.value > b.value ? a : b).key;
      var data = _penyakitData[_selectedFish]![penyakitTeridentifikasi]!;

      setState(() {
        _hasil = '''
Kemungkinan penyakit: $penyakitTeridentifikasi

Nama Ilmiah: ${data['nama_ilmiah']}

Penyebab: ${data['penyebab']}

Gejala: ${data['gejala'].join(', ')}

Pengobatan:
${data['pengobatan'].map((e) => '- $e').join('\n')}

Pencegahan:
${data['pencegahan'].map((e) => '- $e').join('\n')}

Sumber: ${data['sumber']}
''';
        _gambarUrl = data['gambar'];
        _generatePrompt(penyakitTeridentifikasi);
      });
    }
  }

  void _generatePrompt(String penyakitOrGejala) {
    dataString(c.indexMenuRawatan.value);
    String basePrompt = '''
# Prompt AI Pakar Penyakit $text1

Anda adalah seorang dokter hewan ahli di bidang $bidang dengan pengalaman 25 tahun dalam mendiagnosis dan mengobati penyakit pada $text1. Keahlian Anda mencakup berbagai penyakit $text1, gejala, penyebab, pengobatan, dan metode pencegahannya. Tugas Anda adalah memberikan informasi yang terperinci, akurat, dan bermanfaat kepada pembudidaya $text1, peneliti, dan penghobi mengenai masalah kesehatan $text1.

## Parameter Peran
- **Keahlian**: Dokter Hewan $bidang
- **Spesialisasi**: Penyakit $text1
- **Pengalaman**: 25 Tahun
- **Sifat Utama**: Teliti, empati, komunikator yang baik
- **Kompetensi Inti**: Pendekatan holistik terhadap kesehatan $text1, penekanan pada pencegahan penyakit, edukasi pembudidaya yang efektif

## Proses Konsultasi
1. Sapa pengguna dan tanyakan bagaimana Anda dapat membantu mereka dengan masalah kesehatan $text1.
2. Dengarkan dengan seksama deskripsi gejala atau pertanyaan pengguna tentang penyakit tertentu. Ajukan pertanyaan lanjutan untuk mengumpulkan semua informasi yang diperlukan.
3. Analisis informasi yang diberikan, pertimbangkan faktor lingkungan, praktik pemberian pakan, dan potensi stressor yang dapat berkontribusi pada masalah kesehatan.
4. Berikan penjelasan rinci tentang kemungkinan penyakit berdasarkan gejala yang dijelaskan. Sertakan informasi tentang:
   - Nama penyakit
   - Agen penyebab (misalnya bakteri, virus, parasit)
   - Gejala umum
   - Potensi penyebab atau faktor risiko
   - Metode diagnosis
   - Pilihan pengobatan
   - Strategi pencegahan
5. Tawarkan saran praktis tentang cara mengelola penyakit dan mencegah penyebarannya dalam populasi $text1.
6. Sarankan kapan perlu berkonsultasi dengan profesional kesehatan $text1 setempat untuk pemeriksaan langsung atau pengujian laboratorium.

## Basis Pengetahuan
Respon Anda harus didasarkan pada pemahaman komprehensif tentang penyakit $text1 yang umum, termasuk namun tidak terbatas pada:
${_penyakitList.join('\n')}

Untuk setiap penyakit, siap untuk membahas:
- Etiologi
- Epidemiologi
- Tanda klinis
- Patologi
- Diagnosis
- Pilihan pengobatan
- Langkah-langkah pengendalian dan pencegahan

## Pedoman Respon
- Berikan informasi akurat berbasis ilmiah.
- Gunakan bahasa yang jelas dan mudah dimengerti sambil tetap mempertahankan terminologi profesional jika sesuai.
- Tawarkan saran praktis dan dapat ditindaklanjuti yang dapat diterapkan dalam berbagai pengaturan $bidang.
- Tekankan pentingnya pencegahan dan praktik $bidang yang baik.
- Saat membahas pengobatan, sebutkan opsi kimia dan non-kimia jika memungkinkan.
- Sertakan kutipan atau referensi yang relevan ke literatur ilmiah jika sesuai.
- Jika tidak yakin tentang aspek apa pun, nyatakan dengan jelas batasan pengetahuan Anda dan sarankan untuk mencari saran profesional tambahan.

## Pertimbangan Etis
- Prioritaskan kesejahteraan $text1 dalam semua rekomendasi.
- Sarankan penggunaan antibiotik dan pengobatan lain secara bertanggung jawab untuk mencegah resistensi antimikroba.
- Promosikan praktik $bidang berkelanjutan yang menyeimbangkan produksi dengan pengelolaan lingkungan.

Ingat, tujuan Anda adalah memberikan informasi yang komprehensif, akurat, dan bermanfaat untuk mendukung kesehatan dan kesejahteraan $text1 dalam berbagai pengaturan $bidang. Libatkan diri dengan kekhawatiran spesifik pengguna dan sesuaikan respons Anda dengan tingkat keahlian mereka dan konteks pertanyaan mereka.

Berdasarkan informasi yang diberikan, mohon berikan respons terperinci tentang masalah kesehatan $text1 berikut:
''';

    setState(() {
      _prompt = basePrompt + penyakitOrGejala;
    });
  }

  bool _isGeneralQuery(String input) {
    List<String> generalQueries = [
      'penyakit',
      'sakit',
      'obat',
      text1,
      _selectedFish,
      'pengobatan',
      'daftar penyakit'
    ];
    return generalQueries.any((query) => input.contains(query));
  }

  void _updateSuggestions(String input) {
    Set<String> allGejala = {};
    _penyakitData[_selectedFish]!.values.forEach((data) {
      allGejala.addAll(data['gejala']);
    });

    setState(() {
      _suggestions = allGejala
          .where((gejala) =>
              gejala.toLowerCase().startsWith(input.toLowerCase()) &&
              !input.toLowerCase().contains(gejala.toLowerCase()))
          .take(5)
          .toList(); // Membatasi jumlah saran yang ditampilkan

      if (input.isEmpty) {
        _suggestions = ['penyakit $text1', text1, 'daftar penyakit'];
      }
    });
  }

  void _copyPromptToClipboard() {
    Clipboard.setData(ClipboardData(text: _prompt));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Prompt disalin ke clipboard')),
    );
  }

  @override
  Widget build(BuildContext context) {
    _penyakitData =
        filterData(c.indexMenuRawatan.value, dataPenyakit, _selectedFish);

    // print("ssda  ${_hasil}");
    return Scaffold(
      extendBodyBehindAppBar: (SizeConfig.screenWidth! > 600) ? false : true,
      appBar:
          (SizeConfig.screenWidth! > 600) ? appBarLanscape() : appBarPotrait(),
      body: Builder(
        builder: (context) {
          return BackgraundPotrait(
              judul: "Diagnosis Penyakit",
              penjelas: "Peliharaanmu",
              widgets: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(defaultPadding),
                    child: CardListProduct(
                      key: Key("s"),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Color(0x51C2FFF5), Color(0xFF115A52)],
                      ),
                    ),
                    child: SingleChildScrollView(
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          SizedBox(
                            height: defaultPadding / 3,
                          ),
                          Card(
                            elevation: 4,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Pilih Jenis $_selectedFish:',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  DropdownButtonFormField<String>(
                                    value: _selectedFish,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      filled: true,
                                      fillColor: Colors.white,
                                    ),
                                    items: _penyakitData.keys
                                        .toList()
                                        .map((String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    }).toList(),
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        _selectedFish = newValue!;
                                        _updatePenyakitList();
                                        _controller.clear();
                                        _hasil = '';
                                        _gambarUrl = '';
                                        _prompt = '';
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          Card(
                            elevation: 4,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Masukkan Gejala:',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  TextField(
                                      controller: _controller,
                                      decoration: InputDecoration(
                                        hintText:
                                            'Contoh: bintik putih, penurunan berat badan',
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        filled: true,
                                        fillColor: Colors.white,
                                        suffixIcon: _controller.text.isNotEmpty
                                            ? IconButton(
                                                icon: Icon(Icons.clear),
                                                onPressed: () {
                                                  setState(() {
                                                    _controller.clear();
                                                  });
                                                },
                                              )
                                            : null,
                                      ),
                                      onSubmitted: (String hasil) {
                                        setState(() {
                                          _onTextChanged();
                                        });
                                      }),
                                  if (_suggestions.isNotEmpty) ...[
                                    SizedBox(height: 10),
                                    Wrap(
                                      spacing: 6.0,
                                      runSpacing: 6.0,
                                      children: _suggestions.map((s) {
                                        return GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              _controller.text = s;
                                              _onTextChanged();
                                              _identifikasiPenyakit(
                                                  _controller.text);
                                            });
                                          },
                                          child: Chip(
                                            label: Text(s),
                                            backgroundColor:
                                                Colors.teal.shade100,
                                          ),
                                        );
                                      }).toList(),
                                    ),
                                  ],
                                ],
                              ),
                            ),
                          ),
                          // GlowingButton(buttonText: 'Identifikasi Penyakit', onPressed: () {
                          //   setState(() {
                          //     _identifikasiPenyakit(_controller.text);
                          //
                          //   });
                          // }, customLightColor: Color(0x08B09FFF),
                          //     customDarkColor: Color(0xFF115A52),),

                          if (_hasil.isNotEmpty) ...[
                            SizedBox(height: 20),
                            Card(
                              elevation: 4,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(16.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Hasil Identifikasi:',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      _hasil,
                                      style: TextStyle(fontSize: 16),
                                    ),
                                    if (_gambarUrl.isNotEmpty)
                                      Padding(
                                        padding: EdgeInsets.only(top: 10),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: Image.asset(_gambarUrl),
                                        ),
                                      ),
                                    SizedBox(height: defaultPadding),
                                    GlowingButton(
                                      buttonText: 'Copy Prompt Ai',
                                      onPressed: () {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                              content:
                                                  Text('Copied to clipboard')),
                                        );
                                        _copyPromptToClipboard;
                                      },
                                      customLightColor: Color(0xFF9D4EDD),
                                      customDarkColor: Color(0xFF5A189A),
                                    ),
                                    TombolAiGeneratoe(),
                                  ],
                                ),
                              ),
                            ),
                          ],
                          SizedBox(height: defaultPadding * 3),
                          SizedBox(height: defaultPadding * 3),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              tema: Colors.green,
              key: Key("s"));
        },
      ),
    );
  }
}

class TombolAiGeneratoe extends StatelessWidget {
  const TombolAiGeneratoe({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: defaultPadding),
        Text(
          "Generate Prompt di : ",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: heightfit(sT18),
          ),
        ),
        SizedBox(
          width: SizeConfig.screenWidth,
          child: Wrap(
            children: [
              Expanded(
                flex: 7,
                child: Padding(
                  padding: EdgeInsets.only(
                      top: defaultPadding, left: defaultPadding / 2),
                  child: SizedBox(
                    width: 150,
                    height: 50,
                    child: FittedBox(
                      child: GlowingButton(
                        buttonText: 'Claude AI',
                        onPressed: () {
                          launchURL("https://claude.ai/");
                        },
                        customLightColor: Color(0x08B09FFF),
                        customDarkColor: Color(0xFF115A52),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 7,
                child: Padding(
                  padding: EdgeInsets.only(
                      top: defaultPadding, left: defaultPadding / 2),
                  child: SizedBox(
                    width: 150,
                    height: 50,
                    child: FittedBox(
                      child: GlowingButton(
                        buttonText: 'Gemini AI',
                        onPressed: () {
                          launchURL("https://gemini.google.com/app");
                        },
                        customLightColor: Color(0x08B09FFF),
                        customDarkColor: Color(0xFF115A52),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 7,
                child: Padding(
                  padding: EdgeInsets.only(
                      top: defaultPadding, left: defaultPadding / 2),
                  child: SizedBox(
                    width: 150,
                    height: 50,
                    child: FittedBox(
                      child: GlowingButton(
                        buttonText: 'Chat GPT',
                        onPressed: () {
                          launchURL("https://chatgpt.com/");
                        },
                        customLightColor: Color(0x08B09FFF),
                        customDarkColor: Color(0xFF115A52),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 7,
                child: Padding(
                  padding: EdgeInsets.only(
                      top: defaultPadding, left: defaultPadding / 2),
                  child: SizedBox(
                    width: 150,
                    height: 50,
                    child: FittedBox(
                      child: GlowingButton(
                        buttonText: 'Copilot AI',
                        onPressed: () {
                          launchURL("https://www.bing.com/chat");
                        },
                        customLightColor: Color(0x08B09FFF),
                        customDarkColor: Color(0xFF115A52),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: defaultPadding),
        Text(
          'Tekan tombol "Copy Prompt AI" di atas untuk menyalin informasi detail yang dapat Anda gunakan saat berkonsultasi dengan dokter hewan atau mencari informasi lebih lanjut. di generate propt di Claude AI, Gemini AI, Chat GPT, atau Copilot AI',
          style: TextStyle(
            fontSize: 14,
            fontStyle: FontStyle.italic,
            color: Colors.grey[600],
          ),
        ),
      ],
    );
  }
}

class GlowingButton extends StatefulWidget {
  final String buttonText;
  final VoidCallback onPressed;
  final Color customLightColor;
  final Color customDarkColor;

  const GlowingButton(
      {super.key,
      required this.buttonText,
      required this.onPressed,
      required this.customLightColor,
      required this.customDarkColor});

  @override
  _GlowingButtonState createState() => _GlowingButtonState();
}

class _GlowingButtonState extends State<GlowingButton>
    with TickerProviderStateMixin {
  late AnimationController _buttonAnimationController;
  late AnimationController _starAnimationController;
  late AnimationController _touchAnimationController;
  late Animation<double> _buttonAnimation;
  late Animation<double> _touchAnimation;
  // List<Star> stars = [];

  // Warna dominan kustom
  Color customLightColor = Color(0xFF9D4EDD);
  Color customDarkColor = Color(0xFF5A189A);

  @override
  void initState() {
    super.initState();
    customLightColor = widget.customLightColor;
    customDarkColor = widget.customDarkColor;

    _buttonAnimationController = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);
    _buttonAnimation =
        Tween<double>(begin: 0, end: 1).animate(_buttonAnimationController);

    _starAnimationController = AnimationController(
      duration: Duration(milliseconds: 5000),
      vsync: this,
    )..repeat();

    _touchAnimationController = AnimationController(
      duration: Duration(milliseconds: 200),
      vsync: this,
    );
    _touchAnimation =
        Tween<double>(begin: 1, end: 1.1).animate(_touchAnimationController);

    // Inisialisasi bintang-bintang
    // for (int i = 0; i < 20; i++) {
    //   stars.add(Star(startX: 100, startY: 30)); // Menyebar dari tengah tombol
    // }
  }

  @override
  void dispose() {
    _buttonAnimationController.dispose();
    _starAnimationController.dispose();
    _touchAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          // _buildStars(),
          AnimatedBuilder(
            animation: _touchAnimation,
            builder: (context, child) {
              return Transform.scale(
                scale: _touchAnimation.value,
                child: AnimatedBuilder(
                  animation: _buttonAnimation,
                  builder: (context, child) {
                    return Container(
                      height: 60,
                      // width: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        gradient: LinearGradient(
                          colors: [
                            Color.lerp(customLightColor, customDarkColor,
                                _buttonAnimation.value)!,
                            Color.lerp(customDarkColor, customLightColor,
                                _buttonAnimation.value)!,
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Color.lerp(customLightColor, customDarkColor,
                                    _buttonAnimation.value)!
                                .withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 10,
                            offset: Offset(0, 0),
                          ),
                        ],
                      ),
                      child: GestureDetector(
                        onTapDown: (_) => _touchAnimationController.forward(),
                        onTapUp: (_) => _touchAnimationController.reverse(),
                        onTapCancel: () => _touchAnimationController.reverse(),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            shadowColor: Colors.transparent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          onPressed: widget.onPressed,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.auto_awesome, color: Colors.white),
                              SizedBox(width: 8),
                              Text(
                                widget.buttonText,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  // Widget _buildStars() {
  //   return AnimatedBuilder(
  //     animation: _starAnimationController,
  //     builder: (context, child) {
  //       return Container(
  //         width: 300,
  //         height: 150,
  //         child: Stack(
  //           children: stars.map((star) {
  //             star.update(_starAnimationController.value);
  //             return Positioned(
  //               top: star.y,
  //               left: star.x,
  //               child: Opacity(
  //                 opacity: star.opacity,
  //                 child: Transform.scale(
  //                   scale: star.scale,
  //                   child: Icon(
  //                     Icons.star,
  //                     color: Colors.white,
  //                     size: star.size,
  //                   ),
  //                 ),
  //               ),
  //             );
  //           }).toList(),
  //         ),
  //       );
  //     },
  //   );
  // }
}

class Star {
  double x;
  double y;
  double size;
  double speed;
  double opacity;
  double scale;

  double angle;
  double startX;
  double startY;

  Star({required this.startX, required this.startY})
      : x = startX,
        y = startY,
        size = math.Random().nextDouble() * 4 + 1,
        speed = math.Random().nextDouble() * 2 + 0.5,
        opacity = math.Random().nextDouble(),
        scale = 1,
        angle = math.Random().nextDouble() * 2 * math.pi;

  void reset() {
    x = startX;
    y = startY;
    size = math.Random().nextDouble() * 4 + 1;
    speed = math.Random().nextDouble() * 2 + 0.5;
    opacity = math.Random().nextDouble();
    scale = math.Random().nextDouble() * 0.5 + 0.5;
    angle = math.Random().nextDouble() * 2 * math.pi;
  }

  void update(double t) {
    x += speed * math.cos(angle);
    y += speed * math.sin(angle);
    opacity =
        math.sin(t * math.pi * 2 + math.Random().nextDouble() * math.pi * 2) *
                0.5 +
            0.5;
    scale = math.sin(t * math.pi * 2) * 0.5 + 1;

    if (x < -10 || x > 310 || y < -10 || y > 160) {
      reset();
    }
  }
}
