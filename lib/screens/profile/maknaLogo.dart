import 'dart:convert';

import 'package:rawatt/components/daun.dart';
import 'package:rawatt/components/BG.dart';
import 'package:rawatt/constants.dart';
import 'package:rawatt/model/Profil/profil_data.dart';
import 'package:rawatt/model/data_hargaPangan.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MaknaLogo extends StatefulWidget {
  const MaknaLogo({super.key});

  @override
  _MaknaLogoState createState() => _MaknaLogoState();
}

class DatahargaPangan {
  List<dynamic> dataHargaPangan;

  DatahargaPangan(this.dataHargaPangan);
}

class _MaknaLogoState extends State<MaknaLogo> {
  // initialize WebScraper by passing base url of website
  // final webScraper = WebScraper('https://petrokimia-gresik.com/');

  // Response of getElement is always List<Map<String, dynamic>>
  // List<Map<String, dynamic>> title;
  // List<Map<String, dynamic>> subtitle;
  List<Map<String, dynamic>> maknaLogos = maknaLogo;
  List<String> maknaLogoss =
      (maknaLogo[0]["penjelas"] as List<dynamic>).cast<String>();
  // void fetchProducts() async {
  //   // Loads web page and downloads into local state of library
  //   if (await webScraper.loadWebPage('/page/makna-logo')) {
  //     setState(() {
  //       title = webScraper.getElement('h1', ['class']);
  //       subtitle = webScraper.getElement('p.MsoNormal', ['class']);
  //       penjelasan = webScraper.getElement('ol > li ', ['class']);
  //     });
  //   }
  // }

  // @override
  // void initState() {
  //   super.initState();

  //   // Requesting to fetch before UI drawing starts
  //   fetchProducts();
  // }

  @override
  Widget build(BuildContext context) {
    print(maknaLogo[0]["title"]);
    // Object? penjelas = maknaLogo[0]["penjelas"];
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          // actions: [
          //   Padding(
          //     padding:  EdgeInsets.all(8.0),
          //     child: Akunku(),
          //   ),
          // ],
          toolbarHeight: 40,
          backgroundColor: Colors.green,
          elevation: 0,
        ),
        body: maknaLogo[0]["title"] == null
            ? Center(
                child:
                    CircularProgressIndicator(), // Loads Circular Loading Animation
              )
            : ListView(
                children: [
                  Stack(
                    children: [
                      const BackgroundShop(
                        bolimages: false,
                        flex1: 140,
                        flex2: 190,
                        warnaBG2: Colors.white,
                        topRights: 20,
                        topLefts: 20,
                        bottomRights: 0,
                        bottomLefts: 0,
                        key: Key("a"),
                        warnaBG1: Colors.green,
                        images: '',
                      ),
                      Padding(
                        padding: EdgeInsets.all(defaultPadding),
                        child: Column(
                          children: [
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Column(
                                children: [
                                  RichText(
                                      text: TextSpan(children: [
                                    TextSpan(
                                      text: "${maknaLogo[0]["title"]}\n",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                    TextSpan(
                                      text: "Rawatan",
                                      style: TextStyle(
                                        fontSize: 12,
                                        // color: Colors.white
                                      ),
                                    )
                                  ]))
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                                width: double.infinity,
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
                                          color: Colors.black54.withOpacity(.2))
                                    ]),
                                padding: EdgeInsets.all(defaultPadding),
                                child: Image.asset(
                                  "assets/images/logos.png",
                                  fit: BoxFit.cover,
                                )),
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: EdgeInsets.all(defaultPadding / 2),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                        bottom: defaultPadding / 2),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Daun(
                                          number: false,
                                          i: 0,
                                          key: Key("s"),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          "${maknaLogo[0]["title"]}",
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.blueGrey[900],
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    height: 3,
                                    width: double.infinity,
                                    color: kTextColor,
                                  ),
                                ],
                              ),
                            ),
                            for (var i = 1; i < maknaLogoss.length; i++)
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Flexible(
                                      flex: 2,
                                      fit: FlexFit.loose,
                                      child: Daun(
                                          number: true, i: i, key: Key("a")),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      flex: 11,
                                      child: Text(
                                        "${maknaLogoss[i]}",
                                        textAlign: TextAlign.justify,
                                        style: TextStyle(color: Colors.black87),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ));
  }
}
