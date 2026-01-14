

class SavedPrompt {
  String title;
  String content;
  DateTime dateCreated;

  SavedPrompt({
    required this.title,
    required this.content,
    required this.dateCreated,
  });

  // Copy constructor untuk melakukan deep copy
  SavedPrompt.copy(SavedPrompt original)
      : title = original.title,
        content = original.content,
        dateCreated = DateTime.fromMillisecondsSinceEpoch(original.dateCreated.millisecondsSinceEpoch);
}

class BookReference {
  final String title;
  final String author;
  final String year;
  final List<String> keyInsights;

  BookReference({
    required this.title,
    required this.author,
    required this.year,
    required this.keyInsights,
  });

  // Copy constructor untuk melakukan deep copy
  BookReference.copy(BookReference original)
      : title = original.title,
        author = original.author,
        year = original.year,
        keyInsights = List<String>.from(original.keyInsights);

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'author': author,
      'year': year,
      'keyInsights': keyInsights,
    };
  }
}

List<String> keyObjectives = [];
List<String> roles = [
  "Manajer Produksi",
  "Manajer Pengolahan dan Nilai Tambah",
  "Manajer Penentuan Produk dan Segmen Pasar",
  "Manajer Desain Grafis/Kreatif",
  "Manajer Branding dan Pemasaran",
  "Manajer Pengembangan Produk",

  "Sales Executive",
  "Marketing Manager",
];

Map<String, dynamic> roleData =  {
  'Departemen': "",
  "Output": <dynamic>[],
  "Customer Types": <String>[],
  "Key Tasks": <String>[],
  "Brainstorming Questions": <String>[],
};

// Contoh data
Map<String, Map<String, dynamic>> defaultData = {
  'Manajer Produksi': {
    'Department': 'Produksi',
    'Output': [
      'Laporan hasil panen bulanan',
      'Analisis efisiensi produksi pertanian',
      'Rencana rotasi tanaman tahunan',
      'Laporan penggunaan sumber daya (air, pupuk, dll)',
    ],
    'CustomerTypes': [
      'Manajer Pengolahan dan Nilai Tambah',
      'Manajer Penentuan Produk dan Segmen Pasar',
      'Distributor bahan baku pertanian',
    ],
    'KeyTasks': [
      'Mengoptimalkan proses produksi pertanian',
      'Mengimplementasikan teknologi pertanian modern',
      'Mengelola jadwal tanam dan panen',
      'Memastikan kualitas hasil pertanian',
      'Mengawasi kepatuhan terhadap standar keamanan pangan',
    ],
    'BrainstormingQuestions': [
      'Bagaimana meningkatkan hasil panen tanpa mengorbankan kualitas?',
      'Apa inovasi terbaru dalam teknologi pertanian yang dapat diterapkan?',
      'Cara terbaik mengurangi dampak lingkungan dari praktik pertanian?',
      'Bagaimana mengoptimalkan penggunaan lahan pertanian?',
    ],
    'keyObjectives': [
      'Meningkatkan produktivitas lahan sebesar 15% dalam satu tahun',
      'Mengurangi penggunaan pestisida kimia sebesar 30%',
      'Mengimplementasikan sistem irigasi presisi',
      'Mencapai sertifikasi Good Agricultural Practices (GAP)',
    ],
    'collaborationTeams': [
      'Tim Penelitian dan Pengembangan',
      'Tim Logistik dan Rantai Pasok',
      'Tim Manajemen Kualitas',
      'Tim Keberlanjutan Lingkungan',
    ],
    'resources': [
      'Sistem manajemen pertanian terpadu berbasis teknologi',
      'Laboratorium pengujian kualitas tanah dan hasil panen',
      'Peralatan pertanian modern dan sistem otomasi',
      'Database pengetahuan pertanian dan cuaca',
    ],
    'timeline': '12 bulan, dengan evaluasi triwulanan',
    'expectedOutcome': 'Peningkatan produktivitas 15%, pengurangan biaya 10%, 100% sertifikasi GAP, mempertahankan kualitas dan keberlanjutan.',
  },
  'Manajer Pengolahan dan Nilai Tambah': {
    'Department': 'Produksi',
    'Output': [
      'Laporan efisiensi pengolahan produk',
      'Analisis kualitas produk olahan',
      'Proposal pengembangan produk turunan baru',
      'SOP proses pengolahan untuk setiap produk',
    ],
    'CustomerTypes': [
      'Manajer Penentuan Produk dan Segmen Pasar',
      'Manajer Branding dan Pemasaran',
      'Distributor produk olahan',
    ],
    'KeyTasks': [
      'Mengoptimalkan proses pengolahan hasil pertanian',
      'Mengembangkan produk nilai tambah baru',
      'Mengelola kualitas produk olahan',
      'Mengimplementasikan teknologi pengolahan terbaru',
      'Memastikan kepatuhan terhadap standar keamanan pangan',
    ],
    'BrainstormingQuestions': [
      'Bagaimana meningkatkan efisiensi proses pengolahan?',
      'Produk nilai tambah apa yang potensial untuk dikembangkan?',
      'Cara mengurangi limbah dalam proses pengolahan?',
      'Teknologi pengolahan terbaru apa yang dapat diimplementasikan?',
    ],
    'keyObjectives': [
      'Meningkatkan efisiensi pengolahan sebesar 20%',
      'Mengembangkan 3 produk nilai tambah baru dalam setahun',
      'Mengurangi limbah pengolahan sebesar 25%',
      'Mencapai sertifikasi ISO 22000 untuk manajemen keamanan pangan',
    ],
    'collaborationTeams': [
      'Tim Penelitian dan Pengembangan Produk',
      'Tim Kontrol Kualitas',
      'Tim Manajemen Rantai Pasok',
      'Tim Pemasaran',
    ],
    'resources': [
      'Fasilitas pengolahan modern',
      'Laboratorium pengujian kualitas produk',
      'Software manajemen proses pengolahan',
      'Tim ahli teknologi pangan',
    ],
    'timeline': '12 bulan, dengan review bulanan',
    'expectedOutcome': 'Peningkatan efisiensi 20%, 3 produk baru diluncurkan, pengurangan limbah 25%, sertifikasi ISO 22000 tercapai.',
  },
  'Manajer Penentuan Produk dan Segmen Pasar': {
    'Department': 'Pemasaran',
    'Output': [
      'Analisis tren pasar untuk produk pertanian',
      'Laporan segmentasi pasar untuk setiap produk',
      'Rekomendasi pengembangan produk berdasarkan permintaan pasar',
      'Analisis kompetitor untuk setiap segmen produk',
    ],
    'CustomerTypes': [
      'Manajer Pengembangan Produk',
      'Manajer Branding dan Pemasaran',
      'Sales Executive',
    ],
    'KeyTasks': [
      'Melakukan riset pasar dan analisis kompetitor',
      'Mengidentifikasi segmen pasar potensial',
      'Merekomendasikan strategi produk berdasarkan analisis pasar',
      'Memantau tren konsumen dan industri',
      'Berkolaborasi dengan tim pengembangan produk',
    ],
    'BrainstormingQuestions': [
      'Segmen pasar baru apa yang potensial untuk dieksplor?',
      'Bagaimana mengoptimalkan portofolio produk kita?',
      'Tren konsumen apa yang akan mempengaruhi industri kita dalam 5 tahun ke depan?',
      'Bagaimana kita dapat meningkatkan penetrasi pasar untuk produk unggulan?',
    ],
    'keyObjectives': [
      'Mengidentifikasi 2 segmen pasar baru dengan potensial tinggi',
      'Meningkatkan market share produk utama sebesar 10%',
      'Mengusulkan 5 ide produk baru berdasarkan analisis tren pasar',
      'Mengoptimalkan strategi harga untuk meningkatkan profitabilitas 15%',
    ],
    'collaborationTeams': [
      'Tim Riset Pasar',
      'Tim Pengembangan Produk',
      'Tim Analisis Data',
      'Tim Pemasaran Digital',
    ],
    'resources': [
      'Software analisis data pasar',
      'Akses ke laporan industri dan tren konsumen',
      'Budget untuk melakukan survei konsumen',
      'Tim analis pasar',
    ],
    'timeline': '12 bulan, dengan evaluasi kuartalan',
    'expectedOutcome': '2 segmen pasar baru teridentifikasi, peningkatan market share 10%, 5 ide produk baru diusulkan, profitabilitas meningkat 15%.',
  },
  'Manajer Desain Grafis/Kreatif': {
    'Department': 'Kreatif',
    'Output': [
      'Desain kemasan untuk produk utama dan turunan',
      'Materi visual untuk kampanye pemasaran',
      'Infografis tentang manfaat produk',
      'Desain booth untuk pameran pertanian',
    ],
    'CustomerTypes': [
      'Manajer Branding dan Pemasaran',
      'Manajer Pengembangan Produk',
      'Marketing Manager',
    ],
    'KeyTasks': [
      'Mengelola tim desainer grafis',
      'Mengembangkan konsep visual untuk kampanye pemasaran',
      'Memastikan konsistensi desain di seluruh materi pemasaran',
      'Mengikuti tren desain terbaru',
      'Berkolaborasi dengan tim pemasaran dan produk',
    ],
    'BrainstormingQuestions': [
      'Bagaimana kita dapat membuat desain kemasan yang lebih menarik dan fungsional?',
      'Cara mengintegrasikan nilai-nilai merek ke dalam desain visual?',
      'Tren desain apa yang relevan untuk industri pertanian dan makanan?',
      'Bagaimana meningkatkan efektivitas visual dalam komunikasi pemasaran?',
    ],
    'keyObjectives': [
      'Merancang ulang kemasan untuk 5 produk utama',
      'Meningkatkan engagement visual di media sosial sebesar 30%',
      'Mengembangkan panduan gaya visual yang komprehensif',
      'Menciptakan 3 kampanye visual yang viral',
    ],
    'collaborationTeams': [
      'Tim Pemasaran Digital',
      'Tim Pengembangan Produk',
      'Tim Branding',
      'Tim Produksi',
    ],
    'resources': [
      'Software desain grafis terbaru',
      'Perpustakaan aset visual',
      'Perangkat keras untuk prototyping kemasan',
      'Budget untuk kursus pengembangan keterampilan desain',
    ],
    'timeline': '12 bulan, dengan review proyek bulanan',
    'expectedOutcome': '5 desain kemasan baru, peningkatan engagement visual 30%, panduan gaya visual tercipta, 3 kampanye visual viral terlaksana.',
  },
  'Manajer Branding dan Pemasaran': {
    'Department': 'Pemasaran',
    'Output': [
      'Strategi branding untuk lini produk pertanian',
      'Rencana kampanye pemasaran terintegrasi',
      'Laporan kesadaran merek dan persepsi konsumen',
      'Panduan komunikasi merek untuk semua produk',
    ],
    'CustomerTypes': [
      'Konsumen akhir',
      'Distributor dan retailer',
      'Media dan influencer',
    ],
    'KeyTasks': [
      'Mengembangkan dan mengelola strategi branding',
      'Merancang dan mengeksekusi kampanye pemasaran',
      'Mengelola citra merek di semua saluran komunikasi',
      'Menganalisis efektivitas kampanye pemasaran',
      'Berkolaborasi dengan tim kreatif dan pemasaran',
    ],
    'BrainstormingQuestions': [
      'Bagaimana kita dapat meningkatkan persepsi merek di kalangan konsumen muda?',
      'Cara mengintegrasikan nilai keberlanjutan ke dalam branding kita?',
      'Strategi apa yang efektif untuk meningkatkan loyalitas merek?',
      'Bagaimana memanfaatkan teknologi digital untuk memperkuat branding?',
    ],
    'keyObjectives': [
      'Meningkatkan brand awareness sebesar 25%',
      'Meluncurkan 3 kampanye pemasaran terintegrasi yang sukses',
      'Meningkatkan engagement rate di media sosial sebesar 40%',
      'Mengembangkan strategi influencer marketing yang efektif',
    ],
    'collaborationTeams': [
      'Tim Desain Grafis',
      'Tim Digital Marketing',
      'Tim Public Relations',
      'Tim Pengembangan Produk',
    ],
    'resources': [
      'Software analisis media sosial dan brand monitoring',
      'Budget untuk kampanye pemasaran',
      'Akses ke agensi kreatif eksternal',
      'Platform manajemen kampanye pemasaran terpadu',
    ],
    'timeline': '12 bulan, dengan evaluasi kuartalan',
    'expectedOutcome': 'Peningkatan brand awareness 25%, 3 kampanye sukses diluncurkan, peningkatan engagement rate 40%, strategi influencer marketing terlaksana.',
  },
  'Manajer Pengembangan Produk': {
    'Department': 'Riset dan Pengembangan',
    'Output': [
      'Prototipe produk turunan baru',
      'Laporan uji coba produk baru',
      'Analisis kelayakan produk turunan',
      'Spesifikasi teknis untuk setiap produk baru',
    ],
    'CustomerTypes': [
      'Manajer Produksi Pertanian',
      'Manajer Pengolahan dan Nilai Tambah',
      'Manajer Branding dan Pemasaran',
    ],
    'KeyTasks': [
      'Memimpin proses pengembangan produk baru',
      'Melakukan riset pasar untuk ide produk',
      'Mengkoordinasikan uji coba produk',
      'Memastikan produk memenuhi standar kualitas dan regulasi',
      'Berkolaborasi dengan tim produksi dan pemasaran',
    ],
    'BrainstormingQuestions': [
      'Bagaimana kita dapat mengembangkan produk yang lebih berkelanjutan?',
      'Inovasi apa yang bisa kita terapkan pada produk existing?',
      'Bagaimana memanfaatkan teknologi untuk menciptakan produk unik?',
      'Cara mempercepat siklus pengembangan produk tanpa mengorbankan kualitas?',
    ],
    'keyObjectives': [
      'Meluncurkan 3 produk turunan baru yang inovatif dalam setahun',
      'Meningkatkan tingkat keberhasilan produk baru menjadi 70%',
      'Mengurangi waktu pengembangan produk sebesar 20%',
      'Mengembangkan 1 produk berkelanjutan yang mengurangi limbah',
    ],
    'collaborationTeams': [
      'Tim Riset Pasar',
      'Tim Produksi',
      'Tim Quality Control',
      'Tim Pemasaran',
    ],
    'resources': [
      'Laboratorium R&D',
      'Software manajemen proyek pengembangan produk',
      'Budget untuk uji coba dan prototyping',
      'Akses ke database paten dan inovasi industri',
    ],
    'timeline': '12 bulan, dengan milestone kuartalan',
    'expectedOutcome': '3 produk baru diluncurkan, tingkat keberhasilan produk 70%, waktu pengembangan berkurang 20%, 1 produk berkelanjutan diciptakan.',
  },
  'Sales Executive': {
    'Department': 'Penjualan',
    'Output': [
      'Laporan penjualan bulanan per produk',
      'Proposal kerjasama dengan distributor',
      'Analisis performa penjualan produk utama dan turunan',
      'Feedback pasar untuk perbaikan produk',
    ],
    'CustomerTypes': [
      'Distributor',
      'Retailer',
      'Industri pengolahan makanan',
      'Konsumen langsung (B2B)',
    ],
    'KeyTasks': [
      'Mencapai target penjualan bulanan dan tahunan',
      'Mengembangkan dan memelihara hubungan dengan klien',
      'Mengidentifikasi peluang penjualan baru',
      'Melakukan presentasi produk dan negosiasi',
      'Memberikan input untuk strategi harga dan promosi',
    ],
    'BrainstormingQuestions': [
      'Bagaimana meningkatkan retensi pelanggan?',
      'Strategi apa yang efektif untuk penetrasi pasar baru?',
      'Cara meningkatkan cross-selling dan up-selling?',
      'Bagaimana mengoptimalkan proses penjualan dengan teknologi?',
    ],
    'keyObjectives': [
      'Meningkatkan penjualan tahunan sebesar 20%',
      'Menambah 10 klien besar baru dalam setahun',
      'Meningkatkan tingkat retensi pelanggan menjadi 85%',
      'Mencapai target penjualan produk baru sebesar 1 juta unit',
    ],
    'collaborationTeams': [
      'Tim Pemasaran',
      'Tim Pengembangan Produk',
      'Tim Layanan Pelanggan',
      'Tim Logistik',
    ],
    'resources': [
      'CRM software',
      'Katalog produk digital',
      'Alat analisis penjualan',
      'Budget untuk perjalanan dan entertainment klien',
    ],
    'timeline': '12 bulan, dengan review bulanan',
    'expectedOutcome': 'Peningkatan penjualan 20%, 10 klien besar baru, tingkat retensi 85%, target penjualan produk baru tercapai.',
  },
  'Marketing Manager': {
    'Department': 'Pemasaran',
    'Output': [
      'Rencana pemasaran tahunan untuk semua lini produk',
      'Laporan ROI kampanye pemasaran per produk',
      'Strategi penetapan harga untuk produk utama dan turunan',
      'Analisis efektivitas saluran pemasaran per segmen produk',
    ],
    'CustomerTypes': [
      'Konsumen akhir',
      'Distributor dan retailer',
      'Pelanggan B2B',
    ],
    'KeyTasks': [
      'Mengembangkan dan mengimplementasikan strategi pemasaran',
      'Mengelola budget pemasaran',
      'Mengkoordinasikan kampanye pemasaran multi-channel',
      'Menganalisis efektivitas kegiatan pemasaran',
      'Memastikan konsistensi pesan merek di semua platform',
    ],
    'BrainstormingQuestions': [
      'Bagaimana memanfaatkan data pelanggan untuk personalisasi pemasaran?',
      'Strategi content marketing apa yang paling efektif untuk industri kita?',
      'Cara mengoptimalkan customer journey melalui touchpoint digital?',
      'Bagaimana mengintegrasikan sustainability dalam strategi pemasaran?',
    ],
    'keyObjectives': [
      'Meningkatkan brand awareness sebesar 30%',
      'Mencapai ROI pemasaran sebesar 300%',
      'Meningkatkan engagement rate di media sosial sebesar 50%',
      'Meluncurkan 2 kampanye viral yang sukses',
    ],
    'collaborationTeams': [
      'Tim Branding',
      'Tim Sales',
      'Tim Digital Marketing',
      'Tim Pengembangan Produk',
    ],
    'resources': [
      'Marketing automation software',
      'Analytics tools',
      'Budget untuk iklan digital dan tradisional',
      'Akses ke agensi kreatif dan PR',
    ],
    'timeline': '12 bulan, dengan evaluasi kuartalan',
    'expectedOutcome': 'Brand awareness meningkat 30%, ROI pemasaran 300%, engagement rate naik 50%, 2 kampanye viral sukses.',
  },
  // Tambahkan data default lainnya di sini...
};

