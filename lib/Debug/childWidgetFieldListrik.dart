import 'package:rawatt/Debug/childWidgetFieldMaggot.dart';
import 'package:rawatt/components/card_field.dart';
import 'package:rawatt/components/inputan.dart';
import 'package:rawatt/components/tabCostume.dart';
import 'package:rawatt/constants.dart';
import 'package:rawatt/model/dosis/fieldku_kolam1.dart';
import 'package:rawatt/screens/convert/component/Widget_Jenis_Tanah.dart';
import 'package:rawatt/screens/convert/component/Widget_Massa_Tanah.dart';
import 'package:rawatt/screens/convert/component/Widget_pH_indikator.dart';
import 'package:rawatt/screens/convert/component/inisialisasi_var.dart';
import 'package:rawatt/screens/convert/screens/dolomit/myMainDolomit.dart';
import 'package:rawatt/screens/convert/screens/dosis_pupuk_tanaman/dosis_pupuk_tanaman.dart';
import 'package:rawatt/screens/login_view.dart';

import 'package:rawatt/size_config.dart';
import 'package:flutter/material.dart';

import 'package:function_tree/function_tree.dart';

import '../../../components/card_expanded.dart';
import '../../../components/card_img.dart';
import '../../../components/card_penjelas.dart';
import '../../../components/card_pupuk.dart';
import '../../../model/MenuRawatan/mdl_MenuRawatan.dart';
import '../../../model/datafix.dart';
import '../../../model/dosis/fieldku_campur.dart';
import '../../../model/kalkulator/mdl_KatMediatanam.dart';
import '../../../model/kalkulator/mdl_KatRumus.dart';
import '../../../model/kalkulator/mdl_KatTanah.dart';
import '../../../model/perusahaan/mdl_KatPerusahaan.dart';
import '../../../model/product/mdl_Produk.dart';
import '../../../rumus.dart';
import 'package:auto_size_text/auto_size_text.dart';

import 'package:get/get.dart';

import '../screens/convert/component/Widget_Jarak_Tanaman.dart';
import '../screens/convert/component/Widget_Jenis_Pot.dart';
import '../screens/convert/screens/dolomit/Dolomit_display.dart';
import '../screens/details/component/component.dart';

class childWidgetFieldListrik extends StatefulWidget {
  final Function(String) onChangeState;

  const childWidgetFieldListrik({
    super.key,
    required this.onChangeState,
  });

  @override
  State<childWidgetFieldListrik> createState() =>
      _childWidgetFieldListrikState();
}

int indexMediaLahanListrik = 0;
// Map dataRumusLuasLahan = {};
// double hasilLahan = 0.0;
// // int indexObjectIndexSelectedEdit = 0;

String hargapHListrik = "0";

MyData? MyDataFilterOBJListrik;

// List<KategoriRumus> datakategorirum = [];

double hargaTotalpHListrik = 0;

Map<dynamic, dynamic> hargaDosisListrik = {};
Map<dynamic, dynamic> aDosisListrik = {};

Map<String, String> hagaDosisListrik = {};

MyData databarus1 = parentData[0];
List<MyData> datas111 = [];

void hitungProsesListrik() {
  if (MyDataFilterOBJListrik!.propertyLainnya["adaUkurPH"] == false) {
    hargaTotalpHListrik = 0;
  } else {
    hargaTotalpHListrik =
        double.tryParse(hargapHListrik)! * (cariValue("KpH") * 1000);
  }

  // Perhitungan takaran berdasarkan bentuk lahan

  datas111[objectindex] = MyDataFilterOBJListrik!;

  datas111[objectindex].propertyLainnya["ketebalanTanah"] =
      MyDataFilterOBJListrik!.propertyLainnya["ketebalanTanah"];

  datas111[objectindex].propertyLainnya["aHBaterai"] =
      MyDataFilterOBJListrik!.propertyLainnya["aHBaterai"];

  datas111[objectindex].propertyLainnya["keperluanLainnya"] =
      MyDataFilterOBJListrik!.propertyLainnya["keperluanLainnya"];

  datas111[objectindex].propertyLainnya["jamMatahari"] =
      MyDataFilterOBJListrik!.propertyLainnya["jamMatahari"];
  datas111[objectindex].propertyLainnya["DayaPanel"] =
      MyDataFilterOBJListrik!.propertyLainnya["DayaPanel"];

  setPreference();
}

// KategoriRumus? datamediatanamtam;
int objectindex = 0;

class _childWidgetFieldListrikState extends State<childWidgetFieldListrik> {
  double populasiTanam1Ha = 0;
  double populasiPetak = 0;

