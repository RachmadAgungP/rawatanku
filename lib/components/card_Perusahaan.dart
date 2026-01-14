import 'package:rawatt/components/card_img.dart';
import 'package:rawatt/constants.dart';
import 'package:rawatt/screens/details/details_screen.dart';
// import 'package:rawatt/size_config.dart';
import 'package:flutter/material.dart';

class CardPerusahaan extends StatelessWidget {
  final String img;
  final String logo;
  final String title;
  final String penjelas;
  const CardPerusahaan({
    super.key,
    required this.img,
    required this.logo,
    required this.title,
    required this.penjelas,
  });

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Container(
        height: 250,
        width: 300,
        // color: Colors.amberAccent,
        margin: EdgeInsets.symmetric(horizontal: defaultPadding),
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, "/sejarah");
          },
          style: ElevatedButton.styleFrom(
              padding: EdgeInsets.all(1),
              shadowColor: Colors.black,
              // padding: EdgeInsets.only(top: 60),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              elevation: 0,
              backgroundColor: Colors.white),
          child: Stack(
            children: [
              Container(
                // height: 130,
                alignment: Alignment.bottomCenter,
                margin: EdgeInsets.only(top: 80),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 20,
                        offset: Offset(-5, 5),
                        color: Colors.black38.withOpacity(.2))
                  ],
                ),
              ),
              Column(
                children: [
                  Flexible(flex: 7, child: ImgOnline(img, img)),
                  Flexible(
                    flex: 2,
                    child: Padding(
                      padding: EdgeInsets.only(
                          right: defaultPadding,
                          left: defaultPadding,
                          bottom: defaultPadding),
                      child: Row(
                        children: [
                          Expanded(flex: 1, child: ImgOnline(logo, logo)),
                          SizedBox(
                            width: defaultPadding / 2,
                          ),
                          Expanded(
                            flex: 5,
                            child: FittedBox(
                              child: RichText(
                                  text: TextSpan(children: [
                                TextSpan(
                                    text: '$title\n',
                                    style: TextStyle(
                                        color: Colors.green,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold)),
                                TextSpan(
                                    text: penjelas,
                                    style: TextStyle(
                                      color: Colors.black54,
                                      fontSize: 12,
                                    )),
                              ])),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
