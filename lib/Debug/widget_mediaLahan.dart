import 'package:flutter/material.dart';
import 'package:function_tree/function_tree.dart';
import 'package:rawatt/components/card_field.dart';
import 'package:rawatt/components/inputan.dart';
import 'package:rawatt/constants.dart';
import 'package:rawatt/model/MenuRawatan/mdl_MenuRawatan.dart';
import 'package:rawatt/screens/convert/component/inisialisasi_var.dart';

class CalculationWidget extends StatefulWidget {
  final void Function(Map<String, dynamic>) onChange;
  final int mediaIndex;
  final Color warna;
  final Map datass;
  final int indexbidang;
  final String judul;
  final String satuan;
  final bool dinamis;
  final double hasil;
  const CalculationWidget(
      {super.key,
      required this.onChange,
      required this.mediaIndex,
      required this.warna,
      required this.datass,
      required this.indexbidang,
      required this.judul,
      required this.satuan,
      required this.dinamis,
      required this.hasil});

  @override
  _CalculationWidgetState createState() => _CalculationWidgetState();
}

class _CalculationWidgetState extends State<CalculationWidget> {
  Map datas = {};
  List<String> jenisKalkulasi = [];
  List jenisBidang = [];
  @override
  void initState() {
    // TODO: implement initState

    _selectedCalculation = formulas.keys.toList()[widget.mediaIndex];
    _selectedShape =
        formulas[_selectedCalculation]!.keys.toList()[widget.indexbidang];

    widget.dinamis
        ? {
            // jenisKalkulasi = formulas.keys.toList(),
            jenisBidang = formulas[_selectedCalculation]!.keys.toList()
          }
        : {
            jenisBidang = [
              formulas[_selectedCalculation]!.keys.toList()[
                  formulas[_selectedCalculation]!
                      .keys
                      .toList()
                      .indexOf(_selectedShape!)]
            ]
          };
    //
    jenisKalkulasi = [
      formulas.keys
          .toList()[formulas.keys.toList().indexOf(_selectedCalculation!)]
    ];

    datas = widget.datass;
    print("datatystg $datas ${widget.indexbidang}");
    (widget.satuan == "m") ? _isMeter = true : _isMeter = false;
    variables = formulas[_selectedCalculation]?[_selectedShape]?['variables']
        as List<String>;
    for (var variable in variables) {
      if (!_controllers.containsKey(variable)) {
        _controllers[variable] =
            TextEditingController(text: datas[variable].toString());
        _controllers[variable]!.addListener(() {
          Future.microtask(() {
            setState(() {}); // Update UI on text change
          });
        });
      }
    }
    result = widget.hasil;
    super.initState();
  }

  String? _selectedCalculation;
  String? _selectedShape;
  bool _isMeter = true; // Default to meters
  final Map<String, TextEditingController> _controllers = {};

