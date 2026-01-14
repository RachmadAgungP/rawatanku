import 'package:rawatt/components/daun.dart';
import 'package:rawatt/components/BG.dart';
import 'package:rawatt/constants.dart';
import 'package:flutter/material.dart';

import 'package:rawatt/model/Profil/profil_data.dart';

class Sejarah extends StatefulWidget {
  const Sejarah({super.key});

  @override
  _SejarahState createState() => _SejarahState();
}

class _SejarahState extends State<Sejarah> {
  // initialize WebScraper by passing base url of website

  // Response of getElement is always List<Map<String, dynamic>>
  // List<Map<String, dynamic>> title;
  // List<Map<String, dynamic>> subtitle;
  List<Map<String, Object>> sejarahs = sejarah;
  List<String> sejarahss =
      (sejarah[0]["penjelas"] as List<dynamic>).cast<String>();
  // void fetchProducts() async {
  //   // Loads web page and downloads into local state of library
  //   if (await webScraper.loadWebPage('/page/sejarah-perusahaan')) {
  //     setState(() {
  //       title = webScraper.getElement('h1', ['class']);
  //       // subtitle = webScraper.getElement('p.MsoNormal', ['class']);
  //       penjelasan = webScraper
  //           .getElement('div.pt-2 >div.mt-4.page-content > p', ['class']);
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
        body: SafeArea(
            child: sejarahs[0] == null
                ? Center(
                    child:
                        CircularProgressIndicator(), // Loads Circular Loading Animation
                  )
                : ListView(
                    children: [
                      Stack(
                        children: [
                          BackgroundShop(
                              bolimages: false,
                              flex1: 140,
                              flex2: 190,
                              warnaBG1: Colors.white,
                              warnaBG2: Colors.white,
                              topRights: 30,
                              topLefts: 30,
                              bottomRights: 0,
                              bottomLefts: 0,
                              images: ""),
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
                                          text: "${sejarahs[0]['title']}\n",
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white),
                                        ),
                                        TextSpan(
                                          text: "PUPUKU",
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
                                    height: 180,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      // color: Colors.white,
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(20),
                                          bottomRight: Radius.circular(20),
                                          topLeft: Radius.circular(20),
                                          topRight: Radius.circular(20)),
                                      // border:
                                      //     Border.all(color: kTextColor.withOpacity(.8), width: .2)
                                    ),
                                    // padding: EdgeInsets.all(defaultPadding),
                                    child: Image.asset(
                                      "assets/images/perusahaan/petrokimia.png",
                                      fit: BoxFit.contain,
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
                                            Daun(number: false, i: 0),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              "${sejarahs[0]['title']}",
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
                                Daun(number: false, i: 1),
                                for (var i = 1; i < sejarahss.length; i++)
                                  Padding(
                                    padding: EdgeInsets.only(
                                        top: defaultPadding / 2),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          flex: 9,
                                          child: Text(
                                            sejarahss[i],
                                            textAlign: TextAlign.justify,
                                            style: TextStyle(
                                                color: Colors.black87),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                Image.asset(
                                  "assets/images/perusahaan/sejarah.jpg",
                                  fit: BoxFit.cover,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  )

            // ListView.builder(
            //     itemCount: penjelasan.length,
            //     itemBuilder: (BuildContext context, int index) {
            //       // Attributes are in the form of List<Map<String, dynamic>>.
            //       Map<String, dynamic> attributes =
            //           penjelasan[index]['title'];
            //       return Text(attributes[index]);
            //     }))),
            ));
  }

  // @override
  // void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  //   super.debugFillProperties(properties);
  //   properties.add(IterableProperty<Map<String, Object>>('sejarah', sejarah));
  // }
}
