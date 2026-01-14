import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:rawatt/components/BG.dart';
import 'package:rawatt/components/card_diket.dart';
import 'package:rawatt/components/card_penjelas.dart';
import 'package:rawatt/components/cards_pH.dart';
import 'package:rawatt/constants.dart';
import 'package:rawatt/screens/convert/component/Widget_Jenis_Lahan.dart';
import 'package:rawatt/screens/convert/component/Widget_Jenis_Tanah.dart';
import 'package:rawatt/screens/convert/component/Widget_pH_indikator.dart';

import 'package:flutter/material.dart';
import 'package:rawatt/size_config.dart';

import '../../../../model/product/mdl_Produk.dart';
import '../../component/Widget_Jenis_Pot.dart';
import '../../component/inisialisasi_var.dart';
import 'myMainDolomit.dart';

class DolomitDisplay extends StatelessWidget {
  const DolomitDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    Color tema = Colors.green;
    // print(listTypeLahan[stateTypeLahan].variabels["TB_0"][1]);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        toolbarHeight: 40,
        backgroundColor: Colors.green,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Stack(
            children: [
              BackgroundShop(
                bolimages: false,
                flex1: 240,
                flex2: 260,
                warnaBG2: Colors.white,
                topRights: 20,
                topLefts: 20,
                bottomRights: 0,
                bottomLefts: 0,
                warnaBG1: Colors.black12,
                images: '',
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(height: 80),
                  Container(
                    padding: EdgeInsets.only(
                        top: defaultPadding,
                        bottom: defaultPadding / 2,
                        left: defaultPadding,
                        right: defaultPadding),
                    alignment: Alignment.topLeft,
                    child: RichText(
                        text: TextSpan(children: [
                      TextSpan(
                          text: "Hasil Convert \n",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: sT22,
                          )),
                      TextSpan(
                          text: "Pupuk Majemuk Ke Pupuk Tunggal",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: sT20,
                          ))
                    ])),
                  ),
                  HasilConvertDol(tema: tema),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class HasilConvertDol extends StatefulWidget {
  HasilConvertDol({
    super.key,
    required this.tema,
    this.diketahui,
  });

  final Color tema;
  bool? diketahui = true;
  @override
  State<HasilConvertDol> createState() => _HasilConvertDolState();
}

final ValueNotifier<List<double>> datainputan = ValueNotifier<List<double>>([
  listPHIndikator[0].variabels["pHDiket"][1].toDouble(),
  listPHIndikator[0].variabels["pHDitanya"][1].toDouble(),
  0.0
]);

class _HasilConvertDolState extends State<HasilConvertDol> {
  @override
  Widget build(BuildContext context) {
    // setState(() {
    //   print(" pHDiket 21 ${listPHIndikator[0].variabels["pHDiket"][1]}");
    // });

    return Column(
      children: [
        Visibility(
          visible: widget.diketahui!,
          child: ValueListenableBuilder<List>(
            builder: (BuildContext? context, List? value, Widget? child) {
              return Column(
                children: <Widget>[
                  // Text('$value',style: TextStyle(color: Colors.black),),
                  SizedBox(
                    height: heightfit(defaultPadding),
                  ),
                  CardDiket(
                    tema: widget.tema,
                    tags: "assets/images/product/Kapur.png",
                    image: "assets/images/product/Kapur.png",
                    judul: "Kapur Pertanian",
                    varDiket: Column(
                      children: [
                        CardpHs(
                          title: "pH Awal\n",
                          hasilAkhir: "${value![0].toStringAsFixed(1)}",
                          cardornot: true,
                          sizes: heightfit(sT16),
                          texts: "pH ${value[0].toStringAsFixed(1)}",
                          multitext: [],
                          tema: widget.tema,
                          // cardornot: false,
                          cardCostume: CardpH(
                              hasilAkhir: "${value[0].toStringAsFixed(1)}"),
                          id: 0,
                          widgetCostum: Container(),
                        ),
                        CardpHs(
                          title: "pH Akhir\n",
                          hasilAkhir: "${value[1].toStringAsFixed(1)}",
                          cardornot: true,
                          sizes: heightfit(sT16),
                          texts: "pH ${value[1].toStringAsFixed(1)}",
                          multitext: [],
                          tema: widget.tema,
                          // cardornot: false,
                          cardCostume: CardpH(
                            hasilAkhir: "${value[1].toStringAsFixed(1)}",
                          ),
                          id: 0,
                          widgetCostum: Container(),
                        ),
                        CardpHs(
                          title: "Lahan Rata\n",
                          hasilAkhir:
                              "${listPHIndikator[0].variabels["pHDitanya"][1]}",
                          cardornot: false,
                          sizes: heightfit(16),
                          texts:
                              "Luas Lahan :${(cariValue("LMt") / 10000).toStringAsFixed(1)} /Ha",
                          multitext: [],
                          tema: widget.tema,
                          id: 0,
                          cardCostume: Container(),
                          widgetCostum: Container(),
                        ),
                      ],
                    ),
                  )
                ],
              );
            },
            valueListenable: datainputan,
            // The child parameter is most helpful if the child is
            // expensive to build and does not depend on the value from
            // the notifie
          ),
        ),
        SizedBox(
          height: heightfit(defaultPadding) / 2,
        ),
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: heightfit(defaultPadding / 2)),
          child: RichText(
              text: TextSpan(children: [
            TextSpan(
              text: "Kebutuhan kapur yang dibutuhkan :",
              style: TextStyle(
                  color: kTextColor,
                  fontSize: heightfit(sT18),
                  fontWeight: FontWeight.bold),
            )
          ])),
        ),
        SizedBox(
          height: heightfit(defaultPadding) / 2,
        ),
        Container(
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
                  child: (widget.diketahui == true)
                      ? Row(
                          children: [
                            Expanded(
                              flex: 5,
                              child: Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                        right: heightfit(defaultPadding / 2)),
                                    child: RichText(
                                        text: TextSpan(children: [
                                      TextSpan(
                                        text:
                                            "Dengan luas lahan : ${(cariValue("LMt") / 10000).toStringAsFixed(1)}/Ha Kebutuhan Kapur untuk meningkatkan ${cariValue("pH").toStringAsFixed(1)} tingkatan",
                                        style: TextStyle(
                                          color: kTextColor,
                                          fontSize: heightfit(sT18),
                                        ),
                                      ),
                                    ])),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        right: heightfit(defaultPadding / 2)),
                                    child: CardpHs(
                                      title: "Diperlukan Kapur : ",
                                      hasilAkhir:
                                          "${listPHIndikator[0].variabels["pHDitanya"][1]}",
                                      cardornot: false,
                                      sizes: heightfit(sT18),
                                      texts:
                                          "${cariValue("KpH").toStringAsFixed(3)}/Ton\n Atau ${(cariValue("KpH") * 1000).toStringAsFixed(1)}/${(cariValue("LMt") / 10000).toStringAsFixed(1)} Ha",
                                      multitext: [],
                                      tema: widget.tema,
                                      cardCostume: Container(),
                                      id: 0,
                                      widgetCostum: Container(),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: heightfit(2),
                            ),
                            Expanded(
                              flex: 2,
                              child: Image.asset(
                                "assets/images/product/Kapur.png",
                                fit: BoxFit.fitHeight,
                              ),
                            )
                          ],
                        )
                      : Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                  right: heightfit(defaultPadding / 2)),
                              child: RichText(
                                  text: TextSpan(children: [
                                TextSpan(
                                  text:
                                      "Dengan luas lahan : ${(cariValue("LMt") / 10000).toStringAsFixed(1)}/Ha Kebutuhan Kapur untuk meningkatkan ${cariValue("pH").toStringAsFixed(1)} tingkatan",
                                  style: TextStyle(
                                    color: kTextColor,
                                    fontSize: heightfit(sT18),
                                  ),
                                ),
                              ])),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  right: heightfit(defaultPadding / 2)),
                              child: CardpHs(
                                title: "Diperlukan Kapur : ",
                                hasilAkhir:
                                    "${listPHIndikator[0].variabels["pHDitanya"][1]}",
                                cardornot: false,
                                sizes: heightfit(sT18),
                                texts:
                                    "${"${((cariValue("KpH") * 1000) * 1000000.toString().length <= 6) ? "${((cariValue("KpH") * 1000) * 1000).toStringAsFixed(1)} ${(c.selectobjPemupukan.value == 1) ? "g" : "g"}" : "${(cariValue("KpH") * 1000).toStringAsFixed(1)} ${(c.selectobjPemupukan.value == 1) ? "kg" : "kg"}"} "}"
                                    // "${(cariValue("KpH") * 1000).toStringAsFixed(1)}/Kg "
                                    "\nHarga : Rp.${(double.tryParse(hargapH)! * (cariValue("KpH") * 1000))}/${(cariValue("LMt") / 10000).toStringAsFixed(1)} Ha",
                                multitext: [],
                                tema: widget.tema,
                                cardCostume: Container(),
                                id: 0,
                                widgetCostum: Container(),
                              ),
                            ),
                          ],
                        ),
                ),
              ],
            )),
        (widget.diketahui == true)
            ? Padding(
                padding: EdgeInsets.all(defaultPadding),
                child: Column(
                  children: [
                    Container(
                      child: RichText(
                          text: TextSpan(children: [
                        TextSpan(
                          text:
                              "Kesimpulannya Dengan luas lahan : ${(cariValue("LMt") / 10000).toStringAsFixed(1)}/Ha Kebutuhan Kapur untuk meningkatkan ${cariValue("pH").toStringAsFixed(1)} tingkatan: ",
                          style: TextStyle(
                              color: kTextColor,
                              fontSize: heightfit(sT18),
                              fontWeight: FontWeight.bold),
                        ),
                      ])),
                    ),
                    SizedBox(
                      height: heightfit(defaultPadding),
                    ),
                    CardpHs(
                      title: "Diperlukan Kapur :\n",
                      hasilAkhir:
                          "${listPHIndikator[0].variabels["pHDitanya"][1]}",
                      cardornot: false,
                      sizes: heightfit(sT18),
                      texts:
                          "${cariValue("KpH").toStringAsFixed(3)}/Ton ( ${(cariValue("KpH") * 1000).toStringAsFixed(1)}/Kg ) Kapur ",
                      multitext: [],
                      tema: widget.tema,
                      cardCostume: Container(),
                      id: 0,
                      widgetCostum: Container(),
                    ),
                  ],
                ))
            : Container(),
        SizedBox(
          height: heightfit(defaultPadding),
        ),
        SizedBox(height: heightfit(15)),
      ],
    );
  }
}

