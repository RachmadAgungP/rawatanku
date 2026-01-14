import 'package:rawatt/constants.dart';
import 'package:rawatt/model/datafix.dart';
import 'package:rawatt/model/kalkulator/mdl_KatRumus.dart';
import 'package:rawatt/rumus.dart';
import 'package:rawatt/screens/convert/component/Widget_Jarak_Tanaman.dart';
import 'package:rawatt/screens/convert/component/Widget_Jenis_Lahan.dart';
import 'package:rawatt/screens/convert/component/Widget_Jenis_Tanah.dart';
import 'package:rawatt/screens/convert/component/Widget_pH_indikator.dart';
import 'package:rawatt/size_config.dart';
import 'package:flutter/material.dart';
import 'package:function_tree/function_tree.dart';

import '../../component/inisialisasi_var.dart';
import 'Dolomit_display.dart';

// List<Map<String, dynamic>> dataukurPH = [
//   {
//     "id": 0,
//     "nama": "Kalkulasi PH\nBerdasarkan Luas Lahan",
//     "img": "",
//     "input": {
//       "Luas Lahan": List.from(
//           listTypeLahan[stateTypeLahan].hasilAkhir.values.map((e) => e[1]))[0],
//       "Luas Lahan input": List.from(
//           listTypeLahan[stateTypeLahan].variabels.values.map((e) => e[1])),
//       "TingkatanpH": [listPHIndikator[0].hasil["tingkatan"][1]],
//       "PLLahan": [0.0],
//     },
//     "rumus": {
//       "PLLahan": ['( Luas Lahan / 10000)'],
//       "Rumus Kalkulasi pH Berdasarkan Luas Lahan": ["TingkatanpH * PLLahan"]
//     },
//     "perhitungan": {
//       "PLLahan": ["Luas Lahan", "0.0"],
//       "keperluan": [
//         "keperluan",
//         ["1", "2"]
//       ]
//     },
//     "hasilAkhir": {
//       "0": [
//         "hasil proses 1",
//         [0.0]
//       ]
//     },
//   }
// ];

class PHBerdasarkanLuasLahan {
  int id;
  String nama;
  String img;
  Map<String, dynamic> input;
  Map<String, dynamic> rumus;
  Map<String, dynamic> output;
  Map<String, dynamic> perhitungan;
  Map<String, dynamic> hasilAkhir;

  PHBerdasarkanLuasLahan(
      {required this.id,
      required this.nama,
      required this.img,
      required this.input,
      required this.rumus,
      required this.output,
      required this.perhitungan,
      required this.hasilAkhir});
}

// PHBerdasarkanLuasLahan listpHBerdasarkanLuasLahan = PHBerdasarkanLuasLahan(
//     id: 0,
//     nama: dataukurPH[0]["nama"],
//     img: dataukurPH[0]["img"],
//     input: dataukurPH[0]["input"],
//     rumus: dataukurPH[0]["rumus"],
//     output: dataukurPH[0]["output"],
//     perhitungan: dataukurPH[0]["perhitungan"],
//     hasilAkhir: dataukurPH[0]["hasilAkhir"]);

class DolomitBerdasarkanLuas extends StatefulWidget {
  final int indexmenu;
  final int indexsubmenu;
  final bool? tampiltombol;
  final Color tema;
  final Function() onchange;
  bool? diketahui = true;

  DolomitBerdasarkanLuas(
      {super.key,
      required this.tema,
      required this.indexmenu,
      required this.indexsubmenu,
      this.tampiltombol,
      this.diketahui,
      required this.onchange});

  @override
  _DolomitBerdasarkanLuasState createState() => _DolomitBerdasarkanLuasState();
}

