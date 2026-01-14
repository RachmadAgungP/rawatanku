import 'package:rawatt/components/card_product.dart';
import 'package:rawatt/constants.dart';
import 'package:rawatt/model/datafix.dart';
import 'package:rawatt/model/perusahaan/mdl_KatPerusahaan.dart';
import 'package:rawatt/model/product/mdl_Produk.dart';
import 'package:rawatt/screens/convert/component/inisialisasi_var.dart';
import 'package:rawatt/screens/details/details_screen.dart';
import 'package:rawatt/screens/home/screen_Lanscape/component.dart';
import 'package:rawatt/size_config.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../../model/MenuRawatan/mdl_MenuRawatan.dart';

class TitlePage extends StatelessWidget {
  const TitlePage({
    super.key,
    required this.judul,
    required this.penjelas,
  });
  final String judul;
  final String penjelas;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Container(
        height: heightfit(80),
        // width: widthfit(290),
        // alignment: Alignment.topLeft,

        decoration: BoxDecoration(
            color: warnas(dataKategoriMenuRawatan[c.indexMenuRawatan.value]
                    .colorku[0])
                .withOpacity(.7),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(0),
              bottomLeft: Radius.circular(0),
              topRight: Radius.circular(100),
              bottomRight: Radius.circular(0),
            )),
        child: FittedBox(
          child: Container(
            height: 80,
            // width: 300,
            padding: EdgeInsets.only(
              top: defaultPadding / 1.5,
              left: defaultPadding,
              right: defaultPadding,
            ),
            child: RichText(
                text: TextSpan(children: [
              TextSpan(
                  text: "$judul       \n",
                  style: TextStyle(
                    color: warnas(
                        dataKategoriMenuRawatan[c.indexMenuRawatan.value]
                            .colorku[1]),
                    fontWeight: FontWeight.bold,
                    fontSize: heightfit(24),
                  )),
              TextSpan(
                  text: penjelas,
                  style: TextStyle(
                    color: warnas(
                        dataKategoriMenuRawatan[c.indexMenuRawatan.value]
                            .colorku[1]),
                    fontStyle: FontStyle.italic,
                    fontSize: 20,
                  ))
            ])),
          ),
        ),
      ),
    );
  }
}

class Products extends StatefulWidget {
  const Products({
    super.key,
    required this.crossAxisCounts,
    required this.dataProduk,
    required this.todetail,
    required this.onChangeState,
  });
  final int crossAxisCounts;
  final List<DataProducts> dataProduk;
  final bool todetail;
  final Function(DataProducts) onChangeState;
  @override
  ProductsState createState() => ProductsState();
}

class ProductsState extends State<Products> {
  @override
  void initState() {
    // TODO: implement initState
    datakategori = dataKategoriPerusahaan
        .where((element) =>
            widget.dataProduk.map((e) => e.idPerusahaan).contains(element.id))
        .toList()
        .map((e) => e)
        .toList();
    selectedCategory = datakategori[0].id;
    super.initState();
  }

  List<KategoriPerusahaan> datakategori = [];
  bool loadingData = true;
  int indexs = 0;
  int selectedCategory = 0;

