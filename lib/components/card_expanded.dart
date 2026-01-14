import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:rawatt/Debug/childWidgetFieldListrik.dart';
import 'package:rawatt/constants.dart';
import 'package:rawatt/screens/convert/component/Widget_Jenis_Pot.dart';
import 'package:rawatt/size_config.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../model/MenuRawatan/mdl_MenuRawatan.dart';
import '../model/dosis/fieldku_campur.dart';
import '../model/kalkulator/mdl_KatRumus.dart';
import '../screens/convert/component/inisialisasi_var.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:get/get.dart';
import '../screens/convert/screens/dosis_pupuk_tanaman/dosis_pupuk_tanaman.dart';
import '../screens/details/component/component.dart';

class ExpandingCards extends StatefulWidget {
  final double height;
  final void Function(int) onchange;
  final int len;
  final int indexFix;
  final bool gridview;
  final int axisCount;
  final String title;
  final String subtitle;
  final String penjelas;
  final String img;
  final void Function(String s) tambah;
  final void Function(String u) kurang;
  final Widget dialog;
  final Widget costume;

  const ExpandingCards({
    super.key,
    required this.height,
    required this.onchange,
    required this.len,
    required this.gridview,
    required this.axisCount,
    required this.title,
    required this.subtitle,
    required this.penjelas,
    required this.indexFix,
    required this.img,
    required this.dialog,
    required this.tambah,
    required this.kurang,
    required this.costume,
  });

  @override
  State<ExpandingCards> createState() => _ExpandingCardsState();
}

class _ExpandingCardsState extends State<ExpandingCards>
    with SingleTickerProviderStateMixin {
  int _selectedIndex = -1;

  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: defaultPadding),
      child: (widget.indexFix == widget.len - 1)
          ? AnimatedCardItem(
              // key: ValueKey(index),
              indexFix: widget.indexFix,
              dialog: widget.dialog,
              title: "Tambah",
              subtitle: widget.subtitle,
              penjelas: widget.penjelas,
              image: widget.img,
              icon: Icons.add,
              iconColor: Colors.white,
              colorbg: Colors.orange,
              isExpanded: _selectedIndex == widget.indexFix,
              animation: _controller,
              onTap: () {
                Future.microtask(() {
                  setState(() {});
                });
                // setState(() {
                _selectedIndex = -1;
                widget.onchange(widget.indexFix);
                widget.tambah("SUKSES");
                // tambahfield("Perangkat", widget.indexFix);
                // });
              },
              len: widget.len,
              onchange: (d) {
                Future.microtask(() {
                  setState(() {});
                });
                // setState(() {
                widget.onchange(widget.indexFix);
                // });
              },
              kurang: (s) {
                Future.microtask(() {
                  setState(() {});
                });
                // setState(() {
                widget.kurang(s);
                widget.onchange(widget.indexFix);
                // });
              },
              grid: widget.gridview,
              costume: widget.costume,
            )
          : AnimatedCardItem(
              dialog: widget.dialog,
              // key: ValueKey(index),
              indexFix: widget.indexFix,
              title: widget.title,
              subtitle: widget.subtitle,
              penjelas: widget.penjelas,
              // title: item.namaPupu,
              // subtitle: item.hasil,
              // penjelas: "Dengan \nTotal daya : ${widget.items[index].hasil} Watt \nSelama waktu: ${widget.items[index].LamaListring} Jam ",
              image: widget.img,
              icon: (c.indexMenuRawatan.value.toString() == "1")
                  ? Icons.sunny
                  : Icons.flash_on,
              iconColor: warnas(
                  dataKategoriMenuRawatan[c.indexMenuRawatan.value].colorku[0]),
              colorbg: Colors.white,
              isExpanded: _selectedIndex == widget.indexFix,
              animation: _controller,
              onTap: () {
                Future.microtask(() {
                  setState(() {});
                });
                // setState(() {
                onExpand(
                    _selectedIndex == widget.indexFix ? -1 : widget.indexFix);
                widget.onchange(widget.indexFix);
                // });
              },
              len: widget.len,
              onchange: (d) {
                // Future.microtask(() {
                //   setState(() {
                //
                //   });
                // });
                // setState(() {
                widget.onchange(widget.indexFix);
                // });
              },
              kurang: widget.kurang,
              grid: widget.gridview,
              costume: widget.costume,
            ),
    );
  }

  void onExpand(int index) {
    Future.microtask(() {
      setState(() {});
    });
    // setState(() {
    _selectedIndex = index;
    // });
    widget.onchange(index);
    _controller.forward(from: 0);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class AnimatedCardItem extends StatefulWidget {
  final String title;
  final String subtitle;
  final String image;
  final IconData icon;
  final Animation<double> animation;
  final bool isExpanded;
  final VoidCallback onTap;
  final Color iconColor;
  final int len;
  final Color colorbg;
  final int indexFix;
  final String penjelas;
  final void Function(String d) onchange;
  final void Function(String a) kurang;
  final bool grid;
  final Widget dialog;
  final Widget costume;

  const AnimatedCardItem(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.image,
      required this.icon,
      required this.animation,
      required this.isExpanded,
      required this.onTap,
      required this.iconColor,
      required this.len,
      required this.colorbg,
      required this.indexFix,
      required this.onchange,
      required this.penjelas,
      required this.dialog,
      required this.kurang,
      required this.grid,
      required this.costume});

  @override
  State<AnimatedCardItem> createState() => _AnimatedCardItemState();
}