  final Map<String, Map<String, dynamic>> formulas = {
    'Luas Bidang': {
      'Persegi': {
        'formula': 'sisi * sisi',
        'variables': ['sisi']
      },
      'Persegi Panjang': {
        'formula': 'panjang * lebar',
        'variables': ['panjang', 'lebar']
      },
      'Segitiga': {
        'formula': '0.5 * alas * tinggi',
        'variables': ['alas', 'tinggi']
      },
      'Lingkaran': {
        'formula': '3.14159 * jari_jari * jari_jari',
        'variables': ['jari_jari']
      },
      'Trapesium': {
        'formula': '0.5 * (a + b) * tinggi',
        'variables': ['a', 'b', 'tinggi']
      },
      'Jajar Genjang': {
        'formula': 'alas * tinggi',
        'variables': ['alas', 'tinggi']
      },
      'Belah Ketupat': {
        'formula': '0.5 * d1 * d2',
        'variables': ['d1', 'd2']
      },
      'Layang-layang': {
        'formula': '0.5 * d1 * d2',
        'variables': ['d1', 'd2']
      },
    },
    'Volume Bidang': {
      'Balok': {
        'formula': 'p * l * t',
        'variables': ['p', 'l', 't']
      },
      'Kerucut Potong': {
        'formula': '(1/3) * 3.14159 * t * (r * r + r * Ri + Ri * Ri)',
        'variables': ['r', 'Ri', 't']
      },
      // 'Kerucut': {
      //   'formula': '(1/3) * 3.14159 * r * r * t',
      //   'variables': ['r', 't']
      // },
      // 'Limas Segi Empat': {
      //   'formula': '(1/3) * panjang * lebar * t',
      //   'variables': ['panjang', 'lebar', 't']
      // },
      // 'Prisma Segitiga': {
      //   'formula': '0.5 * alas * t_segitiga * t_prisma',
      //   'variables': ['alas', 't_segitiga', 't_prisma']
      // },
      // 'Pot Tanaman (Truncated Cone)': {
      //   'formula': '(1/3) * 3.14159 * t * (r * r + r * Ri + Ri * Ri)',
      //   'variables': ['r', 'Ri', 't']
      // },
      // Volume Kerucut Potong (Frustum Cone)
      // Volume Zona Bola
      'Zona Bola': {
        'formula': '(2/3) * 3.14159 * t * (3 * r - t)',
        'variables': ['r', 't']
      },
      'Tabung': {
        'formula': '3.14159 * r * r * t',
        'variables': ['r', 't']
      },
    }
  };

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  Widget _buildInputFields() {
    if (_selectedCalculation == null || _selectedShape == null) {
      return SizedBox.shrink();
    }

    List<Widget> fields = [];
    final variables = formulas[_selectedCalculation]?[_selectedShape]
        ?['variables'] as List<String>;

    for (var variable in variables) {
      if (!_controllers.containsKey(variable)) {
        _controllers[variable] =
            TextEditingController(text: datas[variable].toString());
        _controllers[variable]!.addListener(() {
          Future.microtask(() {
            setState(() {}); // Update UI on text change
          });
        });
      }

      fields.add(
        Padding(
          padding: const EdgeInsets.only(bottom: 12.0),
          child: TextField(
            controller: _controllers[variable],
            keyboardType: TextInputType.numberWithOptions(decimal: true),
            decoration: InputDecoration(
              labelText: '$variable (${_isMeter ? 'm' : 'cm'})',
              border: OutlineInputBorder(),
            ),
            onSubmitted: (_) => _showResultDialog(),
          ),
        ),
      );
    }

    return Column(children: fields);
  }

  double _convertToMeters(double value) {
    if (_isMeter) {
      return value;
    } else {
      if (_selectedCalculation == 'Luas Bidang') {
        return value / 10000; // Convert cm² to m²
      } else {
        return value / 1000000; // Convert cm³ to m³
      }
    }
    // return _isMeter ? value : value / _selectedCalculation! == 'Luas Bidang'?10000:1000000; // Convert cm to meters
  }

  double _convertFromMeters(double value) {
    return _isMeter ? value : value * 10000; // Convert meters to cm
  }

  double result = 0;
  List<String> variables = [];

  double _calculateResult() {
    final formulaString =
        formulas[_selectedCalculation]?[_selectedShape]?['formula'] as String;
    variables = formulas[_selectedCalculation]?[_selectedShape]?['variables']
        as List<String>;

    String expression = formulaString;

    for (var variable in variables) {
      double? value = double.tryParse(_controllers[variable] == null
          ? "0"
          : _controllers[variable]?.text ?? '');
      if (value == null) {
        value = 0;
        _showErrorDialog("Semua field harus diisi dengan benar.");
        return 0.0;
      }
      final valueInMeters = value;
      expression = expression.replaceAll(variable, valueInMeters.toString());
      datas[variable] = value;
    }
    print("lam $expression $datas $variables");
    result = _evaluateExpression(expression);
    _sendResultToCallback(result);
    return result;
  }

  double _evaluateExpression(String expression) {
    try {
      final result = expression.interpret();
      return result.toDouble();
    } catch (e) {
      print('Error evaluating expression: $e');
      _showErrorDialog("Terjadi kesalahan dalam perhitungan.");
      return 0.0;
    }
  }

