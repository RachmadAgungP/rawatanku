// import 'package:rawatt/components/card_img.dart';
import 'package:rawatt/components/card_product.dart';
import 'package:rawatt/components/card_pupuk.dart';
import 'package:rawatt/components/pupuk_rating.dart';
import 'package:rawatt/constants.dart';
import 'package:rawatt/model/datafix.dart';
import 'package:rawatt/model/product/mdl_Produk.dart';
import 'package:rawatt/screens/convert/component/inisialisasi_var.dart';
import 'package:rawatt/screens/details/components.dart';
import 'package:rawatt/screens/details/details_screen.dart';
import 'package:rawatt/screens/home/components/card_Quote.dart';
import 'package:rawatt/size_config.dart';
import 'package:flutter/material.dart';

class LandingHome extends StatelessWidget {
  const LandingHome({
    super.key,
    required this.judul,
    required this.penjelas,
    required this.title,
    required this.image,
    required this.jenisTema,
    required this.tema,
  });
  final int jenisTema;
  final String title;
  final String judul;
  final String penjelas;
  final String image;
  final Color tema;

  @override
  Widget build(BuildContext context) {
    // print();
    Widget temaLanding(jenisTema) {
      List<Widget> listTema = [
        Tema1(judul: judul, penjelas: penjelas, image: image),
        Tema2(
          judul: judul,
          penjelas: penjelas,
          image: image,
          tema: Colors.amber,
        ),
        Tema3(
          judul: judul,
          penjelas: penjelas,
          image: image,
          tema: tema,
        )
      ];
      return listTema[jenisTema];
    }

    Map<String, Color> temaColor = {
      "colorBackgroud": Colors.white,
      "colorText": Colors.black,
      "colorMotif": Colors.blue
    };
    if (jenisTema == 3) {
      temaColor["colorBackgroud"] = (Colors.white);
      temaColor["colorText"] = tema;
      temaColor["colorMotif"] = tema;
    } else {
      temaColor["colorBackgroud"] = (tema);
      temaColor["colorText"] = (Colors.white);
      temaColor["colorMotif"] = (Colors.white);
    }

    return Container(
      child: Padding(
        padding: EdgeInsets.only(
          left: widthfit(defaultPadding / 2),
          right: widthfit(defaultPadding / 2),
          top: heightfit(defaultPadding),
          // bottom: heightfit(defaultPadding/2)
        ),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: temaColor["colorBackgroud"],
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 3),
                      blurRadius: 5,
                      color: Colors.black45.withOpacity(.2),
                    )
                  ],
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    bottomLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                    bottomRight: Radius.circular(15),
                  )),
              child: Stack(
                children: [
                  Positioned(
                    bottom: 0,
                    left: 0,
                    child: Container(
                      decoration: BoxDecoration(
                          color: temaColor["colorMotif"]!.withOpacity(.5),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(0),
                            bottomLeft: Radius.circular(25),
                            topRight: Radius.circular(30),
                            bottomRight: Radius.circular(0),
                          )),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    right: 0,
                    child: FittedBox(
                      child: Container(
                        height: heightfit(150),
                        width: heightfit(150),
                        decoration: BoxDecoration(
                            color: temaColor["colorMotif"]!.withOpacity(.5),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(0),
                              bottomLeft: Radius.circular(150),
                              topRight: Radius.circular(45),
                              bottomRight: Radius.circular(20),
                            )),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: FittedBox(
                      child: Container(
                        height: heightfit(30),
                        width: heightfit(30),
                        decoration: BoxDecoration(
                            color: temaColor["colorMotif"]!.withOpacity(.5),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              bottomLeft: Radius.circular(0),
                              topRight: Radius.circular(6),
                              bottomRight: Radius.circular(30),
                            )),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            temaLanding(jenisTema - 1),
          ],
        ),
      ),
    );
  }
}

