import 'dart:ui';

import 'package:rawatt/constants.dart';
// import 'package:rawatt/model/product/tags.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CardImgku extends StatelessWidget {
  final Widget conten;
  final Color tema;
  final String image;
  const CardImgku({
    super.key,
    // @required required this.cartProducts,
    required this.tema,
    required this.image,
    required this.conten,
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
            child: SizedBox(
              child: Stack(
                // fit: StackFit.expand,
                children: [
                  Imageku(
                    image: image,
                    key: null,
                  ),
                  // Image.asset(image, fit: BoxFit.cover),
                  ClipRRect(
                    borderRadius:
                        BorderRadius.circular(sPrimaryBorderRadius - 5),
                    // Clip it cleanly.
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                      child: Container(
                        color: Colors.white.withOpacity(0.2),
                        alignment: Alignment.center,
                        child: conten,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class PxL extends StatelessWidget {
  const PxL({
    super.key,
    required this.bol,
  });

  final String bol;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 160.0,
        width: 140,
        child: Center(
            child: (bol == "panjang")
                ? Tinggi(
                    text: true,
                    key: null,
                  )
                : Lebar(
                    text: true,
                    key: null,
                  )));
  }
}

class Tinggi extends StatelessWidget {
  const Tinggi({
    super.key,
    required this.text,
  });

  final bool text;

  @override
  Widget build(BuildContext context) {
    // bool text = true;
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: (text == false) ? 20 : 90,
            height: 100,
            child: Stack(
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 35.0),
                    child: (text == true)
                        ? RotatedBox(
                            quarterTurns: 3,
                            child: Text(
                              "panjang",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.blueGrey.shade900),
                            ),
                          )
                        : Container(),
                  ),
                ),
                Center(
                  child: FittedBox(
                      child: Container(
                    height: 150,
                    width: 4,
                    color: Colors.blueGrey.shade900,
                  )),
                ),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 4,
                        width: 20,
                        color: Colors.blueGrey.shade900,
                      ),
                      Container(
                        height: 4,
                        width: 20,
                        color: Colors.blueGrey.shade900,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Lebar extends StatelessWidget {
  const Lebar({
    super.key,
    required this.text,
  });

  final bool text;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RotatedBox(
                quarterTurns: 3,
                child: FittedBox(
                  child: SizedBox(
                    width: 20,
                    height: 90,
                    child: Stack(
                      children: [
                        Center(
                          child: FittedBox(
                              child: Container(
                            height: 150,
                            width: 4,
                            color: Colors.blueGrey.shade900,
                          )),
                        ),
                        Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: 4,
                                width: 20,
                                color: Colors.blueGrey.shade900,
                              ),
                              Container(
                                height: 4,
                                width: 20,
                                color: Colors.blueGrey.shade900,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          (text == true)
              ? Text(
                  "lebar",
                  style:
                      TextStyle(fontSize: 20, color: Colors.blueGrey.shade900),
                )
              : Container(),
        ],
      ),
    );
  }
}

class Luasku extends StatelessWidget {
  const Luasku({
    super.key,
  });

  // final Widget lebar;
  // final Widget tinggi;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 160.0,
        width: 140,
        child: Stack(
          children: [
            Positioned(
                top: defaultPadding + 14,
                right: 15,
                child: Tinggi(
                  text: false,
                  key: null,
                )),
            Positioned(
                top: defaultPadding + 6,
                right: 23,
                child: Lebar(text: false, key: null)),
            Center(
              child: Text(
                "L",
                style: TextStyle(fontSize: 40, color: Colors.blueGrey.shade900),
              ),
            ),
          ],
        ));
  }
}

class Imageku extends StatelessWidget {
  const Imageku({
    super.key,
    required this.image,
  });

  final String image;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160.0,
      width: 140,
      child: Container(
        alignment: Alignment.centerRight,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(image),
            fit: BoxFit.fill,
          ),
          borderRadius: BorderRadius.circular(sPrimaryBorderRadius - 5),
        ),
      ),
    );
  }
}

Widget ImgOnline(String local, String online) {
  return FutureBuilder(
    future: fetchImage(online),
    // Ganti dengan fungsi yang mengambil gambar Anda
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return Center(
          child: CircularProgressIndicator(
            color: Colors.green,
          ),
        );
      } else if (snapshot.hasError) {
        return Image.asset(
          local, // Ganti dengan path gambar error lokal Anda
          fit: BoxFit.fitWidth,
        );
      } else {
        return CachedNetworkImage(
          key: UniqueKey(),
          imageUrl: snapshot.data!,
          // Ganti dengan URL gambar yang berhasil diambil
          fit: BoxFit.contain,
        );
      }
    },
  );
}

Future<String> fetchImage(onl) async {
  final String onlineImageUrl = onl; // Ganti dengan URL gambar online Anda
  final response = await http.get(Uri.parse(onlineImageUrl));

  if (response.statusCode == 200) {
    return onlineImageUrl;
  } else {
    throw Exception(
        'Gagal mengambil gambar'); // Anda bisa mengganti pesan kesalahan sesuai kebutuhan
  }
}
