import 'package:flutter/material.dart';
import 'package:rawatt/components/inputan.dart';

class PakanManager extends StatefulWidget {
  final Function(Map<String, dynamic>) onChanged;
  final List data;
  final Map dataProtein;
  final Map dataBoolAktifPakan;
  final String namaPliharaan;
  final bool isReset;
  const PakanManager(
      {super.key,
      required this.onChanged,
      required this.data,
      required this.namaPliharaan,
      required this.dataProtein,
      required this.dataBoolAktifPakan,
      required this.isReset});

  @override
  _PakanManagerState createState() => _PakanManagerState();
}

class _PakanManagerState extends State<PakanManager> {
  bool isPakanAlternatif1Enabled = false;
  bool isPakanAlternatif2Enabled = false;
  double pakanUtamaPercentage = 100;
  double pakanAlternatif1Percentage = 0;
  double pakanAlternatif2Percentage = 0;

  double proteinPakanUtama = 40;
  double proteinPakanAlternatif1 = 35;
  double kebutuhanProtein = 40;
  double proteinPakanAlternatif2 = 30;

  bool isProteinEditable = false;

  bool isProteinPakanUtamaEditable = false;
  bool isProteinPakanAlternatif1Editable = false;
  bool isProteinPakanAlternatif2Editable = false;

  String kekuranganProteinMessage = "";
  List dataPakanAlternatifLainnya = [];
  int selectedPakan = 0;
  void notifyChange() {
    // Memanggil callback yang diberikan dari parent widget dengan data pakan saat ini
    widget.onChanged({
      'pakanUtamaPercentage': pakanUtamaPercentage,
      'pakanAlternatif1Percentage': pakanAlternatif1Percentage,
      'pakanAlternatif2Percentage': pakanAlternatif2Percentage,
      'proteinPakanUtama': proteinPakanUtama,
      'proteinPakanAlternatif1': proteinPakanAlternatif1,
      'proteinPakanAlternatif2': proteinPakanAlternatif2,
      'kebutuhanProtein': kebutuhanProtein,
      'indexAlternatif2': double.tryParse(selectedPakan.toString())!,
      "isPakanAlternatif1Enabled": isPakanAlternatif1Enabled,
      "isPakanAlternatif2Enabled": isPakanAlternatif2Enabled
    });
  }

  double totalProteinUtama = 0;
  double totalProteinAlternatif1 = 0;
  double totalProteinAlternatif2 = 0;
  double totalProtein = 0;
  bool isresets = false;
  double kekuranganProtein = 0;
  void hitungKomposisi() {
    totalProteinUtama = pakanUtamaPercentage * (proteinPakanUtama / 100);
    totalProteinAlternatif1 =
        pakanAlternatif1Percentage * (proteinPakanAlternatif1 / 100);
    totalProteinAlternatif2 =
        pakanAlternatif2Percentage * (proteinPakanAlternatif2 / 100);

    totalProtein =
        totalProteinUtama + totalProteinAlternatif1 + totalProteinAlternatif2;

    kekuranganProtein = kebutuhanProtein - totalProtein;

    if (kekuranganProtein > 0) {
      setState(() {
        kekuranganProteinMessage =
            "Kekurangan protein: ${kekuranganProtein.toStringAsFixed(2)}%";
      });
    } else {
      setState(() {
        kekuranganProteinMessage = "";
      });
    }

    notifyChange();
  }

  void updatePakanPercentage() {
    double totalAlternatifPercentage =
        pakanAlternatif1Percentage + pakanAlternatif2Percentage;
    setState(() {
      pakanUtamaPercentage = 100 - totalAlternatifPercentage;

      if (pakanUtamaPercentage < 0) {
        pakanUtamaPercentage = 0;
        pakanAlternatif1Percentage =
            (pakanAlternatif1Percentage / totalAlternatifPercentage) * 100;
        pakanAlternatif2Percentage =
            (pakanAlternatif2Percentage / totalAlternatifPercentage) * 100;
      }
    });

    hitungKomposisi();
  }

