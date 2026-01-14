import 'package:rawatt/components/card_field.dart';
import 'package:rawatt/constants.dart';
import 'package:rawatt/screens/convert/component/Widget_Jenis_Pot.dart';
import 'package:rawatt/screens/convert/component/Widget_Jenis_Tanah.dart';
// import 'package:rawatt/screens/convert/screens/hitung_dosis_pupuk_BeratTanah/PupukBerdasarkanBeratTanah.dart';
import 'package:rawatt/size_config.dart';
import 'package:flutter/material.dart';

class HasilBeratTanah {
  int id;
  int idPot;
  double volumeTanahdiPot;
  double volumeTanah1Ha;
  double massaJeniss;
  String typeTanah;
  String perhitunganVolumeTanahdiPot;
  String perhitunganVolumeTanah1Ha;

  HasilBeratTanah(
      {required this.id,
      required this.idPot,
      required this.volumeTanahdiPot,
      required this.volumeTanah1Ha,
      required this.massaJeniss,
      required this.typeTanah,
      required this.perhitunganVolumeTanahdiPot,
      required this.perhitunganVolumeTanah1Ha});
}

List<Map<String, dynamic>> hasilBeratTanah = [
  {
    "id": 0,
    "idPot": 0,
    "volumeTanahdiPot": 0.0,
    "volumeTanah1Ha": 0.0,
    "massaJeniss": 1.0,
    "typeTanah": "Tanah Mineral",
    "perhitunganVolumeTanahdiPot": "",
    "perhitunganVolumeTanah1Ha": ""
  },
];

List<HasilBeratTanah> listhasilBeratTanah = [
  for (var i = 0; i < hasilBeratTanah.length; i++)
    HasilBeratTanah(
        id: i,
        idPot: hasilBeratTanah[i]["idPot"],
        volumeTanahdiPot: hasilBeratTanah[i]["volumeTanahdiPot"],
        volumeTanah1Ha: hasilBeratTanah[i]["volumeTanah1Ha"],
        massaJeniss: hasilBeratTanah[i]["massaJeniss"],
        typeTanah: hasilBeratTanah[i]["typeTanah"],
        perhitunganVolumeTanahdiPot: hasilBeratTanah[i]
            ["perhitunganVolumeTanahdiPot"],
        perhitunganVolumeTanah1Ha: hasilBeratTanah[i]
            ["perhitunganVolumeTanah1Ha"])
];

class WidgetMassaTanahPot extends StatefulWidget {
  final Color tema;
  final int indexsubmenu;
  final int indexmenu;

  final Function(double, double, double, double, int) onChangeState;
  const WidgetMassaTanahPot(
      {super.key,
      required this.tema,
      required this.onChangeState,
      required this.indexsubmenu,
      required this.indexmenu});

  @override
  _WidgetMassaTanahPotState createState() => _WidgetMassaTanahPotState();
}

class _WidgetMassaTanahPotState extends State<WidgetMassaTanahPot> {
  // String typeTanah = "Tanah Mineral";
  int idPot = listhasilBeratTanah[0].idPot;

