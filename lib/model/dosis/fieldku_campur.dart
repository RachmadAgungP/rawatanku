import 'package:flutter/material.dart';
import 'package:rawatt/Debug/aiWork.dart';
import 'package:rawatt/Debug/cardExpended.dart';
import 'package:rawatt/Debug/childWidgetFieldAyam.dart';
import 'package:rawatt/Debug/childWidgetFieldListrik.dart';
import 'package:rawatt/Debug/childWidgetFieldMaggot.dart';
import 'package:rawatt/Debug/childWidgetFieldTanaman.dart';
import 'package:rawatt/components/tema_Page.dart';
import 'package:rawatt/constants.dart';
import 'package:rawatt/model/dosis/fieldku_kolam1.dart';
import '../../Debug/childWidgetFieldKolam.dart';
import '../../components/card_expanded.dart';
import '../../components/card_field.dart';
import '../../components/inputan.dart';
import '../../screens/convert/component/PropertyKalkulator.dart';
import '../../screens/convert/component/Widget_Jenis_Pot.dart';
import '../../screens/convert/component/inisialisasi_var.dart';
import '../../screens/convert/screen_Potrait/backgrounds.dart';
import '../../screens/convert/screens/dolomit/Dolomit_display.dart';
import '../../screens/convert/screens/dolomit/myMainDolomit.dart';
import '../../screens/convert/screens/dosis_pupuk_tanaman/dosis_pupuk_tanaman.dart';
import '../../screens/details/component/component.dart';
import '../../size_config.dart';
import '../MenuRawatan/mdl_MenuRawatan.dart';
import '../daerah/kab.dart';
import '../daerah/kec.dart';
import '../daerah/prov.dart';
import '../datafix.dart';
import '../jenisMesin/mdl_JenisMesin.dart';
import '../kalkulator/mdl_KatRumus.dart';
import '../petani/mdl_Petani.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:omni_datetime_picker/omni_datetime_picker.dart';
import 'dart:convert';
import 'package:intl/intl.dart';
import 'dart:developer' as developer;

List<Map<String?, dynamic>> dataPropertyWidgetKonsumsi = [
  {
    "id_menu": 0,
    "judul": "Konsumsi Kolam",
    "subjudul": "Ruangan",
    "rumus": "",
    "subrumus": "",
    "satuan": "Watt",
    "penjelasMain": "",
    "kesimpulan": "",
    "subkesimpulan": "",
    "penjelasMainChild": "",
    "kesimpulanChild": "",
    "subkesimpulanChild": "",
    "biayaperObject": "",
    "biayaKeseluruhan": ""
  }
];

List<Map<String?, dynamic>> datatampungKomw = [
  {
    'namaId': "",
    "id": 0,
    "komoditi": golonganRuangans(0, 2)[0],
    "boolKom": false,
    "boolKomHarga": false,
    "visiKom": false,
    "pupuk": [
      Pupukw(
          boolPup: false,
          visiPup: false,
          namaPupu: dataKategoriMenuRawatan[2].perlengkapan[0],
          watt: '0',
          LamaListring: '0',
          Rumus: '0',
          hasil: '0',
          img: dataKategoriMenuRawatan[2].img_banner[1]),
    ],
    "luas": golonganListriks(0, 2, "no")[0],
    "visiKomHarga": false,
    "dataHarga": golonganListriks(0, 2, "no"),
    "hasilTotal": '0',
    "hasilRp": 0,
    "indexsubmenu": 0,
    "indexmenu": 0,
    //baru
    "idmediatanam": 0, //idmediatanam
    "varii": [
      DataObjHasilTakaran(
          idPerusahaan: 0,
          jenisPemupukan: '',
          dataDosis: {},
          dataPengaplikasian: {},
          penjelas: '',
          dataHarga: {})
    ],
    "rumus": {},
    "multi": false,
    "kesimpulansub": "",
    "kesimpulanAkhir": "",
    "kategoriRumusKu": [
      KategoriRumus(
          id: 0,
          idKalkulasi: 0,
          idMediaTanam: 0,
          vari: "",
          nama: "",
          rumus: "",
          valuess: {},
          // fieldValue: [],
          img: "",
          id_MenuRawatan: 0)
    ],
    "propertyLainnya": {}
  },
];

List<Map<String?, dynamic>> datatampungKolam = [
  {
    'namaId': "",
    "id": 0,
    "komoditi": golonganRuangans(0, 2)[0],
    "boolKom": false,
    "boolKomHarga": false,
    "visiKom": false,
    "pupuk": [
      Pupukw(
          boolPup: false,
          visiPup: false,
          namaPupu: dataKategoriMenuRawatan[2].perlengkapan[0],
          watt: '0',
          LamaListring: '0',
          Rumus: '0',
          hasil: '0',
          img: dataKategoriMenuRawatan[2].img_banner[1]),
    ],
    "luas": golonganListriks(0, 2, "no")[0],
    "visiKomHarga": false,
    "dataHarga": golonganListriks(0, 2, "no"),
    "hasilTotal": '0',
    "hasilRp": 0,
    "indexsubmenu": 0,
    "indexmenu": 3,
    //baru
    "idmediatanam": 0, //idmediatanam
    "varii": [
      DataObjHasilTakaran(
          idPerusahaan: 3,
          jenisPemupukan: '',
          dataDosis: {},
          dataPengaplikasian: {},
          penjelas: '',
          dataHarga: {})
    ],
    "rumus": {},
    "multi": false,
    "kesimpulansub": "",
    "kesimpulanAkhir": "",
    "kategoriRumusKu": [
      KategoriRumus(
          id: 0,
          idKalkulasi: 0,
          idMediaTanam: 8,
          vari: "",
          nama: "",
          rumus: "",
          valuess: {},
          // fieldValue: [],
          img: "",
          id_MenuRawatan: 3)
    ],
    "propertyLainnya":
        deepCopyMap(tambahanPropertyKal[c.indexMenuRawatan.value])
  },
];

void datakategory(int indexmenuP) {
  datakategorisubMenuRawatan
      .where((element) => element.id_MenuRawatan == indexmenuP.toString())
      .toList();
}

class MyData {
  int id;
  String namaId;
  String komoditi;
  bool boolKom;
  bool boolKomHarga;
  bool visiKom;
  List<Pupukw> pupuk;
  String luas;
  bool visiKomHarga;
  List dataHarga;
  String hasilTotal;
  int hasilRp;
  int indexsubmenu;
  int indexmenu;
  int idmediatanam;
  Map rumus;
  bool multi;
  String kesimpulansub;
  String kesimpulanAkhir;
  List<DataObjHasilTakaran> varii;
  List<KategoriRumus> kategoriRumusKu;
  Map propertyLainnya;

  MyData({
    required this.namaId,
    required this.komoditi,
    required this.boolKom,
    required this.boolKomHarga,
    required this.visiKom,
    required this.pupuk,
    required this.luas,
    required this.visiKomHarga,
    required this.dataHarga,
    required this.hasilTotal,
    required this.hasilRp,
    required this.indexsubmenu,
    required this.indexmenu,
    required this.idmediatanam,
    required this.rumus,
    required this.multi,
    required this.kesimpulansub,
    required this.kesimpulanAkhir,
    required this.varii,
    required this.kategoriRumusKu,
    required this.propertyLainnya,
    required this.id,
  });

  static Map<String, dynamic> toMap(MyData myData) => {
        'namaId': myData.namaId,
        'id': myData.id,
        'komoditi': myData.komoditi,
        'boolKom': myData.boolKom,
        'boolKomHarga': myData.boolKomHarga,
        'visiKom': myData.visiKom,
        'pupuk': myData.pupuk.map((pupuk) => Pupukw.toMap(pupuk)).toList(),
        // asumsi bahwa Pupukw memiliki metode toMap
        'luas': myData.luas,
        'visiKomHarga': myData.visiKomHarga,
        'dataHarga': myData.dataHarga,
        'hasilTotal': myData.hasilTotal,
        'hasilRp': myData.hasilRp,
        'indexsubmenu': myData.indexsubmenu,
        'indexmenu': myData.indexmenu,
        "idmediatanam": myData.idmediatanam,
        "rumus": myData.rumus,
        "multi": myData.multi,
        "kesimpulansub": myData.kesimpulansub,
        "kesimpulanAkhir": myData.kesimpulanAkhir,
        // "var":  myData.varii,
        "var": myData.varii
            .map((varia) => DataObjHasilTakaran.toMap(varia))
            .toList(),

        "kategoriRumusKu": myData.kategoriRumusKu
            .map((kategorirumus) => KategoriRumus.toMap(kategorirumus))
            .toList(),
        "propertyLainnya": myData.propertyLainnya,
      };

  static String encode(List<MyData> myDatas) {
    return json.encode(myDatas.map((data) => data.toJson()).toList());
  }

  static List<MyData> decode(String myDatas) {
    return (json.decode(myDatas) as List<dynamic>)
        .map<MyData>((item) => MyData.fromJson(item))
        .toList();
  }

  MyData.fromJson(Map json)
      : namaId = json['namaId'],
        id = json['id'],
        komoditi = json['komoditi'],
        boolKom = json['boolKom'],
        boolKomHarga = json['boolKomHarga'],
        visiKom = json['visiKom'],
        pupuk = (json['pupuk'] as List<dynamic>)
            .map((item) => Pupukw.fromJson(item))
            .toList(),
        luas = json['luas'],
        visiKomHarga = json['visiKomHarga'],
        dataHarga = json['dataHarga'],
        hasilTotal = json['hasilTotal'],
        hasilRp = json['hasilRp'],
        indexsubmenu = json['indexsubmenu'],
        indexmenu = json['indexmenu'],
        idmediatanam = json['idmediatanam'],
        rumus = json['rumus'],
        multi = json['multi'],
        kesimpulansub = json['kesimpulansub'],
        kesimpulanAkhir = json['kesimpulanAkhir'],
        // varii = json['varii'],
        varii = (json["var"] as List<dynamic>)
            .map((item) => DataObjHasilTakaran.fromJson(item))
            .toList(),
        kategoriRumusKu = (json["kategoriRumusKu"] as List<dynamic>)
            .map((item) => KategoriRumus.fromJson(item))
            .toList(),
        propertyLainnya = json['propertyLainnya'];

  MyData deepCopy() {
    return MyData.fromJson(json.decode(json.encode(this)));
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'namaId': namaId,
        'komoditi': komoditi,
        'boolKom': boolKom,
        'boolKomHarga': boolKomHarga,
        'visiKom': visiKom,
        'pupuk': pupuk.map((p) => p.toJson()).toList(),
        'luas': luas,
        'visiKomHarga': visiKomHarga,
        'dataHarga': dataHarga,
        'hasilTotal': hasilTotal,
        'hasilRp': hasilRp,
        'indexsubmenu': indexsubmenu,
        'indexmenu': indexmenu,
        'idmediatanam': idmediatanam,
        'rumus': rumus,
        'multi': multi,
        'kesimpulansub': kesimpulansub,
        'kesimpulanAkhir': kesimpulanAkhir,
        'var': varii.map((v) => v.toJson()).toList(),
        'kategoriRumusKu': kategoriRumusKu.map((k) => k.toJson()).toList(),
        'propertyLainnya': propertyLainnya,
      };

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MyData &&
          runtimeType == other.runtimeType &&
          indexmenu == other.indexmenu &&
          indexsubmenu == other.indexsubmenu &&
          idmediatanam == other.idmediatanam;

  @override
  int get hashCode =>
      indexmenu.hashCode ^
      indexsubmenu.hashCode ^
      idmediatanam.hashCode ^
      namaId.hashCode;

  @override
  String toString() =>
      'Data(indexmenu: $indexmenu, indexsubmenu: $indexsubmenu, idmediatanam: $idmediatanam, namaid: $namaId)';
}

// List<MyData> dataInputDouble = [
//   for (var i = 0; i < datatampungKomw.length; i++)
//     MyData(
//       id: datatampungKomw[i]['id'],
//       komoditi: datatampungKomw[i]['komoditi'],
//       boolKom: datatampungKomw[i]['boolKom'],
//       boolKomHarga: datatampungKomw[i]['boolKomHarga'],
//       visiKom: datatampungKomw[i]['visiKom'],
//       pupuk: datatampungKomw[i]['pupuk'],
//       luas: datatampungKomw[i]['luas'],
//       visiKomHarga: datatampungKomw[i]['visiKomHarga'],
//       dataHarga: datatampungKomw[i]['dataHarga'],
//       hasilTotal: datatampungKomw[i]['hasilTotal'],
//       hasilRp: datatampungKomw[i]['hasilRp'],
//       indexsubmenu: datatampungKomw[i]["indexsubmenu"],
//       indexmenu: datatampungKomw[i]["indexmenu"],
//       idmediatanam: datatampungKomw[i]["idmediatanam"],
//       rumus: datatampungKomw[i]["rumus"],
//       multi: datatampungKomw[i]["multi"],
//       kesimpulansub: datatampungKomw[i]["kesimpulansub"],
//       kesimpulanAkhir: datatampungKomw[i]["kesimpulanAkhir"],
//       varii: datatampungKomw[i]['varii'],
//       kategoriRumusKu: datatampungKomw[i]["kategoriRumusKu"],
//       propertyLainnya: datatampungKomw[i]['propertyLainnya'],
//     )
// ];

class Pupukw {
  bool boolPup;
  bool visiPup;
  String namaPupu;
  String watt;
  String LamaListring;
  String Rumus;
  String hasil;
  String img;

  Pupukw({
    required this.boolPup,
    required this.visiPup,
    required this.namaPupu,
    required this.watt,
    required this.LamaListring,
    required this.Rumus,
    required this.hasil,
    required this.img,
  });

  static Map<String, dynamic> toMap(Pupukw pupukkw) => {
        'boolPup': pupukkw.boolPup,
        'visiPup': pupukkw.visiPup,
        'namaPupu': pupukkw.namaPupu,
        'watt': pupukkw.watt,
        'LamaListring': pupukkw.LamaListring,
        'Rumus': pupukkw.Rumus,
        'hasil': pupukkw.hasil,
        'img': pupukkw.img,
      };

  // Metode toJson baru
  Map<String, dynamic> toJson() => {
        'boolPup': boolPup,
        'visiPup': visiPup,
        'namaPupu': namaPupu,
        'watt': watt,
        'LamaListring': LamaListring,
        'Rumus': Rumus,
        'hasil': hasil,
        'img': img,
      };

  Pupukw.fromJson(Map json)
      : boolPup = json['boolPup'],
        visiPup = json['visiPup'],
        namaPupu = json['namaPupu'],
        watt = json['watt'],
        LamaListring = json['LamaListring'],
        Rumus = json['Rumus'],
        hasil = json['hasil'],
        img = json['img'];

  static String encode(List<Pupukw> pupukkws) => json.encode(
        pupukkws
            .map<Map<String, dynamic>>(
              (pupukkws) => Pupukw.toMap(pupukkws),
            )
            .toList(),
      );

  static List<Pupukw> decodeList(String pupukkwList) =>
      (json.decode(pupukkwList) as List<dynamic>)
          .map<Pupukw>(
            (item) => Pupukw.fromJson(item),
          )
          .toList();
}

class FieldskuMain extends StatefulWidget {
  String? namaTanam;
  final Function(List<MyData> dataParent) onStateChange;
  final String judul;
  final String penjelas;
  final bool waktu;
  final String Function(int indexk) kesimpulanPerKonten;
  final String Function(String hasil) hasilakhir;
  final String judulchild;
  final String hargamulti;
  final int indexsubmenu;
  final int indexmenu;
  final Widget addWidget;
  final int selectidkal;

  FieldskuMain({
    super.key,
    required this.onStateChange,
    required this.judul,
    required this.penjelas,
    required this.hasilakhir,
    required this.kesimpulanPerKonten,
    required this.judulchild,
    required this.indexsubmenu,
    required this.indexmenu,
    required this.hargamulti,
    required this.addWidget,
    required this.waktu,
    required this.selectidkal,
    this.namaTanam,
  });

  @override
  State<FieldskuMain> createState() => _FieldskuMainState();
}

final TextEditingController controllersnama = TextEditingController();
final TextEditingController controllerstlp = TextEditingController();
final TextEditingController controllersDesa = TextEditingController();

int indexProv = 0;

List<String> namaProvss() {
  return dataProvObj.map((e) => e.nama).toList();
}

List<dataKab> namaKabss(int indexProv) {
  return dataKabObj
      .where((element) => int.tryParse(element.idProv) == indexProv)
      .toList();
}

String indexKomoditi = "";
int indexKom = 0;
int ind = 0;
String parentKey = "";
List<String> da = [];
List<dynamic> drowndownk = [];

