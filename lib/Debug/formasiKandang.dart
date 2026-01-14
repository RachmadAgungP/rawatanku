import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rawatt/constants.dart';
import 'package:rawatt/screens/convert/component/inisialisasi_var.dart';

class PatternGrid extends StatefulWidget {
  final int panjangs; // panjnag cm
  // final int cageHeight; // tinggi cm
  // final int pw2; // panjang cm
  final int p2; // jalan tengah
  final int lebar; // Lebar lahan tersedia
  final int panjang; // Panjang lahan tersedia
  // final int maxLevels; // maksimal tingkat kandang
  // final int totalChickens; // total ayam yang ingin dipelihara
  // final int chickensPerCage; // 1 kandang isi
  // final int jaraktanam;
  // final Map<int, int> stackDistribution;
  final Function(int) onChangeState;
  final Map<String, List<int>> prosess;

  const PatternGrid({
    super.key,
    required this.panjangs,
    // required this.cageHeight,
    // required this.pw2,
    required this.p2,
    required this.lebar,
    required this.panjang,
    // required this.maxLevels,
    // required this.totalChickens,
    // required this.chickensPerCage,
    required this.onChangeState,
    // required this.stackDistribution,
    // required this.jaraktanam,
    required this.prosess,
  });

  @override
  State<PatternGrid> createState() => _PatternGridState();
}

class _PatternGridState extends State<PatternGrid> {
  int totalWidth = 0;
  int banyakbaris = 0; //baris
  int hitungKolomA = 0; //kolom
  int sisabaris = 0;
  int sumLebar = 0;

  int totalLength = 0;
  int maxWidth = 0;
  int heightTotal = 0;

  Map<String, List<int>> result3 = {};
  Map<String, List<int>> tabel2 = {};
  int totalLengtha = 0;

  Map tabelAkhir = {};

