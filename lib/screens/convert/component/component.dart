import 'package:rawatt/components/card_img.dart';
import 'package:rawatt/components/card_penjelas.dart';
import 'package:rawatt/components/card_pupuk.dart';
import 'package:rawatt/constants.dart';
import 'package:rawatt/model/MenuRawatan/mdl_MenuRawatan.dart';
import 'package:rawatt/screens/convert/component/inisialisasi_var.dart';
import 'package:rawatt/screens/home/home_screen.dart';
import 'package:rawatt/size_config.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

import '../../../model/jenisMesin/mdl_JenisMesin.dart';

class Titles extends StatelessWidget {
  final String titles;
  const Titles({
    super.key,
    required this.titles,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: widthfit(defaultPadding / 2),
          vertical: heightfit(defaultPadding / 2)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(children: [
            Flexible(
              flex: 3,
              child: Icon(Icons.calculate,
                  size: heightfit(36), color: Colors.green[700]),
            ),
            SizedBox(
              width: heightfit(defaultPadding / 2),
            ),
            Flexible(
              flex: 12,
              child: RichText(
                  text: TextSpan(
                text: titles,
                style: TextStyle(
                    color: kTextColor,
                    fontSize: heightfit(14),
                    fontWeight: FontWeight.w700),
              )),
            ),
          ]),
          Divider(
            height: heightfit(defaultPadding),
          )
        ],
      ),
    );
  }
}

class TemaCardButton extends StatefulWidget {
  final Color tema;
  // final String img;
  final List imgs;
  final String judul;
  final String typetema;
  final String subjudul;
  final String judulimg;
  final int indexsubmenu;
  final int indexmenu;
  // final Function onChange;
  const TemaCardButton({
    super.key,
    required this.tema,
    // this.img,
    required this.judul,
    required this.subjudul,
    required this.judulimg,
    required this.typetema,
    required this.imgs,
    required this.indexsubmenu,
    required this.indexmenu,
    // this.onChange,
  });

  @override
  State<TemaCardButton> createState() => _TemaCardButtonState();
}

