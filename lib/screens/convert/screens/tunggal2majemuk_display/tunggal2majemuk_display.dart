import 'package:rawatt/components/BG.dart';
import 'package:rawatt/components/card_atom.dart';
import 'package:rawatt/components/card_diket.dart';
import 'package:rawatt/components/card_penjelas.dart';
import 'package:rawatt/components/card_pupuk.dart';
import 'package:rawatt/constants.dart';
import 'package:rawatt/model/hara/data_hara.dart';
import 'package:rawatt/screens/convert/component/Widget_Jenis_Dosis.dart';
import 'package:rawatt/screens/convert/component/inisialisasi_var.dart';

import 'package:flutter/material.dart';

import '../../../../size_config.dart';
import 'my_mainT2M.dart';

class TunggaltoMajemukDisplay extends StatelessWidget {
  const TunggaltoMajemukDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    Color? tema = Colors.orange[900];
    List daftarBahanAktif = ["NH4", "P2O5", "K2O"];

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
                warnaBG1: tema!,
                topRights: 20,
                topLefts: 20,
                bottomRights: 0,
                bottomLefts: 0,
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
                          text: "Pupuk Pupuk Tunggal ke Majemuk",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: sT20,
                          ))
                    ])),
                  ),
                  // CardM2T(),
                  CardDiket(
                    tema: tema,
                    tags: "assets/images/product/npk-kebomas.png",
                    image: "assets/images/product/npk-kebomas.png",
                    judul:
                        "NPK Grade Fertilizer ${listTunggal2majemuk[0].input["GrideFertilizer"][0]}",
                    varDiket: Column(
                      children: [
                        for (var i = 0; i < 3; i++)
                          Expanded(
                            flex: 1,
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: defaultPadding / 3),
                              child: CardpHs(
                                title:
                                    "${filterdataByPerusahaan(0)[i].nama.toString()}\n",
                                sizes: sT18,
                                cardornot: true,
                                tema: warnas(List.from(
                                    filterdataByPerusahaan(0)[i].color)[0]),
                                multitext: [],
                                texts:
                                    "${listTunggal2majemuk[0].input["Dosis Pupuk"][i].toInt()} Kg",
                                cardCostume: CardProductku(
                                    tema: warnas(List.from(
                                        filterdataByPerusahaan(0)[i].color)[0]),
                                    image: filterdataByPerusahaan(0)[i].img),
                                hasilAkhir: '',
                                id: 0,
                                widgetCostum: Container(),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),

                  SizedBox(
                    height: defaultPadding,
                  ),
                  HasilConvertT2M(),

                  SizedBox(height: 15),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

final ValueNotifier<List<dynamic>> datainputanT2M =
    ValueNotifier<List<dynamic>>([
  listTunggal2majemuk[0].input["Dosis Pupuk"],
  listTunggal2majemuk[0].input["SenyawaAktif"],
  listTunggal2majemuk[0].input["SenyawaTerkecil"][0],
  listTunggal2majemuk[0].hasilAkhir["1"][1],
  listTunggal2majemuk[0].input["SisaKandunganBahanAktifNPK"],
  listTunggal2majemuk[0].hasilAkhir["1"][0],
  listTunggal2majemuk[0].input["GrideFertilizer"][0]
]);

class HasilConvertT2M extends StatelessWidget {
  // Color tema;

  const HasilConvertT2M({super.key});

  @override
  Widget build(BuildContext context) {
    int indexpenggantiNPK =
        List.from(listTunggal2majemuk[0].hasilAkhir["0"][1]).indexOf(0.0);

    return ValueListenableBuilder<List>(
        builder: (BuildContext? context, List? value, Widget? child) {
          return Padding(
            padding: EdgeInsets.all(defaultPadding),
            child: Column(
              children: [
                RichText(
                  text: TextSpan(children: [
                    TextSpan(
                      text:
                          "1. Menghitung Bahan Aktif yang terkadung di Pupuk Tunggal",
                      style: TextStyle(
                          color: kTextColor,
                          fontSize: heightfit(sT18),
                          fontWeight: FontWeight.bold),
                    ),
                  ]),
                ),
                SizedBox(
                  height: heightfit(defaultPadding),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: heightfit(defaultPadding / 2),
                      horizontal: heightfit(defaultPadding)),
                  child: Column(
                    //  myList = List<String>(3);
                    children: [
                      for (var i = 0; i < 3; i++)
                        Padding(
                          padding: EdgeInsets.only(
                              bottom: heightfit(defaultPadding)),
                          child: CardpHs(
                            title:
                                "${filterdataByPerusahaan(0)[i].nama.toString()}\n",
                            sizes: heightfit(sT18),
                            cardornot: true,
                            tema: warnas(List.from(
                                filterdataByPerusahaan(0)[i].color)[0]),
                            multitext: [],
                            texts: (listdosisPupuk[stateIDdosis].nama ==
                                    "Berat Pupuk")
                                ? "Bahan Aktif yang terkadung di ${value![0][i].toInt()} Kg ${filterdataByPerusahaan(0)[i].nama} : \n${value[0][i].toInt()} Kg ${filterdataByPerusahaan(0)[i].nama} = "
                                    "${value[1][i].toStringAsFixed(1)} Kg ${makro[i]["senyawa"]}"
                                : "Bahan Aktif yang terkadung di ${filterdataByPerusahaan(0)[i].nama} : \n"
                                    "${value![1][i]} Kg ${makro[i]["senyawa"]}",
                            cardCostume: CardProductku(
                                tema: warnas(List.from(
                                    filterdataByPerusahaan(0)[i].color)[0]),
                                image: filterdataByPerusahaan(0)[i].img),
                            hasilAkhir: '',
                            id: 0,
                            widgetCostum: Container(),
                          ),
                        ),
                    ],
                  ),
                ),
                SizedBox(
                  height: heightfit(defaultPadding),
                ),
                RichText(
                  text: TextSpan(children: [
                    TextSpan(
                      text:
                          "2. Bahan aktif terendah untuk menentukan dosis Pupuk NPK adalah dari ${value![2].toStringAsFixed(1)} Kg ${makro[indexpenggantiNPK]["senyawa"]} ",
                      style: TextStyle(
                          color: kTextColor,
                          fontSize: heightfit(sT18),
                          fontWeight: FontWeight.bold),
                    ),
                  ]),
                ),
                SizedBox(
                  height: heightfit(defaultPadding),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: heightfit(defaultPadding / 2),
                      horizontal: heightfit(defaultPadding)),
                  child: CardpHs(
                    hasilAkhir: "${value[3][indexpenggantiNPK]} Kg",
                    title: "${filterdataByPerusahaan(0)[3].nama.toString()} \n",
                    sizes: heightfit(sT18),
                    cardornot: true,
                    tema: Colors.green,
                    multitext: [],
                    texts:
                        "Menghitung Kebutuhan NPK untuk bahan Aktif ${value[2].toStringAsFixed(1)} Kg ${makro[indexpenggantiNPK]["senyawa"]} adalah : \n${value[2].toStringAsFixed(1)} Kg ${makro[indexpenggantiNPK]["senyawa"]} x 100 / ${value[6].toString().substring(0, 2)}  = "
                        "${value[3][indexpenggantiNPK].toStringAsFixed(1)} Kg NPK",
                    cardCostume: CardProductku(
                        tema: warnas(
                            List.from(filterdataByPerusahaan(0)[3].color)[0]),
                        image: filterdataByPerusahaan(0)[3].img),
                    id: 0,
                    widgetCostum: Container(),
                  ),
                ),
                SizedBox(
                  height: heightfit(defaultPadding),
                ),
                RichText(
                  text: TextSpan(children: [
                    TextSpan(
                      text:
                          "3. Otomatis Didalam ${value[3][indexpenggantiNPK].toStringAsFixed(1)} Kg NPK mengandung masing-masing bahan aktif (NH4, P2O5, K2O) yaitu ${value[2].toStringAsFixed(1)} Kg: ",
                      style: TextStyle(
                          color: kTextColor,
                          fontSize: heightfit(sT18),
                          fontWeight: FontWeight.bold),
                    ),
                  ]),
                ),
                SizedBox(
                  height: heightfit(defaultPadding),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: heightfit(defaultPadding / 2),
                      horizontal: heightfit(defaultPadding)),
                  child: Column(
                    //  myList = List<String>(3);
                    children: [
                      for (var i = 0; i < 3; i++)
                        Padding(
                          padding: EdgeInsets.only(
                            bottom: heightfit(defaultPadding),
                          ),
                          child: CardpHs(
                            title: "${makro[i]['namaAtom'].toString()}\n",
                            sizes: heightfit(sT18),
                            cardornot: true,
                            tema: warnas(List.from(
                                filterdataByPerusahaan(0)[i].color)[0]),
                            multitext: [],
                            texts:
                                "Menghitung sisa bahan aktif Pupuk Tunggal yaitu : \n ${value[1][i]} kg ${makro[i]["senyawa"]} ${filterdataByPerusahaan(0)[3].nama} - ${value[2].toStringAsFixed(1)} Kg ${makro[i]["senyawa"]} NPK = ${value[4][i].toStringAsFixed(1)} ${makro[i]["senyawa"]} ",
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
                        ),
                    ],
                  ),
                ),
                SizedBox(
                  height: heightfit(defaultPadding),
                ),
                RichText(
                  text: TextSpan(children: [
                    TextSpan(
                      text:
                          "4. Menghitung sisa bahan aktif ke dalam Pupuk Tunggal untuk melengkapi ${value[3][indexpenggantiNPK].toStringAsFixed(1)} Kg NPK menjadi keperluan yang seimbang Sesuai dengan Gride Fertilizernya NPK.",
                      style: TextStyle(
                          color: kTextColor,
                          fontSize: heightfit(sT18),
                          fontWeight: FontWeight.bold),
                    ),
                  ]),
                ),
                SizedBox(
                  height: heightfit(defaultPadding),
                ),
                Column(
                  //  myList = List<String>(3);
                  children: [
                    for (var i = 0; i < List.from(value[3]).length; i++)
                      if (value[3][i].toStringAsFixed(2) != '0.00')
                        Column(children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: heightfit(defaultPadding / 4),
                                horizontal: heightfit(defaultPadding)),
                            child: CardpHs(
                              hasilAkhir:
                                  "${value[3][i].toStringAsFixed(2)} Kg",
                              title: "Pupuk ${value[5][i].toString()}\n",
                              sizes: heightfit(sT18),
                              cardornot: true,
                              tema: (value[5][i] == "Phonska Plus")
                                  ? warnas(List.from(
                                      filterdataByPerusahaan(0)[3].color)[0])
                                  : warnas(List.from(
                                      filterdataByPerusahaan(0)[i].color)[0]),
                              multitext: [],
                              texts: (value[5][i] == "Phonska Plus")
                                  ? "Menghitung Kebutuhan NPK untuk ${value[2].toStringAsFixed(1)} Kg ${filterdataByPerusahaan(0)[indexpenggantiNPK].nama} adalah : \n${value[2].toStringAsFixed(1)} Kg x 100 / ${value[6].toString().substring(0, 2)}  = "
                                      "${value[3][indexpenggantiNPK].toStringAsFixed(1)} Kg"
                                  : "Berdasarkan perhitungan sisa bahan aktif di atas menghasilkan ${value[4][i].toStringAsFixed(1)} kg ${makro[i]['simbolAtom']} x 100 / kandungan unsur = ${value[3][i].toStringAsFixed(2)} Kg ${filterdataByPerusahaan(0)[i].nama}",
                              cardCostume: CardProductku(
                                  tema: warnas(List.from(
                                      filterdataByPerusahaan(0)[i].color)[0]),
                                  image: (value[5][i] == "Phonska Plus")
                                      ? filterdataByPerusahaan(0)[3].img
                                      : filterdataByPerusahaan(0)[i].img),
                              id: 0,
                              widgetCostum: Container(),
                            ),
                          ),
                          SizedBox(
                            height: defaultPadding,
                          ),
                        ]),
                  ],
                ),
              ],
            ),
          );
        },
        valueListenable: datainputanT2M);
  }
}