Map<String, String> promptMap = {
  "role": "Posisi atau jabatan yang bertanggung jawab atas tugas-tugas ini.",
  "Department": "Departemen tempat peran tersebut berada.",
  "Output": "Hasil akhir yang diharapkan dari peran ini.",
  "CustomerTypes": "Jenis pelanggan yang menjadi target utama.",
  "KeyTasks": "Tugas utama yang harus diselesaikan untuk mencapai tujuan.",
  "BrainstormingQuestions": "Pertanyaan untuk memicu ide kreatif dan solusi.",
  "BookInsights": "Wawasan dari buku-buku yang relevan sebagai panduan.",
  "mainProducts": "Produk utama yang menjadi fokus.",
  "derivedProducts": "Produk turunan yang perlu dipertimbangkan.",
  "keyObjectives": "Tujuan utama yang harus dicapai.",
  "collaborationTeams": "Tim yang perlu diajak bekerja sama.",
  "resources": "Sumber daya yang tersedia untuk mendukung tugas.",
  "timeline": "Waktu yang ditetapkan untuk penyelesaian tugas.",
  "expectedOutcome": "Hasil yang diharapkan dari peran ini.",
};

Map datapenjelasPromp = {
  "Department": 'department',
  "Output": '''
Output yang diharapkan dari peran Anda meliputi:
    ''',
  "CustomerTypes": '''
Fokus pada jenis pelanggan berikut:
    ''',
  "KeyTasks": '''
Tugas utama yang perlu Anda fokuskan meliputi:
    ''',
  "BrainstormingQuestions": '''
Gunakan pertanyaan-pertanyaan berikut untuk memandu proses brainstorming dan mengembangkan ide-ide inovatif:
    ''',
  "BookInsights": '''
Pertimbangkan wawasan berikut dari buku-buku relevan untuk memperkaya pendekatan Anda:
 ''',
  "mainProducts": '''
Fokuskan upaya Anda pada pengembangan dan implementasi strategi komprehensif untuk produk hasil pertanian berikut:
  - Produk utama:
    ''',
  "derivedProducts": '''
Produk turunan:
    ''',
  "keyObjectives": '''
Anda bertanggung jawab untuk mencapai tujuan utama berikut:
    ''',
  "collaborationTeams": '''
Untuk mencapai tujuan tersebut, Anda harus bekerja sama dengan tim-tim berikut:
    ''',
  "resources": '''
Anda memiliki akses ke sumber daya berikut yang dapat membantu dalam pelaksanaan tugas:
    ''',
  "timeline": '''
Penyelesaian tugas ini diharapkan sesuai dengan timeline berikut: 
    ''',
  "expectedOutcome": '''
Hasil yang diharapkan dari peran Anda adalah:
    ''',
};

List<BookReference> books = [];

Map<String, List<BookReference>> roleBooks =  {
  // 1. Produksi Pertanian: Awal dari rantai nilai agribisnis
  "Manajer Produksi": [
    BookReference(
      title: "Principles of Agronomy",
      author: "T. Yellamanda Reddy dan G.H. Sankara Reddi",
      year: "2016",
      keyInsights: [
        "Teknik budidaya tanaman yang efisien",
        "Manajemen sumber daya pertanian",
        "Optimalisasi produksi tanaman"
      ],
    ),
    BookReference(
      title: "Postharvest Technology of Fruits and Vegetables",
      author: "Sudheer K.P. dan V. Indira",
      year: "2007",
      keyInsights: [
        "Teknik penanganan pascapanen",
        "Metode penyimpanan dan pengawetan hasil pertanian",
        "Manajemen kualitas produk pertanian"
      ],
    ),
  ],

  // 2. Pengolahan dan Nilai Tambah: Meningkatkan nilai produk pertanian
  "Manajer Pengolahan dan Nilai Tambah": [
    BookReference(
      title: "Food Processing Technology: Principles and Practice",
      author: "P.J. Fellows",
      year: "2017",
      keyInsights: [
        "Teknik pengolahan pangan modern",
        "Inovasi dalam pengolahan produk pertanian",
        "Manajemen kualitas dan keamanan pangan"
      ],
    ),
    BookReference(
      title: "Value Addition of Horticultural Crops: Recent Trends and Future Directions",
      author: "Amit Baran Sharangi dan Suchand Datta",
      year: "2015",
      keyInsights: [
        "Strategi peningkatan nilai tambah produk hortikultura",
        "Pengembangan produk inovatif",
        "Tren pasar dan peluang nilai tambah"
      ],
    ),
  ],

  // 3. Pemasaran: Mengembangkan strategi untuk memposisikan produk di pasar
  "Marketing Manager": [
    BookReference(
      title: "Kotler on Marketing",
      author: "Philip Kotler",
      year: "1999",
      keyInsights: [
        "Strategi pemasaran komprehensif",
        "Segmentasi pasar dan positioning produk",
        "Pengembangan merek yang kuat"
      ],
    ),
    BookReference(
      title: "Positioning: The Battle for Your Mind",
      author: "Al Ries dan Jack Trout",
      year: "2001",
      keyInsights: [
        "Konsep positioning dalam pemasaran",
        "Strategi untuk membedakan produk di pasar yang ramai",
        "Teknik komunikasi pemasaran yang efektif"
      ],
    ),
  ],

  // 4. Penjualan: Mengeksekusi strategi pemasaran dan menjual produk ke pelanggan
  "Sales Executive": [
    BookReference(
      title: "The Challenger Sale",
      author: "Matthew Dixon dan Brent Adamson",
      year: "2011",
      keyInsights: [
        "Pendekatan 'challenger' dalam penjualan",
        "Memberikan wawasan baru kepada pelanggan",
        "Strategi untuk mengambil kendali percakapan penjualan"
      ],
    ),
    BookReference(
      title: "SPIN Selling",
      author: "Neil Rackham",
      year: "1988",
      keyInsights: [
        "Teknik SPIN (Situation, Problem, Implication, Need-payoff)",
        "Pentingnya pertanyaan yang efektif dalam proses penjualan",
        "Pendekatan sistematis untuk memahami kebutuhan pelanggan"
      ],
    ),
  ],
  // Tambahkan role baru ke dalam Map roleBooks
  "Manajer Branding dan Pemasaran" : [
    BookReference(
      title: "Building Strong Brands",
      author: "David A. Aaker",
      year: "2011",
      keyInsights: [
        "Strategi membangun ekuitas merek",
        "Menciptakan identitas merek yang kuat",
        "Mengukur dan mengelola nilai merek"
      ],
    ),
    BookReference(
      title: "Digital Marketing Strategy",
      author: "Simon Kingsnorth",
      year: "2019",
      keyInsights: [
        "Perencanaan strategi pemasaran digital",
        "Integrasi berbagai saluran pemasaran",
        "Analisis dan optimisasi kampanye digital"
      ],
    ),
  ],
  "Manajer Pengembangan Produk": [
    BookReference(
      title: "The Innovator's Dilemma",
      author: "Clayton M. Christensen",
      year: "2016",
      keyInsights: [
        "Mengelola inovasi disruptif",
        "Mengantisipasi perubahan pasar",
        "Strategi pengembangan produk berkelanjutan"
      ],
    ),
    BookReference(
      title: "Inspired: How to Create Tech Products Customers Love",
      author: "Marty Cagan",
      year: "2017",
      keyInsights: [
        "Proses pengembangan produk yang efektif",
        "Teknik validasi ide produk",
        "Kolaborasi lintas departemen dalam pengembangan produk"
      ],
    ),
  ],
  "Manajer Desain Grafis/Kreatif": [
    BookReference(
      title: "Graphic Design: The New Basics",
      author: "Ellen Lupton dan Jennifer Cole Phillips",
      year: "2015",
      keyInsights: [
        "Prinsip-prinsip dasar desain grafis",
        "Teori warna dan komposisi",
        "Teknik visualisasi informasi"
      ],
    ),
    BookReference(
      title: "Brand Identity Essentials",
      author: "Kevin Budelmann, Yang Kim, dan Curt Wozniak",
      year: "2010",
      keyInsights: [
        "Strategi pengembangan identitas merek",
        "Implementasi desain di berbagai media",
        "Konsistensi visual dalam branding"
      ],
    ),
  ],
};

List<SavedPrompt> savedPrompts = [];

