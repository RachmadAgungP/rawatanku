import 'package:rawatt/constants.dart';
import 'package:rawatt/model/product/mdl_Produk.dart';
import 'package:rawatt/screens/convert/component/Widget_Jenis_Pot.dart';
// import 'package:rawatt/screens/convert/component/Widget_Komoditi.dart';
// import 'package:rawatt/screens/convert/component/database_perhitungan_komoditi.dart';
import 'package:rawatt/screens/convert/component/inisialisasi_var.dart';
import 'package:rawatt/size_config.dart';
import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter/material.dart';

import '../model/MenuRawatan/mdl_MenuRawatan.dart';
// import 'package:get/get.dart';
// import 'package:get/get.dart';
import 'package:auto_size_text/auto_size_text.dart';

class TabButtonku extends StatefulWidget {
  final Function(int, List) onStateChange;
  final Color temaWarna;
  final List dataCategoryList;
  final List dataCategoryImgList;
  final int initialStateselected;
  final List<Widget> listWidgetPageView;
  final int typetema;
  const TabButtonku(
      {super.key,
      required this.initialStateselected,
      required this.dataCategoryList,
      required this.dataCategoryImgList,
      required this.onStateChange,
      required this.listWidgetPageView,
      required this.temaWarna,
      required this.typetema});

  @override
  _TabButtonkuState createState() => _TabButtonkuState();
}

class _TabButtonkuState extends State<TabButtonku> {
  late int selected;
  late int selectedPage;
  late List selectedCategoryList;
  late ScrollController _scrollController;

  late int pageNum;
  late PageController _pageController;

  int items = c.selectobjPemupukan.value;

  // double banyak_itemPerstate = 0;
  double get newItem => (selectedCategoryList.length /
      (context.size!.width / heightfit(85)).round());

  void jumpto(int items) {
    final width = _scrollController.position.maxScrollExtent +
        context.size!.width -
        defaultPadding;
    final value = (items) / newItem * width;
    final valueSpace = defaultPadding + value;

    _scrollController.animateTo(
        valueSpace / (context.size!.width / heightfit(85)).round(),
        duration: Duration(seconds: 3),
        curve: Curves.fastLinearToSlowEaseIn);
  }

  void _keKiri(int page) {
    page -= 1;
    jumpto(page);
  }

  void _keKanan(int page) {
    // items = page;
    page += 1;
    jumpto(page);
  }

  void _changePages(int pageNum) {
    setState(() {
      // selected = pageNum;

      c.selectobjPemupukan.value = selected;
      // print("${c.selectobjPemupukan.value} ola");
      _pageController.animateToPage(pageNum,
          duration: Duration(milliseconds: 100), curve: Curves.easeInOut);
    });
  }

