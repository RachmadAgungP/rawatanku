import 'package:rawatt/components/card_field.dart';
import 'package:rawatt/components/card_judulPetro.dart';
import 'package:rawatt/components/tabCostume.dart';
import 'package:rawatt/components/tema_Page.dart';
import 'package:rawatt/constants.dart';
import 'package:rawatt/model/jenisMesin/mdl_JenisMesin.dart';
import 'package:rawatt/screens/convert/component/PropertyKalkulator.dart';
import 'package:rawatt/screens/convert/component/component.dart';
import 'package:rawatt/screens/convert/screen_Lanscape/backgrounds.dart';
import 'package:rawatt/screens/home/home_screen.dart';
import 'package:rawatt/size_config.dart';
import 'package:flutter/material.dart';

import '../component/inisialisasi_var.dart';

class NarrowLayout extends StatefulWidget {
  const NarrowLayout({
    super.key,
  });

  @override
  _NarrowLayoutState createState() => _NarrowLayoutState();
}

class _NarrowLayoutState extends State<NarrowLayout> {
  int _selectedItem = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.white,
      child: BackgraundPotrait(
        judul:
            "Kalkulator ${datakategorisubMenuRawatan[c.indexsubMenuRawatan.value].namaKomoditi}",
        penjelas: "Rawatan",
        widgets: Padding(
          padding: EdgeInsets.only(
              left: widthfit(defaultPadding),
              right: widthfit(defaultPadding),
              top: heightfit(defaultPadding / 2),
              bottom: heightfit(defaultPadding)),
          child: Column(children: [
            CardListProduct(),
            SizedBox(
              height: defaultPadding,
            ),
            // Titles(
            //   titles: "Kalkulator Pemupukan Pupuk Petrokimia",
            // ),
            TabButtonku(
              typetema: 2,
              temaWarna: Colors.black54,
              initialStateselected: _selectedItem,
              listWidgetPageView: [
                CardFields(
                  warna: Colors.white,
                  tema: Colors.black45,
                  judul: "Pemupukan Petrokimia :",
                  columns: Column(children: [
                    MenuConversi(
                      onChangeState: (propertyKalkulator) {},
                      imgs: "assets/images/Petrokimia_logo.png",
                      datamenukalkulator: dataPropertyKalkulator,
                      indexmenu: 1,
                      indexsubmenu: c.indexsubMenuRawatan.value,
                    ),
                  ]),
                  onChangeState: () {
                    setState(() {});
                  },
                  indexmenu: 1,
                  indexsubmenu: c.indexsubMenuRawatan.value,
                ),
                CardFields(
                    warna: Colors.white,
                    tema: Colors.black45,
                    judul: "Pemupukan MEROKE :",
                    columns: Column(children: [
                      MenuConversi(
                        onChangeState: (propertyKalkulator) {},
                        imgs: "assets/images/meroke-tetap-jaya-logo.png",
                        datamenukalkulator: dataPropertyKalkulatorMeroke,
                        indexmenu: 1,
                        indexsubmenu: c.indexsubMenuRawatan.value,
                      ),
                    ]),
                    onChangeState: () {
                      setState(() {});
                    },
                    indexmenu: 1,
                    indexsubmenu: c.indexsubMenuRawatan.value),
              ],
              dataCategoryList: ["Padi Sawah **)", "Jagung Hibrida"],
              dataCategoryImgList: [
                "assets/images/Petrokimia_logo.png",
                "assets/images/meroke-tetap-jaya-logo.png"
              ],
              onStateChange: (selected, categoryDetail) {
                _selectedItem = selected;
                // print("cobalah ${selected}");
                // });
              },
            ),
          ]),
        ),
        tema: Colors.green,
      ),
    );
  }
}

class MenuConversi extends StatefulWidget {
  final Function(PropertyKalkulator) onChangeState;
  final String imgs;
  final List datamenukalkulator;
  final int indexmenu;
  final int indexsubmenu;
  const MenuConversi(
      {super.key,
      required this.onChangeState,
      required this.imgs,
      required this.datamenukalkulator,
      required this.indexmenu,
      required this.indexsubmenu});

  @override
  _MenuConversiState createState() => _MenuConversiState();
}

