import 'package:flutter/material.dart';
import 'package:rawatt/size_config.dart';

import '../constants.dart';
import '../model/MenuRawatan/mdl_MenuRawatan.dart';
import '../model/dosis/mdl_dosisPengaplikasian.dart';
import '../model/jenisMesin/mdl_JenisMesin.dart';
import '../model/perusahaan/mdl_KatPerusahaan.dart';
import '../screens/convert/component/inisialisasi_var.dart';
import '../screens/convert/screens/dosis_pupuk_tanaman/dosis_pupuk_tanaman.dart';
import '../screens/home/screen_Portrait/layer2_home.dart';

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:rawatt/components/card_judulPetro.dart';
import 'package:rawatt/components/tema_Page.dart';
import 'package:rawatt/constants.dart';
import 'package:rawatt/size_config.dart';

List<KategoriPerusahaan> perusahaanListv = dataKategoriPerusahaan;
List<PengaplikasianDosisPupuk> rawatanListv = dataDosisPengaplikasianObj
    .where((element) =>
        element.id_MenuRawatan == c.indexMenuRawatan.value.toString())
    .toList();

class SearchKomoditiv extends StatefulWidget {
  final ValueChanged<String> onTextChanged;

  const SearchKomoditiv({super.key, required this.onTextChanged});
  @override
  _SearchKomoditiState createState() => _SearchKomoditiState();
}

class _SearchKomoditiState extends State<SearchKomoditiv> {
  final ScrollController _childController = ScrollController();

  // datakategorisubMenuRawatan
  //     .where((element) =>
  // element.id_MenuRawatan == widget.indexmenu.toString())
  //     .toList();
  List<KategorisubMenuRawatan> filteredKomoditi = [];
  int? selectedPerusahaanId;
  List<KategorisubMenuRawatan> komoditiList = datakategorisubMenuRawatan
      .where((element) =>
          element.id_MenuRawatan == c.indexMenuRawatan.value.toString())
      .toList();

  @override
  void dispose() {
    super.dispose();
    _childController.dispose();
  }

  void SearchKomoditiv(String query) {
    final suggestions = komoditiList.where((komoditi) {
      final komoditiName = komoditi.namaKomoditi.toLowerCase();
      final input = query.toLowerCase();
      return komoditiName.contains(input);
    }).toList();

    setState(() {
      filteredKomoditi = suggestions;
      widget.onTextChanged(query);
    });
  }

  void filterByPerusahaan(int? perusahaanId) {
    setState(() {
      selectedPerusahaanId = perusahaanId;
      filteredKomoditi = perusahaanId == null
          ? komoditiList
          : komoditiList.where((komoditi) {
              return rawatanListv.any((rawatan) =>
                  rawatan.idKomoditi == komoditi.id &&
                  rawatan.idPerusahaan == perusahaanId);
            }).toList();
    });
  }