List<dynamic> golonganListriks(
    int indexkonsumsi, int indexmenuP, String multi) {
  List<dynamic> dro = [];
  if (multi == "no") {
    // print(
    //     "biasa : ${datakategorisubMenuRawatan.where((element) => element.id_MenuRawatan.toString() == indexmenuP.toString()).toList()[indexkonsumsi].variableKetetapan.map((e) => e.keys).toList()}");
    dro = datakategorisubMenuRawatan
        .where((element) =>
            element.id_MenuRawatan.toString() == indexmenuP.toString())
        .toList()
        .map((e) => e.variableKetetapan)
        .toList()
        .map((e) => e.expand((element) => element.values))
        .toList()[indexkonsumsi]
        .expand((element) => element.keys)
        .toList();
  } else {
    List<String> indees = datakategorisubMenuRawatan
        .where((element) =>
            element.id_MenuRawatan.toString() == indexmenuP.toString())
        .toList()[indexkonsumsi]
        .variableKetetapan
        .map((e) => e.keys.last.toString())
        .toList();
    if (indexKomoditi != "") {
      if (indees.contains(indexKomoditi)) {
        ind = indees.indexOf(indexKomoditi);
      } else {
        print(indexKomoditi);
        ind = 0;
      }
      print(indexKomoditi);
    } else {
      ind = 0;
    }
    print(ind);
    dro = Map.of(datakategorisubMenuRawatan
            .where((element) =>
                element.id_MenuRawatan.toString() == indexmenuP.toString())
            .toList()[indexkonsumsi]
            .variableKetetapan[ind]
            .values
            .toList()[0])
        .keys
        .toList();
    print(
        "biasa $indexkonsumsi $dro ${datakategorisubMenuRawatan.where((element) => element.id_MenuRawatan.toString() == indexmenuP.toString()).toList()[indexkonsumsi].variableKetetapan} "
        "${Map.of(datakategorisubMenuRawatan.where((element) => element.id_MenuRawatan.toString() == indexmenuP.toString()).toList()[indexkonsumsi].variableKetetapan[ind].values.toList()[0])}");
  }
  return dro;
}

List<dynamic> golonganRuangans(int indexkonsumsi, int indexmenuP) {
  Map<String, dynamic> loa = datakategorisubMenuRawatan
      .where((element) => element.id_MenuRawatan == indexmenuP.toString())
      .map((e) => e.media)
      .toList()[indexkonsumsi];
  List<dynamic> loas = datakategorisubMenuRawatan
      .where((element) => element.id_MenuRawatan == indexmenuP.toString())
      .map((e) => e.media)
      .toList()[indexkonsumsi]
      .values
      .expand((value) => value.keys)
      .toList();
  return
      // golonganRuangan[indexkonsumsi].values.expand((value) => value.keys).toList();
      datakategorisubMenuRawatan
          .where((element) => element.id_MenuRawatan == indexmenuP.toString())
          .map((e) => e.media)
          .toList()[indexkonsumsi]
          .values
          .expand((value) => value.keys)
          .toList();
}

List<String> namaKecss(int indexKab) {
  return dataKecObj
      .where((element) => int.tryParse(element.idKab) == indexKab)
      .map((e) => e.nama)
      .toList();
}

List<String> namaKomoditiss(int indexmenuP) {
  print("ini errr - $indexmenuP");
  return datakategorisubMenuRawatan
      .where((element) => element.id_MenuRawatan == indexmenuP.toString())
      .toList()
      .map((e) => e.namaKomoditi)
      .toList();
}

String validateMobile(String value) {
  String patttern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
  RegExp regExp = RegExp(patttern);
  if (value.isEmpty) {
    return 'Please enter mobile number';
  } else if (!regExp.hasMatch(value)) {
    return 'Please enter valid mobile number';
  } else {
    return 'Suksess';
  }
}

String namaProv = namaProvss()[0];
String namaKab = "Kabupaten";
int indexKab = 0;
List namaKabs = ["Kabupaten"];
String namaKec = "Kecamatan";
int indexKec = 0;
List namaKecs = ["Kecamatan"];
String luasL = "0.0";
Map alamats = {};
ScrollController _childScrollController = ScrollController();
ScrollController _parentScrollController = ScrollController();
bool AddRuang = false;
bool AddPerangkat = false;

String waktustart = "00:00:00:00";
String waktuEnd = "00:00:00:00";
String berapaJam = "0";

void simpan() async {
  dataPetani[0]["nama"] = controllersnama.text;
  dataPetani[0]["notelp"] = controllerstlp.text;
  dataPetani[0]["id_user"] = c.myUserId.value;
  dataPetani[0]["alamat"]["kec"] = namaKec;
  dataPetani[0]["alamat"]["kab"] = namaKab;
  dataPetani[0]["alamat"]["prov"] = namaProv;
  dataPetani[0]["alamat"]["desa"] = controllersDesa.text;
  // dataPetani[0]["pertanian"] = datatampungKom;
  // setPreference();
  // databaseKu.add(
  //     nama: controllersnama.text,
  //     id_user: c.myUserId.value,
  //     notelp: controllerstlp.text,
  //     alamat: dataPetani[0]["alamat"],
  //     pertanian: dataPetani[0]["pertanian"]);
  // setState(() {});
}

DateTime convertStringToDateTime(String dateTimeString) {
  List<String> dateTimeParts = dateTimeString.split(" ");
  List<String> dateParts = dateTimeParts[0].split("-");
  List<String> timeParts = dateTimeParts[1].split(":");
  int year = int.parse(dateParts[0]);
  int month = int.parse(dateParts[1]);
  int day = int.parse(dateParts[2]);
  int hour = int.parse(timeParts[0]);
  int minute = int.parse(timeParts[1]);
  int second = int.parse(timeParts[2].split('.')[0]);

  return DateTime(year, month, day, hour, minute, second);
}

List<MyData> filterdataobject() {
  List<MyData> dataku = [];
  if (c.indexMenuRawatan.value == 1) {
    dataku = parentData
        .where((element) =>
            element.indexmenu == c.indexMenuRawatan.value &&
            element.indexsubmenu == c.indexsubMenuRawatan.value &&
            element.idmediatanam == c.selectedItemCalcT.value)
        .toList();
    print("id menu : ${c.namaTanaman.value}");
    dataku = dataku
        .where((element) =>
            element.propertyLainnya["namaTanaman"] == c.namaTanaman.value)
        .toList();
  } else {
    dataku = parentData
        .where((element) => element.indexmenu == c.indexMenuRawatan.value)
        .toList();
  }

  return dataku;
  //   (c.indexMenuRawatan.value == 3 || c.indexMenuRawatan.value == 4  || c.indexMenuRawatan.value == 5 )?
  // parentData.where((element) => element.indexmenu == c.indexMenuRawatan.value).toList()
  //     :
  //       (c.indexMenuRawatan.value ==1)?
  //       parentData.where((element) => element.indexmenu == c.indexMenuRawatan.value && element.indexsubmenu == c.indexsubMenuRawatan.value && element.idmediatanam == c.selectedItemCalcT.value).toList().where((element) => element.propertyLainnya["namaTanaman"] == c.namaTanaman.value).toList()
  //     :
  // parentData
  //     .where((element) =>
  // element.indexmenu == c.indexMenuRawatan.value &&
  //     element.indexsubmenu == c.indexsubMenuRawatan.value &&
  //     element.idmediatanam == c.selectedItemCalcT.value)
  //     .toList();
}

// MyData databaru = dataInputDouble[0];
// MyData databaru = dataInputDouble[0];
// MyData databaru = parentData[0];
List<DataObjHasilTakaran>? dataTakaranDosis;
String hasilAkhir = "0";

// Map deepCopyMap(Map original) {
//   Map copiedMap = {};
//   original.forEach((key, value) {
//     if (value is Map) {
//       // Jika nilai adalah map, rekursif buat deep copy
//       copiedMap[key] = deepCopyMap(value);
//     } else if (value is TextEditingController) {
//       // Jika nilai adalah TextEditingController, buat salinan baru
//       copiedMap[key] = value;
//     } else {
//       // Jika nilai adalah tipe data lain, salin nilai langsung
//       copiedMap[key] = value;
//     }
//   });
//   return copiedMap;
// }

// List<MyData>? datafilterMyData;
List<MyData>? datafilterMyData1;

List<MyData> tampungParentData = [];

void fix_updateParentData(List<MyData> dataas) {
  for (var newItem in dataas) {
    int index = 0;
    if (c.indexMenuRawatan.value == 1) {
      index = parentData.indexWhere((element) =>
          element.indexmenu == newItem.indexmenu &&
          element.indexsubmenu == newItem.indexsubmenu &&
          element.idmediatanam == newItem.idmediatanam &&
          element.namaId == newItem.namaId);
    } else {
      index = parentData.indexWhere((element) =>
          element.indexmenu == newItem.indexmenu &&
          element.indexsubmenu == newItem.indexsubmenu &&
          element.idmediatanam == newItem.idmediatanam &&
          element.namaId == newItem.namaId);
    }

    if (index != -1) {
      parentData[index] = newItem;
      print("inder ${{parentData[index].indexmenu: parentData[index].namaId}}");
    } else {
      parentData.add(newItem);
    }
  }
}

class _FieldskuMainState extends State<FieldskuMain> {
  Map dataCopy = deepCopyMap(tambahanPropertyKal[c.indexMenuRawatan.value]);

  Map dataTambahan = tambahanPropertyKal[c.indexMenuRawatan.value];

  //   (c.indexMenuRawatan.value == 3 || c.indexMenuRawatan.value == 4  || c.indexMenuRawatan.value == 5 )?
  // parentData.where((element) => element.indexmenu == c.indexMenuRawatan.value).toList()
  //     :
  //       (c.indexMenuRawatan.value ==1)?
  //       parentData.where((element) => element.indexmenu == c.indexMenuRawatan.value && element.indexsubmenu == c.indexsubMenuRawatan.value && element.idmediatanam == c.selectedItemCalcT.value).toList().where((element) => element.propertyLainnya["namaTanaman"] == c.namaTanaman.value).toList()
  //     :
  // parentData
  //     .where((element) =>
  // element.indexmenu == c.indexMenuRawatan.value &&
  //     element.indexsubmenu == c.indexsubMenuRawatan.value &&
  //     element.idmediatanam == c.selectedItemCalcT.value)
  //     .toList();

  void _updateParentData() {
    // List<MyData> dataku = [];
    // if(c.indexMenuRawatan.value ==1){
    //   dataku = parentData.where((data) =>
    //   data.indexmenu == c.indexMenuRawatan.value &&
    //       data.indexsubmenu == c.indexsubMenuRawatan.value &&
    //       data.idmediatanam == c.selectedItemCalcT.value
    //   ).toList();
    //
    //
    //   dataku = dataku.where((element) => element.propertyLainnya["namaTanaman"] == c.namaTanaman.value).toList();
    //   datafilterMyData1 = dataku;
    //
    // }else{
    //   dataku = parentData.where((element) => element.indexmenu == c.indexMenuRawatan.value).toList();
    //   datafilterMyData1 = dataku;
    // }

    for (var newItem in datafilterMyData1!) {
      int index = 0;
      if (c.indexMenuRawatan.value == 1) {
        index = parentData.indexWhere((element) =>
            element.indexmenu == newItem.indexmenu &&
            element.indexsubmenu == newItem.indexsubmenu &&
            element.idmediatanam == newItem.idmediatanam &&
            element.namaId == newItem.namaId);
      } else {
        index = parentData.indexWhere((element) =>
            element.indexmenu == newItem.indexmenu &&
            element.indexsubmenu == newItem.indexsubmenu &&
            element.idmediatanam == newItem.idmediatanam &&
            element.namaId == newItem.namaId);
      }

      if (index != -1) {
        parentData[index] = newItem;
        print(
            "inder ${{parentData[index].indexmenu: parentData[index].namaId}}");
      } else {
        parentData.add(newItem);
      }
    }
  }

  void filterAndMoveData(List<MyData> datafilterMyData12) {
    // Step 1: Filter data yang memiliki namaId == "0"
    List<MyData> filteredData =
        datafilterMyData12.where((e) => e.namaId == "0").toList();

    // Step 2: Jika ada lebih dari satu, hapus semuanya kecuali yang pertama
    if (filteredData.isNotEmpty) {
      MyData selectedData = filteredData.first;

      // Step 3: Hapus semua data yang memiliki namaId == "0"
      datafilterMyData12.removeWhere((e) => e.namaId == "0");

      // Step 4: Masukkan kembali data yang dipilih ke indeks 0
      datafilterMyData12.insert(0, selectedData);
    }
  }

  void _filterParentData() {
    List<MyData> dataku = [];
    if (c.indexMenuRawatan.value == 1) {
      dataku = parentData
          .where((data) =>
              data.indexmenu == c.indexMenuRawatan.value &&
              data.indexsubmenu == c.indexsubMenuRawatan.value &&
              data.idmediatanam == c.selectedItemCalcT.value &&
              data.propertyLainnya["namaTanaman"] == widget.namaTanam)
          .toList();

      // dataku = dataku.where((element) => element.propertyLainnya["namaTanaman"] == widget.namaTanam).toList();
      datafilterMyData1 = dataku;
    } else {
      dataku = parentData
          .where((element) => element.indexmenu == c.indexMenuRawatan.value)
          .toList();
      datafilterMyData1 = dataku;
    }
    for (var item in dataTambahan.keys.toList()) {
      if (item == "namaTanaman") {
        dataTambahan[item] =
            widget.namaTanam; // Mengubah nilai jika key ditemukan
      }
    }

    filterAndMoveData(datafilterMyData1!);
    if (datafilterMyData1!.where((e) => e.namaId == "0").toList().isEmpty) {
      // if(datafilterMyData1!.isEmpty){
      datafilterMyData1!.insert(
          0,
          MyData(
            komoditi: "0",
            boolKom: false,
            boolKomHarga: false,
            visiKom: false,
            pupuk: [
              Pupukw(
                  boolPup: false,
                  visiPup: false,
                  namaPupu:
                      dataKategoriMenuRawatan[widget.indexmenu].perlengkapan[0],
                  watt: '0',
                  LamaListring: '0',
                  Rumus: '',
                  hasil: '0',
                  img: dataKategoriMenuRawatan[widget.indexmenu].img_banner[1])
            ],
            luas: "",
            visiKomHarga: false,
            dataHarga: drowndownk,
            hasilTotal: '0',
            hasilRp: 0,
            indexsubmenu: c.indexsubMenuRawatan.value,
            indexmenu: c.indexMenuRawatan.value,
            idmediatanam: c.selectedItemCalcT.value,
            rumus: dataKategoriMenuRawatan[widget.indexmenu]
                .rumus[c.selectedItemCalcT.value],
            multi: dataKategoriMenuRawatan[widget.indexmenu].multi,
            kesimpulansub: '',
            kesimpulanAkhir: '',
            // varii: variableObjs()!,
            varii: getDataTakaranDosisTanamanGNew(
                c.indexsubMenuRawatan.value, "(LMt/10000)*JPk", 0.0.toString()),
            kategoriRumusKu: List.of(FdatakategoryRumus(
                c.indexMenuRawatan.value,
                List<KategoriRumus>.from(List.generate(
                  kategoriRumus.length,
                  (i) => KategoriRumus(
                    id: i,
                    idKalkulasi: kategoriRumus[i]["idKalkulasi"],
                    idMediaTanam: kategoriRumus[i]["idMediaTanam"],
                    vari: kategoriRumus[i]["vari"],
                    nama: kategoriRumus[i]["nama"],
                    rumus: kategoriRumus[i]["rumus"],
                    valuess: kategoriRumus[i]["value"],
                    // fieldValue: kategoriRumus[i]
                    //     ["fieldValue"],
                    img: kategoriRumus[i]["img"],
                    id_MenuRawatan: kategoriRumus[i]["id_MenuRawatan"],
                  ),
                )),
                c.selectedItemCalcT.value)),
            propertyLainnya: dataCopy,
            id: parentData.length + 1, namaId: "0",
          ));
      // }
    }

    tampungParentData = dataku;
  }

  // dataku = dataku.where((element) => element.propertyLainnya["namaTanaman"] == c.namaTanaman.value).toList();
  void _addDataToFilteredList(MyData newItem) {
    // int index = 0;
    // if(c.indexMenuRawatan.value ==1){
    // index = datafilterMyData1!.indexWhere((item) =>
    // item.indexmenu == newItem.indexmenu &&
    //     item.indexsubmenu == newItem.indexsubmenu &&
    //     item.idmediatanam == newItem.idmediatanam
    // );}else{
    //   index = datafilterMyData1!.indexWhere((item) =>
    //   item.indexmenu == newItem.indexmenu
    //   );
    // }
    //
    // if (index != -1) {
    //   datafilterMyData1![index] = newItem;
    // } else {
    datafilterMyData1!.add(newItem);

    // }
  }

  void _removeDataFromFilteredList(String namaId) {
    int index = 0;
    index = parentData.indexWhere((element) =>
        element.indexmenu == c.indexMenuRawatan.value &&
        element.namaId == namaId);
    parentData.removeAt(index);
    datafilterMyData1!.removeWhere((item) => item.namaId == namaId);
  }

