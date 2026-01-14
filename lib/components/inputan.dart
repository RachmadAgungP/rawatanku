// import 'package:rawatt/components/card_field.dart';
import 'package:rawatt/constants.dart';
import 'package:rawatt/screens/convert/component/Widget_pH_indikator.dart';
import 'package:rawatt/size_config.dart';
import 'package:flutter/material.dart';

import '../model/dosis/fieldku_campur.dart';
import '../screens/convert/component/Widget_Jarak_Tanaman.dart';
import '../screens/convert/component/inisialisasi_var.dart';
import '../screens/convert/screens/dolomit/Dolomit_display.dart';
import '../screens/home/home_screen.dart';
import 'package:auto_size_text/auto_size_text.dart';

class Fields extends StatefulWidget {
  const Fields(
      {super.key,
      required this.controller,
      required this.satuan,
      required this.title,
      required this.tema,
      required this.enable,
      required this.onStateChange,
      required this.inputType});
  final TextEditingController controller;
  final String satuan;
  final String title;
  final Color tema;
  final bool enable;
  final TextInputType inputType;
  final Function(String) onStateChange;
  @override
  _FieldsState createState() => _FieldsState();
}

class _FieldsState extends State<Fields> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Padding(
      padding: EdgeInsets.only(bottom: defaultPadding / 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: defaultPadding / 2),
            child: AutoSizeText(
              widget.title,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontStyle: FontStyle.italic,
                  fontSize: 20),
              minFontSize: 10,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          SizedBox(
            height: heightfit(defaultPadding / 2),
          ),
          Material(
            textStyle: TextStyle(fontSize: heightfit(20)),
            borderRadius: BorderRadius.all(Radius.circular(7)),
            color: Colors.white,
            child: Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: heightfit(defaultPadding)),
              child: TextFormField(
                style: TextStyle(fontSize: heightfit(20)),
                cursorColor: Colors.black,
                // inputFormatters: [_amountValidator],
                textInputAction: TextInputAction.done,
                onFieldSubmitted: (value) {
                  widget.onStateChange(value);
                  print(value);
                },
                // obscureText: true,
                controller: widget.controller,
                keyboardType: widget.inputType,

                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: heightfit(defaultPadding / 2),
                    vertical: heightfit(defaultPadding),
                  ),
                  isDense: true,
                  suffixText: "${widget.satuan} ",
                  suffixStyle:
                      TextStyle(fontSize: heightfit(20), color: Colors.black),
                  border: InputBorder.none,
                  hintText: widget.title,
                  hintStyle: TextStyle(fontSize: heightfit(20)),
                  enabled: widget.enable,
                  //onChanged: () {}
                ),
                validator: (String? value) {
                  String asa = "";
                  print(value);
                  if (widget.inputType == TextInputType.phone) {
                    asa = validateMobile(value!);
                    print("asa");
                    return asa;
                  } else if (asa == "") {
                    asa = "Data Kosong";
                    print("kosong");
                    return asa;
                  } else {
                    asa = "Suksess";
                    print("sukses");

                    return asa;
                  }
                },
              ),
            ),
          )
        ],
      ),
    ));
  }
}
//
// Widget fields(
//     TextEditingController controller, String satuan, String title, Color tema) {
//   return Padding(
//     padding: EdgeInsets.symmetric(
//         vertical: heightfit(defaultPadding / 2), horizontal: (defaultPadding)),
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           "$title : ",
//           style: TextStyle(
//             color: tema.withOpacity(0.7),
//             fontSize: heightfit(sT16),
//           ),
//         ),
//         SizedBox(
//           height: heightfit(defaultPadding / 2),
//         ),
//         Material(
//           borderRadius: BorderRadius.all(Radius.circular(10)),
//           color: tema.withOpacity(.2),
//           child: TextField(
//             // inputFormatters: [_amountValidator],
//             textInputAction: TextInputAction.done,
//             onSubmitted: (value) {
//               // setState
//               print(value);
//             },
//             controller: controller,
//             keyboardType: TextInputType.numberWithOptions(
//               decimal: true,
//             ),
//             decoration: InputDecoration(
//                 contentPadding:
//                     EdgeInsets.symmetric(horizontal: heightfit(10), vertical: heightfit(10)),
//                 suffixText: "$satuan ",
//                 border: InputBorder.none,
//                 hintText: title),
//             //onChanged: () {}
//           ),
//         ),
//       ],
//     ),
//   );
// }