class _MenuConversiState extends State<MenuConversi> {
  @override
  Widget build(BuildContext context) {
    // List<>
    return Center(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 100,
              width: 100,
              margin: const EdgeInsets.all(10.0),
              child: Image.asset(widget.imgs),
            ),
            ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                itemCount: widget.datamenukalkulator.length,
                itemBuilder: (context, index) => Container(
                      child: Column(
                        children: [
                          Container(
                            child: Padding(
                              padding:
                                  EdgeInsets.all(heightfit(defaultPadding / 3)),
                              child: Column(
                                children: [
                                  Titles(
                                      titles: widget
                                          .datamenukalkulator[index].judul),
                                  SizedBox(
                                    height: heightfit(200),
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal:
                                            heightfit(defaultPadding / 3),
                                      ),
                                      child: InkWell(
                                          onTap: () {
                                            setState(() {
                                              widget.onChangeState(widget
                                                  .datamenukalkulator[index]);
                                              (SizeConfig.screenWidth! > 600)
                                                  ? Container()
                                                  : Future.delayed(Duration(),
                                                      () {
                                                      // 5s over, navigate to a new page
                                                      Navigator.pushReplacement(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) {
                                                          return BodyInputanKalkulator(
                                                              widgets: [
                                                                widget
                                                                    .datamenukalkulator[
                                                                        index]
                                                                    .widgets[0]
                                                              ],
                                                              tema: widget
                                                                  .datamenukalkulator[
                                                                      index]
                                                                  .tema,
                                                              temaLandingPotrait: widget
                                                                  .datamenukalkulator[
                                                                      index]
                                                                  .temalendingPotrait,
                                                              judul: widget
                                                                  .datamenukalkulator[
                                                                      index]
                                                                  .judul,
                                                              imgs: widget
                                                                  .datamenukalkulator[
                                                                      index]
                                                                  .imgs,
                                                              subjudul: widget
                                                                  .datamenukalkulator[
                                                                      index]
                                                                  .subjudul,
                                                              judulimg: widget
                                                                  .datamenukalkulator[
                                                                      index]
                                                                  .judulimg);
                                                        }),
                                                      );
                                                    });
                                            });
                                          },
                                          child: Container(
                                            margin: EdgeInsets.only(
                                                bottom: heightfit(
                                                    defaultPadding / 2)),
                                            // height: heightfit(200),
                                            // width: heightfit(350),
                                            child: TemaCardButton(
                                                tema: widget
                                                    .datamenukalkulator[index]
                                                    .tema,
                                                typetema: widget
                                                    .datamenukalkulator[index]
                                                    .typeTema,
                                                judul: widget
                                                    .datamenukalkulator[index]
                                                    .judul,
                                                subjudul: widget
                                                    .datamenukalkulator[index]
                                                    .subjudul,
                                                judulimg: widget
                                                    .datamenukalkulator[index]
                                                    .judulimg,
                                                imgs: widget
                                                    .datamenukalkulator[index]
                                                    .imgs,
                                                indexsubmenu:
                                                    widget.indexsubmenu,
                                                indexmenu: widget.indexmenu),
                                          )),
                                    ),
                                  ),
                                  SizedBox(
                                    height: heightfit(defaultPadding / 2),
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: heightfit(defaultPadding),
                            child: Divider(
                              thickness: 2,
                            ),
                          )
                        ],
                      ),
                    )),
          ],
        ),
      ),
    );
  }
}

class BodyInputanKalkulator extends StatefulWidget {
  const BodyInputanKalkulator({
    super.key,
    required this.widgets,
    required this.tema,
    required this.temaLandingPotrait,
    required this.judul,
    required this.imgs,
    required this.subjudul,
    required this.judulimg,
  });
  @required
  final List<Widget> widgets;
  final Color tema;
  final String temaLandingPotrait;
  final String judul;
  final String subjudul;
  final String judulimg;
  final List imgs;

  @override
  State<BodyInputanKalkulator> createState() => _BodyInputanKalkulatorState();
}

class _BodyInputanKalkulatorState extends State<BodyInputanKalkulator> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    setState(() {});
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth > 600) {
        // datail Kalkulator

        return Scaffold(
            extendBodyBehindAppBar: false,
            appBar: appBarLanscape(),
            body: WideLayoutProduct());
      } else {
        return Scaffold(
            extendBodyBehindAppBar: true,
            appBar: appBarPotrait(),
            body: BackgraundPotrait(
                judul:
                    "Kalkulator ${datakategorisubMenuRawatan[c.indexsubMenuRawatan.value].namaKomoditi}",
                penjelas: "Rawatan",
                tema: widget.tema,
                widgets: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(defaultPadding),
                      child: CardListProduct(),
                    ),
                    ListView(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        children: widget.widgets)
                  ],
                )));
      }
    });
  }
}
