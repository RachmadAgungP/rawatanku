import 'package:rawatt/components/card_field.dart';
import 'package:rawatt/components/inputan.dart';
import 'package:rawatt/components/tabCostume.dart';
import 'package:rawatt/constants.dart';
import 'package:rawatt/screens/convert/component/Widget_Jenis_Tanah.dart';
import 'package:rawatt/screens/convert/component/Widget_Massa_Tanah.dart';

import 'package:rawatt/size_config.dart';
import 'package:flutter/material.dart';

import 'package:function_tree/function_tree.dart';

import '../../../components/card_expanded.dart';
import '../../../components/card_img.dart';
import '../../../components/card_penjelas.dart';
import '../../../components/card_pupuk.dart';
import '../../../model/MenuRawatan/mdl_MenuRawatan.dart';
import '../../../model/datafix.dart';
import '../../../model/dosis/fieldku_campur.dart';
import '../../../model/kalkulator/mdl_KatMediatanam.dart';
import '../../../model/kalkulator/mdl_KatRumus.dart';
import '../../../model/kalkulator/mdl_KatTanah.dart';
import '../../../model/perusahaan/mdl_KatPerusahaan.dart';
import '../../../model/product/mdl_Produk.dart';
import '../../../rumus.dart';
import 'package:auto_size_text/auto_size_text.dart';
import '../../details/component/component.dart';
import '../screens/dolomit/Dolomit_display.dart';
import '../screens/dolomit/myMainDolomit.dart';
import '../screens/dosis_pupuk_tanaman/dosis_pupuk_tanaman.dart';
import 'Widget_Jarak_Tanaman.dart';
import 'Widget_pH_indikator.dart';
import 'inisialisasi_var.dart';
import 'package:get/get.dart';

class Pot {
  int id;
  String namaBentuk;
  String img;
  Map<String, dynamic> variabels;
  List<dynamic> fieldValue;
  String rumusStr;
  double rumusVolume;

  String perhitungan;

  Pot(
      {required this.id,
      required this.namaBentuk,
      required this.img,
      required this.variabels,
      required this.fieldValue,
      required this.rumusStr,
      required this.rumusVolume,
      required this.perhitungan});
}

List<String> superscripts = ['⁰', '¹', '²', '³', '⁴', '⁵', '⁶', '⁷', '⁸', '⁹'];
List<String> subscripts = ['₀', '₁', '₂', '₃', '₄', '₅', '₆', '₇', '₈', '₉'];
List<Map<String, dynamic>> dataPot = [
  {
    "id": 0,
    "namaBentuk": "Balok",
    "img": "assets/images/pot/balok.png",
    "variabels": {
      "P_0": ["Panjang0", 0.0],
      "T_0": ["Tinggi0", 0.0],
      "L_0": ["Lebar0", 0.0]
    },
    "fieldValue": [],
    "rumusStr": "P_0 * L_0 * T_0",
    "rumusVolume": 0.0,
    "perhitungan": ""
  },
  {
    "id": 1,
    "namaBentuk": "Kerucut Potong",
    "img": "assets/images/pot/kerucutTerpotong.png",
    "variabels": {
      "Const_0": ["Const0", 1 / 3],
      "T_0": ["Tinggi0", 0.0],
      "Pi": ["Pi", 3.14],
      "R_0": ["Jari0", 0.0],
      "R_1": ["Jari1", 0.0]
    },
    "fieldValue": [],
    "rumusStr": "Const_0 * Pi * T_0 * (R_0^2 + (R_0 * R_1) + R_1^2)",
    "rumusVolume": 1.0,
    "perhitungan": ""
  },
  {
    "id": 2,
    "namaBentuk": "Setengah Bola",
    "img": "assets/images/pot/setengahBola.png",
    "variabels": {
      "Const_0": ["Const0", 2 / 3],
      "T_0": ["Jari0", 0.0],
      "Pi": ["Pi", 3.14]
    },
    "fieldValue": [],
    "rumusStr": " Const_0 * Pi * T_0^3",
    "rumusVolume": 2.0,
    "perhitungan": ""
  },
  {
    "id": 3,
    "namaBentuk": "Tabung",
    "img": "assets/images/pot/tabung.png",
    "variabels": {
      "Pi": ["Pi", 3.14],
      "T_0": ["Tinggi0", 0.0],
      "R_0": ["Jari0", 0.0]
    },
    "fieldValue": [],
    "rumusStr": " Pi * T_0 * R_0^3",
    "rumusVolume": 3.0,
    "perhitungan": ""
  },
  {
    "id": 4,
    "namaBentuk": "ZonaBola",
    "img": "assets/images/pot/zonabola.png",
    "variabels": {
      "Pi": ["Pi", 3.14],
      "T_0": ["Tinggi0", 0.0],
      "Const_0": ["Const0", 6.0],
      "Const_1": ["Const1", 3.0],
      "R_0": ["Jari0", 0.0],
      "R_1": ["Jari1", 0.0]
    },
    "fieldValue": [],
    "rumusStr":
        " (Pi  * T_0)/ Const_0 * ((Const_1 * R_0^2) + (Const_1 * R_1^2) + T_0^2 )",
    "rumusVolume": 4.0,
    "perhitungan": ""
  },
];

List<Pot> listpot = [
  for (var i = 0; i < dataPot.length; i++)
    Pot(
        id: i,
        namaBentuk: dataPot[i]["namaBentuk"],
        img: dataPot[i]["img"],
        variabels: dataPot[i]["variabels"],
        rumusStr: dataPot[i]["rumusStr"],
        fieldValue: dataPot[i]["fieldValue"],
        rumusVolume: dataPot[i]["rumusVolume"],
        perhitungan: dataPot[i]["perhitungan"])
];

String addSatuan(Map<String, dynamic> datapots, String rumuss) {
  for (int i = 0; i < datapots.keys.length; i++) {
    String aw = datapots.keys.elementAt(i);
    rumuss = rumuss.replaceAllMapped(RegExp(aw, caseSensitive: true), (m) {
      if (datapots.keys.elementAt(i).contains("Const") ||
          (datapots.keys.elementAt(i).contains("Pi"))) {
        return datapots.values.elementAt(i)[1].toStringAsFixed(3);
      } else {
        return datapots.values.elementAt(i)[1].toStringAsFixed(3) + "m";
      }
    });
  }
  return rumuss;
}

String convertPangkat(String rumuss) {
  List<String> strSplit = rumuss.split('');
  String caristr = "^";
  List<int> indexStrDitemu = [];
  List<int> indexStrM = [];
  for (int i = 0; i < strSplit.length; i++) {
    if (strSplit[i].contains(caristr)) {
      indexStrDitemu.add(i);
    }
    if (strSplit[i].contains('m')) {
      indexStrM.add(i);
    }
  }
  for (int i = 0; i < indexStrDitemu.length; i++) {
    rumuss = rumuss.replaceAll("m^${strSplit[indexStrDitemu[i] + 1]}",
        "${superscripts[int.tryParse(strSplit[indexStrDitemu[i] + 1])!]}m");
    rumuss = rumuss.replaceAll(strSplit[indexStrM[i]], " m");
  }
  return rumuss;
}

// Ket :
//   Class ini gunanya untuk Menghitung hasil yang dimasukkan di fieldnya sesuai dengan rumusnya.

class WidgetJenisPot extends StatefulWidget {
  final int indexmenu;
  final int indexsubmenu;
  final Color tema;
  final Function(double, double, int) onChangeState;

  const WidgetJenisPot(
      {super.key,
      required this.tema,
      required this.onChangeState,
      required this.indexmenu,
      required this.indexsubmenu});

  @override
  _WidgetJenisPotState createState() => _WidgetJenisPotState();
}

class _WidgetJenisPotState extends State<WidgetJenisPot> {
  int selectedItem = listhasilBeratTanah[0].idPot;
  double volumePot = 0;
  double kedalamanPot = 0;
  List<TextEditingController> myControlers = [];

  void onPress() {
    listpot[selectedItem].fieldValue.asMap().forEach((index, element) {
      listpot[selectedItem]
              .variabels[listpot[selectedItem].variabels.keys.elementAt(index)]
          [1] = (listpot[selectedItem].variabels.keys.elementAt(index).contains(
                  "Const") // jika ada Const maka nilai tidak dapat diubah (Ketetapan)
              ||
              (listpot[selectedItem].variabels.keys.elementAt(index).contains(
                  "Pi"))) // jika ada Pi maka nilai tidak dapat diubah (Ketetapan)
          ? double.tryParse(element.text)
          : double.tryParse(element.text)! / 100;
    });

    kedalamanPot = listpot[selectedItem].variabels["T_0"][1];
    volumePot = convertRumus(
            listpot[selectedItem].variabels, listpot[selectedItem].rumusStr)
        .interpret()
        .toDouble();
    listpot[selectedItem].rumusVolume = volumePot;
    listpot[selectedItem].perhitungan =
        "Volume ${listpot[selectedItem].namaBentuk} \n= ${convertPangkat(addSatuan(listpot[selectedItem].variabels, listpot[selectedItem].rumusStr))}  \n= ${listpot[selectedItem].rumusVolume} m³";

    widget.onChangeState(volumePot, kedalamanPot, selectedItem);
  }

  @override
  Widget build(BuildContext context) {
    if (listpot[selectedItem].fieldValue.isEmpty) {
      myControlers = List.generate(
          listpot[selectedItem].variabels.length,
          (i) => TextEditingController(
              text: (listpot[selectedItem]
                          .variabels
                          .keys
                          .elementAt(i)
                          .contains("Const") ||
                      (listpot[selectedItem]
                          .variabels
                          .keys
                          .elementAt(i)
                          .contains("Pi")))
                  ? (listpot[selectedItem]
                      .variabels
                      .values
                      .elementAt(i)[1]
                      .toString())
                  : "0"));
      listpot[selectedItem].fieldValue = myControlers;
    }

    List<Widget> fields = [];
    for (int i = 0; i < listpot[selectedItem].variabels.length; i++) {
      if (listpot[selectedItem].variabels.keys.elementAt(i).contains("Const") ||
          (listpot[selectedItem].variabels.keys.elementAt(i).contains("Pi"))) {
      } else {
        TextEditingController controllers = List<TextEditingController>.from(
            listpot[selectedItem].fieldValue)[i];
        fields.add(Fields(
          controller: controllers,
          satuan: "cm",
          title: listpot[selectedItem]
              .variabels
              .values
              .elementAt(i)[0]
              .toString()
              .replaceAll("0", ""),
          tema: widget.tema,
          onStateChange: (values) {
            onPress();

            print(
                "coba 1 ${convertRumus(listpot[selectedItem].variabels, listpot[selectedItem].rumusStr)}");
          },
          enable: true,
          inputType: TextInputType.numberWithOptions(decimal: true),
        ));
      }
    }
    print("awal ini selected $selectedItem");
    return CardFields(
      warna: warnas("f1c232"),
      tema: widget.tema,
      judul: "Jenis Pot : ",
      columns: TabButtonku(
        typetema: 2,
        temaWarna: widget.tema,
        initialStateselected: selectedItem,
        dataCategoryList: listpot.map((e) => e.namaBentuk).toList(),
        dataCategoryImgList: listpot.map((e) => e.img).toList(),
        onStateChange: (selected, categoryDetail) {
          // setState(() {
          selectedItem = selected;
          categoryDetail = categoryDetail;
          onPress();
          // });
        },
        listWidgetPageView: List<Widget>.generate(
            listpot.length,
            (index) => Padding(
                  padding: EdgeInsets.only(
                      top: heightfit(defaultPadding / 2),
                      // left: widthfit(defaultPadding / 2),
                      bottom: heightfit(defaultPadding / 2)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: heightfit(150),
                        width: widthfit(150),
                        child: ItemPot(
                          tema: (selectedItem == index)
                              ? widget.tema
                              : Colors.grey.shade400,
                          img: listpot[selectedItem].img,
                          index: selectedItem,
                          onStateChange: (indexs) {
                            // setState(() {
                            selectedItem = indexs;
                            // });
                          },
                        ),
                      ),
                      Column(
                        children: fields,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: heightfit(defaultPadding / 2),
                            left: widthfit(defaultPadding)),
                        child: Text.rich(TextSpan(children: [
                          TextSpan(
                              text: "${listpot[selectedItem].namaBentuk}\n",
                              style: TextStyle(
                                  color: widget.tema, fontSize: heightfit(20))),
                          (listpot[selectedItem].rumusVolume != 0.0)
                              ? TextSpan(
                                  text: " ${listpot[selectedItem].perhitungan}",
                                  style: TextStyle(
                                      color: widget.tema,
                                      fontSize: heightfit(20)))
                              : TextSpan(
                                  text: "Perlu Diisi..",
                                  style: TextStyle(
                                      color: widget.tema,
                                      fontSize: heightfit(20))),
                        ])),
                      ),
                    ],
                  ),
                )),
      ),
      onChangeState: () {},
      indexmenu: widget.indexmenu,
      indexsubmenu: widget.indexsubmenu,
    );
  }
}

