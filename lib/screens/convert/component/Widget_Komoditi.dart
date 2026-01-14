import 'package:rawatt/components/card_field.dart';
import 'package:rawatt/components/tabCostume.dart';
import 'package:rawatt/constants.dart';
import 'package:rawatt/model/datafix.dart';
import 'package:rawatt/screens/convert/component/Widget_Jenis_Pot.dart';
import 'package:rawatt/screens/convert/component/inisialisasi_var.dart';

import 'package:rawatt/size_config.dart';
import 'package:flutter/material.dart';

import 'package:function_tree/function_tree.dart';

import '../../../model/jenisMesin/mdl_JenisMesin.dart';
import '../../../rumus.dart';

List<String> superscripts = ['⁰', '¹', '²', '³', '⁴', '⁵', '⁶', '⁷', '⁸', '⁹'];
List<String> subscripts = ['₀', '₁', '₂', '₃', '₄', '₅', '₆', '₇', '₈', '₉'];

class WidgetPupukKomoditi extends StatelessWidget {
  final List dataRumusPerKomoditi;
  final Color tema;
  final int indexKe;
  final int stateID;
  final int indexPageCalkulator;
  final Function(int, List) onChangeState;
  WidgetPupukKomoditi(
      {super.key,
      required this.tema,
      required this.onChangeState,
      required this.indexKe,
      required this.indexPageCalkulator,
      required this.stateID,
      required this.dataRumusPerKomoditi});

  List<TextEditingController> myControlers = [];

  void onPress(selectedItem) {
    // dataTakaran = []
    List<double> dataTakaran = [];
    // List dataDosis = [];

    dataRumusPerKomoditi[selectedItem].takaran.forEach((k, v) {
      v.forEach((k1, v1) {
        dataRumusPerKomoditi[selectedItem].hasil[k][k1] =
            convertRumus(dataRumusPerKomoditi[selectedItem].variabels, v1)
                .interpret();

        dataTakaran.add(
            convertRumus(dataRumusPerKomoditi[selectedItem].variabels, v1)
                .interpret()
                .toDouble());

        // dataDosisPengaplikasianObj
        //     .where((element) => element.jenisPemupukan == "Berimbang")
        //     .map((e) => e.takaran.forEach((key, value) {
        //       value.forEach((k1, v1) {

        //       });}));
      });
    });
    print("1=> $dataTakaran");
    onChangeState(selectedItem, dataTakaran);
  }

  @override
  Widget build(BuildContext context) {
    int selectedItem = stateID;
    return CardFields(
      tema: tema,
      judul: "Komoditi : ",
      columns: Column(
        children: [
          TabButtonku(
            typetema: 2,
            temaWarna: tema,
            initialStateselected: selectedItem,
            dataCategoryList: dataRumusPerKomoditi
                .map((e) => datakategorisubMenuRawatan
                    .where((element) =>
                        element.id_MenuRawatan == c.indexMenuRawatan.value)
                    .toList()[e.idKomoditi]
                    .namaKomoditi)
                .toList(),
            dataCategoryImgList: dataRumusPerKomoditi
                .map((e) => datakategorisubMenuRawatan
                    .where((element) =>
                        element.id_MenuRawatan == c.indexMenuRawatan.value)
                    .toList()[e.idKomoditi]
                    .img)
                .toList(),
            onStateChange: (selected, categoryDetail) {
              // setState(() {
              selectedItem = selected;
              categoryDetail = categoryDetail;
              c.selectobjPemupukan.value = selected;

              onPress(selectedItem);
              // });
            },
            listWidgetPageView: List<Widget>.generate(
                dataRumusPerKomoditi.length,
                (index) => Padding(
                      padding: EdgeInsets.only(
                          // top: heightfit(defaultPadding / ),
                          // left: widthfit(defaultPadding / 2),
                          bottom: heightfit(defaultPadding / 2)),
                      child: Padding(
                        padding: EdgeInsets.only(
                            top: heightfit(defaultPadding / 2),
                            left: heightfit(defaultPadding / 2)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: heightfit(100),
                              width: widthfit(100),
                              child: ItemPot(
                                tema: (selectedItem == index)
                                    ? tema
                                    : Colors.grey.shade400,
                                // img: "assets/images/pot/balok.png",
                                img: datakategorisubMenuRawatan
                                    .where((element) =>
                                        element.id_MenuRawatan ==
                                        c.indexMenuRawatan.value)
                                    .toList()[dataRumusPerKomoditi[selectedItem]
                                        .idKomoditi]
                                    .img,
                                index: selectedItem,
                                onStateChange: (indexs) {
                                  // setState(() {
                                  selectedItem = indexs;
                                  c.selectobjPemupukan.value = indexs;
                                  // });
                                },
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(
                                  top: defaultPadding / 2,
                                  left: defaultPadding,
                                  right: defaultPadding),
                              width: double.infinity,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  RichText(
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                            text: "Komoditi : ",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: heightfit(22))),
                                        TextSpan(
                                            text:
                                                "${datakategorisubMenuRawatan.where((element) => element.id_MenuRawatan == c.indexMenuRawatan.value).toList()[dataRumusPerKomoditi[selectedItem].idKomoditi].namaKomoditi}\n",
                                            style: TextStyle(
                                                fontSize: heightfit(20))),
                                        TextSpan(
                                            text:
                                                "Dosis (${dataRumusPerKomoditi[selectedItem].satuan}) : ",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: heightfit(22))),
                                        TextSpan(children: [
                                          TextSpan(
                                              text: dosis(dataRumusPerKomoditi[
                                                      selectedItem]
                                                  .variabels),
                                              style: TextStyle(
                                                  fontSize: heightfit(20))),
                                        ]),
                                        TextSpan(
                                            text:
                                                "\nWaktu Aplikasi & Takaran Pupuk : ",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: heightfit(22))),
                                        for (int i = 0;
                                            i <
                                                dataRumusPerKomoditi[
                                                        selectedItem]
                                                    .hasil
                                                    .keys
                                                    .length;
                                            i++)
                                          TextSpan(children: [
                                            TextSpan(
                                                text:
                                                    "\n${List.from(dataRumusPerKomoditi[selectedItem].hasil.keys).elementAt(i)} :", //[Dasar,HST20,HST35]
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: heightfit(20))),
                                            TextSpan(
                                                text:
                                                    // "${takaran(List.from(dataRumusPerKomoditi[selectedItem].hasil.values).elementAt(i))}", //[urea,sp36,kcl]
                                                    "takaran: ",
                                                style: TextStyle(
                                                    fontSize: heightfit(18))),
                                          ]),
                                      ],
                                      style: TextStyle(color: Colors.blueGrey),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    )),
          ),
        ],
      ),
      onChangeState: () {},
      indexmenu: c.indexMenuRawatan.value,
      indexsubmenu: c.indexsubMenuRawatan.value,
      warna: Colors.white,
    );
  }
}
