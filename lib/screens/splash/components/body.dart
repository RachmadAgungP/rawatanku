import 'package:rawatt/components/default_button.dart';
import 'package:rawatt/constants.dart';
import 'package:rawatt/screens/home/home_screen.dart';
import 'package:rawatt/screens/splash/components/splash_content.dart';
import 'package:rawatt/size_config.dart';
import 'package:flutter/material.dart';

import '../../../model/MenuRawatan/mdl_MenuRawatan.dart';
import '../../convert/component/inisialisasi_var.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentPage = 0;
  List<Map<String, String>> splashData = [
    {
      "text":
          "Selamat datang di Rawatan. Let's Farm!\nHitung kebutuan pupukmu dengan kalkulator pertanian",
      "image": 'assets/images/splash_1.png'
    },
    // {
    //   "text": "Ayo bertani untuk menjaga ketahanan pangan Bersama Produk Kami",
    //   "image": "assets/images/splash_2.png"
    // },
    {
      "text":
          "Kami Akan Memandu Kalian dalam bertani dengan Kalkulator pertanian yang menghemat biaya",
      "image": "assets/images/splash_3.png"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Stack(
          children: [
            Container(
              height: SizeConfig.screenHeight!,
              width: SizeConfig.screenWidth!,
              color: c.palette_product.value[4],
            ),
            // Container(
            //   decoration: BoxDecoration(
            //       image: DecorationImage(
            //           alignment: Alignment.bottomCenter,
            //           image: AssetImage("assets/images/bgi.jpg"),
            //           fit: BoxFit.fitHeight)),
            // ),

            Padding(
              padding: EdgeInsets.symmetric(vertical: defaultPadding),
              child: Column(
                children: [
                  Expanded(
                    flex: 5,
                    child: PageView.builder(
                        onPageChanged: (value) {
                          setState(() {
                            currentPage = value;
                          });
                        },
                        itemCount: 1,
                        itemBuilder: (context, index) => Padding(
                              padding: const EdgeInsets.all(18.0),
                              child: SplashContent(
                                key: Key("a"),
                                image: "assets/images/logo.png",
                                text: "Rawatlah apa yang masih jadi milikmu",
                              ),
                            )),
                  ),
                  Expanded(
                      flex: 1,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: defaultPadding,
                            vertical: defaultPadding),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(splashData.length,
                              (index) => buildDot(index: index)),
                        ),
                      )),
                  Expanded(
                    flex: 1,
                    child: buildButtonSplash(context),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Row buildButtonSplash(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          height: heightFlex(SizeConfig.orientation!, 1.5, 14),
          padding: EdgeInsets.symmetric(horizontal: defaultPadding),
          child: ElevatedButton(
            // shape:
            //     RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            // color: kPrimaryColor,
            style: ButtonStyle(),
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) {
                return HomeScreen();
              }));
            },
            child: Text(
              "Next",
              style: TextStyle(fontSize: sT20, color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }

  AnimatedContainer buildDot({int? index}) {
    return AnimatedContainer(
      duration: kAnimationDuration,
      margin: EdgeInsets.only(right: 5),
      height: 6,
      width: currentPage == index ? 50 : 20,
      decoration: BoxDecoration(
        color: currentPage == index
            ? warnas(
                dataKategoriMenuRawatan[c.indexMenuRawatan.value].colorku[1])
            : Color(0xFFD8D8D8),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}
