import 'package:rawatt/components/card_img.dart';
import 'package:rawatt/constants.dart';
import 'package:flutter/material.dart';
import 'package:rawatt/model/MenuRawatan/mdl_MenuRawatan.dart';

import '../screens/convert/component/inisialisasi_var.dart';

class CardListProduct extends StatelessWidget {
  const CardListProduct({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // [Color(0xffffffff), Color(0x3dffffff), Color(0x73000000), Color(0xdd000000), Color(0xff000000)]
    // [Color(0xffa5a4a3), Color(0xff444340), Color(0xff2c2c2c), Color(0xff211f1d), Color(0xff1b1919), Color(0xff0b0a0a)]
    // [Color(0xfffcfcfc), Color(0xfff9f9f9), Color(0xffe9e9e8), Color(0xff7eae91), Color(0xff2d824c), Color(0xff456a49)]
    // print(c.palette_product.value);
    return FittedBox(
      child: Container(
        height: 100,
        width: 400,
        padding: EdgeInsets.all(defaultPadding),
        decoration: BoxDecoration(
            color: warnas(
                dataKategoriMenuRawatan[c.indexMenuRawatan.value].colorku[0]),
            boxShadow: [
              BoxShadow(
                offset: const Offset(-7, 7),
                blurRadius: 10,
                color: Colors.black.withOpacity(.5),
              )
            ],
            borderRadius: BorderRadius.circular(20)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
                flex: 2,
                child: ImgOnline(
                    dataKategoriMenuRawatan[c.indexMenuRawatan.value].img,
                    dataKategoriMenuRawatan[c.indexMenuRawatan.value].img)
                // Container(
                //   padding: EdgeInsets.all(defaultPadding),
                //   decoration: BoxDecoration(
                //       image: DecorationImage(
                //
                //           // image: NetworkImage("assets/images/sawah1.jpg")
                //           image: AssetImage(dataKategoriMenuRawatan[c.indexMenuRawatan.value].img)),
                //       borderRadius: BorderRadius.circular(5)),
                // ),
                ),
            Expanded(
              flex: 5,
              child: FittedBox(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: defaultPadding),
                  child: RichText(
                    textAlign: TextAlign.left,
                    text: TextSpan(children: [
                      TextSpan(
                        text:
                            "${dataKategoriMenuRawatan[c.indexMenuRawatan.value].tagline1}\n",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: warnas(dataKategoriMenuRawatan[
                                    c.indexMenuRawatan.value]
                                .colorku[1]),
                            fontSize: 20),
                      ),
                      TextSpan(
                          text:
                              dataKategoriMenuRawatan[c.indexMenuRawatan.value]
                                  .tagline2,
                          style: TextStyle(
                              fontSize: 18,
                              color: warnas(dataKategoriMenuRawatan[
                                      c.indexMenuRawatan.value]
                                  .colorku[1])))
                    ]),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                padding: EdgeInsets.all(defaultPadding / 2),
                decoration: BoxDecoration(
                    color: warnas(
                        dataKategoriMenuRawatan[c.indexMenuRawatan.value]
                            .colorku[0]),
                    borderRadius: BorderRadius.circular(10)),
                // child: Icon(
                //   Icons.arrow_forward_ios_rounded,
                //   color: warnas(dataKategoriMenuRawatan[c.indexMenuRawatan.value].colorku[1])!,
                // ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
