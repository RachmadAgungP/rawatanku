import 'package:rawatt/components/card_field.dart';
import 'package:rawatt/components/inputan.dart';
import 'package:rawatt/constants.dart';
import 'package:rawatt/rumus.dart';
import 'package:rawatt/screens/convert/_model.dart';
import 'package:rawatt/screens/convert/component/Widget_Jarak_Tanaman.dart';
import 'package:rawatt/screens/convert/component/Widget_Jenis_Dosis.dart';
import 'package:rawatt/screens/convert/screens/tunggal2majemuk_display/tunggal2majemuk_display.dart';
import 'package:rawatt/size_config.dart';
import 'package:flutter/material.dart';
import 'package:function_tree/function_tree.dart';
import 'dart:math';

import '../../component/inisialisasi_var.dart';

List<Map<String, dynamic>> dataTunggal2majemuk = [
  {
    "id": 0,
    "nama": "Kalkulasi Tunggal ke Majemuk",
    "img": "",
    "input": {
      "Dosis Pupuk": listdosisPupuk[stateIDdosis]
          .hasilAkhir
          .values
          .map((e) => e[1])
          .toList(),
      "SenyawaAktif": [0.0, 0.0, 0.0],
      "SenyawaTerkecil": [0.0, 0.0, 0.0],
      "SisaKandunganBahanAktifNPK": [0.0, 0.0, 0.0],
      "GrideFertilizer": ["15-15-15", "16-16-16"],
    },
    "rumus": {
      "SenyawaAktif": [
        'Dosis Pupuk * (46/100)',
        'Dosis Pupuk * (36/100)',
        'Dosis Pupuk * (60/100)'
      ],
      "Sisa Kadungan Bahan Aktif NPK": [
        'SenyawaAktif - SenyawaTerkecil',
        'SenyawaAktif - SenyawaTerkecil',
        'SenyawaAktif - SenyawaTerkecil'
      ],
      "Rumus Kalkulasi Kadungan Bahan Aktif NPK": [
        'SisaKandunganBahanAktifNPK * (100 / 46)',
        'SisaKandunganBahanAktifNPK * (100 / 36)',
        'SisaKandunganBahanAktifNPK * (100 / 60)'
      ]
    },
    "perhitungan": {
      "SenyawaAktif": ['Senyawa Aktif', "0.0"],
      "PLLahan": ["Populasi Luas Lahan", "0.0"],
      "keperluan": [
        "keperluan",
        ["1", "2", "3"]
      ]
    },
    "hasilAkhir": {
      "0": [
        "hasil proses 1",
        [0.0, 0.0, 0.0]
      ],
      "1": [
        "hasil proses 2",
        [0.0, 0.0, 0.0]
      ]
    },
  },
  {
    "id": 1,
    "nama": "Kalkulasi Tunggal ke Majemuk",
    "img": "",
    "input": {
      "Dosis Pupuk": listdosisPupuk[stateIDdosis]
          .hasilAkhir
          .values
          .map((e) => e[1])
          .toList(),
      "SenyawaAktif": [0.0, 0.0, 0.0],
      "SenyawaTerkecil": [0.0, 0.0, 0.0],
      "SisaKandunganBahanAktifNPK": [0.0, 0.0, 0.0],
      "GrideFertilizer": ["15-15-15", "16-16-16"],
    },
    "rumus": {
      "SenyawaAktif": [
        'Dosis Pupuk * (46/100)',
        'Dosis Pupuk * (36/100)',
        'Dosis Pupuk * (60/100)'
      ],
      "Sisa Kadungan Bahan Aktif NPK": [
        'SenyawaAktif - SenyawaTerkecil',
        'SenyawaAktif - SenyawaTerkecil',
        'SenyawaAktif - SenyawaTerkecil'
      ],
      "Rumus Kalkulasi Kadungan Bahan Aktif NPK": [
        'SisaKandunganBahanAktifNPK * (100 / 46)',
        'SisaKandunganBahanAktifNPK * (100 / 36)',
        'SisaKandunganBahanAktifNPK * (100 / 60)'
      ]
    },
    "perhitungan": {
      "SenyawaAktif": ['Senyawa Aktif', "0.0"],
      "PLLahan": ["Populasi Luas Lahan", "0.0"],
      "keperluan": [
        "keperluan",
        ["1", "2", "3"]
      ]
    },
    "hasilAkhir": {
      "0": [
        "hasil proses 1",
        [0.0, 0.0, 0.0]
      ],
      "1": [
        "hasil proses 2",
        [0.0, 0.0, 0.0]
      ]
    },
  }
];

class Tunggal2majemuk {
  int id;
  String nama;
  String img;
  Map<String, dynamic> input;
  Map<String, dynamic> rumus;
  Map<String, dynamic> output;
  Map<String, dynamic> perhitungan;
  Map<String, dynamic> hasilAkhir;

