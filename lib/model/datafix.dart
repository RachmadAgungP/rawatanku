import 'dart:convert';

// data objek hasil
class DataObjHasilTakaran {
  int idPerusahaan;
  String jenisPemupukan;
  Map dataDosis;
  Map dataHarga;
  Map dataPengaplikasian;
  String penjelas;
  bool isExpanded;

  DataObjHasilTakaran(
      {required this.idPerusahaan,
      required this.jenisPemupukan,
      required this.dataDosis,
      required this.dataHarga,
      required this.dataPengaplikasian,
      required this.penjelas,
      this.isExpanded = false});

  static Map<String, dynamic> toMap(DataObjHasilTakaran dataObjHasilTakaran) =>
      {
        "idPerusahaan": dataObjHasilTakaran.idPerusahaan,
        "jenisPemupukan": dataObjHasilTakaran.jenisPemupukan,
        "dataDosis": dataObjHasilTakaran.dataDosis,
        "dataHarga": dataObjHasilTakaran.dataHarga,
        "dataPengaplikasian": dataObjHasilTakaran.dataPengaplikasian,
        "penjelas": dataObjHasilTakaran.penjelas,
        "isExpanded": dataObjHasilTakaran.isExpanded,
      };

  static String encode(List<DataObjHasilTakaran> myDatas) => json.encode(
        myDatas
            .map<Map<String, dynamic>>(
                (myDatas) => DataObjHasilTakaran.toMap(myDatas))
            .toList(),
      );

  DataObjHasilTakaran.fromJson(Map json)
      : idPerusahaan = json['idPerusahaan'],
        jenisPemupukan = json['jenisPemupukan'],
        dataDosis = json['dataDosis'],
        dataHarga = json['dataHarga'],
        dataPengaplikasian = json['dataPengaplikasian'],
        penjelas = json['penjelas'],
        isExpanded = json['isExpanded'];

  Map<String, dynamic> toJson() {
    return {
      'idPerusahaan': idPerusahaan,
      'jenisPemupukan': jenisPemupukan,
      'dataDosis': dataDosis,
      'dataHarga': dataHarga,
      'dataPengaplikasian': dataPengaplikasian,
      'penjelas': penjelas,
      'isExpanded': isExpanded,
    };
  }
}
