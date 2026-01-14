import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:rawatt/components/card_field.dart';
import 'package:rawatt/components/inputan.dart';

import 'package:rawatt/size_config.dart';
import 'package:flutter/material.dart';
import 'package:function_tree/function_tree.dart';

import '../../../model/dosis/fieldku_campur.dart';
import '../../../rumus.dart';
import '../screens/dolomit/Dolomit_display.dart';
import 'inisialisasi_var.dart';

Map dataTetapan = {
  "2.0": "6.83",
  "1.0": "3.66",
  "1.9": "6.51",
  "0.9": "3.35",
  "1.8": "6.19",
  "0.8": "3.03",
  "1.7": "5.88",
  "0.7": "2.72",
  "1.6": "5.56",
  "0.6": "2.40",
  "1.5": "5.23",
  "0.5": "2.08",
  "1.4": "4.93",
  "0.4": "1.77",
  "1.3": "4.61",
  "0.3": "1.45",
  "1.2": "4.30",
  "0.2": "1.13",
  "1.1": "3.99",
  "0.1": "0.82"
};

List<Map<String, dynamic>> datapHIndikator = [
  {
    "id": 0,
    "nama": "pH",
    "img": "assets/images/pot/balok.png",
    "variabels": {
      "pHDiket": ["pH Diketahui", 6.0],
      "pHDitanya": ["pH Ditanya", 6.1]
    },
    "rumusStr": "pHDitanya - pHDiket",
  }
];

double? tingkatan;

class PHIndikator {
  int id;
  String nama;
  String img;
  Map<String, dynamic> variabels;

  PHIndikator({
    required this.id,
    required this.nama,
    required this.img,
    required this.variabels,
  });
}

List<PHIndikator> listPHIndikator = [
  for (var i = 0; i < datapHIndikator.length; i++)
    PHIndikator(
      id: i,
      nama: datapHIndikator[i]["nama"],
      img: datapHIndikator[i]["img"],
      variabels: datapHIndikator[i]["variabels"],
    )
];

double hasilKpH = 0;

class WidgetPHIndikator extends StatefulWidget {
  final int indexKe;
  final Color tema;
  final int indexPageCalkulator;
  final Function(double) onChangeState;
  final Function(double) onChangeStateEnd;
  const WidgetPHIndikator(
      {super.key,
      required this.tema,
      required this.indexPageCalkulator,
      required this.onChangeState,
      required this.onChangeStateEnd,
      required this.indexKe});

  @override
  _WidgetPHIndikatorState createState() => _WidgetPHIndikatorState();
}

class _WidgetPHIndikatorState extends State<WidgetPHIndikator> {
  // int selectedTypeLahan = statedatapHIndikator;

  String rumusa = "pHDitanya - pHDiket";

  void onPress(double pHDiket, double pHDitanya) {
    listPHIndikator[0].variabels["pHDiket"][1] = pHDiket;
    listPHIndikator[0].variabels["pHDitanya"][1] = pHDitanya;
    c.hasilconvert.value = listPHIndikator;
    tingkatan = convertRumus(listPHIndikator[0].variabels, rumusa)
        .interpret()
        .toDouble();
    hasilKpH =
        double.tryParse(dataTetapan["${tingkatan?.toStringAsFixed(1)}"])!;
    datainputan.value = [pHDiket, pHDitanya, hasilKpH];
    // filterdataobject()[c.ObjectIndexSelectedEdit.value].propertyLainnya["pHData"] = {"pHDiket":pHDiket,"pHDitanya":pHDitanya,"hasil":hasil};

    // listPHIndikator[statedatapHIndikator].hasil["tingkatan"][1] = hasil;
    widget.onChangeState(hasilKpH);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (filterdataobject()[c.ObjectIndexSelectedEdit.value]
        .propertyLainnya["pHData"]
        .isNotEmpty) {
      print(
          "dasda ${filterdataobject()[c.ObjectIndexSelectedEdit.value].propertyLainnya["pHData"]}");
      onPress(
          filterdataobject()[c.ObjectIndexSelectedEdit.value]
              .propertyLainnya["pHData"]["pHDiket"],
          filterdataobject()[c.ObjectIndexSelectedEdit.value]
              .propertyLainnya["pHData"]["pHDitanya"]);
    } else {
      onPress(6.0, 6.1);
    }
  }

  @override
  Widget build(BuildContext context) {
    return CardFields(
      tema: widget.tema,
      judul: "pH Indikator : ",
      columns: Column(
        children: [
          SliderpH(
            tema: widget.tema,
            omChangeState: (pHDiketsIn, pHDitanyasIn) {
              Future.microtask(() {
                setState(() {
                  onPress(pHDiketsIn, pHDitanyasIn);
                });
              });
            },
            omChangeStateEnd: (pHDiketsIn, pHDitanyasIn) {
              Future.microtask(() {
                setState(() {
                  onPress(pHDiketsIn, pHDitanyasIn);
                  widget.onChangeStateEnd(hasilKpH);
                });
              });
            },
          ),
          Text(
            "Ketentuan ${hasilKpH.toString()}",
            style: TextStyle(color: widget.tema, fontSize: heightfit(20)),
          )
        ],
      ),
      onChangeState: () {},
      indexmenu: c.indexMenuRawatan.value,
      indexsubmenu: c.indexsubMenuRawatan.value,
      warna: Colors.white,
    );
  }
}