  void _sendResultToCallback(double result) {
    print(
        "lolt ${formulas[_selectedCalculation]!.keys.toList().indexOf(_selectedShape!)}");
    final resultMap = {
      'Jenis Kalkulasi': _selectedCalculation,
      'Nama Bidang': _selectedShape,
      'Index Bidang': formulas[_selectedCalculation]!
          .keys
          .toList()
          .indexOf(_selectedShape!),
      'Formula': formulas[_selectedCalculation]?[_selectedShape]?['formula'],
      'Variabel': datas,
      'Hasil': _isMeter ? result : _convertToMeters(result),
      'satuan': _isMeter ? 'm' : 'cm'
    };
    widget.onChange(resultMap);
  }

  void _showResultDialog() {
    final result = _calculateResult();

    if (result == 0.0) return;

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Hasil Perhitungan'),
        content: Text(
          _selectedCalculation == 'Luas Bidang'
              ? 'Luas: ${result.toStringAsFixed(0)} ${'m²'}'
              : 'Volume: ${result.toStringAsFixed(0)} ${'m³'}',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Kesalahan'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controllers.forEach((_, controller) => controller.dispose());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // result = _calculateResult();

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CardFields(
            tema: widget.warna,
            judul: widget.judul,
            columns: Padding(
              padding: EdgeInsets.only(
                  // horizontal: widthfit(defaultPadding / 2),
                  right: defaultPadding,
                  left: defaultPadding,
                  top: defaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DropDowns((newActivity) {
                    Future.microtask(() {
                      setState(
                        () {
                          _selectedCalculation = newActivity;
                          // _selectedShape = null;
                          _isMeter
                              ? {
                                  result = _calculateResult(),
                                }
                              : {
                                  result = _convertToMeters(_calculateResult()),
                                };
                        },
                      );
                    });
                  },
                      widget.warna,
                      jenisKalkulasi,
                      jenisKalkulasi[
                          jenisKalkulasi.indexOf(_selectedCalculation!)],
                      jenisKalkulasi[
                          jenisKalkulasi.indexOf(_selectedCalculation!)],
                      "Pilih Jenis Kalkulasi",
                      []),
                  SizedBox(height: 16),
                  if (_selectedCalculation != null)
                    DropDowns((newActivity) {
                      Future.microtask(() {
                        setState(() {
                          _selectedShape = newActivity;
                          _isMeter
                              ? {
                                  result = _calculateResult(),
                                }
                              : {
                                  result = _convertToMeters(_calculateResult()),
                                };
                          // _showResultDialog();
                        });
                      });
                      if (_selectedShape != null) {
                        // _showResultDialog();
                        _isMeter
                            ? {
                                result = _calculateResult(),
                              }
                            : {
                                result = _convertToMeters(_calculateResult()),
                              };
                      }
                    },
                        widget.warna,
                        jenisBidang,
                        jenisBidang[jenisBidang.indexOf(_selectedShape!)],
                        jenisBidang[jenisBidang.indexOf(_selectedShape!)],
                        "Pilih Nama Bidang", []),
                  SizedBox(height: 20),
                  SwitchListTile(
                    title: Text('Gunakan cm'),
                    value: !_isMeter,
                    onChanged: (value) {
                      Future.microtask(() {
                        setState(() {
                          _isMeter = !value; // Toggle between meter and cm
                          _isMeter
                              ? {
                                  result = _calculateResult(),
                                }
                              : {
                                  result = _convertToMeters(_calculateResult()),
                                };
                        });
                      });
                    },
                  ),
                  SizedBox(height: 20),
                  _buildInputFields(),
                  Text(
                    'Hasil Perhitungan',
                    style: TextStyle(fontSize: 24),
                  ),
                  Text(
                    _selectedCalculation == 'Luas Bidang'
                        ? 'Luas: $result ${'m²'}'
                        : 'Volume: $result ${'m³'}',
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
            ),
            onChangeState: () {},
            indexmenu: c.indexMenuRawatan.value,
            indexsubmenu: 0,
            warna: widget.warna,
          ),
        ],
      ),
    );
  }
}
