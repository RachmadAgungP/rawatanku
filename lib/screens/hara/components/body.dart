import 'package:rawatt/components/card_sapa_sobat.dart';
import 'package:rawatt/components/panel_widget_SlidingUp.dart';
import 'package:rawatt/components/slider_Vertical.dart';
import 'package:rawatt/components/tema_Page.dart';
import 'package:rawatt/constants.dart';
import 'package:rawatt/model/data_.dart';
import 'package:rawatt/model/hara/data_hara.dart';
import 'package:rawatt/size_config.dart';
import 'package:flutter/material.dart';
import 'package:rawatt/components/BG.dart';
// import 'package:rawatt/components/tombol_back.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class BodyHaraScreen extends StatefulWidget {
  const BodyHaraScreen({super.key});

  @override
  _BodyHaraScreenState createState() => _BodyHaraScreenState();
}

class _BodyHaraScreenState extends State<BodyHaraScreen> {
  List selectedCategoryList = sumber_bahan;
  List selectedCategoryListPupuk = sumber_bahan;
  List selectedcategoryListHara = makro;

  int selectedCategory = 0;
  double minHeights = 0;
  int indexs = 0;
  int selectedItem = 0;
  // ---------------------
  // List selectedCategoryUnsurHaraList = makro;
  // int selectedCategoryhara = 0;
  // int selectedChara = 0;
  int selectedCategoryPupuk = 0;
  int selectedCpupuk = 0;
  int? pil;
  // int selectedhara = 0;
  int selectedpupuk = 0;
  final PanelController _pc2 = PanelController();

  @override
  Widget build(BuildContext context) {
    // print(SizeConfig.orientation);
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          toolbarHeight: 40,
          backgroundColor: Colors.green,
          elevation: 0,
        ),
        body: SlidingUpPanel(
          parallaxEnabled: true,
          parallaxOffset: .5,

          // panelBuilder: ,
          minHeight: 0,
          maxHeight: SizeConfig.screenHeight! - 100,
          controller: _pc2,
          backdropEnabled: true,
          body: bodyPenanggulanganHama(),
          panelBuilder: (controller) => PanelWidgetSlidingUp(
            controller: controller,
            selectedCategoryList: selectedCategoryList,
            selectedItem: selectedItem,
          ),
          // panel: panelWidget(),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ));
  }

  Widget bodyPenanggulanganHama() {
    return BackgraundPotrait(
        judul: "Unsur Hara",
        penjelas: "Untuk Tanamanmu",
        widgets: Column(children: [
          CardSapaSobatTani(
              penjelas:
                  "Unsur hara esensial adalah unsur-unsur yang diperlukan bagi pertumbuhan tanaman. yang bisa didapat di bebrapa Pupuk"),
          Container(
            // color: warna,
            padding: EdgeInsets.symmetric(
                horizontal: heightfit(defaultPadding),
                vertical: heightfit(defaultPadding)),
            child: RichText(
                textAlign: TextAlign.justify,
                text: TextSpan(
                  children: [
                    TextSpan(
                        text: "Pupuk (Fertilizer)\n",
                        style: TextStyle(
                            color: kTextColor,
                            fontSize: heightfit(sT20),
                            fontWeight: FontWeight.bold)),
                    TextSpan(
                        text:
                            "Pupuk adalah material yang ditambahkan pada media tanam atau tanaman untuk mencukupi kebutuhan hara yang diperlukan tanaman sehingga mampu berproduksi dengan baik",
                        style: TextStyle(
                          color: kTextColor1,
                          fontSize: heightfit(sT18),
                        ))
                  ],
                )),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: defaultPadding),
            child: RichText(
                textAlign: TextAlign.justify,
                text: TextSpan(
                  children: [
                    TextSpan(
                        text: "Macam - macam Pupuk\n",
                        style: TextStyle(
                            color: kTextColor,
                            fontSize: heightfit(sT20),
                            fontWeight: FontWeight.bold)),
                    TextSpan(
                        text:
                            "Pupuk dikelompokkan dari beberapa kelompok yaitu, berdasarkan sumber bahan pembuatannya, bentuk fisiknya, atau berdasarkan kandungannya.",
                        style: TextStyle(
                          color: kTextColor1,
                          fontSize: heightfit(sT18),
                        ))
                  ],
                )),
          ),
          SizedBox(
            height: heightfit(defaultPadding / 2),
          ),
          Container(
            child: SliderVertical(
                imgoratom: true,
                types: "horizontal",
                initialStateSelectedItem: selectedItem,
                initialStateSelectedCategory: selectedCategory,
                initialStateSelectedCategoryList: selectedCategoryListPupuk,
                onStateChange: (stateSelectedItem, stateSelectedCategory,
                    stateSelectedCategoryListPupuk) {
                  setState(() {
                    selectedItem = stateSelectedItem;
                    selectedCategory = stateSelectedCategory;
                    selectedCategoryList = stateSelectedCategoryListPupuk;
                  });
                },
                categoryList: categoryPupuk,
                pc2: _pc2),
          ),
          SizedBox(
            height: heightfit(defaultPadding / 2),
          ),
          Container(
            // height: double.infinity,
            padding:
                EdgeInsets.symmetric(horizontal: heightfit(defaultPadding)),
            // alignment: Alignment.centerLeft,
            child: RichText(
                textAlign: TextAlign.justify,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Unsur Hara\n",
                      style: TextStyle(
                          color: kTextColor,
                          fontWeight: FontWeight.bold,
                          fontSize: heightfit(sT20)),
                    ),
                    TextSpan(
                      text:
                          "Unsur Hara sangat diperlukan oleh tanaman, jika tidak mencukupi unsur tersebut maka akan menunjukkan gejala kekurangan unsur tersebut dan pertumbuhan tanaman akan terganggu. Unsur hara dibagi menjadi makro dan mikro. Unsur hara makro diperlukan bagi tanaman dalam jumlah yang lebih besar. Sedangkan unsur hara mikro diperlukan tanaman dalam jumlah relatif kecil.",
                      style: TextStyle(
                          color: kTextColor1, fontSize: heightfit(sT18)),
                    )
                  ],
                )),
          ),
          SizedBox(
            height: heightfit(defaultPadding),
          ),
          Container(
            child: SliderVertical(
                imgoratom: false,
                types: "vertical",
                initialStateSelectedItem: selectedItem,
                initialStateSelectedCategory: selectedCategory,
                initialStateSelectedCategoryList: selectedcategoryListHara,
                onStateChange: (stateSelectedItem, stateSelectedCategory,
                    stateSelectedCategoryListHara) {
                  setState(() {
                    selectedItem = stateSelectedItem;
                    selectedCategory = stateSelectedCategory;
                    selectedCategoryList = stateSelectedCategoryListHara;
                  });
                },
                categoryList: categoryUnsurHara,
                pc2: _pc2),
          ),
          SizedBox(
            height: heightfit(defaultPadding),
          ),
          Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.all(heightfit(defaultPadding)),
            child: RichText(
                text: TextSpan(
                    text: "6 Prinsip Penggunaan Pupuk",
                    style: TextStyle(
                        color: kTextColor,
                        fontWeight: FontWeight.bold,
                        fontSize: heightfit(sT20)))),
          ),
          Divider(),
        ]),
        tema: Colors.black38);
  }
}