  // List<DataProducts> selectedCategoryList = filterdataByPerusahaan(0);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          widgetCategoryProduct(widget.dataProduk),
          SizedBox(
            height: defaultPadding / 2,
          ),
          widgetDataProduct(widget.crossAxisCounts, widget.dataProduk),
        ],
      ),
    );
  }

  Widget widgetDataProduct(int crossAxisCounts, List<DataProducts> datass) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
            left: defaultPadding,
          ),
          child: LWidgetTitle(
            judul: datakategori.map((e) => e.perusahaan).toList()[indexs],

            // "${dataKategoriPerusahaan[indexs].perusahaan}",
            more: false,
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: defaultPadding / 2),
          child: Scrollbar(
            child: GridView.builder(
              padding: EdgeInsets.only(top: defaultPadding / 3),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCounts,
                childAspectRatio: 0.8,
                mainAxisSpacing: 20,
                crossAxisSpacing: 2,
              ),
              scrollDirection: Axis.vertical,
              itemCount: datass
                  .where((element) => element.idPerusahaan == selectedCategory)
                  .toList()
                  .length,
              // filterdataByPerusahaan(selectedCategory).length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              primary: false,
              itemBuilder: (context, index) {
                return Container(
                  child: FittedBox(
                      child: Container(
                    padding: EdgeInsets.symmetric(horizontal: defaultPadding),
                    height: 230.0,
                    width: 180,
                    child: Stack(
                      children: [
                        ProductListCard(
                          index: datass
                              .where((element) =>
                                  element.idPerusahaan == selectedCategory)
                              .toList()[index]
                              .id,
                          data: datass
                              .where((element) =>
                                  element.idPerusahaan == selectedCategory)
                              .toList()[index],
                          press: () {
                            DataProducts data =
                                filterdataByPerusahaan(selectedCategory)[index];
                            c.produkku.value = data;
                            widget.onChangeState(data);
                          },
                          key: Key("s"),
                          todetail: widget.todetail,
                        ),
                      ],
                    ),
                  )),
                );
              },
            ),
          ),
        ),
        SizedBox(
          height: defaultPadding * 3,
        )
      ],
    );
  }

  Widget widgetCategoryProduct(List<DataProducts> datass) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: defaultPadding),
      child: Column(
        children: [
          LWidgetTitle(
            judul: "Category",
            more: false,
          ),
          SizedBox(
            height: defaultPadding / 3,
          ),
          SizedBox(
            height: heightfit(50),
            width: widthfit(400),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: datakategori.map((e) => e.perusahaan).toList().length,
              itemBuilder: (context, index) => FittedBox(
                child: Padding(
                  padding: EdgeInsets.only(
                      right: defaultPadding / 3, left: defaultPadding / 3),
                  child: FittedBox(
                    child: Container(
                      // height: 50,
                      // width: 120,
                      child: Center(
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              selectedCategory = datakategori[index].id;
                              // filterdataByPerusahaan(selectedCategory);
                              // selectedCategoryList =
                              //     filterdataByPerusahaan(index);
                              indexs = index;
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.all(5),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            elevation: 0,
                            backgroundColor: indexs == index
                                ? warnas(dataKategoriMenuRawatan[
                                        c.indexMenuRawatan.value]
                                    .colorku[0])
                                : warnas(dataKategoriMenuRawatan[
                                            c.indexMenuRawatan.value]
                                        .colorku[0])
                                    .withOpacity(.5),
                          ),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Padding(
                              padding: EdgeInsets.all(defaultPadding / 2),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Icon(
                                    Icons.ac_unit_rounded,
                                    size: defaultPadding,
                                  ),
                                  SizedBox(
                                    width: widthfit(defaultPadding / 6),
                                  ),
                                  Text(datakategori[index].perusahaan,
                                      style: TextStyle(
                                        color: selectedCategory == index
                                            ? warnas(dataKategoriMenuRawatan[c
                                                        .indexMenuRawatan.value]
                                                    .colorku[1])
                                                .withOpacity(.5)
                                            : warnas(dataKategoriMenuRawatan[
                                                    c.indexMenuRawatan.value]
                                                .colorku[1]),
                                        fontWeight: FontWeight.w500,
                                        fontSize: defaultPadding,
                                      )),
                                ],
                              ),
                            ),
                          ),
                        ),
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

class Akunku extends StatelessWidget {
  const Akunku({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          RichText(
            text: TextSpan(
                text: "Sobat Tani",
                style: TextStyle(
                    fontSize: sT14,
                    color: Colors.white,
                    fontWeight: FontWeight.bold)),
          ),
          SizedBox(
            width: 10,
          ),
          Image.asset(
            "assets/images/person.png",
            width: 30,
          ),
        ],
      ),
    );
  }
}
