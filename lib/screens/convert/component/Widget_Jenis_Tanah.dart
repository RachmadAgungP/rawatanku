import 'package:rawatt/components/card_field.dart';
import 'package:rawatt/components/inputan.dart';
import 'package:rawatt/constants.dart';
import 'package:rawatt/model/datafix.dart';
import 'package:rawatt/model/kalkulator/mdl_KatRumus.dart';
import 'package:rawatt/model/kalkulator/mdl_KatTanah.dart';
import 'package:rawatt/rumus.dart';
import 'package:rawatt/screens/convert/_model.dart';
import 'package:rawatt/screens/convert/component/Widget_Jenis_Pot.dart';
import 'package:rawatt/screens/convert/component/Widget_Massa_Tanah.dart';
import 'package:rawatt/size_config.dart';
import 'package:flutter/material.dart';
import 'package:function_tree/function_tree.dart';

import '../../../model/MenuRawatan/mdl_MenuRawatan.dart';
import '../../../model/dosis/fieldku_campur.dart';
import 'Widget_Jarak_Tanaman.dart';
import 'inisialisasi_var.dart';

class WidgetJenisTanah extends StatefulWidget {
  final int id;
  final Color tema;
  final double kedalamanTanah;
  final int indexmenu;
  final int indexsubmenu;
  final Function(double, int, String) onChangeState;
  const WidgetJenisTanah(
      {super.key,
      required this.id,
      required this.tema,
      required this.kedalamanTanah,
      required this.onChangeState,
      required this.indexmenu,
      required this.indexsubmenu});

  @override
  _WidgetJenisTanahState createState() => _WidgetJenisTanahState();
}

String cariSatuan(String vars) {
  String value = dataKategoriInisialisasi
      .where((element) => element.vari == vars)
      .first
      .satuan;
  return value;
}

double cariValue(String vars) {
  // changedatavalues(satuan);
  double value = dataKategoriInisialisasi
      .where((element) => element.vari == vars)
      .first
      .nilai;
  return value;
}

String cariStringnamavar(String vars) {
  String value = dataKategoriInisialisasi
      .where((element) => element.vari == vars)
      .first
      .ket;
  return value;
}

void cariValuenUpdate(String vars, double nilais) {
  dataKategoriInisialisasi
      .where((element) => element.vari == vars)
      .first
      .nilai = nilais;
}

double carupdate(String vars, Map variable, String rumus, int indexObject) {
  return double.tryParse(
      convertRumus(variable, rumus).interpret().toDouble().toStringAsFixed(3))!;
}

double carupdateNew(String vars, Map variable, String rumus, int indexObject) {
  return double.tryParse(convertRumusTextEdit(variable, rumus)
      .interpret()
      .toDouble()
      .toStringAsFixed(3))!;
}

void cariVarUpdate(String vars, bool multi, double value, String rumus,
    int indexObject, String satuan) {
  if (multi == true) {
    // filterdataParent[widget.indexobject].varii[0].
    // filterdataParent[indexObject].varii[0].valuess[vars][1] = double.tryParse(convertRumus(variables(rumus), rumus)
    //     .interpret()
    //     .toDouble()
    //     .toStringAsFixed(3))!;

    dataKategoriInisialisasi
            .where((element) => element.vari == vars)
            .first
            .nilai =
        double.tryParse(convertRumus(variables(rumus), rumus)
            .interpret()
            .toDouble()
            .toStringAsFixed(5))!;
    // print("ada ${vars} ${dataKategoriInisialisasi
    //     .where((element) => element.vari == vars)
    //     .first
    //     .nilai}");
  } else {
    dataKategoriInisialisasi
        .where((element) => element.vari == vars)
        .first
        .nilai = value;
  }
}

void onPresosMtT(int id, bool hitungDalampot, String satuan) {
  // setState(() {

  cariVarUpdate("tPt", true, 1.0, "t", 0, satuan);
  cariVarUpdate(
      "vTHa",
      false,
      double.parse(MyDataFilterOBJ!.propertyLainnya["ketebalanTanah"]) * 10000,
      "",
      0,
      satuan);
  cariVarUpdate(
      "q", false, dataKategoriTanah[id].masaJenis * 1000, "", 0, satuan);
  cariVarUpdate(
      "bTHa", false, cariValue("vTHa") * cariValue("q"), "", 0, satuan);
  if (hitungDalampot == true) {
    cariVarUpdate("vTPt", true, 1.0, "LMt", 0, satuan);
  } else {
    cariVarUpdate("vTPt", true, 1.0, "LMt", 0, satuan);
  }

  cariVarUpdate(
      "bTPt", false, cariValue("vTPt") * cariValue("q"), "", 0, satuan);
// });
}