List dataAiDefault = [{},{
  'Manajer Produksi': {
    'Department': 'Produksi',
    'Output': [
      'Laporan hasil panen bulanan',
      'Analisis efisiensi produksi pertanian',
      'Rencana rotasi tanaman tahunan',
      'Laporan penggunaan sumber daya (air, pupuk, dll)',
    ],
    'CustomerTypes': [
      'Manajer Pengolahan dan Nilai Tambah',
      'Manajer Penentuan Produk dan Segmen Pasar',
      'Distributor bahan baku pertanian',
    ],
    'KeyTasks': [
      'Mengoptimalkan proses produksi pertanian',
      'Mengimplementasikan teknologi pertanian modern',
      'Mengelola jadwal tanam dan panen',
      'Memastikan kualitas hasil pertanian',
      'Mengawasi kepatuhan terhadap standar keamanan pangan',
    ],
    'BrainstormingQuestions': [
      'Bagaimana meningkatkan hasil panen tanpa mengorbankan kualitas?',
      'Apa inovasi terbaru dalam teknologi pertanian yang dapat diterapkan?',
      'Cara terbaik mengurangi dampak lingkungan dari praktik pertanian?',
      'Bagaimana mengoptimalkan penggunaan lahan pertanian?',
    ],
    'keyObjectives': [
      'Meningkatkan produktivitas lahan sebesar 15% dalam satu tahun',
      'Mengurangi penggunaan pestisida kimia sebesar 30%',
      'Mengimplementasikan sistem irigasi presisi',
      'Mencapai sertifikasi Good Agricultural Practices (GAP)',
    ],
    'collaborationTeams': [
      'Tim Penelitian dan Pengembangan',
      'Tim Logistik dan Rantai Pasok',
      'Tim Manajemen Kualitas',
      'Tim Keberlanjutan Lingkungan',
    ],
    'resources': [
      'Sistem manajemen pertanian terpadu berbasis teknologi',
      'Laboratorium pengujian kualitas tanah dan hasil panen',
      'Peralatan pertanian modern dan sistem otomasi',
      'Database pengetahuan pertanian dan cuaca',
    ],
    'timeline': '12 bulan, dengan evaluasi triwulanan',
    'expectedOutcome': 'Peningkatan produktivitas 15%, pengurangan biaya 10%, 100% sertifikasi GAP, mempertahankan kualitas dan keberlanjutan.',
  },
  'Manajer Pengolahan dan Nilai Tambah': {
    'Department': 'Produksi',
    'Output': [
      'Laporan efisiensi pengolahan produk',
      'Analisis kualitas produk olahan',
      'Proposal pengembangan produk turunan baru',
      'SOP proses pengolahan untuk setiap produk',
    ],
    'CustomerTypes': [
      'Manajer Penentuan Produk dan Segmen Pasar',
      'Manajer Branding dan Pemasaran',
      'Distributor produk olahan',
    ],
    'KeyTasks': [
      'Mengoptimalkan proses pengolahan hasil pertanian',
      'Mengembangkan produk nilai tambah baru',
      'Mengelola kualitas produk olahan',
      'Mengimplementasikan teknologi pengolahan terbaru',
      'Memastikan kepatuhan terhadap standar keamanan pangan',
    ],
    'BrainstormingQuestions': [
      'Bagaimana meningkatkan efisiensi proses pengolahan?',
      'Produk nilai tambah apa yang potensial untuk dikembangkan?',
      'Cara mengurangi limbah dalam proses pengolahan?',
      'Teknologi pengolahan terbaru apa yang dapat diimplementasikan?',
    ],
    'keyObjectives': [
      'Meningkatkan efisiensi pengolahan sebesar 20%',
      'Mengembangkan 3 produk nilai tambah baru dalam setahun',
      'Mengurangi limbah pengolahan sebesar 25%',
      'Mencapai sertifikasi ISO 22000 untuk manajemen keamanan pangan',
    ],
    'collaborationTeams': [
      'Tim Penelitian dan Pengembangan Produk',
      'Tim Kontrol Kualitas',
      'Tim Manajemen Rantai Pasok',
      'Tim Pemasaran',
    ],
    'resources': [
      'Fasilitas pengolahan modern',
      'Laboratorium pengujian kualitas produk',
      'Software manajemen proses pengolahan',
      'Tim ahli teknologi pangan',
    ],
    'timeline': '12 bulan, dengan review bulanan',
    'expectedOutcome': 'Peningkatan efisiensi 20%, 3 produk baru diluncurkan, pengurangan limbah 25%, sertifikasi ISO 22000 tercapai.',
  },
  'Manajer Penentuan Produk dan Segmen Pasar': {
    'Department': 'Pemasaran',
    'Output': [
      'Analisis tren pasar untuk produk pertanian',
      'Laporan segmentasi pasar untuk setiap produk',
      'Rekomendasi pengembangan produk berdasarkan permintaan pasar',
      'Analisis kompetitor untuk setiap segmen produk',
    ],
    'CustomerTypes': [
      'Manajer Pengembangan Produk',
      'Manajer Branding dan Pemasaran',
      'Sales Executive',
    ],
    'KeyTasks': [
      'Melakukan riset pasar dan analisis kompetitor',
      'Mengidentifikasi segmen pasar potensial',
      'Merekomendasikan strategi produk berdasarkan analisis pasar',
      'Memantau tren konsumen dan industri',
      'Berkolaborasi dengan tim pengembangan produk',
    ],
    'BrainstormingQuestions': [
      'Segmen pasar baru apa yang potensial untuk dieksplor?',
      'Bagaimana mengoptimalkan portofolio produk kita?',
      'Tren konsumen apa yang akan mempengaruhi industri kita dalam 5 tahun ke depan?',
      'Bagaimana kita dapat meningkatkan penetrasi pasar untuk produk unggulan?',
    ],
    'keyObjectives': [
      'Mengidentifikasi 2 segmen pasar baru dengan potensial tinggi',
      'Meningkatkan market share produk utama sebesar 10%',
      'Mengusulkan 5 ide produk baru berdasarkan analisis tren pasar',
      'Mengoptimalkan strategi harga untuk meningkatkan profitabilitas 15%',
    ],
    'collaborationTeams': [
      'Tim Riset Pasar',
      'Tim Pengembangan Produk',
      'Tim Analisis Data',
      'Tim Pemasaran Digital',
    ],
    'resources': [
      'Software analisis data pasar',
      'Akses ke laporan industri dan tren konsumen',
      'Budget untuk melakukan survei konsumen',
      'Tim analis pasar',
    ],
    'timeline': '12 bulan, dengan evaluasi kuartalan',
    'expectedOutcome': '2 segmen pasar baru teridentifikasi, peningkatan market share 10%, 5 ide produk baru diusulkan, profitabilitas meningkat 15%.',
  },
  'Manajer Desain Grafis/Kreatif': {
    'Department': 'Kreatif',
    'Output': [
      'Desain kemasan untuk produk utama dan turunan',
      'Materi visual untuk kampanye pemasaran',
      'Infografis tentang manfaat produk',
      'Desain booth untuk pameran pertanian',
    ],
    'CustomerTypes': [
      'Manajer Branding dan Pemasaran',
      'Manajer Pengembangan Produk',
      'Marketing Manager',
    ],
    'KeyTasks': [
      'Mengelola tim desainer grafis',
      'Mengembangkan konsep visual untuk kampanye pemasaran',
      'Memastikan konsistensi desain di seluruh materi pemasaran',
      'Mengikuti tren desain terbaru',
      'Berkolaborasi dengan tim pemasaran dan produk',
    ],
    'BrainstormingQuestions': [
      'Bagaimana kita dapat membuat desain kemasan yang lebih menarik dan fungsional?',
      'Cara mengintegrasikan nilai-nilai merek ke dalam desain visual?',
      'Tren desain apa yang relevan untuk industri pertanian dan makanan?',
      'Bagaimana meningkatkan efektivitas visual dalam komunikasi pemasaran?',
    ],
    'keyObjectives': [
      'Merancang ulang kemasan untuk 5 produk utama',
      'Meningkatkan engagement visual di media sosial sebesar 30%',
      'Mengembangkan panduan gaya visual yang komprehensif',
      'Menciptakan 3 kampanye visual yang viral',
    ],
    'collaborationTeams': [
      'Tim Pemasaran Digital',
      'Tim Pengembangan Produk',
      'Tim Branding',
      'Tim Produksi',
    ],
    'resources': [
      'Software desain grafis terbaru',
      'Perpustakaan aset visual',
      'Perangkat keras untuk prototyping kemasan',
      'Budget untuk kursus pengembangan keterampilan desain',
    ],
    'timeline': '12 bulan, dengan review proyek bulanan',
    'expectedOutcome': '5 desain kemasan baru, peningkatan engagement visual 30%, panduan gaya visual tercipta, 3 kampanye visual viral terlaksana.',
  },
  'Manajer Branding dan Pemasaran': {
    'Department': 'Pemasaran',
    'Output': [
      'Strategi branding untuk lini produk pertanian',
      'Rencana kampanye pemasaran terintegrasi',
      'Laporan kesadaran merek dan persepsi konsumen',
      'Panduan komunikasi merek untuk semua produk',
    ],
    'CustomerTypes': [
      'Konsumen akhir',
      'Distributor dan retailer',
      'Media dan influencer',
    ],
    'KeyTasks': [
      'Mengembangkan dan mengelola strategi branding',
      'Merancang dan mengeksekusi kampanye pemasaran',
      'Mengelola citra merek di semua saluran komunikasi',
      'Menganalisis efektivitas kampanye pemasaran',
      'Berkolaborasi dengan tim kreatif dan pemasaran',
    ],
    'BrainstormingQuestions': [
      'Bagaimana kita dapat meningkatkan persepsi merek di kalangan konsumen muda?',
      'Cara mengintegrasikan nilai keberlanjutan ke dalam branding kita?',
      'Strategi apa yang efektif untuk meningkatkan loyalitas merek?',
      'Bagaimana memanfaatkan teknologi digital untuk memperkuat branding?',
    ],
    'keyObjectives': [
      'Meningkatkan brand awareness sebesar 25%',
      'Meluncurkan 3 kampanye pemasaran terintegrasi yang sukses',
      'Meningkatkan engagement rate di media sosial sebesar 40%',
      'Mengembangkan strategi influencer marketing yang efektif',
    ],
    'collaborationTeams': [
      'Tim Desain Grafis',
      'Tim Digital Marketing',
      'Tim Public Relations',
      'Tim Pengembangan Produk',
    ],
    'resources': [
      'Software analisis media sosial dan brand monitoring',
      'Budget untuk kampanye pemasaran',
      'Akses ke agensi kreatif eksternal',
      'Platform manajemen kampanye pemasaran terpadu',
    ],
    'timeline': '12 bulan, dengan evaluasi kuartalan',
    'expectedOutcome': 'Peningkatan brand awareness 25%, 3 kampanye sukses diluncurkan, peningkatan engagement rate 40%, strategi influencer marketing terlaksana.',
  },
  'Manajer Pengembangan Produk': {
    'Department': 'Riset dan Pengembangan',
    'Output': [
      'Prototipe produk turunan baru',
      'Laporan uji coba produk baru',
      'Analisis kelayakan produk turunan',
      'Spesifikasi teknis untuk setiap produk baru',
    ],
    'CustomerTypes': [
      'Manajer Produksi Pertanian',
      'Manajer Pengolahan dan Nilai Tambah',
      'Manajer Branding dan Pemasaran',
    ],
    'KeyTasks': [
      'Memimpin proses pengembangan produk baru',
      'Melakukan riset pasar untuk ide produk',
      'Mengkoordinasikan uji coba produk',
      'Memastikan produk memenuhi standar kualitas dan regulasi',
      'Berkolaborasi dengan tim produksi dan pemasaran',
    ],
    'BrainstormingQuestions': [
      'Bagaimana kita dapat mengembangkan produk yang lebih berkelanjutan?',
      'Inovasi apa yang bisa kita terapkan pada produk existing?',
      'Bagaimana memanfaatkan teknologi untuk menciptakan produk unik?',
      'Cara mempercepat siklus pengembangan produk tanpa mengorbankan kualitas?',
    ],
    'keyObjectives': [
      'Meluncurkan 3 produk turunan baru yang inovatif dalam setahun',
      'Meningkatkan tingkat keberhasilan produk baru menjadi 70%',
      'Mengurangi waktu pengembangan produk sebesar 20%',
      'Mengembangkan 1 produk berkelanjutan yang mengurangi limbah',
    ],
    'collaborationTeams': [
      'Tim Riset Pasar',
      'Tim Produksi',
      'Tim Quality Control',
      'Tim Pemasaran',
    ],
    'resources': [
      'Laboratorium R&D',
      'Software manajemen proyek pengembangan produk',
      'Budget untuk uji coba dan prototyping',
      'Akses ke database paten dan inovasi industri',
    ],
    'timeline': '12 bulan, dengan milestone kuartalan',
    'expectedOutcome': '3 produk baru diluncurkan, tingkat keberhasilan produk 70%, waktu pengembangan berkurang 20%, 1 produk berkelanjutan diciptakan.',
  },
  'Sales Executive': {
    'Department': 'Penjualan',
    'Output': [
      'Laporan penjualan bulanan per produk',
      'Proposal kerjasama dengan distributor',
      'Analisis performa penjualan produk utama dan turunan',
      'Feedback pasar untuk perbaikan produk',
    ],
    'CustomerTypes': [
      'Distributor',
      'Retailer',
      'Industri pengolahan makanan',
      'Konsumen langsung (B2B)',
    ],
    'KeyTasks': [
      'Mencapai target penjualan bulanan dan tahunan',
      'Mengembangkan dan memelihara hubungan dengan klien',
      'Mengidentifikasi peluang penjualan baru',
      'Melakukan presentasi produk dan negosiasi',
      'Memberikan input untuk strategi harga dan promosi',
    ],
    'BrainstormingQuestions': [
      'Bagaimana meningkatkan retensi pelanggan?',
      'Strategi apa yang efektif untuk penetrasi pasar baru?',
      'Cara meningkatkan cross-selling dan up-selling?',
      'Bagaimana mengoptimalkan proses penjualan dengan teknologi?',
    ],
    'keyObjectives': [
      'Meningkatkan penjualan tahunan sebesar 20%',
      'Menambah 10 klien besar baru dalam setahun',
      'Meningkatkan tingkat retensi pelanggan menjadi 85%',
      'Mencapai target penjualan produk baru sebesar 1 juta unit',
    ],
    'collaborationTeams': [
      'Tim Pemasaran',
      'Tim Pengembangan Produk',
      'Tim Layanan Pelanggan',
      'Tim Logistik',
    ],
    'resources': [
      'CRM software',
      'Katalog produk digital',
      'Alat analisis penjualan',
      'Budget untuk perjalanan dan entertainment klien',
    ],
    'timeline': '12 bulan, dengan review bulanan',
    'expectedOutcome': 'Peningkatan penjualan 20%, 10 klien besar baru, tingkat retensi 85%, target penjualan produk baru tercapai.',
  },
  'Marketing Manager': {
    'Department': 'Pemasaran',
    'Output': [
      'Rencana pemasaran tahunan untuk semua lini produk',
      'Laporan ROI kampanye pemasaran per produk',
      'Strategi penetapan harga untuk produk utama dan turunan',
      'Analisis efektivitas saluran pemasaran per segmen produk',
    ],
    'CustomerTypes': [
      'Konsumen akhir',
      'Distributor dan retailer',
      'Pelanggan B2B',
    ],
    'KeyTasks': [
      'Mengembangkan dan mengimplementasikan strategi pemasaran',
      'Mengelola budget pemasaran',
      'Mengkoordinasikan kampanye pemasaran multi-channel',
      'Menganalisis efektivitas kegiatan pemasaran',
      'Memastikan konsistensi pesan merek di semua platform',
    ],
    'BrainstormingQuestions': [
      'Bagaimana memanfaatkan data pelanggan untuk personalisasi pemasaran?',
      'Strategi content marketing apa yang paling efektif untuk industri kita?',
      'Cara mengoptimalkan customer journey melalui touchpoint digital?',
      'Bagaimana mengintegrasikan sustainability dalam strategi pemasaran?',
    ],
    'keyObjectives': [
      'Meningkatkan brand awareness sebesar 30%',
      'Mencapai ROI pemasaran sebesar 300%',
      'Meningkatkan engagement rate di media sosial sebesar 50%',
      'Meluncurkan 2 kampanye viral yang sukses',
    ],
    'collaborationTeams': [
      'Tim Branding',
      'Tim Sales',
      'Tim Digital Marketing',
      'Tim Pengembangan Produk',
    ],
    'resources': [
      'Marketing automation software',
      'Analytics tools',
      'Budget untuk iklan digital dan tradisional',
      'Akses ke agensi kreatif dan PR',
    ],
    'timeline': '12 bulan, dengan evaluasi kuartalan',
    'expectedOutcome': 'Brand awareness meningkat 30%, ROI pemasaran 300%, engagement rate naik 50%, 2 kampanye viral sukses.',
  },
  // Tambahkan data default lainnya di sini...
},
  {
    'Manajer Produksi': {
      'Department': 'Produksi',
      'Output': [
        'Laporan hasil produksi bulanan',
        'Analisis efisiensi produksi',
        'Rencana rotasi pemeliharaan mesin/peralatan',
        'Laporan penggunaan sumber daya (bahan baku, energi, dll)',
      ],
      'CustomerTypes': [
        'Manajer Pengolahan dan Nilai Tambah',
        'Manajer Penentuan Produk dan Segmen Pasar',
        'Distributor produk',
      ],
      'KeyTasks': [
        'Mengoptimalkan proses produksi',
        'Mengimplementasikan teknologi produksi modern',
        'Mengelola jadwal produksi dan pemeliharaan',
        'Memastikan kualitas produk yang dihasilkan',
        'Mengawasi kepatuhan terhadap standar keamanan produk',
      ],
      'BrainstormingQuestions': [
        'Bagaimana meningkatkan hasil produksi tanpa mengorbankan kualitas?',
        'Apa inovasi terbaru dalam teknologi produksi?',
        'Cara terbaik mengurangi dampak lingkungan dari praktik produksi?',
        'Bagaimana mengoptimalkan penggunaan bahan baku dan sumber daya lainnya?',
      ],
      'keyObjectives': [
        'Meningkatkan produktivitas sebesar 15% dalam satu tahun',
        'Mengurangi penggunaan bahan baku sintetis sebesar 30%',
        'Mengimplementasikan sistem pemantauan kualitas produk',
        'Mencapai sertifikasi industri relevan',
      ],
      'collaborationTeams': [
        'Tim Penelitian dan Pengembangan',
        'Tim Logistik dan Rantai Pasok',
        'Tim Manajemen Kualitas',
        'Tim Keberlanjutan Lingkungan',
      ],
      'resources': [
        'Sistem manajemen produksi berbasis teknologi',
        'Laboratorium pengujian kualitas produk',
        'Peralatan produksi modern dan sistem otomasi',
        'Database pengetahuan tentang bahan baku dan teknologi produksi',
      ],
      'timeline': '12 bulan, dengan evaluasi triwulanan',
      'expectedOutcome': 'Peningkatan produktivitas 15%, pengurangan biaya 10%, sertifikasi industri tercapai, mempertahankan kualitas dan keberlanjutan.',
    },
    'Manajer Pengolahan dan Nilai Tambah': {
      'Department': 'Produksi',
      'Output': [
        'Laporan efisiensi pengolahan produk',
        'Analisis kualitas produk olahan',
        'Proposal pengembangan produk turunan baru',
        'SOP proses pengolahan untuk setiap produk',
      ],
      'CustomerTypes': [
        'Manajer Penentuan Produk dan Segmen Pasar',
        'Manajer Branding dan Pemasaran',
        'Distributor produk olahan',
      ],
      'KeyTasks': [
        'Mengoptimalkan proses pengolahan produk',
        'Mengembangkan produk nilai tambah',
        'Mengelola kualitas produk olahan',
        'Mengimplementasikan teknologi pengolahan terbaru',
        'Memastikan kepatuhan terhadap standar keamanan produk',
      ],
      'BrainstormingQuestions': [
        'Bagaimana meningkatkan efisiensi proses pengolahan produk?',
        'Produk nilai tambah apa yang potensial untuk dikembangkan?',
        'Cara mengurangi limbah dalam proses pengolahan?',
        'Teknologi pengolahan terbaru apa yang dapat diterapkan pada produk?',
      ],
      'keyObjectives': [
        'Meningkatkan efisiensi pengolahan sebesar 20%',
        'Mengembangkan 3 produk nilai tambah baru dalam setahun',
        'Mengurangi limbah pengolahan sebesar 25%',
        'Mencapai sertifikasi industri relevan untuk manajemen keamanan produk',
      ],
      'collaborationTeams': [
        'Tim Penelitian dan Pengembangan Produk',
        'Tim Kontrol Kualitas',
        'Tim Manajemen Rantai Pasok',
        'Tim Pemasaran',
      ],
      'resources': [
        'Fasilitas pengolahan modern',
        'Laboratorium pengujian kualitas produk',
        'Software manajemen proses pengolahan',
        'Tim ahli teknologi pengolahan',
      ],
      'timeline': '12 bulan, dengan review bulanan',
      'expectedOutcome': 'Peningkatan efisiensi 20%, 3 produk baru diluncurkan, pengurangan limbah 25%, sertifikasi industri relevan tercapai.',
    },
    'Manajer Penentuan Produk dan Segmen Pasar': {
      'Department': 'Pemasaran',
      'Output': [
        'Analisis tren pasar untuk produk',
        'Laporan segmentasi pasar',
        'Rekomendasi pengembangan produk berdasarkan permintaan pasar',
        'Analisis kompetitor untuk produk',
      ],
      'CustomerTypes': [
        'Manajer Pengembangan Produk',
        'Manajer Branding dan Pemasaran',
        'Sales Executive',
      ],
      'KeyTasks': [
        'Melakukan riset pasar dan analisis kompetitor',
        'Mengidentifikasi segmen pasar potensial',
        'Merekomendasikan strategi produk berdasarkan analisis pasar',
        'Memantau tren konsumen dan industri',
        'Berkolaborasi dengan tim pengembangan produk',
      ],
      'BrainstormingQuestions': [
        'Segmen pasar baru apa yang potensial?',
        'Bagaimana mengoptimalkan portofolio produk?',
        'Tren konsumen apa yang akan mempengaruhi industri dalam 5 tahun ke depan?',
        'Bagaimana kita dapat meningkatkan penetrasi pasar?',
      ],
      'keyObjectives': [
        'Mengidentifikasi 2 segmen pasar baru dengan potensial tinggi',
        'Meningkatkan market share sebesar 10%',
        'Mengusulkan 5 ide produk baru berdasarkan analisis tren pasar',
        'Mengoptimalkan strategi harga untuk meningkatkan profitabilitas 15%',
      ],
      'collaborationTeams': [
        'Tim Riset Pasar',
        'Tim Pengembangan Produk',
        'Tim Analisis Data',
        'Tim Pemasaran Digital',
      ],
      'resources': [
        'Software analisis data pasar',
        'Akses ke laporan industri dan tren konsumen',
        'Budget untuk melakukan survei konsumen',
        'Tim analis pasar',
      ],
      'timeline': '12 bulan, dengan evaluasi kuartalan',
      'expectedOutcome': '2 segmen pasar baru teridentifikasi, peningkatan market share 10%, 5 ide produk baru diusulkan, profitabilitas meningkat 15%.',
    },
    'Manajer Desain Grafis/Kreatif': {
      'Department': 'Kreatif',
      'Output': [
        'Desain kemasan untuk produk',
        'Materi visual untuk kampanye pemasaran',
        'Infografis tentang manfaat produk',
        'Desain booth untuk pameran produk',
      ],
      'CustomerTypes': [
        'Manajer Branding dan Pemasaran',
        'Manajer Pengembangan Produk',
        'Marketing Manager',
      ],
      'KeyTasks': [
        'Mengelola tim desainer grafis',
        'Mengembangkan konsep visual untuk kampanye pemasaran',
        'Memastikan konsistensi desain di seluruh materi pemasaran',
        'Mengikuti tren desain terbaru untuk kemasan dan materi pemasaran',
        'Berkolaborasi dengan tim pemasaran dan produk',
      ],
      'BrainstormingQuestions': [
        'Bagaimana kita dapat membuat desain kemasan yang lebih menarik dan fungsional?',
        'Cara mengintegrasikan nilai-nilai merek ke dalam desain visual produk?',
        'Tren desain apa yang relevan untuk kemasan produk?',
        'Bagaimana meningkatkan efektivitas visual dalam komunikasi pemasaran?',
      ],
      'keyObjectives': [
        'Merancang ulang kemasan untuk 5 produk utama',
        'Meningkatkan engagement visual di media sosial sebesar 30%',
        'Mengembangkan panduan gaya visual yang komprehensif untuk produk',
        'Menciptakan 3 kampanye visual yang viral',
      ],
      'collaborationTeams': [
        'Tim Pemasaran Digital',
        'Tim Pengembangan Produk',
        'Tim Branding',
        'Tim Produksi',
      ],
      'resources': [
        'Software desain grafis terbaru',
        'Perpustakaan aset visual',
        'Perangkat keras untuk prototyping kemasan',
        'Budget untuk kursus pengembangan keterampilan desain',
      ],
      'timeline': '12 bulan, dengan review proyek bulanan',
      'expectedOutcome': '5 desain kemasan baru, peningkatan engagement visual 30%, panduan gaya visual tercipta, 3 kampanye visual viral terlaksana.',
    },
    'Manajer Branding dan Pemasaran': {
      'Department': 'Pemasaran',
      'Output': [
        'Strategi branding untuk produk',
        'Rencana kampanye pemasaran terintegrasi',
        'Laporan kesadaran merek dan persepsi konsumen',
        'Panduan komunikasi merek untuk produk',
      ],
      'CustomerTypes': [
        'Konsumen akhir',
        'Distributor dan retailer',
        'Media dan influencer',
      ],
      'KeyTasks': [
        'Mengembangkan dan melaksanakan strategi branding',
        'Mengelola kampanye pemasaran terintegrasi',
        'Memantau dan menganalisis persepsi merek dan efektivitas kampanye',
        'Berkoordinasi dengan tim kreatif untuk menciptakan materi pemasaran',
        'Mengelola citra merek di semua saluran komunikasi',
      ],
      'BrainstormingQuestions': [
        'Bagaimana kita dapat meningkatkan persepsi merek di kalangan konsumen?',
        'Cara mengintegrasikan nilai keberlanjutan dalam branding produk?',
        'Strategi apa yang efektif untuk meningkatkan loyalitas merek?',
        'Bagaimana memanfaatkan teknologi digital untuk memperkuat branding produk?',
      ],
      'keyObjectives': [
        'Meningkatkan brand awareness sebesar 25%',
        'Meluncurkan 3 kampanye pemasaran terintegrasi yang sukses',
        'Meningkatkan engagement rate di media sosial sebesar 40%',
        'Mengembangkan strategi influencer marketing yang efektif',
      ],
      'collaborationTeams': [
        'Tim Desain Grafis',
        'Tim Digital Marketing',
        'Tim Public Relations',
        'Tim Pengembangan Produk',
      ],
      'resources': [
        'Software analisis media sosial dan brand monitoring',
        'Budget untuk kampanye pemasaran',
        'Akses ke agensi kreatif eksternal',
        'Platform manajemen kampanye pemasaran terpadu',
      ],
      'timeline': '12 bulan, dengan evaluasi kuartalan',
      'expectedOutcome': 'Peningkatan brand awareness 25%, 3 kampanye pemasaran sukses diluncurkan, peningkatan engagement rate 40%, strategi influencer marketing terlaksana.',
    },
    'Manajer Pengembangan Produk': {
      'Department': 'Riset dan Pengembangan',
      'Output': [
        'Prototipe produk turunan baru',
        'Laporan uji coba produk baru',
        'Analisis kelayakan produk turunan',
        'Spesifikasi teknis untuk setiap produk baru',
      ],
      'CustomerTypes': [
        'Manajer Produksi',
        'Manajer Pengolahan dan Nilai Tambah',
        'Manajer Branding dan Pemasaran',
      ],
      'KeyTasks': [
        'Memimpin proses pengembangan produk baru',
        'Melakukan riset pasar untuk ide produk',
        'Mengkoordinasikan uji coba produk baru',
        'Memastikan produk memenuhi standar kualitas dan regulasi',
        'Berkolaborasi dengan tim produksi dan pemasaran',
      ],
      'BrainstormingQuestions': [
        'Bagaimana kita dapat mengembangkan produk baru yang inovatif?',
        'Inovasi apa yang bisa kita terapkan pada produk existing?',
        'Bagaimana memanfaatkan teknologi untuk menciptakan produk yang unik?',
        'Cara mempercepat siklus pengembangan produk tanpa mengorbankan kualitas?',
      ],
      'keyObjectives': [
        'Meluncurkan 3 produk turunan baru yang inovatif dalam setahun',
        'Meningkatkan tingkat keberhasilan produk baru menjadi 70%',
        'Mengurangi waktu pengembangan produk sebesar 20%',
        'Mengembangkan 1 produk yang berkelanjutan dan ramah lingkungan',
      ],
      'collaborationTeams': [
        'Tim Riset Pasar',
        'Tim Produksi',
        'Tim Quality Control',
        'Tim Pemasaran',
      ],
      'resources': [
        'Laboratorium R&D',
        'Software manajemen proyek pengembangan produk',
        'Budget untuk uji coba dan prototyping produk',
        'Akses ke database paten dan inovasi industri',
      ],
      'timeline': '12 bulan, dengan milestone kuartalan',
      'expectedOutcome': '3 produk baru diluncurkan, tingkat keberhasilan produk 70%, waktu pengembangan berkurang 20%, 1 produk berkelanjutan diciptakan.',
    },
    'Sales Executive': {
      'Department': 'Penjualan',
      'Output': [
        'Laporan penjualan bulanan produk',
        'Proposal kerjasama dengan distributor',
        'Analisis performa penjualan produk utama dan turunan',
        'Feedback pasar untuk perbaikan produk',
      ],
      'CustomerTypes': [
        'Distributor produk',
        'Retailer produk',
        'Industri pengolahan makanan',
        'Konsumen langsung (B2B)',
      ],
      'KeyTasks': [
        'Mencapai target penjualan bulanan dan tahunan',
        'Mengembangkan dan memelihara hubungan dengan klien',
        'Mengidentifikasi peluang penjualan baru',
        'Melakukan presentasi produk dan negosiasi',
        'Memberikan input untuk strategi harga dan promosi',
      ],
      'BrainstormingQuestions': [
        'Bagaimana meningkatkan retensi pelanggan?',
        'Strategi apa yang efektif untuk penetrasi pasar baru?',
        'Cara meningkatkan cross-selling dan up-selling produk?',
        'Bagaimana mengoptimalkan proses penjualan dengan teknologi?',
      ],
      'keyObjectives': [
        'Meningkatkan penjualan tahunan sebesar 20%',
        'Menambah 10 klien besar baru dalam setahun',
        'Meningkatkan tingkat retensi pelanggan menjadi 85%',
        'Mencapai target penjualan produk baru sebesar 1 juta unit',
      ],
      'collaborationTeams': [
        'Tim Pemasaran',
        'Tim Pengembangan Produk',
        'Tim Layanan Pelanggan',
        'Tim Logistik',
      ],
      'resources': [
        'CRM software',
        'Katalog produk digital',
        'Alat analisis penjualan',
        'Budget untuk perjalanan dan entertainment klien',
      ],
      'timeline': '12 bulan, dengan review bulanan',
      'expectedOutcome': 'Peningkatan penjualan 20%, 10 klien besar baru, tingkat retensi 85%, target penjualan produk baru tercapai.',
    },
    'Marketing Manager': {
      'Department': 'Pemasaran',
      'Output': [
        'Rencana pemasaran tahunan untuk produk',
        'Laporan ROI kampanye pemasaran produk',
        'Strategi penetapan harga untuk produk utama dan turunan',
        'Analisis efektivitas saluran pemasaran untuk produk',
      ],
      'CustomerTypes': [
        'Konsumen akhir',
        'Distributor dan retailer',
        'Pelanggan B2B',
      ],
      'KeyTasks': [
        'Mengembangkan dan mengimplementasikan strategi pemasaran untuk produk',
        'Mengelola budget pemasaran untuk produk',
        'Mengkoordinasikan kampanye pemasaran multi-channel',
        'Menganalisis efektivitas kegiatan pemasaran',
        'Memastikan konsistensi pesan merek di semua platform pemasaran',
      ],
      'BrainstormingQuestions': [
        'Bagaimana memanfaatkan data pelanggan untuk personalisasi pemasaran?',
        'Strategi content marketing apa yang paling efektif untuk produk?',
        'Cara mengoptimalkan customer journey melalui touchpoint digital?',
        'Bagaimana mengintegrasikan sustainability dalam strategi pemasaran?',
      ],
      'keyObjectives': [
        'Meningkatkan brand awareness sebesar 30%',
        'Mencapai ROI pemasaran sebesar 300%',
        'Meningkatkan engagement rate di media sosial sebesar 50%',
        'Meluncurkan 2 kampanye viral yang sukses',
      ],
      'collaborationTeams': [
        'Tim Branding',
        'Tim Sales',
        'Tim Digital Marketing',
        'Tim Pengembangan Produk',
      ],
      'resources': [
        'Marketing automation software',
        'Analytics tools',
        'Budget untuk iklan digital dan tradisional',
        'Akses ke agensi kreatif dan PR',
      ],
      'timeline': '12 bulan, dengan evaluasi kuartalan',
      'expectedOutcome': 'Brand awareness meningkat 30%, ROI pemasaran 300%, engagement rate naik 50%, 2 kampanye viral sukses.',
    },
  },
  {
  'Manajer Produksi': {
    'Department': 'Produksi',
    'Output': [
      'Laporan hasil tangkapan bulanan',
      'Analisis efisiensi produksi perikanan',
      'Rencana rotasi pemeliharaan kolam',
      'Laporan penggunaan sumber daya (pakan, obat, dll)',
    ],
    'CustomerTypes': [
      'Manajer Pengolahan dan Nilai Tambah',
      'Manajer Penentuan Produk dan Segmen Pasar',
      'Distributor bahan baku perikanan',
    ],
    'KeyTasks': [
      'Mengoptimalkan proses produksi perikanan',
      'Mengimplementasikan teknologi perikanan modern',
      'Mengelola jadwal panen dan pemeliharaan kolam',
      'Memastikan kualitas hasil tangkapan',
      'Mengawasi kepatuhan terhadap standar keamanan pangan',
    ],
    'BrainstormingQuestions': [
      'Bagaimana meningkatkan hasil tangkapan tanpa mengorbankan kualitas?',
      'Apa inovasi terbaru dalam teknologi perikanan yang dapat diterapkan?',
      'Cara terbaik mengurangi dampak lingkungan dari praktik perikanan?',
      'Bagaimana mengoptimalkan penggunaan kolam perikanan?',
    ],
    'keyObjectives': [
      'Meningkatkan produktivitas kolam sebesar 15% dalam satu tahun',
      'Mengurangi penggunaan pakan sintetis sebesar 30%',
      'Mengimplementasikan sistem pemantauan kualitas air',
      'Mencapai sertifikasi Good Aquaculture Practices (GAP)',
    ],
    'collaborationTeams': [
      'Tim Penelitian dan Pengembangan',
      'Tim Logistik dan Rantai Pasok',
      'Tim Manajemen Kualitas',
      'Tim Keberlanjutan Lingkungan',
    ],
    'resources': [
      'Sistem manajemen perikanan terpadu berbasis teknologi',
      'Laboratorium pengujian kualitas air dan hasil tangkapan',
      'Peralatan perikanan modern dan sistem otomasi',
      'Database pengetahuan perikanan dan cuaca',
    ],
    'timeline': '12 bulan, dengan evaluasi triwulanan',
    'expectedOutcome': 'Peningkatan produktivitas 15%, pengurangan biaya 10%, 100% sertifikasi GAP, mempertahankan kualitas dan keberlanjutan.',
  },
  'Manajer Pengolahan dan Nilai Tambah': {
    'Department': 'Produksi',
    'Output': [
      'Laporan efisiensi pengolahan produk perikanan',
      'Analisis kualitas produk olahan',
      'Proposal pengembangan produk turunan baru',
      'SOP proses pengolahan untuk setiap produk',
    ],
    'CustomerTypes': [
      'Manajer Penentuan Produk dan Segmen Pasar',
      'Manajer Branding dan Pemasaran',
      'Distributor produk olahan',
    ],
    'KeyTasks': [
      'Mengoptimalkan proses pengolahan hasil tangkapan',
      'Mengembangkan produk nilai tambah baru',
      'Mengelola kualitas produk olahan',
      'Mengimplementasikan teknologi pengolahan terbaru',
      'Memastikan kepatuhan terhadap standar keamanan pangan',
    ],
    'BrainstormingQuestions': [
      'Bagaimana meningkatkan efisiensi proses pengolahan?',
      'Produk nilai tambah apa yang potensial untuk dikembangkan?',
      'Cara mengurangi limbah dalam proses pengolahan?',
      'Teknologi pengolahan terbaru apa yang dapat diimplementasikan?',
    ],
    'keyObjectives': [
      'Meningkatkan efisiensi pengolahan sebesar 20%',
      'Mengembangkan 3 produk nilai tambah baru dalam setahun',
      'Mengurangi limbah pengolahan sebesar 25%',
      'Mencapai sertifikasi ISO 22000 untuk manajemen keamanan pangan',
    ],
    'collaborationTeams': [
      'Tim Penelitian dan Pengembangan Produk',
      'Tim Kontrol Kualitas',
      'Tim Manajemen Rantai Pasok',
      'Tim Pemasaran',
    ],
    'resources': [
      'Fasilitas pengolahan modern',
      'Laboratorium pengujian kualitas produk',
      'Software manajemen proses pengolahan',
      'Tim ahli teknologi pangan',
    ],
    'timeline': '12 bulan, dengan review bulanan',
    'expectedOutcome': 'Peningkatan efisiensi 20%, 3 produk baru diluncurkan, pengurangan limbah 25%, sertifikasi ISO 22000 tercapai.',
  },
  'Manajer Penentuan Produk dan Segmen Pasar': {
    'Department': 'Pemasaran',
    'Output': [
      'Analisis tren pasar untuk produk perikanan',
      'Laporan segmentasi pasar untuk setiap produk',
      'Rekomendasi pengembangan produk berdasarkan permintaan pasar',
      'Analisis kompetitor untuk setiap segmen produk',
    ],
    'CustomerTypes': [
      'Manajer Pengembangan Produk',
      'Manajer Branding dan Pemasaran',
      'Sales Executive',
    ],
    'KeyTasks': [
      'Melakukan riset pasar dan analisis kompetitor',
      'Mengidentifikasi segmen pasar potensial',
      'Merekomendasikan strategi produk berdasarkan analisis pasar',
      'Memantau tren konsumen dan industri',
      'Berkolaborasi dengan tim pengembangan produk',
    ],
    'BrainstormingQuestions': [
      'Segmen pasar baru apa yang potensial untuk dieksplor?',
      'Bagaimana mengoptimalkan portofolio produk kita?',
      'Tren konsumen apa yang akan mempengaruhi industri kita dalam 5 tahun ke depan?',
      'Bagaimana kita dapat meningkatkan penetrasi pasar untuk produk unggulan?',
    ],
    'keyObjectives': [
      'Mengidentifikasi 2 segmen pasar baru dengan potensial tinggi',
      'Meningkatkan market share produk utama sebesar 10%',
      'Mengusulkan 5 ide produk baru berdasarkan analisis tren pasar',
      'Mengoptimalkan strategi harga untuk meningkatkan profitabilitas 15%',
    ],
    'collaborationTeams': [
      'Tim Riset Pasar',
      'Tim Pengembangan Produk',
      'Tim Analisis Data',
      'Tim Pemasaran Digital',
    ],
    'resources': [
      'Software analisis data pasar',
      'Akses ke laporan industri dan tren konsumen',
      'Budget untuk melakukan survei konsumen',
      'Tim analis pasar',
    ],
    'timeline': '12 bulan, dengan evaluasi kuartalan',
    'expectedOutcome': '2 segmen pasar baru teridentifikasi, peningkatan market share 10%, 5 ide produk baru diusulkan, profitabilitas meningkat 15%.',
  },
  'Manajer Desain Grafis/Kreatif': {
    'Department': 'Kreatif',
    'Output': [
      'Desain kemasan untuk produk utama dan turunan',
      'Materi visual untuk kampanye pemasaran',
      'Infografis tentang manfaat produk',
      'Desain booth untuk pameran perikanan',
    ],
    'CustomerTypes': [
      'Manajer Branding dan Pemasaran',
      'Manajer Pengembangan Produk',
      'Marketing Manager',
    ],
    'KeyTasks': [
      'Mengelola tim desainer grafis',
      'Mengembangkan konsep visual untuk kampanye pemasaran',
      'Memastikan konsistensi desain di seluruh materi pemasaran',
      'Mengikuti tren desain terbaru',
      'Berkolaborasi dengan tim pemasaran dan produk',
    ],
    'BrainstormingQuestions': [
      'Bagaimana kita dapat membuat desain kemasan yang lebih menarik dan fungsional?',
      'Cara mengintegrasikan nilai-nilai merek ke dalam desain visual?',
      'Tren desain apa yang relevan untuk industri perikanan?',
      'Bagaimana meningkatkan efektivitas visual dalam komunikasi pemasaran?',
    ],
    'keyObjectives': [
      'Merancang ulang kemasan untuk 5 produk utama',
      'Meningkatkan engagement visual di media sosial sebesar 30%',
      'Mengembangkan panduan gaya visual yang komprehensif',
      'Menciptakan 3 kampanye visual yang viral',
    ],
    'collaborationTeams': [
      'Tim Pemasaran Digital',
      'Tim Pengembangan Produk',
      'Tim Branding',
      'Tim Produksi',
    ],
    'resources': [
      'Software desain grafis terbaru',
      'Perpustakaan aset visual',
      'Perangkat keras untuk prototyping kemasan',
      'Budget untuk kursus pengembangan keterampilan desain',
    ],
    'timeline': '12 bulan, dengan review proyek bulanan',
    'expectedOutcome': '5 desain kemasan baru, peningkatan engagement visual 30%, panduan gaya visual tercipta, 3 kampanye visual viral terlaksana.',
  },
  'Manajer Branding dan Pemasaran': {
    'Department': 'Pemasaran',
    'Output': [
      'Strategi branding untuk lini produk perikanan',
      'Rencana kampanye pemasaran terintegrasi',
      'Laporan kesadaran merek dan persepsi konsumen',
      'Panduan komunikasi merek untuk semua produk',
    ],
    'CustomerTypes': [
      'Konsumen akhir',
      'Distributor dan retailer',
      'Media dan influencer',
    ],
    'KeyTasks': [
      'Mengembangkan dan mengelola strategi branding',
      'Merancang dan mengeksekusi kampanye pemasaran',
      'Mengelola citra merek di semua saluran komunikasi',
      'Menganalisis efektivitas kampanye pemasaran',
      'Berkolaborasi dengan tim kreatif dan pemasaran',
    ],
    'BrainstormingQuestions': [
      'Bagaimana kita dapat meningkatkan persepsi merek di kalangan konsumen muda?',
      'Cara mengintegrasikan nilai keberlanjutan ke dalam branding kita?',
      'Strategi apa yang efektif untuk meningkatkan loyalitas merek?',
      'Bagaimana memanfaatkan teknologi digital untuk memperkuat branding?',
    ],
    'keyObjectives': [
      'Meningkatkan brand awareness sebesar 25%',
      'Meluncurkan 3 kampanye pemasaran terintegrasi yang sukses',
      'Meningkatkan engagement rate di media sosial sebesar 40%',
      'Mengembangkan strategi influencer marketing yang efektif',
    ],
    'collaborationTeams': [
      'Tim Desain Grafis',
      'Tim Digital Marketing',
      'Tim Public Relations',
      'Tim Pengembangan Produk',
    ],
    'resources': [
      'Software analisis media sosial dan brand monitoring',
      'Budget untuk kampanye pemasaran',
      'Akses ke agensi kreatif eksternal',
      'Platform manajemen kampanye pemasaran terpadu',
    ],
    'timeline': '12 bulan, dengan evaluasi kuartalan',
    'expectedOutcome': 'Peningkatan brand awareness 25%, 3 kampanye sukses diluncurkan, peningkatan engagement rate 40%, strategi influencer marketing terlaksana.',
  },
  'Manajer Pengembangan Produk': {
    'Department': 'Riset dan Pengembangan',
    'Output': [
      'Prototipe produk turunan baru',
      'Laporan uji coba produk baru',
      'Analisis kelayakan produk turunan',
      'Spesifikasi teknis untuk setiap produk baru',
    ],
    'CustomerTypes': [
      'Manajer Produksi Perikanan',
      'Manajer Pengolahan dan Nilai Tambah',
      'Manajer Branding dan Pemasaran',
    ],
    'KeyTasks': [
      'Memimpin proses pengembangan produk baru',
      'Melakukan riset pasar untuk ide produk',
      'Mengkoordinasikan uji coba produk',
      'Memastikan produk memenuhi standar kualitas dan regulasi',
      'Berkolaborasi dengan tim produksi dan pemasaran',
    ],
    'BrainstormingQuestions': [
      'Bagaimana kita dapat mengembangkan produk yang lebih berkelanjutan?',
      'Inovasi apa yang bisa kita terapkan pada produk existing?',
      'Bagaimana memanfaatkan teknologi untuk menciptakan produk unik?',
      'Cara mempercepat siklus pengembangan produk tanpa mengorbankan kualitas?',
    ],
    'keyObjectives': [
      'Meluncurkan 3 produk turunan baru yang inovatif dalam setahun',
      'Meningkatkan tingkat keberhasilan produk baru menjadi 70%',
      'Mengurangi waktu pengembangan produk sebesar 20%',
      'Mengembangkan 1 produk berkelanjutan yang mengurangi limbah',
    ],
    'collaborationTeams': [
      'Tim Riset Pasar',
      'Tim Produksi',
      'Tim Quality Control',
      'Tim Pemasaran',
    ],
    'resources': [
      'Laboratorium R&D',
      'Software manajemen proyek pengembangan produk',
      'Budget untuk uji coba dan prototyping',
      'Akses ke database paten dan inovasi industri',
    ],
    'timeline': '12 bulan, dengan milestone kuartalan',
    'expectedOutcome': '3 produk baru diluncurkan, tingkat keberhasilan produk 70%, waktu pengembangan berkurang 20%, 1 produk berkelanjutan diciptakan.',
  },
  'Sales Executive': {
    'Department': 'Penjualan',
    'Output': [
      'Laporan penjualan bulanan per produk',
      'Proposal kerjasama dengan distributor',
      'Analisis performa penjualan produk utama dan turunan',
      'Feedback pasar untuk perbaikan produk',
    ],
    'CustomerTypes': [
      'Distributor',
      'Retailer',
      'Industri pengolahan makanan',
      'Konsumen langsung (B2B)',
    ],
    'KeyTasks': [
      'Mencapai target penjualan bulanan dan tahunan',
      'Mengembangkan dan memelihara hubungan dengan klien',
      'Mengidentifikasi peluang penjualan baru',
      'Melakukan presentasi produk dan negosiasi',
      'Memberikan input untuk strategi harga dan promosi',
    ],
    'BrainstormingQuestions': [
      'Bagaimana meningkatkan retensi pelanggan?',
      'Strategi apa yang efektif untuk penetrasi pasar baru?',
      'Cara meningkatkan cross-selling dan up-selling?',
      'Bagaimana mengoptimalkan proses penjualan dengan teknologi?',
    ],
    'keyObjectives': [
      'Meningkatkan penjualan tahunan sebesar 20%',
      'Menambah 10 klien besar baru dalam setahun',
      'Meningkatkan tingkat retensi pelanggan menjadi 85%',
      'Mencapai target penjualan produk baru sebesar 1 juta unit',
    ],
    'collaborationTeams': [
      'Tim Pemasaran',
      'Tim Pengembangan Produk',
      'Tim Layanan Pelanggan',
      'Tim Logistik',
    ],
    'resources': [
      'CRM software',
      'Katalog produk digital',
      'Alat analisis penjualan',
      'Budget untuk perjalanan dan entertainment klien',
    ],
    'timeline': '12 bulan, dengan review bulanan',
    'expectedOutcome': 'Peningkatan penjualan 20%, 10 klien besar baru, tingkat retensi 85%, target penjualan produk baru tercapai.',
  },
  'Marketing Manager': {
    'Department': 'Pemasaran',
    'Output': [
      'Rencana pemasaran tahunan untuk semua lini produk',
      'Laporan ROI kampanye pemasaran per produk',
      'Strategi penetapan harga untuk produk utama dan turunan',
      'Analisis efektivitas saluran pemasaran per segmen produk',
    ],
    'CustomerTypes': [
      'Konsumen akhir',
      'Distributor dan retailer',
      'Pelanggan B2B',
    ],
    'KeyTasks': [
      'Mengembangkan dan mengimplementasikan strategi pemasaran',
      'Mengelola budget pemasaran',
      'Mengkoordinasikan kampanye pemasaran multi-channel',
      'Menganalisis efektivitas kegiatan pemasaran',
      'Memastikan konsistensi pesan merek di semua platform',
    ],
    'BrainstormingQuestions': [
      'Bagaimana memanfaatkan data pelanggan untuk personalisasi pemasaran?',
      'Strategi content marketing apa yang paling efektif untuk industri kita?',
      'Cara mengoptimalkan customer journey melalui touchpoint digital?',
      'Bagaimana mengintegrasikan sustainability dalam strategi pemasaran?',
    ],
    'keyObjectives': [
      'Meningkatkan brand awareness sebesar 30%',
      'Mencapai ROI pemasaran sebesar 300%',
      'Meningkatkan engagement rate di media sosial sebesar 50%',
      'Meluncurkan 2 kampanye viral yang sukses',
    ],
    'collaborationTeams': [
      'Tim Branding',
      'Tim Sales',
      'Tim Digital Marketing',
      'Tim Pengembangan Produk',
    ],
    'resources': [
      'Marketing automation software',
      'Analytics tools',
      'Budget untuk iklan digital dan tradisional',
      'Akses ke agensi kreatif dan PR',
    ],
    'timeline': '12 bulan, dengan evaluasi kuartalan',
    'expectedOutcome': 'Brand awareness meningkat 30%, ROI pemasaran 300%, engagement rate naik 50%, 2 kampanye viral sukses.',
  },
  // Tambahkan data default lainnya di sini...
}
, {
    'Manajer Produksi': {
      'Department': 'Produksi',
      'Output': [
        'Laporan hasil produksi bulanan',
        'Analisis efisiensi produksi',
        'Rencana rotasi pemeliharaan mesin/peralatan',
        'Laporan penggunaan sumber daya (bahan baku, energi, dll)',
      ],
      'CustomerTypes': [
        'Manajer Pengolahan dan Nilai Tambah',
        'Manajer Penentuan Produk dan Segmen Pasar',
        'Distributor produk',
      ],
      'KeyTasks': [
        'Mengoptimalkan proses produksi',
        'Mengimplementasikan teknologi produksi modern',
        'Mengelola jadwal produksi dan pemeliharaan',
        'Memastikan kualitas produk yang dihasilkan',
        'Mengawasi kepatuhan terhadap standar keamanan produk',
      ],
      'BrainstormingQuestions': [
        'Bagaimana meningkatkan hasil produksi tanpa mengorbankan kualitas?',
        'Apa inovasi terbaru dalam teknologi produksi?',
        'Cara terbaik mengurangi dampak lingkungan dari praktik produksi?',
        'Bagaimana mengoptimalkan penggunaan bahan baku dan sumber daya lainnya?',
      ],
      'keyObjectives': [
        'Meningkatkan produktivitas sebesar 15% dalam satu tahun',
        'Mengurangi penggunaan bahan baku sintetis sebesar 30%',
        'Mengimplementasikan sistem pemantauan kualitas produk',
        'Mencapai sertifikasi industri relevan',
      ],
      'collaborationTeams': [
        'Tim Penelitian dan Pengembangan',
        'Tim Logistik dan Rantai Pasok',
        'Tim Manajemen Kualitas',
        'Tim Keberlanjutan Lingkungan',
      ],
      'resources': [
        'Sistem manajemen produksi berbasis teknologi',
        'Laboratorium pengujian kualitas produk',
        'Peralatan produksi modern dan sistem otomasi',
        'Database pengetahuan tentang bahan baku dan teknologi produksi',
      ],
      'timeline': '12 bulan, dengan evaluasi triwulanan',
      'expectedOutcome': 'Peningkatan produktivitas 15%, pengurangan biaya 10%, sertifikasi industri tercapai, mempertahankan kualitas dan keberlanjutan.',
    },
    'Manajer Pengolahan dan Nilai Tambah': {
      'Department': 'Produksi',
      'Output': [
        'Laporan efisiensi pengolahan produk',
        'Analisis kualitas produk olahan',
        'Proposal pengembangan produk turunan baru',
        'SOP proses pengolahan untuk setiap produk',
      ],
      'CustomerTypes': [
        'Manajer Penentuan Produk dan Segmen Pasar',
        'Manajer Branding dan Pemasaran',
        'Distributor produk olahan',
      ],
      'KeyTasks': [
        'Mengoptimalkan proses pengolahan produk',
        'Mengembangkan produk nilai tambah',
        'Mengelola kualitas produk olahan',
        'Mengimplementasikan teknologi pengolahan terbaru',
        'Memastikan kepatuhan terhadap standar keamanan produk',
      ],
      'BrainstormingQuestions': [
        'Bagaimana meningkatkan efisiensi proses pengolahan produk?',
        'Produk nilai tambah apa yang potensial untuk dikembangkan?',
        'Cara mengurangi limbah dalam proses pengolahan?',
        'Teknologi pengolahan terbaru apa yang dapat diterapkan pada produk?',
      ],
      'keyObjectives': [
        'Meningkatkan efisiensi pengolahan sebesar 20%',
        'Mengembangkan 3 produk nilai tambah baru dalam setahun',
        'Mengurangi limbah pengolahan sebesar 25%',
        'Mencapai sertifikasi industri relevan untuk manajemen keamanan produk',
      ],
      'collaborationTeams': [
        'Tim Penelitian dan Pengembangan Produk',
        'Tim Kontrol Kualitas',
        'Tim Manajemen Rantai Pasok',
        'Tim Pemasaran',
      ],
      'resources': [
        'Fasilitas pengolahan modern',
        'Laboratorium pengujian kualitas produk',
        'Software manajemen proses pengolahan',
        'Tim ahli teknologi pengolahan',
      ],
      'timeline': '12 bulan, dengan review bulanan',
      'expectedOutcome': 'Peningkatan efisiensi 20%, 3 produk baru diluncurkan, pengurangan limbah 25%, sertifikasi industri relevan tercapai.',
    },
    'Manajer Penentuan Produk dan Segmen Pasar': {
      'Department': 'Pemasaran',
      'Output': [
        'Analisis tren pasar untuk produk',
        'Laporan segmentasi pasar',
        'Rekomendasi pengembangan produk berdasarkan permintaan pasar',
        'Analisis kompetitor untuk produk',
      ],
      'CustomerTypes': [
        'Manajer Pengembangan Produk',
        'Manajer Branding dan Pemasaran',
        'Sales Executive',
      ],
      'KeyTasks': [
        'Melakukan riset pasar dan analisis kompetitor',
        'Mengidentifikasi segmen pasar potensial',
        'Merekomendasikan strategi produk berdasarkan analisis pasar',
        'Memantau tren konsumen dan industri',
        'Berkolaborasi dengan tim pengembangan produk',
      ],
      'BrainstormingQuestions': [
        'Segmen pasar baru apa yang potensial?',
        'Bagaimana mengoptimalkan portofolio produk?',
        'Tren konsumen apa yang akan mempengaruhi industri dalam 5 tahun ke depan?',
        'Bagaimana kita dapat meningkatkan penetrasi pasar?',
      ],
      'keyObjectives': [
        'Mengidentifikasi 2 segmen pasar baru dengan potensial tinggi',
        'Meningkatkan market share sebesar 10%',
        'Mengusulkan 5 ide produk baru berdasarkan analisis tren pasar',
        'Mengoptimalkan strategi harga untuk meningkatkan profitabilitas 15%',
      ],
      'collaborationTeams': [
        'Tim Riset Pasar',
        'Tim Pengembangan Produk',
        'Tim Analisis Data',
        'Tim Pemasaran Digital',
      ],
      'resources': [
        'Software analisis data pasar',
        'Akses ke laporan industri dan tren konsumen',
        'Budget untuk melakukan survei konsumen',
        'Tim analis pasar',
      ],
      'timeline': '12 bulan, dengan evaluasi kuartalan',
      'expectedOutcome': '2 segmen pasar baru teridentifikasi, peningkatan market share 10%, 5 ide produk baru diusulkan, profitabilitas meningkat 15%.',
    },
    'Manajer Desain Grafis/Kreatif': {
      'Department': 'Kreatif',
      'Output': [
        'Desain kemasan untuk produk',
        'Materi visual untuk kampanye pemasaran',
        'Infografis tentang manfaat produk',
        'Desain booth untuk pameran produk',
      ],
      'CustomerTypes': [
        'Manajer Branding dan Pemasaran',
        'Manajer Pengembangan Produk',
        'Marketing Manager',
      ],
      'KeyTasks': [
        'Mengelola tim desainer grafis',
        'Mengembangkan konsep visual untuk kampanye pemasaran',
        'Memastikan konsistensi desain di seluruh materi pemasaran',
        'Mengikuti tren desain terbaru untuk kemasan dan materi pemasaran',
        'Berkolaborasi dengan tim pemasaran dan produk',
      ],
      'BrainstormingQuestions': [
        'Bagaimana kita dapat membuat desain kemasan yang lebih menarik dan fungsional?',
        'Cara mengintegrasikan nilai-nilai merek ke dalam desain visual produk?',
        'Tren desain apa yang relevan untuk kemasan produk?',
        'Bagaimana meningkatkan efektivitas visual dalam komunikasi pemasaran?',
      ],
      'keyObjectives': [
        'Merancang ulang kemasan untuk 5 produk utama',
        'Meningkatkan engagement visual di media sosial sebesar 30%',
        'Mengembangkan panduan gaya visual yang komprehensif untuk produk',
        'Menciptakan 3 kampanye visual yang viral',
      ],
      'collaborationTeams': [
        'Tim Pemasaran Digital',
        'Tim Pengembangan Produk',
        'Tim Branding',
        'Tim Produksi',
      ],
      'resources': [
        'Software desain grafis terbaru',
        'Perpustakaan aset visual',
        'Perangkat keras untuk prototyping kemasan',
        'Budget untuk kursus pengembangan keterampilan desain',
      ],
      'timeline': '12 bulan, dengan review proyek bulanan',
      'expectedOutcome': '5 desain kemasan baru, peningkatan engagement visual 30%, panduan gaya visual tercipta, 3 kampanye visual viral terlaksana.',
    },
    'Manajer Branding dan Pemasaran': {
      'Department': 'Pemasaran',
      'Output': [
        'Strategi branding untuk produk',
        'Rencana kampanye pemasaran terintegrasi',
        'Laporan kesadaran merek dan persepsi konsumen',
        'Panduan komunikasi merek untuk produk',
      ],
      'CustomerTypes': [
        'Konsumen akhir',
        'Distributor dan retailer',
        'Media dan influencer',
      ],
      'KeyTasks': [
        'Mengembangkan dan melaksanakan strategi branding',
        'Mengelola kampanye pemasaran terintegrasi',
        'Memantau dan menganalisis persepsi merek dan efektivitas kampanye',
        'Berkoordinasi dengan tim kreatif untuk menciptakan materi pemasaran',
        'Mengelola citra merek di semua saluran komunikasi',
      ],
      'BrainstormingQuestions': [
        'Bagaimana kita dapat meningkatkan persepsi merek di kalangan konsumen?',
        'Cara mengintegrasikan nilai keberlanjutan dalam branding produk?',
        'Strategi apa yang efektif untuk meningkatkan loyalitas merek?',
        'Bagaimana memanfaatkan teknologi digital untuk memperkuat branding produk?',
      ],
      'keyObjectives': [
        'Meningkatkan brand awareness sebesar 25%',
        'Meluncurkan 3 kampanye pemasaran terintegrasi yang sukses',
        'Meningkatkan engagement rate di media sosial sebesar 40%',
        'Mengembangkan strategi influencer marketing yang efektif',
      ],
      'collaborationTeams': [
        'Tim Desain Grafis',
        'Tim Digital Marketing',
        'Tim Public Relations',
        'Tim Pengembangan Produk',
      ],
      'resources': [
        'Software analisis media sosial dan brand monitoring',
        'Budget untuk kampanye pemasaran',
        'Akses ke agensi kreatif eksternal',
        'Platform manajemen kampanye pemasaran terpadu',
      ],
      'timeline': '12 bulan, dengan evaluasi kuartalan',
      'expectedOutcome': 'Peningkatan brand awareness 25%, 3 kampanye pemasaran sukses diluncurkan, peningkatan engagement rate 40%, strategi influencer marketing terlaksana.',
    },
    'Manajer Pengembangan Produk': {
      'Department': 'Riset dan Pengembangan',
      'Output': [
        'Prototipe produk turunan baru',
        'Laporan uji coba produk baru',
        'Analisis kelayakan produk turunan',
        'Spesifikasi teknis untuk setiap produk baru',
      ],
      'CustomerTypes': [
        'Manajer Produksi',
        'Manajer Pengolahan dan Nilai Tambah',
        'Manajer Branding dan Pemasaran',
      ],
      'KeyTasks': [
        'Memimpin proses pengembangan produk baru',
        'Melakukan riset pasar untuk ide produk',
        'Mengkoordinasikan uji coba produk baru',
        'Memastikan produk memenuhi standar kualitas dan regulasi',
        'Berkolaborasi dengan tim produksi dan pemasaran',
      ],
      'BrainstormingQuestions': [
        'Bagaimana kita dapat mengembangkan produk baru yang inovatif?',
        'Inovasi apa yang bisa kita terapkan pada produk existing?',
        'Bagaimana memanfaatkan teknologi untuk menciptakan produk yang unik?',
        'Cara mempercepat siklus pengembangan produk tanpa mengorbankan kualitas?',
      ],
      'keyObjectives': [
        'Meluncurkan 3 produk turunan baru yang inovatif dalam setahun',
        'Meningkatkan tingkat keberhasilan produk baru menjadi 70%',
        'Mengurangi waktu pengembangan produk sebesar 20%',
        'Mengembangkan 1 produk yang berkelanjutan dan ramah lingkungan',
      ],
      'collaborationTeams': [
        'Tim Riset Pasar',
        'Tim Produksi',
        'Tim Quality Control',
        'Tim Pemasaran',
      ],
      'resources': [
        'Laboratorium R&D',
        'Software manajemen proyek pengembangan produk',
        'Budget untuk uji coba dan prototyping produk',
        'Akses ke database paten dan inovasi industri',
      ],
      'timeline': '12 bulan, dengan milestone kuartalan',
      'expectedOutcome': '3 produk baru diluncurkan, tingkat keberhasilan produk 70%, waktu pengembangan berkurang 20%, 1 produk berkelanjutan diciptakan.',
    },
    'Sales Executive': {
      'Department': 'Penjualan',
      'Output': [
        'Laporan penjualan bulanan produk',
        'Proposal kerjasama dengan distributor',
        'Analisis performa penjualan produk utama dan turunan',
        'Feedback pasar untuk perbaikan produk',
      ],
      'CustomerTypes': [
        'Distributor produk',
        'Retailer produk',
        'Industri pengolahan makanan',
        'Konsumen langsung (B2B)',
      ],
      'KeyTasks': [
        'Mencapai target penjualan bulanan dan tahunan',
        'Mengembangkan dan memelihara hubungan dengan klien',
        'Mengidentifikasi peluang penjualan baru',
        'Melakukan presentasi produk dan negosiasi',
        'Memberikan input untuk strategi harga dan promosi',
      ],
      'BrainstormingQuestions': [
        'Bagaimana meningkatkan retensi pelanggan?',
        'Strategi apa yang efektif untuk penetrasi pasar baru?',
        'Cara meningkatkan cross-selling dan up-selling produk?',
        'Bagaimana mengoptimalkan proses penjualan dengan teknologi?',
      ],
      'keyObjectives': [
        'Meningkatkan penjualan tahunan sebesar 20%',
        'Menambah 10 klien besar baru dalam setahun',
        'Meningkatkan tingkat retensi pelanggan menjadi 85%',
        'Mencapai target penjualan produk baru sebesar 1 juta unit',
      ],
      'collaborationTeams': [
        'Tim Pemasaran',
        'Tim Pengembangan Produk',
        'Tim Layanan Pelanggan',
        'Tim Logistik',
      ],
      'resources': [
        'CRM software',
        'Katalog produk digital',
        'Alat analisis penjualan',
        'Budget untuk perjalanan dan entertainment klien',
      ],
      'timeline': '12 bulan, dengan review bulanan',
      'expectedOutcome': 'Peningkatan penjualan 20%, 10 klien besar baru, tingkat retensi 85%, target penjualan produk baru tercapai.',
    },
    'Marketing Manager': {
      'Department': 'Pemasaran',
      'Output': [
        'Rencana pemasaran tahunan untuk produk',
        'Laporan ROI kampanye pemasaran produk',
        'Strategi penetapan harga untuk produk utama dan turunan',
        'Analisis efektivitas saluran pemasaran untuk produk',
      ],
      'CustomerTypes': [
        'Konsumen akhir',
        'Distributor dan retailer',
        'Pelanggan B2B',
      ],
      'KeyTasks': [
        'Mengembangkan dan mengimplementasikan strategi pemasaran untuk produk',
        'Mengelola budget pemasaran untuk produk',
        'Mengkoordinasikan kampanye pemasaran multi-channel',
        'Menganalisis efektivitas kegiatan pemasaran',
        'Memastikan konsistensi pesan merek di semua platform pemasaran',
      ],
      'BrainstormingQuestions': [
        'Bagaimana memanfaatkan data pelanggan untuk personalisasi pemasaran?',
        'Strategi content marketing apa yang paling efektif untuk produk?',
        'Cara mengoptimalkan customer journey melalui touchpoint digital?',
        'Bagaimana mengintegrasikan sustainability dalam strategi pemasaran?',
      ],
      'keyObjectives': [
        'Meningkatkan brand awareness sebesar 30%',
        'Mencapai ROI pemasaran sebesar 300%',
        'Meningkatkan engagement rate di media sosial sebesar 50%',
        'Meluncurkan 2 kampanye viral yang sukses',
      ],
      'collaborationTeams': [
        'Tim Branding',
        'Tim Sales',
        'Tim Digital Marketing',
        'Tim Pengembangan Produk',
      ],
      'resources': [
        'Marketing automation software',
        'Analytics tools',
        'Budget untuk iklan digital dan tradisional',
        'Akses ke agensi kreatif dan PR',
      ],
      'timeline': '12 bulan, dengan evaluasi kuartalan',
      'expectedOutcome': 'Brand awareness meningkat 30%, ROI pemasaran 300%, engagement rate naik 50%, 2 kampanye viral sukses.',
    },
  },
  {
  'Manajer Produksi': {
    'Department': 'Produksi',
    'Output': [
      'Laporan hasil produksi telur bulanan',
      'Analisis efisiensi produksi telur',
      'Rencana rotasi pemeliharaan kandang',
      'Laporan penggunaan sumber daya (pakan, vitamin, dll)',
    ],
    'CustomerTypes': [
      'Manajer Pengolahan dan Nilai Tambah',
      'Manajer Penentuan Produk dan Segmen Pasar',
      'Distributor telur',
    ],
    'KeyTasks': [
      'Mengoptimalkan proses produksi telur',
      'Mengimplementasikan teknologi pemeliharaan ayam modern',
      'Mengelola jadwal panen telur dan pemeliharaan kandang',
      'Memastikan kualitas telur yang dihasilkan',
      'Mengawasi kepatuhan terhadap standar keamanan pangan',
    ],
    'BrainstormingQuestions': [
      'Bagaimana meningkatkan hasil produksi telur tanpa mengorbankan kualitas?',
      'Apa inovasi terbaru dalam teknologi pemeliharaan ayam petelur?',
      'Cara terbaik mengurangi dampak lingkungan dari praktik peternakan?',
      'Bagaimana mengoptimalkan penggunaan pakan dan sumber daya lainnya?',
    ],
    'keyObjectives': [
      'Meningkatkan produktivitas telur sebesar 15% dalam satu tahun',
      'Mengurangi penggunaan pakan sintetis sebesar 30%',
      'Mengimplementasikan sistem pemantauan kualitas telur',
      'Mencapai sertifikasi Good Agricultural Practices (GAP)',
    ],
    'collaborationTeams': [
      'Tim Penelitian dan Pengembangan',
      'Tim Logistik dan Rantai Pasok',
      'Tim Manajemen Kualitas',
      'Tim Keberlanjutan Lingkungan',
    ],
    'resources': [
      'Sistem manajemen pemeliharaan ayam terpadu berbasis teknologi',
      'Laboratorium pengujian kualitas telur',
      'Peralatan pemeliharaan ayam modern dan sistem otomasi',
      'Database pengetahuan tentang pakan dan kesehatan ayam',
    ],
    'timeline': '12 bulan, dengan evaluasi triwulanan',
    'expectedOutcome': 'Peningkatan produktivitas 15%, pengurangan biaya 10%, 100% sertifikasi GAP, mempertahankan kualitas dan keberlanjutan.',
  },
  'Manajer Pengolahan dan Nilai Tambah': {
    'Department': 'Produksi',
    'Output': [
      'Laporan efisiensi pengolahan produk telur',
      'Analisis kualitas produk olahan telur',
      'Proposal pengembangan produk turunan baru dari telur',
      'SOP proses pengolahan untuk setiap produk telur',
    ],
    'CustomerTypes': [
      'Manajer Penentuan Produk dan Segmen Pasar',
      'Manajer Branding dan Pemasaran',
      'Distributor produk olahan telur',
    ],
    'KeyTasks': [
      'Mengoptimalkan proses pengolahan telur',
      'Mengembangkan produk nilai tambah dari telur',
      'Mengelola kualitas produk olahan telur',
      'Mengimplementasikan teknologi pengolahan telur terbaru',
      'Memastikan kepatuhan terhadap standar keamanan pangan',
    ],
    'BrainstormingQuestions': [
      'Bagaimana meningkatkan efisiensi proses pengolahan telur?',
      'Produk nilai tambah apa yang potensial untuk dikembangkan dari telur?',
      'Cara mengurangi limbah dalam proses pengolahan telur?',
      'Teknologi pengolahan terbaru apa yang dapat diterapkan pada produk telur?',
    ],
    'keyObjectives': [
      'Meningkatkan efisiensi pengolahan telur sebesar 20%',
      'Mengembangkan 3 produk nilai tambah baru dari telur dalam setahun',
      'Mengurangi limbah pengolahan telur sebesar 25%',
      'Mencapai sertifikasi ISO 22000 untuk manajemen keamanan pangan',
    ],
    'collaborationTeams': [
      'Tim Penelitian dan Pengembangan Produk',
      'Tim Kontrol Kualitas',
      'Tim Manajemen Rantai Pasok',
      'Tim Pemasaran',
    ],
    'resources': [
      'Fasilitas pengolahan telur modern',
      'Laboratorium pengujian kualitas produk telur',
      'Software manajemen proses pengolahan',
      'Tim ahli teknologi pangan',
    ],
    'timeline': '12 bulan, dengan review bulanan',
    'expectedOutcome': 'Peningkatan efisiensi 20%, 3 produk baru diluncurkan, pengurangan limbah 25%, sertifikasi ISO 22000 tercapai.',
  },
  'Manajer Penentuan Produk dan Segmen Pasar': {
    'Department': 'Pemasaran',
    'Output': [
      'Analisis tren pasar untuk produk telur',
      'Laporan segmentasi pasar untuk telur',
      'Rekomendasi pengembangan produk berdasarkan permintaan pasar',
      'Analisis kompetitor untuk produk telur',
    ],
    'CustomerTypes': [
      'Manajer Pengembangan Produk',
      'Manajer Branding dan Pemasaran',
      'Sales Executive',
    ],
    'KeyTasks': [
      'Melakukan riset pasar dan analisis kompetitor untuk produk telur',
      'Mengidentifikasi segmen pasar potensial untuk telur',
      'Merekomendasikan strategi produk berdasarkan analisis pasar',
      'Memantau tren konsumen dan industri telur',
      'Berkolaborasi dengan tim pengembangan produk',
    ],
    'BrainstormingQuestions': [
      'Segmen pasar baru apa yang potensial untuk telur?',
      'Bagaimana mengoptimalkan portofolio produk telur kita?',
      'Tren konsumen apa yang akan mempengaruhi industri telur dalam 5 tahun ke depan?',
      'Bagaimana kita dapat meningkatkan penetrasi pasar untuk telur?',
    ],
    'keyObjectives': [
      'Mengidentifikasi 2 segmen pasar baru dengan potensial tinggi untuk telur',
      'Meningkatkan market share telur sebesar 10%',
      'Mengusulkan 5 ide produk baru berbasis telur berdasarkan analisis tren pasar',
      'Mengoptimalkan strategi harga untuk meningkatkan profitabilitas 15%',
    ],
    'collaborationTeams': [
      'Tim Riset Pasar',
      'Tim Pengembangan Produk',
      'Tim Analisis Data',
      'Tim Pemasaran Digital',
    ],
    'resources': [
      'Software analisis data pasar',
      'Akses ke laporan industri dan tren konsumen telur',
      'Budget untuk melakukan survei konsumen',
      'Tim analis pasar',
    ],
    'timeline': '12 bulan, dengan evaluasi kuartalan',
    'expectedOutcome': '2 segmen pasar baru teridentifikasi, peningkatan market share 10%, 5 ide produk baru diusulkan, profitabilitas meningkat 15%.',
  },
  'Manajer Desain Grafis/Kreatif': {
    'Department': 'Kreatif',
    'Output': [
      'Desain kemasan untuk produk telur',
      'Materi visual untuk kampanye pemasaran telur',
      'Infografis tentang manfaat telur',
      'Desain booth untuk pameran produk telur',
    ],
    'CustomerTypes': [
      'Manajer Branding dan Pemasaran',
      'Manajer Pengembangan Produk',
      'Marketing Manager',
    ],
    'KeyTasks': [
      'Mengelola tim desainer grafis untuk produk telur',
      'Mengembangkan konsep visual untuk kampanye pemasaran telur',
      'Memastikan konsistensi desain di seluruh materi pemasaran telur',
      'Mengikuti tren desain terbaru untuk kemasan dan materi pemasaran',
      'Berkolaborasi dengan tim pemasaran dan produk',
    ],
    'BrainstormingQuestions': [
      'Bagaimana kita dapat membuat desain kemasan telur yang lebih menarik dan fungsional?',
      'Cara mengintegrasikan nilai-nilai merek ke dalam desain visual produk telur?',
      'Tren desain apa yang relevan untuk kemasan produk telur?',
      'Bagaimana meningkatkan efektivitas visual dalam komunikasi pemasaran telur?',
    ],
    'keyObjectives': [
      'Merancang ulang kemasan untuk 5 produk telur utama',
      'Meningkatkan engagement visual di media sosial terkait produk telur sebesar 30%',
      'Mengembangkan panduan gaya visual yang komprehensif untuk produk telur',
      'Menciptakan 3 kampanye visual yang viral untuk produk telur',
    ],
    'collaborationTeams': [
      'Tim Pemasaran Digital',
      'Tim Pengembangan Produk',
      'Tim Branding',
      'Tim Produksi',
    ],
    'resources': [
      'Software desain grafis terbaru',
      'Perpustakaan aset visual',
      'Perangkat keras untuk prototyping kemasan telur',
      'Budget untuk kursus pengembangan keterampilan desain',
    ],
    'timeline': '12 bulan, dengan review proyek bulanan',
    'expectedOutcome': '5 desain kemasan baru, peningkatan engagement visual 30%, panduan gaya visual tercipta, 3 kampanye visual viral terlaksana.',
  },
  'Manajer Branding dan Pemasaran': {
    'Department': 'Pemasaran',
    'Output': [
      'Strategi branding untuk produk telur',
      'Rencana kampanye pemasaran terintegrasi untuk telur',
      'Laporan kesadaran merek dan persepsi konsumen terhadap telur',
      'Panduan komunikasi merek untuk produk telur',
    ],
    'CustomerTypes': [
      'Konsumen akhir',
      'Distributor dan retailer',
      'Media dan influencer',
    ],
    'KeyTasks': [
      'Mengembangkan dan melaksanakan strategi branding untuk telur',
      'Mengelola kampanye pemasaran terintegrasi',
      'Memantau dan menganalisis persepsi merek dan efektivitas kampanye',
      'Berkoordinasi dengan tim kreatif untuk menciptakan materi pemasaran',
      'Mengelola citra merek di semua saluran komunikasi',
    ],
    'BrainstormingQuestions': [
      'Bagaimana kita dapat meningkatkan persepsi merek produk telur di kalangan konsumen?',
      'Cara mengintegrasikan nilai keberlanjutan dalam branding telur kita?',
      'Strategi apa yang efektif untuk meningkatkan loyalitas merek telur?',
      'Bagaimana memanfaatkan teknologi digital untuk memperkuat branding produk telur?',
    ],
    'keyObjectives': [
      'Meningkatkan brand awareness produk telur sebesar 25%',
      'Meluncurkan 3 kampanye pemasaran terintegrasi yang sukses untuk telur',
      'Meningkatkan engagement rate di media sosial untuk produk telur sebesar 40%',
      'Mengembangkan strategi influencer marketing yang efektif untuk produk telur',
    ],
    'collaborationTeams': [
      'Tim Desain Grafis',
      'Tim Digital Marketing',
      'Tim Public Relations',
      'Tim Pengembangan Produk',
    ],
    'resources': [
      'Software analisis media sosial dan brand monitoring',
      'Budget untuk kampanye pemasaran',
      'Akses ke agensi kreatif eksternal',
      'Platform manajemen kampanye pemasaran terpadu',
    ],
    'timeline': '12 bulan, dengan evaluasi kuartalan',
    'expectedOutcome': 'Peningkatan brand awareness produk telur 25%, 3 kampanye pemasaran sukses diluncurkan, peningkatan engagement rate 40%, strategi influencer marketing terlaksana.',
  },
  'Manajer Pengembangan Produk Telur': {
    'Department': 'Riset dan Pengembangan',
    'Output': [
      'Prototipe produk turunan baru dari telur',
      'Laporan uji coba produk baru berbasis telur',
      'Analisis kelayakan produk turunan dari telur',
      'Spesifikasi teknis untuk setiap produk baru berbasis telur',
    ],
    'CustomerTypes': [
      'Manajer Produksi Telur',
      'Manajer Pengolahan dan Nilai Tambah',
      'Manajer Branding dan Pemasaran',
    ],
    'KeyTasks': [
      'Memimpin proses pengembangan produk baru berbasis telur',
      'Melakukan riset pasar untuk ide produk telur',
      'Mengkoordinasikan uji coba produk baru berbasis telur',
      'Memastikan produk memenuhi standar kualitas dan regulasi',
      'Berkolaborasi dengan tim produksi dan pemasaran',
    ],
    'BrainstormingQuestions': [
      'Bagaimana kita dapat mengembangkan produk baru yang inovatif berbasis telur?',
      'Inovasi apa yang bisa kita terapkan pada produk telur existing?',
      'Bagaimana memanfaatkan teknologi untuk menciptakan produk telur yang unik?',
      'Cara mempercepat siklus pengembangan produk telur tanpa mengorbankan kualitas?',
    ],
    'keyObjectives': [
      'Meluncurkan 3 produk turunan baru berbasis telur yang inovatif dalam setahun',
      'Meningkatkan tingkat keberhasilan produk telur baru menjadi 70%',
      'Mengurangi waktu pengembangan produk berbasis telur sebesar 20%',
      'Mengembangkan 1 produk berbasis telur yang berkelanjutan dan ramah lingkungan',
    ],
    'collaborationTeams': [
      'Tim Riset Pasar',
      'Tim Produksi',
      'Tim Quality Control',
      'Tim Pemasaran',
    ],
    'resources': [
      'Laboratorium R&D',
      'Software manajemen proyek pengembangan produk',
      'Budget untuk uji coba dan prototyping produk telur',
      'Akses ke database paten dan inovasi industri telur',
    ],
    'timeline': '12 bulan, dengan milestone kuartalan',
    'expectedOutcome': '3 produk baru berbasis telur diluncurkan, tingkat keberhasilan produk telur 70%, waktu pengembangan berkurang 20%, 1 produk berbasis telur berkelanjutan diciptakan.',
  },
  'Sales Executive': {
    'Department': 'Penjualan',
    'Output': [
      'Laporan penjualan bulanan produk telur',
      'Proposal kerjasama dengan distributor telur',
      'Analisis performa penjualan telur utama dan turunan',
      'Feedback pasar untuk perbaikan produk telur',
    ],
    'CustomerTypes': [
      'Distributor telur',
      'Retailer telur',
      'Industri pengolahan makanan',
      'Konsumen langsung (B2B)',
    ],
    'KeyTasks': [
      'Mencapai target penjualan bulanan dan tahunan untuk telur',
      'Mengembangkan dan memelihara hubungan dengan klien',
      'Mengidentifikasi peluang penjualan baru untuk telur',
      'Melakukan presentasi produk telur dan negosiasi',
      'Memberikan input untuk strategi harga dan promosi telur',
    ],
    'BrainstormingQuestions': [
      'Bagaimana meningkatkan retensi pelanggan untuk produk telur?',
      'Strategi apa yang efektif untuk penetrasi pasar telur baru?',
      'Cara meningkatkan cross-selling dan up-selling produk telur?',
      'Bagaimana mengoptimalkan proses penjualan telur dengan teknologi?',
    ],
    'keyObjectives': [
      'Meningkatkan penjualan tahunan produk telur sebesar 20%',
      'Menambah 10 klien besar baru untuk produk telur dalam setahun',
      'Meningkatkan tingkat retensi pelanggan menjadi 85%',
      'Mencapai target penjualan produk telur baru sebesar 1 juta unit',
    ],
    'collaborationTeams': [
      'Tim Pemasaran',
      'Tim Pengembangan Produk',
      'Tim Layanan Pelanggan',
      'Tim Logistik',
    ],
    'resources': [
      'CRM software',
      'Katalog produk telur digital',
      'Alat analisis penjualan',
      'Budget untuk perjalanan dan entertainment klien',
    ],
    'timeline': '12 bulan, dengan review bulanan',
    'expectedOutcome': 'Peningkatan penjualan produk telur 20%, 10 klien besar baru, tingkat retensi 85%, target penjualan produk telur baru tercapai.',
  },
  'Marketing Manager': {
    'Department': 'Pemasaran',
    'Output': [
      'Rencana pemasaran tahunan untuk produk telur',
      'Laporan ROI kampanye pemasaran produk telur',
      'Strategi penetapan harga untuk produk telur utama dan turunan',
      'Analisis efektivitas saluran pemasaran untuk produk telur',
    ],
    'CustomerTypes': [
      'Konsumen akhir',
      'Distributor dan retailer telur',
      'Pelanggan B2B',
    ],
    'KeyTasks': [
      'Mengembangkan dan mengimplementasikan strategi pemasaran untuk produk telur',
      'Mengelola budget pemasaran untuk produk telur',
      'Mengkoordinasikan kampanye pemasaran multi-channel untuk produk telur',
      'Menganalisis efektivitas kegiatan pemasaran produk telur',
      'Memastikan konsistensi pesan merek di semua platform pemasaran produk telur',
    ],
    'BrainstormingQuestions': [
      'Bagaimana memanfaatkan data pelanggan untuk personalisasi pemasaran produk telur?',
      'Strategi content marketing apa yang paling efektif untuk produk telur?',
      'Cara mengoptimalkan customer journey melalui touchpoint digital untuk produk telur?',
      'Bagaimana mengintegrasikan sustainability dalam strategi pemasaran produk telur?',
    ],
    'keyObjectives': [
      'Meningkatkan brand awareness produk telur sebesar 30%',
      'Mencapai ROI pemasaran sebesar 300%',
      'Meningkatkan engagement rate di media sosial untuk produk telur sebesar 50%',
      'Meluncurkan 2 kampanye viral yang sukses untuk produk telur',
    ],
    'collaborationTeams': [
      'Tim Branding',
      'Tim Sales',
      'Tim Digital Marketing',
      'Tim Pengembangan Produk',
    ],
    'resources': [
      'Marketing automation software',
      'Analytics tools',
      'Budget untuk iklan digital dan tradisional',
      'Akses ke agensi kreatif dan PR',
    ],
    'timeline': '12 bulan, dengan evaluasi kuartalan',
    'expectedOutcome': 'Brand awareness produk telur meningkat 30%, ROI pemasaran 300%, engagement rate naik 50%, 2 kampanye viral sukses.',
  },
}
];