  double widthWidget = 350;
  double heightWidget = 350;
  int banyakPotRekomendasi = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> gridItems = [];
    List<Widget> rows = [];
    int panjangs = widget.panjangs;
    // panjangs = widget.pw2 +widget.jaraktanam;
    // widget.onChangeState(widget.totalChickens);
    print("lop lebar${widget.lebar} ${widget.lebar >= 2500}");
    print("lop panjang${widget.panjang}");
    if (widget.lebar <= maxWidth || widget.panjang <= panjangs) {
      rows.add(Container(
        child: Text("Data tidak sesuai"),
      ));
      print('data tidak sesuai');
    } else if (widget.lebar > maxWidth && widget.lebar < 2500 ||
        widget.panjang > panjangs && widget.panjang < 2500) {
      tabel2 = widget.prosess;
      // proses(panjangs);
      //

      print("tabels $tabel2 $panjangs");
      // stackDistribution.forEach((key, value) {
      //   for (int i = 0; i < value; i++) {
      //     resultw[resultw.length + 1] = key;
      //   }
      // });

      tabelAkhir = tabel2;
      var screenSize = MediaQuery.of(context).size;

      // Determine the maximum number of columns
      // int maxColumns =
      //     tabel2.values.map((e) => e.length).reduce((a, b) => a > b ? a : b);

      // Calculate cell size based on screen size
      double cellWidth = (tabelAkhir["a1"] == null)
          ? widthWidget
          : widthWidget / tabelAkhir["a1"].length;
      double cellHeight = (tabelAkhir["a1"] == null)
          ? heightWidget
          : heightWidget / tabelAkhir.length;

      // Create a list of widgets for the grid

      int o = 0;

      banyakPotRekomendasi = 0;
      tabelAkhir.forEach((key, values) {
        List<Widget> row = [];
        // o = 0;
        for (int value in values) {
          if (value != 50) {
            banyakPotRekomendasi += 1;
          }
          row.add(
            Expanded(
                child: SizedBox(
              width: cellWidth,
              height: cellHeight,
              child:
                  // (c.indexMenuRawatan.value == 1)?
                  // Column(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: [
                  //     Expanded(
                  //       flex: 1,
                  //       child: Container(
                  //         height: cellHeight / 4,
                  //         decoration: BoxDecoration(
                  //             border: Border.all(
                  //               color: key.startsWith('b')
                  //                   ?Colors.black:Colors.green,
                  //             ),
                  //             color: key.startsWith('b')
                  //                 ?Colors.black:Colors.green),
                  //       ),
                  //     ),
                  //     Expanded(
                  //       flex: 3,
                  //       child: Container(
                  //         child: Row(
                  //           mainAxisAlignment: MainAxisAlignment.center,
                  //           crossAxisAlignment: CrossAxisAlignment.center,
                  //           children: [
                  //             Expanded(
                  //               flex: 1,
                  //               child: Container(
                  //                 height: cellHeight / 2,
                  //                 width: (cellWidth / 4)/2,
                  //                 decoration: BoxDecoration(
                  //                     border: Border.all(
                  //                       color: key.startsWith('b')
                  //                           ?Colors.black:Colors.green,
                  //                     ),
                  //                     color: key.startsWith('b')
                  //                         ?Colors.black:Colors.green),
                  //               ),
                  //             ),
                  //             Expanded(
                  //               flex: 5,
                  //               child: Container(
                  //                 width: cellWidth / 2,
                  //                 height: cellHeight / 2,
                  //                 decoration: BoxDecoration(
                  //                   border: Border.all(
                  //                       color: value != panjangs
                  //                           ? Colors.white
                  //                           : value != -panjangs
                  //                               ? Colors.white
                  //                               : key.startsWith('b')
                  //                                   ? Colors.black
                  //                                   : Colors.grey,
                  //                       width: key.startsWith('b')
                  //                           ? 0
                  //                           : (10 / widthWidget) + 2),
                  //                   color: value == panjangs
                  //                       ? Colors.red
                  //                       : value == -panjangs
                  //                           ? Colors.white
                  //                           : key.startsWith('b')
                  //                               ? Colors.black
                  //                               : Colors.blue,
                  //                 ),
                  //                 child: Center(
                  //                   child: Text(
                  //                     value == panjangs
                  //                         ? '${o += 1}'
                  //                         : (value != 50)
                  //                             ? "${value}"
                  //                             : ' Jalan Lahan ',
                  //                     style: TextStyle(
                  //                       fontSize: cellWidth / 3,
                  //                       color: value == -panjangs ||
                  //                               key.startsWith('b')
                  //                           ? Colors.white
                  //                           : Colors.black,
                  //                     ),
                  //                   ),
                  //                 ),
                  //               ),
                  //             ),
                  //             Expanded(
                  //               flex: 1,
                  //               child: Container(
                  //                 height: cellHeight / 2,
                  //                 width: (cellWidth / 5)/2,
                  //                 decoration: BoxDecoration(
                  //                     border: Border.all(
                  //                       color: key.startsWith('b')
                  //                           ?Colors.black:Colors.green,
                  //                     ),
                  //                     color: key.startsWith('b')
                  //                         ?Colors.black:Colors.green),
                  //               ),
                  //             ),
                  //           ],
                  //         ),
                  //       ),
                  //     ),
                  //     Expanded(
                  //       flex: 1,
                  //       child: Container(
                  //         height: cellHeight / 4,
                  //         decoration: BoxDecoration(
                  //             border: Border.all(
                  //               color: key.startsWith('b')
                  //                   ?Colors.black:Colors.green,
                  //             ),
                  //             color: key.startsWith('b')
                  //                 ?Colors.black:Colors.green),
                  //       ),
                  //     ),
                  //   ],
                  // ):
                  Container(
                width: cellWidth,
                height: cellHeight,
                decoration: BoxDecoration(
                  border: Border.all(
                      color: value != panjangs
                          ? Colors.white
                          : value != -panjangs
                              ? Colors.white
                              : key.startsWith('b')
                                  ? Colors.black
                                  : Colors.grey,
                      width: key.startsWith('b') ? 0 : (10 / widthWidget) + 2),
                  color: value == panjangs
                      ? Colors.red
                      : value == -panjangs
                          ? Colors.white
                          : key.startsWith('b')
                              ? Colors.black
                              : Colors.blue,
                ),
                child: Center(
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      return Text(
                        value == panjangs
                            ? '${o += 1}'
                            : (value != 50)
                                ? "$value"
                                : ' Jalan Lahan ',
                        style: TextStyle(
                          fontSize: constraints.maxHeight *
                              0.4, // 20% dari tinggi parent
                          color: value == -panjangs || key.startsWith('b')
                              ? Colors.white
                              : Colors.black,
                        ),
                      );
                    },
                  ),
                ),
              ),
            )),
          );
        }
        rows.add((c.indexMenuRawatan.value == 2)
            ? Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: row)
            : Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: row));
        // o += 1;
      });
    } else if (widget.lebar >= 2500 || widget.panjang >= 2500) {
      rows.add(Container(
        child: Text(
            "Data panjang atau lebar telalu luas maksimal Lebar : 25 panjang : 25 tidak sesuai"),
      ));
      print('data tidak sesua sdi');
    }

    // widget.onChangeState(banyakPotRekomendasi);
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          (tabelAkhir["a1"] == null)
              ? Container()
              : SizedBox(
                  width: widthWidget + 50,
                  height: heightWidget + 50,
                  child: Center(
                    child: Stack(children: [
                      Positioned(
                        child: Container(
                          width: widthWidget,
                          height: heightWidget,
                          margin: EdgeInsets.all(20.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: rows,
                          ),
                        ),
                      ),
                    ]),
                  ),
                ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // GarisBerwarnaWidget(
              //     nama: "panjang",
              //     color: Colors.blue,
              //     landLength: double.tryParse(widget.panjang.toString())!,
              //     recommendedLength:
              //         double.tryParse((banyakbaris * panjangs).toString())!,
              //     cageLength: banyakbaris),
              // GarisBerwarnaWidget(
              //     nama: "lebar",
              //     color: Colors.red,
              //     landLength: double.tryParse(widget.lebar.toString())!,
              //     recommendedLength: double.tryParse((sumLebar).toString())!,
              //     cageLength: hitungKolomA),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.all(20.0),
                            width: 18,
                            height: 18,
                            color: Colors.blue,
                          ),
                          SizedBox(width: 8),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text("Box berwarna biru",
                                  style: TextStyle(color: Colors.blue)),
                              Text("lahan Instalasi yang SUDAH digunakan"),
                              // Text(
                              //     "panjang : ${double.tryParse(widget.panjang.toString())!/100} m"),
                              // Text(
                              //     "lebar : ${double.tryParse(widget.lebar.toString())!/100} m"),
                            ],
                          ),

                          // Spasi antara Container dan Column
                          SizedBox(width: 8)
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.all(20.0),
                            width: 18,
                            height: 18,
                            color: Colors.red,
                          ),
                          SizedBox(width: 8),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text("Box berwarna merah",
                                  style: TextStyle(color: Colors.red)),
                              Text("lahan Instalasi yang BELUM digunakan"),
                              // Text(
                              //     "panjang : ${double.tryParse(widget.panjang.toString())!/100} m"),
                              // Text(
                              //     "lebar : ${double.tryParse(widget.lebar.toString())!/100} m"),
                            ],
                          ),

                          // Spasi antara Container dan Column
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text("Garis berwarna",
                                  style: TextStyle(color: Colors.black)),
                              Text(
                                  "jarak tengah: ${widget.p2 / 100} m (Jalan Tengah)\n"),
                            ],
                          ),

                          Container(
                            padding: EdgeInsets.all(20.0),
                            width: 18,
                            height: 18,
                            color: Colors.black,
                          ), // Spasi antara Container dan Column
                          SizedBox(width: 8)
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}

