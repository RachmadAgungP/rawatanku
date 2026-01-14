import 'package:get/get.dart';
import 'package:measured_size/measured_size.dart';
import 'package:rawatt/components/tabCostume.dart';
import 'package:rawatt/components/tema_Page.dart';
import 'package:rawatt/constants.dart';
import 'package:rawatt/model/controler.dart';
import 'package:rawatt/model/data_.dart';
import 'package:rawatt/model/datafix.dart';
import 'package:rawatt/model/product/mdl_Produk.dart';
import 'package:rawatt/screens/details/cart_page/cart_Page.dart';
import 'package:rawatt/screens/details/component/component.dart';
import 'package:rawatt/screens/details/components.dart';
import 'package:rawatt/screens/home/screen_Lanscape/component.dart';
import 'package:rawatt/screens/home/screen_Lanscape/left_content.dart';
import 'package:rawatt/screens/home/screen_Portrait/layer2_home.dart';
import 'package:rawatt/size_config.dart';
import 'package:flutter/material.dart';

import '../../../../components/card_img.dart';
import '../../../../components/card_penjelas.dart';
import '../../../../components/card_product.dart';
import '../../../../components/card_pupuk.dart';
import '../../../../model/jenisMesin/mdl_JenisMesin.dart';
import '../../../../model/kalkulator/mdl_KatRumus.dart';
import '../../../../model/perusahaan/mdl_KatPerusahaan.dart';
import '../../../../rumus.dart';
import '../../../details/details_screen.dart';
import '../../component/Widget_Jarak_Tanaman.dart';
import '../../component/Widget_Jenis_Tanah.dart';
import '../../component/inisialisasi_var.dart';
import 'dosis_pupuk_tanaman.dart';

// import 'package:flutter_bloc/flutter_bloc.dart';

class WideLayoutProduct extends StatelessWidget {
  const WideLayoutProduct({super.key});
  @override
  Widget build(BuildContext context) {
    // List selectedperusahaanList = perusahaan;
    return Center(
      child: BackgraundProduct(
        onStateChange: () {},
        indexa: c.indexMenuRawatan.value,
      ),
    );
  }
}

class BackgraundProduct extends StatefulWidget {
  final int indexa;
  const BackgraundProduct({
    super.key,
    required this.onStateChange,
    required this.indexa,
  });
  final Function() onStateChange;

  @override
  _BackgraundProductState createState() => _BackgraundProductState();
}

