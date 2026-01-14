import 'package:rawatt/constants.dart';
import 'package:rawatt/model/datafix.dart';
import 'package:rawatt/model/product/mdl_Produk.dart';
import 'package:rawatt/model/product/tags.dart';
import 'package:rawatt/size_config.dart';
import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../../convert/component/inisialisasi_var.dart';
import '../details_screen.dart';

class CartHeaderWidget extends StatefulWidget {
  final DataProducts shopItem;
  final PanelController pc2;
  final Function() onChange;
  const CartHeaderWidget(
      {super.key,
      required this.pc2,
      required this.onChange,
      required this.shopItem});

  @override
  _CartHeaderWidgetState createState() => _CartHeaderWidgetState();
}

class _CartHeaderWidgetState extends State<CartHeaderWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // dragHandle(),
        Container(
          height: heightfit(85),
          width: widthfit(450),
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 4),
          child: SizedBox(
            height: 85,
            width: 450,
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Text(
                    'Cart',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: heightfit(16),
                    ),
                  ),
                ),
                SizedBox(width: widthfit(defaultPadding / 2)),
                Expanded(
                  flex: 5,
                  child: SizedBox(
                    height: heightfit(80),
                    child: (c.cartsku.length == 0.0)
                        ? CircleAvatar(
                            radius: heightfit(50),
                            backgroundColor: Theme.of(context).primaryColor,
                            child: Text(
                              "kosong",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          )
                        : ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: c.cartsku.length,
                            itemBuilder: (context, index) => SizedBox(
                                  height: heightfit(70),
                                  width: widthfit(50),
                                  child: FittedBox(
                                    child: Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Stack(
                                        children: [
                                          buildCardItem(index),
                                          Positioned(
                                            bottom: 0,
                                            right: 0,
                                            child: Container(
                                              height: 100.0,
                                              width: 100,
                                              decoration: BoxDecoration(
                                                  color: warnas(c.cartsku[index]
                                                          .color[0])
                                                      .withOpacity(1),
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  20),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  20),
                                                          topLeft:
                                                              Radius.circular(
                                                                  20),
                                                          topRight:
                                                              Radius.circular(
                                                                  20)),
                                                  // border: Border.all(color: kTextColor.withOpacity(.8), width: .2),
                                                  boxShadow: [
                                                    BoxShadow(
                                                        blurRadius: 10,
                                                        offset: Offset(1, 2),
                                                        color: Colors.black
                                                            .withOpacity(.2))
                                                  ]),
                                              child: Center(
                                                child: Text(
                                                  c.cartsku[index].quantity
                                                      .toString(),
                                                  // widget
                                                  //     .shopItems[index].quantity
                                                  //     .toString(),
                                                  style: TextStyle(
                                                      fontSize: 40,
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                )),
                  ),
                ),
                // Expanded(flex: 1, child: SizedBox(width: 40)),
                // SizedBox(width: 12),
                Expanded(
                  flex: 1,
                  child: FittedBox(
                    child: SizedBox(
                      height: 45,
                      width: 45,
                      child: ElevatedButton(
                        // onTap:
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.all(1),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          elevation: 0,
                        ),
                        onPressed: () {
                          // setState(() {});
                          // widget.pc2.open();
                        },
                        child: Padding(
                          padding: EdgeInsets.all(defaultPadding / 5),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                flex: 3,
                                child: Icon(
                                  Icons.shopping_bag_outlined,
                                  size: 25,
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Text(
                                  "${dataProductsObj.map((element) => element.quantity).toList().reduce((value, current) => value + current)}",
                                  style: TextStyle(fontSize: 10),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget buildCardItem(int index) => Padding(
        padding: EdgeInsets.symmetric(vertical: defaultPadding),
        child: Container(
          decoration: BoxDecoration(
              color: warnas(c.cartsku[index].color[0]),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20)),
              // border: Border.all(color: kTextColor.withOpacity(.8), width: .2),
              boxShadow: [
                BoxShadow(
                    blurRadius: 10,
                    offset: Offset(-7, 7),
                    color: warnas(c.cartsku[index].color[0]).withOpacity(.2))
              ]),
          child: ElevatedButton(
            onPressed: () {
              c.produkku.value = c.cartsku[index];
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BodyDetails(),
                  ));
            },
            style: ElevatedButton.styleFrom(
                padding: EdgeInsets.all(1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                elevation: 0,
                backgroundColor: warnas(c.cartsku[index].color[0])),
            child: Container(
              margin: EdgeInsets.only(top: defaultPadding),
              height: 260.0,
              width: 200,
              child: Stack(alignment: Alignment.bottomCenter, children: [
                Container(
                  margin: EdgeInsets.only(top: 70),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)),
                  ),
                ),
                Column(
                  // crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      flex: 8,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Hero(
                          tag: Tags.imageCart(c.cartsku[index].img),
                          child: Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(c.cartsku[index].img),
                                fit: BoxFit.contain,
                              ),
                              borderRadius: BorderRadius.circular(
                                  sPrimaryBorderRadius - 5),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ]),
            ),
          ),
        ),
      );

  Widget dragHandle() {
    return GestureDetector(
      onTap: togglePanel,
      child: Container(
        height: 5,
        width: 30,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
          color: Colors.grey.shade400,
        ),
      ),
    );
  }

  void togglePanel() {
    // enum  panelState;
    if (widget.pc2.isPanelOpen == true) {
      // widget.pc2.close();
      // PanelState.CLOSED;
      print("Pannel Open");
      // print(widget.pc2.panelState.context);
    } else {
      print("Pannel Close");
      widget.pc2.open();
      // PanelState.OPEN;

      // print("pppppp ${widget.pc2.isAttached}");
    }
  }
}