class GarisBerwarnaWidget extends StatelessWidget {
  final String nama;
  final Color color;
  final double landLength;
  final double recommendedLength;
  final int cageLength;

  const GarisBerwarnaWidget({
    super.key,
    required this.color,
    required this.landLength,
    required this.recommendedLength,
    required this.cageLength,
    required this.nama,
  });

  int customRound(double value) {
    return value.ceil();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.all(defaultPadding / 2),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(20.0),
                  width: 18,
                  height: 18,
                  color: color,
                ),
                SizedBox(width: 8), // Spasi antara Container dan Column
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("Garis berwarna : $nama ",
                        style: TextStyle(color: color)),
                    Text(
                      "$nama lahan tersedia : ${landLength / 100} m \n"
                      "$nama lahan Rekomendasi : ${recommendedLength / 100} m \n"
                      "Banyak tempat kandang per $nama: $cageLength",
                      style: TextStyle(color: Colors.black),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class LahanWidget extends StatelessWidget {
  final double panjangLahan; // dalam meter
  final double lebarLahan; // dalam meter
  final int lebar;

  final int panjang;
  final Map tabel;

  const LahanWidget({
    super.key,
    required this.panjangLahan,
    required this.lebarLahan,
    required this.lebar,
    required this.panjang,
    required this.tabel,
  });

  @override
  Widget build(BuildContext context) {
    List<Widget> rows = [];

    print("tabels $tabel $panjang");

    var screenSize = MediaQuery.of(context).size;
    double widthWidget = double.tryParse(panjangLahan.toString())!;
    double heightWidget = double.tryParse(lebarLahan.toString())!;

    double cellWidth = widthWidget;
    double cellHeight = heightWidget / tabel.length;

    int o = 0;

    int banyakPotRekomendasi = 0;
    tabel.forEach((key, values) {
      List<Widget> row = [];
      // o = 0;
      for (int value in values) {
        if (key.startsWith('b')) {
          banyakPotRekomendasi += 1;
        }
        row.add(
          // Expanded(
          //     child:
          Expanded(
            child: SizedBox(
              width: (key.startsWith('b'))
                  ? cellWidth
                  : cellWidth / tabel["a1"].length,
              height: heightWidget / tabel.length,
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                      color: value != panjang
                          ? Colors.white
                          : value != -panjang
                              ? Colors.white
                              : key.startsWith('b')
                                  ? Colors.black
                                  : Colors.grey,
                      width: key.startsWith('b') ? 0 : (10 / widthWidget) + 2),
                  color: value == panjang
                      ? Colors.red
                      : value == -panjang
                          ? Colors.white
                          : key.startsWith('b')
                              ? Colors.black
                              : Colors.blue,
                ),
                child: Center(
                  child: FittedBox(
                    child: Text(
                      value == panjang
                          ? '${o += 1}'
                          : (value != 50)
                              ? "$value"
                              : ' Jalan Lahan ',
                      style: TextStyle(
                        fontSize: 18,
                        color: value == -panjang || key.startsWith('b')
                            ? Colors.white
                            : Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      }
      rows.add((c.indexMenuRawatan.value == 2)
          ? Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: row)
          : Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: row));
    });

    return Container(
      color: Colors.greenAccent,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Lahan: ${panjangLahan}cm x ${lebarLahan}cm',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            // width: widgetWidth,
            color: Colors.blueAccent,
            child: Center(
              child: Container(
                margin: EdgeInsets.all(defaultPadding / 2),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: rows,
                ),
              ),
            ),
          ),
        ],
      ),
    );
    //   },
    // );
  }
}

class PatternGrid2 extends StatefulWidget {
  final int panjangs; // panjnag cm
  final int lebars; // Panjang lahan tersedia