  void _updateParentDataFromFilter() {
    // Create a map from the filtered list for easy lookups
    Map<String, MyData> filterMap;
    if (c.indexMenuRawatan.value == 1) {
      filterMap = {
        for (var item in datafilterMyData1!)
          '${item.indexmenu}-${item.indexsubmenu}-${item.idmediatanam}': item
      };
    } else {
      filterMap = {
        for (var item in datafilterMyData1!) '${item.indexmenu}': item
      };
    }

    // Combine original parentData with filterMap
    if (c.indexMenuRawatan.value == 1) {
      parentData = parentData
          .where((data) => !filterMap.containsKey(
              '${data.indexmenu}-${data.indexsubmenu}-${data.idmediatanam}'))
          .toList()
        ..addAll(datafilterMyData1!);
    } else {
      parentData = parentData
          .where((data) => !filterMap.containsKey('${data.indexmenu}'))
          .toList()
        ..addAll(datafilterMyData1!);
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _updateParentData();
    super.dispose();

    // // Loop melalui setiap elemen di 'newData'
    // for (var newItem in datafilterMyData1!) {
    //   // Cek apakah ada elemen di parentData dengan idnama yang sama
    //   bool exists = parentData.any((element) =>
    //   element.indexmenu == newItem.indexmenu &&
    //       element.indexsubmenu == newItem.indexsubmenu &&
    //       element.idmediatanam == newItem.idmediatanam &&
    //       element.namaId == newItem.namaId);
    //
    //   // Jika ada, gantikan elemen dengan idnama yang sama
    //   if (exists) {
    //     int index = parentData.indexWhere((element) =>
    //     element.indexmenu == newItem.indexmenu &&
    //         element.indexsubmenu == newItem.indexsubmenu &&
    //         element.idmediatanam == newItem.idmediatanam);
    //     parentData[index] = newItem;
    //   } else {
    //     // Jika idnama berbeda atau tidak ada, tambahkan data baru
    //     parentData.add(newItem);
    //   }
    // }

    // _updateParentDataFromFilter();

    // _updateParentDataFromFilter();

    print("tidaks adasss ${datafilterMyData1!}=> ${parentData.map((a) => [
          a.indexmenu,
          a.indexsubmenu,
          a.idmediatanam
        ]).toList()}");
  }

  @override
  void initState() {
    super.initState();
    // datafilterMyData = filterdataobject();
    // datafilterMyData1 = filterdataobject();
    // Update parentData with newData

    // Filter data based on criteria
    _filterParentData();

    // _updateParentData();
    // Add new data to filtered list

    // Remove data from filtered list

    // Update parentData with filtered data
    // _updateParentDataFromFilter();

    print("tidaks adass ${parentData.map((a) => [
          a.indexmenu,
          a.indexsubmenu,
          a.idmediatanam
        ]).toList()}");

    print("tidaks adas1 ${parentData.map((e) => {e.indexmenu: e.namaId})}");

    // if(dataCopy["namaTanaman"] == ""){
    //   dataCopy["namaTanaman"] = widget.namaTanam;
    // }

    _childScrollController.addListener(() {
      if (_childScrollController.position.pixels ==
          _childScrollController.position.maxScrollExtent) {
        // Child ListView has reached the end, scroll the parent ListView
        _parentScrollController.animateTo(
          _parentScrollController.position.pixels + 100,
          // You can adjust this value
          duration: const Duration(milliseconds: 500),
          // You can adjust the duration
          curve: Curves.ease,
        );
      }
    });

    // if (datafilterMyData1!
    //     .isEmpty) {
    //   databaru = MyData(
    //       komoditi: "Jenis Pemupukan",
    //       boolKom: false,
    //       boolKomHarga: false,
    //       visiKom: false,
    //       pupuk: [
    //         Pupukw(
    //             boolPup: false,
    //             visiPup: false,
    //             namaPupu:
    //             dataKategoriMenuRawatan[widget.indexmenu].perlengkapan[0],
    //             watt: '0',
    //             LamaListring: '0',
    //             Rumus: '0',
    //             hasil: '0',
    //             img: dataKategoriMenuRawatan[widget.indexmenu].img_banner[1])
    //       ],
    //       luas: "0",
    //       visiKomHarga: false,
    //       dataHarga: golonganListriks(widget.indexsubmenu, widget.indexmenu,
    //           (widget.hargamulti == "no") ? "no" : "yes"),
    //       hasilTotal: "0.0",
    //       //ini penting
    //       hasilRp: 0,
    //       indexsubmenu: widget.indexsubmenu,
    //       indexmenu: widget.indexmenu,
    //       idmediatanam: c.selectedItemCalcT.value,
    //       rumus: dataKategoriMenuRawatan[widget.indexmenu]
    //           .rumus[c.selectedItemCalcT.value],
    //       multi: (widget.hargamulti == "no") ? false : true,
    //       kesimpulansub: "",
    //       kesimpulanAkhir: "kesimpulanAkhir",
    //       varii: getDataTakaranDosisTanamanGNew(
    //           c.indexsubMenuRawatan.value, "(LMt/10000)*JPk", 0.0.toString()),
    //       kategoriRumusKu: List.of(FdatakategoryRumus(
    //           c.indexMenuRawatan.value,
    //           List<KategoriRumus>.from(List.generate(
    //             kategoriRumus.length,
    //                 (i) => KategoriRumus(
    //               id: i,
    //               idKalkulasi: kategoriRumus[i]["idKalkulasi"],
    //               idMediaTanam: kategoriRumus[i]["idMediaTanam"],
    //               vari: kategoriRumus[i]["vari"],
    //               nama: kategoriRumus[i]["nama"],
    //               rumus: kategoriRumus[i]["rumus"],
    //               valuess: kategoriRumus[i]["value"],
    //               // fieldValue: kategoriRumus[i]["fieldValue"],
    //               img: kategoriRumus[i]["img"],
    //               id_MenuRawatan: kategoriRumus[i]["id_MenuRawatan"],
    //             ),
    //           )),
    //           c.selectedItemCalcT.value)),
    //       propertyLainnya: dataCopy,id: 0, namaId: '');
    //
    //   if (parentData.isEmpty ){
    //     parentData = [databaru];
    //     print("tidak ada ${parentData}");
    //
    //   }
    //   else{
    //     if (parentData
    //         .isEmpty) {
    //       print("tidaks ada ${parentData}");
    //
    //       parentData.add(databaru);
    //       // datafilterMyData!.add(databaru);
    //       datafilterMyData1!.add(databaru);
    //     }
    //   }
    //
    //   // datafilterMyData1 = filterdataobject();
    //
    // } else {
    //
    // }

    widget.onStateChange(datafilterMyData1!);
    if (c.indexMenuRawatan.value == 1) {
      if (c.AcontrolHarga.value!.isNotEmpty) {
        // print(
        //     "field update ${c.AcontrolHarga.value![0].length == 0}  ${dataHargafix(
        //   c.indexdropdownPrushn.value,
        //   filterCategorybyJenisPemupukan(
        //       c.indexdropdownPrushn.value)[c.indexdropdownjenisPemupukan.value],
        // )}");

        List asp = [];
        Map asp1 = {};
        List.generate(
            dataTakaranDosis!.map((e) => e.idPerusahaan).toList().length,
            (index1) {
          asp.add(dataTakaranDosis!
              .where((element) => element.idPerusahaan == index1)
              .map((e) => e.dataHarga)
              .map((e) {
            List.generate(e.keys.toList().length, (index2) {
              asp1["${e.keys.toList()[index2]}"] =
                  e.values.toList()[index2].toString();
              // TextEditingController(
              // text: e.values.toList()[index2].toString()!);
            });
            return asp1;
          }));
        });

        print(
            "gioal ${asp.map((e) => e)} ${c.AcontrolHarga.value[c.indexdropdownPrushn.value].toList()[c.indexdropdownjenisPemupukan.value].values.toList()}");
      } else {
        dataTakaranDosis = getDataTakaranDosisTanamanGNew(
            c.indexsubMenuRawatan.value, "(LMt/10000)*JPk", 0.0.toString());

        // c.AcontrolHarga.value = List.generate(
        //   dataTakaranDosis!.map((e) => e.dataHarga).toList().length,
        //   (index) => Map.fromEntries(List.generate(
        //       dataTakaranDosis!.map((e) => e.dataHarga).toList()[index].length,
        //       (index1) => MapEntry(
        //           "${dataTakaranDosis!.map((e) => e.dataHarga).toList()[index].keys.toList()[index1]}",
        //           TextEditingController(
        //               text: dataTakaranDosis!
        //                   .map((e) => e.dataHarga)
        //                   .toList()[index]
        //                   .values
        //                   .toList()[index1]
        //                   .toString()!)))),
        // );
        List asp = [];
        List.generate(
            dataTakaranDosis!.map((e) => e.idPerusahaan).toList().length,
            (index1) {
          asp.add(dataTakaranDosis!
              .where((element) => element.idPerusahaan == index1)
              .map((e) => e.dataHarga)
              .map((e) {
            Map asp1 = {};
            List.generate(e.keys.toList().length, (index2) {
              asp1["${e.keys.toList()[index2]}"] =
                  e.values.toList()[index2].toString();
              // TextEditingController(
              // text: e.values.toList()[index2].toString()!);
            });
            return asp1;
          }));
        });
        print("giol ${asp.map((e) => List.of(e).map((e) => e.keys))}");

        c.AcontrolHarga.value = asp;
      }
    }
  }

  bool isDialogOpen = false;

  int indexPW = 0;
  int indexPP = 0;
  int indexSelectmedia = 0;
  String kesimpulanHasil = "0";

  String namasudah = "";

  int? expandedIndex;
  void _addData() {
    showDialog(
      context: context,
      builder: (context) {
        String? namaInput;

        return AlertDialog(
          title: Text('Enter Name'),
          content: TextField(
            onChanged: (value) {
              namaInput = value;
            },
            decoration: InputDecoration(
              hintText: 'Enter a name',
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('OK'),
              onPressed: () {
                if (namaInput != null && namaInput!.isNotEmpty) {
                  bool namaExists = datafilterMyData1!
                      .any((data) => data.namaId == "$namaInput");

                  if (namaExists) {
                    // Show warning dialog
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text('Name Already Exists'),
                          content: Text(
                              'The name "$namaInput" already exists. Please choose a different name.'),
                          actions: <Widget>[
                            TextButton(
                              child: Text('OK'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      },
                    );
                  } else {
                    setState(() {
                      for (var item in dataTambahan.keys.toList()) {
                        if (item == "namaTanaman") {
                          dataTambahan[item] = widget
                              .namaTanam; // Mengubah nilai jika key ditemukan
                        }
                      }
                      dataCopy = deepCopyMap(dataTambahan);
                      _addDataToFilteredList(MyData(
                        komoditi: "0",
                        boolKom: false,
                        boolKomHarga: false,
                        visiKom: false,
                        pupuk: [
                          Pupukw(
                              boolPup: false,
                              visiPup: false,
                              namaPupu:
                                  dataKategoriMenuRawatan[widget.indexmenu]
                                      .perlengkapan[0],
                              watt: '0',
                              LamaListring: '0',
                              Rumus: '',
                              hasil: '0',
                              img: dataKategoriMenuRawatan[widget.indexmenu]
                                  .img_banner[1])
                        ],
                        luas: "",
                        visiKomHarga: false,
                        dataHarga: drowndownk,
                        hasilTotal: '0',
                        hasilRp: 0,
                        indexsubmenu: c.indexsubMenuRawatan.value,
                        indexmenu: widget.indexmenu,
                        idmediatanam: c.selectedItemCalcT.value,
                        rumus: dataKategoriMenuRawatan[widget.indexmenu]
                            .rumus[c.selectedItemCalcT.value],
                        multi: dataKategoriMenuRawatan[widget.indexmenu].multi,
                        kesimpulansub: '',
                        kesimpulanAkhir: '',
                        // varii: variableObjs()!,
                        varii: getDataTakaranDosisTanamanGNew(
                            c.indexsubMenuRawatan.value,
                            "(LMt/10000)*JPk",
                            0.0.toString()),
                        kategoriRumusKu: List.of(FdatakategoryRumus(
                            c.indexMenuRawatan.value,
                            List<KategoriRumus>.from(List.generate(
                              kategoriRumus.length,
                              (i) => KategoriRumus(
                                id: i,
                                idKalkulasi: kategoriRumus[i]["idKalkulasi"],
                                idMediaTanam: kategoriRumus[i]["idMediaTanam"],
                                vari: kategoriRumus[i]["vari"],
                                nama: kategoriRumus[i]["nama"],
                                rumus: kategoriRumus[i]["rumus"],
                                valuess: kategoriRumus[i]["value"],
                                // fieldValue: kategoriRumus[i]
                                //     ["fieldValue"],
                                img: kategoriRumus[i]["img"],
                                id_MenuRawatan: kategoriRumus[i]
                                    ["id_MenuRawatan"],
                              ),
                            )),
                            c.selectedItemCalcT.value)),
                        propertyLainnya: dataCopy,
                        id: parentData.length + 1, namaId: "$namaInput",
                      ));

                      //
                      // _updateParentData();

                      // _updateParentDataFromFilter();

                      _updateParentData();

                      // _updateParentDataFromFilter();

                      saveData();
                    });
                    Navigator.of(context).pop();
                  }
                }
              },
            ),
          ],
        );
      },
    );
  }

  bool isExpanded = false;
  Duration animationDuration = const Duration(milliseconds: 300);
// bool ketemu = false;

  Future<String> loadComplexWidget() async {
    await Future.delayed(Duration(milliseconds: 500)); // Simulasi pemuatan data
    return 'Data loaded';
  }

  @override
  Widget build(BuildContext context) {
    widget.hasilakhir;
    print("datafilterMyData1 widget  => ${parentData.map((e) => {
          e.indexmenu: [e.namaId, e.propertyLainnya["namaTanaman"], e.namaId]
        })}");

    print(
        "tambah1 ${datafilterMyData1!.where((e) => e.namaId == "0").toList().isEmpty} ${datafilterMyData1!.map((e) => {
              e.indexmenu: [
                e.namaId,
                e.propertyLainnya["namaTanaman"],
                e.namaId
              ]
            })}");

    //   if (parentData.isEmpty ){
    //     parentData = [databaru];}
    //
    // if (parentData
    //     .where((element) =>
    //         element.indexmenu == widget.indexmenu &&
    //         element.indexsubmenu == widget.indexsubmenu &&
    //         element.idmediatanam == c.selectedItemCalcT.value)
    //     .isEmpty) {
    //   databaru = MyData(
    //       komoditi: "Jenis Pemupukan",
    //       boolKom: false,
    //       boolKomHarga: false,
    //       visiKom: false,
    //       pupuk: [
    //         Pupukw(
    //             boolPup: false,
    //             visiPup: false,
    //             namaPupu:
    //             dataKategoriMenuRawatan[widget.indexmenu].perlengkapan[0],
    //             watt: '0',
    //             LamaListring: '0',
    //             Rumus: '0',
    //             hasil: '0',
    //             img: dataKategoriMenuRawatan[widget.indexmenu].img_banner[1])
    //       ],
    //       luas: "0",
    //       visiKomHarga: false,
    //       dataHarga: golonganListriks(widget.indexsubmenu, widget.indexmenu,
    //           (widget.hargamulti == "no") ? "no" : "yes"),
    //       hasilTotal: "0.0",
    //       //ini penting
    //       hasilRp: 0,
    //       indexsubmenu: widget.indexsubmenu,
    //       indexmenu: widget.indexmenu,
    //       idmediatanam: c.selectedItemCalcT.value,
    //       rumus: dataKategoriMenuRawatan[widget.indexmenu]
    //           .rumus[c.selectedItemCalcT.value],
    //       multi: (widget.hargamulti == "no") ? false : true,
    //       kesimpulansub: "",
    //       kesimpulanAkhir: "kesimpulanAkhir",
    //       varii: getDataTakaranDosisTanamanGNew(
    //           c.indexsubMenuRawatan.value, "(LMt/10000)*JPk", 0.0.toString()),
    //       kategoriRumusKu: List.of(FdatakategoryRumus(
    //           c.indexMenuRawatan.value,
    //           List<KategoriRumus>.from(List.generate(
    //             kategoriRumus.length,
    //                 (i) => KategoriRumus(
    //               id: i,
    //               idKalkulasi: kategoriRumus[i]["idKalkulasi"],
    //               idMediaTanam: kategoriRumus[i]["idMediaTanam"],
    //               vari: kategoriRumus[i]["vari"],
    //               nama: kategoriRumus[i]["nama"],
    //               rumus: kategoriRumus[i]["rumus"],
    //               valuess: kategoriRumus[i]["value"],
    //               // fieldValue: kategoriRumus[i]["fieldValue"],
    //               img: kategoriRumus[i]["img"],
    //               id_MenuRawatan: kategoriRumus[i]["id_MenuRawatan"],
    //             ),
    //           )),
    //           c.selectedItemCalcT.value)),
    //       propertyLainnya: dataCopy,id: 0, namaId: '');
    //   parentData.add(databaru);
    //   print(
    //       "1 banyak data parentData ${c.selectedItemCalcT.value} ${parentData.length}");
    // } else {
    //   print(
    //       "banyak data parentData ${c.selectedItemCalcT.value} ${datafilterMyData1!.length}");
    // }

    return Scrollbar(
        child: SingleChildScrollView(
      controller: _parentScrollController,
      child: Center(
        child: Padding(
          padding: EdgeInsets.only(
              top: defaultPadding / 2,
              left: defaultPadding,
              right: defaultPadding,
              bottom: defaultPadding / 2),
          child: Stack(
            children: [
              Container(
                // height: SizeConfig.screenHeight! / 1.2,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(20),
                    ),
                    // border: Border.all(color: kTextColor.withOpacity(.8), width: .2),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 10,
                          offset: const Offset(0, 7),
                          color: Colors.black.withOpacity(.5))
                    ]),
                child: Padding(
                  padding: EdgeInsets.all(defaultPadding),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        dataKategoriMenuRawatan[widget.indexmenu].fitur[0],
                        style: TextStyle(
                            fontSize: heightfit(28),
                            color: warnas(
                                dataKategoriMenuRawatan[widget.indexmenu]
                                    .colorku[0]),
                            fontWeight: FontWeight.w700),
                      ),

                      const Divider(
                        color: Colors.black54,
                      ),
                      AutoSizeText(
                        widget.judul,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontStyle: FontStyle.italic,
                            fontSize: 24),
                        minFontSize: 10,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(
                        height: defaultPadding / 2,
                      ),
                      // Container(
                      //   height: 400,
                      //   width: SizeConfig.screenWidth,
                      //   child: AnimatedGridButton(
                      //     initialItemCount: 2,
                      //     crossAxisCount: 2,
                      //     childAspectRatio: 1.0,
                      //     crossAxisSpacing: 10.0,
                      //     mainAxisSpacing: 10.0,
                      //     animationDuration: Duration(milliseconds: 300),
                      //     animationCurve: Curves.easeInOut,
                      //     borderRadius: 15.0,
                      //     padding: 20.0,
                      //   ),
                      // ),
                      // Text(data),
                      // GridView.builder(
                      // shrinkWrap: true,
                      // // Menyesuaikan ukuran dengan jumlah item
                      // physics: const NeverScrollableScrollPhysics(),
                      // padding:
                      // EdgeInsets.symmetric(vertical: defaultPadding),
                      // gridDelegate:
                      // const SliverGridDelegateWithFixedCrossAxisCount(
                      // crossAxisCount: 2,
                      // ),
                      // itemCount: datafilterMyData1!.length,
                      // itemBuilder: (BuildContext context, int reversedIndex) {
                      //
                      //   int indexK = datafilterMyData1!.length - 1 - reversedIndex;
                      //
                      //   isExpanded = expandedIndex == indexK;
                      //   if (indexK == 0) {
                      //     return GestureDetector(
                      //       onTap: () {
                      //         setState(() {
                      //
                      //           _addData();
                      //         });
                      //       },
                      //       child: Card(
                      //         shape: RoundedRectangleBorder(
                      //           borderRadius: BorderRadius.circular(defaultPadding),
                      //         ),
                      //         child: Center(
                      //           child: Icon(Icons.add, size: 40),
                      //         ),
                      //       ),
                      //     );
                      //   }else{
                      //     return GestureDetector(
                      //       onTap: () {
                      //         setState(() {
                      //
                      //           expandedIndex = isExpanded ? null : indexK;
                      //         });
                      //
                      //       },
                      //       child: AnimatedContainer(
                      //         duration: animationDuration,
                      //           curve: Curves.easeInOut,
                      //         padding: EdgeInsets.all(isExpanded ? 0 : defaultPadding),
                      //         child: ClipRRect(
                      //           borderRadius: BorderRadius.circular(defaultPadding),
                      //           child: Stack(
                      //             fit: StackFit.expand,
                      //             children: [
                      //               Image.asset(
                      //                 "${dataKategoriMenuRawatan[c.indexMenuRawatan.value].img_banner[1]}",
                      //                 fit: BoxFit.cover,
                      //               ),
                      //               Container(
                      //                 color: Colors.black.withOpacity(0.1),
                      //               ),
                      //               if (!isExpanded)
                      //                 Center(
                      //                   child: Column(
                      //                     mainAxisAlignment: MainAxisAlignment.center,
                      //                     children: [
                      //                       Icon(Icons.calculate_outlined, size: 40, color: Colors.white),
                      //                       SizedBox(height: defaultPadding/2),
                      //                       AutoSizeText(
                      //                         datafilterMyData1![indexK].namaId,
                      //                         style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,fontSize: 20),
                      //                         maxLines: 1,
                      //                         overflow: TextOverflow.ellipsis,
                      //                       ),
                      //                      ],
                      //                   ),
                      //                 ),
                      //               if (isExpanded)
                      //                 Column(
                      //                   crossAxisAlignment: CrossAxisAlignment.start,
                      //                   children: [
                      //                     Expanded(
                      //                       flex:9,
                      //                       child: Container(
                      //                         padding: EdgeInsets.only(left:defaultPadding),
                      //                         child: Column(
                      //                           crossAxisAlignment: CrossAxisAlignment.start,
                      //                           children: [
                      //                             SizedBox(
                      //                               height: defaultPadding / 2,
                      //                             ),
                      //                             AutoSizeText(
                      //                               datafilterMyData1![indexK].namaId,
                      //                               style: TextStyle(
                      //                                   fontWeight: FontWeight.bold,
                      //                                   color: Colors.white,
                      //                                   fontStyle: FontStyle.italic,
                      //                                   fontSize: 24),
                      //                               minFontSize: 20,
                      //                               maxLines: 1,
                      //                               overflow: TextOverflow.ellipsis,
                      //                             ),
                      //
                      //                             AutoSizeText(
                      //                               "Mulai Hitung",
                      //                               style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,fontSize: 12),
                      //                               maxLines: 1,
                      //                               overflow: TextOverflow.ellipsis,
                      //                             ),
                      //                             SizedBox(
                      //                               height: defaultPadding / 2,
                      //                             ),
                      //
                      //                             ElevatedButton.icon(
                      //                               icon: Icon(Icons.calculate_outlined , color:warnaTema), // Ikon tambah
                      //                               onPressed: (){
                      //                                 showDialog(
                      //                                   context: context,
                      //                                   builder: (BuildContext context) {
                      //                                     TextEditingController _controller = TextEditingController();
                      //                                     return FutureBuilder<String>(
                      //                                       future: loadComplexWidget(),
                      //                                       builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                      //                                         if (snapshot.connectionState == ConnectionState.waiting) {
                      //                                           // Tampilkan animasi loading saat data sedang dimuat
                      //                                           return Center(
                      //                                             child: CircularProgressIndicator(
                      //                                               color: Colors.white,
                      //                                             ), // Bisa diganti dengan animasi lain
                      //                                           );
                      //                                         } else if (snapshot.hasError) {
                      //                                           // Tampilkan pesan error jika terjadi kesalahan
                      //                                           return Center(
                      //                                             child: Text('Error: ${snapshot.error}'),
                      //                                           );
                      //                                         } else {
                      //                                           // Tampilkan widget kompleks setelah data berhasil dimuat
                      //                                           return Dialogku(
                      //                                             onStateChange: () {
                      //
                      //                                               print("cencell ");
                      //
                      //                                             },
                      //                                             indexKomo: indexK,
                      //                                             fields: Fieldkuparent(
                      //                                               index: indexK,
                      //                                               edit_semua: false,
                      //                                               onStateChangePupukw: (int indexPPS) {
                      //                                                 // setState(() {
                      //                                                 indexPP = indexPPS;
                      //
                      //                                                 hasilRps(indexK, widget.indexsubmenu,
                      //                                                     datafilterMyData1!);
                      //                                                 // });
                      //                                               },
                      //                                               Judul: widget.judul,
                      //                                               judulchild: widget.judulchild,
                      //                                               penjelas: '',
                      //                                               dataParent: datafilterMyData1!,
                      //                                               addWidget: widget.addWidget,
                      //                                               waktu: widget.waktu,
                      //                                             ),
                      //                                             nilaiTotal: "5",
                      //                                             indexPupu: indexPP,
                      //                                             indexmenu: widget.indexmenu,
                      //                                             indexsubmenu: widget.indexsubmenu,
                      //                                             dataParent: datafilterMyData1!,
                      //                                           );
                      //                                         }
                      //                                       },
                      //                                     );
                      //
                      //                                   },
                      //                                 );
                      //                               },
                      //                               label: Text('Hitung',style: TextStyle(color: warnaTema),),
                      //                               style: ElevatedButton.styleFrom(
                      //                                 backgroundColor: Colors.white, // Warna tombol
                      //                                 shape: RoundedRectangleBorder(
                      //                                   borderRadius: BorderRadius.circular(5), // Sudut membulat
                      //                                 ),
                      //                                 // Padding tombol
                      //                               ),
                      //                             ),
                      //                           ],
                      //                         ),
                      //                       ),
                      //                     ),
                      //
                      //
                      //                     // Expanded(
                      //                     //   flex:1,
                      //                     //   child: SizedBox(
                      //                     //     height: defaultPadding / 3,
                      //                     //   ),
                      //                     // ),
                      //                     Expanded(
                      //                       flex:3,
                      //                       child: Container(
                      //                         alignment: Alignment.bottomRight,
                      //                         child: Row(
                      //                           mainAxisAlignment: MainAxisAlignment.end,
                      //                           crossAxisAlignment: CrossAxisAlignment.center,
                      //                           children: [
                      //                             AutoSizeText(
                      //                               "Informasi detail",
                      //                               style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,fontSize: 12),
                      //                               maxLines: 1,
                      //                               overflow: TextOverflow.ellipsis,
                      //                             ),
                      //                             IconButton(
                      //                               icon: Icon(Icons.info, size: 25, color: Colors.white),
                      //                               onPressed: () {
                      //
                      //                                 setState(() {
                      //                                   showDialog(
                      //                                     context: context,
                      //                                     builder: (BuildContext context) {
                      //                                       TextEditingController _controller = TextEditingController();
                      //                                       return
                      //                                         AlertDialog(
                      //                                         title: Text('Info detail: \n'),
                      //                                         content: Container(
                      //                                           height: SizeConfig.screenHeight,
                      //                                           width: SizeConfig.screenWidth,
                      //                                           child:
                      //                                           c.indexMenuRawatan.value == 1?
                      //                                           childWidgetFieldTanaman(namaCategory: widget.namaTanam, onChangeState: (totalHarga){
                      //                                             // setState(() {
                      //                                             //
                      //                                             // });
                      //                                           },info: true,
                      //                                           ):c.indexMenuRawatan.value ==3?childWidgetFieldKolam(onChangeState: (totalHarga){
                      //                                             setState(() {
                      //
                      //                                             });
                      //                                           }, info: true,):c.indexMenuRawatan.value ==5?childWidgetFieldAyam(onChangeState: (totalHarga){
                      //                                             setState(() {
                      //
                      //                                             });
                      //                                           }, info: true,):Container()
                      //                                         ),
                      //                                         actions: [
                      //                                           TextButton(
                      //                                             child: Text('Cancel'),
                      //                                             onPressed: () => Navigator.of(context).pop(),
                      //                                           ),
                      //                                           ElevatedButton(
                      //                                             child: Text('Add'),
                      //                                             onPressed: () {
                      //                                               // onAdd(_controller.text);
                      //                                               Navigator.of(context).pop();
                      //                                             },
                      //                                           ),
                      //                                         ],
                      //                                       );
                      //                                     },
                      //                                   );
                      //                                   // datafilterMyData1!.removeAt(indexK);
                      //                                   // _removeDataFromFilteredList("${datafilterMyData1!.map((e) => e.namaId).toList()[indexK]}");
                      //                                   // _updateParentData();
                      //                                   // _updateParentDataFromFilter();
                      //                                   // saveData();
                      //                                 });
                      //                                 if (expandedIndex == indexK) {
                      //                                   expandedIndex = null;
                      //                                 }
                      //
                      //                               },
                      //                             ),
                      //                           ],
                      //                         ),
                      //                       ),
                      //                     ),
                      //                   ],
                      //                 ),
                      //
                      //               Positioned(
                      //                 top: -5,
                      //                 right: -5,
                      //                 child: Container(
                      //                   height: 40,
                      //                   width: 40,
                      //                   decoration: BoxDecoration(
                      //                       color: Colors.red,
                      //                       borderRadius: BorderRadius.only(
                      //                           bottomLeft: Radius.circular(20),
                      //                           bottomRight: Radius.circular(20),
                      //                           topLeft: Radius.circular(20),
                      //                           topRight: Radius.circular(20)),
                      //                       // border:
                      //                       //     Border.all(color: kTextColor.withOpacity(.8), width: .2)
                      //                       boxShadow: [
                      //                         BoxShadow(
                      //                             blurRadius: 10,
                      //                             offset: Offset(-1, 8),
                      //                             color: Colors.green.withOpacity(.3))
                      //                       ]),
                      //                   child: IconButton(
                      //                     icon: Icon(Icons.clear, size: 20, color: Colors.white),
                      //                     onPressed: () {
                      //                       setState(() {
                      //                         setState(() {
                      //                           // datafilterMyData1!.removeAt(indexK);
                      //                           _removeDataFromFilteredList("${datafilterMyData1!.map((e) => e.namaId).toList()[indexK]}");
                      //                           _updateParentData();
                      //                           // _updateParentDataFromFilter();
                      //                           saveData();
                      //                         });
                      //                         if (expandedIndex == indexK) {
                      //                           expandedIndex = null;
                      //                         }
                      //                       });
                      //                     },
                      //                   ),
                      //                 ),
                      //               ),
                      //             ],
                      //           ),
                      //         ),
                      //       ),
                      //     );
                      //   }
                      //
                      // }),

                      GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.symmetric(vertical: defaultPadding),
                        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent:
                              200, // Maksimum lebar setiap item grid
                          mainAxisSpacing:
                              defaultPadding, // Jarak vertikal antar item
                          crossAxisSpacing:
                              defaultPadding, // Jarak horizontal antar item
                          childAspectRatio:
                              3 / 4, // Rasio aspek untuk mengontrol tinggi item
                        ),
                        itemCount: datafilterMyData1!.length,
                        itemBuilder: (BuildContext context, int reversedIndex) {
                          int indexK =
                              datafilterMyData1!.length - 1 - reversedIndex;
                          isExpanded = expandedIndex == indexK;

                          if (indexK == 0) {
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  _addData();
                                });
                              },
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(defaultPadding),
                                ),
                                child: Center(
                                  child: Icon(Icons.add, size: 40),
                                ),
                              ),
                            );
                          } else {
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  expandedIndex = isExpanded ? null : indexK;
                                });
                              },
                              child: AnimatedContainer(
                                duration: animationDuration,
                                curve: Curves.easeInOut,
                                padding: EdgeInsets.all(
                                    isExpanded ? 0 : defaultPadding),
                                child: ClipRRect(
                                  borderRadius:
                                      BorderRadius.circular(defaultPadding),
                                  child: Stack(
                                    fit: StackFit.expand,
                                    children: [
                                      Image.asset(
                                        "${dataKategoriMenuRawatan[c.indexMenuRawatan.value].img_banner[1]}",
                                        fit: BoxFit.cover,
                                      ),
                                      Container(
                                        color: Colors.black.withOpacity(0.1),
                                      ),
                                      if (!isExpanded)
                                        Center(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Icon(Icons.calculate_outlined,
                                                  size: 40,
                                                  color: Colors.white),
                                              SizedBox(
                                                  height: defaultPadding / 2),
                                              AutoSizeText(
                                                datafilterMyData1![indexK]
                                                    .namaId,
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 20),
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ],
                                          ),
                                        ),
                                      if (isExpanded)
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Expanded(
                                              flex: 9,
                                              child: Container(
                                                padding: EdgeInsets.only(
                                                    left: defaultPadding),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    SizedBox(
                                                        height:
                                                            defaultPadding / 2),
                                                    AutoSizeText(
                                                      datafilterMyData1![indexK]
                                                          .namaId,
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.white,
                                                          fontStyle:
                                                              FontStyle.italic,
                                                          fontSize: 24),
                                                      minFontSize: 20,
                                                      maxLines: 1,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                    AutoSizeText(
                                                      "Mulai Hitung",
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 12),
                                                      maxLines: 1,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                    SizedBox(
                                                        height:
                                                            defaultPadding / 2),
                                                    ElevatedButton.icon(
                                                      icon: Icon(
                                                          Icons
                                                              .calculate_outlined,
                                                          color: warnaTema),
                                                      onPressed: () {
                                                        c.ObjectIndexSelectedEdit
                                                            .value = indexK;
                                                        showDialog(
                                                          context: context,
                                                          builder: (BuildContext
                                                              context) {
                                                            return FutureBuilder<
                                                                String>(
                                                              future:
                                                                  loadComplexWidget(),
                                                              builder: (BuildContext
                                                                      context,
                                                                  AsyncSnapshot<
                                                                          String>
                                                                      snapshot) {
                                                                if (snapshot
                                                                        .connectionState ==
                                                                    ConnectionState
                                                                        .waiting) {
                                                                  return Center(
                                                                    child:
                                                                        CircularProgressIndicator(
                                                                      color: Colors
                                                                          .white,
                                                                    ),
                                                                  );
                                                                } else if (snapshot
                                                                    .hasError) {
                                                                  return Center(
                                                                    child: Text(
                                                                        'Error: ${snapshot.error}'),
                                                                  );
                                                                } else {
                                                                  return Dialogku(
                                                                    onStateChange:
                                                                        () {
                                                                      print(
                                                                          'index: $indexK');
                                                                      print(
                                                                          'edit_semua: false');
                                                                      print(
                                                                          'onStateChangePupukw: (int indexPPS) {');
                                                                      // print('  indexPP = $indexPPS;');
                                                                      print(
                                                                          '  hasilRps($indexK, ${widget.indexsubmenu}, ${datafilterMyData1!});');
                                                                      print(
                                                                          '}');
                                                                      print(
                                                                          'Judul: ${widget.judul}');
                                                                      print(
                                                                          'judulchild: ${widget.judulchild}');
                                                                      print(
                                                                          'penjelas: \'\'');
                                                                      print(
                                                                          'dataParent: ${datafilterMyData1!}');
                                                                      print(
                                                                          'addWidget: ${widget.addWidget}');
                                                                      print(
                                                                          'waktu: ${widget.waktu}');
                                                                    },
                                                                    indexKomo:
                                                                        indexK,
                                                                    fields:
                                                                        Fieldkuparent(
                                                                      index:
                                                                          indexK,
                                                                      edit_semua:
                                                                          false,
                                                                      onStateChangePupukw:
                                                                          (int
                                                                              indexPPS) {
                                                                        indexPP =
                                                                            indexPPS;
                                                                        hasilRps(
                                                                            indexK,
                                                                            widget.indexsubmenu,
                                                                            datafilterMyData1!);
                                                                      },
                                                                      Judul: widget
                                                                          .judul,
                                                                      judulchild:
                                                                          widget
                                                                              .judulchild,
                                                                      penjelas:
                                                                          '',
                                                                      dataParent:
                                                                          datafilterMyData1!,
                                                                      addWidget:
                                                                          widget
                                                                              .addWidget,
                                                                      waktu: widget
                                                                          .waktu,
                                                                    ),
                                                                    nilaiTotal:
                                                                        "5",
                                                                    indexPupu:
                                                                        indexPP,
                                                                    indexmenu:
                                                                        widget
                                                                            .indexmenu,
                                                                    indexsubmenu:
                                                                        widget
                                                                            .indexsubmenu,
                                                                    dataParent:
                                                                        datafilterMyData1!,
                                                                  );
                                                                }
                                                              },
                                                            );
                                                          },
                                                        );
                                                      },
                                                      label: Text(
                                                        'Hitung',
                                                        style: TextStyle(
                                                            color: warnaTema),
                                                      ),
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                        backgroundColor:
                                                            Colors.white,
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 3,
                                              child: Container(
                                                alignment:
                                                    Alignment.bottomRight,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    AutoSizeText(
                                                      "Info",
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 12),
                                                      maxLines: 1,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                    IconButton(
                                                      icon: Icon(Icons.info,
                                                          size: 25,
                                                          color: Colors.white),
                                                      onPressed: () {
                                                        setState(() {
                                                          showDialog(
                                                            context: context,
                                                            builder:
                                                                (BuildContext
                                                                    context) {
                                                              return AlertDialog(
                                                                title: Text(
                                                                    'Info detail: \n'),
                                                                content:
                                                                    SizedBox(
                                                                  height: SizeConfig
                                                                      .screenHeight,
                                                                  width: SizeConfig
                                                                      .screenWidth,
                                                                  child: c.indexMenuRawatan
                                                                              .value ==
                                                                          1
                                                                      ? childWidgetFieldTanaman(
                                                                          namaCategory:
                                                                              widget.namaTanam,
                                                                          onChangeState:
                                                                              (totalHarga) {},
                                                                          info:
                                                                              true,
                                                                        )
                                                                      : c.indexMenuRawatan.value ==
                                                                              3
                                                                          ? childWidgetFieldKolam(
                                                                              onChangeState: (totalHarga) {},
                                                                              info: true,
                                                                            )
                                                                          : c.indexMenuRawatan.value == 5
                                                                              ? childWidgetFieldAyam(
                                                                                  onChangeState: (totalHarga) {},
                                                                                  info: true,
                                                                                )
                                                                              : Container(),
                                                                ),
                                                                actions: [
                                                                  TextButton(
                                                                    child: Text(
                                                                        'Cancel'),
                                                                    onPressed: () =>
                                                                        Navigator.of(context)
                                                                            .pop(),
                                                                  ),
                                                                ],
                                                              );
                                                            },
                                                          );
                                                        });
                                                      },
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      Positioned(
                                        top: -5,
                                        right: -5,
                                        child: Container(
                                          height: 40,
                                          width: 40,
                                          decoration: BoxDecoration(
                                            color: Colors.red,
                                            borderRadius: BorderRadius.only(
                                                bottomLeft: Radius.circular(20),
                                                bottomRight:
                                                    Radius.circular(20),
                                                topLeft: Radius.circular(20),
                                                topRight: Radius.circular(20)),
                                            boxShadow: [
                                              BoxShadow(
                                                  blurRadius: 10,
                                                  offset: Offset(-1, 8),
                                                  color: Colors.green
                                                      .withOpacity(.3))
                                            ],
                                          ),
                                          child: IconButton(
                                            icon: Icon(Icons.clear,
                                                size: 20, color: Colors.white),
                                            onPressed: () {
                                              setState(() {
                                                _removeDataFromFilteredList(
                                                    datafilterMyData1!
                                                        .map((e) => e.namaId)
                                                        .toList()[indexK]);
                                                _updateParentData();
                                                saveData();
                                              });
                                              if (expandedIndex == indexK) {
                                                expandedIndex = null;
                                              }
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }
                        },
                      )

                      // GridView.builder(
                      //     shrinkWrap: true,
                      //     // Menyesuaikan ukuran dengan jumlah item
                      //     physics: const NeverScrollableScrollPhysics(),
                      //     padding:
                      //         EdgeInsets.symmetric(vertical: defaultPadding),
                      //     gridDelegate:
                      //         const SliverGridDelegateWithFixedCrossAxisCount(
                      //       crossAxisCount: 2,
                      //     ),
                      //     itemCount: datafilterMyData1!.length,
                      //     itemBuilder: (BuildContext context, int indexK) {
                      //       print("kol${datafilterMyData1!.length}");
                      //
                      //       if (indexK == datafilterMyData1!.length) {
                      //         return FittedBox(
                      //           child: ExpandingCards (
                      //             height: 400,
                      //             indexFix: indexK,
                      //             len: datafilterMyData1!.length,
                      //             gridview: true,
                      //             axisCount: 2,
                      //             onchange: (indekpuu) {
                      //               if (indexK== datafilterMyData1!.length-1){
                      //
                      //
                      //               }else{
                      //                 setState(() {
                      //                   indexSelectmedia =indexK;
                      //                 });
                      //
                      //               }
                      //
                      //               print("indexKnya Apah ${indekpuu} ${indexK} ${datafilterMyData1!.length-1}");
                      //             },
                      //             dialog:
                      //             Dialogku(
                      //               onStateChange: () {
                      //
                      //                 print("cencell ");
                      //                 // showAlertDialog(context);
                      //                 // Future.microtask(() {
                      //                 //   setState(() {
                      //                 //
                      //                 //   });
                      //                 // });
                      //
                      //
                      //               },
                      //               indexKomo: indexK,
                      //               fields: Fieldkuparent(
                      //                 index: indexK,
                      //                 edit_semua: false,
                      //                 onStateChangePupukw: (int indexPPS) {
                      //                   // setState(() {
                      //                   indexPP = indexPPS;
                      //
                      //                   hasilRps(indexK, widget.indexsubmenu,
                      //                       datafilterMyData1!);
                      //                   // });
                      //                 },
                      //                 Judul: widget.judul,
                      //                 judulchild: widget.judulchild,
                      //                 penjelas: '',
                      //                 dataParent: datafilterMyData1!,
                      //                 addWidget: widget.addWidget,
                      //                 waktu: widget.waktu,
                      //               ),
                      //               nilaiTotal: "5",
                      //               indexPupu: indexPP,
                      //               indexmenu: widget.indexmenu,
                      //               indexsubmenu: widget.indexsubmenu,
                      //               dataParent: datafilterMyData1!,
                      //             ),
                      //
                      //             img: dataKategoriMenuRawatan[widget.indexmenu]
                      //                 .img_banner[1],
                      //             title: datafilterMyData1![indexK].namaId,
                      //             subtitle:
                      //             datafilterMyData1!.toList()[indexK].luas,
                      //             penjelas: datafilterMyData1!.toList()[indexK].hasilTotal,
                      //             tambah: (String s) {
                      //               // print(
                      //               //     "tambah sebelum ${indexK} ${parentData.where((element) => element.indexmenu == widget.indexmenu && element.indexsubmenu == widget.indexsubmenu && element.idmediatanam == c.selectedItemCalcT.value).toList().length} => ${parentData.where((element) => element.indexmenu == datafilterMyData![indexK].indexmenu && element.indexsubmenu == datafilterMyData![indexK].indexsubmenu && element.idmediatanam == datafilterMyData![indexK].idmediatanam).toList().map((e) => e.id)}");
                      //
                      //               setState(() {
                      //                 showDialog<String>(
                      //                     context: context,
                      //                     builder: (BuildContext context) => AlertDialog(
                      //                       title: const Text('Nama Object'),
                      //                       content:  Container(
                      //                         width: 100,
                      //                         height: 120,
                      //                         child: Column(
                      //                           children: [
                      //                             Fields(
                      //                               controller: TextEditingController(text: datafilterMyData1![indexK].namaId),
                      //                               satuan: "",
                      //                               title: "Berikan nama",
                      //                               tema: Colors.black,
                      //                               inputType: TextInputType.text,
                      //                               onStateChange: (values) {
                      //                                 setState(() {
                      //                                   if(datafilterMyData1!.map((e) => e.namaId).contains(values)){
                      //                                     showDialog<String>(
                      //                                         context: context,
                      //                                         builder: (BuildContext context) => AlertDialog(
                      //                                           title: const Text('Nama Object Sudah ada'),
                      //                                           content:  Container(
                      //                                             child:
                      //                                             Text(
                      //                                               "Coba dengan nama lain",
                      //                                               style: TextStyle(
                      //                                                   fontSize: heightfit(28),
                      //                                                   fontWeight: FontWeight.w700),
                      //                                             ),
                      //                                           ),
                      //                                           actions: <Widget>[
                      //                                             // TextButton(
                      //                                             //   onPressed: () =>
                      //                                             //       Navigator.pop(context, 'Cancel'),
                      //                                             //   child: const Text('Cancel'),
                      //                                             // ),
                      //                                             TextButton(
                      //                                               onPressed: () =>
                      //                                                   Navigator.pop(context, 'OK'),
                      //                                               child: const Text('OK'),
                      //                                             ),
                      //                                             // Text(
                      //                                             //   namasudah,
                      //                                             //   style: TextStyle(
                      //                                             //       fontSize: heightfit(28),
                      //                                             //       fontWeight: FontWeight.w700),
                      //                                             // ),
                      //                                           ],
                      //                                         ));
                      //                                   }else{
                      //                                     namasudah = "";
                      //                                     if (datafilterMyData1!.length == 1) {
                      //                                       c.ObjectIndexSelectedEdit.value = 0;
                      //                                     }
                      //                                     print(
                      //                                         "TAMBAH=>${c.ObjectIndexSelectedEdit.value}");
                      //                                     c.namaObj.value = values;
                      //                                     // if (datafilterMyData1!.isEmpty){
                      //                                     //   parentData.add(MyData(
                      //                                     //     komoditi: "0",
                      //                                     //     boolKom: false,
                      //                                     //     boolKomHarga: false,
                      //                                     //     visiKom: false,
                      //                                     //     pupuk: [
                      //                                     //       Pupukw(
                      //                                     //           boolPup: false,
                      //                                     //           visiPup: false,
                      //                                     //           namaPupu: dataKategoriMenuRawatan[
                      //                                     //           widget.indexmenu]
                      //                                     //               .perlengkapan[0],
                      //                                     //           watt: '0',
                      //                                     //           LamaListring: '0',
                      //                                     //           Rumus: '',
                      //                                     //           hasil: '0',
                      //                                     //           img: dataKategoriMenuRawatan[
                      //                                     //           widget.indexmenu]
                      //                                     //               .img_banner[1])
                      //                                     //     ],
                      //                                     //     luas: "",
                      //                                     //     visiKomHarga: false,
                      //                                     //     dataHarga: drowndownk,
                      //                                     //     hasilTotal: '0',
                      //                                     //     hasilRp: 0,
                      //                                     //     indexsubmenu: c.indexsubMenuRawatan.value,
                      //                                     //     indexmenu: widget.indexmenu,
                      //                                     //     idmediatanam: c.selectedItemCalcT.value,
                      //                                     //     rumus: dataKategoriMenuRawatan[
                      //                                     //     widget.indexmenu]
                      //                                     //         .rumus[c.selectedItemCalcT.value],
                      //                                     //     multi: dataKategoriMenuRawatan[
                      //                                     //     widget.indexmenu]
                      //                                     //         .multi,
                      //                                     //     kesimpulansub: '',
                      //                                     //     kesimpulanAkhir: '',
                      //                                     //     // varii: variableObjs()!,
                      //                                     //     varii: getDataTakaranDosisTanamanGNew(
                      //                                     //         c.indexsubMenuRawatan.value,
                      //                                     //         "(LMt/10000)*JPk",
                      //                                     //         0.0.toString()),
                      //                                     //     kategoriRumusKu: List.of(
                      //                                     //         FdatakategoryRumus(
                      //                                     //             c.indexMenuRawatan.value,
                      //                                     //             List<KategoriRumus>.from(
                      //                                     //                 List.generate(
                      //                                     //                   kategoriRumus.length,
                      //                                     //                       (i) => KategoriRumus(
                      //                                     //                     id: i,
                      //                                     //                     idKalkulasi: kategoriRumus[i]
                      //                                     //                     ["idKalkulasi"],
                      //                                     //                     idMediaTanam: kategoriRumus[i]
                      //                                     //                     ["idMediaTanam"],
                      //                                     //                     vari: kategoriRumus[i]
                      //                                     //                     ["vari"],
                      //                                     //                     nama: kategoriRumus[i]
                      //                                     //                     ["nama"],
                      //                                     //                     rumus: kategoriRumus[i]
                      //                                     //                     ["rumus"],
                      //                                     //                     valuess: kategoriRumus[i]
                      //                                     //                     ["value"],
                      //                                     //                     // fieldValue: kategoriRumus[i]
                      //                                     //                     //     ["fieldValue"],
                      //                                     //                     img: kategoriRumus[i]["img"],
                      //                                     //                     id_MenuRawatan:
                      //                                     //                     kategoriRumus[i]
                      //                                     //                     ["id_MenuRawatan"],
                      //                                     //                   ),
                      //                                     //                 )),
                      //                                     //             c.selectedItemCalcT.value)),
                      //                                     //     propertyLainnya: dataCopy,
                      //                                     //     id: parentData.length + 1, namaId: "${c.namaObj.value}_0",
                      //                                     //   ));
                      //                                     //   datafilterMyData1![indexK].namaId = values;
                      //                                     // datafilterMyData1!.add(MyData(
                      //                                     //   komoditi: "0",
                      //                                     //   boolKom: false,
                      //                                     //   boolKomHarga: false,
                      //                                     //   visiKom: false,
                      //                                     //   pupuk: [
                      //                                     //     Pupukw(
                      //                                     //         boolPup: false,
                      //                                     //         visiPup: false,
                      //                                     //         namaPupu: dataKategoriMenuRawatan[
                      //                                     //         widget.indexmenu]
                      //                                     //             .perlengkapan[0],
                      //                                     //         watt: '0',
                      //                                     //         LamaListring: '0',
                      //                                     //         Rumus: '',
                      //                                     //         hasil: '0',
                      //                                     //         img: dataKategoriMenuRawatan[
                      //                                     //         widget.indexmenu]
                      //                                     //             .img_banner[1])
                      //                                     //   ],
                      //                                     //   luas: "",
                      //                                     //   visiKomHarga: false,
                      //                                     //   dataHarga: drowndownk,
                      //                                     //   hasilTotal: '0',
                      //                                     //   hasilRp: 0,
                      //                                     //   indexsubmenu: c.indexsubMenuRawatan.value,
                      //                                     //   indexmenu: widget.indexmenu,
                      //                                     //   idmediatanam: c.selectedItemCalcT.value,
                      //                                     //   rumus: dataKategoriMenuRawatan[
                      //                                     //   widget.indexmenu]
                      //                                     //       .rumus[c.selectedItemCalcT.value],
                      //                                     //   multi: dataKategoriMenuRawatan[
                      //                                     //   widget.indexmenu]
                      //                                     //       .multi,
                      //                                     //   kesimpulansub: '',
                      //                                     //   kesimpulanAkhir: '',
                      //                                     //   // varii: variableObjs()!,
                      //                                     //   varii: getDataTakaranDosisTanamanGNew(
                      //                                     //       c.indexsubMenuRawatan.value,
                      //                                     //       "(LMt/10000)*JPk",
                      //                                     //       0.0.toString()),
                      //                                     //   kategoriRumusKu: List.of(
                      //                                     //       FdatakategoryRumus(
                      //                                     //           c.indexMenuRawatan.value,
                      //                                     //           List<KategoriRumus>.from(
                      //                                     //               List.generate(
                      //                                     //                 kategoriRumus.length,
                      //                                     //                     (i) => KategoriRumus(
                      //                                     //                   id: i,
                      //                                     //                   idKalkulasi: kategoriRumus[i]
                      //                                     //                   ["idKalkulasi"],
                      //                                     //                   idMediaTanam: kategoriRumus[i]
                      //                                     //                   ["idMediaTanam"],
                      //                                     //                   vari: kategoriRumus[i]
                      //                                     //                   ["vari"],
                      //                                     //                   nama: kategoriRumus[i]
                      //                                     //                   ["nama"],
                      //                                     //                   rumus: kategoriRumus[i]
                      //                                     //                   ["rumus"],
                      //                                     //                   valuess: kategoriRumus[i]
                      //                                     //                   ["value"],
                      //                                     //                   // fieldValue: kategoriRumus[i]
                      //                                     //                   //     ["fieldValue"],
                      //                                     //                   img: kategoriRumus[i]["img"],
                      //                                     //                   id_MenuRawatan:
                      //                                     //                   kategoriRumus[i]
                      //                                     //                   ["id_MenuRawatan"],
                      //                                     //                 ),
                      //                                     //               )),
                      //                                     //           c.selectedItemCalcT.value)),
                      //                                     //   propertyLainnya: dataCopy,
                      //                                     //   id: parentData.length + 1, namaId: c.namaObj.value,
                      //                                     // ));
                      //                                     // }
                      //                                     // else{
                      //
                      //                                     // datafilterMyData1![indexK].namaId = values;
                      //                                     datafilterMyData1!.add(MyData(
                      //                                       komoditi: "0",
                      //                                       boolKom: false,
                      //                                       boolKomHarga: false,
                      //                                       visiKom: false,
                      //                                       pupuk: [
                      //                                         Pupukw(
                      //                                             boolPup: false,
                      //                                             visiPup: false,
                      //                                             namaPupu: dataKategoriMenuRawatan[
                      //                                             widget.indexmenu]
                      //                                                 .perlengkapan[0],
                      //                                             watt: '0',
                      //                                             LamaListring: '0',
                      //                                             Rumus: '',
                      //                                             hasil: '0',
                      //                                             img: dataKategoriMenuRawatan[
                      //                                             widget.indexmenu]
                      //                                                 .img_banner[1])
                      //                                       ],
                      //                                       luas: "",
                      //                                       visiKomHarga: false,
                      //                                       dataHarga: drowndownk,
                      //                                       hasilTotal: '0',
                      //                                       hasilRp: 0,
                      //                                       indexsubmenu: c.indexsubMenuRawatan.value,
                      //                                       indexmenu: widget.indexmenu,
                      //                                       idmediatanam: c.selectedItemCalcT.value,
                      //                                       rumus: dataKategoriMenuRawatan[
                      //                                       widget.indexmenu]
                      //                                           .rumus[c.selectedItemCalcT.value],
                      //                                       multi: dataKategoriMenuRawatan[
                      //                                       widget.indexmenu]
                      //                                           .multi,
                      //                                       kesimpulansub: '',
                      //                                       kesimpulanAkhir: '',
                      //                                       // varii: variableObjs()!,
                      //                                       varii: getDataTakaranDosisTanamanGNew(
                      //                                           c.indexsubMenuRawatan.value,
                      //                                           "(LMt/10000)*JPk",
                      //                                           0.0.toString()),
                      //                                       kategoriRumusKu: List.of(
                      //                                           FdatakategoryRumus(
                      //                                               c.indexMenuRawatan.value,
                      //                                               List<KategoriRumus>.from(
                      //                                                   List.generate(
                      //                                                     kategoriRumus.length,
                      //                                                         (i) => KategoriRumus(
                      //                                                       id: i,
                      //                                                       idKalkulasi: kategoriRumus[i]
                      //                                                       ["idKalkulasi"],
                      //                                                       idMediaTanam: kategoriRumus[i]
                      //                                                       ["idMediaTanam"],
                      //                                                       vari: kategoriRumus[i]
                      //                                                       ["vari"],
                      //                                                       nama: kategoriRumus[i]
                      //                                                       ["nama"],
                      //                                                       rumus: kategoriRumus[i]
                      //                                                       ["rumus"],
                      //                                                       valuess: kategoriRumus[i]
                      //                                                       ["value"],
                      //                                                       // fieldValue: kategoriRumus[i]
                      //                                                       //     ["fieldValue"],
                      //                                                       img: kategoriRumus[i]["img"],
                      //                                                       id_MenuRawatan:
                      //                                                       kategoriRumus[i]
                      //                                                       ["id_MenuRawatan"],
                      //                                                     ),
                      //                                                   )),
                      //                                               c.selectedItemCalcT.value)),
                      //                                       propertyLainnya: dataCopy,
                      //                                       id: parentData.length + 1, namaId: values,
                      //                                     ));
                      //                                     // }
                      //
                      //                                     // print("ditambah dengan ${getDataTakaranDosisTanamanGNew(c.indexsubMenuRawatan.value, "(LMt/10000)*JPk",variablesNew(dataKategoriRumus[0].rumus),dataKategoriRumus[0].rumus).map((e) => e.variabelLahan).toList()
                      //                                     // }");
                      //                                     // datafilterMyData! = datafilterMyData!;
                      //
                      //                                     setPreference();
                      //                                     saveData();
                      //                                     print("dadsada");
                      //                                     datafilterMyData = filterdataobject();
                      //
                      //                                     Navigator.pop(context, 'OK');
                      //                                   }
                      //
                      //                                   // widget.dataParent.pupuk[indexP].namaPupu =
                      //                                   //     values;
                      //                                   // //hasil_rumus(indexK, widget.datapPu);
                      //                                   // hasilTotal(indexK, indexP, widget.dataParent,
                      //                                   //     widget.waktu);
                      //                                   // onproses(indexK, indexP);
                      //                                   // setPreference();
                      //                                 });
                      //
                      //                               },
                      //
                      //                               enable: true,
                      //                             ),
                      //
                      //                           ],
                      //                         ),
                      //                       ),
                      //                       // actions: <Widget>[
                      //                       //   // TextButton(
                      //                       //   //   onPressed: () =>
                      //                       //   //       Navigator.pop(context, 'Cancel'),
                      //                       //   //   child: const Text('Cancel'),
                      //                       //   // ),
                      //                       //   // TextButton(
                      //                       //   //   onPressed: () =>
                      //                       //   //       Navigator.pop(context, 'OK'),
                      //                       //   //   child: const Text('OK'),
                      //                       //   // ),
                      //                       //   Text(
                      //                       //     namasudah,
                      //                       //     style: TextStyle(
                      //                       //         fontSize: heightfit(28),
                      //                       //         fontWeight: FontWeight.w700),
                      //                       //   ),
                      //                       // ],
                      //                     ));
                      //
                      //
                      //               });
                      //
                      //               // c.dataobjectkalkulator.value.add(c.datahasilfixNew.value);
                      //               // hasilAkhir = c.filterdataParent
                      //               //     .value.map((e) => double.tryParse(e.hasilTotal)!).reduce((value, element) => value + element).toString();
                      //
                      //
                      //             },
                      //             kurang: (s) {
                      //               setState(() {
                      //
                      //                 // parentData.removeWhere((element) => element.namaId == datafilterMyData1![indexK].namaId);
                      //                 datafilterMyData1!.removeAt(indexK);
                      //                 // if (datafilterMyData1!.length >= 1) {
                      //                 //   datafilterMyData1!.removeWhere((element) =>
                      //                 //       element.id ==
                      //                 //           datafilterMyData1!
                      //                 //           .where((element) =>
                      //                 //               element.indexmenu ==
                      //                 //                   datafilterMyData1![indexK]
                      //                 //                       .indexmenu &&
                      //                 //               element.indexsubmenu ==
                      //                 //                   datafilterMyData1![indexK]
                      //                 //                       .indexsubmenu &&
                      //                 //               element.idmediatanam ==
                      //                 //                   datafilterMyData1![indexK]
                      //                 //                       .idmediatanam)
                      //                 //           .toList()
                      //                 //           .map((e) => e.id)
                      //                 //           .toList()
                      //                 //           [indexK]);
                      //                 saveData();
                      //                 setPreference();
                      //                 //}
                      //
                      //
                      //                 datafilterMyData = filterdataobject();
                      //               });
                      //             },
                      //             costume: Container(),
                      //           ),
                      //         );
                      //       }else{
                      //         return FittedBox(
                      //           child: ExpandingCards (
                      //             height: 400,
                      //             indexFix: indexK,
                      //             len: datafilterMyData1!.length,
                      //             gridview: true,
                      //             axisCount: 2,
                      //             onchange: (indekpuu) {
                      //               if (indexK== datafilterMyData1!.length-1){
                      //
                      //
                      //               }else{
                      //                 setState(() {
                      //                   indexSelectmedia =indexK;
                      //                 });
                      //
                      //               }
                      //
                      //               print("indexKnya Apah ${indekpuu} ${indexK} ${datafilterMyData1!.length-1}");
                      //             },
                      //             dialog:
                      //             Dialogku(
                      //               onStateChange: () {
                      //
                      //                 print("cencell ");
                      //                 // showAlertDialog(context);
                      //                 // Future.microtask(() {
                      //                 //   setState(() {
                      //                 //
                      //                 //   });
                      //                 // });
                      //
                      //
                      //               },
                      //               indexKomo: indexK,
                      //               fields: Fieldkuparent(
                      //                 index: indexK,
                      //                 edit_semua: false,
                      //                 onStateChangePupukw: (int indexPPS) {
                      //                   // setState(() {
                      //                   indexPP = indexPPS;
                      //
                      //                   hasilRps(indexK, widget.indexsubmenu,
                      //                       datafilterMyData1!);
                      //                   // });
                      //                 },
                      //                 Judul: widget.judul,
                      //                 judulchild: widget.judulchild,
                      //                 penjelas: '',
                      //                 dataParent: datafilterMyData1!,
                      //                 addWidget: widget.addWidget,
                      //                 waktu: widget.waktu,
                      //               ),
                      //               nilaiTotal: "5",
                      //               indexPupu: indexPP,
                      //               indexmenu: widget.indexmenu,
                      //               indexsubmenu: widget.indexsubmenu,
                      //               dataParent: datafilterMyData1!,
                      //             ),
                      //
                      //             img: dataKategoriMenuRawatan[widget.indexmenu]
                      //                 .img_banner[1],
                      //             title: datafilterMyData1![indexK].namaId,
                      //             subtitle:
                      //             datafilterMyData1!.toList()[indexK].luas,
                      //             penjelas: datafilterMyData1!.toList()[indexK].hasilTotal,
                      //             tambah: (String s) {
                      //               // print(
                      //               //     "tambah sebelum ${indexK} ${parentData.where((element) => element.indexmenu == widget.indexmenu && element.indexsubmenu == widget.indexsubmenu && element.idmediatanam == c.selectedItemCalcT.value).toList().length} => ${parentData.where((element) => element.indexmenu == datafilterMyData![indexK].indexmenu && element.indexsubmenu == datafilterMyData![indexK].indexsubmenu && element.idmediatanam == datafilterMyData![indexK].idmediatanam).toList().map((e) => e.id)}");
                      //
                      //               setState(() {
                      //                 showDialog<String>(
                      //                     context: context,
                      //                     builder: (BuildContext context) => AlertDialog(
                      //                       title: const Text('Nama Object'),
                      //                       content:  Container(
                      //                         width: 100,
                      //                         height: 120,
                      //                         child: Column(
                      //                           children: [
                      //                             Fields(
                      //                               controller: TextEditingController(text: datafilterMyData1![indexK].namaId),
                      //                               satuan: "",
                      //                               title: "Berikan nama",
                      //                               tema: Colors.black,
                      //                               inputType: TextInputType.text,
                      //                               onStateChange: (values) {
                      //                                 setState(() {
                      //                                   if(datafilterMyData1!.map((e) => e.namaId).contains(values)){
                      //                                     showDialog<String>(
                      //                                         context: context,
                      //                                         builder: (BuildContext context) => AlertDialog(
                      //                                           title: const Text('Nama Object Sudah ada'),
                      //                                           content:  Container(
                      //                                             child:
                      //                                             Text(
                      //                                               "Coba dengan nama lain",
                      //                                               style: TextStyle(
                      //                                                   fontSize: heightfit(28),
                      //                                                   fontWeight: FontWeight.w700),
                      //                                             ),
                      //                                           ),
                      //                                           actions: <Widget>[
                      //                                             // TextButton(
                      //                                             //   onPressed: () =>
                      //                                             //       Navigator.pop(context, 'Cancel'),
                      //                                             //   child: const Text('Cancel'),
                      //                                             // ),
                      //                                             TextButton(
                      //                                               onPressed: () =>
                      //                                                   Navigator.pop(context, 'OK'),
                      //                                               child: const Text('OK'),
                      //                                             ),
                      //                                             // Text(
                      //                                             //   namasudah,
                      //                                             //   style: TextStyle(
                      //                                             //       fontSize: heightfit(28),
                      //                                             //       fontWeight: FontWeight.w700),
                      //                                             // ),
                      //                                           ],
                      //                                         ));
                      //                                   }else{
                      //                                     namasudah = "";
                      //                                     if (datafilterMyData1!.length == 1) {
                      //                                       c.ObjectIndexSelectedEdit.value = 0;
                      //                                     }
                      //                                     print(
                      //                                         "TAMBAH=>${c.ObjectIndexSelectedEdit.value}");
                      //                                     c.namaObj.value = values;
                      //                                     // if (datafilterMyData1!.isEmpty){
                      //                                     //   parentData.add(MyData(
                      //                                     //     komoditi: "0",
                      //                                     //     boolKom: false,
                      //                                     //     boolKomHarga: false,
                      //                                     //     visiKom: false,
                      //                                     //     pupuk: [
                      //                                     //       Pupukw(
                      //                                     //           boolPup: false,
                      //                                     //           visiPup: false,
                      //                                     //           namaPupu: dataKategoriMenuRawatan[
                      //                                     //           widget.indexmenu]
                      //                                     //               .perlengkapan[0],
                      //                                     //           watt: '0',
                      //                                     //           LamaListring: '0',
                      //                                     //           Rumus: '',
                      //                                     //           hasil: '0',
                      //                                     //           img: dataKategoriMenuRawatan[
                      //                                     //           widget.indexmenu]
                      //                                     //               .img_banner[1])
                      //                                     //     ],
                      //                                     //     luas: "",
                      //                                     //     visiKomHarga: false,
                      //                                     //     dataHarga: drowndownk,
                      //                                     //     hasilTotal: '0',
                      //                                     //     hasilRp: 0,
                      //                                     //     indexsubmenu: c.indexsubMenuRawatan.value,
                      //                                     //     indexmenu: widget.indexmenu,
                      //                                     //     idmediatanam: c.selectedItemCalcT.value,
                      //                                     //     rumus: dataKategoriMenuRawatan[
                      //                                     //     widget.indexmenu]
                      //                                     //         .rumus[c.selectedItemCalcT.value],
                      //                                     //     multi: dataKategoriMenuRawatan[
                      //                                     //     widget.indexmenu]
                      //                                     //         .multi,
                      //                                     //     kesimpulansub: '',
                      //                                     //     kesimpulanAkhir: '',
                      //                                     //     // varii: variableObjs()!,
                      //                                     //     varii: getDataTakaranDosisTanamanGNew(
                      //                                     //         c.indexsubMenuRawatan.value,
                      //                                     //         "(LMt/10000)*JPk",
                      //                                     //         0.0.toString()),
                      //                                     //     kategoriRumusKu: List.of(
                      //                                     //         FdatakategoryRumus(
                      //                                     //             c.indexMenuRawatan.value,
                      //                                     //             List<KategoriRumus>.from(
                      //                                     //                 List.generate(
                      //                                     //                   kategoriRumus.length,
                      //                                     //                       (i) => KategoriRumus(
                      //                                     //                     id: i,
                      //                                     //                     idKalkulasi: kategoriRumus[i]
                      //                                     //                     ["idKalkulasi"],
                      //                                     //                     idMediaTanam: kategoriRumus[i]
                      //                                     //                     ["idMediaTanam"],
                      //                                     //                     vari: kategoriRumus[i]
                      //                                     //                     ["vari"],
                      //                                     //                     nama: kategoriRumus[i]
                      //                                     //                     ["nama"],
                      //                                     //                     rumus: kategoriRumus[i]
                      //                                     //                     ["rumus"],
                      //                                     //                     valuess: kategoriRumus[i]
                      //                                     //                     ["value"],
                      //                                     //                     // fieldValue: kategoriRumus[i]
                      //                                     //                     //     ["fieldValue"],
                      //                                     //                     img: kategoriRumus[i]["img"],
                      //                                     //                     id_MenuRawatan:
                      //                                     //                     kategoriRumus[i]
                      //                                     //                     ["id_MenuRawatan"],
                      //                                     //                   ),
                      //                                     //                 )),
                      //                                     //             c.selectedItemCalcT.value)),
                      //                                     //     propertyLainnya: dataCopy,
                      //                                     //     id: parentData.length + 1, namaId: "${c.namaObj.value}_0",
                      //                                     //   ));
                      //                                     //   datafilterMyData1![indexK].namaId = values;
                      //                                     // datafilterMyData1!.add(MyData(
                      //                                     //   komoditi: "0",
                      //                                     //   boolKom: false,
                      //                                     //   boolKomHarga: false,
                      //                                     //   visiKom: false,
                      //                                     //   pupuk: [
                      //                                     //     Pupukw(
                      //                                     //         boolPup: false,
                      //                                     //         visiPup: false,
                      //                                     //         namaPupu: dataKategoriMenuRawatan[
                      //                                     //         widget.indexmenu]
                      //                                     //             .perlengkapan[0],
                      //                                     //         watt: '0',
                      //                                     //         LamaListring: '0',
                      //                                     //         Rumus: '',
                      //                                     //         hasil: '0',
                      //                                     //         img: dataKategoriMenuRawatan[
                      //                                     //         widget.indexmenu]
                      //                                     //             .img_banner[1])
                      //                                     //   ],
                      //                                     //   luas: "",
                      //                                     //   visiKomHarga: false,
                      //                                     //   dataHarga: drowndownk,
                      //                                     //   hasilTotal: '0',
                      //                                     //   hasilRp: 0,
                      //                                     //   indexsubmenu: c.indexsubMenuRawatan.value,
                      //                                     //   indexmenu: widget.indexmenu,
                      //                                     //   idmediatanam: c.selectedItemCalcT.value,
                      //                                     //   rumus: dataKategoriMenuRawatan[
                      //                                     //   widget.indexmenu]
                      //                                     //       .rumus[c.selectedItemCalcT.value],
                      //                                     //   multi: dataKategoriMenuRawatan[
                      //                                     //   widget.indexmenu]
                      //                                     //       .multi,
                      //                                     //   kesimpulansub: '',
                      //                                     //   kesimpulanAkhir: '',
                      //                                     //   // varii: variableObjs()!,
                      //                                     //   varii: getDataTakaranDosisTanamanGNew(
                      //                                     //       c.indexsubMenuRawatan.value,
                      //                                     //       "(LMt/10000)*JPk",
                      //                                     //       0.0.toString()),
                      //                                     //   kategoriRumusKu: List.of(
                      //                                     //       FdatakategoryRumus(
                      //                                     //           c.indexMenuRawatan.value,
                      //                                     //           List<KategoriRumus>.from(
                      //                                     //               List.generate(
                      //                                     //                 kategoriRumus.length,
                      //                                     //                     (i) => KategoriRumus(
                      //                                     //                   id: i,
                      //                                     //                   idKalkulasi: kategoriRumus[i]
                      //                                     //                   ["idKalkulasi"],
                      //                                     //                   idMediaTanam: kategoriRumus[i]
                      //                                     //                   ["idMediaTanam"],
                      //                                     //                   vari: kategoriRumus[i]
                      //                                     //                   ["vari"],
                      //                                     //                   nama: kategoriRumus[i]
                      //                                     //                   ["nama"],
                      //                                     //                   rumus: kategoriRumus[i]
                      //                                     //                   ["rumus"],
                      //                                     //                   valuess: kategoriRumus[i]
                      //                                     //                   ["value"],
                      //                                     //                   // fieldValue: kategoriRumus[i]
                      //                                     //                   //     ["fieldValue"],
                      //                                     //                   img: kategoriRumus[i]["img"],
                      //                                     //                   id_MenuRawatan:
                      //                                     //                   kategoriRumus[i]
                      //                                     //                   ["id_MenuRawatan"],
                      //                                     //                 ),
                      //                                     //               )),
                      //                                     //           c.selectedItemCalcT.value)),
                      //                                     //   propertyLainnya: dataCopy,
                      //                                     //   id: parentData.length + 1, namaId: c.namaObj.value,
                      //                                     // ));
                      //                                     // }
                      //                                     // else{
                      //
                      //                                     // datafilterMyData1![indexK].namaId = values;
                      //                                     datafilterMyData1!.add(MyData(
                      //                                       komoditi: "0",
                      //                                       boolKom: false,
                      //                                       boolKomHarga: false,
                      //                                       visiKom: false,
                      //                                       pupuk: [
                      //                                         Pupukw(
                      //                                             boolPup: false,
                      //                                             visiPup: false,
                      //                                             namaPupu: dataKategoriMenuRawatan[
                      //                                             widget.indexmenu]
                      //                                                 .perlengkapan[0],
                      //                                             watt: '0',
                      //                                             LamaListring: '0',
                      //                                             Rumus: '',
                      //                                             hasil: '0',
                      //                                             img: dataKategoriMenuRawatan[
                      //                                             widget.indexmenu]
                      //                                                 .img_banner[1])
                      //                                       ],
                      //                                       luas: "",
                      //                                       visiKomHarga: false,
                      //                                       dataHarga: drowndownk,
                      //                                       hasilTotal: '0',
                      //                                       hasilRp: 0,
                      //                                       indexsubmenu: c.indexsubMenuRawatan.value,
                      //                                       indexmenu: widget.indexmenu,
                      //                                       idmediatanam: c.selectedItemCalcT.value,
                      //                                       rumus: dataKategoriMenuRawatan[
                      //                                       widget.indexmenu]
                      //                                           .rumus[c.selectedItemCalcT.value],
                      //                                       multi: dataKategoriMenuRawatan[
                      //                                       widget.indexmenu]
                      //                                           .multi,
                      //                                       kesimpulansub: '',
                      //                                       kesimpulanAkhir: '',
                      //                                       // varii: variableObjs()!,
                      //                                       varii: getDataTakaranDosisTanamanGNew(
                      //                                           c.indexsubMenuRawatan.value,
                      //                                           "(LMt/10000)*JPk",
                      //                                           0.0.toString()),
                      //                                       kategoriRumusKu: List.of(
                      //                                           FdatakategoryRumus(
                      //                                               c.indexMenuRawatan.value,
                      //                                               List<KategoriRumus>.from(
                      //                                                   List.generate(
                      //                                                     kategoriRumus.length,
                      //                                                         (i) => KategoriRumus(
                      //                                                       id: i,
                      //                                                       idKalkulasi: kategoriRumus[i]
                      //                                                       ["idKalkulasi"],
                      //                                                       idMediaTanam: kategoriRumus[i]
                      //                                                       ["idMediaTanam"],
                      //                                                       vari: kategoriRumus[i]
                      //                                                       ["vari"],
                      //                                                       nama: kategoriRumus[i]
                      //                                                       ["nama"],
                      //                                                       rumus: kategoriRumus[i]
                      //                                                       ["rumus"],
                      //                                                       valuess: kategoriRumus[i]
                      //                                                       ["value"],
                      //                                                       // fieldValue: kategoriRumus[i]
                      //                                                       //     ["fieldValue"],
                      //                                                       img: kategoriRumus[i]["img"],
                      //                                                       id_MenuRawatan:
                      //                                                       kategoriRumus[i]
                      //                                                       ["id_MenuRawatan"],
                      //                                                     ),
                      //                                                   )),
                      //                                               c.selectedItemCalcT.value)),
                      //                                       propertyLainnya: dataCopy,
                      //                                       id: parentData.length + 1, namaId: values,
                      //                                     ));
                      //                                     // }
                      //
                      //                                     // print("ditambah dengan ${getDataTakaranDosisTanamanGNew(c.indexsubMenuRawatan.value, "(LMt/10000)*JPk",variablesNew(dataKategoriRumus[0].rumus),dataKategoriRumus[0].rumus).map((e) => e.variabelLahan).toList()
                      //                                     // }");
                      //                                     // datafilterMyData! = datafilterMyData!;
                      //
                      //                                     setPreference();
                      //                                     saveData();
                      //                                     print("dadsada");
                      //                                     datafilterMyData = filterdataobject();
                      //
                      //                                     Navigator.pop(context, 'OK');
                      //                                   }
                      //
                      //                                   // widget.dataParent.pupuk[indexP].namaPupu =
                      //                                   //     values;
                      //                                   // //hasil_rumus(indexK, widget.datapPu);
                      //                                   // hasilTotal(indexK, indexP, widget.dataParent,
                      //                                   //     widget.waktu);
                      //                                   // onproses(indexK, indexP);
                      //                                   // setPreference();
                      //                                 });
                      //
                      //                               },
                      //
                      //                               enable: true,
                      //                             ),
                      //
                      //                           ],
                      //                         ),
                      //                       ),
                      //                       // actions: <Widget>[
                      //                       //   // TextButton(
                      //                       //   //   onPressed: () =>
                      //                       //   //       Navigator.pop(context, 'Cancel'),
                      //                       //   //   child: const Text('Cancel'),
                      //                       //   // ),
                      //                       //   // TextButton(
                      //                       //   //   onPressed: () =>
                      //                       //   //       Navigator.pop(context, 'OK'),
                      //                       //   //   child: const Text('OK'),
                      //                       //   // ),
                      //                       //   Text(
                      //                       //     namasudah,
                      //                       //     style: TextStyle(
                      //                       //         fontSize: heightfit(28),
                      //                       //         fontWeight: FontWeight.w700),
                      //                       //   ),
                      //                       // ],
                      //                     ));
                      //
                      //
                      //               });
                      //
                      //               // c.dataobjectkalkulator.value.add(c.datahasilfixNew.value);
                      //               // hasilAkhir = c.filterdataParent
                      //               //     .value.map((e) => double.tryParse(e.hasilTotal)!).reduce((value, element) => value + element).toString();
                      //
                      //
                      //             },
                      //             kurang: (s) {
                      //               setState(() {
                      //
                      //                 // parentData.removeWhere((element) => element.namaId == datafilterMyData1![indexK].namaId);
                      //                 datafilterMyData1!.removeAt(indexK);
                      //                 // if (datafilterMyData1!.length >= 1) {
                      //                 //   datafilterMyData1!.removeWhere((element) =>
                      //                 //       element.id ==
                      //                 //           datafilterMyData1!
                      //                 //           .where((element) =>
                      //                 //               element.indexmenu ==
                      //                 //                   datafilterMyData1![indexK]
                      //                 //                       .indexmenu &&
                      //                 //               element.indexsubmenu ==
                      //                 //                   datafilterMyData1![indexK]
                      //                 //                       .indexsubmenu &&
                      //                 //               element.idmediatanam ==
                      //                 //                   datafilterMyData1![indexK]
                      //                 //                       .idmediatanam)
                      //                 //           .toList()
                      //                 //           .map((e) => e.id)
                      //                 //           .toList()
                      //                 //           [indexK]);
                      //                 saveData();
                      //                 setPreference();
                      //                 //}
                      //
                      //
                      //                 datafilterMyData = filterdataobject();
                      //               });
                      //             },
                      //             costume: Container(),
                      //           ),
                      //         );
                      //       }
                      //       // ListView.builder(
                      //       //     itemCount: dataParentfilterfilter.toList().length,
                      //       //     shrinkWrap: true,
                      //       //     // Menyesuaikan ukuran dengan jumlah item
                      //       //     physics: NeverScrollableScrollPhysics(),
                      //       //     scrollDirection: Axis.vertical,
                      //       //     // padding: const EdgeInsets.symmetric(horizontal: 56),
                      //       //     addRepaintBoundaries: true,
                      //       //     itemBuilder: (context, indexK) {
                      //       // final item = dataParentfilterfilter.toList()[index % widget.items.length];
                      //
                      //     }),
                      ,
                      Container(
                        margin: EdgeInsets.all(defaultPadding / 2),
                        decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(5)),
                            border: Border.all(
                                style: BorderStyle.solid,
                                color: Colors.black12.withOpacity(0.3)),
                            color: warnas(
                                dataKategoriMenuRawatan[widget.indexmenu]
                                    .colorku[0])),
                        child: Padding(
                          padding: EdgeInsets.all(defaultPadding),
                          child: AutoSizeText(
                            widget.penjelas,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontStyle: FontStyle.normal,
                                fontSize: 16),
                            // minFontSize: 16,
                            // maxLines: 3,
                            // overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: defaultPadding,
                      ),
                      // Fieldkuparent(
                      //   index: indexK,
                      //   edit_semua: false,
                      //   onStateChangePupukw: (int indexPPS) {
                      //     // setState(() {
                      //     indexPP = indexPPS;
                      //
                      //     hasilRps(indexK, widget.indexsubmenu,
                      //         datafilterMyData!);
                      //     // });
                      //   },
                      //   Judul: widget.judul,
                      //   judulchild: widget.judulchild,
                      //   indexsubmenu: widget.indexsubmenu,
                      //   indexmenu: widget.indexmenu,
                      //   penjelas: '',
                      //   dataParent: datafilterMyData!,
                      //   addWidget: widget.addWidget,
                      //   waktu: widget.waktu,
                      // )

                      Container(
                        color: Colors.white,
                        child: Padding(
                          padding: EdgeInsets.all(defaultPadding / 2),
                          child: AutoSizeText(
                            widget.hasilakhir(hasilAkhir),
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: warnas(
                                    dataKategoriMenuRawatan[widget.indexmenu]
                                        .colorku[0]),
                                fontStyle: FontStyle.normal,
                                fontSize: 30),
                            // minFontSize: 16,
                            // maxLines: 3,
                            // overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                      const Divider(
                        color: Colors.black54,
                      ),
                      // Container(
                      //   height: 50,
                      //   width: 100,
                      //   child: ElevatedButton(
                      //     onPressed: () {
                      //       setState(() {
                      //         simpan();
                      //         if (controllersnama.text == "" ||
                      //             controllerstlp.text == "+62" ||
                      //             namaProv == "Provinsi" ||
                      //             namaKab == "Kabupaten" ||
                      //             namaKec == "Kecamatan") {
                      //           print("data salah");
                      //           c.isviewdialog.value = true;
                      //           c.isviewdialogValid.value = false;
                      //         } else {
                      //           c.isviewdialogValid.value = true;
                      //           c.isviewdialog.value = true;
                      //         }
                      //       });
                      //     },
                      //     style: ElevatedButton.styleFrom(
                      //         padding: EdgeInsets.all(1),
                      //         shape: RoundedRectangleBorder(
                      //           borderRadius: BorderRadius.circular(30),
                      //         ),
                      //         elevation: 0,
                      //         backgroundColor: Colors.green),
                      //     child: Row(
                      //       mainAxisAlignment: MainAxisAlignment.center,
                      //       children: [
                      //         Icon(
                      //           Icons.check,
                      //           size: 15,
                      //           color: Colors.white,
                      //         ),
                      //         Text("Kirim")
                      //       ],
                      //     ),
                      //   ),
                      // ),

                      // CardFields(
                      //   tema: Colors.black45,
                      //   judul: "Pemupukan Petrokimia :",
                      //   columns: Column(children: [
                      //     MenuConversi(
                      //       onChangeState: (propertyKalkulator) {},
                      //       imgs: "assets/images/Petrokimia_logo.png",
                      //       datamenukalkulator: dataPropertyKalkulator, indexmenu: c.indexMenuRawatan.value, indexsubmenu: c.indexsubMenuRawatan.value,
                      //     ),
                      //   ]), onChangeState: () {  }, indexmenu: c.indexMenuRawatan.value, indexsubmenu: c.indexsubMenuRawatan.value,),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}

@override
void hasilTotal(int indexK, int indexFixs, MyData dataParentss, bool waktu) {
  // setState(() {

  dataParentss.pupuk[indexFixs].hasil = (waktu)
      ? (int.parse(dataParentss.pupuk[indexFixs].watt) *
              int.parse(dataParentss.pupuk[indexFixs].LamaListring))
          .toString()
      : int.parse(dataParentss.pupuk[indexFixs].watt).toString();
  // });
  setPreference();
}

class FieldskuChild extends StatefulWidget {
  final int index;
  final int indexPP;
  final String judulchild;
  final String subJudulchild;
  final bool edit_semua;
  final int indexsubmenu;
  final int indexmenu;

  // final List<MyData> datap;
  final MyData dataParent;
  final bool waktu;
  final Function(List<Pupukw>) onStateChangePup;

  const FieldskuChild(
      {super.key,
      required this.index,
      required this.indexPP,
      required this.edit_semua,
      required this.onStateChangePup,
      // required this.datap,
      required this.indexsubmenu,
      required this.indexmenu,
      required this.judulchild,
      required this.subJudulchild,
      required this.dataParent,
      required this.waktu});

  @override
  State<FieldskuChild> createState() => _FieldskuChildState();
}

bool simpanhitung = false;

class _FieldskuChildState extends State<FieldskuChild> {
  List<Widget> fieldspupuk(int indexK, int indexP, bool editSemua) {
    List<Widget> fieldsChild = [];
    // setState(() {
    // print(
    //     "ini Ruang ${widget.datap[indexK].komoditi} dan ini Perangkat ${widget.datap[indexK].pupuk[indexP].namaPupu}");
    fieldsChild =
        List<Widget>.generate(widget.dataParent.pupuk.length, (index) {
      TextEditingController controllers =
          TextEditingController(text: widget.dataParent.pupuk[indexP].namaPupu);
      TextEditingController controllersKolam =
          TextEditingController(text: widget.dataParent.pupuk[indexP].watt);

      @override
      void onPupukChanged(bool newValue) => setState(() {
            widget.dataParent.pupuk[indexP].boolPup = newValue;
            if (widget.dataParent.pupuk[indexP].boolPup) {
              widget.dataParent.pupuk[indexP].visiPup = true;
            } else {
              widget.dataParent.pupuk[indexP].visiPup = false;
              widget.dataParent.pupuk[indexP].namaPupu =
                  dataKategoriMenuRawatan[widget.indexmenu].perlengkapan[0];
            }
          });

      void onproses(int indeK, int indexP) {
        setState(() {
          widget.onStateChangePup(widget.dataParent.pupuk);
        });
      }

      return (indexP == widget.dataParent.pupuk.length - 1)
          ? Container()
          : Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.all(
                  Radius.circular(15),
                ),
                boxShadow: [
                  BoxShadow(
                      blurRadius: 10,
                      offset: const Offset(0, 9),
                      color: kTextColor.withOpacity(.3))
                ],
                border: Border.all(color: kTextColor.withOpacity(.3)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: defaultPadding,
                  ),
                  Center(
                    child: AutoSizeText(
                      widget.judulchild,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontStyle: FontStyle.italic,
                          fontSize: 25),
                      minFontSize: 18,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  // SizedBox(height: defaultPadding,),
                  (widget.dataParent.pupuk[indexP].visiPup == false)
                      ? Transform.scale(
                          scale: 0.85,
                          alignment: Alignment.bottomCenter,
                          child: DropDowns((newActivity) {
                            setState(() {
                              widget.dataParent.pupuk[indexP].namaPupu =
                                  newActivity;
                              onproses(indexK, indexP);
                              hasilTotal(indexK, indexP, widget.dataParent,
                                  widget.waktu);
                              // setPreference();
                            });
                          },
                              Colors.black54,
                              dataKategoriMenuRawatan[widget.indexmenu]
                                  .perlengkapan,
                              dataKategoriMenuRawatan[widget.indexmenu]
                                  .perlengkapan[0],
                              widget.dataParent.pupuk[indexP].namaPupu,
                              "Tambahan Biaya Untuk : ",
                              []))
                      : Transform.scale(
                          scale: 1,
                          alignment: Alignment.bottomCenter,
                          child: Fields(
                            controller: controllers,
                            satuan: "",
                            title: "Perangkat lainnya",
                            tema: Colors.black,
                            inputType: TextInputType.text,
                            onStateChange: (values) {
                              setState(() {
                                widget.dataParent.pupuk[indexP].namaPupu =
                                    values;
                                //hasil_rumus(indexK, widget.datapPu);
                                hasilTotal(indexK, indexP, widget.dataParent,
                                    widget.waktu);
                                onproses(indexK, indexP);
                                // setPreference();
                              });
                            },
                            enable: true,
                          ),
                        ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      AutoSizeText(
                        "Perangkat Lainnya ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontStyle: FontStyle.italic,
                            fontSize: 12),
                        minFontSize: 10,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Checkbox(
                        value: widget.dataParent.pupuk[indexP].boolPup,
                        onChanged: (bool? newValue) {
                          setState(() {
                            if (newValue != null) {
                              onPupukChanged(newValue);
                              //hasil_rumus(indexK, widget.datapPu);
                              onproses(indexK, indexP);
                              hasilTotal(indexK, indexP, widget.dataParent,
                                  widget.waktu);
                              // setPreference();
                            }
                          });
                        },
                      )
                    ],
                  ),
                  Transform.scale(
                    alignment: Alignment.topCenter,
                    scale: 0.85,
                    child: Fields(
                      controller: controllersKolam,
                      satuan: (widget.indexmenu == 2) ? "W" : "Rp",
                      title: (widget.indexmenu == 2)
                          ? "Watt Perangkat Kolam"
                          : "Harga: ",
                      tema: Colors.black,
                      inputType: TextInputType.numberWithOptions(decimal: true),
                      onStateChange: (values) {
                        setState(() {
                          widget.dataParent.pupuk[indexP].watt = values;
                          //hasil_rumus(indexK, widget.datapPu);
                          hasilTotal(
                              indexK, indexP, widget.dataParent, widget.waktu);
                          // setPreference();
                          // widget.datap[index].komoditi = values;
                          // datatampungKom[indexu].komoditi = values;
                        });
                      },
                      enable: true,
                    ),
                  ),
                  (widget.waktu)
                      ? Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: defaultPadding),
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: defaultPadding / 2),
                                child: AutoSizeText(
                                  "Berapa lama Kolam Nyala ? ",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                      fontStyle: FontStyle.normal,
                                      fontSize: 20),
                                  minFontSize: 16,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: defaultPadding / 2),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: defaultPadding / 2,
                                    ),
                                    AutoSizeText(
                                      "Awal Waktu :",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                          fontStyle: FontStyle.normal,
                                          fontSize: 20),
                                      minFontSize: 16,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    AutoSizeText(
                                      waktustart,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                          fontStyle: FontStyle.normal,
                                          fontSize: 14),
                                      minFontSize: 16,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    SizedBox(
                                      height: defaultPadding / 2,
                                    ),
                                    AutoSizeText(
                                      "Akhir Waktu :",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                          fontStyle: FontStyle.normal,
                                          fontSize: 20),
                                      minFontSize: 16,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    AutoSizeText(
                                      waktuEnd,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                          fontStyle: FontStyle.normal,
                                          fontSize: 14),
                                      minFontSize: 16,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    SizedBox(
                                      height: defaultPadding / 2,
                                    ),
                                    AutoSizeText(
                                      "Waktu yang digunakan $berapaJam Jam",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                          fontStyle: FontStyle.normal,
                                          fontSize: 20),
                                      minFontSize: 16,
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: defaultPadding,
                              ),
                              ElevatedButton(
                                onPressed: () async {
                                  // setState(() {

                                  List<DateTime>? dateTimeList =
                                      await showOmniDateTimeRangePicker(
                                    context: context,
                                    startInitialDate: DateTime.now(),
                                    startFirstDate: DateTime(1600)
                                        .subtract(const Duration(days: 3652)),
                                    startLastDate: DateTime.now().add(
                                      const Duration(days: 3652),
                                    ),
                                    endInitialDate: DateTime.now(),
                                    endFirstDate: DateTime(1600)
                                        .subtract(const Duration(days: 3652)),
                                    endLastDate: DateTime.now().add(
                                      const Duration(days: 3652),
                                    ),
                                    is24HourMode: false,
                                    isShowSeconds: false,
                                    minutesInterval: 1,
                                    secondsInterval: 1,
                                    isForce2Digits: true,
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(16)),
                                    constraints: const BoxConstraints(
                                      maxWidth: 350,
                                      maxHeight: 650,
                                    ),
                                    transitionBuilder:
                                        (context, anim1, anim2, child) {
                                      return FadeTransition(
                                        opacity: anim1.drive(
                                          Tween(
                                            begin: 0,
                                            end: 1,
                                          ),
                                        ),
                                        child: child,
                                      );
                                    },
                                    transitionDuration:
                                        const Duration(milliseconds: 200),
                                    barrierDismissible: true,
                                    // selectableDayPredicate: (dateTime) {
                                    //   // Disable 25th Feb 2023
                                    //   if (dateTime == DateTime(2023, 2, 25)) {
                                    //     return false;
                                    //   } else {
                                    //     return true;
                                    //   }
                                    // },
                                  );
                                  setState(() {
                                    DateTime startDateTime =
                                        convertStringToDateTime(
                                            dateTimeList![0].toString());
                                    DateTime endDateTime =
                                        convertStringToDateTime(
                                            dateTimeList[1].toString());
                                    // Menghitung selisih waktu
                                    Duration duration =
                                        endDateTime.difference(startDateTime);

                                    // Menghitung jumlah jam
                                    int hours = duration.inHours;
                                    berapaJam = hours.toString();
                                    waktustart = "${dateTimeList[0]}";
                                    waktuEnd = "${dateTimeList[1]}";

                                    widget.dataParent.pupuk[indexP]
                                        .LamaListring = hours.toString();
                                    //hasil_rumus(indexK, indexP, widget.datapPu);
                                    hasilTotal(indexK, indexP,
                                        widget.dataParent, widget.waktu);
                                    // setPreference();
                                  });
                                  onproses(indexK, indexP);
                                },
                                child: const Text("Atur Waktu"),
                              ),
                              SizedBox(height: heightfit(defaultPadding)),
                              Container(
                                margin: EdgeInsets.all(defaultPadding / 2),
                                decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(5)),
                                    border: Border.all(
                                        style: BorderStyle.solid,
                                        color: Colors.black12.withOpacity(0.3)),
                                    color: warnas(dataKategoriMenuRawatan[
                                            widget.indexmenu]
                                        .colorku[0])),
                                child: Padding(
                                  padding: EdgeInsets.all(defaultPadding),
                                  child: AutoSizeText(
                                    "Anda menggunakan ${widget.dataParent.pupuk[indexP].namaPupu} dengan daya ${widget.dataParent.pupuk[indexP].watt} Watt selama ${widget.dataParent.pupuk[indexP].LamaListring} Jam",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 20),
                                    minFontSize: 16,
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.all(defaultPadding / 2),
                                decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(5)),
                                    border: Border.all(
                                        style: BorderStyle.solid,
                                        color: Colors.black12.withOpacity(0.3)),
                                    color: warnas(dataKategoriMenuRawatan[
                                            widget.indexmenu]
                                        .colorku[0])),
                                child: Padding(
                                  padding: EdgeInsets.all(defaultPadding),
                                  child: AutoSizeText(
                                    "Jadi Total Penggunaan Kolam selama ${widget.dataParent.pupuk[indexP].LamaListring} adalah ${widget.dataParent.pupuk[indexP].hasil} Watt",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 20),
                                    minFontSize: 16,
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                              SizedBox(height: heightfit(defaultPadding)),
                            ],
                          ),
                        )
                      : Container()
                  // buttonPlusMin("Perangkat", "", indexK, indexP),
                ],
              ),
            );
    });

    if (editSemua == true) {
      return fieldsChild;
    } else {
      return [fieldsChild[widget.indexPP]];
    }

    // });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeConfig.screenHeight,
      width: SizeConfig.screenWidth,
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: fieldspupuk(widget.index, widget.indexPP, false).length,
          itemBuilder: (context, index) {
            return fieldspupuk(widget.index, widget.indexPP, false)[index];
          }),
    );
  }
}