// class CardpHPenjelas extends StatelessWidget {
//   final String hasilAkhir;
//   final bool cardornot;
//   final double sizes;
//   final String texts;
//   final String title;
//   const CardpHPenjelas({
//     Key key,
//     this.texts,
//     this.sizes,
//     this.hasilAkhir,
//     this.cardornot,
//     this.title,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.symmetric(
//         vertical: 8.0,
//       ),
//       child: Container(
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.only(
//               bottomLeft: Radius.circular(0),
//               bottomRight: Radius.circular(20),
//               topLeft: Radius.circular(20),
//               topRight: Radius.circular(0)),
//           boxShadow: [
//             BoxShadow(
//                 blurRadius: 10,
//                 offset: Offset(-5, 5),
//                 color: Colors.black38.withOpacity(.2))
//           ],
//         ),
//         child: Stack(
//           children: [
//             Container(
//               height: 25,
//               width: (cardornot == true) ? 50 : 30,
//               alignment: Alignment.bottomRight,
//               decoration: BoxDecoration(
//                 color: Colors.green.withOpacity(.3),
//                 // gradient: LinearGradient(
//                 //     colors: [kPrimaryLightColor, kPrimaryColor],
//                 //     begin: FractionalOffset(1.5, 0.01),
//                 //     end: FractionalOffset(0.8, 0.7)),
//                 borderRadius: BorderRadius.only(
//                     bottomLeft: Radius.circular(0),
//                     bottomRight: Radius.circular(20),
//                     topLeft: Radius.circular(20),
//                     topRight: Radius.circular(0)),
//                 // border: Border.all(
//                 //     color: Color(0xFFec9500), width: 1)),
//               ),
//             ),
//             Container(
//               padding: EdgeInsets.all(defaultPadding / 2),
//               child: Row(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 // mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   (cardornot == true)
//                       ? Expanded(
//                           flex: 3,
//                           child: Container(
//                             height: 40,
//                             child: FittedBox(
//                               child: CardpH(hasilAkhir: hasilAkhir),
//                             ),
//                           ),
//                         )
//                       : Expanded(
//                           flex: 1,
//                           child: Container(
//                             height: 20,
//                           ),
//                         ),
//                   SizedBox(
//                     width: defaultPadding,
//                   ),
//                   Expanded(
//                     flex: (cardornot == true) ? 5 : 8,
//                     child: RichText(
//                         text: TextSpan(children: [
//                       TextSpan(
//                         text: "${title}\n",
//                         style: TextStyle(
//                             color: kTextColor,
//                             fontSize: sizes,
//                             fontWeight: FontWeight.bold),
//                       ),
//                       TextSpan(
//                         text: texts,
//                         style:
//                             TextStyle(color: kTextColor, fontSize: sizes - 2),
//                       ),
//                     ])),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