  // void prosesPh(){
  //
  // }
  //
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    Future.microtask(() {
      // widget.onChangeState(datas111[objectindex].hasilTotal);
    });
    // datamediatanamtam = dataKategoriRumus1.where((element) => element.id_MenuRawatan==c.indexMenuRawatan.value && element.idMediaTanam == 0).toList().where((element) => element.nama == "Persegi Panjang").toList().first;
  }

  List<TextEditingController> myControlersso1 = [];
  List<TextEditingController> myControlerssoBatrai = [];
  int indexinverter = 0;
  int indexscc = 0;
  int indexJb = 0;
  List<Widget> fieldo = [];
  List<Widget> fieldoBaterai = [];
  double TotalDayaJam = 0;
  double TotalKebutuhanInverter = 0;
  double TotalKebutuhanBaterai = 0;
  double TotalKebutuhanSCC = 0;
  double TotalArusSCC = 0;
  double TotalKebutuhanPanel = 0;
  Map scc = {
    "PWM": [60, "(berkisar 60 %- 70 %)"],
    "MPPT": [90, "(berikisar 90 %- 96%)"]
  };
  Map inverter = {
    "PSW": [95, " Pure Sine Wave Inverter berkisar 90 %- 95 %"],
    "MSW": [85, "Modified Sine Wave Inverter berikisar 75 %- 85%"]
  };

  Map JenisBatteray = {
    "VRLA": [
      2.0,
      0.0,
      "Discharge limit Aki (Dod) VRLA = 50% dari kapasitasnya"
    ],
    "LifePo4": [
      1.25,
      0.0,
      "Discharge limit Aki (Dod) LifePo4 = 80% dari kapasitasnya"
    ]
  };

  double totalKebutuhanDayainverter = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    databarus1 = MyData(
        komoditi: "Jenis Pemupukan",
        boolKom: false,
        boolKomHarga: false,
        visiKom: false,
        pupuk: [
          Pupukw(
              boolPup: false,
              visiPup: false,
              namaPupu: dataKategoriMenuRawatan[c.indexMenuRawatan.value]
                  .perlengkapan[0],
              watt: '0',
              LamaListring: '0',
              Rumus: '0',
              hasil: '0',
              img: dataKategoriMenuRawatan[c.indexMenuRawatan.value]
                  .img_banner[1])
        ],
        luas: "0",
        visiKomHarga: false,
        dataHarga: golonganListriks(
            c.indexsubMenuRawatan.value, c.indexMenuRawatan.value, "yes"),
        hasilTotal: "0.0",
        //ini penting
        hasilRp: 0,
        indexsubmenu: c.indexsubMenuRawatan.value,
        indexmenu: c.indexMenuRawatan.value,
        idmediatanam: c.selectedItemCalcT.value,
        rumus: dataKategoriMenuRawatan[c.indexMenuRawatan.value]
            .rumus[c.selectedItemCalcT.value],
        multi: false,
        kesimpulansub: "",
        kesimpulanAkhir: "kesimpulanAkhir",
        varii: getDataTakaranDosisTanamanGNew(
            c.indexsubMenuRawatan.value, "(LMt/10000)*JPk", 0.0.toString()),
        kategoriRumusKu: List.of(FdatakategoryRumus(
            c.indexMenuRawatan.value,
            List<KategoriRumus>.from(List.generate(
              kategoriRumus.length,
              (i) => KategoriRumus(
                id: i,
                idKalkulasi: kategoriRumus[i]["idKalkulasi"],
                idMediaTanam: kategoriRumus[i]["idMediaTanam"],
                vari: kategoriRumus[i]["vari"],
                nama: kategoriRumus[i]["nama"],
                rumus: kategoriRumus[i]["rumus"],
                valuess: kategoriRumus[i]["value"],
                // fieldValue: kategoriRumus[i]["fieldValue"],
                img: kategoriRumus[i]["img"],
                id_MenuRawatan: kategoriRumus[i]["id_MenuRawatan"],
              ),
            )),
            c.selectedItemCalcT.value)),
        propertyLainnya:
            deepCopyMap(tambahanPropertyKal[c.indexMenuRawatan.value]),
        id: 0,
        namaId: '');
    List<MyData> datas111 = [databarus1];

    MyDataFilterOBJListrik = datas111[objectindex];

    indexMediaLahanListrik = MyDataFilterOBJListrik!
        .propertyLainnya["tampungan"]["indexBentukMediaTanam"];
    MyDataFilterOBJListrik!.propertyLainnya["tampungan"]
            ["indexBentukMediaTanam"] =
        datas111[objectindex].propertyLainnya["tampungan"]
            ["indexBentukMediaTanam"];
    // indexMediaLahanListrik = 0;

    MyDataFilterOBJListrik!.propertyLainnya["satuanMediaLahan"][1] =
        datas111[objectindex].propertyLainnya["satuanMediaLahan"][1];

    MyDataFilterOBJListrik!.propertyLainnya["satuanMediaLahan"][0] =
        datas111[objectindex].propertyLainnya["satuanMediaLahan"][0];

    print(
        "data dosis ${MyDataFilterOBJListrik!.varii.map((e) => e.dataDosis)}");

    for (var data in MyDataFilterOBJListrik!.varii.map((e) => e.dataDosis)) {
      data.forEach((key, value) {
        hagaDosisListrik[key] = "0";
      });
    }

    hagaDosisListrik.forEach((key, value) {
      hagaDosisListrik[key] =
          dataProductsObj.where((element) => element.nama == key).first.harga;
    });

    if (datas111[objectindex].propertyLainnya["pHData"].isEmpty) {
      MyDataFilterOBJListrik!.propertyLainnya["pHData"] = {
        "hasil": 0.0,
        "pHDitanya": 6.1,
        "pHDiket": 6.0
      };
      // indikatorpH["hasil"] = 0.0;s
    } else {
      listPHIndikator[0].variabels["pHDiket"][1] =
          datas111[objectindex].propertyLainnya["pHData"]["pHDiket"];
      listPHIndikator[0].variabels["pHDitanya"][1] =
          datas111[objectindex].propertyLainnya["pHData"]["pHDitanya"];
      // datainputan.value[2] = datas111[objectindex].propertyLainnya["pHData"]["hasil"];

      MyDataFilterOBJListrik!.propertyLainnya["pHData"] =
          datas111[objectindex].propertyLainnya["pHData"];
    }

    c.id_type_tanah.value =
        MyDataFilterOBJListrik!.propertyLainnya["tampungan"]["indexJenisTanah"];

    MyDataFilterOBJListrik!.propertyLainnya["tampungan"]["indexJenisTanah"] =
        datas111[objectindex].propertyLainnya["tampungan"]["indexJenisTanah"];

    c.indexdropdownPrushn.value =
        MyDataFilterOBJListrik!.propertyLainnya["tampungan"]["indexperusahaan"];

    MyDataFilterOBJListrik!.propertyLainnya["tampungan"]["indexperusahaan"] =
        datas111[objectindex].propertyLainnya["tampungan"]["indexperusahaan"];

    // ==============================================
    //
    print(
        "indexss ${c.indexdropdownjenisPemupukan.value} ${datas111[objectindex].propertyLainnya["tampungan"]["indexjenisPupuk"]}");
    MyDataFilterOBJListrik!.propertyLainnya["tampungan"]["indexjenisPupuk"] =
        datas111[objectindex].propertyLainnya["tampungan"]["indexjenisPupuk"];

    MyDataFilterOBJListrik!.propertyLainnya["ketebalanTanah"] =
        datas111[objectindex].propertyLainnya["ketebalanTanah"];

    c.indexdropdownjenisPemupukan.value =
        MyDataFilterOBJListrik!.propertyLainnya["tampungan"]["indexjenisPupuk"];

    print("fi4 => $hargaDosisListrik}");

    hargapHListrik = dataProductsObj
        .where((element) => element.nama == "dolomit")
        .first
        .harga;
    //
    dataVariabel = List.from(
        MyDataFilterOBJListrik!.propertyLainnya["keperluanLainnya"])[0];
    //
    // print("asd ${dataVariabel}");
    myControlersso1 = myControl(dataVariabel);
    fieldo = fieldso(true, dataVariabel, myControlersso1);

    dataVariabelbaterai = {
      "Volt Aki (Baterai Volt)":
          MyDataFilterOBJListrik!.propertyLainnya["ketebalanTanah"],
      "Kapasitas Baterai (Ah)":
          MyDataFilterOBJListrik!.propertyLainnya["aHBaterai"],
      "jam Matahari (Jam)":
          MyDataFilterOBJListrik!.propertyLainnya["jamMatahari"],
      "DayaPanel (Wp)": MyDataFilterOBJListrik!.propertyLainnya["DayaPanel"],
    };

    myControlerssoBatrai = myControl(dataVariabelbaterai);
    fieldoBaterai = fieldso(false, dataVariabelbaterai, myControlerssoBatrai);

    onPresoqw(indexs);
  }

  int indexs = 0;

  @override
  Widget build(contexty) {
    print("asd $dataVariabel");
    print("asd $fieldo");

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: defaultPadding / 2),
      child: Obx(() {
        // a();
        return Column(
          children: [
            Padding(
              padding: EdgeInsets.all(defaultPadding / 2),
              child: imageCostum(
                  "assets/images/MenuRawatan/RawatTanam/rangkaian.jpg"),
            ),
            SizedBox(
              height: defaultPadding / 2,
            ),
            cardWithImg(
                "Tambahkan Daya (watt) Perangkat Listrik : ", 30, Container()),
            SizedBox(
              height: defaultPadding,
            ),
            AutoSizeText(
              "Daya (watt) Perangkat Listrik",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.normal,
                fontSize: 20,
                color: kTextColor,
              ),
              minFontSize: 12,
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(
              height: defaultPadding,
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(.7),
                  border: Border.all(
                      style: BorderStyle.solid,
                      color: warnas("0b5394"),
                      width: 3.5),
                  // color: Theme.of(context).cardColor,
                  borderRadius: BorderRadius.circular(15)),
              child: CardpHs(
                title: "Tambahakan Daya Perangkat : ",
                hasilAkhir: "",
                cardornot: false,
                sizes: heightfit(14),
                texts: "",
                multitext: [],
                tema: Colors.green.shade800,
                cardCostume: Container(),
                id: 0,
                widgetCostum: Column(
                  children: [
                    SizedBox(
                      height: defaultPadding,
                    ),
                    ListView.builder(
                        padding: EdgeInsets.zero,
                        itemCount: MyDataFilterOBJListrik!
                            .propertyLainnya["keperluanLainnya"].length,
                        shrinkWrap: true,
                        // Menyesuaikan ukuran dengan jumlah item
                        physics: const NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        // padding: const EdgeInsets.symmetric(horizontal: 56),
                        addRepaintBoundaries: true,
                        itemBuilder: (context, indexFixs) {
                          // final item = dataParentss.toList()[index % widget.items.length];
                          // dataParentss[indexK].pupuk[indexFixs].hasil = hargaObject["hasilAkhirPerObject"].toString();
                          return ExpandingCards(
                            height: 300,
                            indexFix: indexFixs,
                            // len: dataParentss[indexK].pupuk.length,
                            len: MyDataFilterOBJListrik!
                                .propertyLainnya["keperluanLainnya"].length,
                            gridview: false,
                            axisCount: 3,
                            onchange: (indekpuu) {
                              indexs = indexFixs;

                              // hasilTotal(indexK, indexFixs, dataParentss[indexK],
                              //     widget.waktu);
                            },
                            img: dataKategoriMenuRawatan[
                                    c.indexMenuRawatan.value]
                                .img_banner[1],
                            title: MyDataFilterOBJListrik!
                                    .propertyLainnya["keperluanLainnya"]
                                [indexFixs]["Nama Pengeluaran"],
                            subtitle:
                                "${MyDataFilterOBJListrik!.propertyLainnya["keperluanLainnya"][indexFixs]["Watt Hours"]} Watt",
                            penjelas: "",
                            // "Dengan \nDaya ${dataParentss[indexK].pupuk[indexFixs].namaPupu} : ${dataParentss[indexK].pupuk[indexFixs].watt} Watt\nTotal daya : ${dataParentss[indexK].pupuk[indexFixs].hasil} Watt \nSelama waktu: ${dataParentss[indexK].pupuk[indexFixs].LamaListring} Jam ",
                            dialog: Container(),
                            tambah: (LO) {
                              Future.microtask(() {
                                setState(() {});
                              });
                              // setState(() {
                              MyDataFilterOBJListrik!
                                  .propertyLainnya["keperluanLainnya"]
                                  .add({
                                "Nama Pengeluaran": "Listrik",
                                "Daya (watt)": 0.0,
                                "Total Nyala (jam)": 0,
                                "Watt Hours": 0
                              });
                              // MyDataFilterOBJListrik!
                              //     .propertyLainnya["keperluanLainnya"][indexFixs] = dataVariabel;
                              // dataVariabel = {
                              //   "Nama Pengeluaran": "Listrik",
                              //   "Daya (watt)": 0.0,
                              //   "Total Nyala (jam)": 0,
                              //   "Watt Hours": 0
                              // };
                              // dataVariabel =  {
                              //   "Nama Pengeluaran": "Listrik",
                              //   "Daya (watt)": 0.0,
                              //   "Total Nyala (jam)" :0,
                              //   "Watt Hours":0
                              // };
                              // dataVariabel = List.from(MyDataFilterOBJListrik!
                              //     .propertyLainnya["keperluanLainnya"]).last;
                              // fieldo = fieldso(dataVariabel,indexFixs);
                              // onPresoqw(List.from(MyDataFilterOBJListrik!
                              //     .propertyLainnya["keperluanLainnya"]).length-1);
                              // setPreference();
                              // setPreference();
                              // });
                            },
                            kurang: (s) {
                              Future.microtask(() {
                                setState(() {});
                              });
                              // setState(() {
                              MyDataFilterOBJListrik!
                                  .propertyLainnya["keperluanLainnya"]
                                  .removeAt(indexFixs);
                              onPresoqw(indexs);
                              // });
                              // setPreference();
                            },
                            costume: Column(
                              children: [
                                FittedBox(
                                  child: Container(
                                    height: (c.indexMenuRawatan.value == 2)
                                        ? 560
                                        : 350,
                                    width: 300,
                                    padding:
                                        EdgeInsets.only(top: defaultPadding),
                                    child: CardpHs(
                                      title: "Edit Pengeluaran : ",
                                      hasilAkhir: "",
                                      cardornot: false,
                                      sizes: heightfit(18),
                                      texts: "",
                                      multitext: [],
                                      tema: Colors.green.shade800,
                                      cardCostume: Container(),
                                      id: 0,
                                      widgetCostum: Container(
                                        child: SingleChildScrollView(
                                          child: Column(
                                            children: [
                                              fieldo[0],
                                              fieldo[1],
                                              fieldo[2],
                                              fieldo[3],
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: defaultPadding * 3,
                                ),
                              ],
                            ),
                          );
                        }),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: defaultPadding,
            ),
            AutoSizeText(
              "Total Daya Jam : ",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.normal,
                fontSize: 20,
                color: kTextColor,
              ),
              minFontSize: 12,
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(
              height: defaultPadding / 2,
            ),
            Container(
                padding: EdgeInsets.symmetric(
                  horizontal: defaultPadding / 3,
                  vertical: defaultPadding / 3,
                ),
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  color: Colors.orange,
                  // color: Theme.of(context).cardColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  "$TotalDayaJam Watt",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                )),
            SizedBox(
              height: defaultPadding,
            ),
            CardpHs(
              title: "Perhitungan Batrai\n",
              hasilAkhir: "${fieldo[2]}\n",
              cardornot: false,
              sizes: heightfit(18),
              texts: "Kebutuhan Jumlah AKI ",
              multitext: [],
              tema: Colors.green.shade800,
              cardCostume: Container(),
              id: 0,
              widgetCostum: Column(
                children: [
                  SizedBox(
                    height: defaultPadding,
                  ),
                  Padding(
                    padding: EdgeInsets.all(defaultPadding / 2),
                    child: imageCostum(
                        "assets/images/MenuRawatan/RawatTanam/inverter.jpg"),
                  ),
                  DropDowns(
                    (newActivity) {
                      Future.microtask(() {
                        setState(() {});
                      });

                      indexinverter =
                          inverter.keys.toList().indexOf(newActivity);
                      onPresoqw(indexs);
                    },
                    Colors.green,
                    inverter.keys.toList(),
                    "PWM",
                    inverter.keys.toList()[indexinverter],
                    "Type Sistem Inverter: ",
                    [],
                  ),
                  SizedBox(
                    height: defaultPadding / 2,
                  ),
                  cardWithImg(
                      "Total kebutuhan Daya inverter : ",
                      20,
                      Column(
                        children: [
                          Text("$TotalKebutuhanInverter Watt",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                                color: Colors.white,
                              )),
                        ],
                      )),
                  Padding(
                    padding: EdgeInsets.all(defaultPadding / 2),
                    child: imageCostum(
                        "assets/images/MenuRawatan/RawatTanam/baterai.jpg"),
                  ),
                  Padding(
                    padding: EdgeInsets.all(defaultPadding / 2),
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        color: warnas(List.of(
                                filtersdata[c.selectedItemCalcT.value]
                                    .studiKasus)
                            .map((e) => e.values)
                            .toList()[0]
                            .first["warna"]),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Center(
                          child: Text(
                        "Kebutuhan Jumlah AKI ",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: heightfit(sT16),
                        ),
                      )),
                    ),
                  ),
                  fieldoBaterai[0],
                  Padding(
                    padding: EdgeInsets.all(defaultPadding / 2),
                    child: Column(
                      children: [
                        Text(
                          "Tegangan Umum Baterai \n",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                            fontSize: heightfit(sT18),
                          ),
                        ),
                        Text(
                          "12V: Paling banyak digunakan untuk sistem kecil atau menengah\n",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black54,
                            fontSize: heightfit(sT16),
                          ),
                        ),
                        Text(
                          "24V: Digunakan untuk sistem yang sedikit lebih besar, tetapi tidak seumum 12V\n",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black54,
                            fontSize: heightfit(sT16),
                          ),
                        ),
                        Text(
                          "48V: Umumnya ditemukan pada sistem solar panel besar atau komersial.\n",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black54,
                            fontSize: heightfit(sT16),
                          ),
                        ),
                      ],
                    ),
                  ),
                  fieldoBaterai[1],
                  Padding(
                    padding: EdgeInsets.all(defaultPadding / 2),
                    child: Column(
                      children: [
                        Text(
                          "Kapasitas (Ah) Umum \n",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                            fontSize: heightfit(sT18),
                          ),
                        ),
                        Text(
                          "Baterai 50Ah hingga 200Ah: Sangat umum untuk keperluan rumah tangga.\n",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black54,
                            fontSize: heightfit(sT16),
                          ),
                        ),
                        Text(
                          "Di atas 200Ah: Biasanya untuk aplikasi lebih besar seperti bangunan komersial atau industri kecil.",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black54,
                            fontSize: heightfit(sT16),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: heightfit(defaultPadding / 2),
                            vertical: heightfit(defaultPadding / 2)),
                        // height: 200,
                        width: heightfit(double.infinity),
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
                                  color: Colors.green.withOpacity(.3))
                            ]),
                        child: Stack(
                          children: [
                            Positioned(
                              bottom: 0,
                              right: 0,
                              // left: 0,
                              child: Container(
                                height: heightfit(90),
                                width: heightfit(100),
                                decoration: BoxDecoration(
                                    color: Colors.green.shade100,
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(0),
                                        bottomRight: Radius.circular(20),
                                        topLeft: Radius.circular(90),
                                        topRight: Radius.circular(0)),
                                    // border:
                                    //     Border.all(color: kTextColor.withOpacity(.8), width: .2)
                                    boxShadow: [
                                      BoxShadow(
                                          blurRadius: 10,
                                          offset: Offset(-1, 8),
                                          color: Colors.green.withOpacity(.3))
                                    ]),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(
                                defaultPadding,
                              ),
                              child: Column(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color: warnas(List.of(filtersdata[
                                                  c.selectedItemCalcT.value]
                                              .studiKasus)
                                          .map((e) => e.values)
                                          .toList()[0]
                                          .first["warna"]),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Padding(
                                      padding:
                                          EdgeInsets.all(defaultPadding / 2),
                                      child: Text(
                                        "Contoh yang umum di pasaran:",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                          fontSize: heightfit(sT20),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: defaultPadding,
                                  ),
                                  RichText(
                                      text: TextSpan(children: [
                                    TextSpan(
                                      text:
                                          "12V 100Ah (sering dijual sebagai satu unit standar untuk kebutuhan rumah tangga).\n\n",
                                      style: TextStyle(
                                        fontStyle: FontStyle.italic,
                                        color: kTextColor,
                                        fontSize: heightfit(sT16),
                                      ),
                                    ),
                                    TextSpan(
                                      text:
                                          "12V 200Ah (lebih besar untuk penggunaan intensif).\n\n",
                                      style: TextStyle(
                                        fontStyle: FontStyle.italic,
                                        color: kTextColor,
                                        fontSize: heightfit(sT16),
                                      ),
                                    ),
                                    // (dataVariabelbaterai["Volt Aki (Baterai Volt)"].isFinite)?JenisBatteray[JenisBatteray.keys.toList()[indexJb]][1].ceil():0
                                    TextSpan(
                                      text:
                                          "24V 100Ah atau 48V 50Ah (untuk sistem dengan efisiensi lebih tinggi).\n",
                                      style: TextStyle(
                                        fontStyle: FontStyle.italic,
                                        color: kTextColor,
                                        fontSize: heightfit(sT16),
                                      ),
                                    ),
                                  ])),
                                  SizedBox(
                                    height: defaultPadding / 2,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )),
                  ),
                  SizedBox(
                    height: defaultPadding,
                  ),
                  DropDowns(
                    (newActivity) {
                      Future.microtask(() {
                        setState(() {});
                      });

                      indexJb =
                          JenisBatteray.keys.toList().indexOf(newActivity);
                      onPresoqw(indexs);
                    },
                    Colors.green,
                    JenisBatteray.keys.toList(),
                    "LifePo4",
                    JenisBatteray.keys.toList()[indexJb],
                    "Type Baterai : ",
                    [],
                  ),
                  SizedBox(
                    height: defaultPadding / 2,
                  ),
                  Container(
                    child: Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: heightfit(defaultPadding / 2),
                            vertical: heightfit(defaultPadding / 2)),
                        // height: 200,
                        width: heightfit(double.infinity),
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
                                  color: Colors.green.withOpacity(.3))
                            ]),
                        child: Stack(
                          children: [
                            Positioned(
                              bottom: 0,
                              right: 0,
                              // left: 0,
                              child: Container(
                                height: heightfit(90),
                                width: heightfit(100),
                                decoration: BoxDecoration(
                                    color: Colors.green.shade100,
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(0),
                                        bottomRight: Radius.circular(20),
                                        topLeft: Radius.circular(90),
                                        topRight: Radius.circular(0)),
                                    // border:
                                    //     Border.all(color: kTextColor.withOpacity(.8), width: .2)
                                    boxShadow: [
                                      BoxShadow(
                                          blurRadius: 10,
                                          offset: Offset(-1, 8),
                                          color: Colors.green.withOpacity(.3))
                                    ]),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(
                                heightfit(defaultPadding),
                              ),
                              child: Column(
                                children: [
                                  Column(
                                    children: [
                                      RichText(
                                          text: TextSpan(children: [
                                        TextSpan(
                                          text: "Efisiensi (%) \n",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: kTextColor,
                                            fontSize: heightfit(sT16),
                                          ),
                                        ),
                                        TextSpan(
                                          text:
                                              "-${inverter.keys.toList()[indexinverter]} ${inverter[inverter.keys.toList()[indexinverter]][0]}% - ${inverter[inverter.keys.toList()[indexinverter]][1]} \n",
                                          style: TextStyle(
                                            fontStyle: FontStyle.italic,
                                            color: kTextColor,
                                            fontSize: heightfit(sT14),
                                          ),
                                        ),
                                        TextSpan(
                                          text:
                                              "\nDischarge limit Aki (Dod) (%) \n",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: kTextColor,
                                            fontSize: heightfit(sT16),
                                          ),
                                        ),
                                        // (dataVariabelbaterai["Volt Aki (Baterai Volt)"].isFinite)?JenisBatteray[JenisBatteray.keys.toList()[indexJb]][1].ceil():0
                                        TextSpan(
                                          text:
                                              "\nDischarge limit Aki (Dod) VRLA = 50% dari kapasitasnya dan 80% untuk Batteray LifePO4 \n\n- Maka ${JenisBatteray.keys.toList()[indexJb]} x ${JenisBatteray[JenisBatteray.keys.toList()[indexJb]][0]}\n- Total Daya Baterai ${(JenisBatteray[JenisBatteray.keys.toList()[indexJb]][1].isFinite) ? JenisBatteray[JenisBatteray.keys.toList()[indexJb]][1].ceil() : 0 * ((dataVariabelbaterai["Kapasitas Baterai (Ah)"].runtimeType != String) ? dataVariabelbaterai["Kapasitas Baterai (Ah)"] : double.parse(dataVariabelbaterai["Kapasitas Baterai (Ah)"]) * ((dataVariabelbaterai["Volt Aki (Baterai Volt)"].runtimeType != String) ? dataVariabelbaterai["Volt Aki (Baterai Volt)"] : double.parse(dataVariabelbaterai["Volt Aki (Baterai Volt)"])))}\n",
                                          style: TextStyle(
                                            fontStyle: FontStyle.italic,
                                            color: kTextColor,
                                            fontSize: heightfit(sT14),
                                          ),
                                        ),
                                      ])),
                                      Padding(
                                        padding:
                                            EdgeInsets.all(defaultPadding / 2),
                                        child: Container(
                                          height: 50,
                                          decoration: BoxDecoration(
                                            color: warnas(List.of(filtersdata[c
                                                        .selectedItemCalcT
                                                        .value]
                                                    .studiKasus)
                                                .map((e) => e.values)
                                                .toList()[0]
                                                .first["warna"]),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: Center(
                                              child: Text(
                                            "Total Baterai (AKI)",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                              fontSize: heightfit(sT16),
                                            ),
                                          )),
                                        ),
                                      ),
                                      cardWithImg(
                                          "${(JenisBatteray[JenisBatteray.keys.toList()[indexJb]][1].isFinite) ? (JenisBatteray[JenisBatteray.keys.toList()[indexJb]][1].isFinite) ? JenisBatteray[JenisBatteray.keys.toList()[indexJb]][1].ceil() : 0 : 0}",
                                          30,
                                          Container(
                                            child: Text(
                                              "Total kebutuhan Baterai (AKI)\nSusun secara seri",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                                fontSize: heightfit(sT16),
                                              ),
                                            ),
                                          ))
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )),
                  ),
                  SizedBox(
                    height: defaultPadding,
                  ),
                  Padding(
                    padding: EdgeInsets.all(defaultPadding / 2),
                    child: imageCostum(
                        "assets/images/MenuRawatan/RawatTanam/scc_PanelSolar.jpg"),
                  ),
                  DropDowns(
                    (newActivity) {
                      Future.microtask(() {
                        setState(() {});
                      });

                      indexscc = scc.keys.toList().indexOf(newActivity);
                      onPresoqw(indexs);
                    },
                    Colors.green,
                    scc.keys.toList(),
                    "MPPT",
                    scc.keys.toList()[indexscc],
                    "Type Sistem SCC: ",
                    [],
                  ),
                  SizedBox(
                    height: defaultPadding / 2,
                  ),
                  cardWithImg(
                      "Total kebutuhan Daya kerugian SCC : ",
                      20,
                      Column(
                        children: [
                          Text("$TotalKebutuhanSCC Watt \n$TotalArusSCC A",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                                color: Colors.white,
                              )),
                        ],
                      )),
                  Padding(
                    padding: EdgeInsets.all(defaultPadding / 2),
                    child: imageCostum(
                        "assets/images/MenuRawatan/RawatTanam/solar Panel-10.jpg"),
                  ),
                  Padding(
                    padding: EdgeInsets.all(defaultPadding / 2),
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        color: warnas(List.of(
                                filtersdata[c.selectedItemCalcT.value]
                                    .studiKasus)
                            .map((e) => e.values)
                            .toList()[0]
                            .first["warna"]),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Center(
                          child: Text(
                        "Kebutuhan Jumlah Panel ",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: heightfit(sT16),
                        ),
                      )),
                    ),
                  ),
                  SizedBox(
                    height: defaultPadding,
                  ),
                  fieldoBaterai[2],
                  fieldoBaterai[3],
                  Container(
                    child: Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: heightfit(defaultPadding / 2),
                            vertical: heightfit(defaultPadding / 2)),
                        // height: 200,
                        width: heightfit(double.infinity),
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
                                  color: Colors.green.withOpacity(.3))
                            ]),
                        child: Stack(
                          children: [
                            Positioned(
                              bottom: 0,
                              right: 0,
                              // left: 0,
                              child: Container(
                                height: heightfit(90),
                                width: heightfit(100),
                                decoration: BoxDecoration(
                                    color: Colors.green.shade100,
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(0),
                                        bottomRight: Radius.circular(20),
                                        topLeft: Radius.circular(90),
                                        topRight: Radius.circular(0)),
                                    // border:
                                    //     Border.all(color: kTextColor.withOpacity(.8), width: .2)
                                    boxShadow: [
                                      BoxShadow(
                                          blurRadius: 10,
                                          offset: Offset(-1, 8),
                                          color: Colors.green.withOpacity(.3))
                                    ]),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(
                                heightfit(defaultPadding),
                              ),
                              child: Column(
                                children: [
                                  Column(
                                    children: [
                                      RichText(
                                          text: TextSpan(children: [
                                        TextSpan(
                                          text: "Efisiensi (%) \n",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: kTextColor,
                                            fontSize: heightfit(sT16),
                                          ),
                                        ),
                                        TextSpan(
                                          text:
                                              "-${scc.keys.toList()[indexscc]} ${scc[scc.keys.toList()[indexscc]][0]}% \n- ${scc[scc.keys.toList()[indexscc]][1]} \n",
                                          style: TextStyle(
                                            fontStyle: FontStyle.italic,
                                            color: kTextColor,
                                            fontSize: heightfit(sT14),
                                          ),
                                        ),
                                      ])),
                                      Padding(
                                        padding:
                                            EdgeInsets.all(defaultPadding / 2),
                                        child: Container(
                                          height: 50,
                                          decoration: BoxDecoration(
                                            color: warnas(List.of(filtersdata[c
                                                        .selectedItemCalcT
                                                        .value]
                                                    .studiKasus)
                                                .map((e) => e.values)
                                                .toList()[0]
                                                .first["warna"]),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: Center(
                                              child: Text(
                                            "Total Panel ",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                              fontSize: heightfit(sT16),
                                            ),
                                          )),
                                        ),
                                      ),
                                      cardWithImg(
                                          "${(TotalKebutuhanPanel.isFinite) ? TotalKebutuhanPanel.ceil() : 0}",
                                          30,
                                          Container(
                                            child: Text(
                                              "- Total kebutuhan Panel ",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                                fontSize: heightfit(sT16),
                                              ),
                                            ),
                                          ))
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )),
                  )
                ],
              ),
            )
          ],
        );
      }),
    );
  }

  Padding cardWithImg(String penjelas, double size, Widget widgetCostume) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: defaultPadding / 2,
      ),
      child: Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          color: Colors.black12.withOpacity(.5),
          // color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
            Stack(
              children: [
                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                            dataKategoriMenuRawatan[c.indexMenuRawatan.value]
                                .img_banner[0]),
                        fit: BoxFit.cover,
                      ),
                    ),
                    foregroundDecoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.black.withOpacity(0),
                          Colors.black.withOpacity(1),
                        ],
                        stops: const [0.7, 1],
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    width: 400,
                    // height: 500,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      color: Colors.black12.withOpacity(.5),
                      // color: Theme.of(context).cardColor,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: defaultPadding / 2,
                        vertical: defaultPadding * 2,
                      ),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: heightfit(defaultPadding),
                                ),
                                Center(
                                    child: RichText(
                                  text: TextSpan(
                                    text: penjelas,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: size,
                                        color: kPrimaryLightColor),
                                  ),
                                )),
                                SizedBox(
                                  height: heightfit(defaultPadding / 2),
                                ),
                                Column(children: []),
                                SizedBox(
                                  height: heightfit(defaultPadding / 2),
                                ),
                                widgetCostume,
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: defaultPadding / 3,
                      vertical: defaultPadding / 3,
                    ),
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      // color: Theme.of(context).cardColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text("$TotalDayaJam",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> fieldso(bool totalDaya, Map data, List controllerr) {
    List<Widget> fieldsss = [];

    fieldsss = List<Widget>.generate(data.keys.toList().length, (index) {
      TextEditingController controllers =
          List<TextEditingController>.from(controllerr).toList()[index];

      return Fields(
        controller: (controllers.text.isEmpty)
            ? TextEditingController(text: "0")
            : controllers,
        // dataKategoriInisialisasi.where((element) => element.vari == data.keys.elementAt(index)[0].toString()).first.satuan
        satuan: "",
        title: data.keys.toList()[index].toString(),
        tema: Colors.green,
        onStateChange: (valu) {
          String values = valu;
          if (valu.isEmpty) {
            valu = "0";
          }

          onPresoqw(indexs);

          print(
              "total$TotalDayaJam ${List.of(MyDataFilterOBJListrik!.propertyLainnya["keperluanLainnya"]).map((e) => e["Watt Hours"]).toList()}");
        },
        enable: (totalDaya == false)
            ? true
            : (index == data.keys.toList().length - 1)
                ? false
                : true,
        inputType: (index == 0)
            ? TextInputType.text
            : TextInputType.numberWithOptions(decimal: true),
      );
    });

    return fieldsss;
  }

  Map dataVariabel = {};
  Map dataVariabelbaterai = {};

  void onPresoqw(int indesxs) {
    setState(() {
      Map data = dataVariabel;
      Map dataB = dataVariabelbaterai;
      // changeSatuan(satuanm,  dataVariabel);
      print("datanya $data");

      myControlersso1.asMap().forEach((index, element) {
        print("lolo ${data[data.keys.toList()[index]]}");
        data[data.keys.toList()[index]] =
            (element.text.isEmpty) ? "0" : element.text;

        // dataKategoriInisialisasi[dataKategoriInisialisasi
        //     .where((element) => element.vari == data.keys.toList()[index])
        //     .first
        //     .id]
        //     .nilai = double.tryParse((element.text.isEmpty)?"0":element.text)!;

        // if (MyDataFilterOBJListrik!
        //     .propertyLainnya["keperluanLainnya"][indexFixs][data[data.keys.toList()[index]]].runtimeType != String ){
        //   MyDataFilterOBJListrik!
        //       .propertyLainnya["keperluanLainnya"][indexFixs][data[data.keys.toList()[index]]] = (element.text.isEmpty)?"0":element.text;
        //
        //
        //
        //
        //
        //   MyDataFilterOBJListrik!.propertyLainnya["keperluanLainnya"][indexFixs]["Watt Hours"] = double.parse(data["Daya (watt)"].toString())*double.parse(data["Total Nyala (jam)"].toString());

        data["Watt Hours"] = double.parse(data["Daya (watt)"].toString()) *
            double.parse(data["Total Nyala (jam)"].toString());

        myControlersso1 = myControl(data);
        fieldo = fieldso(false, data, myControlersso1);
        dataVariabel = data;
        // };
        MyDataFilterOBJListrik!.propertyLainnya["keperluanLainnya"][indesxs] =
            dataVariabel.cast<String, Object>();
        print(
            "Print ${MyDataFilterOBJListrik!.propertyLainnya["keperluanLainnya"][indesxs]["Daya (watt)"]}");
      });

      TotalDayaJam =
          List.of(MyDataFilterOBJListrik!.propertyLainnya["keperluanLainnya"])
              .map((e) => e["Watt Hours"])
              .toList()
              .reduce((value, element) => value + element);

      myControlerssoBatrai.asMap().forEach((index, element) {
        dataB[dataB.keys.toList()[index]] =
            (element.text.isEmpty) ? "0" : element.text;

        TotalDayaJam =
            List.of(MyDataFilterOBJListrik!.propertyLainnya["keperluanLainnya"])
                .map((e) => e["Watt Hours"])
                .toList()
                .reduce((value, element) => value + element);

        TotalKebutuhanInverter = TotalDayaJam +
            (TotalDayaJam *
                ((100 - inverter[inverter.keys.toList()[indexinverter]][0]) /
                    100));
        TotalKebutuhanBaterai = TotalKebutuhanInverter /
            (double.parse(MyDataFilterOBJListrik!
                    .propertyLainnya["ketebalanTanah"]
                    .toString()) *
                double.parse(MyDataFilterOBJListrik!
                    .propertyLainnya["aHBaterai"]
                    .toString()));

        JenisBatteray[JenisBatteray.keys.toList()[indexJb]][1] =
            TotalKebutuhanBaterai *
                JenisBatteray[JenisBatteray.keys.toList()[indexJb]][0];

        myControlerssoBatrai = myControl(dataB);
        fieldoBaterai = fieldso(false, dataB, myControlerssoBatrai);
        dataVariabelbaterai = dataB;
        // MyDataFilterOBJListrik!.propertyLainnya = dataVariabelbaterai;

        MyDataFilterOBJListrik!.propertyLainnya["ketebalanTanah"] =
            dataVariabelbaterai["Volt Aki (Baterai Volt)"];
        MyDataFilterOBJListrik!.propertyLainnya["aHBaterai"] =
            dataVariabelbaterai["Kapasitas Baterai (Ah)"];
        MyDataFilterOBJListrik!.propertyLainnya["jamMatahari"] =
            dataVariabelbaterai["jam Matahari (Jam)"];
        MyDataFilterOBJListrik!.propertyLainnya["DayaPanel"] =
            dataVariabelbaterai["DayaPanel (Wp)"];
        print("nilai ${MyDataFilterOBJListrik!.propertyLainnya["DayaPanel"]}");
        print(
            "Print ${MyDataFilterOBJListrik!.propertyLainnya["keperluanLainnya"][indesxs]["Daya (watt)"]}");
      });

      TotalKebutuhanSCC = TotalDayaJam +
          (TotalDayaJam * ((100 - scc[scc.keys.toList()[indexscc]][0]) / 100));
      TotalArusSCC = ((TotalKebutuhanSCC /
                  double.parse(
                      MyDataFilterOBJListrik!.propertyLainnya["jamMatahari"])) /
              double.parse(MyDataFilterOBJListrik!
                  .propertyLainnya["ketebalanTanah"]
                  .toString())) *
          1.25;
      TotalKebutuhanPanel = TotalKebutuhanSCC /
          (double.parse(MyDataFilterOBJListrik!.propertyLainnya["jamMatahari"]
                  .toString()) *
              double.parse(MyDataFilterOBJListrik!.propertyLainnya["DayaPanel"]
                  .toString()));
    });
  }
}
