import 'package:rawatt/constants.dart';
import 'package:flutter/material.dart';

import '../size_config.dart';

class CardAtom extends StatelessWidget {
  final String simbolAtom;
  final String nomerAtom;
  final String massaAtom;
  final String namaAtom;
  final String ionisasiEnergi;
  final Color warna;
  const CardAtom({
    super.key,
    required this.simbolAtom,
    required this.nomerAtom,
    required this.massaAtom,
    required this.namaAtom,
    required this.ionisasiEnergi,
    required this.warna,
  });

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Container(
        padding: EdgeInsets.all(heightfit(defaultPadding / 2.5)),
        width: heightfit(90),
        height: heightfit(100),
        // margin: EdgeInsets.only(bottom: 0, top: 0),
        decoration: BoxDecoration(
            color: warna,
            borderRadius:
                BorderRadius.circular(heightfit(sPrimaryBorderRadius)),
            // image: DecorationImage(
            //     image: AssetImage(image), fit: BoxFit.cover),
            boxShadow: [
              BoxShadow(
                offset: Offset(-6, 7),
                blurRadius: 8,
                color: Colors.black26.withOpacity(.2),
              )
            ]),
        child: Column(
          children: [
            // massa atom
            Expanded(
              flex: 3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(massaAtom,
                            style: TextStyle(
                                fontSize: heightfit(sT10), color: kTextColor1)),
                        Text(ionisasiEnergi,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontSize: heightfit(sT8 - 2),
                                color: kTextColor1))
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(nomerAtom,
                        style: TextStyle(
                            fontSize: heightfit(sT16), color: kTextColor1)),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 5,
              child: Text(simbolAtom,
                  style: TextStyle(
                      fontSize: heightfit(sT26),
                      color: kTextColor1,
                      fontWeight: FontWeight.bold)),
            ),
            Expanded(
              flex: 2,
              child: Text(namaAtom,
                  textAlign: TextAlign.left,
                  style:
                      TextStyle(fontSize: heightfit(sT10), color: kTextColor1)),
            ),
          ],
        ),
      ),
    );
  }
}