  @override
  void initState() {
    super.initState();
    filteredKomoditi = komoditiList;
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: (ScrollNotification notification) {
        if (notification is ScrollEndNotification) {
          if (_childController.position.atEdge) {}
        }
        return false;
      },
      child: Column(
        children: [
          Titlesy(
            judul: "Fitur Kalkulator : ",
            more: true,
            links: "",
          ),
          SizedBox(
            height: SizeConfig.screenHeight! / 1.4,
            width: SizeConfig.screenWidth!,
            child: Padding(
              padding: EdgeInsets.all(defaultPadding / 1.5),
              child: Container(
                padding: EdgeInsets.all(defaultPadding / 8),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    transform: GradientRotation(17),
                    colors: <Color>[
                      warnas(dataKategoriMenuRawatan[c.indexMenuRawatan.value]
                          .colorku[0]),
                      warnas(dataKategoriMenuRawatan[c.indexMenuRawatan.value]
                          .colorku[0]),
                      warnas(dataKategoriMenuRawatan[c.indexMenuRawatan.value]
                          .colorku[2]),
                      warnas(dataKategoriMenuRawatan[c.indexMenuRawatan.value]
                          .colorku[2]),
                    ],
                    // Gradient from https://learnui.design/tools/gradient-generator.html
                    tileMode: TileMode.mirror,
                  ),
                  // color: warnas(dataKategoriMenuRawatan[widget.indexmenu].colorku[0]),
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
                ),
                child: Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    Column(
                      children: [
                        Flexible(
                          flex: 3,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                // color: warnas(dataKategoriMenuRawatan[widget.indexmenu].colorku[0]),
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(10),
                                    bottomRight: Radius.circular(10),
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10)),
                              ),
                              child: TextField(
                                onChanged: SearchKomoditiv,
                                decoration: InputDecoration(
                                  hintText: 'Cari Komoditi',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  prefixIcon: Icon(Icons.search),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Padding(
                            padding: EdgeInsets.all(defaultPadding),
                            child: SizedBox(
                                height: 70,
                                width: SizeConfig.screenWidth,
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: [
                                      Row(children: [
                                        ...rawatanListv
                                            .map((element) =>
                                                element.idPerusahaan)
                                            .toSet()
                                            .map((idPerusahaan) {
                                          final perusahaan =
                                              perusahaanListv[idPerusahaan];
                                          return Padding(
                                            padding: EdgeInsets.only(
                                                right: defaultPadding / 2),
                                            child: ChoiceChip(
                                              labelPadding:
                                                  EdgeInsets.symmetric(
                                                      vertical:
                                                          defaultPadding / 1.2),
                                              avatar:
                                                  Image.asset(perusahaan.img),
                                              label: Text(""),
                                              selected: selectedPerusahaanId ==
                                                  perusahaan.id,
                                              onSelected: (selected) {
                                                filterByPerusahaan(selected
                                                    ? perusahaan.id
                                                    : null);
                                              },
                                            ),
                                          );
                                        }),
                                      ]),
                                    ],
                                  ),
                                )

                                // ListView.builder(
                                //   scrollDirection: Axis.horizontal,
                                //   itemCount:  rawatanList.map((element) => element.idPerusahaan).toList().toSet().length,
                                //
                                //   itemBuilder: (context, index) {
                                //     final perusahaan = perusahaanListv[rawatanList.map((element) => element.idPerusahaan).toList().toSet().toList()[index]];
                                //     return Padding(
                                //       padding: EdgeInsets.only(right: defaultPadding/2),
                                //       child:
                                //
                                //       ChoiceChip(
                                //         labelPadding: EdgeInsets.symmetric(vertical: defaultPadding/1.2),
                                //         avatar: Image.asset(perusahaan.img),
                                //         label: Text(""),
                                //         selected: selectedPerusahaanId == perusahaan.id,
                                //         onSelected: (selected) {
                                //           filterByPerusahaan(selected ? perusahaan.id : null);
                                //         },
                                //       ),
                                //     );
                                //   },
                                // ),
                                ),
                          ),
                        ),
                        Expanded(
                          flex: 9,
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: defaultPadding,
                                right: defaultPadding,
                                bottom: defaultPadding),
                            child: ListView.builder(
                              padding: EdgeInsets.zero,
                              controller: _childController,
                              itemCount: filteredKomoditi.length,
                              itemBuilder: (context, index) {
                                final komoditi = filteredKomoditi[index];
                                return Padding(
                                  padding: EdgeInsets.all(defaultPadding / 2),
                                  child: Container(
                                    decoration: const BoxDecoration(
                                      color: Colors.white,
                                      // color: warnas(dataKategoriMenuRawatan[widget.indexmenu].colorku[0]),
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(10),
                                          bottomRight: Radius.circular(10),
                                          topLeft: Radius.circular(10),
                                          topRight: Radius.circular(10)),
                                    ),
                                    child: ListTile(
                                      leading: Image.asset(komoditi.img),
                                      title: Text(komoditi.namaKomoditi),
                                      subtitle: Text(komoditi.id_MenuRawatan),
                                      trailing: Icon(komoditi.icon),
                                      onTap: () {
                                        // Handle tap on Komoditi item
                                        // Navigator.push(
                                        //   context,
                                        //   MaterialPageRoute(
                                        //     builder: (context) =>
                                        //         DetailKomoditiScreen(komoditi: komoditi),
                                        //   ),
                                        // );

                                        Navigator.push(context,
                                            MaterialPageRoute(
                                                builder: (context) {
                                          return DosisPupukTanamanbuah(
                                            indexsubmenu: komoditi.id,
                                            indexmenu: c.indexMenuRawatan.value,
                                          );
                                        }));

                                        if (c.indexMenuRawatan.value == 1) {
                                          c.indexsubMenuRawatan.value =
                                              komoditi.id;
                                          showDialog(
                                              context: context,
                                              barrierDismissible: false,
                                              builder: (BuildContext context) {
                                                return AlertDialog(
                                                  title: Center(
                                                      child: Text(
                                                    'Pengaplikasian',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 30),
                                                  )),
                                                  content: Text(
                                                    "Perhitungan ini menggunakan Perbandingan yang sudah ditetapkan dari perusahaan per hektar atau per pohon, jadi dengan menggunakan ini kalian harus tetap memperhatikan dosis yang sesuai dengan keperluan tani kalian.",
                                                    style: TextStyle(
                                                        color: Colors.black38),
                                                  ),
                                                  actions: <Widget>[
                                                    ElevatedButton(
                                                      onPressed: () {
                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(1),
                                                              shape:
                                                                  RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10),
                                                              ),
                                                              elevation: 0,
                                                              backgroundColor:
                                                                  Colors
                                                                      .orange),
                                                      child: Padding(
                                                        padding: EdgeInsets.all(
                                                            heightfit(
                                                                defaultPadding /
                                                                    2)),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Icon(
                                                              Icons
                                                                  .check_circle,
                                                              size: 15,
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                            Text("OK",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .black))
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                );
                                              });
                                          print(
                                              "index komoditi :${komoditi.id} ${c.indexsubMenuRawatan.value}");
                                        } else {
                                          Container();
                                        }
                                      },
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DetailKomoditiScreen extends StatelessWidget {
  final KategorisubMenuRawatan komoditi;

  const DetailKomoditiScreen({super.key, required this.komoditi});

  @override
  Widget build(BuildContext context) {
    List<PengaplikasianDosisPupuk> relatedRawatan = rawatanListv
        .where((rawatan) => rawatan.idKomoditi == komoditi.id)
        .toList();
    List<KategoriPerusahaan> relatedPerusahaan = relatedRawatan
        .map((rawatan) {
          return perusahaanListv.firstWhere(
              (perusahaan) => perusahaan.id == rawatan.idPerusahaan);
        })
        .toSet()
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(komoditi.namaKomoditi),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(komoditi.img),
            SizedBox(height: 8),
            Text(
              komoditi.namaKomoditi,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text('Media: ${komoditi.media}'),
            SizedBox(height: 8),
            Text('Variable Ketetapan: ${komoditi.variableKetetapan}'),
            SizedBox(height: 8),
            Text('Perusahaan Terkait:',
                style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            ...relatedPerusahaan.map((perusahaan) {
              return ListTile(
                leading: Image.asset(perusahaan.img),
                title: Text(perusahaan.perusahaan),
              );
            }),
            SizedBox(height: 8),
            Expanded(
              child: ListView.builder(
                itemCount: relatedRawatan.length,
                itemBuilder: (context, index) {
                  final rawatan = relatedRawatan[index];
                  return ListTile(
                    title: Text(rawatan.jenisPemupukan),
                    subtitle: Text('Satuan: ${rawatan.satuan}'),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyHomePagev extends StatefulWidget {
  const MyHomePagev({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePagev> {
  final String _searchQuery = '';
  final int _selectedIndex = 0;
  ScrollController? parentController;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: (SizeConfig.screenWidth! > 600) ? false : true,
        appBar: (SizeConfig.screenWidth! > 600)
            ? appBarLanscape()
            : appBarPotrait(),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.white,
          child: BackgraundPotrait(
            judul: "Komoditi",
            penjelas: "Tanam Sesuai komoditi mu",
            widgets: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(defaultPadding),
                  child: CardListProduct(
                    key: Key("s"),
                  ),
                ),
                SizedBox(
                  height: defaultPadding / 3,
                ),
                SearchKomoditiv(
                  onTextChanged: (String value) {},
                ),
                Container()
              ],
            ),
            tema: Colors.green,
            key: Key("s"),
          ),
        ));
  }
}