class CardAtomHorizontal extends StatelessWidget {
  final String hasilAkhir;
  final bool imgorAtom;
  final bool produkornot;
  final double sizes;
  final int indexs;
  final String texts;
  const CardAtomHorizontal({
    super.key,
    required this.indexs,
    required this.texts,
    required this.sizes,
    required this.imgorAtom,
    required this.hasilAkhir,
    required this.produkornot,
  });

  @override
  Widget build(BuildContext context) {
    List temaWarna = filterdataByPerusahaan(0)[indexs].color;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(0),
            bottomRight: Radius.circular(20),
            topLeft: Radius.circular(20),
            topRight: Radius.circular(0)),
        boxShadow: [
          BoxShadow(
              blurRadius: 10,
              offset: Offset(-5, 5),
              color: Colors.black38.withOpacity(.2))
        ],
      ),
      child: Stack(
        children: [
          Container(
            height: 25,
            width: 50,
            alignment: Alignment.bottomRight,
            decoration: BoxDecoration(
              color: warnas(temaWarna[0]).withOpacity(.3),
              // gradient: LinearGradient(
              //     colors: [kPrimaryLightColor, kPrimaryColor],
              //     begin: FractionalOffset(1.5, 0.01),
              //     end: FractionalOffset(0.8, 0.7)),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(0),
                  bottomRight: Radius.circular(20),
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(0)),
              // border: Border.all(
              //     color: Color(0xFFec9500), width: 1)),
            ),
          ),
          Container(
            padding: EdgeInsets.all(defaultPadding / 2),
            child: (imgorAtom == true)
                ? Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        filterdataByPerusahaan(0)[indexs].img)),
                              )),
                          SizedBox(
                            height: 100,
                            width: 130,
                            child: FittedBox(
                              child: Text(
                                hasilAkhir,
                                style: TextStyle(
                                    color: kTextColor,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ],
                      ),
                      RichText(
                          text: TextSpan(children: [
                        TextSpan(
                          text: (imgorAtom == true)
                              ? "${filterdataByPerusahaan(0)[indexs].nama}\n"
                              : "${makro[indexs]['namaAtom']}\n",
                          style: TextStyle(
                              color: kTextColor,
                              fontSize: 12,
                              fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                          text: texts,
                          style: TextStyle(color: kTextColor, fontSize: 10),
                        ),
                      ])),
                    ],
                  )
                : Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      (produkornot == true)
                          ? Expanded(
                              flex: 2,
                              child: Image.asset(
                                filterdataByPerusahaan(0)[indexs].img,
                                // width: 50,
                                // height: 50,
                              ),
                            )
                          : Expanded(
                              flex: 1,
                              child: SizedBox(
                                height: 40,
                                child: FittedBox(
                                  child: CardAtom(
                                    simbolAtom:
                                        makro[indexs]['simbolAtom'].toString(),
                                    nomerAtom:
                                        makro[indexs]['nomerAtom'].toString(),
                                    massaAtom:
                                        makro[indexs]['massaAtom'].toString(),
                                    namaAtom:
                                        makro[indexs]['namaAtom'].toString(),
                                    ionisasiEnergi: makro[indexs]
                                            ['ionisasiEnergi']
                                        .toString(),
                                    warna: (makro[indexs]['warna'] as Color?) ??
                                        Colors.transparent,
                                  ),
                                ),
                              ),
                            ),
                      SizedBox(
                        width: defaultPadding,
                      ),
                      Expanded(
                        flex: 4,
                        child: RichText(
                            text: TextSpan(children: [
                          TextSpan(
                            text: (produkornot == true)
                                ? "${filterdataByPerusahaan(0)[indexs].nama}\n"
                                : "${makro[indexs]['namaAtom']}\n",
                            style: TextStyle(
                                color: kTextColor,
                                fontSize: sizes,
                                fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text: texts,
                            style: TextStyle(
                                color: kTextColor, fontSize: sizes - 2),
                          ),
                        ])),
                      ),
                    ],
                  ),
          ),
        ],
      ),
    );
  }
}
