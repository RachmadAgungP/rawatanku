import 'package:rawatt/components/card_img.dart';
import 'package:rawatt/constants.dart';
// import 'package:rawatt/model/product/tags.dart';

import 'package:flutter/material.dart';

class CardProductku extends StatelessWidget {
  final Color tema;
  final Color? tema2;
  final String image;
  const CardProductku({
    super.key,
    // @required this.cartProducts,
    required this.tema,
    required this.image,
    this.tema2,
  });

  // final List<Product> cartProducts;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: 60,
      child: FittedBox(
        child: Container(
          decoration: BoxDecoration(
              color: tema,
              borderRadius: BorderRadius.all(Radius.circular(20)),
              // border: Border.all(color: kTextColor.withOpacity(.8), width: .2),
              boxShadow: [
                BoxShadow(
                    blurRadius: 10,
                    offset: Offset(-7, 7),
                    color: tema.withOpacity(.2))
              ]),
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
                padding: EdgeInsets.all(1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                elevation: 0,
                backgroundColor: tema),
            child: Container(
              margin: EdgeInsets.only(top: defaultPadding),
              height: 160.0,
              width: 140,
              child: Stack(alignment: Alignment.bottomCenter, children: [
                Container(
                  margin: EdgeInsets.only(top: 70),
                  decoration: BoxDecoration(
                    color: tema2 ?? Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                ),
                Column(
                  // crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      flex: 8,
                      child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: defaultPadding / 2),
                          child: ImgOnline(image, image)
                          // Container(
                          //   decoration: BoxDecoration(
                          //     image: DecorationImage(
                          //       image: AssetImage(image),
                          //       fit: BoxFit.contain,
                          //     ),
                          //     borderRadius:
                          //         BorderRadius.circular(sPrimaryBorderRadius - 5),
                          //   ),
                          // ),
                          ),
                    ),
                  ],
                ),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
