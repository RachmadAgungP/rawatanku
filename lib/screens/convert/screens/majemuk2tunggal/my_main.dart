import 'package:rawatt/constants.dart';
import 'package:rawatt/rumus.dart';
import 'package:rawatt/screens/convert/component/Widget_Gride_Fertilizer.dart';
import 'package:rawatt/screens/convert/component/Widget_Jarak_Tanaman.dart';
import 'package:rawatt/size_config.dart';
import 'package:flutter/material.dart';
import 'package:function_tree/function_tree.dart';

import 'majemuk2tunggal_display.dart';

List<Map<String, dynamic>> dataMajemuk2tunggal = [
  {
    "id": 0,
    "nama": "Kalkulasi Majemuk ke Tunggal",
    "img": "",
    "input": {
      "Senyawa Aktif":
          List.from(listGrideFer[0].hasilAkhir.values.map((e) => e[1])),
    },
    "rumus": {
      "Rumus Kalkulasi Senyawa Aktif ke Pupuk": [
        "Senyawa Aktif * (100/46)",
        "Senyawa Aktif * (100/36)",
        "Senyawa Aktif * (100/60)"
      ]
    },
    "perhitungan": {
      "keperluan": [
        "keperluan",
        ["1", "2"]
      ]
    },
    "hasilAkhir": {
      "0": [
        "hasil proses 1",
        [0.0, 0.0, 0.0]
      ]
    },
  }
];

class Majemuk2tunggal {
  int id;
  String nama;
  String img;
  Map<String, dynamic> input;
  Map<String, dynamic> rumus;
  Map<String, dynamic> output;
  Map<String, dynamic> perhitungan;
  Map<String, dynamic> hasilAkhir;

  Majemuk2tunggal(
      {required this.id,
      required this.nama,
      required this.img,
      required this.input,
      required this.rumus,
      required this.output,
      required this.perhitungan,
      required this.hasilAkhir});
}

List<dynamic> listMajemuk2tunggal = [
  Majemuk2tunggal(
      id: 0,
      nama: dataMajemuk2tunggal[0]["nama"],
      img: dataMajemuk2tunggal[0]["img"],
      input: dataMajemuk2tunggal[0]["input"],
      rumus: dataMajemuk2tunggal[0]["rumus"],
      output: dataMajemuk2tunggal[0]["output"],
      perhitungan: dataMajemuk2tunggal[0]["perhitungan"],
      hasilAkhir: dataMajemuk2tunggal[0]["hasilAkhir"])
];

class ConvertMajemuk2Tunggal extends StatefulWidget {
  final Color tema;

  const ConvertMajemuk2Tunggal({super.key, required this.tema});
  @override
  _ConvertMajemuk2TunggalState createState() => _ConvertMajemuk2TunggalState();
}

class _ConvertMajemuk2TunggalState extends State<ConvertMajemuk2Tunggal> {
  // Map<String, dynamic> rumusku = Map.from(listMajemuk2tunggal.rumus);

  void gethasil() {
    setState(() {
      // List asi2 = convertListRumus(listMajemuk2tunggal[0].input,
      //     List.from(rumusku["Rumus Kalkulasi Senyawa Aktif ke Pupuk"]));
      //
      // listMajemuk2tunggal[0].hasilAkhir["0"][1] =
      //     asi2.map((e) => e.toString().interpret().toDouble()).toList();
      // datainputanGF.value = [
      //   listGrideFer[0].variabels["berat"][1].toInt(),
      //   List.from(listGrideFer[0].variabels.values).map((e) => e[1]).toList(),
      //   listGrideFer[0].hasilAkhir["0"][1].map((e) => e).toList(),
      //   listMajemuk2tunggal[0].hasilAkhir["0"][1]
      // ];

      // List asi2 = convertListRumus(widget.datahasils[0].input,
      //     List.from(rumusku["Rumus Kalkulasi Senyawa Aktif ke Pupuk"]));
      //
      // widget.datahasils[0].hasilAkhir["0"][1] =
      //     asi2.map((e) => e.toString().interpret().toDouble()).toList();
      //
      // datainputanGF.value = [
      //   widget.dataproses[0].variabels["berat"][1].toInt(),
      //   List.from(widget.dataproses[0].variabels.values).map((e) => e[1]).toList(),
      //   widget.dataproses[0].hasilAkhir["0"][1].map((e) => e).toList(),
      //   widget.datahasils[0].hasilAkhir["0"][1]
      // ];
      //
      print("kEBUTUHAN PUPUK ${listMajemuk2tunggal[0].hasilAkhir["0"][1]}");
    });
  }

  @override
  Widget build(BuildContext context) {
    Color? tema = Colors.red[600];
    return SingleChildScrollView(
      child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ProsesWidgetsold(
                datahasils: listMajemuk2tunggal,
                dataproses: listGrideFer,
                tema: widget.tema,
                namaobj: "Gride Fertilizer",
                stateID: 0,
                onChangeState: (id, input, proses, output) {
                  setState(() {
                    listMajemuk2tunggal[0].input["Senyawa Aktif"] = output;

                    // print("ol${output}");
                  });
                },
              ),
              // WidgetFormGFertilizer(
              //   indexKe: 0,
              //   indexPageCalkulator: 0,
              //   tema: tema,
              //   onChangeState: (gFertilizer) {
              //     print(gFertilizer);
              //   },
              // ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: widthfit(defaultPadding / 2)),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.all(1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      elevation: 0,
                      backgroundColor: tema),
                  // height: heightfit(30),
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: widthfit(defaultPadding / 2)),
                    child: Text('Kalkulasi ',
                        style: TextStyle(
                            color: Colors.white, fontSize: heightfit(20))),
                  ),
                  onPressed: () {
                    if (listMajemuk2tunggal[0]
                        .input["Senyawa Aktif"]
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
                                    onPressed: () =>
                                        Navigator.pop(context, 'OK'),
                                    child: const Text('OK'),
                                  ),
                                ],
                              ));
                    } else {
                      gethasil();
                      (SizeConfig.screenWidth! > 600)
                          ? Container()
                          : Navigator.pushNamed(
                              context, 'majemuk2tunggal_display');
                    }
                  },
                  // color: kColor,
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
