List dataprov = [
  {"id": "0", "nama": "Provinsi"},
  {"id": "1", "nama": "Bali"},
  {"id": "2", "nama": "Bangka Belitung"},
  {"id": "3", "nama": "Banten"},
  {"id": "4", "nama": "Bengkulu"},
  {"id": "5", "nama": "DI Yogyakarta"},
  {"id": "6", "nama": "DKI Jakarta"},
  {"id": "7", "nama": "Gorontalo"},
  {"id": "8", "nama": "Jambi"},
  {"id": "9", "nama": "Jawa Barat"},
  {"id": "10", "nama": "Jawa Tengah"},
  {"id": "11", "nama": "Jawa Timur"},
  {"id": "12", "nama": "Kalimantan Barat"},
  {"id": "13", "nama": "Kalimantan Selatan"},
  {"id": "14", "nama": "Kalimantan Tengah"},
  {"id": "15", "nama": "Kalimantan Timur"},
  {"id": "16", "nama": "Kalimantan Utara"},
  {"id": "17", "nama": "Kepulauan Riau"},
  {"id": "18", "nama": "Lampung"},
  {"id": "19", "nama": "Maluku"},
  {"id": "20", "nama": "Maluku Utara"},
  {"id": "21", "nama": "Nanggroe Aceh Darussalam (NAD)"},
  {"id": "22", "nama": "Nusa Tenggara Barat (NTB)"},
  {"id": "23", "nama": "Nusa Tenggara Timur (NTT)"},
  {"id": "24", "nama": "Papua"},
  {"id": "25", "nama": "Papua Barat"},
  {"id": "26", "nama": "Riau"},
  {"id": "27", "nama": "Sulawesi Barat"},
  {"id": "28", "nama": "Sulawesi Selatan"},
  {"id": "29", "nama": "Sulawesi Tengah"},
  {"id": "30", "nama": "Sulawesi Tenggara"},
  {"id": "31", "nama": "Sulawesi Utara"},
  {"id": "32", "nama": "Sumatera Barat"},
  {"id": "33", "nama": "Sumatera Selatan"},
  {"id": "34", "nama": "Sumatera Utara"}
];

class dataProv {
  late int id;
  late String nama;

  dataProv({required this.id, required this.nama});

  dataProv.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nama = json['nama'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['nama'] = nama;
    return data;
  }
}

List<dataProv> dataProvObj = [
  for (var i = 0; i < dataprov.length; i++)
    dataProv(id: i, nama: dataprov[i]['nama'])
];
