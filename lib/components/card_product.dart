// import 'package:rawatt/details/details.dart';
import 'package:rawatt/model/controler.dart';
import 'package:rawatt/model/datafix.dart';
import 'package:rawatt/model/product/mdl_Produk.dart';
import 'package:rawatt/screens/details/details_screen.dart';
import 'package:rawatt/size_config.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../constants.dart';
import '../screens/convert/component/inisialisasi_var.dart';
import 'package:auto_size_text/auto_size_text.dart';

import 'card_img.dart';

class ProductListCard extends StatefulWidget {
  final int index;
  final DataProducts data;
  final Function press;
  final bool todetail;
  const ProductListCard({
    super.key,
    required this.data,
    required this.index,
    required this.press,
    required this.todetail,
  });

  @override
  State<ProductListCard> createState() => _ProductListCardState();
}

class _ProductListCardState extends State<ProductListCard> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Center(
      child: Stack(children: [
        Container(
          decoration: BoxDecoration(
              color: warnas(widget.data.color[0]),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20)),
              border: Border.all(color: Colors.white.withOpacity(.5)),
              boxShadow: [
                BoxShadow(
                    blurRadius: 20,
                    offset: Offset(-3, 8),
                    color: warnas(widget.data.color[0]).withOpacity(.3))
              ]),
          child: ElevatedButton(
            onPressed: () {
              c.produkku.value = widget.data;
              if (widget.todetail) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BodyDetails(),
                  ),
                ).then((value) {
                  setState(() {
                    widget.data.quantity = c.produkku.value.quantity;
                  });
                });
              }
            },
            style: ElevatedButton.styleFrom(
                padding: EdgeInsets.all(1),
                shadowColor: Colors.black,
                // padding: EdgeInsets.only(top: 60),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                elevation: 0,
                backgroundColor: warnas(widget.data.color[0])),
            child: Container(
              margin: EdgeInsets.only(top: defaultPadding),
              height: 260.0,
              width: 200,
              child: Stack(alignment: Alignment.bottomCenter, children: [
                Container(
                  // alignment: Alignment.bottomLeft,
                  margin: EdgeInsets.only(top: 70),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    // gradient: LinearGradient(
                    //     colors: [kPrimaryLightColor, kPrimaryColor],
                    //     begin: FractionalOffset(1.5, 0.01),
                    //     end: FractionalOffset(0.8, 0.7)),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)),
                    // border:
                    //     Border.all(color: kTextColor.withOpacity(.8), width: .2)
                    // boxShadow: [
                    //   BoxShadow(
                    //       blurRadius: 10,
                    //       offset: Offset(-5, 5),
                    //       color: Colors.black38.withOpacity(.2))
                    // ]
                  ),
                ),
                Column(
                  // crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      flex: 8,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: ImgOnline(widget.data.img, widget.data.img),
                      ),
                    ),
                    // pupuk rating
                    // Divider(
                    //   height: 1,
                    // ),
                    Expanded(
                      flex: 3,
                      child: Center(
                        child: Container(
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.only(
                              // top: defaultPadding / 3,
                              bottom: defaultPadding / 3,
                              left: defaultPadding / 2,
                              right: defaultPadding / 2),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Flexible(
                                flex: 2,
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: AutoSizeText(
                                    widget.data.title,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: warnas(widget.data.color[0]),
                                        fontSize: 18),
                                    minFontSize: 10,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                              Flexible(
                                flex: 1,
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: AutoSizeText(
                                    widget.data.penjelas,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: warnas(widget.data.color[0]),
                                        fontSize: 14),
                                    minFontSize: 10,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: defaultPadding),
                      child: Divider(
                        height: 0,
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          // Expanded(
                          //   flex: 2,
                          //   child: Container(
                          //     padding: EdgeInsets.symmetric(horizontal: 8),
                          //     child: PupukRating(
                          //       score: 4.5,
                          //     ),
                          //   ),
                          // ),
                          Container(
                            // width: double.maxFinite,
                            width: 100,

                            decoration: BoxDecoration(
                                color: warnas(widget.data.color[0]),
                                // boxShadow: [
                                //   BoxShadow(
                                //       blurRadius: 10,
                                //       offset: Offset(-7, 7),
                                //       color: Colors.black.withOpacity(.2))
                                // ],
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(40),
                                  bottomRight: Radius.circular(20),
                                )),
                            child: FittedBox(
                              fit: BoxFit.fitWidth,
                              child: Padding(
                                padding: EdgeInsets.all(defaultPadding + 3),
                                child: Center(
                                  child: RichText(
                                      maxLines: 2,
                                      // textAlign: TextAlign.center,
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                              text: "Detail",
                                              style: TextStyle(
                                                  // fontWeight: FontWeight.bold,
                                                  color: Colors.white,
                                                  fontSize: 15)),
                                        ],
                                      )),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ]),
            ),
          ),
        ),
        (widget.data.quantity == 0)
            ? SizedBox()
            : Positioned(
                top: 0,
                right: 0,
                child: FittedBox(
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 7.0,
                              offset: Offset(-5, 5),
                              color: Colors.black45.withOpacity(.5)),
                        ],
                        borderRadius: BorderRadius.circular(5),
                        color: warnas(widget.data.color[0]).withBlue(100)),
                    child: Center(
                      child: Text(
                        // "${quantity}",
                        "${widget.data.quantity}",
                        style: TextStyle(fontSize: sT20),
                      ),
                    ),
                  ),
                ),
              ),
      ]),
    );
  }
}