void onPresospH(double hasil, String satuan) {
  cariVarUpdate("pH", false, hasil, "", 0, satuan);
  // cariVarUpdate("LMt", true, 1.0, "t");
  (c.selectedItemCalcT.value == 1)
      ? cariVarUpdate("KpH", true, 1.0, "(LMt/10000)*pH", 0, satuan)
      : cariVarUpdate(
          "KpH",
          false,
          (((cariValue("bTPt") * cariValue("bTHa"))) * cariValue("pH")),
          "",
          0,
          satuan);

  print("cara1 ${cariValue("KpH")}");
  (c.selectedItemCalcT.value != 1)
      ? cariVarUpdate("KpH", true, 1.0, "(LMt/10000)*pH", 0, satuan)
      : cariVarUpdate(
          "KpH",
          false,
          ((((cariValue("bTPt")) / cariValue("bTHa"))) * cariValue("pH")),
          "",
          0,
          satuan);
  print("cara ${cariValue("KpH")}");
  // cariVarUpdate("KpH", true, 1.0, "(bTPt/bTHa)*pH", 0);
  // print("cara2 ${cariValue("KpH")}");
}

class _DolomitBerdasarkanLuasState extends State<DolomitBerdasarkanLuas> {
  int selectedTypeLahans = 0;
  double hasils = 0;

  @override
  Widget build(BuildContext context) {
    // listpHBerdasarkanLuasLahan.input["Luas Lahan"] = List.from(
    //     listTypeLahan[stateTypeLahan].hasilAkhir.values.map((e) => e[1]))[0];
    // Map<String, dynamic> rumusku = Map.from(listpHBerdasarkanLuasLahan.rumus);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        WidgetPHIndikator(
          tema: widget.tema,
          indexKe: 0,
          indexPageCalkulator: 0,
          onChangeState: (hasil) {
            Future.microtask(() {
              setState(() {
                hasils = hasil;
                onPresospH(hasils, "m");
                // widget.onchange();
              });
            });
          },
          onChangeStateEnd: (double hasil) {
            Future.microtask(() {
              setState(() {
                hasils = hasil;
                onPresospH(hasils, "m");
                widget.onchange();
              });
            });
          },
        ),
        // ProsesWidgets(
        //   juduls: "Jenis Media Tanam",
        //   tema: Colors.green,
        //   namaobj: "Type Lahan",
        //   idTipeMediaTanam: 0,
        //   rumus: "",
        //   dropdowns: true,
        //   onChangeState: (indexs, indpot, satuan,dataVar,rumuslahan) {
        //     setState(() {
        //       onPresospH(hasils);
        //
        //     });
        //   },indexmenu: widget.indexmenu, indexsubmenu: widget.indexsubmenu,
        // ),
        HasilConvertDol(
          tema: Colors.green,
          diketahui: widget.diketahui,
        ),
        // SingleChildScrollView(
        //     child: Container(
        //       height: 700,
        //
        //       child: DolomitDisplay(),
        //     )),
        Visibility(
            visible: widget.tampiltombol!,
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: widthfit(defaultPadding / 2)),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    elevation: 0,
                    backgroundColor: widget.tema),
                // height: heightfit(30),
                child: Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: widthfit(defaultPadding / 2)),
                  child: Text('Kalkulasi ',
                      style: TextStyle(
                          color: Colors.white, fontSize: heightfit(20))),
                ),
                onPressed: () {
                  if (dataKategoriInisialisasi
                          .where((element) => element.vari == "LMt")
                          .first
                          .nilai ==
                      0.0) {
                    showDialog<String>(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                              title: const Text('Angka Tidak Valid'),
                              content: const Text(
                                  'Coba untuk Cek lagi ada Nilai yang terlewatkan'),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () => Navigator.pop(context, 'OK'),
                                  child: const Text('OK'),
                                ),
                              ],
                            ));
                  } else {
                    setState(() {
                      (SizeConfig.screenWidth! > 600)
                          ? Container()
                          : Navigator.pushNamed(context, 'dolomit_display');
                    });
                  }
                },
                // color: kColor,
              ),
            )),
      ],
    );
  }
}