class ItemPot extends StatelessWidget {
  const ItemPot({
    super.key,
    required this.tema,
    required this.img,
    required this.index,
    required this.onStateChange,
  });
  final String img;
  final Color tema;
  final int index;
  final Function(int indexs) onStateChange;

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: warna,
      child: FittedBox(
        child: Container(
          height: 100,
          width: 100,
          margin: EdgeInsets.all(defaultPadding / 3),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              boxShadow: [
                BoxShadow(
                    blurRadius: 10,
                    offset: Offset(0, 5),
                    color: tema.withOpacity(.3))
              ],
            ),
            child: ElevatedButton(
                onPressed: () {
                  onStateChange(index);
                  // print("index $index");
                },
                autofocus: true,
                style: ElevatedButton.styleFrom(
                    shadowColor: tema.withOpacity(.3),
                    padding: EdgeInsets.all(defaultPadding / 2),
                    side: BorderSide(color: tema.withOpacity(0.3), width: 2.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    elevation: 0,
                    backgroundColor: Colors.white),
                child: Image.asset(img)
                // ),
                ),
          ),
        ),
      ),
    );
  }
}

class childWidgetField extends StatefulWidget {
  final Function(String) onChangeState;

  const childWidgetField({
    super.key,
    required this.onChangeState,
  });

  @override
  State<childWidgetField> createState() => _childWidgetFieldState();
}

int indexMediaLahan = 0;
// Map dataRumusLuasLahan = {};
// double hasilLahan = 0.0;
// // int indexObjectIndexSelectedEdit = 0;

String hargapH = "0";
BuildContext? contexty;
MyData? MyDataFilterOBJ;

// List<KategoriRumus> datakategorirum = [];

double hargaTotalpH = 0;

Map<dynamic, dynamic> hargaDosis = {};
Map<dynamic, dynamic> aDosis = {};

Map<String, String> hagaDosis = {};

void hitungProses() {
  dataProductsObj.where((element) => element.nama == "dolomit").first.harga =
      hargapH;

  hagaDosis.forEach((key, value) {
    dataProductsObj.where((element) => element.nama == key).first.harga =
        hagaDosis[key]!;
  });

  if (MyDataFilterOBJ!.propertyLainnya["adaUkurPH"] == false) {
    hargaTotalpH = 0;
  } else {
    hargaTotalpH = double.tryParse(hargapH)! * (cariValue("KpH") * 1000);
  }

  // Perhitungan takaran berdasarkan bentuk lahan
  if (MyDataFilterOBJ!.propertyLainnya["adaJenisTanah"] == true) {
    c.massaJenis.value = cariValue("q");

    onPresosMtT(c.id_type_tanah.value, false, "m");
    hitung(c.indexsubMenuRawatan.value, "(bTPt/bTHa)*JPk",
        cariValue("vTPt").toString());
  } else {
    if (MyDataFilterOBJ!.propertyLainnya["adaUkurPH"] == false) {
      hargaTotalpH = 0;
    }
    onPresospH(
        (filterdataobject()[c.ObjectIndexSelectedEdit.value]
                    .propertyLainnya["pHData"]["hasil"] ==
                null)
            ? 0
            : cariValue("pH"),
        "m");
    hitung(c.indexsubMenuRawatan.value, "(LMt/10000)*JPk",
        cariValue("LMt").toString());
  }

  filterdataobject()[c.ObjectIndexSelectedEdit.value] = MyDataFilterOBJ!;

  filterdataobject()[c.ObjectIndexSelectedEdit.value].kategoriRumusKu =
      MyDataFilterOBJ!.kategoriRumusKu;
  filterdataobject()[c.ObjectIndexSelectedEdit.value].kategoriRumusKu[
      MyDataFilterOBJ!.propertyLainnya["tampungan"]
          ["indexBentukMediaTanam"]] = MyDataFilterOBJ!.kategoriRumusKu[
      MyDataFilterOBJ!.propertyLainnya["tampungan"]["indexBentukMediaTanam"]];

  filterdataobject()[c.ObjectIndexSelectedEdit.value].luas =
      MyDataFilterOBJ!.luas;

  filterdataobject()[c.ObjectIndexSelectedEdit.value]
      .propertyLainnya["pHData"] = {
    "pHDiket": listPHIndikator[0].variabels["pHDiket"][1],
    "pHDitanya": listPHIndikator[0].variabels["pHDitanya"][1],
    "hasil": datainputan.value[2]
  };

  filterdataobject()[c.ObjectIndexSelectedEdit.value]
          .propertyLainnya["satuanMediaLahan"][1] =
      MyDataFilterOBJ!.propertyLainnya["satuanMediaLahan"][1];
  filterdataobject()[c.ObjectIndexSelectedEdit.value]
          .propertyLainnya["satuanMediaLahan"][0] =
      MyDataFilterOBJ!.propertyLainnya["satuanMediaLahan"][0];

  filterdataobject()[c.ObjectIndexSelectedEdit.value]
          .propertyLainnya["ketebalanTanah"] =
      MyDataFilterOBJ!.propertyLainnya["ketebalanTanah"];

  filterdataobject()[c.ObjectIndexSelectedEdit.value]
          .propertyLainnya["adaUkurPH"] =
      MyDataFilterOBJ!.propertyLainnya["adaUkurPH"];

  filterdataobject()[c.ObjectIndexSelectedEdit.value]
          .propertyLainnya["adaJenisTanah"] =
      MyDataFilterOBJ!.propertyLainnya["adaJenisTanah"];

  filterdataobject()[c.ObjectIndexSelectedEdit.value]
          .propertyLainnya["tampungan"]["indexJenisTanah"] =
      MyDataFilterOBJ!.propertyLainnya["tampungan"]["indexJenisTanah"];

  filterdataobject()[c.ObjectIndexSelectedEdit.value]
          .propertyLainnya["tampungan"]["indexperusahaan"] =
      MyDataFilterOBJ!.propertyLainnya["tampungan"]["indexperusahaan"];

  filterdataobject()[c.ObjectIndexSelectedEdit.value]
          .propertyLainnya["tampungan"]["indexperusahaan"] =
      c.indexdropdownPrushn.value;

  filterdataobject()[c.ObjectIndexSelectedEdit.value]
          .propertyLainnya["tampungan"]["indexjenisPupuk"] =
      MyDataFilterOBJ!.propertyLainnya["tampungan"]["indexjenisPupuk"];

  filterdataobject()[c.ObjectIndexSelectedEdit.value]
          .propertyLainnya["keperluanLainnya"] =
      MyDataFilterOBJ!.propertyLainnya["keperluanLainnya"];

  hargaDosis.keys.toList().forEach((elementw) {
    dataProductsObj
        .where((element) => element.nama == elementw)
        .toList()
        .last
        .harga = hargaDosis[elementw].toString();
  });

  aqw();

  setPreference();
}

void aqw() {
  if (MyDataFilterOBJ!.propertyLainnya["adaUkurPH"] == false) {
    hargaTotalpH = 0;
  } else {
    hargaTotalpH = double.tryParse(hargapH)! * (cariValue("KpH") * 1000);
  }
  filterdataobject()[c.ObjectIndexSelectedEdit.value].hasilTotal =
      (hitungHarga(aDosis, hargaDosis)
                  .values
                  .toList()
                  .reduce((value, element) => value + element) +
              (hargaTotalpH +
                  List.of(MyDataFilterOBJ!.propertyLainnya["keperluanLainnya"])
                      .map((e) => double.tryParse(e["Beban Biaya"].toString())!)
                      .toList()
                      .reduce((value, element) => value + element)
                      .toDouble()))
          .toString();
}
// KategoriRumus? datamediatanamtam;

class _childWidgetFieldState extends State<childWidgetField> {
  final ScrollController _childScrollController = ScrollController();
  final ScrollController _parentScrollController = ScrollController();

  double populasiTanam1Ha = 0;
  double populasiPetak = 0;

  // void prosesPh(){
  //
  // }
  //

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    Future.microtask(() {
      if (simpanhitung = true) {
        widget.onChangeState(
            filterdataobject()[c.ObjectIndexSelectedEdit.value].hasilTotal);
      }
    });
    // datamediatanamtam = dataKategoriRumus1.where((element) => element.id_MenuRawatan==c.indexMenuRawatan.value && element.idMediaTanam == 0).toList().where((element) => element.nama == "Persegi Panjang").toList().first;

