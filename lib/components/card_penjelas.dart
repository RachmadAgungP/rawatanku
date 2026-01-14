import 'package:rawatt/constants.dart';

import 'package:flutter/material.dart';

import '../size_config.dart';

class CardpHs extends StatelessWidget {
  final int id;
  final String hasilAkhir;
  final double sizes;
  final String texts;
  final String title;
  final List multitext;
  final Color tema;
  final bool cardornot;
  final Widget cardCostume;
  final Widget widgetCostum;
  const CardpHs({
    super.key,
    required this.texts,
    required this.sizes,
    required this.hasilAkhir,
    required this.title,
    required this.multitext,
    required this.id,
    required this.tema,
    required this.cardornot,
    required this.cardCostume,
    required this.widgetCostum,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: heightfit(defaultPadding / 2),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(0),
              bottomRight: Radius.circular(20),
              topLeft: Radius.circular(20),
              topRight: Radius.circular(0)),
          boxShadow: [
            BoxShadow(
                blurRadius: 10,
                offset: Offset(-5, 5),
                color: tema.withOpacity(.2))
          ],
        ),
        child: Stack(
          children: [
            Container(
              height: heightfit(25),
              width: heightfit(30),
              alignment: Alignment.bottomRight,
              decoration: BoxDecoration(
                color: tema.withOpacity(.3),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(0),
                    bottomRight: Radius.circular(20),
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(0)),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              // left: 0,
              child: Container(
                height: heightfit(90),
                width: heightfit(100),
                decoration: BoxDecoration(
                    color: tema.withOpacity(.3),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(0),
                        bottomRight: Radius.circular(20),
                        topLeft: Radius.circular(90),
                        topRight: Radius.circular(0)),
                    // border:
                    //     Border.all(color: kTextColor.withOpacity(.8), width: .2)
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 10,
                          offset: Offset(-1, 8),
                          color: tema.withOpacity(.3))
                    ]),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: defaultPadding / 3),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      (cardornot == true)
                          ? Expanded(
                              flex: 3,
                              child: FittedBox(
                                child: cardCostume,
                              ),
                            )
                          : Expanded(
                              flex: 1,
                              child: Container(
                                height: heightfit(20),
                              ),
                            ),
                      SizedBox(
                        width: heightfit(defaultPadding),
                      ),
                      Expanded(
                        flex: 10,
                        child: (multitext.isEmpty)
                            ? SingleChildScrollView(
                                scrollDirection: Axis.vertical,
                                child: Text.rich(
                                  TextSpan(children: [
                                    TextSpan(
                                      text: title,
                                      style: TextStyle(
                                          color: tema,
                                          fontSize: sizes + 7,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    TextSpan(
                                      text: texts,
                                      style: TextStyle(
                                          color: tema, fontSize: sizes - 2),
                                    )
                                  ]),
                                ),
                              )
                            : SingleChildScrollView(
                                scrollDirection: Axis.vertical,
                                child: Text.rich(TextSpan(children: [
                                  TextSpan(
                                    text: title,
                                    style: TextStyle(
                                        color: tema,
                                        fontSize: sizes,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  for (var i = 0; i < multitext.length; i++)
                                    TextSpan(
                                      text: (title == "Penjelas : ")
                                          ? "${multitext[i].values.elementAt(0)}"
                                          : (id > 17)
                                              ? (multitext[i]
                                                      .values
                                                      .elementAt(0) is String)
                                                  ? "${multitext[i].values.elementAt(0)}"
                                                  : (i == multitext.length - 1)
                                                      ? "${multitext[i].values.elementAt(0).toStringAsFixed(1)} gr ${multitext[i].keys.elementAt(0)} / Per Pohon"
                                                      : "${multitext[i].values.elementAt(0).toStringAsFixed(1)} gr ${multitext[i].keys.elementAt(0)} + "
                                              : (multitext[i]
                                                      .values
                                                      .elementAt(0) is String)
                                                  ? "${multitext[i].values.elementAt(0)}"
                                                  : (i == multitext.length - 1)
                                                      ? "${multitext[i].values.elementAt(0).toStringAsFixed(1)} Kg ${multitext[i].keys.elementAt(0)} "
                                                      : "${multitext[i].values.elementAt(0).toStringAsFixed(1)} Kg ${multitext[i].keys.elementAt(0)} + ",
                                      style: TextStyle(
                                          color: tema, fontSize: sizes - 2),
                                    )
                                ])),
                              ),
                      ),
                    ],
                  ),
                  widgetCostum,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
