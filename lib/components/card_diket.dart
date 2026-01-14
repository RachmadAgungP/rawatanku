import 'package:rawatt/constants.dart';
import 'package:rawatt/size_config.dart';
import 'package:flutter/material.dart';

class CardDiket extends StatelessWidget {
  final String tags, image, judul;
  final Widget varDiket;
  const CardDiket({
    super.key,
    required this.tema,
    required this.tags,
    required this.image,
    required this.judul,
    required this.varDiket,
  });

  final Color tema;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Center(
        child: Container(
          constraints: BoxConstraints.loose(Size.infinite),
          height: heightfit(350),
          width: (SizeConfig.orientation == Orientation.portrait)
              ? heightfit(SizeConfig.screenWidth!)
              : heightfit(SizeConfig.screenWidth!),
          margin: EdgeInsets.all(heightfit(defaultPadding)),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20)),
              // border:
              //     Border.all(color: kTextColor.withOpacity(.8), width: .2)
              boxShadow: [
                BoxShadow(
                    blurRadius: 10,
                    offset: Offset(-1, 8),
                    color: tema.withOpacity(.2))
              ]),
          child: Stack(
            children: [
              Container(
                height: heightfit(100),
                width: heightfit(150),
                decoration: BoxDecoration(
                  color: tema.withOpacity(.2),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(0),
                      bottomRight: Radius.circular(100),
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(0)),
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  height: heightfit(100),
                  width: heightfit(100),
                  decoration: BoxDecoration(
                    color: tema.withOpacity(.2),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(0),
                        bottomRight: Radius.circular(20),
                        topLeft: Radius.circular(100),
                        topRight: Radius.circular(0)),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(heightfit(defaultPadding / 2)),
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            flex: 10,
                            child: Image.asset(image),
                          ),
                          Expanded(
                            flex: 2,
                            child: Text(
                              judul,
                              style: TextStyle(
                                  color: kTextColor,
                                  fontSize: heightfit(sT16),
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      width: heightfit(defaultPadding / 2),
                    ),
                    Expanded(flex: 1, child: varDiket),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