class Fieldkuparent extends StatefulWidget {
  final int index;
  final bool edit_semua;
  final String Judul;
  final String judulchild;
  final String penjelas;

  final List<MyData> dataParent;
  final Widget addWidget;
  final bool waktu;
  final Function(int) onStateChangePupukw;

  const Fieldkuparent(
      {super.key,
      required this.index,
      required this.edit_semua,
      required this.onStateChangePupukw,
      required this.Judul,
      required this.judulchild,
      required this.penjelas,
      required this.dataParent,
      required this.addWidget,
      required this.waktu});

  @override
  State<Fieldkuparent> createState() => _FieldkuparentState();
}

int biaya_total = 0;
double biaya_objek = 0.0;

@override
void hasilRps(int indexK, int indexsubmenu, List<MyData> dataParentss) {
  // biaya_objek = double.tryParse(golonganKolam[indexsubmenu].values.toList()[0][dataParentss[indexK].luas])!;
  print(
      "indexsubmenu adalah : ${dataParentss[indexK].luas} $indexsubmenu => $biaya_objek -> ${dataParentss[indexK].luas}");
  setPreference();
}

int indexPPLainnya = 0;

Map<String, double> hargaObject = {
  "objectbiaya": 0.0,
  "tambahanbiaya": 0.0,
  "hasilAkhirPerObject": 0.0
};