  // final int cageHeight; // tinggi cm
  // final int pw2; // panjang cm
  final int p2; // jalan tengah
  final int lebar; // Lebar lahan tersedia
  final int panjang; // Panjang lahan tersedia

  // final int maxLevels; // maksimal tingkat kandang
  // final int totalChickens; // total ayam yang ingin dipelihara
  // final int chickensPerCage; // 1 kandang isi
  // final int jaraktanam;
  // final Map<int, int> stackDistribution;
  final Function(int) onChangeState;
  final Map<String, List<int>> prosess;

  const PatternGrid2({
    super.key,
    required this.panjangs,
    // required this.cageHeight,
    // required this.pw2,
    required this.p2,
    required this.lebar,
    required this.panjang,
    // required this.maxLevels,
    // required this.totalChickens,
    // required this.chickensPerCage,
    required this.onChangeState,
    // required this.stackDistribution,
    // required this.jaraktanam,
    required this.prosess,
    required this.lebars,
  });

  @override
  State<PatternGrid2> createState() => _PatternGrid2State();
}

class _PatternGrid2State extends State<PatternGrid2> {
  int totalWidth = 0;
  int banyakbaris = 0; //baris
  int hitungKolomA = 0; //kolom
  int sisabaris = 0;
  int sumLebar = 0;

  int totalLength = 0;
  int maxWidth = 0;
  int heightTotal = 0;

  Map<String, List<int>> result3 = {};
  Map<String, List<int>> tabel2 = {};
  int totalLengtha = 0;

  Map tabelAkhir = {};

  double widthWidget = 350;
  double heightWidget = 350;
  int banyakPotRekomendasi = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Widget lahan = Container();