class _WidgetJenisTanahState extends State<WidgetJenisTanah> {
  @override
  void initState() {
    c.massaJenis.value = dataKategoriInisialisasi
        .where((element) => element.vari == "q")
        .first
        .nilai;
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // int ids = widget.id;
    // print("ids ${widget.id}");
    return Column(
      children: [
        CardFields(
          tema: widget.tema,
          judul: "Jenis Tanah :",
          columns: Column(
            children: [
              SizedBox(
                height: heightfit(defaultPadding),
              ),
              DropDowns(
                (newActivity) {
                  setState(
                    () {
                      c.typeTanah.value = newActivity;
                      c.id_type_tanah.value = dataKategoriTanah
                          .where((element) => element.tanah == newActivity)
                          .first
                          .id;
                      onPresosMtT(c.id_type_tanah.value, true, c.satuan.value);

                      c.massaJenis.value = cariValue("q");
                      widget.onChangeState(c.volumeTanah1Ha.value,
                          c.id_type_tanah.value, c.typeTanah.value);
                    },
                  );
                },
                widget.tema,
                dataKategoriTanah.map((e) => e.tanah).toList(),
                "Tanah",
                dataKategoriTanah
                    .map((e) => e.tanah)
                    .toList()[c.id_type_tanah.value],
                "Type tanah: ",
                [],
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: defaultPadding, vertical: defaultPadding),
                child: Column(
                  children: [
                    (widget.kedalamanTanah != 0.0)
                        ? Text.rich(TextSpan(
                            children: [
                              TextSpan(
                                  text:
                                      "Massa Jenis ${c.typeTanah.value} : ${cariValue("q")} kg/m² \n",
                                  style: TextStyle(
                                      color: widget.tema.withOpacity(.7),
                                      fontSize: heightfit(18),
                                      fontWeight: FontWeight.bold)),
                              TextSpan(
                                text: "Ketetapan Satuan Luas Lahan : 1 Ha \n",
                              ),
                              TextSpan(
                                  text:
                                      "Kedalaman Tanah Berdasarkan Kedalaman pot : ${cariValue("tPt")} m \n",
                                  style: TextStyle(
                                      color: widget.tema.withOpacity(.7),
                                      fontSize: heightfit(16),
                                      fontWeight: FontWeight.normal)),
                              TextSpan(
                                  text:
                                      "Maka Volume Seluas 1 Ha : ${cariValue("tPt")} m x 10.000 m² = ${cariValue("vTHa")} m³ \n",
                                  style: TextStyle(
                                      color: widget.tema.withOpacity(.7),
                                      fontSize: heightfit(16),
                                      fontWeight: FontWeight.normal)),
                              TextSpan(
                                text:
                                    "Maka Berat Tanah 1 Ha : (${cariValue("vTHa")} m³) x ${cariValue("q")} kg/m² = ${(cariValue("bTHa")).toStringAsFixed(1)} kg",
                                style: TextStyle(
                                    color: widget.tema.withOpacity(.7),
                                    fontSize: heightfit(16),
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                            style: TextStyle(
                              color: widget.tema.withOpacity(.7),
                              fontSize: heightfit(20),
                            ),
                          ))
                        : Text(
                            "Masukan Pengasumsian kedalaman perakaran tanaman Pot",
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: heightfit(20),
                            ),
                          ),
                  ],
                ),
              ),
              SizedBox(
                height: heightfit(defaultPadding),
              )
            ],
          ),
          onChangeState: () {
            setState(() {});
          },
          indexmenu: widget.indexmenu,
          indexsubmenu: widget.indexsubmenu,
          warna: Colors.white,
        ),
        CardFields(
          tema: warnas(
              dataKategoriMenuRawatan[c.indexMenuRawatan.value].colorku[0]),
          judul: "Volume Pot berisi Tanah : ",
          columns: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: widthfit(defaultPadding / 2),
                vertical: heightfit(defaultPadding)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: heightfit(110),
                  child: FittedBox(
                    child: SizedBox(
                      height: 110,
                      width: 110,
                      child: ItemPot(
                        tema: warnas(
                            dataKategoriMenuRawatan[c.indexMenuRawatan.value]
                                .colorku[0]),
                        img: dataKategoriRumus
                            .where((element) => element.id == c.indpots.value)
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
                SizedBox(height: heightfit(defaultPadding)),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Volume Pot : ",
                      style: TextStyle(
                        color: warnas(
                            dataKategoriMenuRawatan[c.indexMenuRawatan.value]
                                .colorku[0]),
                        fontWeight: FontWeight.bold,
                        fontSize: heightfit(20),
                      ),
                    ),
                    Text(
                      "${cariValue("LMt")} ${c.satuan.value}³\n ${cariValue("vTPt")} ${c.satuan.value == 'm' ? 'm³' : 'm³'}",
                      style: TextStyle(
                        color: warnas(dataKategoriMenuRawatan[
                                    c.indexMenuRawatan.value]
                                .colorku[0])
                            .withOpacity(.7),
                        fontSize: heightfit(20),
                      ),
                    ),
                    Text(
                      "Massa Jenis ${c.typeTanah.value} : ",
                      style: TextStyle(
                        color: warnas(
                            dataKategoriMenuRawatan[c.indexMenuRawatan.value]
                                .colorku[0]),
                        fontWeight: FontWeight.bold,
                        fontSize: heightfit(20),
                      ),
                    ),
                    Text(
                      "${cariValue("q")} Kg/m³",
                      style: TextStyle(
                        color: warnas(dataKategoriMenuRawatan[
                                    c.indexMenuRawatan.value]
                                .colorku[0])
                            .withOpacity(.7),
                        fontSize: heightfit(20),
                      ),
                    ),
                    Text(
                      "Massa Pot Berisi ${c.typeTanah.value} : ",
                      style: TextStyle(
                        color: warnas(
                            dataKategoriMenuRawatan[c.indexMenuRawatan.value]
                                .colorku[0]),
                        fontWeight: FontWeight.bold,
                        fontSize: heightfit(20),
                      ),
                    ),
                    Text(
                      "ρ = m / v \n${cariValue("q")} kg/m³ = m / ${cariValue("vTPt")} m³\nm = ${cariValue("q")} kg/m³ x ${(cariValue("vTPt"))} m³ = ${cariValue("bTPt")} kg",
                      style: TextStyle(
                        color: warnas(dataKategoriMenuRawatan[
                                    c.indexMenuRawatan.value]
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
          warna: Colors.white,
        ),
      ],
    );
  }
}
//
