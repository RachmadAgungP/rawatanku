// import 'package:rawatt/components/card_img.dart';
import 'package:rawatt/components/card_preventive.dart';
import 'package:rawatt/size_config.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import '../constants.dart';

class SliderVertical extends StatefulWidget {
  final bool imgoratom;
  final Function(int, int, List) onStateChange;
  final int initialStateSelectedItem;
  final int initialStateSelectedCategory;
  final List categoryList;
  final List initialStateSelectedCategoryList;
  final PanelController pc2;
  final String types;

  const SliderVertical({
    super.key,
    required this.categoryList,
    required this.pc2,
    this.initialStateSelectedItem = 0,
    required this.onStateChange,
    this.initialStateSelectedCategory = 0,
    required this.initialStateSelectedCategoryList,
    required this.types,
    required this.imgoratom,
  });

  @override
  _SliderVerticalState createState() => _SliderVerticalState();
}

class _SliderVerticalState extends State<SliderVertical> {
  late int selectedItem;
  late List selectedCategoryList;
  int selectedCategory = 0;

  @override
  void initState() {
    super.initState();
    selectedItem = widget.initialStateSelectedItem;
    selectedCategory = widget.initialStateSelectedCategory;
    selectedCategoryList = widget.initialStateSelectedCategoryList;
  }

  @override
  Widget build(BuildContext context) {
    // print(selectedItem);
    return SizedBox(
      height: heightfit(170),
      // width: double.infinity,
      child: (widget.types == "vertical")
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                    // fit: FlexFit.loose,
                    flex: 2,
                    child: widgetSelectedCategory(types: "vertical")),
                Flexible(
                    // fit: FlexFit.loose,
                    flex: 1,
                    child: SizedBox(
                      height: heightfit(defaultPadding),
                    )),
                Expanded(
                    flex: 10,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 5,
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: heightfit(defaultPadding)),
                            child: Container(
                                height: heightfit(150),
                                width: heightfit(100),
                                padding:
                                    EdgeInsets.all(heightfit(defaultPadding)),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                    // border: Border.all(color: kTextColor.withOpacity(.8), width: .2),
                                    boxShadow: [
                                      BoxShadow(
                                          blurRadius: 5,
                                          offset: Offset(-3, 2),
                                          color: Colors.black38.withOpacity(.2))
                                    ]),
                                child: Image.asset(
                                    "assets/images/png/015-experiment.png")),
                          ),
                        ),
                        Expanded(flex: 12, child: widgetSelectedItem()),
                      ],
                    )),
              ],
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Flexible(
                    // fit: FlexFit.loose,
                    flex: 3,
                    child: widgetSelectedCategory(types: "horizontal")),
                Flexible(
                    flex: 6,
                    child: Padding(
                      padding: EdgeInsets.only(right: defaultPadding),
                      child: widgetSelectedItem(),
                    )),
              ],
            ),
    );
  }

  Container widgetSelectedItem() {
    return Container(
      // alignment: Alignment.topLeft,
      // margin: EdgeInsets.only(bottom: defaultPadding),
      // height: 290,
      // width: SizeConfig.screenWidth,
      // color: warna1,
      child: Swiper(
        itemCount: selectedCategoryList.length,
        itemBuilder: (context, index) => Padding(
          padding: EdgeInsets.only(bottom: heightfit(defaultPadding)),
          child: IntensifikasiListCard(
            imgoratom: widget.imgoratom,
            simbolAtom: selectedCategoryList[index]['simbolAtom'],
            nomerAtom: selectedCategoryList[index]['nomerAtom'],
            massaAtom: selectedCategoryList[index]['massaAtom'],
            namaAtom: selectedCategoryList[index]['namaAtom'],
            ionisasiEnergi: selectedCategoryList[index]['ionisasiEnergi'],
            warna: Colors.amberAccent,
            title: selectedCategoryList[index]['title'],
            penjelas: selectedCategoryList[index]['penjelas'],
            image: selectedCategoryList[index]['image'],
            press:
                // pressPanelSlidingUp,
                () {
              setState(() {
                // hasil(selectedItem);
                selectedItem = index;

                // return selectedItem;
              });
              widget.onStateChange(
                  selectedItem, selectedCategory, selectedCategoryList);

              widget.pc2.open();
            },
            key: null,
          ),
        ),
        viewportFraction: 0.8,
        scale: 0.9,
        scrollDirection: Axis.vertical,
        loop: false,
      ),
    );
  }

  Container widgetSelectedCategory({String? types}) {
    return Container(
      // height: height(200),
      width: double.infinity,
      padding: EdgeInsets.only(left: defaultPadding),
      child: Container(
        // width: double.infinity,
        child: ListView.builder(
          padding: (types == "vertical")
              ? EdgeInsets.symmetric(vertical: 0)
              : EdgeInsets.symmetric(vertical: defaultPadding / 4),
          scrollDirection:
              (types == "vertical") ? Axis.horizontal : Axis.vertical,
          itemCount: widget.categoryList.length,
          itemBuilder: (context, index) => Container(
            // height: (types == "vertical") ? 45 : 150,
            margin: EdgeInsets.only(
              left: 0,
              right: (types == "vertical") ? defaultPadding / 2 : 0,
              bottom: (types == "vertical") ? 0 : 0,
            ),
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  selectedCategory = index;
                  selectedCategoryList =
                      widget.categoryList[index]['arrayMappedname'];
                  widget.onStateChange(
                      selectedItem, selectedCategory, selectedCategoryList);
                });
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 0,
                backgroundColor: selectedCategory == index
                    ? Colors.green
                    : Colors.green[100],
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Icon(
                    //   widget.categoryList[index]['ic'],
                    //   // size: 14,
                    // ),
                    // SizedBox(
                    //   width: defaultPadding / 3,
                    // ),
                    RichText(
                      textAlign: TextAlign.justify,
                      text: TextSpan(
                          text: widget.categoryList[index]['label'],
                          style: TextStyle(
                            color: selectedCategory == index
                                ? Colors.white
                                : Colors.black38,
                            fontWeight: FontWeight.w500,
                            fontSize: heightfit(sT16),
                          )),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