  @override
  Widget build(BuildContext context) {
    List<Widget> gridItems = [];
    List<Widget> rows = [];
    int panjangs = widget.panjangs;
    // panjangs = widget.pw2 +widget.jaraktanam;
    // widget.onChangeState(widget.totalChickens);
    print("lop lebar${widget.lebar} ${widget.lebar >= 2500}");
    print("lop panjang${widget.panjang}");
    if (widget.lebar <= maxWidth || widget.panjang <= panjangs) {
      rows.add(Container(
        child: Text("Data tidak sesuai"),
      ));
      print('data tidak sesuai');
    } else if (widget.lebar > maxWidth && widget.lebar < 2500 ||
        widget.panjang > panjangs && widget.panjang < 2500) {
      tabel2 = widget.prosess;
      // proses(panjangs);
      //

      print("tabels $tabel2 $panjangs");
      // stackDistribution.forEach((key, value) {
      //   for (int i = 0; i < value; i++) {
      //     resultw[resultw.length + 1] = key;
      //   }
      // });

      tabelAkhir = tabel2;
      var screenSize = MediaQuery.of(context).size;

      // Determine the maximum number of columns
      // int maxColumns =
      //     tabel2.values.map((e) => e.length).reduce((a, b) => a > b ? a : b);
      lahan = LahanWidget(
        panjang: widget.panjangs,
        lebar: widget.lebars,
        tabel: tabelAkhir,
        panjangLahan:
            double.tryParse((widget.panjang).toString())!, // dalam meter
        lebarLahan: double.tryParse((widget.lebar).toString())!, // dalam meter
      );

      // Calculate cell size based on screen size
      double cellWidth = (tabelAkhir["a1"] == null)
          ? widthWidget
          : widthWidget / tabelAkhir["a1"].length;
      double cellHeight = (tabelAkhir["a1"] == null)
          ? heightWidget
          : heightWidget / tabelAkhir.length;

      // Create a list of widgets for the grid

      int o = 0;

      banyakPotRekomendasi = 0;
      tabelAkhir.forEach((key, values) {
        List<Widget> row = [];
        // o = 0;
        for (int value in values) {
          if (value != 50) {
            banyakPotRekomendasi += 1;
          }
          row.add(
            Expanded(
                child: SizedBox(
              width: cellWidth,
              height: cellHeight,
              child: (c.indexMenuRawatan.value == 1)
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 2,
                          child: Container(
                            height: cellHeight / 4,
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: key.startsWith('b')
                                      ? Colors.black
                                      : Colors.green,
                                ),
                                color: key.startsWith('b')
                                    ? Colors.black
                                    : Colors.green),
                          ),
                        ),
                        Expanded(
                          flex: 4,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                flex: 1,
                                child: Container(
                                  height: cellHeight / 2,
                                  width: (cellWidth / 4) / 2,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                        color: key.startsWith('b')
                                            ? Colors.black
                                            : Colors.green,
                                      ),
                                      color: key.startsWith('b')
                                          ? Colors.black
                                          : Colors.green),
                                ),
                              ),
                              Expanded(
                                flex: 4,
                                child: Container(
                                  width: cellWidth / 2,
                                  height: cellHeight / 2,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: value != panjangs
                                            ? Colors.white
                                            : value != -panjangs
                                                ? Colors.white
                                                : key.startsWith('b')
                                                    ? Colors.black
                                                    : Colors.grey,
                                        width: key.startsWith('b')
                                            ? 0
                                            : (10 / widthWidget) + 2),
                                    color: value == panjangs
                                        ? Colors.red
                                        : value == -panjangs
                                            ? Colors.white
                                            : key.startsWith('b')
                                                ? Colors.black
                                                : Colors.blue,
                                  ),
                                  child: Center(
                                    child: FittedBox(
                                      child: Text(
                                        value == panjangs
                                            ? '${o += 1}'
                                            : (value != 50)
                                                ? "$value"
                                                : ' Jalan Lahan ',
                                        style: TextStyle(
                                          fontSize: cellWidth / 3,
                                          color: value == -panjangs ||
                                                  key.startsWith('b')
                                              ? Colors.white
                                              : Colors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Container(
                                  height: cellHeight / 2,
                                  width: (cellWidth / 4) / 2,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                        color: key.startsWith('b')
                                            ? Colors.black
                                            : Colors.green,
                                      ),
                                      color: key.startsWith('b')
                                          ? Colors.black
                                          : Colors.green),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Container(
                            height: cellHeight / 4,
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: key.startsWith('b')
                                      ? Colors.black
                                      : Colors.green,
                                ),
                                color: key.startsWith('b')
                                    ? Colors.black
                                    : Colors.green),
                          ),
                        ),
                      ],
                    )
                  : Expanded(
                      child: Container(
                        width: cellWidth,
                        height: cellHeight,
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: value != panjangs
                                  ? Colors.white
                                  : value != -panjangs
                                      ? Colors.white
                                      : key.startsWith('b')
                                          ? Colors.black
                                          : Colors.grey,
                              width: key.startsWith('b')
                                  ? 0
                                  : (10 / widthWidget) + 2),
                          color: value == panjangs
                              ? Colors.red
                              : value == -panjangs
                                  ? Colors.white
                                  : key.startsWith('b')
                                      ? Colors.black
                                      : Colors.blue,
                        ),
                        child: Center(
                          child: FittedBox(
                            child: Text(
                              value == panjangs
                                  ? '${o += 1}'
                                  : (value != 50)
                                      ? "$value"
                                      : ' Jalan Lahan ',
                              style: TextStyle(
                                fontSize: cellWidth / 3,
                                color: value == -panjangs || key.startsWith('b')
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
            )),
          );
        }
        rows.add((c.indexMenuRawatan.value == 2)
            ? Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: row)
            : Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: row));
        // o += 1;
      });
    } else if (widget.lebar >= 2500 || widget.panjang >= 2500) {
      rows.add(Container(
        child: Text(
            "Data panjang atau lebar telalu luas maksimal Lebar : 25 panjang : 25 tidak sesuai"),
      ));
      print('data tidak sesua sdi');
    }

    // widget.onChangeState(banyakPotRekomendasi);
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          lahan,
          SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.all(20.0),
                    width: 18,
                    height: 18,
                    color: Colors.blue,
                  ),
                  SizedBox(width: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("Box berwarna biru",
                          style: TextStyle(color: Colors.blue)),
                      Text("lahan Instalasi yang SUDAH digunakan"),
                    ],
                  ),

                  // Spasi antara Container dan Column
                  SizedBox(width: 8)
                ],
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.all(20.0),
                    width: 18,
                    height: 18,
                    color: Colors.red,
                  ),
                  SizedBox(width: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("Box berwarna merah",
                          style: TextStyle(color: Colors.red)),
                      Text("lahan Instalasi yang BELUM digunakan"),
                      // Text(
                      //     "panjang : ${double.tryParse(widget.panjang.toString())!/100} m"),
                      // Text(
                      //     "lebar : ${double.tryParse(widget.lebar.toString())!/100} m"),
                    ],
                  ),
                  SizedBox(width: 8)
                  // Spasi antara Container dan Column
                ],
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.all(20.0),
                    width: 18,
                    height: 18,
                    color: Colors.black,
                  ),
                  SizedBox(width: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("Garis berwarna",
                          style: TextStyle(color: Colors.black)),
                      Text(
                          "jarak tengah: ${widget.p2 / 100} m (Jalan Tengah)\n"),
                    ],
                  ),

                  // Spasi antara Container dan Column
                ],
              ),
            ),
          ),

          //       ],
          //     )
          //   ],
          // ),
        ],
      ),
    );
  }
}