  void applyAutomaticAdjustment() {
    double totalProteinUtama = pakanUtamaPercentage * (proteinPakanUtama / 100);
    double totalProteinAlternatif1 =
        pakanAlternatif1Percentage * (proteinPakanAlternatif1 / 100);
    double totalProteinAlternatif2 =
        pakanAlternatif2Percentage * (proteinPakanAlternatif2 / 100);

    double totalProtein =
        totalProteinUtama + totalProteinAlternatif1 + totalProteinAlternatif2;

    double kekuranganProtein = kebutuhanProtein - totalProtein;

    if (kekuranganProtein > 0) {
      double totalPakanPercentage = pakanUtamaPercentage +
          pakanAlternatif1Percentage +
          pakanAlternatif2Percentage;
      if (totalPakanPercentage > 0) {
        pakanUtamaPercentage = (pakanUtamaPercentage / totalPakanPercentage) *
            (100 - kekuranganProtein);
        pakanAlternatif1Percentage =
            (pakanAlternatif1Percentage / totalPakanPercentage) *
                (100 - kekuranganProtein);
        pakanAlternatif2Percentage =
            (pakanAlternatif2Percentage / totalPakanPercentage) *
                (100 - kekuranganProtein);
      }
    }

    updatePakanPercentage();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    pakanUtamaPercentage = widget.dataProtein["pakanUtamaPercentage"];
    pakanAlternatif1Percentage = double.tryParse(
        widget.dataProtein["pakanAlternatif1Percentage"].toString())!;
    pakanAlternatif2Percentage = double.tryParse(
        widget.dataProtein["pakanAlternatif2Percentage"].toString())!;

    kebutuhanProtein = widget.dataProtein["kebutuhanProtein"];

    proteinPakanUtama = widget.dataProtein["proteinPakanUtama"];
    proteinPakanAlternatif1 = widget.dataProtein["proteinPakanAlternatif1"];

    isPakanAlternatif1Enabled =
        widget.dataBoolAktifPakan["isPakanAlternatif1Enabled"];
    isPakanAlternatif2Enabled =
        widget.dataBoolAktifPakan["isPakanAlternatif2Enabled"];

    dataPakanAlternatifLainnya = widget.data
        .map((e) => "${e['nama']} = ${e['protein %']}% Protein")
        .toList();
    proteinPakanAlternatif2 = double.tryParse(widget.data
        .map((e) => e["protein %"])
        .toList()[selectedPakan]
        .toString())!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Kebutuhan Protein Peliharaan: ${kebutuhanProtein.toStringAsFixed(0)}%',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        if (isProteinEditable) ...[
          Slider(
            value: kebutuhanProtein,
            min: 0,
            max: 100,
            divisions: 100,
            label: kebutuhanProtein.toStringAsFixed(0),
            onChanged: (value) {
              setState(() {
                kebutuhanProtein = value;
                applyAutomaticAdjustment();
              });
            },
          ),
        ],
        if (widget.isReset == false) ...[
          Row(
            children: [
              Text('Edit Protein:'),
              Checkbox(
                value: isProteinEditable,
                onChanged: (value) {
                  setState(() {
                    isProteinEditable = value!;
                  });
                },
              ),
            ],
          ),
        ],
        SizedBox(height: 20),
        Container(
          padding: EdgeInsets.all(8.0),
          decoration: BoxDecoration(
              color: Colors.amber.shade100,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(0),
                  bottomRight: Radius.circular(20),
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(0)),
              // border:
              //     Border.all(color: kTextColor.withOpacity(.8), width: .2)
              boxShadow: [
                BoxShadow(
                    blurRadius: 10,
                    offset: Offset(-1, 8),
                    color: Colors.green.withOpacity(.3))
              ]),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Pakan Utama:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Slider(
                value: pakanUtamaPercentage,
                min: 0,
                max: 100,
                divisions: 100,
                label: pakanUtamaPercentage.toStringAsFixed(0),
                onChanged: (value) {
                  setState(() {
                    pakanUtamaPercentage = value;
                    updatePakanPercentage();
                    applyAutomaticAdjustment();
                  });
                },
              ),
              Text(
                'Protein Pakan Utama: ${proteinPakanUtama.toStringAsFixed(0)}%',
                style: TextStyle(fontSize: 16),
              ),
              if (widget.isReset == false) ...[
                Row(
                  children: [
                    Text('Edit Protein:'),
                    Checkbox(
                      value: isProteinPakanUtamaEditable,
                      onChanged: (value) {
                        setState(() {
                          isProteinPakanUtamaEditable = value!;
                        });
                      },
                    ),
                  ],
                ),
              ],
              if (isProteinPakanUtamaEditable)
                Slider(
                  value: proteinPakanUtama,
                  min: 0,
                  max: 100,
                  divisions: 100,
                  label: proteinPakanUtama.toStringAsFixed(0),
                  activeColor: Colors.blue,
                  inactiveColor: Colors.blue.shade100,
                  onChanged: (value) {
                    setState(() {
                      proteinPakanUtama = value;
                      applyAutomaticAdjustment();
                    });
                  },
                ),
            ],
          ),
        ),
        SizedBox(height: 20),
        Container(
          padding: EdgeInsets.all(8.0),
          decoration: BoxDecoration(
              color: Colors.lightGreen.shade100,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(0),
                  bottomRight: Radius.circular(20),
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(0)),
              // border:
              //     Border.all(color: kTextColor.withOpacity(.8), width: .2)
              boxShadow: [
                BoxShadow(
                    blurRadius: 10,
                    offset: Offset(-1, 8),
                    color: Colors.green.withOpacity(.3))
              ]),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Pakan Alternatif Maggot',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SwitchListTile(
                title: Text('Aktifkan Pakan Maggot'),
                value: isPakanAlternatif1Enabled,
                onChanged: (bool value) {
                  setState(() {
                    isPakanAlternatif1Enabled = value;
                    if (!value) {
                      pakanAlternatif1Percentage = 0;
                    }
                    updatePakanPercentage();
                  });
                },
              ),
              if (isPakanAlternatif1Enabled) ...[
                Slider(
                  value: pakanAlternatif1Percentage,
                  min: 0,
                  max: 100,
                  divisions: 100,
                  label: pakanAlternatif1Percentage.toStringAsFixed(0),
                  onChanged: (value) {
                    setState(() {
                      pakanAlternatif1Percentage = value;
                      updatePakanPercentage();
                      applyAutomaticAdjustment();
                    });
                  },
                ),
                Text(
                  'Protein Pakan Alternatif Maggot: ${proteinPakanAlternatif1.toStringAsFixed(0)}%',
                  style: TextStyle(fontSize: 16),
                ),
                if (widget.isReset == false) ...[
                  Row(
                    children: [
                      Text('Edit Protein:'),
                      Checkbox(
                        value: isProteinPakanAlternatif1Editable,
                        onChanged: (value) {
                          setState(() {
                            isProteinPakanAlternatif1Editable = value!;
                          });
                        },
                      ),
                    ],
                  ),
                ],
                if (isProteinPakanAlternatif1Editable)
                  Slider(
                    value: proteinPakanAlternatif1,
                    min: 0,
                    max: 100,
                    divisions: 100,
                    label: proteinPakanAlternatif1.toStringAsFixed(0),
                    activeColor: Colors.blue,
                    inactiveColor: Colors.blue.shade100,
                    onChanged: (value) {
                      setState(() {
                        proteinPakanAlternatif1 = value;
                        applyAutomaticAdjustment();
                      });
                    },
                  ),
              ],
            ],
          ),
        ),
        SizedBox(height: 20),
        Container(
          padding: EdgeInsets.all(8.0),
          decoration: BoxDecoration(
              color: Colors.lightBlue.shade100,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(0),
                  bottomRight: Radius.circular(20),
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(0)),
              // border:
              //     Border.all(color: kTextColor.withOpacity(.8), width: .2)
              boxShadow: [
                BoxShadow(
                    blurRadius: 10,
                    offset: Offset(-1, 8),
                    color: Colors.green.withOpacity(.3))
              ]),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Pakan Alternatif Tumbuhan Paku :',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SwitchListTile(
                title: Text('Aktifkan Pakan Alternatif Tumbuhan Paku'),
                value: isPakanAlternatif2Enabled,
                onChanged: (bool value) {
                  setState(() {
                    isPakanAlternatif2Enabled = value;
                    if (!value) {
                      pakanAlternatif2Percentage = 0;
                    }
                    updatePakanPercentage();
                  });
                },
              ),
              if (isPakanAlternatif2Enabled) ...[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DropDowns(
                    (newActivity) {
                      Future.microtask(() {
                        setState(() {});
                      });
                      selectedPakan =
                          dataPakanAlternatifLainnya.indexOf(newActivity);
                      String data = dataPakanAlternatifLainnya.toString();

                      RegExp regExp = RegExp(r'(\d+\.\d+)');

                      // Menyimpan hasil dalam sebuah list
                      Iterable<RegExpMatch> matches = regExp.allMatches(data);
                      List<double> hasil = matches
                          .map((match) => double.parse(match.group(0)!))
                          .toList();

                      proteinPakanAlternatif2 = hasil[selectedPakan];
                      applyAutomaticAdjustment();
                      // hitunglocal();
                    },
                    Colors.black,
                    dataPakanAlternatifLainnya,
                    dataPakanAlternatifLainnya[selectedPakan],
                    dataPakanAlternatifLainnya[selectedPakan],
                    'Pilih Pakan Alternatif',
                    const [],
                  ),
                ),
                Slider(
                  value: pakanAlternatif2Percentage,
                  min: 0,
                  max: 100,
                  divisions: 100,
                  label: pakanAlternatif2Percentage.toStringAsFixed(0),
                  onChanged: (value) {
                    setState(() {
                      pakanAlternatif2Percentage = value;
                      updatePakanPercentage();
                      applyAutomaticAdjustment();
                    });
                  },
                ),
                Text(
                  'Protein Pakan Alternatif Tumbuhan Paku : ${proteinPakanAlternatif2.toStringAsFixed(0)}%',
                  style: TextStyle(fontSize: 16),
                ),
                if (widget.isReset == false) ...[
                  Row(
                    children: [
                      Text('Edit Protein:'),
                      Checkbox(
                        value: isProteinPakanAlternatif2Editable,
                        onChanged: (value) {
                          setState(() {
                            isProteinPakanAlternatif2Editable = value!;
                          });
                        },
                      ),
                    ],
                  ),
                ],
                if (isProteinPakanAlternatif2Editable)
                  if (widget.isReset == false) ...[
                    Slider(
                      value: proteinPakanAlternatif2,
                      min: 0,
                      max: 100,
                      divisions: 100,
                      label: proteinPakanAlternatif2.toStringAsFixed(0),
                      activeColor: Colors.blue,
                      inactiveColor: Colors.blue.shade100,
                      onChanged: (value) {
                        setState(() {
                          proteinPakanAlternatif2 = value;
                          applyAutomaticAdjustment();
                        });
                      },
                    ),
                  ],
              ],
            ],
          ),
        ),
        SizedBox(height: 20),
        if (kekuranganProteinMessage.isNotEmpty)
          if (widget.isReset == false) ...[
            Text(
              kekuranganProteinMessage,
              style: TextStyle(
                  fontSize: 18, color: Colors.red, fontWeight: FontWeight.bold),
            )
          ],
        Text(
          'Total Persentase: ${pakanUtamaPercentage.toStringAsFixed(0)}% + ${pakanAlternatif1Percentage.toStringAsFixed(0)}% + ${pakanAlternatif2Percentage.toStringAsFixed(0)}%',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