class ActivityDropDown extends StatefulWidget {
  final Function(String) onChangeActivity;
  final Color tema;
  final String types;
  final List<Map<String, Object>> data;
  final String typ;
  final String judul;

  const ActivityDropDown(this.onChangeActivity, this.tema, this.data,
      this.types, this.typ, this.judul,
      {super.key});

  @override
  _ActivityDropDownState createState() => _ActivityDropDownState();
}

class _ActivityDropDownState extends State<ActivityDropDown> {
  late List<String> sd;
  // List<String> typeLahan;
  late String dropdownValue;
  @override
  Widget build(BuildContext context) {
    if (widget.types == "Komoditi") {
      sd = widget.data.map((m) => m["Komoditi"].toString()).toList();
      dropdownValue = widget.typ;
    } else if (widget.types == "gradefertil") {
      sd = ['15-15-15', '16-16-16'];
      dropdownValue = widget.typ;
    } else if (widget.types == "SatuanBahan") {
      sd = ['Berat Pupuk', 'Berat Senyawa Aktif'];
      dropdownValue = widget.typ;
    } else {
      dropdownValue = widget.typ;
      sd = ["Lahan Rata", "Lahan Bedengan"];
    }

    // print(sd);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: defaultPadding),
          child: Text(
            widget.judul,
            style: TextStyle(
              color: widget.tema.withOpacity(.7),
              fontSize: heightfit(sT16),
            ),
          ),
        ),
        Container(
          // height: 60,
          margin: EdgeInsets.symmetric(
              horizontal: heightfit(defaultPadding),
              vertical: heightfit(defaultPadding / 2)),
          padding: EdgeInsets.symmetric(horizontal: heightfit(defaultPadding)),
          decoration: BoxDecoration(
              color: Colors.white,
              // gradient: LinearGradient(
              //     colors: [kPrimaryLightColor, kPrimaryColor],
              //     begin: FractionalOffset(1.5, 0.01),
              //     end: FractionalOffset(0.8, 0.7)),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10)),
              border: Border.all(color: widget.tema.withOpacity(.8), width: .2)
              // boxShadow: [
              //   BoxShadow(
              //       blurRadius: 10,
              //       offset: Offset(0, 9),
              //       color: widget.tema.withOpacity(.3))
              // ]
              ),
          child: DropdownButton<String>(
            isExpanded: true,
            value: dropdownValue,
            dropdownColor: Colors.white,
            icon: Icon(
              Icons.keyboard_arrow_down_rounded,
              size: heightfit(2),
              color: widget.tema.withOpacity(.8),
            ),
            // iconSize: 24,
            // elevation: 16,
            style: TextStyle(color: Colors.black54, fontSize: heightfit(sT16)),
            underline: Container(
              height: 1,
              color: widget.tema.withOpacity(.8),
            ),
            onChanged: (String? newValue) {
              setState(() {
                dropdownValue = newValue!;
              });
              widget.onChangeActivity(newValue!);
            },
            items: sd.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Padding(
                  padding: EdgeInsets.all(heightfit(defaultPadding / 2)),
                  child:
                      Text(value, style: TextStyle(fontSize: heightfit(sT16))),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}

class DropDownNEW extends StatefulWidget {
  Function(String) onChangeActivity;
  Color tema;
  List<dynamic> data;
  String types;

  String typ;
  String judul;
  final List<dynamic> Penjelas;
  // final List<Map<String, Object>> dataKomoditi;
  DropDownNEW(this.onChangeActivity, this.tema, this.data, this.types, this.typ,
      this.judul, this.Penjelas,
      {super.key});

  @override
  _DropDownNEWState createState() => _DropDownNEWState();
}

class _DropDownNEWState extends State<DropDownNEW> {
  // List<String> sd;
  // List<String> typeLahan;

  String? dropdownValue;
  @override
  Widget build(BuildContext context) {
    dropdownValue = widget.typ;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AutoSizeText(
          widget.judul,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontStyle: FontStyle.normal,
              fontSize: heightfit(18)),
          minFontSize: 10,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        SizedBox(
          height: heightfit(defaultPadding / 2),
        ),
        FittedBox(
          child: Container(
            height: heightfit(70),
            width: widthfit(290),
            // margin: EdgeInsets.symmetric(
            //     horizontal: heightfit(defaultPadding), vertical: heightfit(defaultPadding / 2)),
            padding:
                EdgeInsets.symmetric(horizontal: heightfit(defaultPadding)),
            decoration: BoxDecoration(
              color: widget.tema.withOpacity(.2),
              // gradient: LinearGradient(
              //     colors: [kPrimaryLightColor, kPrimaryColor],
              //     begin: FractionalOffset(1.5, 0.01),
              //     end: FractionalOffset(0.8, 0.7)),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10)),
              // border: Border.all(color: widget.tema.withOpacity(.4))
              // boxShadow: [
              //   BoxShadow(
              //       blurRadius: 10,
              //       offset: Offset(0, 9),
              //       color: widget.tema.withOpacity(.3))
              // ]
            ),
            child: Center(
              child: DropdownButton<String>(
                // isDense: true,
                isExpanded: true,
                value: dropdownValue,
                dropdownColor: Colors.white,
                icon: Icon(
                  Icons.keyboard_arrow_down_rounded,
                  color: widget.tema.withOpacity(.8),
                  size: heightfit(35),
                ),
                // iconSize: 24,
                // elevation: 16,
                style:
                    TextStyle(color: Colors.black54, fontSize: heightfit(16)),
                // underline: Container(
                //   height: 1,
                //   color: widget.tema.withOpacity(.8),
                // ),
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownValue = newValue;
                  });
                  widget.onChangeActivity(newValue!);
                },
                items:
                    widget.data.asMap().entries.map<DropdownMenuItem<String>>(
                  (MapEntry<int, dynamic> entry) {
                    int index = entry.key;
                    dynamic value = entry.value;

                    return DropdownMenuItem<String>(
                      value: value,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Text(
                          "$value ${(widget.Penjelas.isEmpty) ? "" : "- (${widget.Penjelas[index].toString()})"}",
                          style: TextStyle(
                            fontSize: heightfit(20),
                            color: widget.tema.withOpacity(.5),
                          ),
                        ),
                      ),
                    );
                  },
                ).toList(),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class DropDowns extends StatefulWidget {
  Function(String) onChangeActivity;
  Color tema;
  List<dynamic> data;
  String types;

  String typ;
  String judul;
  final List<dynamic> Penjelas;
  // final List<Map<String, Object>> dataKomoditi;
  DropDowns(this.onChangeActivity, this.tema, this.data, this.types, this.typ,
      this.judul, this.Penjelas,
      {super.key});

  @override
  _DropDownsState createState() => _DropDownsState();
}

class _DropDownsState extends State<DropDowns> {
  // List<String> sd;
  // List<String> typeLahan;

  String? dropdownValue;
  @override
  Widget build(BuildContext context) {
    dropdownValue = widget.typ;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AutoSizeText(
          widget.judul,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontStyle: FontStyle.normal,
              fontSize: heightfit(18)),
          minFontSize: 10,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        SizedBox(
          height: heightfit(defaultPadding / 2),
        ),
        FittedBox(
          child: Container(
            height: heightfit(70),
            width: widthfit(290),
            // margin: EdgeInsets.symmetric(
            //     horizontal: heightfit(defaultPadding), vertical: heightfit(defaultPadding / 2)),
            padding:
                EdgeInsets.symmetric(horizontal: heightfit(defaultPadding)),
            decoration: BoxDecoration(
              color: widget.tema.withOpacity(.1),
              // gradient: LinearGradient(
              //     colors: [kPrimaryLightColor, kPrimaryColor],
              //     begin: FractionalOffset(1.5, 0.01),
              //     end: FractionalOffset(0.8, 0.7)),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10)),
              // border: Border.all(color: widget.tema.withOpacity(.4))
              // boxShadow: [
              //   BoxShadow(
              //       blurRadius: 10,
              //       offset: Offset(0, 9),
              //       color: widget.tema.withOpacity(.3))
              // ]
            ),
            child: Center(
              child: DropdownButton<String>(
                // isDense: true,
                isExpanded: true,
                value: dropdownValue,
                dropdownColor: Colors.white,
                icon: Icon(
                  Icons.keyboard_arrow_down_rounded,
                  color: widget.tema.withOpacity(.2),
                  size: heightfit(35),
                ),
                // iconSize: 24,
                // elevation: 16,
                style: TextStyle(color: Colors.black, fontSize: heightfit(16)),
                // underline: Container(
                //   height: 1,
                //   color: widget.tema.withOpacity(.8),
                // ),
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownValue = newValue;
                  });
                  widget.onChangeActivity(newValue!);
                },
                items:
                    widget.data.asMap().entries.map<DropdownMenuItem<String>>(
                  (MapEntry<int, dynamic> entry) {
                    int index = entry.key;
                    dynamic value = entry.value;

                    return DropdownMenuItem<String>(
                      value: value,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Text(
                          "$value ${(widget.Penjelas.isEmpty) ? "" : "- (${widget.Penjelas[index].toString()})"}",
                          style: TextStyle(
                            fontSize: heightfit(20),
                            color: widget.tema,
                          ),
                        ),
                      ),
                    );
                  },
                ).toList(),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class Sliders extends StatefulWidget {
  const Sliders({
    super.key,
    required this.valuesIns,
    required this.tema,
    required this.kembalian,
    required this.title,
    required this.penjelas,
    required this.maxs,
    required this.kembalianEnd,
  });
  final String title;
  final String penjelas;
  final double valuesIns;
  final double maxs;
  final Function(double) kembalian;
  final Function(double) kembalianEnd;
  final Color tema;

  @override
  _SlidersState createState() => _SlidersState();
}

class _SlidersState extends State<Sliders> {
  @override
  Widget build(BuildContext context) {
    double valuesIn = widget.valuesIns;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
              vertical: heightfit(defaultPadding / 2),
              horizontal: heightfit(defaultPadding / 2)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: heightfit(defaultPadding / 2)),
                child: RichText(
                    text: TextSpan(
                  text: widget.title,
                  style: TextStyle(
                      color: widget.tema.withOpacity(.9),
                      fontSize: heightfit(20)),
                )),
              ),
              Container(
                margin: EdgeInsets.only(top: heightfit(defaultPadding)),
                padding: EdgeInsets.symmetric(
                    vertical: heightfit(defaultPadding / 2),
                    horizontal: heightfit(defaultPadding / 2)),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
                  border:
                      Border.all(color: widget.tema.withOpacity(.9), width: .2),
                  // boxShadow: [
                  //   BoxShadow(
                  //       blurRadius: 10,
                  //       offset: Offset(-5, 9),
                  //       color: widget.tema.withOpacity(.3))
                  // ]
                ),
                child: Column(
                  children: [
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        inactiveTrackColor: Color(0xff8d8e98),
                        activeTrackColor: Colors.white,
                        thumbColor: Color(0xffeb1555),
                        overlayColor: Color(0x29eb1555),
                        thumbShape: RoundSliderThumbShape(
                            enabledThumbRadius: heightfit(10)),
                        overlayShape: RoundSliderOverlayShape(
                            overlayRadius: heightfit(20)),
                        trackHeight: 1,
                      ),
                      child: Slider(
                        activeColor: widget.tema,
                        inactiveColor: widget.tema.withOpacity(.3),
                        value: valuesIn,
                        min: 5.5,
                        max: widget.maxs,
                        label: valuesIn.toStringAsFixed(1),
                        divisions: 30,
                        onChangeEnd: (double value) {
                          setState(() {
                            widget.kembalianEnd(valuesIn);

                            valuesIn = value;
                          });
                        },
                        onChanged: (double value) {
                          setState(() {
                            widget.kembalian(valuesIn);

                            valuesIn = value;
                          });
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        right: heightfit(defaultPadding / 2),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            widget.penjelas,
                            style: TextStyle(
                              color: widget.tema.withOpacity(.9),
                              fontSize: heightfit(20),
                            ),
                          ),
                          SizedBox(
                            width: heightfit(defaultPadding / 2),
                          ),
                          Text(
                            valuesIn.toStringAsFixed(1),
                            style: TextStyle(
                                color: widget.tema.withOpacity(.9),
                                fontSize: heightfit(20),
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        // phdiinginkan  //
      ],
    );
  }
}

class SliderpH extends StatefulWidget {
  final Color tema;
  final Function(double, double) omChangeState;
  final Function(double, double) omChangeStateEnd;

  const SliderpH(
      {super.key,
      required this.tema,
      required this.omChangeState,
      required this.omChangeStateEnd});

  @override
  _SliderpHState createState() => _SliderpHState();
}

class _SliderpHState extends State<SliderpH> {
  double pHDiketsIn = listPHIndikator[0].variabels["pHDiket"][1];

  double pHDitanyasIn = listPHIndikator[0].variabels["pHDitanya"][1];

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        Sliders(
          title: "pH Tanah: ",
          penjelas: "Indikator pH",
          valuesIns: pHDiketsIn,
          tema: widget.tema,
          maxs: 7.3,
          kembalian: (pHDiket) {
            setState(() {
              c.hasilconvert[0].variabels["pHDiket"][1] = pHDiket;
              if (pHDitanyasIn < 7.9) {
                if (pHDitanyasIn == 7.9) {
                  pHDiketsIn = 7.8;
                  print("pH pHDiketsIn $pHDiketsIn");
                  print("pH pHDitanyasIn $pHDitanyasIn");
                } else {
                  pHDitanyasIn = pHDiket + 0.1;
                  print("else pH pHDiketsIn $pHDiketsIn");
                  print("else pH pHDitanyasIn $pHDitanyasIn");
                }
              }
              pHDiketsIn = pHDiket;
              widget.omChangeState(pHDiketsIn, pHDitanyasIn);
            });
          },
          key: const Key("l"),
          kembalianEnd: (pHDiket) {
            setState(() {
              widget.omChangeStateEnd(pHDiketsIn, pHDitanyasIn);
            });
          },
        ),
        Sliders(
          key: const Key("lo"),
          title: "pH Tanah Yang Ingin ditingkatkan : ",
          penjelas: "Indikator pH",
          valuesIns: pHDitanyasIn,
          tema: widget.tema,
          maxs: 7.4,
          kembalian: (pHDitanya) {
            setState(() {
              if (pHDitanya < pHDiketsIn) {
                pHDitanyasIn = pHDitanyasIn;
              } else if (pHDitanya.toStringAsFixed(1) ==
                  pHDiketsIn.toStringAsFixed(1)) {
                pHDitanyasIn = pHDitanya + 0.1;
              } else {
                pHDitanyasIn = pHDitanya;
              }
              widget.omChangeState(pHDiketsIn, pHDitanyasIn);
            });
          },
          kembalianEnd: (pHDitanya) {
            setState(() {
              widget.omChangeStateEnd(pHDiketsIn, pHDitanyasIn);
            });
          },
        ),
      ],
    ));
  }
}