String formatRupiah(String nominal) {
  // Mengonversi string ke integer
  double value = double.tryParse(nominal) ?? 0;

  // Menggunakan NumberFormat untuk memformat nilai dalam format mata uang
  final formatCurrency = NumberFormat.currency(locale: 'id_ID', symbol: '');

  // Memformat nilai dan mengembalikannya sebagai string
  return formatCurrency.format(value);
}

int indexhargamulti = 0;
int indexsa = 0;
Map harga = {};
bool JenisPemupukanlainnya = false;

// Map<String,List<dynamic>>? dataInisialRumus;
class _FieldkuparentState extends State<Fieldkuparent> {
  void prosesfield(int index, String datainput) {}

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  String? rumuss;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    int index = 0;
    // datafilterMyData![c.ObjectIndexSelectedEdit.value].varii =
    //     getDataTakaranDosisTanamanGNew(
    //         c.indexsubMenuRawatan.value,
    //         "(LMt/10000)*JPk",
    //         datafilterMyData![c.ObjectIndexSelectedEdit.value].varii
    //             .map((e) => e.variabelLahan)
    //             .first,
    //         dataKategoriRumus[0].rumus);
  }

  @override
  void _onPupukChanged(bool newValue, indexs, List<MyData> dataParentss) =>
      setState(() {
        dataParentss[widget.index].boolKom = newValue;
        if (dataParentss[widget.index].boolKom) {
          dataParentss[widget.index].visiKom = true;
        } else {
          dataParentss[widget.index].visiKom = false;
          // c.datasMyData.value[0].visiKom = false;

          dataParentss[widget.index].komoditi = golonganRuangans(
              c.indexsubMenuRawatan.value, c.indexMenuRawatan.value)[0];
        }
      });

  @override
  void _onPupukChangedHarga(bool newValue, index, List<MyData> dataParentss) =>
      setState(() {
        dataParentss[index].boolKomHarga = newValue;
        if (dataParentss[index].boolKomHarga) {
          dataParentss[index].visiKomHarga = true;
        } else {
          dataParentss[index].visiKomHarga = false;
        }
      });

  Widget? fieldskomoditi(
      int indexK, bool editSemua, int indexmenuP, List<MyData> dataParentss) {
    return Container(
      child: Column(children: [
        Container(
          child: AutoSizeText(
            widget.Judul,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontStyle: FontStyle.italic,
                fontSize: 24),
            minFontSize: 10,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        AutoSizeText(
          dataParentss[indexK].komoditi,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontStyle: FontStyle.italic,
              fontSize: 14),
          minFontSize: 10,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        SizedBox(
          height: heightfit(defaultPadding / 3),
        ),
        Divider(
          height: heightfit(defaultPadding / 1),
          color: Colors.black54,
        ),
        widget.addWidget,
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return widget.addWidget;
    // fieldskomoditi(widget.index, widget.edit_semua,
    //   c.indexMenuRawatan.value, widget.dataParent)!;
  }
}

//
class Dialogku extends StatefulWidget {
  int indexKomo;
  int indexmenu;
  int indexsubmenu;
  int indexPupu;
  String nilaiTotal;
  final List<MyData> dataParent;
  Function() onStateChange;
  Widget fields;

  Dialogku(
      {super.key,
      // required this.indexPupu,
      required this.onStateChange,
      required this.indexKomo,
      required this.indexPupu,
      required this.fields,
      required this.indexmenu,
      required this.indexsubmenu,
      required this.nilaiTotal,
      required this.dataParent});

  @override
  State<Dialogku> createState() => _DialogkuState();
}

class _DialogkuState extends State<Dialogku> {
  String s0 = "";

  List<Widget> listdataWidgets = [];

  @override
  Widget build(BuildContext contexty) {
    return AlertDialog(
      // insetPadding: EdgeInsets.all(defaultPadding/2),
      insetPadding: EdgeInsets.symmetric(horizontal: 10),
      contentPadding:
          EdgeInsets.all(defaultPadding / 2), // Remove padding around content
      titlePadding: EdgeInsets.all(defaultPadding),
      title: Center(
          child: Text(
        (widget.indexmenu.toString() == "1") ? 'Pengaplikasian' : 'Edit',
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
      )),
      content: Container(
          height: SizeConfig.screenHeight,
          width: SizeConfig.screenWidth,
          color: Colors.white,
          child: PopScope(
              canPop: false,
              onPopInvoked: (bool didPop) {
                // if (kDebugMode) {
                print("322$didPop");
                // }
              },
              child: Center(child: widget.fields))),
      actions: <Widget>[
        ElevatedButton(
          onPressed: () {
            widget.onStateChange();

            if (widget.indexmenu.toString() != "0") {
              // setState(() {
              // setPreference();

              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Peringatan'),
                    content: const Text(
                      'Save perhitungan',
                      style: TextStyle(color: Colors.black54),
                    ),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () {
                          // setState(() {
                          // aqw();
                          simpanhitung = false;
                          // datafilterMyData!;
                          // });
                          Navigator.of(context).pop(true);
                          Navigator.of(context).pop();
                        },
                        child: const Text('Tidak'),
                      ),
                      TextButton(
                        onPressed: () {
                          simpanhitung = true;
                          // Future.microtask(() {
                          setState(() {
                            (c.indexMenuRawatan.value == 1)
                                ?
                                // hitungProses()
                                hitungProsesTanaman()
                                : (c.indexMenuRawatan.value == 2)
                                    ? hitungProsesListrik()
                                    : (c.indexMenuRawatan.value == 3)
                                        ? hitungProsesKolam()
                                        : (c.indexMenuRawatan.value == 4)
                                            ? hitungProsesMaggot()
                                            : hitungProsesAyam();
                            // aqw();
                            saveData();
                            Navigator.of(context).pop(true);
                            Navigator.of(context).pop();
                            // widget.onChangeState(datafilterMyData![c
                            //     .ObjectIndexSelectedEdit
                            //     .value].hasilTotal);
                          });
                          // });
                        },
                        child: const Text('Ya'),
                      ),
                    ],
                  );
                },
              );
              // });
            } else {
              hasilRps(
                  widget.indexKomo, widget.indexsubmenu, widget.dataParent);
              print("losss ${widget.nilaiTotal}");
              // if (widget.dataParent[widget.indexKomo]
              //         .pupuk[widget.indexPupu].hasil
              //         .contains('-') ||
              //     widget.dataParent[widget.indexKomo]
              //             .pupuk[widget.indexPupu].hasil ==
              //         "0") {
              //   showDialog(
              //     context: context,
              //     barrierDismissible: false,
              //     builder: (BuildContext context) {
              //       return AlertDialog(
              //         title: const Text('Peringatan'),
              //         content: const Text(
              //             'Harap lengkapi terlebih dahulu Atur Waktu'),
              //         actions: <Widget>[
              //           TextButton(
              //             onPressed: () {
              //               setPreference();
              //               Navigator.of(context).pop(true);
              //             },
              //             child: const Text('OK'),
              //           ),
              //         ],
              //       );
              //     },
              //   );
              // } else {
              setState(() {
                // setPreference();
                saveData();

                Navigator.of(context).pop();
              });
              // }
            }
          },
          style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(1),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 0,
              backgroundColor: Colors.orange),
          child: Padding(
            padding: EdgeInsets.all(heightfit(defaultPadding / 2)),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.edit,
                  size: 15,
                  color: Colors.white,
                ),
                Text(" Edited")
              ],
            ),
          ),
        ),
      ],
    );
  }
}
