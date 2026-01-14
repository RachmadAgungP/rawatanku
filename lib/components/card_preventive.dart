import 'package:rawatt/components/card_atom.dart';
// import 'package:rawatt/size_config.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class IntensifikasiListCard extends StatelessWidget {
  final bool imgoratom;
  final String simbolAtom;
  final String nomerAtom;
  final String massaAtom;
  final String namaAtom;
  final String ionisasiEnergi;
  final Color warna;

  final String title;
  final String penjelas;
  final String image;
  final Function press;
  const IntensifikasiListCard({
    super.key,
    required this.title,
    required this.penjelas,
    required this.image,
    required this.press,
    required this.simbolAtom,
    required this.nomerAtom,
    required this.massaAtom,
    required this.namaAtom,
    required this.ionisasiEnergi,
    required this.warna,
    required this.imgoratom,
  });

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Container(
        height: 90,
        width: 240,
        margin: EdgeInsets.only(
          left: defaultPadding,
          // right: defaultPadding,

          // top: 5,
        ),
        // padding: EdgeInsets.only(bottom: defaultPadding / 2),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Colors.white.withOpacity(.5),
          // color: warna,s
          // gradient: LinearGradient(
          //     colors: [kPrimaryLightColor, Colors.green],
          //     begin: FractionalOffset(1.8, 0.01),
          //     end: FractionalOffset(0.8, 1.5)),
        ),
        child: Material(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Colors.white.withOpacity(0),
          child: InkWell(
            onTap: press(),
            borderRadius: BorderRadius.all(Radius.circular(10)),
            child: Stack(
              children: [
                Center(
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: 10,
                      // top: 10,
                      // bottom: 10,
                    ),
                    child: Container(
                      height: 100,
                      // width: heightfit(SizeConfig.screenWidth),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          gradient: LinearGradient(
                              colors: [kPrimaryLightColor, Colors.green],
                              begin: FractionalOffset(1.8, 0.01),
                              end: FractionalOffset(0.8, 1.5)),
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(-6, 7),
                              blurRadius: 5,
                              color: Colors.black45.withOpacity(.2),
                            )
                          ]),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 2,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 85, top: 10, right: 10),
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: RichText(
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                    text: TextSpan(children: [
                                      TextSpan(
                                          text: "$title\n",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                            fontSize: sT20,
                                          )),
                                      TextSpan(
                                          text: penjelas,
                                          style: TextStyle(
                                              fontSize: sT14,
                                              color: Colors.white70))
                                    ])),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  ConstrainedBox(
                                    constraints: BoxConstraints(minHeight: 20),
                                    child: Container(
                                      padding:
                                          EdgeInsets.all(defaultPadding / 2),
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(5),
                                            bottomLeft: Radius.circular(5),
                                            bottomRight: Radius.circular(5)),
                                        color: kTextColor.withOpacity(.5),
                                      ),
                                      child: Icon(Icons.arrow_forward_ios_sharp,
                                          size: 15, color: Colors.white),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                (imgoratom == true)
                    ? CardImage(
                        image: image,
                        key: null,
                      )
                    : CardAtom(
                        simbolAtom: simbolAtom,
                        nomerAtom: nomerAtom,
                        massaAtom: massaAtom,
                        namaAtom: namaAtom,
                        ionisasiEnergi: ionisasiEnergi,
                        warna: warna,
                        key: null,
                      )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CardImage extends StatelessWidget {
  final String image;
  const CardImage({
    super.key,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Container(
        // margin: EdgeInsets.all(defaultPadding),
        width: 90,
        height: 100,
        // margin: EdgeInsets.only(defaultPadding / 4),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(sPrimaryBorderRadius),
            // image:
            // DecorationImage(image: AssetImage(image), fit: BoxFit.fitHeight),
            boxShadow: [
              BoxShadow(
                offset: Offset(-6, 7),
                blurRadius: 5,
                color: Colors.black26.withOpacity(.2),
              )
            ]),
        child: Padding(
          padding: EdgeInsets.all(defaultPadding / 3),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(
              image,
              fit: BoxFit.fitHeight,
            ),
          ),
        ),
      ),
    );
  }
}