Map<String, List<int>> proses2(
    int panjangs,
    int totalChickens,
    int chickensPerCage,
    int maxLevels,
    int cageWidth,
    int cageHeight,
    int lebar,
    int panjang,
    int p1,
    int p2,
    Map<int, int> stackDistribution) {
  Map<String, List<int>> result3 = {};
  Map<String, List<int>> tabel2 = {};

  int totalLengtha = 0;
  int totalLebar = 0;
  int indexA = 1; // Untuk key "a"
  int indexB = 1; // Untuk key "b"
  int indexC = 1; // Untuk key "c"
  int hitungKolomA = 0;

  int cagesRequired = (totalChickens / chickensPerCage).ceil();
  int fullStacks = cagesRequired ~/ maxLevels;

  int remainderCages = cagesRequired % maxLevels;
  int maxWidth = cageWidth * maxLevels;
  int heightTotal =
      cageHeight * ((cagesRequired > maxLevels) ? maxLevels : cagesRequired);

  // Menghitung panjang total struktur dengan mempertimbangkan sisa tempat atau lebih
  int totalLength = panjangs * (fullStacks + (remainderCages > 0 ? 1 : 0));

  List<int> generatePattern(int p1, int p2, int p3) {
    List<int> basePattern = [
      p1,
      p2,
      p1,
      p1,
      p2,
      p1,
      p1,
      p2,
      p1,
      p1,
      p2,
      p1,
      p1,
      p2,
      p1,
      p1,
      p2,
      p1,
      p1,
      p2,
      p1,
      p1,
      p2
    ];
    List<int> pattern = [];
    int totalLength = 0;
    int i = 0;

    while (totalLength + basePattern[i] <= p3) {
      if (totalLength + basePattern[i] <= p3) {
        pattern.add(basePattern[i]);
        totalLength += basePattern[i];
      }
      i = (i + 1) % basePattern.length;
    }

    // Cek dan perbaiki pola sesuai dengan ketentuan
    if (pattern.length >= 2 &&
        pattern[pattern.length - 1] == pattern[pattern.length - 2]) {
      pattern[pattern.length - 1] = p2;
    }

    return pattern;
  }

  void updateTabel(
      Map<String, List<int>> tabel, Map<int, int> hasil, int panjangs) {
    hasil.forEach((value, count) {
      for (var entry in tabel.entries) {
        if (count == 0) break;
        for (int i = 0; i < entry.value.length; i++) {
          if (entry.value[i] == panjangs) {
            entry.value[i] = value;
            count--;
            if (count == 0) break;
          }
        }
      }
    });
  }

  List<int> pattern = generatePattern(maxWidth, p2, lebar);

  for (int i = 0; i < pattern.length; i++) {
    if (totalLengtha + pattern[i] <= lebar) {
      if (pattern[i] == maxWidth) {
        result3['a$indexA'] = [maxWidth];
        indexA++;
      } else if (pattern[i] == p2) {
        result3['b$indexB'] = [p2];
        indexB++;
      }
      totalLengtha += pattern[i];
    } else {
      break;
    }
  }

  // Cek jika masih ada ruang tersisa dan bisa menambah pola
  if (totalLengtha <= lebar) {
    int remainingSpace = lebar - totalLengtha;
    if (remainingSpace > 0) {
      result3['c$indexC'] = [remainingSpace, 0]; // Sisanya
    } else {
      result3['c$indexC'] = [0, 0];
    }
  }

  int banyakbaris = panjang ~/ panjangs;
  int sisabaris = panjang % panjangs;
  print("lollo ${result3['c$indexC']!}");
  result3['c$indexC']![1] = sisabaris;

  for (int i = 0; i < result3.keys.toList().length; i++) {
    if (result3[result3.keys.toList()[i]]![0] == maxWidth) {
      hitungKolomA += 1;
    }
  }
  print("dads $hitungKolomA");

  for (int i = 0; i < result3.keys.toList().length; i++) {
    if (result3[result3.keys.toList()[i]]![0] == maxWidth) {
      for (int iq = 0; iq < banyakbaris; iq++) {
        result3[result3.keys.toList()[i]]!.add(panjangs);
      }
    }
  }

  // Pastikan hitungKolomA tidak nol sebelum melakukan pembagian
  if (hitungKolomA > 0) {
    int banyakbarisbagikolom = banyakbaris ~/ hitungKolomA;
    int sisabarisbarisbagikolom = banyakbaris % hitungKolomA;

    for (int ir = 0; ir < result3.keys.toList().length; ir++) {
      if (result3.keys.toList()[ir] != "c1") {
        tabel2[result3.keys.toList()[ir]] = [];
        for (int iq = 0;
            iq <
                result3[result3.keys.toList()[ir]]!
                    .where((element) =>
                        element == panjangs ||
                        element == -panjangs ||
                        element == p2)
                    .length;
            iq++) {
          tabel2[result3.keys.toList()[ir]]!.add(
              result3[result3.keys.toList()[ir]]!
                  .where((element) =>
                      element == panjangs ||
                      element == -panjangs ||
                      element == p2)
                  .toList()[iq]);
        }
      }
    }
  } else {
    // Handle case where hitungKolomA is zero
    print("Error: hitungKolomA is zero, division by zero avoided.");
    // Optionally, handle this case by setting default values or throwing an exception
  }

  updateTabel(tabel2, stackDistribution, panjangs);

  return tabel2;
}

