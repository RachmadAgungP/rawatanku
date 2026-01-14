import 'dart:convert';

import 'package:rawatt/constants.dart';
import 'package:rawatt/rumus.dart';
import 'package:rawatt/screens/convert/_model.dart';
import 'package:rawatt/screens/convert/component/Widget_Jarak_Tanaman.dart';
import 'package:rawatt/screens/convert/component/Widget_Jenis_Dosis.dart';
import 'package:rawatt/screens/convert/component/Widget_Jenis_Lahan.dart';
import 'package:rawatt/screens/convert/component/Widget_Komoditi.dart';
import 'package:rawatt/screens/convert/component/database_rumus_komoditi.dart';
import 'package:rawatt/screens/convert/component/inisialisasi_var.dart';
import 'package:rawatt/screens/convert/screens/anjuran_pupuk_majemuk/PupukMajemuk_display.dart';
// import 'package:rawatt/screens/convert/component/Widget_Komoditi_Tunggal.dart';
import 'package:rawatt/size_config.dart';
import 'package:flutter/material.dart';
import 'package:function_tree/function_tree.dart';
import 'package:get/get.dart';

class PupukBerdasarkanAnjuranPupuk extends StatefulWidget {
  final String judul;
  final Color tema;
  final List dataRumusPerKomoditi;
  final List dataPerhitunganPerKomoditi;
  const PupukBerdasarkanAnjuranPupuk(
      {Key key,
      this.judul,
      this.tema,
      this.dataRumusPerKomoditi,
      this.dataPerhitunganPerKomoditi})
      : super(key: key);
  @override
  _PupukBerdasarkanAnjuranPupukState createState() =>
      _PupukBerdasarkanAnjuranPupukState();
}