class Tema1 extends StatelessWidget {
  const Tema1({
    super.key,
    required this.judul,
    required this.penjelas,
    required this.image,
  });
  final String judul;
  final String penjelas;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      // padding: EdgeInsets.only(top: defaultPadding * 2),
      // height: heightfit(840 / 3),
      // width: widthfit(900 / 2.5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 3,
            child: Padding(
              padding: EdgeInsets.only(
                left: widthfit(defaultPadding),
                // bottom: heightfit(defaultPadding / 2),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RichText(
                    text: TextSpan(
                        text: judul,
                        style: TextStyle(
                            fontSize: heightfit(30),
                            color: Colors.white,
                            fontWeight: FontWeight.bold)),
                  ),
                  RichText(
                    text: TextSpan(
                        text: penjelas,
                        style: TextStyle(
                          fontSize: heightfit(24),
                          color: Colors.white,
                        )),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: FittedBox(
              child: Container(
                height: 75,
                width: 120,
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.6),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(70),
                      bottomLeft: Radius.circular(0),
                      topRight: Radius.circular(6),
                      bottomRight: Radius.circular(30),
                    )),
                child: Center(
                  child: Image.asset(
                    image,
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Tema2 extends StatelessWidget {
  const Tema2({
    super.key,
    required this.judul,
    required this.penjelas,
    required this.image,
    required this.tema,
  });
  final String judul;
  final String penjelas;
  final String image;
  final Color tema;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 4,
            child: Padding(
              padding: EdgeInsets.only(
                top: heightfit(defaultPadding),
                left: widthfit(defaultPadding / 2),
                bottom: heightfit(defaultPadding),
              ),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 3,
                    child: RichText(
                      text: TextSpan(
                          text: judul,
                          style: TextStyle(
                              fontSize: heightfit(30),
                              color: detect(tema),
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: RichText(
                      text: TextSpan(
                          children: [
                            TextSpan(
                              text: "$penjelas\n",
                              style: TextStyle(fontSize: heightfit(24)),
                            ),
                            // TextSpan(
                            //   text: "SNI: 09-2323-2321",
                            //   style: TextStyle(fontSize: heightfit(26)),
                            // )
                          ],
                          style: TextStyle(
                            color: detect(tema),
                          )),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: heightfit(defaultPadding / 3)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: heightfit(80),
                            child: FittedBox(
                              child: PupukRating(
                                score: 4.8,
                                tema: detect(tema),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: SizedBox(
                      width: widthfit(defaultPadding * 2),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Icon(Icons.eco_rounded,
                                color: detect(tema), size: heightfit(25)),
                          ),
                          Expanded(
                            flex: 1,
                            child: Icon(Icons.water_outlined,
                                color: detect(tema), size: heightfit(25)),
                          ),
                          Expanded(
                            flex: 1,
                            child: Icon(Icons.clean_hands,
                                color: detect(tema), size: heightfit(25)),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Center(
              child: Padding(
                padding: EdgeInsets.all(heightfit(defaultPadding)),
                child: SizedBox(
                  height: heightfit(250),
                  child: FittedBox(
                    child: SizedBox(
                      height: 200,
                      width: 250,
                      child: Row(
                        children: [
                          Expanded(
                            flex: 5,
                            child: Container(
                                height: 200,
                                width: 250,
                                padding:
                                    EdgeInsets.all(heightfit(defaultPadding)),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(15),
                                      bottomLeft: Radius.circular(15),
                                      topRight: Radius.circular(15),
                                      bottomRight: Radius.circular(15),
                                    ),
                                    color: Colors.white54),
                                child: Image.asset(
                                  image,
                                  fit: BoxFit.fitHeight,
                                )),
                          ),
                          // SizedBox(
                          //   width: widthfit(defaultPadding / 5),
                          // ),
                          // Expanded(
                          //   flex: 2,
                          //   child: Container(
                          //     padding:
                          //         EdgeInsets.all(heightfit(defaultPadding)),
                          //     decoration: BoxDecoration(
                          //         borderRadius: BorderRadius.only(
                          //           topLeft: Radius.circular(5),
                          //           bottomLeft: Radius.circular(5),
                          //           topRight: Radius.circular(5),
                          //           bottomRight: Radius.circular(5),
                          //         ),
                          //         color: Colors.white),
                          //     child: FittedBox(
                          //       child: RotatedBox(
                          //         quarterTurns: 3,
                          //         child: Row(
                          //           children: [
                          //             Icon(Icons.clean_hands,
                          //                 color: tema, size: heightfit(35)),
                          //             SizedBox(
                          //               width: widthfit(defaultPadding / 4),
                          //             ),
                          //             Text(
                          //               "Berat 50 Kg",
                          //               style: TextStyle(
                          //                   color: Colors.black, fontSize: 14),
                          //             ),
                          //           ],
                          //         ),
                          //       ),
                          //     ),
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Tema3 extends StatelessWidget {
  const Tema3(
      {super.key,
      required this.judul,
      required this.penjelas,
      required this.image,
      required this.tema});
  final String judul;
  final String penjelas;
  final String image;
  final Color tema;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 4,
            child: Padding(
              padding: EdgeInsets.only(
                top: heightfit(defaultPadding),
                left: widthfit(defaultPadding / 2),
                bottom: heightfit(defaultPadding / 2),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          text: TextSpan(
                              text: judul,
                              style: TextStyle(
                                  fontSize: heightfit(26),
                                  color: tema,
                                  fontWeight: FontWeight.bold)),
                        ),
                        RichText(
                          text: TextSpan(
                              text: penjelas,
                              style: TextStyle(
                                fontSize: heightfit(24),
                                color: tema,
                              )),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          FittedBox(
                            child: CardProductku(
                              image: "assets/images/product/subnonsub_urea.png",
                              tema:
                                  warnas(filterdataByPerusahaan(0)[0].color[0]),
                            ),
                          ),
                          FittedBox(
                            child: CardProductku(
                              image: "assets/images/product/subnonsub_sp36.png",
                              tema:
                                  warnas(filterdataByPerusahaan(0)[1].color[0]),
                            ),
                          ),
                          FittedBox(
                            child: CardProductku(
                              image: "assets/images/product/subnonsub_za.png",
                              tema:
                                  warnas(filterdataByPerusahaan(0)[7].color[0]),
                            ),
                          ),
                          FittedBox(
                            child: CardProductku(
                              image: "assets/images/product/KCL.png",
                              tema: warnas(
                                  filterdataByPerusahaan(0)[12].color[0]),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Center(
              child: Image.asset(
                image,
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MenuFiturUtama extends StatelessWidget {
  const MenuFiturUtama({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: heightfit(150),
      width: widthfit(450),
      child: FittedBox(
        alignment: Alignment.centerLeft,
        child: SizedBox(
          height: 150,
          width: 450,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 2,
                child: FittedBox(
                  child: Container(
                    height: 90,
                    width: 90,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Image.asset(
                      "assets/images/person.png",
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 6,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: widthfit(defaultPadding / 2)),
                  child: FittedBox(
                    child: RichText(
                        text: TextSpan(children: [
                      TextSpan(
                          text: "Kalkulator Dosis\n",
                          style: TextStyle(
                              fontSize: 32,
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                      TextSpan(
                          text: "Kalkulator Dosis Pupuk.",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          )),
                    ])),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AccountUser extends StatelessWidget {
  const AccountUser({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Container(
        height: 100,
        width: 300,
        padding: EdgeInsets.all(defaultPadding / 4),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(5),
          bottomLeft: Radius.circular(5),
          topRight: Radius.circular(5),
          bottomRight: Radius.circular(5),
        )),
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: FittedBox(
                child: Container(
                  height: 60,
                  width: 60,
                  // margin: EdgeInsets.all(defaultPadding / 2),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(60))),
                  child: Image.asset(
                    "assets/images/person.png",
                  ),
                ),
              ),
            ),
            SizedBox(
              width: widthfit(defaultPadding),
            ),
            Expanded(
              flex: 5,
              child: FittedBox(
                child: RichText(
                    textAlign: TextAlign.justify,
                    text: (TextSpan(children: [
                      (TextSpan(
                          text: "Sobat Tani\n",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.white))),
                      TextSpan(
                          text: "Rawatan",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: Colors.white)),
                    ]))),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LWidgetListQuote extends StatelessWidget {
  const LWidgetListQuote({
    super.key,
    required this.selectedQuotesList,
  });

  final List selectedQuotesList;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: heightfit(230),
      width: widthfit(300),
      child: ListView.builder(
          padding: EdgeInsets.zero,
          scrollDirection: Axis.vertical,
          itemCount: selectedQuotesList.length,
          itemBuilder: (context, index) => Padding(
                padding: EdgeInsets.only(top: defaultPadding / 3),
                child: CardQuotes(
                  title: selectedQuotesList[index]['title'],
                  kutipan: selectedQuotesList[index]['kutipan'],
                  images: selectedQuotesList[index]['image'],
                  // pressDetails: () {},
                ),
              )),
    );
  }
}

class LWidgetTitle extends StatelessWidget {
  const LWidgetTitle({
    super.key,
    required this.judul,
    required this.more,
  });
  final String judul;
  final bool more;
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 20,
      // width: SizeConfig.screenWidth,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: defaultPadding / 3),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              // fit: FlexFit.tight,
              flex: 5,
              child: RichText(
                  text: TextSpan(
                      text: judul,
                      style: TextStyle(
                          color: kTextColor,
                          fontSize: 25,
                          fontWeight: FontWeight.bold))),
            ),
            Expanded(
              flex: 1,
              child: RichText(
                  text: TextSpan(
                      text: (more == true) ? "More..." : "       ",
                      style: TextStyle(
                        color: kTextColor,
                        fontSize: 25,
                      ))),
            ),
          ],
        ),
      ),
    );
  }
}

class ListVproduct extends StatelessWidget {
  const ListVproduct({
    super.key,
    required this.index,
    required this.shopItems,
  });

  final int index;
  final List<DataProducts> shopItems;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Container(
        margin: EdgeInsets.symmetric(
            horizontal: defaultPadding / 3, vertical: defaultPadding / 4),
        height: 50,
        width: 170,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(7),
              bottomLeft: Radius.circular(7),
              topRight: Radius.circular(7),
              bottomRight: Radius.circular(7),
            )),
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: defaultPadding / 2, horizontal: defaultPadding / 3),
          child: Row(
            children: [
              SizedBox(
                height: 30,
                width: 30,
                child: FittedBox(
                  child: ProductListCard(
                    index: index,
                    data: DataProducts(
                        id: index,
                        idPerusahaan: shopItems[index].idPerusahaan,
                        nama: shopItems[index].nama,
                        kandungan: shopItems[index].kandungan,
                        title: shopItems[index].title,
                        color: shopItems[index].color,
                        penjelas: shopItems[index].penjelas,
                        img: shopItems[index].img,
                        brosure: shopItems[index].brosure,
                        informasi: shopItems[index].informasi,
                        kategoriProduk: shopItems[index].kategoriProduk,
                        quantity: shopItems[index].quantity,
                        harga: shopItems[index].harga,
                        id_MenuRawatan: shopItems[index].id_MenuRawatan,
                        bentuk: "",
                        bundle: shopItems[index].bundle,
                        diskon: shopItems[index].diskon,
                        countdownku: shopItems[index].countdownku,
                        linkSp: shopItems[index].linkSp),
                    press: () {
                      DataProducts data = DataProducts(
                          id: index,
                          idPerusahaan: shopItems[index].idPerusahaan,
                          nama: shopItems[index].nama,
                          kandungan: shopItems[index].kandungan,
                          title: shopItems[index].title,
                          color: shopItems[index].color,
                          penjelas: shopItems[index].penjelas,
                          img: shopItems[index].img,
                          brosure: shopItems[index].brosure,
                          informasi: shopItems[index].informasi,
                          kategoriProduk: shopItems[index].kategoriProduk,
                          quantity: shopItems[index].quantity,
                          bentuk: "",
                          harga: shopItems[index].harga,
                          id_MenuRawatan: shopItems[index].id_MenuRawatan,
                          bundle: shopItems[index].bundle,
                          diskon: shopItems[index].diskon,
                          countdownku: shopItems[index].countdownku,
                          linkSp: shopItems[index].linkSp);

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BodyDetails(),
                          ));
                    },
                    todetail: true,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: defaultPadding / 3),
                child: FittedBox(
                  child: RichText(
                      textAlign: TextAlign.justify,
                      text: (TextSpan(children: [
                        (TextSpan(
                            text: "${shopItems[index].title}\n",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                color: Colors.green.shade700))),
                        TextSpan(
                            text: "Agro Industri",
                            style:
                                TextStyle(fontSize: 10, color: Colors.black)),
                      ]))),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
