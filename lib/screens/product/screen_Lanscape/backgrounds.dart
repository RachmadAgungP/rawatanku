import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:measured_size/measured_size.dart';
import 'package:rawatt/components/tema_Page.dart';
import 'package:rawatt/constants.dart';
import 'package:rawatt/model/data_.dart';
import 'package:rawatt/screens/details/cart_page/cart_Page.dart';
import 'package:rawatt/screens/home/screen_Lanscape/component.dart';
import 'package:rawatt/screens/product/components/components.dart';
import 'package:rawatt/size_config.dart';
import 'package:flutter/material.dart';
import '../../convert/component/inisialisasi_var.dart';
import '../../home/screen_Lanscape/main_content.dart';

class WideLayoutProduct extends StatelessWidget {
  const WideLayoutProduct({super.key});

  @override
  Widget build(BuildContext context) {
    List selectedperusahaanList = perusahaan;
    return Center(
      child: BackgraundProduct(
        onStateChange: () {},
      ),
    );
  }
}

class BackgraundProduct extends StatefulWidget {
  const BackgraundProduct({
    super.key,
    required this.onStateChange,
  });

  final Function() onStateChange;

  @override
  _BackgraundProductState createState() => _BackgraundProductState();
}

class _BackgraundProductState extends State<BackgraundProduct> {
  @override
  Widget build(BuildContext context) {
    return BackgraundLanscape(
      widgets: Row(
        children: [
          // Flexible(
          //   fit: FlexFit.tight,
          //   flex: 1,
          //   child: ContentLeft(
          //     widgets: TentangPerusahaan(
          //         heights: heightfit(460),
          //         scrollDirection: Axis.vertical,
          //         selectedperusahaanList: perusahaan),
          //   ),
          // ),
          Flexible(
            fit: FlexFit.tight,
            flex: 5,
            child: Container(
              margin: EdgeInsets.symmetric(
                  horizontal: defaultPadding, vertical: defaultPadding / 1.5),
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
                    bottomLeft: Radius.circular(10),
                    topRight: Radius.circular(20),
                    bottomRight: Radius.circular(5),
                  )),
              child: Row(
                children: [
                  Expanded(
                      flex: 3,
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
                          padding: EdgeInsets.all(heightfit(defaultPadding)),
                          child: Column(
                            children: [
                              Flexible(
                                flex: 5,
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
                                                fontSize: heightfit(36),
                                                fontWeight: FontWeight.bold),
                                            // more: false,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 9,
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
                  Expanded(
                    flex: 8,
                    child: Column(
                      children: [
                        Flexible(
                            flex: 2,
                            fit: FlexFit.loose,
                            // fit: FlexFit.tight,
                            child: Padding(
                              padding: EdgeInsets.only(
                                  bottom: heightfit(defaultPadding)),
                              child: LandingHome(
                                jenisTema: 1,
                                title: "Rawatan",
                                judul: "Bertani Bersama Kami",
                                penjelas:
                                    "Rawatan memberikan kemudahan untuk Para Tani.",
                                image: "assets/images/splash_1.png",
                                tema: Colors.black38,
                              ),
                            )),
                        Flexible(
                            flex: 3,
                            fit: FlexFit.loose,
                            child: Container(
                              decoration: BoxDecoration(
                                  // color: Colors.green.shade100,
                                  // boxShadow: [
                                  //   BoxShadow(
                                  //     offset: Offset(-5, 9),
                                  //     blurRadius: 20,
                                  //     color:
                                  //         Colors.black45.withOpacity(.3),
                                  //   )
                                  // ],
                                  borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(5),
                                bottomLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                                bottomRight: Radius.circular(5),
                              )),
                              padding:
                                  EdgeInsets.only(bottom: defaultPadding / 2),
                              child: SingleChildScrollView(
                                child: Products(
                                  crossAxisCounts: 6,
                                  dataProduk: filterdataByMenuRawatan(
                                      c.indexMenuRawatan.value.toString()),
                                  todetail: true,
                                  onChangeState: (DataProducts) {},
                                ),
                              ),
                            )),
                      ],
                    ),
                  ),
                  Expanded(
                      flex: 3,
                      child: Wkonverter(
                        onStateChange: () {
                          setState(() {});
                        },
                      )),
                ],
              ),
            ),
          ),
        ],
      ),
      key: Key("s"),
    );
  }
}
