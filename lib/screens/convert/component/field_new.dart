List<Map<String, dynamic>> datajarakTanam = [
  {
    "id": 0,
    "nama": "Jarak Tanam",
    "img": "assets/images/pot/balok.png",
    "variabels": {
      "P_0": ["Panjang", 0.0],
      "L_0": ["Lebar", 0.0]
    },
    "fieldValue": [],
    "satuan": "m",
    "hasil": {
      "P_0": ["Panjang", 0.0],
      "L_0": ["Lebar", 0.0]
    },
    "rumusStr": {
      "0": ["proses1", "P_0 * L_0"]
    },
    "perhitungan": {
      "P_0": ["Panjang", "0.0"],
      "L_0": ["Lebar", "0.0"],
      "luas": [
        "Luas",
        ["1", "2"]
      ]
    },
    "hasilAkhir": {
      "0": [
        "hasil proses 1",
        [0.0]
      ]
    },
  },
  // {
  //   "id": 1,
  //   "nama": "Jarak Tanam kis",
  //   "img": "assets/images/pot/balok.png",
  //   "variabels": {
  //     "P_0": ["Panjang", 0.0],
  //     "L_0": ["Lebar", 0.0]
  //   },
  //   "fieldValue": [],
  //   "satuan": "m",
  //   "hasil": {
  //     "P_0": ["Panjang", 0.0],
  //     "L_0": ["Lebar", 0.0]
  //   },
  //   "rumusStr": "P_0 * L_0",
  //   "perhitungan": {
  //     "P_0": ["Panjang", "P"],
  //     "L_0": ["Lebar", "L"],
  //     "luas": ["Luas", "Luas"]
  //   },
  //   "luas": 0.0,
  // },
];

int statejaraktanam = 0;

class JarakTanam {
  int id;
  String nama;
  String img;
  Map<String, dynamic> variabels;
  List<dynamic> fieldValue;
  String satuan;
  Map<String, dynamic> hasil;
  Map<String, dynamic> rumusStr;
  Map<String, dynamic> perhitungan;
  Map<String, dynamic> hasilAkhir;

  JarakTanam(
      {required this.id,
      required this.nama,
      required this.img,
      required this.variabels,
      required this.fieldValue,
      required this.satuan,
      required this.hasil,
      required this.rumusStr,
      required this.perhitungan,
      required this.hasilAkhir});
}

List<JarakTanam> listJarakTanam = [
  for (var i = 0; i < datajarakTanam.length; i++)
    JarakTanam(
        id: i,
        nama: datajarakTanam[i]["nama"],
        img: datajarakTanam[i]["img"],
        variabels: datajarakTanam[i]["variabels"],
        fieldValue: datajarakTanam[i]["fieldValue"],
        satuan: datajarakTanam[i]["satuan"],
        hasil: datajarakTanam[i]["hasil"],
        rumusStr: datajarakTanam[i]["rumusStr"],
        perhitungan: datajarakTanam[i]["perhitungan"],
        hasilAkhir: datajarakTanam[i]["hasilAkhir"])
];

// int statejaraktanam = 0;

int iddataPerhitunganLuasMediaTanam = 0;
int indexMediaTanam = 0;
int indexrumusMediaTanam = 0;
int idrumusMediaTanam = 0;
List dataidrumus = ["Persegi"];