  Tunggal2majemuk(
      {required this.id,
      required this.nama,
      required this.img,
      required this.input,
      required this.rumus,
      required this.output,
      required this.perhitungan,
      required this.hasilAkhir});
}

List<dynamic> listTunggal2majemuk = [
  for (var i = 0; i < dataTunggal2majemuk.length; i++)
    Tunggal2majemuk(
        id: i,
        nama: dataTunggal2majemuk[i]["nama"],
        img: dataTunggal2majemuk[i]["img"],
        input: dataTunggal2majemuk[i]["input"],
        rumus: dataTunggal2majemuk[i]["rumus"],
        output: dataTunggal2majemuk[i]["output"],
        perhitungan: dataTunggal2majemuk[i]["perhitungan"],
        hasilAkhir: dataTunggal2majemuk[i]["hasilAkhir"]),
];

class ConvertTunggal2Majemuk extends StatefulWidget {
  final Color tema;

  const ConvertTunggal2Majemuk({super.key, required this.tema});
  @override
  _ConvertTunggal2MajemukState createState() => _ConvertTunggal2MajemukState();
}

void gethasil() {
  print("aktif voz");
  double kebutuhanNPKterkecil = 0;
  Map<String, dynamic> rumusku =
      Map.from(listTunggal2majemuk[stateIDdosis].rumus);
  // setState(() {
  //  =====================================================

  if (listdosisPupuk[stateIDdosis].nama == "Berat Pupuk") {
    listTunggal2majemuk[stateIDdosis].input["SenyawaAktif"] =
        listTunggal2majemuk[stateIDdosis].input["Dosis Pupuk"];

    listTunggal2majemuk[stateIDdosis].input["SenyawaTerkecil"] = [
      List.from(listTunggal2majemuk[stateIDdosis].input["Dosis Pupuk"])
          .cast<num>()
          .reduce(min)
          .toDouble()
    ];
  } else {
    List asi1 = convertListRumus(listTunggal2majemuk[stateIDdosis].input,
        List.from(rumusku["SenyawaAktif"]));

    listTunggal2majemuk[stateIDdosis].input["SenyawaAktif"] =
        asi1.map((e) => e.toString().interpret().toDouble()).toList();

    listTunggal2majemuk[stateIDdosis].input["SenyawaTerkecil"] = [
      asi1
          .map((e) => e.toString().interpret().toDouble())
          .toList()
          .cast<num>()
          .reduce(min)
    ];
  }

  //  =====================================================
  List asi2 = convertListRumus(listTunggal2majemuk[stateIDdosis].input,
      List.from(rumusku["Sisa Kadungan Bahan Aktif NPK"]));
  listTunggal2majemuk[stateIDdosis].input["SisaKandunganBahanAktifNPK"] =
      asi2.map((e) => e.toString().interpret().toDouble()).toList();

  //  =====================================================
  List asi3 = convertListRumus(listTunggal2majemuk[stateIDdosis].input,
      List.from(rumusku["Rumus Kalkulasi Kadungan Bahan Aktif NPK"]));
  listTunggal2majemuk[stateIDdosis].hasilAkhir["0"][1] =
      asi3.map((e) => e.toString().interpret().toDouble()).toList();
  // ================================================

  listTunggal2majemuk[stateIDdosis]
          .input["GrideFertilizer"][0]
          .toString()
          .contains("15")
      ? kebutuhanNPKterkecil =
          listTunggal2majemuk[stateIDdosis].input["SenyawaTerkecil"][0] *
              (100 / 15)
      : kebutuhanNPKterkecil =
          listTunggal2majemuk[stateIDdosis].input["SenyawaTerkecil"][0] *
              (100 / 16);

  // listTunggal2majemuk[0].hasilAkhir["0"][1].removeAt(listTunggal2majemuk[0]
  //       .hasilAkhir["0"][1]
  //       .lastIndexWhere((element) => element == 0.0));

  print(
      "angka ${List.from(listTunggal2majemuk[stateIDdosis].hasilAkhir["0"][1])}");
  List nul = [];

  List akhir = List.from(listTunggal2majemuk[stateIDdosis].hasilAkhir["0"][1])
      .map((e) => e == 0.0 ? e = kebutuhanNPKterkecil : e)
      .toList();
  // List.from(listTunggal2majemuk[stateIDdosis].hasilAkhir["0"][1])

  List daftarPupuk = ["Urea", "Sp-36", "KCL"];
  List daftarBahanAktif = ["NH4", "P2O5", "K2O"];
  int indexpenggantiNPK =
      List.from(listTunggal2majemuk[stateIDdosis].hasilAkhir["0"][1])
          .indexOf(0.0);
  daftarPupuk[indexpenggantiNPK] = "Phonska Plus";

  for (var i = 0; i < List.from(akhir).length; i++) {
    if (akhir[i] == kebutuhanNPKterkecil) {
      nul.add(i);
    }
  }

  if (nul.length > 1) {
    akhir.removeAt(nul.last);
    daftarPupuk.removeAt(nul.last);
  }

  print(
      "Kg kEBUTUHAN PUPUK 2 ${listTunggal2majemuk[stateIDdosis].input["SisaKandunganBahanAktifNPK"]}");
  listTunggal2majemuk[stateIDdosis].hasilAkhir["1"][1] = akhir;
  listTunggal2majemuk[stateIDdosis].hasilAkhir["1"][0] = daftarPupuk;

  datainputanT2M.value = [
    listTunggal2majemuk[stateIDdosis].input["Dosis Pupuk"],
    listTunggal2majemuk[stateIDdosis].input["SenyawaAktif"],
    listTunggal2majemuk[stateIDdosis].input["SenyawaTerkecil"][0],
    listTunggal2majemuk[stateIDdosis].hasilAkhir["1"][1],
    listTunggal2majemuk[stateIDdosis].input["SisaKandunganBahanAktifNPK"],
    listTunggal2majemuk[stateIDdosis].hasilAkhir["1"][0],
    listTunggal2majemuk[stateIDdosis].input["GrideFertilizer"][0]
  ];

  print("Kg kEBUTUHAN PUPUK $akhir");
  print("Nama kEBUTUHAN PUPUK $daftarPupuk");
  print("inilah ${listTunggal2majemuk[stateIDdosis].hasilAkhir["1"][0]}");
  // }
  // );
}

