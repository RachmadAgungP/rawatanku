import 'package:rawatt/components/BG.dart';
import 'package:rawatt/components/card_atom.dart';
import 'package:rawatt/components/card_diket.dart';
import 'package:rawatt/components/card_penjelas.dart';
import 'package:rawatt/components/card_pupuk.dart';
import 'package:rawatt/constants.dart';
import 'package:rawatt/model/hara/data_hara.dart';
import 'package:rawatt/screens/convert/component/Widget_Gride_Fertilizer.dart';
import 'package:rawatt/screens/convert/component/inisialisasi_var.dart';
import 'package:flutter/material.dart';
import 'package:rawatt/size_config.dart';

import 'my_main.dart';

class MajemuktoTunggalDisplay extends StatelessWidget {
  const MajemuktoTunggalDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    Color tema = Colors.red;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        toolbarHeight: 40,
        backgroundColor: tema,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Stack(
            children: [
              BackgroundShop(
                bolimages: false,
                flex1: 280,
                flex2: 300,
                warnaBG2: Colors.white,
                warnaBG1: tema,
                topRights: 20,
                topLefts: 20,
                bottomRights: 0,
                bottomLefts: 0,
                images: '',
              ),
              Column(
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
                  CardDiket(
                    tema: tema,
                    tags: "imgspupuks",
                    image: "assets/images/product/phonska-plus.png",
                    judul:
                        "NPK ${listGrideFer[0].variabels["berat"][1].toInt()} Kg \n",
                    varDiket: Column(
                      children: [
                        for (var i = 0; i < 3; i++)
                          Expanded(
                            flex: 1,
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: defaultPadding / 3),
                              child: CardpHs(
                                title: filterdataByPerusahaan(0)[i]
                                    .nama
                                    .toString(),
                                sizes: heightfit(sT24),
                                cardornot: true,
                                tema: warnas(List.from(
                                    filterdataByPerusahaan(0)[i].color)[0]),
                                multitext: [],
                                texts:
                                    "\nGride fertilizer ${List.from(listGrideFer[0].variabels.values).map((e) => e[1]).toList()[i]}%",
                                cardCostume: CardAtom(
                                  simbolAtom: makro[i]['simbolAtom'].toString(),
                                  nomerAtom: makro[i]['nomerAtom'].toString(),
                                  massaAtom: makro[i]['massaAtom'].toString(),
                                  namaAtom: makro[i]['namaAtom'].toString(),
                                  ionisasiEnergi:
                                      makro[i]['ionisasiEnergi'].toString(),
                                  warna: (makro[i]['warna'] as Color?) ??
                                      Colors.transparent,
                                ),
                                hasilAkhir: '',
                                id: 0,
                                widgetCostum: Container(),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                  Container(
                      child: HasilConvertM2T(
                    tema: tema,
                  )),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class HasilConvertM2T extends StatefulWidget {
  const HasilConvertM2T({super.key, required this.tema});

  @override
  State<HasilConvertM2T> createState() => _HasilConvertM2TState();
  final Color tema;
}

final ValueNotifier<List<dynamic>> datainputanGF =
    ValueNotifier<List<dynamic>>([
  listGrideFer[0].variabels["berat"][1].toInt(),
  List.from(listGrideFer[0].variabels.values).map((e) => e[1]).toList(),
  listGrideFer[0].hasilAkhir["0"][1].map((e) => e).toList(),
  listMajemuk2tunggal[0].hasilAkhir["0"][1].map((e) => e).toList()
]);

class _HasilConvertM2TState extends State<HasilConvertM2T> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<List>(
        builder: (BuildContext? context, List? value, Widget? child) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                height: heightfit(defaultPadding),
              ),
              Column(
                children: [
                  Text(
                    "Menghitung Bahan Aktif NPK",
                    style: TextStyle(
                        color: kTextColor,
                        fontSize: heightfit(sT20),
                        fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: heightfit(defaultPadding / 2),
                        horizontal: heightfit(defaultPadding)),
                    child: Column(
                      //  myList = List<String>(3);
                      children: [
                        for (var i = 0; i < 3; i++)
                          CardpHs(
                            title: makro[i]['namaAtom'].toString(),
                            sizes: heightfit(sT20),
                            cardornot: true,
                            tema: warnas(List.from(
                                filterdataByPerusahaan(0)[i].color)[0]),
                            multitext: [],
                            texts:
                                "\nBahan Aktif ${makro[i]['namaAtom']} pada NPK adalah : \n${value![0].toInt()} Kg x ${value[1][i]}% = "
                                "${value[2][i]} ${makro[i]["senyawa"]}",
                            cardCostume: Container(
                              padding:
                                  EdgeInsets.all(heightfit(defaultPadding / 2)),
                              child: CardAtom(
                                simbolAtom: makro[i]['simbolAtom'].toString(),
                                nomerAtom: makro[i]['nomerAtom'].toString(),
                                massaAtom: makro[i]['massaAtom'].toString(),
                                namaAtom: makro[i]['namaAtom'].toString(),
                                ionisasiEnergi:
                                    makro[i]['ionisasiEnergi'].toString(),
                                warna: (makro[i]['warna'] as Color?) ??
                                    Colors.transparent,
                              ),
                            ),
                            hasilAkhir: '',
                            id: 0,
                            widgetCostum: Container(),
                          ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: heightfit(15),
                  ),
                  Column(
                    children: [
                      Text(
                        "Konversi ${value![0].toInt()} Kg NPK Ke Pupuk Tunggal",
                        style: TextStyle(
                            color: kTextColor,
                            fontSize: heightfit(sT20),
                            fontWeight: FontWeight.bold),
                      ),
                      Column(
                        //  myList = List<String>(3);
                        children: [
                          for (var i = 0; i < 3; i++)
                            Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: heightfit(defaultPadding / 2),
                                    horizontal: heightfit(defaultPadding)),
                                child: CardpHs(
                                  title:
                                      "${value[3][i].toStringAsFixed(2)} Kg \n",
                                  sizes: heightfit(sT20),
                                  cardornot: true,
                                  tema: warnas(List.from(
                                      filterdataByPerusahaan(0)[i].color)[0]),
                                  multitext: [],
                                  texts:
                                      "${filterdataByPerusahaan(0)[i].nama} yang terkandung pada ${value[0]} Kg Pupuk NPK adalah ${value[2][i].toInt()} ${makro[i]["senyawa"]} x ${(100 / filterdataByPerusahaan(0)[i].kandungan).toStringAsFixed(2)}% = "
                                      "${value[3][i].toStringAsFixed(2)} Kg",
                                  cardCostume: Container(
                                    padding: EdgeInsets.all(
                                        heightfit(defaultPadding / 2)),
                                    child: CardProductku(
                                        tema: warnas(List.from(
                                            filterdataByPerusahaan(0)[i]
                                                .color)[0]),
                                        image:
                                            filterdataByPerusahaan(0)[i].img),
                                  ),
                                  hasilAkhir: '',
                                  id: 0,
                                  widgetCostum: Container(),
                                )),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: heightfit(15)),
            ],
          );
        },
        valueListenable: datainputanGF);
  }
}