// digunakan untuk [Jenis dosis, Jenis Lahan, Jarak Tanam] pokok ada berat / Bedengan
// class ProsesWidgets extends StatefulWidget {
//   final List dataproses;
//   final Color tema;
//   final String namaobj;
//   final int stateID;
//   final Function(int, List, List, List) onChangeState;
//   const ProsesWidgets(
//       {Key ? key,
//       required this.dataproses,
//       required this.tema,
//       required this.onChangeState,
//       required this.namaobj,
//       required this.stateID})
//       : super(key: key);
//
//   @override
//   _ProsesWidgetsState createState() => _ProsesWidgetsState();
// }
//
// class _ProsesWidgetsState extends State<ProsesWidgets> {
//   // int indexKe = 0;
//
//   List<TextEditingController> myControlerssi(int indexKes, Map data) =>
//       List<TextEditingController>.generate(
//           data.length,
//           (i) => TextEditingController(
//               text: (data.values.elementAt(i)[1].toString())));
//
//   List<Widget> fieldso(int indexKes, Map data) {
//     List<Widget> fieldsss = [];
//
//     setState(() {
//       // print("field sebelum ${widget.dataproses[indexKes].fieldValue}");
//       fieldsss = List<Widget>.generate(data.length, (index) {
//         TextEditingController controllers = List<TextEditingController>.from(
//             dataKategoriRumus[indexKes].fieldValue)[index];
//         return Fields(
//           controller: controllers,
//           satuan: List.from(data.keys.toList())[index] == "berat"
//               ? "Kg"
//               : List.from(data.keys.toList())[index] == "TB_0"
//                   ? "Bedengan"
//                   : dataKategoriInisialisasi
//                       .where((element) =>
//                           element.vari == data.keys.toList()[index])
//                       .first
//                       .satuan,
//           title: data.values.elementAt(index)[0].toString(),
//           tema: widget.tema,
//           onStateChange: (values) {
//             setState(() {
//               onPreso(indexKes, data);
//             });
//           },
//             typeinput:TextInputType.numberWithOptions(
//                 decimal: true), enable: true,
//         );
//       });
//     });
//     return fieldsss;
//   }
//
//   void onPreso(indexKe, data) {
//     List datainput = [];
//     List dataprosess = [];
//     List datahasil = [];
//
//     setState(() {
//       // dataVariabel = variables(dataKategoriRumus[indexrumusMediaTanam].rumus);
//       print("iniloh ${variables(dataKategoriRumus[indexKe].rumus)}");
//
// // ====================================
//       dataKategoriRumus[indexKe].fieldValue.asMap().forEach((index, element) {
//         data[data.keys.elementAt(index)][1] = double.tryParse(element.text);
//         //  datainput = [panajng, lebar]
//         dataKategoriInisialisasi[dataKategoriInisialisasi
//                 .where((element) => element.vari == data.keys.toList()[index])
//                 .first
//                 .id]
//             .nilai = double.tryParse(element.text)!;
//         datainput.add(double.tryParse(element.text));
//         print("Data input ${datainput}");
//
//         // satuan field
//         // Map datas = dataKategoriRumus[indexKe].valuess;
//         dataprosess = [
//           "${convertRumus(data, dataKategoriRumus[indexKe].rumus)}"
//         ];
//         // print("data perhitungan${dataKategoriRumus[indexKe].valuess}");
//         datahasil = [
//           convertRumus(data, dataKategoriRumus[indexrumusMediaTanam].rumus)
//               .interpret()
//               .toDouble()
//               .toStringAsFixed(1)
//         ];
//         dataKategoriInisialisasi
//             .where((element) => element.vari == dataKategoriRumus[indexKe].vari)
//             .first
//             .nilai = double.tryParse(datahasil[0])!;
//         // dataKategoriRumus[indexKe].luas = double.tryParse(datahasil[0]);
//         print(
//             "data perhitungan 0 0 ${dataKategoriInisialisasi.where((element) => element.vari == dataKategoriRumus[indexKe].vari).first.nilai}");
//         print(
//             "variable ${dataKategoriInisialisasi.where((element) => element.vari == dataKategoriRumus[indexKe].vari).first.vari} = data hasil ${datahasil}");
//
//         myControlersso = myControlerssi(indexKe, data);
//         dataKategoriRumus[indexKe].fieldValue = myControlersso;
//
//         fieldo = fieldso(indexKe, data);
//
//         // widget.dataproses[indexKe].perhitungan["luas"][1] = dataprosess;
//         // widget.dataproses[indexKe].hasilAkhir["0"][1] = datahasil;
//         // print("===>$datahasil");
//         // widget.onChangeState(indexKe, datainput, dataprosess, datahasil);
//       });
//     });
//   }
//
//   List<TextEditingController> myControlersso = [];
//   List<Widget> fieldo = [];
//   Map dataVariabel = {};
//
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     filtersdata =  dataKategoriJenisPerhitungan.where((element) => element.id_menurawatan == c.indexMenuRawatan.value.toString()).toList();
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     int indexMenuKalkulasi = widget.stateID;
//
//     dataVariabel = variables(dataKategoriRumus[indexrumusMediaTanam].rumus);
//     myControlersso = myControlerssi(indexrumusMediaTanam, dataVariabel);
//     dataKategoriRumus[indexrumusMediaTanam].fieldValue = myControlersso;
//     fieldo = fieldso(indexrumusMediaTanam, dataVariabel);
//
//     return CardFields(
//       tema: widget.tema,
//       judul: widget.dataproses[indexMenuKalkulasi].nama,
//       columns: Padding(
//         padding: EdgeInsets.only(
//             // horizontal: widthfit(defaultPadding / 2),
//             top: heightfit(defaultPadding)),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             DropDowns((newActivity) {
//               setState(
//                 () {
//                   indexMediaTanam = filtersdata
//                       .where((element) => element.mediatanam == newActivity)
//                       .first
//                       .id;
//
//                   dataVariabel =
//                       variables(dataKategoriRumus[indexrumusMediaTanam].rumus);
//
//                   print(dataidrumus);
//                   dataidrumus = dataKategoriRumus
//                       .where((e) =>
//                             filtersdata[e.idMediaTanam].mediatanam ==
//                               newActivity &&
//                           e.idKalkulasi == indexMenuKalkulasi)
//                       .map((ei) => ei.nama)
//                       .toList();
//
//                   List ids = dataKategoriRumus
//                       .where((e) =>
//                           filtersdata[e.idMediaTanam].mediatanam ==
//                               newActivity &&
//                           e.idKalkulasi == indexMenuKalkulasi)
//                       .map((ei) => ei.id)
//                       .toList();
//                   indexrumusMediaTanam = ids[0];
//                   onPreso(indexrumusMediaTanam, dataVariabel);
//                 },
//               );
//             },
//                 widget.tema,
//                 filtersdata
//                     .map((e) => e.mediatanam)
//                     .toList()
//                     .toList(),
//                 filtersdata.map((e) => e.mediatanam).toList()[0],
//                 filtersdata
//                     .map((e) => e.mediatanam)
//                     .toList()[indexMediaTanam],
//                 "Tipe media Tanam",[]),
//             DropDowns((newActivity) {
//               setState(
//                 () {
//                   indexrumusMediaTanam = dataKategoriRumus
//                       .where((element) => element.nama == newActivity)
//                       .map((e) => e.id)
//                       .first;
//                   dataVariabel =
//                       variables(dataKategoriRumus[indexrumusMediaTanam].rumus);
//
//                   onPreso(indexrumusMediaTanam, dataVariabel);
//                 },
//               );
//             },
//                 widget.tema,
//                 dataidrumus,
//                 dataidrumus[0],
//                 dataidrumus[dataidrumus
//                     .indexOf(dataKategoriRumus[indexrumusMediaTanam].nama)],
//                 "Bentuk media Tanam",[]),
//             Column(
//               children: fieldo,
//             ),
//             Padding(
//               padding: EdgeInsets.symmetric(horizontal: defaultPadding),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text("${filtersdata[indexMediaTanam].mediatanam}",
//                       style: TextStyle(
//                           color: widget.tema,
//                           fontWeight: FontWeight.bold,
//                           fontSize: heightfit(20))),
//                   Container(
//                       height: heightfit(100),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Expanded(
//                             flex: 3,
//                             child: ListView(
//                               padding: EdgeInsets.zero,
//                               shrinkWrap: true,
//                               children: List<Widget>.from(dataVariabel.values
//                                   // .asMap()
//                                   .map((v) => RichText(
//                                         text: TextSpan(children: [
//                                           TextSpan(
//                                             text: (v[1].toString() != "" &&
//                                                     v[1] != 0.0 &&
//                                                     v[1] != 0 &&
//                                                     v[1].toString() != "0" &&
//                                                     v[1] != 0.0)
//                                                 ? "${v[0]} : ${v[1]}"
//                                                 : "${v[0]} perlu diisi..",
//                                             style: TextStyle(
//                                                 color: (v[1].toString() != "" &&
//                                                         v[1] != 0.0 &&
//                                                         v[1] != 0 &&
//                                                         v[1].toString() !=
//                                                             "0" &&
//                                                         v[1] != 0.0)
//                                                     ? widget.tema
//                                                     : Colors.red,
//                                                 fontSize: heightfit(20)),
//                                           )
//                                         ]),
//                                       ))).toList(),
//                             ),
//                           ),
//                           Expanded(
//                             flex: 1,
//                             child: RichText(
//                                 text: TextSpan(children: [
//                               TextSpan(
//                                 text:
//                                     ("Luas : ${convertRumus(dataVariabel, dataKategoriRumus[indexrumusMediaTanam].rumus)} = ${convertRumus(dataVariabel, dataKategoriRumus[indexrumusMediaTanam].rumus).interpret().toDouble().toStringAsFixed(1)}"),
//                                 style: TextStyle(
//                                     color: widget.tema,
//                                     fontSize: heightfit(20)),
//                               )
//                             ])),
//                           )
//                         ],
//                       )),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ), onChangeState: () {  }, indexmenu: c.indexMenuRawatan.value,indexsubmenu: c.indexsubMenuRawatan.value,
//     );
//   }
// }