class _PupukBerdasarkanAnjuranPupukState
    extends State<PupukBerdasarkanAnjuranPupuk> {
  // List<Map<String, dynamic>> data = DosisPupuk;

  void gethasil(itemSelecteds) {
    setState(() {
      Map<String, dynamic> takaran = Map<String, dynamic>.from(json.decode(
          json.encode(widget.dataRumusPerKomoditi[itemSelecteds].takaran)));
      Map<String, dynamic> hasilKomodity = Map<String, dynamic>.from(
          json.decode(
              json.encode(widget.dataRumusPerKomoditi[itemSelecteds].hasil)));
      Map<String, dynamic> variabel = Map<String, dynamic>.from(json.decode(
          json.encode(widget.dataRumusPerKomoditi[itemSelecteds].variabels)));

      Map<String, dynamic> rumusku =
          Map.from(widget.dataPerhitunganPerKomoditi[0]["rumus"]);
      List dataRumus = List.from(rumusku[
          "Rumus Kalkulasi Pupuk Berdasarkan Anjuran Pupuk ${widget.judul}"]);
      List dataDosisPupuk = List.from(
          widget.dataPerhitunganPerKomoditi[0]["input"]["Dosis Pupuk"]);

      if (dataRumus.length != dataDosisPupuk.length) {
        rumusku["Rumus Kalkulasi Pupuk Berdasarkan Anjuran Pupuk ${widget.judul}"] =
            List.generate(
                widget.dataRumusPerKomoditi[itemSelecteds].variabels.values
                    .map((e) => e[1])
                    .length,
                (index) => dataRumus[0]);
        print(
            "dosis ${widget.dataPerhitunganPerKomoditi[0]["input"]["Dosis Pupuk"]}");
        print(
            "dosis ddd ${widget.dataRumusPerKomoditi[itemSelecteds].variabels.values.map((e) => e[1]).length}");
        print(
            "oooop ${rumusku["Rumus Kalkulasi Pupuk Berdasarkan Anjuran Pupuk ${widget.judul}"]}");
        print("variabel ${variabel}");
      }
      variabel.forEach((key, value) {
        widget.dataPerhitunganPerKomoditi[0]["input"]
            [key] = [value[0], value[1]];
        print(
            "Maps baru $key : ${widget.dataPerhitunganPerKomoditi[0]["input"][key]}");
      });
      // =================PROSES MATH TAKARAN PUPUK=============

      List dataTakaran = [];
      widget.dataPerhitunganPerKomoditi[0]["hasilAkhir"]["takaran"] = [];
      int ind = 0;

      takaran.forEach((k, v) {
        widget.dataPerhitunganPerKomoditi[0]["hasilAkhir"]["takaran"]
            .add({k: v});
        int ind1 = 0;
        v.forEach((k1, v1) {
          hasilKomodity[k][k1] =
              convertRumus(widget.dataPerhitunganPerKomoditi[0]["input"], v1)
                  .interpret();
          dataTakaran.add(convertRumus(variabel, v1).interpret().toDouble());
          widget.dataPerhitunganPerKomoditi[0]["hasilAkhir"]["takaran"][ind][k]
                  [k1] =
              // Map.from(v).map((key, value) => MapEntry(key,
              convertRumus(widget.dataPerhitunganPerKomoditi[0]["input"], v1)
                  .interpret()
                  .toDouble();
// ==================================================================
          List hasil = convertListRumus(
              widget.dataPerhitunganPerKomoditi[0]["input"],
              List.from((rumusku["PLLahan"])));
          widget.dataPerhitunganPerKomoditi[0]["input"]
              ["PLLahan"] = [hasil.toString().interpret().toDouble()];
          widget.dataPerhitunganPerKomoditi[0]["perhitungan"]["PLLahan"][1] =
              "${hasil[0]} = ${hasil[0].toString().interpret().toDouble()}";
          print(
              // dasar = urea : 75.0 - (75.0 / 2) = 37.5
              "popo $k = $k1 : ${convertRumus(widget.dataPerhitunganPerKomoditi[0]["input"], v1)} = ${convertRumus(widget.dataPerhitunganPerKomoditi[0]["input"], v1).interpret()}");
          ind1 += 1;
        });
        ind += 1;
      });
      List asi2 = convertListRumus(
          widget.dataPerhitunganPerKomoditi[0]["input"],
          List.from(rumusku[
              "Rumus Kalkulasi Pupuk Berdasarkan Anjuran Pupuk ${widget.judul}"]));

      widget.dataPerhitunganPerKomoditi[0]["input"]["Dosis Pupuk per Lahan"] =
          asi2.map((e) => e.toString().interpret().toDouble()).toList();
      print(
          "Takaran Pupuk ${widget.dataPerhitunganPerKomoditi[0]["input"]["Takaran Pupuk"]}");
      print(
          "kEBUTUHAN PUPUK ${widget.dataPerhitunganPerKomoditi[0]["input"]["Dosis Pupuk per Lahan"]}");
    });
  }

  // int stateTypeLahan = 0;

  @override
  Widget build(BuildContext context) {
    int itemSelecteds = c.selectobjPemupukan.value;
    // stateItem = 0;\
    if (c.selectobjPemupukan.value > widget.dataRumusPerKomoditi.length - 1) {
      itemSelecteds = widget.dataRumusPerKomoditi.length - 1;
      // itemSelecteds = widget.dataRumusPerKomoditi.length - 1;
      c.selectobjPemupukan.value = itemSelecteds;
    }
    Map<String, dynamic> rumusku =
        Map.from(widget.dataPerhitunganPerKomoditi[0]["rumus"]);

    widget.dataPerhitunganPerKomoditi[0]["input"]["Luas Lahan"] = List.from(
        listTypeLahan[stateTypeLahan].hasilAkhir.values.map((e) => e[1]))[0];
    Color tema = Colors.blueGrey.shade600;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          WidgetPupukKomoditi(
            dataRumusPerKomoditi: widget.dataRumusPerKomoditi,
            indexKe: 0,
            tema: widget.tema,
            indexPageCalkulator: 0,
            stateID: itemSelecteds,
            onChangeState: (itemselected, dataTakaran) {
              // print(typesLahanValue);
              setState(() {
                itemSelecteds = itemselected;
                widget.dataPerhitunganPerKomoditi[0]["input"]["Dosis Pupuk"] =
                    widget.dataRumusPerKomoditi[itemSelecteds].variabels.values
                        .map((e) => e[1])
                        .toList(); // value dosis [100,150,50]
                widget.dataPerhitunganPerKomoditi[0]["input"]["Takaran Pupuk"] =
                    dataTakaran;
                c.selectobjPemupukan.value = itemSelecteds;
                // widget.dataPerhitunganPerKomoditi[0]["input"]["id Komoditi"] =
                //     [itemSelecteds];
                // print("stateItem = " + "${stateItem} ==== ");
              });
            },
          ),
          ProsesWidgets(
            dataproses: listTypeLahan,
            tema: widget.tema,
            namaobj: "Type Lahan",
            stateID: stateTypeLahan,
            onChangeState: (id, input, proses, output) {
              setState(() {
                widget.dataPerhitunganPerKomoditi[0]["input"]["Luas Lahan"] =
                    output;
                widget.dataPerhitunganPerKomoditi[0]["input"]
                    ["Luas Lahan input"] = input;

                stateTypeLahan = id;

                print(
                    "PLLahan ${widget.dataPerhitunganPerKomoditi[0]["perhitungan"]["PLLahan"][1]}");
              });
            },
          ),
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: widthfit(defaultPadding / 2)),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  elevation: 0,
                  primary: tema),
              // height: heightfit(30),
              child: Container(
                padding: EdgeInsets.symmetric(
                    horizontal: widthfit(defaultPadding / 2)),
                child: Text('Kalkulasi ',
                    style: TextStyle(
                        color: Colors.white, fontSize: heightfit(20))),
              ),
              onPressed: () {
                if (widget.dataPerhitunganPerKomoditi[0]["input"]["Luas Lahan"]
                    .contains(0.0)) {
                  showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                            title: const Text('Angka Tidak Valid'),
                            content: const Text(
                                'Coba untuk Cek lagi ada Nilai yang terlewatkan'),
                            actions: <Widget>[
                              // TextButton(
                              //   onPressed: () =>
                              //       Navigator.pop(context, 'Cancel'),
                              //   child: const Text('Cancel'),
                              // ),
                              TextButton(
                                onPressed: () => Navigator.pop(context, 'OK'),
                                child: const Text('OK'),
                              ),
                            ],
                          ));
                } else {
                  setState(() {
                    gethasil(itemSelecteds);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return PupukMajemukDisplay(
                          tema: widget.tema,
                          judul: widget.judul,
                          dataRumusPerKomoditi: widget.dataRumusPerKomoditi,
                          dataPerhitunganPerKomoditi:
                              widget.dataPerhitunganPerKomoditi);
                    }));
                    // Navigator.pushNamed(context, '/PPM_display');
                  });
                }
              },
              // color: kColor,
            ),
          ),
          SizedBox(
            height: defaultPadding,
          ),
        ],
      ),
    );
  }
}