Map<String, List<int>> proses3(
    int panjangs,
    int totalChickens,
    int chickensPerCage,
    int maxLevels,
    int cageWidth,
    int cageHeight,
    int lebar,
    int panjang,
    int p1,
    int p2,
    Map<int, int> stackDistribution) {
  Map<String, List<int>> result3 = {};
  Map<String, List<int>> tabel2 = {};

  int totalLengtha = 0;
  int totalLebar = 0;
  int indexA = 1; // Untuk key "a"
  int indexB = 1; // Untuk key "b"
  int indexC = 1; // Untuk key "c"
  int hitungKolomA = 0;

  int cagesRequired = (totalChickens / chickensPerCage).ceil();
  int fullStacks = cagesRequired ~/ maxLevels;

  int remainderCages = cagesRequired % maxLevels;
  int maxWidth = cageWidth * maxLevels;
  int heightTotal =
      cageHeight * ((cagesRequired > maxLevels) ? maxLevels : cagesRequired);

  // Menghitung panjang total struktur dengan mempertimbangkan sisa tempat atau lebih
  int totalLength = panjangs * (fullStacks + (remainderCages > 0 ? 1 : 0));

  List<int> generatePattern(int p1, int p2, int p3) {
    List<int> basePattern = [
      p1,
      p2,
      p1,
      p1,
      p2,
      p1,
      p1,
      p2,
      p1,
      p1,
      p2,
      p1,
      p1,
      p2,
      p1,
      p1,
      p2,
      p1,
      p1,
      p2,
      p1,
      p1,
      p2
    ];
    List<int> pattern = [];
    int totalLength = 0;
    int i = 0;

    while (totalLength + basePattern[i] <= p3) {
      if (totalLength + basePattern[i] <= p3) {
        pattern.add(basePattern[i]);
        totalLength += basePattern[i];
      }
      i = (i + 1) % basePattern.length;
    }

    // Cek dan perbaiki pola sesuai dengan ketentuan
    if (pattern.length >= 2 &&
        pattern[pattern.length - 1] == pattern[pattern.length - 2]) {
      pattern[pattern.length - 1] = p2;
    }

    return pattern;
  }

  void updateTabel(
      Map<String, List<int>> tabel, Map<int, int> hasil, int panjangs) {
    hasil.forEach((value, count) {
      for (var entry in tabel.entries) {
        if (count == 0) break;
        for (int i = 0; i < entry.value.length; i++) {
          if (entry.value[i] == panjangs) {
            entry.value[i] = value;
            count--;
            if (count == 0) break;
          }
        }
      }
    });
  }

  List<int> pattern = generatePattern(maxWidth, p2, lebar);

  for (int i = 0; i < pattern.length; i++) {
    if (totalLengtha + pattern[i] <= lebar) {
      if (pattern[i] == maxWidth) {
        result3['a$indexA'] = [maxWidth];
        indexA++;
      } else if (pattern[i] == p2) {
        result3['b$indexB'] = [p2];
        indexB++;
      }
      totalLengtha += pattern[i];
    } else {
      break;
    }
  }

  // Cek jika masih ada ruang tersisa dan bisa menambah pola
  if (totalLengtha <= lebar) {
    int remainingSpace = lebar - totalLengtha;
    if (remainingSpace > 0) {
      result3['c$indexC'] = [remainingSpace, 0]; // Sisanya
    } else {
      result3['c$indexC'] = [0, 0];
    }
  }

  int banyakbaris = panjang ~/ panjangs;
  int sisabaris = panjang % panjangs;
  print("lollo ${result3['c$indexC']!}");
  result3['c$indexC']![1] = sisabaris;

  for (int i = 0; i < result3.keys.toList().length; i++) {
    if (result3[result3.keys.toList()[i]]![0] == maxWidth) {
      hitungKolomA += 1;
    }
  }
  print("dads $hitungKolomA");

  for (int i = 0; i < result3.keys.toList().length; i++) {
    if (result3[result3.keys.toList()[i]]![0] == maxWidth) {
      for (int iq = 0; iq < banyakbaris; iq++) {
        result3[result3.keys.toList()[i]]!.add(panjangs);
      }
    }
  }

  // Pastikan hitungKolomA tidak nol sebelum melakukan pembagian
  if (hitungKolomA > 0) {
    int banyakbarisbagikolom = banyakbaris ~/ hitungKolomA;
    int sisabarisbarisbagikolom = banyakbaris % hitungKolomA;

    for (int ir = 0; ir < result3.keys.toList().length; ir++) {
      if (result3.keys.toList()[ir] != "c1") {
        tabel2[result3.keys.toList()[ir]] = [];
        for (int iq = 0;
            iq <
                result3[result3.keys.toList()[ir]]!
                    .where((element) =>
                        element == panjangs ||
                        element == -panjangs ||
                        element == p2)
                    .length;
            iq++) {
          tabel2[result3.keys.toList()[ir]]!.add(
              result3[result3.keys.toList()[ir]]!
                  .where((element) =>
                      element == panjangs ||
                      element == -panjangs ||
                      element == p2)
                  .toList()[iq]);
        }
      }
    }
  } else {
    // Handle case where hitungKolomA is zero
    print("Error: hitungKolomA is zero, division by zero avoided.");
    // Optionally, handle this case by setting default values or throwing an exception
  }

  updateTabel(tabel2, stackDistribution, panjangs);

  return tabel2;
}