  @override
  void initState() {
    _scrollController = ScrollController(initialScrollOffset: 0);
    _pageController = PageController(initialPage: widget.initialStateselected);

    selected = widget.initialStateselected;
    selectedCategoryList = widget.dataCategoryList;
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int indf = 0;
    return Container(
      margin: EdgeInsets.only(top: defaultPadding),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        // color: widget.temaWarna.withOpacity(.5),
      ),
      child: Column(
        children: [
          (widget.typetema == 1)
              ? tema1(selectedCategoryList)
              : tema2(selectedCategoryList),
          Divider(
            height: .5,
            thickness: 2,
            color: widget.temaWarna,
          ),
          SizedBox(
            height: heightfit(defaultPadding / 1.5),
          ),
          Padding(
            padding: EdgeInsets.only(top: heightfit(defaultPadding / 2)),
            child: ExpandablePageView(
              // animationDuration: Duration(milliseconds: 600),
              // animationCurve: Curves.fastOutSlowIn,
              // animateFirstPage: true,
              onPageChanged: (int page) {
                setState(() {
                  if (widget.typetema == 2) {
                    // print("kei ${page}");
                    // print("c.selectobjPemupukan.value");
                    if (page < selected) {
                      _keKiri(page);
                      selected = page;
                      _changePages(selected);
                    } else {
                      _keKanan(page);
                      selected = page;
                      _changePages(selected);
                    }
                  } else {
                    pageNum = page;
                    selected = page;
                    _changePages(selected);
                  }
                });
                widget.onStateChange(selected, selectedCategoryList);
              },
              controller: _pageController,
              children: widget.listWidgetPageView,
            ),
          ),
        ],
      ),
    );
  }

  Widget tema1(List selectedCategoryList) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(defaultPadding / 2),
        child: FittedBox(
          child: Container(
            width: SizeConfig.screenWidth,
            height: heightfit(60),
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      blurRadius: 7.0,
                      offset: Offset(-5, 5),
                      color: warnas(
                          dataKategoriMenuRawatan[c.indexMenuRawatan.value]
                              .colorku[0])),
                ],
                borderRadius: BorderRadius.all(Radius.circular(10)),
                border: Border.all(
                    style: BorderStyle.solid,
                    color: Colors.black.withOpacity(0.3)),
                color: warnas(dataKategoriMenuRawatan[c.indexMenuRawatan.value]
                    .colorku[0])),
            child: ListView.builder(
              // controller: _scrollController,
              scrollDirection: Axis.horizontal,
              itemCount: selectedCategoryList.length,
              itemBuilder: (context, index) => Container(
                padding: EdgeInsets.only(left: defaultPadding / 2),
                child: Center(
                  child: InkWell(
                    onTap:
                        // pressCategory,
                        () {
                      setState(() {
                        selected = index;
                        // pageNum = index;
                        _changePages(selected);
                        widget.onStateChange(selected, selectedCategoryList);
                      });
                    },
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: defaultPadding / 3),
                      child: Container(
                        // margin: EdgeInsets.all(defaultPadding/2),
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 7.0,
                                offset: Offset(-5, 5),
                                color: warnas(dataKategoriMenuRawatan[
                                        c.indexMenuRawatan.value]
                                    .colorku[0])),
                          ],
                          borderRadius: BorderRadius.circular(10),
                          color: selected == index
                              ? warnas(dataKategoriMenuRawatan[
                                      c.indexMenuRawatan.value]
                                  .colorku[1])
                              : warnas(dataKategoriMenuRawatan[
                                          c.indexMenuRawatan.value]
                                      .colorku[0])
                                  .withOpacity(.5),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(defaultPadding / 3),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                flex: 10,
                                child: AutoSizeText(
                                  widget.dataCategoryList[index],
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: selected == index
                                          ? warnas(dataKategoriMenuRawatan[
                                                  c.indexMenuRawatan.value]
                                              .colorku[0])
                                          : warnas(dataKategoriMenuRawatan[
                                                      c.indexMenuRawatan.value]
                                                  .colorku[1])
                                              .withOpacity(.5),
                                      fontStyle: FontStyle.italic,
                                      fontSize: 22),
                                  minFontSize: 18,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                // Text(widget.dataCategoryList[index],
                                //     // minFontSize: 14,
                                //     // maxFontSize: 24,
                                //     textAlign: TextAlign.center,
                                //     maxLines: 1,
                                //     style: TextStyle(
                                //
                                //       color: selected == index
                                //           ? warnas(dataKategoriMenuRawatan[c.indexMenuRawatan.value].colorku[0])
                                //           : warnas(dataKategoriMenuRawatan[c.indexMenuRawatan.value].colorku[1])!.withOpacity(.5),
                                //       fontWeight: FontWeight.w500,
                                //       fontSize: 18,
                                //     )),
                              ),
                              Expanded(
                                flex: 1,
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Container(
                                    height: 5,
                                    width: 55,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(10),
                                          topRight: Radius.circular(10)),
                                      color: selected == index
                                          ? warnas(dataKategoriMenuRawatan[
                                                  c.indexMenuRawatan.value]
                                              .colorku[0])
                                          : warnas(dataKategoriMenuRawatan[
                                                      c.indexMenuRawatan.value]
                                                  .colorku[1])
                                              .withOpacity(.3),
                                    ),
                                  ),
                                ),
                              ),
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
    );
  }

  Widget tema2(List selectedCategoryList) {
    double select = 70.0;

    return SizedBox(
      width: heightfit(SizeConfig.screenWidth! * 1.5),
      height: heightfit(120),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: defaultPadding),
        child: ListView.builder(
          controller: _scrollController,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: selectedCategoryList.length,
          itemBuilder: (context, index) => Container(
            padding: EdgeInsets.only(right: defaultPadding),
            child: InkWell(
                onTap:
                    // pressCategory,
                    () {
                  setState(() {
                    selected = index;
                    c.selectobjPemupukan.value = selected;
                    // print("${c.selectobjPemupukan.value} ola");
                    widget.onStateChange(selected, selectedCategoryList);
                  });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Expanded(
                      flex: 15,
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 200),
                        curve: Curves.fastOutSlowIn,
                        height: selected == index
                            ? heightfit(120)
                            : selected == index - 1
                                ? heightfit(90)
                                : selected == index + 1
                                    ? heightfit(90)
                                    : heightfit(select),
                        width: selected == index
                            ? heightfit(120)
                            : selected == index - 1
                                ? heightfit(90)
                                : selected == index + 1
                                    ? heightfit(90)
                                    : heightfit(select),
                        child: ItemPot(
                          tema: selected == index
                              ? Colors.green
                              : widget.temaWarna.withOpacity(.3),
                          img: widget.dataCategoryImgList[index],
                          index: index,
                          onStateChange: (ind) {
                            setState(() {
                              selected = ind;
                              _changePages(selected);
                              // selected = ind - items;
                              widget.onStateChange(
                                  selected, selectedCategoryList);
                              // print("initest1 ${ind}");
                              // print("initest ${selected}");
                            });
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        height: heightfit(7),
                        width: heightfit(95),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10)),
                          color: selected == index
                              ? widget.temaWarna
                              : widget.temaWarna.withOpacity(.3),
                        ),
                      ),
                    ),
                  ],
                )),
          ),
        ),
      ),
    );
  }
}