class _TemaCardButtonState extends State<TemaCardButton> {
  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Container(
          height: 200,
          width: 340,
          padding: EdgeInsets.all(defaultPadding / 3),
          child: Stack(
            children: [
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: widget.tema.withOpacity(.9),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                  // border: Border.all(color: Colors.white, width: 1),
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 15,
                        offset: Offset(0, 5),
                        color: Colors.black.withOpacity(.3))
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: 4),
                          child: FittedBox(
                            child: RotatedBox(
                              quarterTurns: 3,
                              child: Text(
                                "Convert ",
                                style: TextStyle(fontSize: 14),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: defaultPadding,
                        ),
                        // Padding(
                        //   padding: EdgeInsets.only(right: 8.0 / 2),
                        //   child: Icon(
                        //     Icons.arrow_forward_ios,
                        //     size: defaultPadding,
                        //     color: Colors.white,
                        //   ),
                        // )
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: defaultPadding * 2),
                decoration: BoxDecoration(
                  color: warnas(
                      dataKategoriMenuRawatan[c.indexMenuRawatan.value]
                          .colorku[1]),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    transform: GradientRotation(17),
                    colors: <Color>[
                      warnas(dataKategoriMenuRawatan[c.indexMenuRawatan.value]
                          .colorku[2]),
                      warnas(dataKategoriMenuRawatan[c.indexMenuRawatan.value]
                          .colorku[1]),
                      warnas(dataKategoriMenuRawatan[c.indexMenuRawatan.value]
                          .colorku[0]),
                    ],
                    // Gradient from https://learnui.design/tools/gradient-generator.html
                    tileMode: TileMode.mirror,
                  ),
                  // border:
                  //     Border.all(color: tema.withOpacity(.8), width: .2)
                ),
                child: Stack(
                  children: [
                    FittedBox(
                      child: Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          color: widget.tema.withOpacity(.2),
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(0),
                              bottomRight: Radius.circular(50),
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(0)),
                        ),
                      ),
                    ),
                    if (widget.typetema == "m2t")
                      tema4(widget.judul, widget.subjudul, widget.tema,
                          widget.judulimg, widget.imgs)
                    else if (widget.typetema == "t2m")
                      tema3(widget.judul, widget.subjudul, widget.tema,
                          widget.judulimg, widget.imgs)
                    else if (widget.typetema == "dolomit")
                      tema1(
                          widget.judul,
                          widget.subjudul,
                          widget.tema,
                          widget.judulimg,
                          widget.imgs,
                          false,
                          widget.indexmenu,
                          widget.indexsubmenu)
                    else if (widget.typetema == "PPT")
                      tema2(widget.judul, widget.subjudul, widget.tema,
                          widget.judulimg, widget.imgs)
                    else if (widget.typetema == "meroke")
                      tema1(
                          widget.judul,
                          widget.subjudul,
                          widget.tema,
                          widget.judulimg,
                          widget.imgs,
                          false,
                          widget.indexmenu,
                          widget.indexsubmenu)
                  ],
                ),
              )
            ],
          )),
    );
  }

  Row tema4(judul, subjudul, tema, judulimg, imgs) {
    return Row(
      children: [
        Expanded(
          flex: 4,
          child: Padding(
            padding: EdgeInsets.only(
              top: defaultPadding / 3,
              bottom: defaultPadding / 3,
              left: defaultPadding / 2,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(flex: 4, child: ImgOnline(imgs[0], imgs[0])),
                Expanded(
                  flex: 1,
                  child: Text(
                    "$judulimg",
                    style: TextStyle(
                        color: tema, fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          ),
        ),
        Expanded(
          flex: 6,
          child: Column(
            //  myList = List<String>(3);
            children: [
              for (var i = 0; i < 3; i++)
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: defaultPadding / 3,
                      left: defaultPadding,
                    ),
                    child: CardpHs(
                      title: filterdataByPerusahaan(0)[i].nama.toString(),
                      sizes: 14,
                      cardornot: true,
                      tema: warnas(
                          List.from(filterdataByPerusahaan(0)[i].color)[0]),
                      multitext: [],
                      texts: " ${filterdataByPerusahaan(0)[i].kandungan} %",
                      cardCostume: CardProductku(
                        tema: warnas(
                            List.from(filterdataByPerusahaan(0)[i].color)[0]),
                        image: filterdataByPerusahaan(0)[i].img,
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
      ],
    );
  }

  Row tema3(judul, subjudul, tema, judulimg, imgs) {
    return Row(
      children: [
        Expanded(
          flex: 6,
          child: Column(
            children: [
              for (var i = 0; i < 3; i++)
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: defaultPadding / 3, left: defaultPadding),
                    child: CardpHs(
                      title: filterdataByPerusahaan(0)[i].nama.toString(),
                      sizes: 14,
                      cardornot: true,
                      tema: warnas(
                          List.from(filterdataByPerusahaan(0)[i].color)[0]),
                      multitext: [],
                      texts: " ${filterdataByPerusahaan(0)[i].kandungan} %",
                      cardCostume: CardProductku(
                        tema: warnas(
                            List.from(filterdataByPerusahaan(0)[i].color)[0]),
                        image: filterdataByPerusahaan(0)[i].img,
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
        Expanded(
          flex: 4,
          child: Padding(
            padding: EdgeInsets.only(
                top: defaultPadding / 3,
                bottom: defaultPadding / 3,
                right: defaultPadding / 3),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(flex: 4, child: ImgOnline(imgs[0], imgs[0])),
                Expanded(
                  flex: 1,
                  child: Text(
                    "$judulimg",
                    style: TextStyle(
                        color: tema, fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  Column tema2(judul, subjudul, tema, judulimg, imgs) {
    return Column(
      children: [
        Expanded(
          flex: 4,
          child: Center(
            child: Padding(
              padding: EdgeInsets.all(
                defaultPadding / 1.5,
              ),
              child: Container(
                alignment: Alignment.topLeft,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)),
                    // border:
                    //     Border.all(color: tema.withOpacity(.8), width: .2)
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 10,
                          offset: Offset(0, 2),
                          color: Colors.black87.withOpacity(0.2))
                    ]),
                child: Padding(
                  padding: EdgeInsets.all(defaultPadding),
                  child: FittedBox(
                    child: RichText(
                      text: TextSpan(children: [
                        TextSpan(
                            text: "$judul\n",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: heightfit(22),
                                color: tema)),
                        TextSpan(
                            text: "$subjudul",
                            style: TextStyle(
                                fontSize: heightfit(20),
                                color: tema.withOpacity(.7)))
                      ]),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 4,
          child: Padding(
            padding: EdgeInsets.all(defaultPadding / 2),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 4,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.zero,
                    itemCount: List.from(imgs).length,
                    itemBuilder: (context, index) => Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: defaultPadding / 2),
                      child: Image.asset(
                        "assets/images/product/${imgs[index]}",
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: FittedBox(
                    child: Text(
                      "$judulimg",
                      style: TextStyle(
                          color: tema,
                          fontSize: heightfit(20),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  Row tema1(judul, subjudul, Color colorss, judulimg, imgs, imgF, indexmenu,
      indexsubmenu) {
    return Row(
      children: [
        Expanded(
          flex: 4,
          child: Padding(
              padding: EdgeInsets.all(
                defaultPadding / 3,

                // bottom: defaultPadding / 3,
              ),
              child: Container(
                // height: heightfit(100),
                // width: heightfit(80),

                margin: EdgeInsets.all(defaultPadding),
                alignment: Alignment.topLeft,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)),
                    // border:
                    //     Border.all(color: tema.withOpacity(.8), width: .2)
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 10,
                          offset: Offset(-5, 9),
                          color: Colors.black87.withOpacity(0.2))
                    ]),

                // height: 20,
                // width: 50,
                child: Padding(
                  padding: EdgeInsets.all(defaultPadding),
                  child: Column(
                    children: [
                      Expanded(
                        flex: 3,
                        child: AutoSizeText("$judul",
                            minFontSize: 14,
                            maxFontSize: 18,
                            maxLines: 3,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: heightfit(17),
                                color: colorss)),
                      ),
                      SizedBox(
                        height: defaultPadding / 3,
                      ),
                      Expanded(
                        flex: 2,
                        child: AutoSizeText(
                          "$subjudul",
                          minFontSize: 10,
                          maxFontSize: 13,
                          maxLines: 3,
                          style: TextStyle(
                              fontSize: heightfit(12), color: colorss),
                        ),
                      ),
                    ],
                  ),
                ),
              )),
        ),
        Expanded(
          flex: 3,
          child: Padding(
            padding: EdgeInsets.only(
                top: defaultPadding / 3,
                bottom: defaultPadding / 3,
                left: defaultPadding / 3,
                right: defaultPadding / 3),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                    flex: 4,
                    child: imgF == true || indexmenu == 1
                        ? ImgOnline(imgs[0], imgs[0])
                        : Icon(
// Icons.water_outlined
                            datakategorisubMenuRawatan
                                .where((element) =>
                                    element.id_MenuRawatan ==
                                    indexmenu.toString())
                                .toList()[indexsubmenu]
                                .icon
                            // icons(datakategorisubMenuRawatan.where((element) => element.id_MenuRawatan == indexmenu.toString()).toList()[indexsubmenu].icon)
                            ,
                            color: warnas(dataKategoriMenuRawatan[indexmenu]
                                    .colorku[0])
                                .withOpacity(.9),
                            size: 90,
                          )),
                Expanded(
                    flex: 1,
                    child: AutoSizeText("$judulimg",
                        minFontSize: 12,
                        maxLines: 1,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: colorss)))
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class Cardnew1 extends StatelessWidget {
  final Color tema;
  final String img;
  final String judul;
  final String subJudul;
  final String daerah;
  final String jenisPasar;
  final double persent;
  final int hargaAwal;
  final int hargaAkhir;
  final String tanggalAwal;
  final String tanggalAkhir;

  const Cardnew1({
    super.key,
    required this.tema,
    required this.img,
    required this.judul,
    required this.subJudul,
    required this.daerah,
    required this.jenisPasar,
    required this.persent,
    required this.hargaAwal,
    required this.hargaAkhir,
    required this.tanggalAwal,
    required this.tanggalAkhir,
  });

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Stack(alignment: Alignment.bottomLeft, children: [
        Container(
          height: 240,
          width: 370,
          margin: EdgeInsets.only(right: defaultPadding / 2),
          // color: Colors.amber,
          child: Container(
              height: 200,
              width: 340,
              padding: EdgeInsets.all(defaultPadding / 3),
              child: Stack(
                children: [
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: tema.withOpacity(.9),
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20)),
                        // border: Border.all(color: Colors.white, width: 1),
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 15,
                              offset: Offset(0, 5),
                              color: Colors.black38.withOpacity(.3))
                        ]),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(right: 4),
                              child: FittedBox(
                                child: RotatedBox(
                                  quarterTurns: 3,
                                  child: Text(
                                    "Harga Pangan",
                                    style: TextStyle(fontSize: 14),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: defaultPadding,
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 8.0 / 2),
                              child: Icon(
                                Icons.arrow_forward_ios,
                                size: defaultPadding,
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: defaultPadding * 2),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20)),
                      // border:
                      //     Border.all(color: tema.withOpacity(.8), width: .2)
                    ),
                    child: Stack(
                      children: [
                        FittedBox(
                          child: Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                              color: tema.withOpacity(.2),
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(0),
                                  bottomRight: Radius.circular(50),
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(0)),
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Expanded(
                                flex: 2,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    top: defaultPadding,
                                    bottom: defaultPadding,
                                    left: defaultPadding,

                                    // bottom: defaultPadding / 3,
                                  ),
                                  child: Column(
                                    children: [
                                      Expanded(
                                        flex: 2,
                                        child: Container(
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                              color: tema,
                                              borderRadius: BorderRadius.only(
                                                  bottomLeft:
                                                      Radius.circular(20),
                                                  bottomRight:
                                                      Radius.circular(20),
                                                  topLeft: Radius.circular(20),
                                                  topRight:
                                                      Radius.circular(20)),
                                              // border:
                                              //     Border.all(color: tema.withOpacity(.8), width: .2)
                                              boxShadow: [
                                                BoxShadow(
                                                    blurRadius: 10,
                                                    offset: Offset(-5, 9),
                                                    color: Colors.black87
                                                        .withOpacity(0.2))
                                              ]),
                                          child: FittedBox(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.all(
                                                      defaultPadding),
                                                  child: RichText(
                                                    text: TextSpan(children: [
                                                      TextSpan(
                                                          text:
                                                              "${persent.toStringAsFixed(1)}",
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: 15,
                                                              color: Colors
                                                                  .white)),
                                                      TextSpan(
                                                          text: "%",
                                                          style: TextStyle(
                                                              fontSize: 12,
                                                              color:
                                                                  Colors.white))
                                                    ]),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: defaultPadding / 2,
                                      ),
                                      Expanded(
                                        flex: 3,
                                        child: Container(
                                          alignment: Alignment.center,
                                          // child:
                                        ),
                                      ),
                                    ],
                                  ),
                                )),
                            lokasi.isEmpty || dataHargaPangann.isEmpty
                                ? Center(child: CircularProgressIndicator())
                                : Expanded(
                                    flex: 5,
                                    child: Column(
                                      children: [
                                        Expanded(
                                          flex: 3,
                                          child: Padding(
                                              padding: EdgeInsets.only(
                                                top: defaultPadding,
                                                bottom: defaultPadding / 3,
                                                left: defaultPadding,
                                                right: defaultPadding,
                                              ),
                                              child: Stack(
                                                children: [
                                                  Container(
                                                    alignment:
                                                        Alignment.topLeft,
                                                    decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius.only(
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        20),
                                                                bottomRight:
                                                                    Radius
                                                                        .circular(
                                                                            20),
                                                                topLeft: Radius
                                                                    .circular(
                                                                        20),
                                                                topRight: Radius
                                                                    .circular(
                                                                        20)),
                                                        // border:
                                                        //     Border.all(color: tema.withOpacity(.8), width: .2)
                                                        boxShadow: [
                                                          BoxShadow(
                                                              blurRadius: 10,
                                                              offset:
                                                                  Offset(-5, 9),
                                                              color: Colors
                                                                  .black87
                                                                  .withOpacity(
                                                                      0.2))
                                                        ]),
                                                    child: Padding(
                                                      padding: EdgeInsets.all(
                                                          defaultPadding),
                                                      child: RichText(
                                                        text:
                                                            TextSpan(children: [
                                                          TextSpan(
                                                              text: "$judul\n",
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontSize: 18,
                                                                  color: tema)),
                                                          TextSpan(
                                                              text: "$daerah",
                                                              style: TextStyle(
                                                                  fontSize: 14,
                                                                  color: tema))
                                                        ]),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              )),
                                        ),
                                        Expanded(
                                          flex: 2,
                                          child: Row(
                                            children: [
                                              Container(
                                                alignment: Alignment.topLeft,
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    10),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    10),
                                                            topLeft:
                                                                Radius.circular(
                                                                    10),
                                                            topRight:
                                                                Radius.circular(
                                                                    10)),
                                                    // border:
                                                    //     Border.all(color: tema.withOpacity(.8), width: .2)
                                                    boxShadow: [
                                                      BoxShadow(
                                                          blurRadius: 10,
                                                          offset: Offset(-5, 9),
                                                          color: Colors.black87
                                                              .withOpacity(0.2))
                                                    ]),
                                                child: Padding(
                                                  padding: EdgeInsets.all(
                                                      defaultPadding / 2),
                                                  child: Center(
                                                    child: RichText(
                                                      text: TextSpan(children: [
                                                        TextSpan(
                                                            text:
                                                                "Rp.$hargaAwal\n",
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize: 12,
                                                                color: tema)),
                                                        TextSpan(
                                                            text:
                                                                "$tanggalAwal",
                                                            style: TextStyle(
                                                                fontSize: 10,
                                                                color: tema))
                                                      ]),
                                                    ),
                                                  ),
                                                ),
                                                margin: EdgeInsets.only(
                                                    left: defaultPadding,
                                                    bottom: defaultPadding,
                                                    top: defaultPadding / 2,
                                                    right: defaultPadding / 3),
                                              ),
                                              Container(
                                                alignment: Alignment.topLeft,
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    10),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    10),
                                                            topLeft:
                                                                Radius.circular(
                                                                    10),
                                                            topRight:
                                                                Radius.circular(
                                                                    10)),
                                                    boxShadow: [
                                                      BoxShadow(
                                                          blurRadius: 10,
                                                          offset: Offset(-5, 9),
                                                          color: Colors.black87
                                                              .withOpacity(0.2))
                                                    ]),
                                                child: Padding(
                                                  padding: EdgeInsets.all(
                                                      defaultPadding / 2),
                                                  child: Center(
                                                    child: RichText(
                                                      text: TextSpan(children: [
                                                        TextSpan(
                                                            text:
                                                                "Rp.$hargaAkhir\n",
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize: 12,
                                                                color: tema)),
                                                        TextSpan(
                                                            text:
                                                                "$tanggalAkhir",
                                                            style: TextStyle(
                                                                fontSize: 10,
                                                                color: tema))
                                                      ]),
                                                    ),
                                                  ),
                                                ),
                                                margin: EdgeInsets.only(
                                                    left: defaultPadding / 3,
                                                    bottom: defaultPadding,
                                                    top: defaultPadding / 2,
                                                    right: defaultPadding / 3),
                                              ),
                                              Container(
                                                alignment: Alignment.topLeft,
                                                decoration: BoxDecoration(
                                                    color: tema,
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    10),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    5),
                                                            topLeft:
                                                                Radius.circular(
                                                                    10),
                                                            topRight:
                                                                Radius.circular(
                                                                    10)),
                                                    boxShadow: [
                                                      BoxShadow(
                                                          blurRadius: 10,
                                                          offset: Offset(-5, 9),
                                                          color: Colors.black87
                                                              .withOpacity(0.2))
                                                    ]),
                                                child: Padding(
                                                  padding: EdgeInsets.all(
                                                      defaultPadding / 2),
                                                  child: Center(
                                                    child: RichText(
                                                      text: TextSpan(children: [
                                                        TextSpan(
                                                            text: "",
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize: 12,
                                                                color: tema)),
                                                      ]),
                                                    ),
                                                  ),
                                                ),
                                                margin: EdgeInsets.only(
                                                    left: defaultPadding / 2,
                                                    bottom: defaultPadding,
                                                    top: defaultPadding / 2,
                                                    right: defaultPadding / 3),
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              )),
          alignment: Alignment.topRight,
        ),
        Container(
          height: 170,
          // width: 2000,
          padding: EdgeInsets.only(top: defaultPadding / 2),
          child: Transform(
              alignment: Alignment.center,
              transform: Matrix4.rotationY(math.pi),
              child: ImgOnline(img, img)),
        ),
      ]),
    );
  }
}