class _ConvertTunggal2MajemukState extends State<ConvertTunggal2Majemuk> {
  @override
  Widget build(BuildContext context) {
    Color tema = Color(0xFFec9500);
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          ProsesWidgetsold(
            datahasils: listTunggal2majemuk,
            dataproses: listdosisPupuk,
            tema: widget.tema,
            namaobj: "Dosis Pupuk",
            stateID: stateIDdosis,
            onChangeState: (id, input, proses, output) {
              setState(() {
                listTunggal2majemuk[stateIDdosis].input["Dosis Pupuk"] = output;
                stateIDdosis = id;
                // print("ol${output}");
              });
            },
          ),
          CardFields(
            warna: Colors.white,
            tema: widget.tema,
            judul: "Fertilizer : ",
            columns: Padding(
              padding: EdgeInsets.symmetric(horizontal: defaultPadding / 2),
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  DropDowns((newActivity) {
                    setState(
                      () {
                        listTunggal2majemuk[stateIDdosis]
                            .input["GrideFertilizer"] = [newActivity];
                        // typeGradeFertilizer = newActivity;

                        print(newActivity);
                      },
                    );
                  },
                      widget.tema,
                      dataTypeGradeFertil,
                      "gradefertil",
                      listTunggal2majemuk[stateIDdosis].input["GrideFertilizer"]
                          [0],
                      "Grade Fertil NPK: ",
                      []),
                ],
              ),
            ),
            onChangeState: () {},
            indexmenu: c.indexMenuRawatan.value,
            indexsubmenu: c.indexsubMenuRawatan.value,
          ),
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: widthfit(defaultPadding / 2)),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  elevation: 0,
                  backgroundColor: tema),
              // height: heightfit(30),
              child: Container(
                padding: EdgeInsets.symmetric(
                    horizontal: widthfit(defaultPadding / 2)),
                child: Text('Kalkulasi ',
                    style: TextStyle(
                        color: Colors.white, fontSize: heightfit(26))),
              ),
              onPressed: () {
                if (listTunggal2majemuk[stateIDdosis]
                    .input["Dosis Pupuk"]
                    .contains(0.0)) {
                  showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                            title: const Text('Angka Tidak Valid'),
                            content: const Text(
                                'Coba untuk Cek lagi ada Nilai yang terlewatkan'),
                            actions: <Widget>[
                              // TextButton(
                              //   onPressed: () =>
                              //       Navigator.pop(context, 'Cancel'),
                              //   child: const Text('Cancel'),
                              // ),
                              TextButton(
                                onPressed: () => Navigator.pop(context, 'OK'),
                                child: const Text('OK'),
                              ),
                            ],
                          ));
                } else {
                  setState(() {
                    gethasil();
                    // print(listPupukBerdasarkanPopulasis.output);
                  });
                  (SizeConfig.screenWidth! > 600)
                      ? Container()
                      :
                      // BlocProvider.of<Tunggal2MajemukBloc>(context).add(
                      //     Tunggal2MajemukEvent(dosisPupukValues, typeGradeFertilizer,
                      //         typeSatuanBahan));
                      Navigator.pushNamed(context, 'tunggal2majemuk_display');
                }
              },
              // color: kColor,
            ),
          ),
        ],
      ),
    );
  }
}