class _AnimatedCardItemState extends State<AnimatedCardItem> {
  bool shouldRect = false;

  @override
  void didUpdateWidget(covariant AnimatedCardItem oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.isExpanded != widget.isExpanded) {
      shouldRect = true;
    } else {
      shouldRect = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    const double collapsedWidth = 70;
    return Align(
      alignment: Alignment.centerLeft,
      child: ElevatedButton(
        onPressed: widget.onTap,
        style: ElevatedButton.styleFrom(
            padding: EdgeInsets.all(0),
            shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular((widget.isExpanded) ? 30 : 10),
            ),
            elevation: 0,
            backgroundColor: Colors.green.withOpacity(0)),
        child: AnimatedBuilder(
          animation: widget.animation,
          builder: (context, child) {
            double value = shouldRect
                ? widget.isExpanded
                    ? widget.animation.value
                    : 1 - widget.animation.value
                : widget.isExpanded
                    ? 1
                    : 0;

            final double animValue = widget.isExpanded
                ? const Interval(0, 0.5, curve: Curves.fastOutSlowIn)
                    .transform(value)
                : Interval(0.5, 1, curve: Curves.fastOutSlowIn.flipped)
                    .transform(value);

            final imageScaleValue = widget.isExpanded
                ? const Interval(0.2, 1, curve: Curves.easeOut).transform(value)
                : const Interval(0.8, 1, curve: Curves.easeOut)
                    .transform(value);

            final titleValue = widget.isExpanded
                ? const Interval(0.2, 0.8, curve: Curves.easeOut)
                    .transform(value)
                : const Interval(0.2, 0.8, curve: Curves.easeOut)
                    .transform(value);

            final subtitleValue = widget.isExpanded
                ? const Interval(0.4, 0.8, curve: Curves.easeOut)
                    .transform(value)
                : const Interval(0.4, 0.8, curve: Curves.easeOut)
                    .transform(value);

            return Transform.scale(
              scale: 1 + animValue * 0.01,
              child: Container(
                width: (widget.grid == true)
                    ? collapsedWidth + animValue * (440 - collapsedWidth)
                    : 400 + (animValue * 20),
                height: (widget.grid == true)
                    ? collapsedWidth + animValue * (440 - collapsedWidth)
                    : collapsedWidth +
                        animValue *
                            ((c.indexMenuRawatan.value == 2)
                                ? 480
                                : 440 - collapsedWidth),
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: BorderRadius.circular((widget.grid == true)
                      ? (widget.isExpanded)
                          ? (collapsedWidth / 2)
                          : 1 + collapsedWidth / 2 - 25
                      : collapsedWidth / 2 - 15),
                ),
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: Transform.scale(
                        scale: 1.2 - imageScaleValue * 0.03,
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(widget.image),
                              fit: BoxFit.cover,
                            ),
                          ),
                          foregroundDecoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.black.withOpacity(0.4),
                                Colors.black.withOpacity(1),
                              ],
                              stops: const [0.7, 1],
                            ),
                          ),
                        ),
                      ),
                    ),
                    if (widget.isExpanded)
                      Align(
                          alignment: Alignment.topCenter,
                          child: Container(
                            // width: (widget.grid == true)
                            //     ? 400 + (animValue * 20)
                            //     : 400 + (animValue * 20),
                            // height: (c.indexMenuRawatan.value.toString() == "1")?collapsedWidth +
                            //     animValue * (410 - collapsedWidth):(widget.grid == true)
                            //     ? collapsedWidth +
                            //         animValue * (310 - collapsedWidth)
                            //     : collapsedWidth +
                            //         animValue * (310 - collapsedWidth),
                            color: Colors.black12.withOpacity(.5),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: (widget.grid == true)
                                    ? 10 + animValue * 10
                                    : 10 + animValue * 10,
                                vertical: (widget.grid == true)
                                    ? 10 + animValue * 12
                                    : 10 + animValue * 12,
                              ),
                              child: SingleChildScrollView(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    // AutoSizeText(
                                    //   "${widget.title}",
                                    //   style: TextStyle(
                                    //       fontWeight: FontWeight.bold,
                                    //       color: Colors.white!,
                                    //       fontStyle: FontStyle.normal,
                                    //       fontSize:
                                    //       (widget.grid == true) ? 50 : 20+ animValue),
                                    //   minFontSize: 3,
                                    //   maxLines: 5,
                                    //   overflow: TextOverflow.ellipsis,
                                    // ),
                                    //
                                    // SingleChildScrollView(
                                    //   scrollDirection : Axis.horizontal,
                                    //   child: Container(
                                    //     child: AutoSizeText(
                                    //       "Rp.${formatRupiah(widget.penjelas)}",
                                    //       style: TextStyle(
                                    //           fontWeight: FontWeight.bold,
                                    //           color: Colors.white!,
                                    //           fontStyle: FontStyle.normal,
                                    //           fontSize:
                                    //               (widget.grid == true) ? 40 : 10+ animValue),
                                    //       minFontSize: 10,
                                    //       maxLines: 2,
                                    //       overflow: TextOverflow.ellipsis,
                                    //     ),
                                    //   ),
                                    // ),
                                    widget.costume,
                                    (widget.grid != true)
                                        ? Container()
                                        : Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              SizedBox(
                                                height:
                                                    defaultPadding + animValue,
                                              ),
                                              SizedBox(
                                                height:
                                                    defaultPadding + animValue,
                                              ),
                                              Container(
                                                padding: EdgeInsets.symmetric(
                                                  horizontal: 10 + animValue,
                                                  vertical: 35 + animValue * 3,
                                                ),
                                                clipBehavior: Clip.antiAlias,
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius
                                                      .circular((widget.grid ==
                                                              true)
                                                          ? (widget.isExpanded)
                                                              ? (collapsedWidth /
                                                                  2)
                                                              : 1 +
                                                                  collapsedWidth /
                                                                      2 -
                                                                  25
                                                          : collapsedWidth / 2 -
                                                              15),
                                                ),
                                                height: 200,
                                                width: 350,
                                                child: ElevatedButton(
                                                  onPressed: () async {
                                                    showDialog(
                                                        context: context,
                                                        barrierDismissible:
                                                            false,
                                                        builder: (BuildContext
                                                            context) {
                                                          SchedulerBinding
                                                              .instance
                                                              .addPostFrameCallback(
                                                                  (_) {
                                                            // setState(() {
                                                            // Future.microtask(() {
                                                            //   setState(() {
                                                            //
                                                            //   });
                                                            // });

                                                            print("loop");
                                                            widget.onchange(
                                                                "SUKSES");
                                                            widget.onchange(
                                                                widget.indexFix
                                                                    .toString());
                                                            print(
                                                                "indexs ku u ${widget.indexFix.toString()} $indexselectidkalku");

                                                            // filterdataobject()[c.ObjectIndexSelectedEdit.value].varii = getDataTakaranDosisTanamanG(c.indexsubMenuRawatan.value, "(LMt/10000)*JPk");
                                                            //                                                  });
                                                          });

                                                          return widget.dialog;
                                                        });
                                                    c.ObjectIndexSelectedEdit
                                                            .value =
                                                        widget.indexFix;
                                                    // print("indexs ku u ${widget.indexFix.toString()}");
                                                  },
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                          padding:
                                                              EdgeInsets.all(1),
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                          ),
                                                          elevation: 0,
                                                          backgroundColor:
                                                              Colors.orange),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Expanded(
                                                        flex: 2,
                                                        child: Center(
                                                            child: Icon(
                                                          Icons.edit,
                                                          color: Colors.white,
                                                          size: 60 + animValue,
                                                        )),
                                                      ),
                                                      Expanded(
                                                        flex: 3,
                                                        child: Center(
                                                          child: AutoSizeText(
                                                            "Edit",
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: Colors
                                                                    .white,
                                                                fontStyle:
                                                                    FontStyle
                                                                        .normal,
                                                                fontSize: (widget
                                                                            .grid ==
                                                                        true)
                                                                    ? 50 +
                                                                        animValue
                                                                    : 20),
                                                            minFontSize: 10,
                                                            maxLines: 2,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                    SizedBox(
                                      height: defaultPadding,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )),
                    Positioned(
                      bottom: 0,
                      top: 0,
                      left: 0,
                      right: 0,
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 10 + animValue * 10,
                            vertical: 10 + animValue * 10,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Expanded(
                                flex: 1,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Center(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: widget.colorbg,
                                          shape: BoxShape.circle,
                                        ),
                                        child: SizedBox.square(
                                          dimension: (widget.isExpanded)
                                              ? (widget.grid == true)
                                                  ? 100
                                                  : 70
                                              : (widget.grid == true)
                                                  ? 30
                                                  : 50,
                                          child: Center(
                                            child: Icon(
                                              (widget.icon),
                                              color: widget.iconColor,
                                              size: (widget.isExpanded)
                                                  ? (widget.grid == true)
                                                      ? 50
                                                      : 40
                                                  : 20,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    (widget.isExpanded)
                                        ? SizedBox(
                                            height: 0,
                                            width: 0,
                                          )
                                        : (widget.grid == true)
                                            ? Text(
                                                widget.title,
                                                maxLines: 1,
                                                style: TextStyle(
                                                  fontSize:
                                                      (widget.grid == true)
                                                          ? 10
                                                          : 18,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              )
                                            : SizedBox(
                                                height: 0,
                                                width: 0,
                                              )
                                  ],
                                ),
                              ),
                              (widget.isExpanded)
                                  ? Container()
                                  : (widget.grid == true)
                                      ? Container()
                                      : Flexible(
                                          flex: 4,
                                          child: Container(
                                            alignment: Alignment.center,
                                            child: Center(
                                              child: Column(
                                                children: [
                                                  Expanded(
                                                    flex: 3,
                                                    child: AutoSizeText(
                                                      widget.title,
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.white,
                                                          fontStyle:
                                                              FontStyle.italic,
                                                          fontSize:
                                                              (widget.grid ==
                                                                      true)
                                                                  ? 60
                                                                  : 20),
                                                      minFontSize: 10,
                                                      maxLines: 1,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                  ),
                                                  (widget.title != "Tambah")
                                                      ? Expanded(
                                                          flex: 2,
                                                          child: AutoSizeText(
                                                            widget.subtitle,
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                                color: Colors
                                                                    .white,
                                                                fontStyle:
                                                                    FontStyle
                                                                        .italic,
                                                                fontSize:
                                                                    (widget.grid ==
                                                                            true)
                                                                        ? 40
                                                                        : 20),
                                                            minFontSize: 10,
                                                            maxLines: 1,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                          ),
                                                        )
                                                      : Container(),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                              if (widget.isExpanded)
                                Flexible(
                                  flex: 3,
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: defaultPadding),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Flexible(
                                          flex: 4,
                                          child: Opacity(
                                            opacity: titleValue,
                                            child: Transform.translate(
                                              offset: Offset(
                                                20 * (1 - titleValue),
                                                0,
                                              ),
                                              child: Text(
                                                widget.title,
                                                maxLines: 1,
                                                style: TextStyle(
                                                  fontSize:
                                                      (widget.grid == true)
                                                          ? 30
                                                          : 18,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        // const SizedBox(height: 2),
                                        Flexible(
                                          flex: 1,
                                          child: Opacity(
                                            opacity: subtitleValue,
                                            child: Transform.translate(
                                              offset: Offset(
                                                20 * (1 - subtitleValue),
                                                0,
                                              ),
                                              child: AutoSizeText(
                                                widget.subtitle,
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white,
                                                    fontStyle: FontStyle.italic,
                                                    fontSize:
                                                        (widget.grid == true)
                                                            ? 50
                                                            : 25),
                                                minFontSize: 9,
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
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
                    ),
                    (widget.icon == Icons.add)
                        ? Container()
                        : (widget.grid == true)
                            ? Container()
                            : (widget.isExpanded)
                                ? Container()
                                : Positioned(
                                    bottom: 0,
                                    top: 0,
                                    left: 0,
                                    right: 0,
                                    child: Align(
                                      alignment: Alignment.topRight,
                                      child: ElevatedButton(
                                        onPressed: () {
                                          Future.microtask(() {
                                            setState(() {});
                                          });
                                          // setState(() {
                                          AddRuang = false;
                                          widget.kurang("SUKSES");
                                          // widget.kurang;
                                          widget.onchange("SUKSES");
                                          // });
                                        },
                                        style: ElevatedButton.styleFrom(
                                            padding: EdgeInsets.all(0),
                                            elevation: 0,
                                            backgroundColor:
                                                Colors.white.withOpacity(.1),
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(
                                                  30.0), // Sesuaikan dengan radius yang diinginkan
                                            )),
                                        child: Icon(
                                          Icons.cancel_rounded,
                                          size: 30,
                                          color: Colors.red,
                                        ),
                                      ),
                                    ),
                                  ),
                    Positioned(
                      top: 0,
                      right: (widget.isExpanded) ? 50 + animValue * 10 : 0,
                      child: (widget.icon == Icons.add)
                          ? Container()
                          : (widget.grid == true)
                              ? Align(
                                  alignment: Alignment.topRight,
                                  child: FittedBox(
                                    child: SizedBox(
                                      height: 20,
                                      width: 20,
                                      child: ElevatedButton(
                                        onPressed: () {
                                          Future.microtask(() {
                                            setState(() {});
                                          });
                                          // setState(() {
                                          AddRuang = false;
                                          widget.kurang("SUKSES");
                                          // widget.kurang;
                                          widget.onchange("SUKSES");
                                          // });
                                        },
                                        style: ElevatedButton.styleFrom(
                                          padding: EdgeInsets.all(0),
                                          elevation: 0,
                                          backgroundColor:
                                              Colors.white.withOpacity(.1),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                                30.0), // Sesuaikan dengan radius yang diinginkan
                                          ),
                                        ),
                                        child: Icon(
                                          Icons.cancel_rounded,
                                          size: (widget.isExpanded) ? 80 : 20,
                                          color: Colors.red,
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              : Container(),
                    ),
                    // Center(
                    //   child: Positioned(
                    //     bottom: 0,
                    //     right: (widget.isExpanded) ? 50 + animValue * 10 : 0,
                    //     child: (widget.icon == Icons.add)
                    //         ? Container()
                    //         : (widget.grid == true)
                    //             ? Align(
                    //                 alignment: Alignment.topRight,
                    //                 child: FittedBox(
                    //                   child:  SizedBox(
                    //                     height: 20,
                    //                     width: 20,
                    //                     child: ElevatedButton(
                    //                       onPressed: () async {
                    //                         showDialog(
                    //                             context: context,
                    //                             barrierDismissible: false,
                    //                             builder: (BuildContext context) {
                    //                               SchedulerBinding.instance.addPostFrameCallback((_) {
                    //                                 // setState(() {
                    //                                 // Future.microtask(() {
                    //                                 //   setState(() {
                    //                                 //
                    //                                 //   });
                    //                                 // });
                    //
                    //                                 print("loop");
                    //                                 if (widget.onchange != null) {
                    //                                   widget.onchange("SUKSES");
                    //                                 }
                    //                                 widget.onchange(widget.indexFix.toString());
                    //                                 print("indexs ku u ${widget.indexFix.toString()} ${indexselectidkalku}");
                    //
                    //
                    //                                 // filterdataobject()[c.ObjectIndexSelectedEdit.value].varii = getDataTakaranDosisTanamanG(c.indexsubMenuRawatan.value, "(LMt/10000)*JPk");
                    //                                 //                                                  });
                    //                               });
                    //
                    //                               return widget.dialog;
                    //                             });
                    //                         c.ObjectIndexSelectedEdit.value = widget.indexFix;
                    //                         // print("indexs ku u ${widget.indexFix.toString()}");
                    //                       },
                    //                       style: ElevatedButton.styleFrom(
                    //                           padding: EdgeInsets.all(1),
                    //                           shape: RoundedRectangleBorder(
                    //                             borderRadius:
                    //                             BorderRadius.circular(10),
                    //                           ),
                    //                           elevation: 0,
                    //                           backgroundColor: Colors.orange),
                    //                       child: Row(
                    //                         mainAxisAlignment: MainAxisAlignment.center,
                    //                         children: [
                    //                           Expanded(
                    //                             flex:2,
                    //                             child: Center(
                    //                                 child: Icon(
                    //                                   Icons.edit,
                    //                                   color: Colors.white,
                    //                                   size: 60 + animValue,
                    //                                 )),
                    //                           ),
                    //                           Expanded(
                    //                             flex:3,
                    //                             child: Center(
                    //                               child: AutoSizeText(
                    //                                 "Edit",
                    //                                 style: TextStyle(
                    //                                     fontWeight: FontWeight.bold,
                    //                                     color: Colors.white!,
                    //                                     fontStyle: FontStyle.normal,
                    //                                     fontSize:
                    //                                     (widget.grid == true) ? 50 + animValue : 20),
                    //                                 minFontSize: 10,
                    //                                 maxLines: 2,
                    //                                 overflow: TextOverflow.ellipsis,
                    //                               ),
                    //
                    //                             ),
                    //                           ),
                    //                         ],
                    //                       ),
                    //                     ),
                    //                   ),
                    //                 ),
                    //               )
                    //             : Container(),
                    //   ),
                    // )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