class _BackgraundProductState extends State<BackgraundProduct> {
  List tampungidx1 = [0, 0];
  List coba1() {
    List datasy = c.datashasilfix.value
        .map((e) => e.idPerusahaan)
        .toSet()
        .toList()
        .map((ei) {
      List<DataObjHasilTakaran> datas = c.datashasilfix.value
          .where((element) => element.idPerusahaan == ei)
          .toList();
      return datas;
    }).toList();
    // labelLayer = dataKategoriMediaTanam[selectedItemprev].mediatanam;
    return List<Widget>.generate(datasy.length, (index) {
      return Obx(
        () => Padding(
          padding: EdgeInsets.all(heightfit(defaultPadding * 2)),
          child: Stack(
            children: [
              MeasuredSize(
                onChange: (Size size) {
                  setState(() {
                    c.sizeslayers.value.insert(index, size);
                    // print("size ${size.height}");
                  });
                },
                child: Container(
                  padding: EdgeInsets.only(bottom: heightfit(defaultPadding)),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      border: Border.all(
                          style: BorderStyle.solid,
                          color: Colors.black.withOpacity(0.3)),
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 10,
                            offset: Offset(0, 5),
                            color: Colors.black.withOpacity(.3))
                      ],
                      color: Colors.white),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(heightfit(defaultPadding / 2)),
                        child: ListTile(
                          title: Text(
                              dataKategoriPerusahaan[
                                      datasy[index][0].idPerusahaan]
                                  .perusahaan,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: heightfit(20))),
                          subtitle: Text("Dosis Pengaplikasian",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: heightfit(15))),
                          leading: Container(
                            child: Image.asset(
                                dataKategoriPerusahaan[
                                        datasy[index][0].idPerusahaan]
                                    .img,
                                height: heightfit(70),
                                width: heightfit(70),
                                fit: BoxFit.cover),
                          ),
                        ),
                      ),
                      ExpansionPanelList(
                          elevation: 3,

                          // Controlling the expansion behavior
                          expansionCallback: (indexs, isExpanded) {
                            setState(() {
                              datasy[tampungidx1[0]][tampungidx1[1]]
                                  .isExpanded = false;
                              datasy[index][indexs].isExpanded = !isExpanded;
                              tampungidx1[0] = index;
                              tampungidx1[1] = indexs;
                            });
                          },
                          animationDuration: Duration(milliseconds: 60),
                          children: datasy[index]
                              .map<ExpansionPanel>((DataObjHasilTakaran er) {
                            return ExpansionPanel(
                              headerBuilder:
                                  (BuildContext context, bool isExpanded) {
                                return Padding(
                                  padding: EdgeInsets.only(
                                      left: heightfit(defaultPadding)),
                                  child: CardpHs(
                                    title: "Dosis ${er.jenisPemupukan}\n",
                                    hasilAkhir: "",
                                    sizes: heightfit(sT18),
                                    texts: MaptoStr(
                                        er.dataDosis, 0.0, c.satuan.value, 0),
                                    multitext: [],
                                    tema: Colors.green,
                                    cardornot: false,
                                    id: 0,
                                    cardCostume: CardImgku(
                                        tema: Colors.green,
                                        image: "assets/images/BGA.jpg",
                                        conten: Container()),
                                    widgetCostum: Container(),
                                  ),
                                );
                              },
                              body: Container(
                                child: Column(
                                  children: List<Widget>.generate(
                                      er.dataPengaplikasian.length, (index) {
                                    Map dataPengaplikasian =
                                        er.dataPengaplikasian;
                                    return Column(
                                      children: [
                                        Text(
                                          dataPengaplikasian.keys
                                              .toList()[index]
                                              .toString(),
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: heightfit(18),
                                              color: Colors.black45),
                                        ),
                                        Column(
                                          children: List<Widget>.generate(
                                              dataPengaplikasian.values
                                                  .toList()[index]
                                                  .length, (indexr) {
                                            return Padding(
                                              padding: EdgeInsets.only(
                                                  left: heightfit(
                                                      defaultPadding)),
                                              child: SizedBox(
                                                height: heightfit(100),
                                                child: CardpHs(
                                                  title:
                                                      "${dataPengaplikasian.values.toList()[index].keys.toList()[indexr].toString()} : \n",
                                                  hasilAkhir: "",
                                                  sizes: heightfit(sT18),
                                                  texts:
                                                      "${dataPengaplikasian.values.toList()[index].values.toList()[indexr].toString()} ${bentukPupuk(dataPengaplikasian.values.toList()[index].keys.toList()[indexr].toString()).contains(dataPengaplikasian.values.toList()[index].keys.toList()[indexr].toString()) ? c.satuan.value == "m" ? "L/Ha" : "ml/m²" : c.satuan.value == "m" ? "Kg/Ha" : "g/m²"}",
                                                  multitext: [],
                                                  tema: Colors.green,
                                                  cardornot: true,
                                                  cardCostume: Container(
                                                    child: CardProductku(
                                                        tema: (dataPengaplikasian
                                                                    .values
                                                                    .toList()[
                                                                        index]
                                                                    .keys
                                                                    .toList()[
                                                                        indexr]
                                                                    .toString() ==
                                                                "Kieserit")
                                                            ? Colors.blue
                                                            : warnas(
                                                                List.from(dataProductsObj.where((element) => element.nama == er.dataPengaplikasian.values.toList()[index].keys.toList()[indexr].toString()).first.color)[
                                                                    0]),
                                                        image: (er.dataPengaplikasian
                                                                    .values
                                                                    .toList()[index]
                                                                    .keys
                                                                    .toList()[indexr]
                                                                    .toString() ==
                                                                "Kieserit")
                                                            ? "assets/images/BGA.jpg"
                                                            : dataProductsObj.where((element) => element.nama == er.dataPengaplikasian.values.toList()[index].keys.toList()[indexr].toString()).first.img),
                                                  ),
                                                  id: 0,
                                                  widgetCostum: Container(),
                                                ),
                                              ),
                                            );
                                          }),
                                        ),
                                      ],
                                    );
                                  }),
                                ),
                              ),
                              isExpanded: er.isExpanded,
                            );
                          }).toList()),
                    ],
                  ),
                ),
              ),
              Visibility(
                visible: c.isviewlayer.value,
                child: Container(
                  height: c.sizeslayers.value[index].height,
                  padding: EdgeInsets.only(bottom: heightfit(defaultPadding)),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      border: Border.all(
                          style: BorderStyle.solid,
                          color: Colors.black.withOpacity(0.3)),
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 10,
                            offset: Offset(0, 5),
                            color: Colors.black.withOpacity(.3))
                      ],
                      color: Colors.black.withOpacity(.3)),
                  child: Padding(
                    padding: EdgeInsets.all(heightfit(18.0)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Hasil Perhitungan masih perhitungan dalam ${c.islabelLayer.value}",
                          style: TextStyle(
                              fontSize: heightfit(24),
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: heightfit(defaultPadding),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              c.isviewlayer.value = false;
                            });
                          },
                          child: Container(
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
                                color: Colors.green,
                              ),
                              child: Padding(
                                padding:
                                    EdgeInsets.all(heightfit(defaultPadding)),
                                child: Text(
                                  "OK",
                                  style: TextStyle(
                                      fontSize: heightfit(14),
                                      fontWeight: FontWeight.bold),
                                ),
                              )),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    int selectedItem = 0;
    return BackgraundLanscape(
        widgets: Obx(() => Row(
              children: [
                Expanded(
                  // fit: FlexFit.tight,
                  flex: 8,
                  child: Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: heightfit(heightfit(defaultPadding * 2)),
                        vertical: heightfit(defaultPadding)),
                    // height: SizeConfig.screenHeight,
                    // width: SizeConfig.screenWidth / 1.45,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(-5, 9),
                            blurRadius: 20,
                            color: Colors.black45.withOpacity(.3),
                          )
                        ],
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(5),
                          bottomLeft: Radius.circular(30),
                          topRight: Radius.circular(20),
                          bottomRight: Radius.circular(5),
                        )),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: Padding(
                            padding: EdgeInsets.all(heightfit(defaultPadding)),
                            child: Container(
                              padding:
                                  EdgeInsets.all(heightfit(defaultPadding)),
                              decoration: BoxDecoration(
                                  color: Colors.black12,
                                  // border: Border.all(
                                  //     color: Colors.green.shade700),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(5),
                                    bottomLeft: Radius.circular(5),
                                    topRight: Radius.circular(20),
                                    bottomRight: Radius.circular(5),
                                  )),
                              child: Column(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: RichText(
                                      text: TextSpan(
                                        text: "Komoditi",
                                        style: TextStyle(
                                            color: Colors.black54,
                                            fontSize: heightfit(36),
                                            fontWeight: FontWeight.bold),
                                        // more: false,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 8,
                                    child: ListView.builder(
                                        padding: EdgeInsets.zero,
                                        scrollDirection: Axis.vertical,
                                        itemCount: datakategorisubMenuRawatan
                                            .where((element) =>
                                                element.id_MenuRawatan ==
                                                c.indexMenuRawatan.value)
                                            .toList()
                                            .length,
                                        itemBuilder: (context, index) =>
                                            Container(
                                              child: FittedBox(
                                                  child: cardKomoditi(
                                                lenn: datakategorisubMenuRawatan
                                                    .where((element) =>
                                                        element
                                                            .id_MenuRawatan ==
                                                        c.indexMenuRawatan
                                                            .value)
                                                    .toList()
                                                    .length,
                                                index: index,
                                                img: true,
                                                indexs:
                                                    c.indexMenuRawatan.value,
                                                indexdubmenu:
                                                    (int indexsubmenu) {
                                                  setState(() {
                                                    print("id$indexsubmenu");
                                                  });
                                                },
                                              )),
                                            )),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 12,
                          child: Container(
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: heightfit(200),
                                    child: LandingHome(
                                      jenisTema: 1,
                                      title: "Kalkulasi Pemupukan",
                                      judul: datakategorisubMenuRawatan
                                          .where((element) =>
                                              element.id_MenuRawatan ==
                                              c.indexMenuRawatan.value)
                                          .toList()[c.indexsubMenuRawatan.value]
                                          .namaKomoditi,
                                      penjelas:
                                          "Fitur Pengaplikasian Tanaman ${datakategorisubMenuRawatan.where((element) => element.id_MenuRawatan == c.indexMenuRawatan.value).toList()[c.indexsubMenuRawatan.value].namaKomoditi}",
                                      image: datakategorisubMenuRawatan
                                          .where((element) =>
                                              element.id_MenuRawatan ==
                                              c.indexMenuRawatan.value)
                                          .toList()[c.indexsubMenuRawatan.value]
                                          .img,
                                      tema: Colors.green,
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      // Container(
                                      //   child: Transform.scale(
                                      //     scale:0.8,
                                      //     child: SwitchListTile(
                                      //
                                      //         title: Text(c.satuan.value,style: TextStyle(fontSize: heightfit(26)),),
                                      //         // subtitle: Text("Satuan",style: TextStyle(fontSize: heightfit(26)),),
                                      //         value: c.checked.value,
                                      //         onChanged: (bool value) {
                                      //           setState(() {
                                      //             c.checked.value = value;
                                      //
                                      //             c.satuan.value = (value == true) ? "cm" : "m";
                                      //             changedatavalues(c.satuan.value);
                                      //           });
                                      //         }),
                                      //   ),
                                      // ),
                                      // Expanded(flex: 1,child:SizedBox(height: heightfit(defaultPadding),)),

                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: defaultPadding * 2),
                                        child: Column(
                                          children: [
                                            SizedBox(
                                              height:
                                                  heightfit(defaultPadding * 2),
                                            ),
                                            inputCalcT(
                                              indexmenuchild:
                                                  c.indexMenuRawatan.value,
                                              indexsubmenuchild:
                                                  c.indexsubMenuRawatan.value,
                                            ),
                                            Column(
                                                children:
                                                    coba1() as List<Widget>),
                                          ],
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                            flex: 5,
                            child: Container(
                              alignment: Alignment.topCenter,
                              decoration: BoxDecoration(
                                  // color: Colors.black12,
                                  // border: Border.all(
                                  //     color: Colors.green.shade700),
                                  borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(5),
                                bottomLeft: Radius.circular(5),
                                topRight: Radius.circular(20),
                                bottomRight: Radius.circular(5),
                              )),
                              child: Padding(
                                padding:
                                    EdgeInsets.all(heightfit(defaultPadding)),
                                child: Column(
                                  children: [
                                    Flexible(
                                      flex: 3,
                                      child: Container(
                                        padding: EdgeInsets.all(
                                            heightfit(defaultPadding / 2)),
                                        decoration: BoxDecoration(
                                            color: Colors.black12,
                                            // border: Border.all(
                                            //     color: Colors.green.shade700),
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(5),
                                              bottomLeft: Radius.circular(5),
                                              topRight: Radius.circular(20),
                                              bottomRight: Radius.circular(5),
                                            )),
                                        child: Column(
                                          children: [
                                            Expanded(
                                              flex: 1,
                                              child: RichText(
                                                text: TextSpan(
                                                  text: "Pesanan",
                                                  style: TextStyle(
                                                      color: Colors.black54,
                                                      fontSize: heightfit(34),
                                                      fontWeight:
                                                          FontWeight.bold),
                                                  // more: false,
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 10,
                                              child: WidgetListPesanan(
                                                onStateChange: () {
                                                  setState(() {
                                                    // bloc.cartProductss;
                                                  });
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )),
                      ],
                    ),
                  ),
                ),
              ],
            )));
  }
}
