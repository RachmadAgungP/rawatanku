import 'package:flutter/material.dart';
import 'package:rawatt/size_config.dart';
import 'package:supabase/supabase.dart';

import '../components/BG.dart';
import '../components/daun.dart';
import '../constants.dart';
import '../model/petani/mdl_Petani.dart';
import '../service/database_service.dart';
import 'convert/component/dialogku.dart';
import 'convert/component/inisialisasi_var.dart';

class profilePetani extends StatefulWidget {
  const profilePetani({super.key});

  @override
  State<profilePetani> createState() => _profilePetaniState();
}

class _profilePetaniState extends State<profilePetani> {
  List<DataPetani>? dataPetaniget;
  final DatabaseService _databaseKu = DatabaseService();

  @override
  void initState() {
    super.initState();
  }

  // ScrollController _childScrollController = ScrollController();
  final ScrollController _parentScrollController = ScrollController();
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
        body: ListView(
          // controller: _parentScrollController,
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
                  key: Key("1"),
                  warnaBG1: Colors.green,
                  images: '',
                ),
                Padding(
                  padding: EdgeInsets.all(defaultPadding),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(20),
                                  bottomRight: Radius.circular(20),
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20)),
                              // border:
                              //     Border.all(color: kTextColor.withOpacity(.8), width: .2)
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: 10,
                                    offset: const Offset(-1, 8),
                                    color: Colors.black54.withOpacity(.2))
                              ]),
                          padding: EdgeInsets.all(defaultPadding),
                          child: Image.asset(
                            "assets/images/logos.png",
                            fit: BoxFit.cover,
                          )),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: EdgeInsets.all(defaultPadding / 2),
                        child: Column(
                          children: [
                            Padding(
                              padding:
                                  EdgeInsets.only(bottom: defaultPadding / 2),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Daun(
                                      number: false, i: 0, key: Key("1")),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "rawatan",
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
                      FutureBuilder(
                          // future:_databaseKu.fetchDataPetanis(),
                          future: _databaseKu.fetchDataPetani(c.myUserId.value),
                          builder: (context, snapshot) {
                            // if (snapshot.hasData) {
                            //   final dataPetanie = snapshot.data;
                            // }
                            return (snapshot.connectionState ==
                                    ConnectionState.waiting)
                                ? const CircularProgressIndicator()
                                : (snapshot.data == null)
                                    ? SizedBox(
                                        height: SizeConfig.screenHeight! / 2,
                                        width: double.infinity,
                                        child: Transform.scale(
                                          scale: 0.98,
                                          child: CustomDialogBox(
                                              title: "Error",
                                              descriptions:
                                                  "Koneksi Internet Bermasalah",
                                              text: "ok",
                                              img: "assets/images/logos.png",
                                              chek: () {
                                                setState(() {
                                                  c.isdialogpesan.value ==
                                                      false;
                                                });
                                              }),
                                        ))
                                    : Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: snapshot.data.isEmpty
                                            ? const Center(
                                                child:
                                                    Text('Data Tidak Ada :)'),
                                              )
                                            : NotificationListener(
                                                onNotification:
                                                    (ScrollNotification
                                                        notification) {
                                                  if (notification
                                                      is ScrollUpdateNotification) {
                                                    if (notification
                                                            .metrics.pixels ==
                                                        notification.metrics
                                                            .maxScrollExtent) {
                                                      debugPrint(
                                                          'Reached the bottom');
                                                      _parentScrollController.animateTo(
                                                          _parentScrollController
                                                              .position
                                                              .maxScrollExtent,
                                                          duration:
                                                              const Duration(
                                                                  seconds: 1),
                                                          curve: Curves.easeIn);
                                                    } else if (notification
                                                            .metrics.pixels ==
                                                        notification.metrics
                                                            .minScrollExtent) {
                                                      debugPrint(
                                                          'Reached the top');
                                                      _parentScrollController.animateTo(
                                                          _parentScrollController
                                                                  .position
                                                                  .minScrollExtent +
                                                              (_parentScrollController
                                                                      .position
                                                                      .maxScrollExtent /
                                                                  4),
                                                          duration:
                                                              const Duration(
                                                                  seconds: 1),
                                                          curve: Curves.easeIn);
                                                    }
                                                  }
                                                  return true;
                                                },
                                                child: SizedBox(
                                                  height: heightfit(500),
                                                  width: double.infinity,
                                                  child: ListView.builder(
                                                    controller:
                                                        _parentScrollController,
                                                    padding: EdgeInsets.zero,
                                                    // reverse: true,
                                                    itemCount: Map.of(List.of(
                                                            snapshot.data)[0])
                                                        .length,
                                                    itemBuilder: (context, i) {
                                                      return Row(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Flexible(
                                                            flex: 2,
                                                            fit: FlexFit.loose,
                                                            child: Daun(
                                                              number: true,
                                                              i: i,
                                                              key: Key("a"),
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                            width: 10,
                                                          ),
                                                          Expanded(
                                                            flex: 11,
                                                            child: Text(
                                                              "${Map.of(List.of(snapshot.data)[0]).keys.toList()[i]} : ${Map.of(List.of(snapshot.data)[0]).values.toList()[i]}",
                                                              textAlign:
                                                                  TextAlign
                                                                      .justify,
                                                              style: const TextStyle(
                                                                  color: Colors
                                                                      .black87),
                                                            ),
                                                          ),
                                                        ],
                                                      );
                                                    },
                                                  ),
                                                ),
                                              ),
                                      );
                          }),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}