  @override
  Widget build(BuildContext context) {
    print("idpot ${listhasilBeratTanah[0].idPot}");
    String typeTanahs = listhasilBeratTanah[0].typeTanah;
    double volumePots = listpot[idPot].rumusVolume;
    double kedalamanTanah = listpot[idPot].variabels["T_0"][1];

    // int idlisthasilBeratTanah = listhasilBeratTanah[0].id;
    double volumeTanahdiPot = listhasilBeratTanah[0].volumeTanahdiPot;
    double volumeTanah1Ha = listhasilBeratTanah[0].volumeTanah1Ha;
    double massaJeniss = listhasilBeratTanah[0].massaJeniss;
    print("volumeTanahdiPot 1 $volumeTanahdiPot");
    print("volumeTanah1Ha1 1 $volumeTanah1Ha");
    void onPress() {
      listhasilBeratTanah[0].typeTanah = typeTanahs;
      listhasilBeratTanah[0].idPot = idPot;
      volumeTanahdiPot = (massaJeniss * 1000) * (volumePots);
      listhasilBeratTanah[0].volumeTanahdiPot = volumeTanahdiPot;
      listhasilBeratTanah[0].perhitunganVolumeTanahdiPot =
          "($massaJeniss * 1000) * ($volumePots)";
      volumeTanah1Ha = ((kedalamanTanah * 10000) * (massaJeniss * 1000));
      listhasilBeratTanah[0].volumeTanah1Ha = volumeTanah1Ha;
      listhasilBeratTanah[0].perhitunganVolumeTanah1Ha =
          "(($kedalamanTanah * 10000) * ($massaJeniss * 1000))";
      listhasilBeratTanah[0].massaJeniss = massaJeniss;
      widget.onChangeState(
          volumeTanahdiPot, volumeTanah1Ha, volumePots, massaJeniss, idPot);
    }

    return Column(
      children: [
        WidgetJenisPot(
          tema: widget.tema,
          onChangeState: (volumePot, kedalamanPot, selectedItem) {
            setState(() {
              idPot = selectedItem;
              kedalamanTanah = kedalamanPot;
              volumePots = volumePot;

              print("volumeTanahdiPot 2 $volumeTanahdiPot");
              onPress();
            });
          },
          indexmenu: widget.indexmenu,
          indexsubmenu: widget.indexsubmenu,
        ),
        // WidgetJenisTanah(
        //     tema: widget.tema,
        //     kedalamanTanah: kedalamanTanah,
        //     onChangeState: (volTanah1H, massaJenis, typeTanah) {
        //       setState(() {
        //         volumeTanah1Ha = volTanah1H;
        //         typeTanahs = typeTanah;
        //         massaJeniss = massaJenis;

        //         onPress();
        //       });
        //     }),
        CardFields(
          warna: Colors.white,
          tema: widget.tema,
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
                        tema: widget.tema,
                        img: listpot[idPot].img,
                        index: 0,
                        onStateChange: (int indexs) {
                          setState(() {});
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
                        color: widget.tema,
                        fontWeight: FontWeight.bold,
                        fontSize: heightfit(20),
                      ),
                    ),
                    Text(
                      "${volumePots.toStringAsFixed(4)} m³",
                      style: TextStyle(
                        color: widget.tema.withOpacity(.7),
                        fontSize: heightfit(20),
                      ),
                    ),
                    Text(
                      "Massa Jenis $typeTanahs : ",
                      style: TextStyle(
                        color: widget.tema,
                        fontWeight: FontWeight.bold,
                        fontSize: heightfit(20),
                      ),
                    ),
                    Text(
                      "${(massaJeniss * 1000).toStringAsFixed(1)} Kg/m³",
                      style: TextStyle(
                        color: widget.tema.withOpacity(.7),
                        fontSize: heightfit(20),
                      ),
                    ),
                    Text(
                      "Massa Pot Berisi $typeTanahs : ",
                      style: TextStyle(
                        color: widget.tema,
                        fontWeight: FontWeight.bold,
                        fontSize: heightfit(20),
                      ),
                    ),
                    Text(
                      "ρ = m / v \n${massaJeniss * 1000} kg/m³ = m / ${(volumePots).toStringAsFixed(4)} m³\nm = ${massaJeniss * 1000} kg/m³ x ${(volumePots).toStringAsFixed(4)} m³ = ${((massaJeniss * 1000) * (volumePots)).toStringAsFixed(4)} kg",
                      style: TextStyle(
                        color: widget.tema.withOpacity(.7),
                        fontSize: heightfit(20),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          onChangeState: () {},
          indexmenu: widget.indexmenu,
          indexsubmenu: widget.indexsubmenu,
        ),
      ],
    );
  }
}