    _parentScrollController.dispose();
    _childScrollController.dispose();
  }

  void hitunglocal() {
    if (MyDataFilterOBJ!.propertyLainnya["adaJenisTanah"] == true) {
      c.massaJenis.value = cariValue("q");

      onPresosMtT(c.id_type_tanah.value, false, 'm');

      onPresospH(cariValue("pH"), "m");

      if (MyDataFilterOBJ!.propertyLainnya["adaUkurPH"] == false) {
        hargaTotalpH = 0;
      } else {
        hargaTotalpH = double.tryParse(hargapH)! * (cariValue("KpH") * 1000);
      }

      hitung(c.indexsubMenuRawatan.value, "(bTPt/bTHa)*JPk",
          cariValue("vTPt").toString());
    } else {
      onPresospH(cariValue("pH"), "m");
      if (MyDataFilterOBJ!.propertyLainnya["adaUkurPH"] == false) {
        hargaTotalpH = 0;
      } else {
        hargaTotalpH = double.tryParse(hargapH)! * (cariValue("KpH") * 1000);
      }

      if (c.selectedItemCalcT.value == 2) {
        if (cariValue("LJt") == 0 || cariValue("LMt") == 0) {
          populasiTanam1Ha = 0.0;
          populasiPetak = 0.0;
          print("sasda");
        } else {
          print("sasda1");
          populasiTanam1Ha = 10000 / cariValue("LJt");
          populasiPetak = (cariValue("LMt") / 10000) * populasiTanam1Ha;
          print(
              "hasil ${cariValue("LJt")} ${cariValue("LMt")} $populasiTanam1Ha $populasiPetak => ${"($populasiPetak/JPk)*$populasiTanam1Ha"}");
          hitung(
              c.indexsubMenuRawatan.value,
              "($populasiPetak/$populasiTanam1Ha)*JPk",
              cariValue("LMt").toString());
        }
      } else {
        hitung(c.indexsubMenuRawatan.value, "(LMt/10000)*JPk",
            cariValue("LMt").toString());
        print("sasda");
      }
    }

    aDosis = Map.from(dataDosisfix(
        MyDataFilterOBJ!.propertyLainnya["tampungan"]["indexperusahaan"],
        filterCategorybyJenisPemupukan(MyDataFilterOBJ!
                .propertyLainnya["tampungan"]["indexperusahaan"])[
            MyDataFilterOBJ!.propertyLainnya["tampungan"]["indexjenisPupuk"]]));

    print(
        "dosis${dataDosisfix(MyDataFilterOBJ!.propertyLainnya["tampungan"]["indexperusahaan"], filterCategorybyJenisPemupukan(c.indexdropdownPrushn.value)[MyDataFilterOBJ!.propertyLainnya["tampungan"]["indexjenisPupuk"]])}");
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    print(
        "index select  ${filterdataobject()}  ${c.ObjectIndexSelectedEdit.value}");
    MyDataFilterOBJ = filterdataobject()[c.ObjectIndexSelectedEdit.value];

    if (c.selectedItemCalcT.value != 2) {
      if (filterdataobject()[c.ObjectIndexSelectedEdit.value]
          .kategoriRumusKu
          .where((element) => element.nama == "Persegi Panjang")
          .isEmpty) {
        // filterdataobject()[c.ObjectIndexSelectedEdit.value].kategoriRumusKu.add(dataKategoriRumus1.where((element) => element.id_MenuRawatan==c.indexMenuRawatan.value && element.idMediaTanam == 0).toList().where((element) => element.nama == "Persegi Panjang").toList().first!);
        // MyDataFilterOBJ! = dataKategoriRumus1.where((element) => element.id_MenuRawatan==c.indexMenuRawatan.value && element.idMediaTanam == 0).toList().where((element) => element.nama == "Persegi Panjang").toList().first;
        MyDataFilterOBJ!.kategoriRumusKu.add(List<KategoriRumus>.from([
          for (var i = 0; i < kategoriRumus.length; i++)
            KategoriRumus(
                id: i,
                idKalkulasi: kategoriRumus[i]["idKalkulasi"],
                idMediaTanam: kategoriRumus[i]["idMediaTanam"],
                vari: kategoriRumus[i]["vari"],
                nama: kategoriRumus[i]["nama"],
                rumus: kategoriRumus[i]["rumus"],
                valuess: kategoriRumus[i]["value"],
                // fieldValue: kategoriRumus[i]["fieldValue"],
                img: kategoriRumus[i]["img"],
                id_MenuRawatan: kategoriRumus[i]["id_MenuRawatan"])
        ])
            .where((element) => (c.indexMenuRawatan.value == 3)
                ? element.id_MenuRawatan == c.indexMenuRawatan.value
                : element.id_MenuRawatan == c.indexMenuRawatan.value &&
                    element.idMediaTanam == 0)
            .toList()
            .where((element) => (c.indexMenuRawatan.value == 3)
                ? element.nama == "Balok"
                : element.nama == "Persegi Panjang")
            .toList()
            .first);
      } else {
        MyDataFilterOBJ!.kategoriRumusKu
                .where((element) => (c.indexMenuRawatan.value == 3)
                    ? element.nama == "Balok"
                    : element.nama == "Persegi Panjang")
                .toList()
                .first =
            filterdataobject()[c.ObjectIndexSelectedEdit.value]
                .kategoriRumusKu
                .where((element) => (c.indexMenuRawatan.value == 3)
                    ? element.nama == "Balok"
                    : element.nama == "Persegi Panjang")
                .toList()
                .first;
      }
    }

    onPresospH(
        (filterdataobject()[c.ObjectIndexSelectedEdit.value]
                    .propertyLainnya["pHData"]["hasil"] ==
                null)
            ? 0
            : cariValue("pH"),
        'm');

    indexMediaLahan =
        MyDataFilterOBJ!.propertyLainnya["tampungan"]["indexBentukMediaTanam"];
    MyDataFilterOBJ!.propertyLainnya["tampungan"]["indexBentukMediaTanam"] =
        filterdataobject()[c.ObjectIndexSelectedEdit.value]
            .propertyLainnya["tampungan"]["indexBentukMediaTanam"];
    // indexMediaLahan = 0;

    MyDataFilterOBJ!.propertyLainnya["satuanMediaLahan"][1] =
        filterdataobject()[c.ObjectIndexSelectedEdit.value]
            .propertyLainnya["satuanMediaLahan"][1];

    MyDataFilterOBJ!.propertyLainnya["satuanMediaLahan"][0] =
        filterdataobject()[c.ObjectIndexSelectedEdit.value]
            .propertyLainnya["satuanMediaLahan"][0];

    print(
        "data dosis ${getDataTakaranDosisTanamanGNew(c.indexsubMenuRawatan.value, "(LMt/10000)*JPk", 0.0.toString())} ${MyDataFilterOBJ!.varii.map((e) => e.dataDosis)} ---- ${filterdataobject().length}");

    for (var data in MyDataFilterOBJ!.varii.map((e) => e.dataDosis)) {
      data.forEach((key, value) {
        hagaDosis[key] = "0";
      });
    }

    hagaDosis.forEach((key, value) {
      hagaDosis[key] =
          dataProductsObj.where((element) => element.nama == key).first.harga;
    });

    // // datakategorirum = List<KategoriRumus>.of(MyDataFilterOBJ!.kategoriRumusKu);
    //
    //
    // print("field variabel + => INDEX ${filterdataobject()[c
    //     .ObjectIndexSelectedEdit.value].kategoriRumusKu[indexMediaLahan].valuess}");
    // //
    // print("field variabel + => INDEX ${indexMediaLahan}");
    //
    // print("field variabel + => INDEX ${MyDataFilterOBJ!
    //     .kategoriRumusKu[indexMediaLahan].valuess}");
    //
    // print(
    //     "index => $indexMediaLahan ${MyDataFilterOBJ!
    //         .propertyLainnya["tampungan"]["indexBentukMediaTanam"]}");

    if (filterdataobject()[c.ObjectIndexSelectedEdit.value]
        .propertyLainnya["pHData"]
        .isEmpty) {
      MyDataFilterOBJ!.propertyLainnya["pHData"] = {
        "hasil": 0.0,
        "pHDitanya": 6.1,
        "pHDiket": 6.0
      };
      // indikatorpH["hasil"] = 0.0;s
    } else {
      listPHIndikator[0].variabels["pHDiket"][1] =
          filterdataobject()[c.ObjectIndexSelectedEdit.value]
              .propertyLainnya["pHData"]["pHDiket"];
      listPHIndikator[0].variabels["pHDitanya"][1] =
          filterdataobject()[c.ObjectIndexSelectedEdit.value]
              .propertyLainnya["pHData"]["pHDitanya"];
      // datainputan.value[2] = filterdataobject()[c.ObjectIndexSelectedEdit.value].propertyLainnya["pHData"]["hasil"];

      MyDataFilterOBJ!.propertyLainnya["pHData"] =
          filterdataobject()[c.ObjectIndexSelectedEdit.value]
              .propertyLainnya["pHData"];
    }

    if (filterdataobject()[c.ObjectIndexSelectedEdit.value]
        .kategoriRumusKu[indexMediaLahan]
        .valuess
        .isEmpty) {
      // print("field 12 12 => ${indexObjectIndexSelectedEdit} ${filterdataobject()
      //     .map((e) =>
      //     e.kategoriRumusKu.map((e) => e.valuess)).toList()}");

      MyDataFilterOBJ!.kategoriRumusKu[indexMediaLahan].valuess = variablesNew(
          MyDataFilterOBJ!.kategoriRumusKu[indexMediaLahan].rumus, 0);
      // datakategorirum[indexMediaLahan].fieldValue =
      //     myControlerssi(Map.of(datakategorirum[indexMediaLahan].valuess));
      // print(
      //     "field 12 12 54 => ${kategoriRumus[0]["value"]} ${FdatakategoryRumus(
      //         c.indexMenuRawatan.value,
      //         List<KategoriRumus>.of(dataKategoriRumus1),
      //         c.selectedItemCalcT.value).map((e) =>
      //     e.valuess)} ${filterdataobject().map((e) =>
      //         e.kategoriRumusKu.map((e) => e.valuess)).toList()}");
      print(
          "field 12 12 13 => tidak  ${filterdataobject()[c.ObjectIndexSelectedEdit.value].kategoriRumusKu[indexMediaLahan].valuess}");
    } else if (filterdataobject()[c.ObjectIndexSelectedEdit.value]
        .kategoriRumusKu[indexMediaLahan]
        .valuess
        .isNotEmpty) {
      print(
          "field 12 12 13 => ada  ${filterdataobject()[c.ObjectIndexSelectedEdit.value].kategoriRumusKu[indexMediaLahan].valuess}");
    }

    c.id_type_tanah.value =
        MyDataFilterOBJ!.propertyLainnya["tampungan"]["indexJenisTanah"];

    MyDataFilterOBJ!.propertyLainnya["tampungan"]["indexJenisTanah"] =
        filterdataobject()[c.ObjectIndexSelectedEdit.value]
            .propertyLainnya["tampungan"]["indexJenisTanah"];

    c.indexdropdownPrushn.value =
        MyDataFilterOBJ!.propertyLainnya["tampungan"]["indexperusahaan"];

    MyDataFilterOBJ!.propertyLainnya["tampungan"]["indexperusahaan"] =
        filterdataobject()[c.ObjectIndexSelectedEdit.value]
            .propertyLainnya["tampungan"]["indexperusahaan"];

    // ==============================================
    //
    print(
        "indexss ${c.indexdropdownjenisPemupukan.value} ${filterdataobject()[c.ObjectIndexSelectedEdit.value].propertyLainnya["tampungan"]["indexjenisPupuk"]}");
    MyDataFilterOBJ!.propertyLainnya["tampungan"]["indexjenisPupuk"] =
        filterdataobject()[c.ObjectIndexSelectedEdit.value]
            .propertyLainnya["tampungan"]["indexjenisPupuk"];

    MyDataFilterOBJ!.propertyLainnya["ketebalanTanah"] =
        filterdataobject()[c.ObjectIndexSelectedEdit.value]
            .propertyLainnya["ketebalanTanah"];

    MyDataFilterOBJ!.luas =
        filterdataobject()[c.ObjectIndexSelectedEdit.value].luas;
    c.indexdropdownjenisPemupukan.value =
        MyDataFilterOBJ!.propertyLainnya["tampungan"]["indexjenisPupuk"];

    aDosis = Map.from(dataDosisfix(
        MyDataFilterOBJ!.propertyLainnya["tampungan"]["indexperusahaan"],
        filterCategorybyJenisPemupukan(
            MyDataFilterOBJ!.propertyLainnya["tampungan"]
                ["indexperusahaan"])[c.indexdropdownjenisPemupukan.value]));

    print("aDosis $aDosis");
    hargaDosis = Map.from(dataDosisfix(
        MyDataFilterOBJ!.propertyLainnya["tampungan"]["indexperusahaan"],
        filterCategorybyJenisPemupukan(
            MyDataFilterOBJ!.propertyLainnya["tampungan"]
                ["indexperusahaan"])[c.indexdropdownjenisPemupukan.value]));

    hargaDosis.forEach((key, value) {
      hargaDosis[key] =
          dataProductsObj.where((element) => element.nama == key).first.harga;
    });
    print("fi4 => $hargaDosis}");

    hargapH = dataProductsObj
        .where((element) => element.nama == "dolomit")
        .first
        .harga;
  }

  @override
  Widget build(contexty) {
    return SingleChildScrollView(
      controller: _parentScrollController,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: defaultPadding / 2),
        child: Obx(() {
          // a();
          return Column(
            children: [
              (c.selectedItemCalcT.value != 1)
                  ? Container()
                  : SizedBox(
                      height: heightfit(110),
                      child: FittedBox(
                        child: SizedBox(
                          height: 110,
                          width: 110,
                          child: ItemPot(
                            tema: warnas(dataKategoriMenuRawatan[
                                    c.indexMenuRawatan.value]
                                .colorku[0]),
                            img: dataKategoriRumus
                                .where(
                                    (element) => element.id == c.indpots.value)
                                .first
                                .img,
                            index: c.indexa.value,
                            onStateChange: (int indexs) {
                              // indexmenu(() {
                              c.indexa.value = indexs;
                              // });
                            },
                          ),
                        ),
                      ),
                    ),
              cardWithImg(
                  "Penjelasan penggunaan Kalkulator: ",
                  18,
                  Container(
                    child: Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: heightfit(defaultPadding / 2),
                            vertical: heightfit(defaultPadding / 2)),
                        // height: 200,
                        width: heightfit(double.infinity),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20),
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20)),
                            // border:
                            //     Border.all(color: kTextColor.withOpacity(.8), width: .2)
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 10,
                                  offset: Offset(-1, 8),
                                  color: Colors.green.withOpacity(.3))
                            ]),
                        child: Stack(
                          children: [
                            Positioned(
                              bottom: 0,
                              right: 0,
                              // left: 0,
                              child: Container(
                                height: heightfit(90),
                                width: heightfit(100),
                                decoration: BoxDecoration(
                                    color: Colors.green.shade100,
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(0),
                                        bottomRight: Radius.circular(20),
                                        topLeft: Radius.circular(90),
                                        topRight: Radius.circular(0)),
                                    // border:
                                    //     Border.all(color: kTextColor.withOpacity(.8), width: .2)
                                    boxShadow: [
                                      BoxShadow(
                                          blurRadius: 10,
                                          offset: Offset(-1, 8),
                                          color: Colors.green.withOpacity(.3))
                                    ]),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(
                                heightfit(defaultPadding),
                              ),
                              child: Column(
                                children: [
                                  Column(
                                    children: List.generate(
                                        List.of(filtersdata[
                                                    c.selectedItemCalcT.value]
                                                .studiKasus)
                                            .map((e) => e.values)
                                            .toList()
                                            .length, (index) {
                                      return Column(
                                        children: [
                                          RichText(
                                              text: TextSpan(children: [
                                            TextSpan(
                                              text:
                                                  "${index + 1}. ${List.of(filtersdata[c.selectedItemCalcT.value].studiKasus).map((e) => e.values).toList()[index].first["studi kasus"]}\n",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: kTextColor,
                                                fontSize: heightfit(sT16),
                                              ),
                                            ),
                                            TextSpan(
                                              text:
                                                  "- ${List.of(filtersdata[c.selectedItemCalcT.value].studiKasus).map((e) => e.values).toList()[index].first["penjelas"]}",
                                              style: TextStyle(
                                                fontStyle: FontStyle.italic,
                                                color: kTextColor,
                                                fontSize: heightfit(sT14),
                                              ),
                                            ),
                                          ])),
                                          Padding(
                                            padding: EdgeInsets.all(
                                                defaultPadding / 2),
                                            child: Container(
                                              height: 50,
                                              decoration: BoxDecoration(
                                                color: warnas(List.of(filtersdata[
                                                            c.selectedItemCalcT
                                                                .value]
                                                        .studiKasus)
                                                    .map((e) => e.values)
                                                    .toList()[index]
                                                    .first["warna"]),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              child: Center(
                                                  child: Text(
                                                "Proses ${index + 1}",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white,
                                                  fontSize: heightfit(sT16),
                                                ),
                                              )),
                                            ),
                                          )
                                        ],
                                      );
                                    }),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )),
                  )),
              ProsesWidgets(
                juduls: "Bentuk Media Tanam",
                tema: warnas(dataKategoriMenuRawatan[c.indexMenuRawatan.value]
                    .colorku[0]),
                namaobj: "Type Lahan",
                idTipeMediaTanam: (c.indexMenuRawatan.value == 3 ||
                        c.indexMenuRawatan.value == 4 ||
                        c.indexMenuRawatan.value == 5)
                    ? 1
                    : c.selectedItemCalcT.value,
                rumus: "",
                dropdowns: (c.selectedItemCalcT.value == 2) ? false : true,
                datakatRumus: MyDataFilterOBJ!.kategoriRumusKu.toList(),
                onChangeState:
                    (indexs, indpot, satuan, datavarmedia, hasilLuas) {
                  Future.microtask(() {
                    setState(() {
                      // widget.onChangeState(filterdataobject()[c
                      //     .ObjectIndexSelectedEdit
                      //     .value].hasilTotal);
                    });
                  });
                  print("hasil luasnya : $hasilLuas");
                  MyDataFilterOBJ!.luas = hasilLuas;
                  MyDataFilterOBJ!.propertyLainnya["tampungan"]
                      ["indexBentukMediaTanam"] = indpot;

                  indexMediaLahan = indpot;
                  MyDataFilterOBJ!.propertyLainnya["satuanMediaLahan"][0] =
                      satuan;

                  hitunglocal();
                },
                indexmenu: c.indexMenuRawatan.value,
                indexsubmenu: c.indexsubMenuRawatan.value,
                idBentukMediaTanam: MyDataFilterOBJ!
                    .propertyLainnya["tampungan"]["indexBentukMediaTanam"],
                satuan: MyDataFilterOBJ!.propertyLainnya["satuanMediaLahan"][0],
                warna: warnas("e69138"),
              ),
              (c.selectedItemCalcT.value == 2)
                  ? Column(
                      children: [
                        cardWithImg(
                            "populasi tanaman 1 ha sebanyak $populasiTanam1Ha Tanam",
                            30,
                            Container()),
                        ProsesWidgets(
                          juduls: "Media Tanam",
                          tema: warnas(
                              dataKategoriMenuRawatan[c.indexMenuRawatan.value]
                                  .colorku[0]),
                          namaobj: "Type Lahan",
                          idTipeMediaTanam: c.selectedItemCalcT.value,
                          rumus: "",
                          dropdowns: true,
                          datakatRumus: MyDataFilterOBJ!.kategoriRumusKu
                              .where((element) =>
                                  element.nama == "Persegi Panjang")
                              .toList(),
                          onChangeState: (indexs, indpot, satuan, datavarmedia,
                              hasilLuas) {
                            Future.microtask(() {
                              setState(() {
                                // widget.onChangeState(filterdataobject()[c
                                //     .ObjectIndexSelectedEdit
                                //     .value].hasilTotal);
                              });
                            });

                            MyDataFilterOBJ!.propertyLainnya["tampungan"]
                                ["indexBentukMediaTanam"] = indpot;

                            indexMediaLahan = indpot;
                            MyDataFilterOBJ!.propertyLainnya["satuanMediaLahan"]
                                [1] = satuan;
                            hitunglocal();
                          },
                          indexmenu: c.indexMenuRawatan.value,
                          indexsubmenu: c.indexsubMenuRawatan.value,
                          idBentukMediaTanam: 0,
                          satuan: MyDataFilterOBJ!
                              .propertyLainnya["satuanMediaLahan"][1],
                          warna: warnas("e69138"),
                        ),
                        cardWithImg(
                            "populasi tanaman /petak dengan ukuran ${cariValue("LMt")} m² sebanyak $populasiPetak Tanam",
                            30,
                            Container()),
                      ],
                    )
                  : Container(),
              Padding(
                padding: EdgeInsets.symmetric(vertical: defaultPadding / 2),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(0),
                        bottomRight: Radius.circular(20),
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(0)),
                    border: Border.all(
                        style: BorderStyle.solid,
                        color: warnas("f1c232"),
                        width: 3.5),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 10,
                          offset: Offset(-5, 5),
                          color: Colors.green.shade700.withOpacity(.2))
                    ],
                  ),
                  child: Column(
                    children: [
                      SwitchListTile(
                          activeColor: warnas("f1c232"),
                          title: Text(
                            "pH Ukur",
                            style: TextStyle(fontSize: heightfit(26)),
                          ),
                          // subtitle: Text("Satuan",style: TextStyle(fontSize: heightfit(26)),),
                          value: MyDataFilterOBJ!.propertyLainnya["adaUkurPH"],
                          onChanged: (bool value) {
                            Future.microtask(() {
                              setState(() {});
                            });

                            MyDataFilterOBJ!.propertyLainnya["adaUkurPH"] =
                                value;

                            hitunglocal();
                          }),
                      Visibility(
                        visible: MyDataFilterOBJ!.propertyLainnya["adaUkurPH"],
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: defaultPadding / 2),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    flex: 7,
                                    child: FittedBox(
                                      child: SizedBox(
                                        height: 100,
                                        width: 50,
                                        child: const CardProductku(
                                            tema: Colors.green,
                                            image:
                                                "assets/images/product/Kapur.png"),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: SizedBox(
                                      width: defaultPadding / 3,
                                    ),
                                  ),
                                  Expanded(
                                    flex: 27,
                                    child: FittedBox(
                                      child: SizedBox(
                                          height: 120,
                                          width: 250,
                                          child: Fields(
                                            controller: TextEditingController(
                                                text: hargapH),
                                            satuan: "Rp/Kg",
                                            title: "Harga dolomit\n",
                                            tema: Colors.black38,
                                            onStateChange: (valu) {
                                              Future.microtask(() {
                                                setState(() {
                                                  hargapH = valu;
                                                  hargaTotalpH = double
                                                          .tryParse(hargapH)! *
                                                      (cariValue("KpH") * 1000);
                                                  print(
                                                      "harga:${double.tryParse(hargapH)!} $valu");
                                                  hitunglocal();
                                                });
                                              });
                                            },
                                            inputType: TextInputType.number,
                                            enable: true,
                                          )),
                                    ),
                                  ),
                                ],
                              ),

                              DolomitBerdasarkanLuas(
                                tampiltombol: false,
                                diketahui: false,
                                tema: Colors.green,
                                indexmenu: c.indexMenuRawatan.value,
                                indexsubmenu: c.indexsubMenuRawatan.value,
                                onchange: () {
                                  setState(() {
                                    Future.microtask(() {
                                      setState(() {
                                        hargaTotalpH =
                                            double.tryParse(hargapH)! *
                                                (cariValue("KpH") * 1000);
                                        print(
                                            "harga:${double.tryParse(hargapH)!}");
                                        hitunglocal();
                                      });
                                    });
                                  });
                                },
                              ),
                              // HasilConvertDol(tema: Colors.green)
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              (c.selectedItemCalcT.value == 1)
                  ? Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: defaultPadding / 2),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(0),
                              bottomRight: Radius.circular(20),
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(0)),
                          border: Border.all(
                              style: BorderStyle.solid,
                              color: warnas("f1c232"),
                              width: 3.5),
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 10,
                                offset: Offset(-5, 5),
                                color: Colors.green.shade700.withOpacity(.2))
                          ],
                        ),
                        child: Column(
                          children: [
                            SwitchListTile(
                                activeColor: warnas("f1c232"),
                                title: Text(
                                  "Jenis Tanah",
                                  style: TextStyle(fontSize: heightfit(26)),
                                ),
                                // subtitle: Text("Satuan",style: TextStyle(fontSize: heightfit(26)),),
                                value: MyDataFilterOBJ!
                                    .propertyLainnya["adaJenisTanah"],
                                onChanged: (bool value) {
                                  Future.microtask(() {
                                    setState(() {});
                                  });

                                  MyDataFilterOBJ!
                                      .propertyLainnya["adaJenisTanah"] = value;
                                  hitunglocal();
                                }),
                            Visibility(
                              visible: MyDataFilterOBJ!
                                  .propertyLainnya["adaJenisTanah"],
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: defaultPadding / 2),
                                child: Column(
                                  children: [
                                    CardFields(
                                      tema: Colors.green,
                                      judul: "Jenis Tanah :",
                                      columns: Column(
                                        children: [
                                          SizedBox(
                                            height: heightfit(defaultPadding),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: defaultPadding / 2),
                                            child: Fields(
                                              controller: TextEditingController(
                                                  text: MyDataFilterOBJ!
                                                      .propertyLainnya[
                                                          "ketebalanTanah"]
                                                      .toString()),
                                              satuan: "m",
                                              title: "Ketebalan Tanah\n",
                                              tema: Colors.black38,
                                              onStateChange: (values) {
                                                // setState(() {
                                                Future.microtask(() {
                                                  setState(() {});
                                                });

                                                MyDataFilterOBJ!
                                                        .propertyLainnya[
                                                    "ketebalanTanah"] = values;

                                                hitunglocal();
                                              },
                                              inputType: TextInputType
                                                  .numberWithOptions(
                                                      decimal: true),
                                              enable: true,
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: defaultPadding / 2),
                                            child: DropDowns(
                                              (newActivity) {
                                                Future.microtask(() {
                                                  setState(() {});
                                                });
                                                c.typeTanah.value = newActivity;

                                                c.id_type_tanah.value =
                                                    dataKategoriTanah
                                                        .where((element) =>
                                                            element.tanah ==
                                                            newActivity)
                                                        .first
                                                        .id;

                                                MyDataFilterOBJ!.propertyLainnya[
                                                            "tampungan"]
                                                        ["indexJenisTanah"] =
                                                    dataKategoriTanah
                                                        .where((element) =>
                                                            element.tanah ==
                                                            newActivity)
                                                        .first
                                                        .id;

                                                hitunglocal();
                                                print("loslsoa $aDosis");
                                                print(
                                                    "loslsoa ${filterdataobject()[c.ObjectIndexSelectedEdit.value].varii.where((element) => element.jenisPemupukan == filterCategorybyJenisPemupukan(MyDataFilterOBJ!.propertyLainnya["tampungan"]["indexperusahaan"])[MyDataFilterOBJ!.propertyLainnya["tampungan"]["indexjenisPupuk"]]).toList().first.dataDosis}");
                                              },
                                              Colors.green,
                                              dataKategoriTanah
                                                  .map((e) => e.tanah)
                                                  .toList(),
                                              "Tanah",
                                              dataKategoriTanah
                                                      .map((e) => e.tanah)
                                                      .toList()[
                                                  c.id_type_tanah.value],
                                              "Type tanah: ",
                                              [],
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: defaultPadding,
                                                vertical: defaultPadding),
                                            child: Column(
                                              children: [
                                                Text.rich(TextSpan(
                                                  children: [
                                                    TextSpan(
                                                        text:
                                                            "Massa Jenis ${c.typeTanah.value} : ${cariValue("q")} kg/m² \n",
                                                        style: TextStyle(
                                                            color: Colors
                                                                .green.shade700,
                                                            fontSize:
                                                                heightfit(18),
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold)),
                                                    TextSpan(
                                                      text:
                                                          "Ketetapan Satuan Luas Lahan : 1 Ha \n",
                                                    ),
                                                    TextSpan(
                                                        text:
                                                            "Kedalaman Tanah Berdasarkan Kedalaman pot : ${MyDataFilterOBJ!.propertyLainnya["ketebalanTanah"]} m \n",
                                                        style: TextStyle(
                                                            color: Colors
                                                                .green.shade700,
                                                            fontSize:
                                                                heightfit(16),
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal)),
                                                    TextSpan(
                                                        text:
                                                            "Maka Volume Seluas 1 Ha : ${MyDataFilterOBJ!.propertyLainnya["ketebalanTanah"]} m x 10.000 m² = ${cariValue("vTHa")} m³ \n",
                                                        style: TextStyle(
                                                            color: Colors
                                                                .green.shade700,
                                                            fontSize:
                                                                heightfit(16),
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal)),
                                                    TextSpan(
                                                      text:
                                                          "Maka Berat Tanah 1 Ha : (${cariValue("vTHa")} m³) x ${cariValue("q")} kg/m² = ${(cariValue("bTHa")).toStringAsFixed(1)} kg",
                                                      style: TextStyle(
                                                          color: Colors
                                                              .green.shade700,
                                                          fontSize:
                                                              heightfit(16),
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    )
                                                  ],
                                                  style: TextStyle(
                                                    color:
                                                        Colors.green.shade700,
                                                    fontSize: heightfit(20),
                                                  ),
                                                ))
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: heightfit(defaultPadding),
                                          )
                                        ],
                                      ),
                                      onChangeState: () {
                                        Future.microtask(() {
                                          setState(() {});
                                        });
                                      },
                                      indexmenu: c.indexMenuRawatan.value,
                                      indexsubmenu: c.indexsubMenuRawatan.value,
                                      warna: warnas("f1c232"),
                                    ),
                                    CardFields(
                                      tema: warnas(dataKategoriMenuRawatan[
                                              c.indexMenuRawatan.value]
                                          .colorku[0]),
                                      judul: "Media Tanam berisi Tanah : ",
                                      columns: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal:
                                                widthfit(defaultPadding / 2),
                                            vertical:
                                                heightfit(defaultPadding)),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              height: heightfit(110),
                                              child: FittedBox(
                                                child: SizedBox(
                                                  height: 110,
                                                  width: 110,
                                                  child: ItemPot(
                                                    tema: warnas(
                                                        dataKategoriMenuRawatan[c
                                                                .indexMenuRawatan
                                                                .value]
                                                            .colorku[0]),
                                                    img: dataKategoriRumus
                                                        .where((element) =>
                                                            element.id ==
                                                            c.indpots.value)
                                                        .first
                                                        .img,
                                                    index: c.indexa.value,
                                                    onStateChange:
                                                        (int indexs) {
                                                      // indexmenu(() {
                                                      c.indexa.value = indexs;
                                                      // });
                                                    },
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                                height:
                                                    heightfit(defaultPadding)),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Volume Media Tanam : ${cariValue("vTPt")} m³",
                                                  style: TextStyle(
                                                    color: warnas(
                                                        dataKategoriMenuRawatan[c
                                                                .indexMenuRawatan
                                                                .value]
                                                            .colorku[0]),
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: heightfit(20),
                                                  ),
                                                ),
                                                Text(
                                                  "Massa Jenis ${c.typeTanah.value} : ",
                                                  style: TextStyle(
                                                    color: warnas(
                                                        dataKategoriMenuRawatan[c
                                                                .indexMenuRawatan
                                                                .value]
                                                            .colorku[0]),
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: heightfit(20),
                                                  ),
                                                ),
                                                Text(
                                                  "${cariValue("q")} Kg/m³",
                                                  style: TextStyle(
                                                    color: warnas(
                                                            dataKategoriMenuRawatan[c
                                                                    .indexMenuRawatan
                                                                    .value]
                                                                .colorku[0])
                                                        .withOpacity(.7),
                                                    fontSize: heightfit(20),
                                                  ),
                                                ),
                                                Text(
                                                  "Massa Media Tanam Berisi ${c.typeTanah.value} : ",
                                                  style: TextStyle(
                                                    color: warnas(
                                                        dataKategoriMenuRawatan[c
                                                                .indexMenuRawatan
                                                                .value]
                                                            .colorku[0]),
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: heightfit(20),
                                                  ),
                                                ),
                                                Text(
                                                  "ρ = m / v \n${cariValue("q")} kg/m³ = m / ${cariValue("vTPt")} m³\nm = ${cariValue("q")} kg/m³ x ${(cariValue("vTPt"))} m³ = ${cariValue("bTPt")} kg",
                                                  style: TextStyle(
                                                    color: warnas(
                                                            dataKategoriMenuRawatan[c
                                                                    .indexMenuRawatan
                                                                    .value]
                                                                .colorku[0])
                                                        .withOpacity(.7),
                                                    fontSize: heightfit(20),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      onChangeState: () {},
                                      indexmenu: c.indexMenuRawatan.value,
                                      indexsubmenu: c.indexsubMenuRawatan.value,
                                      warna: warnas("f1c232"),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  : Container(),
              cardWithImg(
                  "Besaran Dosis Pupuk yang disarankan berdasarkan Perusahaan sesuai Brosur adalah : ",
                  30,
                  Container()),
              Container(
                  child: DropDowns((newActivity) {
                Future.microtask(() {
                  setState(() {});
                });

                c.indexdropdownPrushn.value = dataKategoriPerusahaan
                    .map((e) => e.perusahaan)
                    .toList()
                    .indexOf(newActivity);

                MyDataFilterOBJ!.propertyLainnya["tampungan"]
                        ["indexperusahaan"] =
                    dataKategoriPerusahaan
                        .map((e) => e.perusahaan)
                        .toList()
                        .indexOf(newActivity);

                // MyDataFilterOBJ!.propertyLainnya["tampungan"]["indexjenisPupuk"] =
                MyDataFilterOBJ!.propertyLainnya["tampungan"]
                    ["indexjenisPupuk"] = 0;

                c.indexdropdownjenisPemupukan.value = 0;

                aDosis = Map.from(dataDosisfix(
                    MyDataFilterOBJ!.propertyLainnya["tampungan"]
                        ["indexperusahaan"],
                    filterCategorybyJenisPemupukan(MyDataFilterOBJ!
                            .propertyLainnya["tampungan"]["indexperusahaan"])[
                        MyDataFilterOBJ!.propertyLainnya["tampungan"]
                            ["indexjenisPupuk"]]));

                hargaDosis = Map.from(aDosis);
                hargaDosis.forEach((key, value) {
                  hargaDosis[key] = hagaDosis[
                      hagaDosis.keys.where((element) => element == key).first];
                });
              },
                      Colors.black54,
                      filterCategorybyPerusahaan(),
                      filterCategorybyPerusahaan()[0],
                      filterCategorybyPerusahaan()[
                          (c.indexMenuRawatan.value == 3 ||
                                  c.indexMenuRawatan.value == 4 ||
                                  c.indexMenuRawatan.value == 5)
                              ? 0
                              : MyDataFilterOBJ!.propertyLainnya["tampungan"]
                                  ["indexperusahaan"]],
                      "Perusahaan  ${filterCategorybyPerusahaan()[(c.indexMenuRawatan.value == 3 || c.indexMenuRawatan.value == 4 || c.indexMenuRawatan.value == 5) ? 0 : MyDataFilterOBJ!.propertyLainnya["tampungan"]["indexperusahaan"]]}",
                      [])),
              SizedBox(
                height: defaultPadding,
              ),
              Container(
                padding: EdgeInsets.only(bottom: defaultPadding),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    border: Border.all(
                        style: BorderStyle.solid,
                        color: warnas("6aa84f"),
                        width: 3.5),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 10,
                          offset: Offset(0, 5),
                          color: Colors.black.withOpacity(.3))
                    ],
                    color: Colors.white),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(defaultPadding / 2),
                      child: ListTile(
                        title: Text(
                            filterCategorybyPerusahaan()[
                                (c.indexMenuRawatan.value == 3 ||
                                        c.indexMenuRawatan.value == 4 ||
                                        c.indexMenuRawatan.value == 5)
                                    ? 0
                                    : MyDataFilterOBJ!
                                            .propertyLainnya["tampungan"]
                                        ["indexperusahaan"]],
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold)),
                        subtitle: Text("Dosis : ",
                            style: TextStyle(color: Colors.black)),
                        leading: FittedBox(
                          child: SizedBox(
                              height: 150,
                              width: 150,
                              child: ImgOnline(
                                  dataKategoriPerusahaan[filterCategorybyPerusahaan()
                                          .indexOf(filterCategorybyPerusahaan()[
                                              (c.indexMenuRawatan.value == 3 ||
                                                      c.indexMenuRawatan.value ==
                                                          4 ||
                                                      c.indexMenuRawatan.value ==
                                                          5)
                                                  ? 0
                                                  : MyDataFilterOBJ!.propertyLainnya["tampungan"]
                                                      ["indexperusahaan"]])]
                                      .img,
                                  dataKategoriPerusahaan[filterCategorybyPerusahaan()
                                          .indexOf(filterCategorybyPerusahaan()[(c.indexMenuRawatan.value == 3 || c.indexMenuRawatan.value == 4 || c.indexMenuRawatan.value == 5) ? 0 : MyDataFilterOBJ!.propertyLainnya["tampungan"]["indexperusahaan"]])]
                                      .img)),
                        ),
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.all(defaultPadding / 2),
                      child: Container(
                        child: Obx(() {
                          return Column(
                            children: [
                              DropDowns((newActivity) {
                                c.indexdropdownjenisPemupukan
                                    .value = filterCategorybyJenisPemupukan(
                                        MyDataFilterOBJ!
                                                .propertyLainnya["tampungan"]
                                            ["indexperusahaan"])
                                    .indexOf(newActivity);

                                MyDataFilterOBJ!.propertyLainnya["tampungan"]
                                        ["indexjenisPupuk"] =
                                    filterCategorybyJenisPemupukan(
                                            MyDataFilterOBJ!.propertyLainnya[
                                                "tampungan"]["indexperusahaan"])
                                        .indexOf(newActivity);

                                print("dosisis sebelum $aDosis");
                                // if (MyDataFilterOBJ!
                                //     .propertyLainnya["adaJenisTanah"] == true) {
                                //   c.massaJenis.value = cariValue("q");
                                //
                                //   onPresosMtT(c.id_type_tanah.value, false);
                                //   hitung(c.indexsubMenuRawatan.value, "(bTPt/bTHa)*JPk",
                                //       cariValue("vTPt").toString());
                                // } else {
                                //   onPresospH(
                                //       (filterdataobject()[c.ObjectIndexSelectedEdit.value]
                                //           .propertyLainnya["pHData"]["hasil"] == null)
                                //           ? 0
                                //           : cariValue("pH"));
                                //   hitung(c.indexsubMenuRawatan.value, "(LMt/10000)*JPk",
                                //       cariValue("LMt").toString());
                                // }
                                print("dosisis sesudah setengah  $aDosis");
                                aDosis = Map.from(dataDosisfix(
                                    MyDataFilterOBJ!
                                            .propertyLainnya["tampungan"]
                                        ["indexperusahaan"],
                                    filterCategorybyJenisPemupukan(
                                            MyDataFilterOBJ!
                                                    .propertyLainnya["tampungan"]
                                                ["indexperusahaan"])[
                                        (c.indexMenuRawatan.value == 3 ||
                                                c.indexMenuRawatan.value == 4 ||
                                                c.indexMenuRawatan.value == 5)
                                            ? 0
                                            : MyDataFilterOBJ!
                                                    .propertyLainnya["tampungan"]
                                                ["indexjenisPupuk"]]));

                                hargaDosis = Map.from(aDosis);
                                hargaDosis.forEach((key, value) {
                                  hargaDosis[key] = hagaDosis[hagaDosis.keys
                                      .where((element) => element == key)
                                      .first];
                                });

                                print("dosisis sesudah $aDosis");
                              },
                                  Colors.black54,
                                  filterCategorybyJenisPemupukan(
                                      MyDataFilterOBJ!.propertyLainnya["tampungan"]
                                          ["indexperusahaan"]),
                                  filterCategorybyJenisPemupukan(
                                      MyDataFilterOBJ!.propertyLainnya["tampungan"]
                                          ["indexperusahaan"])[0],
                                  filterCategorybyJenisPemupukan(MyDataFilterOBJ!
                                              .propertyLainnya["tampungan"]
                                          ["indexperusahaan"])[
                                      (c.indexMenuRawatan.value == 3 ||
                                              c.indexMenuRawatan.value == 4 ||
                                              c.indexMenuRawatan.value == 5)
                                          ? 0
                                          : MyDataFilterOBJ!.propertyLainnya["tampungan"]
                                              ["indexjenisPupuk"]],
                                  "Dosis Berdasarkan Pupuk ${filterCategorybyJenisPemupukan(MyDataFilterOBJ!.propertyLainnya["tampungan"]["indexperusahaan"])[c.indexdropdownjenisPemupukan.value]}",
                                  []),
                              SizedBox(
                                height: defaultPadding,
                              ),
                              Column(
                                children: [
                                  Container(
                                    child: Column(
                                        children: List.generate(
                                            hargaDosis.keys.toList().length,
                                            (index) {
                                      return Row(
                                        children: [
                                          Expanded(
                                            flex: 7,
                                            child: FittedBox(
                                              child: SizedBox(
                                                height: 100,
                                                width: 50,
                                                child: CardProductku(
                                                    tema: (hargaDosis.keys
                                                                .toList()[index]
                                                                .toString() ==
                                                            "Kieserit")
                                                        ? Colors.blue
                                                        : warnas(
                                                            List.from(dataProductsObj.where((element) => element.nama == hargaDosis.keys.toList()[index].toString()).first.color)[
                                                                0]),
                                                    image: (hargaDosis.keys
                                                                .toList()[index]
                                                                .toString() ==
                                                            "Kieserit")
                                                        ? "assets/images/BGA.jpg"
                                                        : dataProductsObj
                                                            .where((element) =>
                                                                element.nama ==
                                                                hargaDosis.keys
                                                                    .toList()[index]
                                                                    .toString())
                                                            .first
                                                            .img),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: SizedBox(
                                              width: defaultPadding / 3,
                                            ),
                                          ),
                                          Expanded(
                                            flex: 27,
                                            child: FittedBox(
                                              child: SizedBox(
                                                  height: 120,
                                                  width: 250,
                                                  child: Fields(
                                                    controller:
                                                        TextEditingController(
                                                            text:
                                                                "${hargaDosis[hargaDosis.keys.toList()[index]].replaceAll(RegExp(r'[^0-9]'), '')}"),
                                                    satuan: "Rp/Kg",
                                                    title:
                                                        "Harga ${hargaDosis.keys.toList()[index].toString()}\n",
                                                    tema: Colors.black38,
                                                    onStateChange: (valu) {
                                                      print("asasa $valu");
                                                      String values1 = valu;
                                                      if (valu.isEmpty) {
                                                        values1 = "0";
                                                      }
                                                      // setState(() {
                                                      Future.microtask(() {
                                                        setState(() {});
                                                      });

                                                      //     dataDosisfix(
                                                      //                                                     hargaDosis[hargaDosis.keys.toList()[index]
                                                      //                                                         .toString()] = values1;

                                                      hagaDosis[hagaDosis.keys
                                                          .where((element) =>
                                                              element ==
                                                              hargaDosis.keys
                                                                  .toList()[
                                                                      index]
                                                                  .toString())
                                                          .first] = values1;

                                                      hargaDosis.forEach(
                                                          (key, value) {
                                                        hargaDosis[key] =
                                                            hagaDosis[hagaDosis
                                                                .keys
                                                                .where(
                                                                    (element) =>
                                                                        element ==
                                                                        key)
                                                                .first];
                                                      });
                                                      // hargaDosis.forEach((key, value) {
                                                      //   hargaDosis[key] = hagaDosis[hagaDosis.keys.where((element) => element == key).first];
                                                      // });

                                                      // print("dosis${dataDosisfix(
                                                      //     MyDataFilterOBJ!
                                                      //         .propertyLainnya["tampungan"]["indexperusahaan"],
                                                      //     filterCategorybyJenisPemupukan(
                                                      //         MyDataFilterOBJ!
                                                      //             .propertyLainnya["tampungan"]["indexperusahaan"])[MyDataFilterOBJ!
                                                      //         .propertyLainnya["tampungan"]["indexjenisPupuk"]])}");
                                                      hitungHarga(
                                                          aDosis, hargaDosis);

                                                      print(
                                                          "dosisis sesudah222 $aDosis");
                                                      // hargaDosis = dataDosisfix(MyDataFilterOBJ!
                                                      //             .propertyLainnya["tampungan"]["indexperusahaan"],
                                                      //         filterCategorybyJenisPemupukan(
                                                      //             MyDataFilterOBJ!
                                                      //                 .propertyLainnya["tampungan"]["indexperusahaan"])[c
                                                      //             .indexdropdownjenisPemupukan
                                                      //             .value]);

                                                      // als[als.keys.toList()[index]] = values;

                                                      // setPreference();
                                                    },
                                                    inputType:
                                                        TextInputType.number,
                                                    enable: true,
                                                  )),
                                            ),
                                          ),
                                        ],
                                      );
                                    })),
                                  ),
                                  SizedBox(
                                    height: defaultPadding / 2,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                      vertical: defaultPadding / 2,
                                    ),
                                    child: Container(
                                      clipBehavior: Clip.antiAlias,
                                      decoration: BoxDecoration(
                                        color: Colors.black12.withOpacity(.5),
                                        // color: Theme.of(context).cardColor,
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: Column(
                                        children: [
                                          Stack(
                                            children: [
                                              Positioned.fill(
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                      image: AssetImage(
                                                          dataKategoriMenuRawatan[c
                                                                  .indexMenuRawatan
                                                                  .value]
                                                              .img_banner[0]),
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                  foregroundDecoration:
                                                      BoxDecoration(
                                                    gradient: LinearGradient(
                                                      begin:
                                                          Alignment.topCenter,
                                                      end: Alignment
                                                          .bottomCenter,
                                                      colors: [
                                                        Colors.black
                                                            .withOpacity(0),
                                                        Colors.black
                                                            .withOpacity(1),
                                                      ],
                                                      stops: const [0.7, 1],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Align(
                                                alignment: Alignment.topCenter,
                                                child: Container(
                                                  width: 400,
                                                  // height: 500,
                                                  clipBehavior: Clip.antiAlias,
                                                  decoration: BoxDecoration(
                                                    color: Colors.black12
                                                        .withOpacity(.5),
                                                    // color: Theme.of(context).cardColor,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                      horizontal:
                                                          defaultPadding / 2,
                                                      vertical:
                                                          defaultPadding * 2,
                                                    ),
                                                    child:
                                                        SingleChildScrollView(
                                                      scrollDirection:
                                                          Axis.vertical,
                                                      child: Center(
                                                        child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: [
                                                            SizedBox(
                                                              height: heightfit(
                                                                  defaultPadding),
                                                            ),
                                                            AutoSizeText(
                                                              'Dosis  ${filterCategorybyJenisPemupukan(MyDataFilterOBJ!.propertyLainnya["tampungan"]["indexperusahaan"])[c.indexdropdownjenisPemupukan.value]}',
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  color: Colors
                                                                      .white,
                                                                  fontStyle:
                                                                      FontStyle
                                                                          .normal,
                                                                  fontSize: 30),
                                                              minFontSize: 3,
                                                              maxLines: 5,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                            ),
                                                            SizedBox(
                                                              height: heightfit(
                                                                  defaultPadding /
                                                                      2),
                                                            ),
                                                            Column(
                                                                children: List.generate(
                                                                    hargaDosis
                                                                        .keys
                                                                        .toList()
                                                                        .length,
                                                                    (index) {
                                                              return Padding(
                                                                padding: EdgeInsets.only(
                                                                    bottom:
                                                                        defaultPadding /
                                                                            2),
                                                                child:
                                                                    Container(
                                                                  clipBehavior:
                                                                      Clip.antiAlias,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                          color: Colors.white.withOpacity(
                                                                              .7),
                                                                          // color: Theme.of(context).cardColor,
                                                                          borderRadius:
                                                                              BorderRadius.circular(15)),
                                                                  child:
                                                                      Container(
                                                                    padding: EdgeInsets.all(heightfit(
                                                                        defaultPadding /
                                                                            2)),
                                                                    child:
                                                                        Column(
                                                                      children: [
                                                                        Row(
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.center,
                                                                          children: [
                                                                            Expanded(
                                                                              flex: 3,
                                                                              child: FittedBox(
                                                                                child: Container(
                                                                                  child: CardProductku(tema: (hargaDosis.keys.toList()[index].toString() == "Kieserit") ? Colors.blue : warnas(List.from(dataProductsObj.where((element) => element.nama == hargaDosis.keys.toList()[index].toString()).first.color)[0]), image: (hargaDosis.keys.toList()[index].toString() == "Kieserit") ? "assets/images/BGA.jpg" : dataProductsObj.where((element) => element.nama == hargaDosis.keys.toList()[index].toString()).first.img),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            SizedBox(
                                                                              width: heightfit(defaultPadding / 2),
                                                                            ),
                                                                            Expanded(
                                                                                flex: 10,
                                                                                child: SingleChildScrollView(
                                                                                  scrollDirection: Axis.vertical,
                                                                                  child: Text.rich(
                                                                                    TextSpan(children: [
                                                                                      TextSpan(
                                                                                        text: "${hargaDosis.keys.toList()[index].toString()}\n",
                                                                                        style: TextStyle(color: Colors.black, fontSize: sT18 - 2, fontWeight: FontWeight.bold),
                                                                                      ),
                                                                                      TextSpan(
                                                                                        text: "Dosis ${" ${(double.parse(aDosis[aDosis.keys.toList()[index]].replaceAll(RegExp(r'[^0-9.]'), '').toString()) * 1000000.toString().length <= 6) ? "${(double.parse(aDosis[aDosis.keys.toList()[index].toString()].replaceAll(RegExp(r'[^0-9.]'), '')) * 1000).toStringAsFixed(1)} ${(c.selectobjPemupukan.value == 1) ? "g" : "g"}" : "${double.parse(aDosis[aDosis.keys.toList()[index].toString()].replaceAll(RegExp(r'[^0-9.]'), '')).toStringAsFixed(1)} ${(c.selectobjPemupukan.value == 1) ? "kg" : "kg"}"} "}",
                                                                                        style: TextStyle(color: Colors.black, fontSize: sT18, fontWeight: FontWeight.bold),
                                                                                      ),
                                                                                      TextSpan(
                                                                                        text: "\nRp."
                                                                                            "${formatRupiah(hitungHarga(aDosis, hargaDosis).values.toList()[index].toString())}"
                                                                                            // "${formatRupiah((hitungHarga(dataDosisfix(MyDataFilterOBJ!.propertyLainnya["tampungan"]["indexperusahaan"], filterCategorybyJenisPemupukan(MyDataFilterOBJ!.propertyLainnya["tampungan"]["indexperusahaan"])[MyDataFilterOBJ!.propertyLainnya["tampungan"]["indexjenisPupuk"]])).values.toList()).toString())} "
                                                                                            "",
                                                                                        style: TextStyle(color: Colors.black, fontSize: sT18, fontWeight: FontWeight.bold),
                                                                                      ),
                                                                                    ]),
                                                                                  ),
                                                                                )),
                                                                          ],
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              );
                                                            })),
                                                            Text(
                                                              "Dosis Acuhan dari Brosure",
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  color: Colors
                                                                      .white,
                                                                  fontStyle:
                                                                      FontStyle
                                                                          .normal,
                                                                  fontSize: 16),
                                                            ),
                                                            Container(
                                                                margin: EdgeInsets.symmetric(
                                                                    horizontal:
                                                                        heightfit(
                                                                            defaultPadding /
                                                                                2),
                                                                    vertical: heightfit(
                                                                        defaultPadding /
                                                                            2)),
                                                                // height: 200,
                                                                width: heightfit(
                                                                    double
                                                                        .infinity),
                                                                decoration:
                                                                    BoxDecoration(
                                                                        color: Colors
                                                                            .white,
                                                                        borderRadius: BorderRadius.only(
                                                                            bottomLeft:
                                                                                Radius.circular(20),
                                                                            bottomRight: Radius.circular(20),
                                                                            topLeft: Radius.circular(20),
                                                                            topRight: Radius.circular(20)),
                                                                        // border:
                                                                        //     Border.all(color: kTextColor.withOpacity(.8), width: .2)
                                                                        boxShadow: [
                                                                      BoxShadow(
                                                                          blurRadius:
                                                                              10,
                                                                          offset: Offset(
                                                                              -1,
                                                                              8),
                                                                          color: Colors
                                                                              .green
                                                                              .withOpacity(.3))
                                                                    ]),
                                                                child: Stack(
                                                                  children: [
                                                                    Positioned(
                                                                      bottom: 0,
                                                                      right: 0,
                                                                      // left: 0,
                                                                      child:
                                                                          Container(
                                                                        height:
                                                                            heightfit(90),
                                                                        width: heightfit(
                                                                            100),
                                                                        decoration: BoxDecoration(
                                                                            color: Colors.green.shade100,
                                                                            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(0), bottomRight: Radius.circular(20), topLeft: Radius.circular(90), topRight: Radius.circular(0)),
                                                                            // border:
                                                                            //     Border.all(color: kTextColor.withOpacity(.8), width: .2)
                                                                            boxShadow: [
                                                                              BoxShadow(blurRadius: 10, offset: Offset(-1, 8), color: Colors.green.withOpacity(.3))
                                                                            ]),
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding:
                                                                          EdgeInsets
                                                                              .all(
                                                                        heightfit(
                                                                            defaultPadding),
                                                                      ),
                                                                      child:
                                                                          Column(
                                                                        children: [
                                                                          RichText(
                                                                              text: TextSpan(children: [
                                                                            TextSpan(
                                                                              text: "Pengeluaran uang anda : ",
                                                                              style: TextStyle(
                                                                                fontWeight: FontWeight.bold,
                                                                                color: kTextColor,
                                                                                fontSize: heightfit(sT18),
                                                                              ),
                                                                            ),
                                                                          ])),
                                                                          CardpHs(
                                                                            title:
                                                                                "Rp."
                                                                                "${formatRupiah(hitungHarga(aDosis, hargaDosis).values.toList().reduce((value, element) => value + element).toString())}"
                                                                                "",
                                                                            hasilAkhir:
                                                                                "",
                                                                            cardornot:
                                                                                false,
                                                                            sizes:
                                                                                heightfit(20),
                                                                            texts:
                                                                                "",
                                                                            multitext: [],
                                                                            tema:
                                                                                Colors.green.shade800,
                                                                            cardCostume:
                                                                                Container(),
                                                                            id: 0,
                                                                            widgetCostum:
                                                                                Container(),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ],
                                                                )),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Align(
                                                alignment: Alignment.topRight,
                                                child: Container(
                                                  padding: EdgeInsets.symmetric(
                                                    horizontal:
                                                        defaultPadding / 3,
                                                    vertical:
                                                        defaultPadding / 3,
                                                  ),
                                                  clipBehavior: Clip.antiAlias,
                                                  decoration: BoxDecoration(
                                                    color: Colors.orange,
                                                    // color: Theme.of(context).cardColor,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  ),
                                                  child: Text(
                                                      filterCategorybyPerusahaan()[(c
                                                                      .indexMenuRawatan
                                                                      .value ==
                                                                  3 ||
                                                              c.indexMenuRawatan
                                                                      .value ==
                                                                  4 ||
                                                              c.indexMenuRawatan
                                                                      .value ==
                                                                  5)
                                                          ? 0
                                                          : MyDataFilterOBJ!
                                                                  .propertyLainnya["tampungan"]
                                                              [
                                                              "indexperusahaan"]],
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.bold)),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: defaultPadding,
                                  ),
                                  Container(
                                    clipBehavior: Clip.antiAlias,
                                    decoration: BoxDecoration(
                                      color: Colors.black12.withOpacity(.8),
                                      // color: Theme.of(context).cardColor,
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Column(
                                      children: [
                                        Stack(
                                          children: [
                                            Positioned.fill(
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                    image: AssetImage(
                                                        dataKategoriMenuRawatan[c
                                                                .indexMenuRawatan
                                                                .value]
                                                            .img_banner[0]),
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                foregroundDecoration:
                                                    BoxDecoration(
                                                  gradient: LinearGradient(
                                                    begin: Alignment.topCenter,
                                                    end: Alignment.bottomCenter,
                                                    colors: [
                                                      Colors.black
                                                          .withOpacity(.5),
                                                      Colors.black
                                                          .withOpacity(1),
                                                    ],
                                                    stops: const [0.7, 1],
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Align(
                                              alignment: Alignment.topCenter,
                                              child: Container(
                                                width: 400,
                                                // height: 500,
                                                clipBehavior: Clip.antiAlias,
                                                decoration: BoxDecoration(
                                                  // color: Colors.black12
                                                  //     .withOpacity(.1),
                                                  // color: Theme.of(context).cardColor,
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsets.symmetric(
                                                    horizontal: defaultPadding,
                                                    vertical:
                                                        defaultPadding * 2,
                                                  ),
                                                  child: SingleChildScrollView(
                                                    scrollDirection:
                                                        Axis.vertical,
                                                    child: Column(
                                                      children: [
                                                        Align(
                                                          alignment:
                                                              Alignment.topLeft,
                                                          child: Container(
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                              horizontal:
                                                                  defaultPadding /
                                                                      3,
                                                              vertical:
                                                                  defaultPadding /
                                                                      3.5,
                                                            ),
                                                            clipBehavior:
                                                                Clip.antiAlias,
                                                            decoration:
                                                                BoxDecoration(
                                                              color:
                                                                  Colors.black,
                                                              // color: Theme.of(context).cardColor,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10),
                                                            ),
                                                            child: Text(
                                                                "Pengaplikasian",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        20,
                                                                    color: Colors
                                                                        .white,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold)),
                                                          ),
                                                        ),
                                                        Center(
                                                          child: Column(
                                                            children: List<
                                                                    Widget>.generate(
                                                                dataPengaplikasianfix(
                                                                        MyDataFilterOBJ!.propertyLainnya["tampungan"]
                                                                            [
                                                                            "indexperusahaan"],
                                                                        filterCategorybyJenisPemupukan(
                                                                            MyDataFilterOBJ!.propertyLainnya["tampungan"]
                                                                                ["indexperusahaan"])[c
                                                                            .indexdropdownjenisPemupukan
                                                                            .value])
                                                                    .length,
                                                                (index) {
                                                              return Column(
                                                                children: [
                                                                  SizedBox(
                                                                    height:
                                                                        defaultPadding /
                                                                            2,
                                                                  ),
                                                                  Align(
                                                                    alignment:
                                                                        Alignment
                                                                            .topRight,
                                                                    child:
                                                                        Container(
                                                                      padding:
                                                                          EdgeInsets
                                                                              .symmetric(
                                                                        horizontal:
                                                                            defaultPadding /
                                                                                3,
                                                                        vertical:
                                                                            defaultPadding /
                                                                                3,
                                                                      ),
                                                                      clipBehavior:
                                                                          Clip.antiAlias,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: Colors
                                                                            .orange,
                                                                        // color: Theme.of(context).cardColor,
                                                                        borderRadius:
                                                                            BorderRadius.circular(10),
                                                                      ),
                                                                      child: Text(
                                                                          "${dataPengaplikasianfix(MyDataFilterOBJ!.propertyLainnya["tampungan"]["indexperusahaan"], filterCategorybyJenisPemupukan(MyDataFilterOBJ!.propertyLainnya["tampungan"]["indexperusahaan"])[c.indexdropdownjenisPemupukan.value]).keys.toList()[index].toString()} \n ${List<DataObjHasilTakaran>.of(filterDatabyJenisPemupukan(MyDataFilterOBJ!.propertyLainnya["tampungan"]["indexperusahaan"], filterCategorybyJenisPemupukan(MyDataFilterOBJ!.propertyLainnya["tampungan"]["indexperusahaan"])[c.indexdropdownjenisPemupukan.value])).map((e) => e.penjelas).first}",
                                                                          style: TextStyle(
                                                                              color: Colors.black,
                                                                              fontWeight: FontWeight.bold)),
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                    height:
                                                                        defaultPadding /
                                                                            2,
                                                                  ),
                                                                  Column(
                                                                    children: List<
                                                                            Widget>.generate(
                                                                        dataPengaplikasianfix(MyDataFilterOBJ!.propertyLainnya["tampungan"]["indexperusahaan"], filterCategorybyJenisPemupukan(MyDataFilterOBJ!.propertyLainnya["tampungan"]["indexperusahaan"])[c.indexdropdownjenisPemupukan.value])
                                                                            .values
                                                                            .toList()[
                                                                                index]
                                                                            .length,
                                                                        (indexr) {
                                                                      double angka = double.parse(dataPengaplikasianfix(
                                                                              MyDataFilterOBJ!.propertyLainnya["tampungan"][
                                                                                  "indexperusahaan"],
                                                                              filterCategorybyJenisPemupukan(MyDataFilterOBJ!.propertyLainnya["tampungan"]["indexperusahaan"])[c
                                                                                  .indexdropdownjenisPemupukan.value])
                                                                          .values
                                                                          .toList()[
                                                                              index]
                                                                          .values
                                                                          .toList()[
                                                                              indexr]
                                                                          .toString()
                                                                          .replaceAll(
                                                                              RegExp(r'[^0-9.]'),
                                                                              ''));
                                                                      return Padding(
                                                                        padding:
                                                                            EdgeInsets.only(bottom: defaultPadding / 2),
                                                                        child:
                                                                            Container(
                                                                          clipBehavior:
                                                                              Clip.antiAlias,
                                                                          decoration: BoxDecoration(
                                                                              color: Colors.white.withOpacity(.7),
                                                                              // color: Theme.of(context).cardColor,
                                                                              borderRadius: BorderRadius.circular(15)),
                                                                          child:
                                                                              Container(
                                                                            padding:
                                                                                EdgeInsets.all(heightfit(defaultPadding / 2)),
                                                                            child:
                                                                                Column(
                                                                              children: [
                                                                                Row(
                                                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                                                  children: [
                                                                                    Expanded(
                                                                                      flex: 3,
                                                                                      child: FittedBox(
                                                                                        child: Container(
                                                                                          child: CardProductku(tema: (dataPengaplikasianfix(MyDataFilterOBJ!.propertyLainnya["tampungan"]["indexperusahaan"], filterCategorybyJenisPemupukan(MyDataFilterOBJ!.propertyLainnya["tampungan"]["indexperusahaan"])[c.indexdropdownjenisPemupukan.value]).values.toList()[index].keys.toList()[indexr].toString() == "Kieserit") ? Colors.blue : warnas(List.from(dataProductsObj.where((element) => element.nama == dataPengaplikasianfix(MyDataFilterOBJ!.propertyLainnya["tampungan"]["indexperusahaan"], filterCategorybyJenisPemupukan(MyDataFilterOBJ!.propertyLainnya["tampungan"]["indexperusahaan"])[c.indexdropdownjenisPemupukan.value]).values.toList()[index].keys.toList()[indexr].toString()).first.color)[0]), image: (dataPengaplikasianfix(MyDataFilterOBJ!.propertyLainnya["tampungan"]["indexperusahaan"], filterCategorybyJenisPemupukan(MyDataFilterOBJ!.propertyLainnya["tampungan"]["indexperusahaan"])[c.indexdropdownjenisPemupukan.value]).values.toList()[index].keys.toList()[indexr].toString() == "Kieserit") ? "assets/images/BGA.jpg" : dataProductsObj.where((element) => element.nama == dataPengaplikasianfix(MyDataFilterOBJ!.propertyLainnya["tampungan"]["indexperusahaan"], filterCategorybyJenisPemupukan(MyDataFilterOBJ!.propertyLainnya["tampungan"]["indexperusahaan"])[c.indexdropdownjenisPemupukan.value]).values.toList()[index].keys.toList()[indexr].toString()).first.img),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                    SizedBox(
                                                                                      width: heightfit(defaultPadding / 2),
                                                                                    ),
                                                                                    Expanded(
                                                                                        flex: 10,
                                                                                        child: SingleChildScrollView(
                                                                                          scrollDirection: Axis.vertical,
                                                                                          child: Text.rich(
                                                                                            TextSpan(children: [
                                                                                              TextSpan(
                                                                                                text: "${dataPengaplikasianfix(MyDataFilterOBJ!.propertyLainnya["tampungan"]["indexperusahaan"], filterCategorybyJenisPemupukan(MyDataFilterOBJ!.propertyLainnya["tampungan"]["indexperusahaan"])[c.indexdropdownjenisPemupukan.value]).values.toList()[index].keys.toList()[indexr].toString()}\n",
                                                                                                style: TextStyle(color: Colors.black, fontSize: sT18 - 2, fontWeight: FontWeight.bold),
                                                                                              ),
                                                                                              TextSpan(
                                                                                                text: "${(double.parse(dataPengaplikasianfix(MyDataFilterOBJ!.propertyLainnya["tampungan"]["indexperusahaan"], filterCategorybyJenisPemupukan(MyDataFilterOBJ!.propertyLainnya["tampungan"]["indexperusahaan"])[c.indexdropdownjenisPemupukan.value]).values.toList()[index].values.toList()[indexr].toString().replaceAll(RegExp(r'[^0-9.]'), '')) * 1000000.toString().length <= 6) ? "${(double.parse(dataPengaplikasianfix(MyDataFilterOBJ!.propertyLainnya["tampungan"]["indexperusahaan"], filterCategorybyJenisPemupukan(MyDataFilterOBJ!.propertyLainnya["tampungan"]["indexperusahaan"])[c.indexdropdownjenisPemupukan.value]).values.toList()[index].values.toList()[indexr].toString().replaceAll(RegExp(r'[^0-9.]'), '')) * 1000).toStringAsFixed(1)} ${(c.selectobjPemupukan.value == 1) ? "g" : "g"}" : "${double.parse(dataPengaplikasianfix(MyDataFilterOBJ!.propertyLainnya["tampungan"]["indexperusahaan"], filterCategorybyJenisPemupukan(MyDataFilterOBJ!.propertyLainnya["tampungan"]["indexperusahaan"])[c.indexdropdownjenisPemupukan.value]).values.toList()[index].values.toList()[indexr].toString().replaceAll(RegExp(r'[^0-9.]'), '')).toStringAsFixed(1)} ${(c.selectobjPemupukan.value == 1) ? "kg" : "kg"}"} ",
                                                                                                style: TextStyle(color: Colors.black, fontSize: sT18, fontWeight: FontWeight.bold),
                                                                                              ),
                                                                                              TextSpan(
                                                                                                text: "\nRp. "
                                                                                                    "${formatRupiah((hitungHarga(dataPengaplikasianfix(MyDataFilterOBJ!.propertyLainnya["tampungan"]["indexperusahaan"], filterCategorybyJenisPemupukan(MyDataFilterOBJ!.propertyLainnya["tampungan"]["indexperusahaan"])[c.indexdropdownjenisPemupukan.value]).values.toList()[index], hargaDosis).values.toList()[indexr].toString()).toString())}"
                                                                                                    "",
                                                                                                style: TextStyle(color: Colors.black, fontSize: sT18, fontWeight: FontWeight.bold),
                                                                                              ),
                                                                                            ]),
                                                                                          ),
                                                                                        )),
                                                                                  ],
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      );
                                                                    }),
                                                                  ),
                                                                ],
                                                              );
                                                            }),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(
                                      heightfit(defaultPadding),
                                    ),
                                    child: Column(
                                      children: [
                                        RichText(
                                            text: TextSpan(children: [
                                          TextSpan(
                                            text:
                                                "Total Pengeluaran uang anda Untuk kebutuhan pupuk: ",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: kTextColor,
                                              fontSize: heightfit(sT18),
                                            ),
                                          ),
                                        ])),
                                        RichText(
                                            text: TextSpan(children: [
                                          TextSpan(
                                            text: "Rp."
                                                "${formatRupiah((hitungHarga(aDosis, hargaDosis).values.toList().reduce((value, element) => value + element) + hargaTotalpH).toString())}",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: kTextColor,
                                              fontSize: heightfit(sT18),
                                            ),
                                          ),
                                        ])),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          );
                        }),
                      ),
                    ),
                    // final item = databysubmenu.toList()[index % widget.items.length];
                    // c.datacategoryjenisPemupukan.value[MyDataFilterOBJ!.propertyLainnya["tampungan"]["indexjenisPupuk"]]
                  ],
                ),
              ),
              SizedBox(
                height: defaultPadding,
              ),
              AutoSizeText(
                "Pengeluaran Lainnya : ",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.normal,
                  fontSize: 20,
                  color: kTextColor,
                ),
                minFontSize: 12,
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(
                height: defaultPadding,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(.7),
                    border: Border.all(
                        style: BorderStyle.solid,
                        color: warnas("0b5394"),
                        width: 3.5),
                    // color: Theme.of(context).cardColor,
                    borderRadius: BorderRadius.circular(15)),
                child: NotificationListener<ScrollNotification>(
                  onNotification: (ScrollNotification notification) {
                    if (notification is ScrollEndNotification) {
                      if (_childScrollController.position.atEdge) {
                        if (_childScrollController.position.pixels == 0) {
                          // At the top of the child scroll
                          // widget.parentController.jumpTo(widget.parentController.offset - 30);
                          _parentScrollController.animateTo(
                            _parentScrollController.offset -
                                SizeConfig.screenHeight! / 4,
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        } else {
                          // At the bottom of the child scroll
                          // widget.parentController.jumpTo(widget.parentController.offset + 30);
                          _parentScrollController.animateTo(
                            _parentScrollController.offset +
                                SizeConfig.screenHeight! / 4,
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        }
                      }
                    }
                    return false;
                  },
                  child: Padding(
                    padding: EdgeInsets.all(defaultPadding / 2),
                    child: ListView.builder(
                        controller: _childScrollController,
                        itemCount: MyDataFilterOBJ!
                            .propertyLainnya["keperluanLainnya"].length,
                        shrinkWrap: true,
                        // Menyesuaikan ukuran dengan jumlah item
                        scrollDirection: Axis.vertical,
                        // padding: const EdgeInsets.symmetric(horizontal: 56),
                        addRepaintBoundaries: true,
                        itemBuilder: (context, indexFixs) {
                          // final item = dataParentss.toList()[index % widget.items.length];
                          // dataParentss[indexK].pupuk[indexFixs].hasil = hargaObject["hasilAkhirPerObject"].toString();
                          return ExpandingCards(
                            height: 300,
                            indexFix: indexFixs,
                            // len: dataParentss[indexK].pupuk.length,
                            len: MyDataFilterOBJ!
                                .propertyLainnya["keperluanLainnya"].length,
                            gridview: false,
                            axisCount: 3,
                            onchange: (indekpuu) {
                              // hasilTotal(indexK, indexFixs, dataParentss[indexK],
                              //     widget.waktu);
                            },
                            img: dataKategoriMenuRawatan[
                                    c.indexMenuRawatan.value]
                                .img_banner[1],
                            title: MyDataFilterOBJ!
                                    .propertyLainnya["keperluanLainnya"]
                                [indexFixs]["Nama Pengeluaran"],
                            subtitle:
                                "Rp.${formatRupiah(MyDataFilterOBJ!.propertyLainnya["keperluanLainnya"][indexFixs]["Beban Biaya"].toString())}",
                            penjelas: "",
                            // "Dengan \nDaya ${dataParentss[indexK].pupuk[indexFixs].namaPupu} : ${dataParentss[indexK].pupuk[indexFixs].watt} Watt\nTotal daya : ${dataParentss[indexK].pupuk[indexFixs].hasil} Watt \nSelama waktu: ${dataParentss[indexK].pupuk[indexFixs].LamaListring} Jam ",
                            dialog: Container(),
                            tambah: (LO) {
                              Future.microtask(() {
                                setState(() {});
                              });
                              // setState(() {
                              MyDataFilterOBJ!
                                  .propertyLainnya["keperluanLainnya"]
                                  .add({
                                "Nama Pengeluaran": "Listrik",
                                "Beban Biaya": 0.0
                              });

                              // setPreference();
                              // setPreference();
                              // });
                            },
                            kurang: (s) {
                              Future.microtask(() {
                                setState(() {});
                              });
                              // setState(() {
                              MyDataFilterOBJ!
                                  .propertyLainnya["keperluanLainnya"]
                                  .removeAt(indexFixs);

                              // });
                              // setPreference();
                            },
                            costume: FittedBox(
                              child: Container(
                                height: 350,
                                width: 300,
                                padding: EdgeInsets.only(top: defaultPadding),
                                child: CardpHs(
                                  title: "Edit Pengeluaran : ",
                                  hasilAkhir: "",
                                  cardornot: false,
                                  sizes: heightfit(18),
                                  texts: "",
                                  multitext: [],
                                  tema: Colors.green.shade800,
                                  cardCostume: Container(),
                                  id: 0,
                                  widgetCostum: FittedBox(
                                    child: SizedBox(
                                      height: 260,
                                      width: 250,
                                      child: Column(
                                        children: [
                                          Fields(
                                            controller: TextEditingController(
                                                text:
                                                    "${MyDataFilterOBJ!.propertyLainnya["keperluanLainnya"][indexFixs]["Nama Pengeluaran"]}"
                                                        .toString()),
                                            satuan: "",
                                            title: "Nama Pengeluaran \n",
                                            tema: Colors.black38,
                                            onStateChange: (values) {
                                              Future.microtask(() {
                                                setState(() {});
                                              });
                                              MyDataFilterOBJ!.propertyLainnya[
                                                          "keperluanLainnya"]
                                                      [indexFixs]
                                                  ["Nama Pengeluaran"] = values;

                                              // setState(() {
                                              //
                                              // });
                                              // setPreference();
                                            },
                                            inputType: TextInputType.text,
                                            enable: true,
                                          ),
                                          Fields(
                                            controller: TextEditingController(
                                                text:
                                                    "${MyDataFilterOBJ!.propertyLainnya["keperluanLainnya"][indexFixs]["Beban Biaya"]}"
                                                        .toString()),
                                            satuan: "Rp/Kg",
                                            title: "Harga \n",
                                            tema: Colors.black38,
                                            onStateChange: (values) {
                                              Future.microtask(() {
                                                setState(() {});
                                              });
                                              MyDataFilterOBJ!.propertyLainnya[
                                                          "keperluanLainnya"]
                                                      [indexFixs]
                                                  ["Beban Biaya"] = values;

                                              // setState(() {
                                              //
                                              // });
                                              // setPreference();
                                            },
                                            inputType: TextInputType.number,
                                            enable: true,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
                ),
              ),
              SizedBox(
                height: defaultPadding,
              ),
              AutoSizeText(
                "Total : ",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.normal,
                  fontSize: 20,
                  color: kTextColor,
                ),
                minFontSize: 12,
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(
                height: defaultPadding / 2,
              ),
              Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: defaultPadding / 3,
                    vertical: defaultPadding / 3,
                  ),
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    // color: Theme.of(context).cardColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    "Rp. "
                    "${formatRupiah((hitungHarga(aDosis, hargaDosis).values.toList().reduce((value, element) => value + element) + (hargaTotalpH + List.of(MyDataFilterOBJ!.propertyLainnya["keperluanLainnya"]).map((e) => double.tryParse(e["Beban Biaya"].toString())!).toList().reduce((value, element) => value + element).toDouble())).toString())}"
                    "",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  )),
            ],
          );
        }),
      ),
    );
  }

  Padding cardWithImg(String penjelas, double size, Widget widgetCostume) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: defaultPadding / 2,
      ),
      child: Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          color: Colors.black12.withOpacity(.5),
          // color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
            Stack(
              children: [
                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                            dataKategoriMenuRawatan[c.indexMenuRawatan.value]
                                .img_banner[0]),
                        fit: BoxFit.cover,
                      ),
                    ),
                    foregroundDecoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.black.withOpacity(0),
                          Colors.black.withOpacity(1),
                        ],
                        stops: const [0.7, 1],
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    width: 400,
                    // height: 500,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      color: Colors.black12.withOpacity(.5),
                      // color: Theme.of(context).cardColor,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: defaultPadding / 2,
                        vertical: defaultPadding * 2,
                      ),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: heightfit(defaultPadding),
                                ),
                                Center(
                                    child: RichText(
                                  text: TextSpan(
                                    text: penjelas,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: size),
                                  ),
                                )),
                                SizedBox(
                                  height: heightfit(defaultPadding / 2),
                                ),
                                Column(children: []),
                                SizedBox(
                                  height: heightfit(defaultPadding / 2),
                                ),
                                widgetCostume,
                                // Text(
                                //   "Dosis Acuhan dari Brosure",
                                //   style: TextStyle(
                                //       fontWeight:
                                //       FontWeight
                                //           .bold,
                                //       color: Colors
                                //           .white!,
                                //       fontStyle:
                                //       FontStyle
                                //           .normal,
                                //       fontSize: 16),
                                // ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: defaultPadding / 3,
                      vertical: defaultPadding / 3,
                    ),
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      // color: Theme.of(context).cardColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                        filterCategorybyPerusahaan()[
                            (c.indexMenuRawatan.value == 3 ||
                                    c.indexMenuRawatan.value == 4 ||
                                    c.indexMenuRawatan.value == 5)
                                ? 0
                                : MyDataFilterOBJ!.propertyLainnya["tampungan"]
                                    ["indexperusahaan"]],
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
