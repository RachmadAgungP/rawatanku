import 'package:flutter/material.dart';
import 'package:rawatt/components/inputan.dart';
import 'package:rawatt/constants.dart';
import 'package:rawatt/size_config.dart';

class UangPerSatuan extends StatefulWidget {
  final Function(double, double, double, String) onChangeState;
  final double hargaPer;
  final double perbanyak;
  final String selectedUnitType;
  final String selectedUnitFrom;
  final String selectedUnitTos;
  const UangPerSatuan({
    super.key,
    required this.onChangeState,
    required this.selectedUnitFrom,
    required this.selectedUnitType,
    required this.selectedUnitTos,
    required this.hargaPer,
    required this.perbanyak,
  });

  @override
  State<UangPerSatuan> createState() => _UangPerSatuanState();
}

class _UangPerSatuanState extends State<UangPerSatuan> {
  String _selectedType = 'l';
  String _selectedUnitFrom = 'l';
  String _selectedUnitTo = 'ml';

  double price = 0;
  double unitCount = 0;
  double _result = 0.0;

  TextEditingController _priceController = TextEditingController();
  TextEditingController _unitCountController = TextEditingController();

  final Map<String, List<String>> _units = {
    'l': ['kl', 'l', 'ml'],
    'gr': ['kg', 'gr', 'mg'],
    'm': ['km', 'm', 'cm', 'mm'],
  };

  void _calculatePrice() {
    price = double.tryParse(_priceController.text) ?? 0.0;
    unitCount = double.tryParse(_unitCountController.text) ?? 1.0;
    double conversionFactor =
        _getConversionFactor(_selectedType, _selectedUnitFrom, _selectedUnitTo);

    setState(() {
      _result = (price / unitCount) / conversionFactor;
      widget.onChangeState(_result, price, unitCount, _selectedUnitFrom);
    });
  }

  double _getConversionFactor(String type, String unitFrom, String unitTo) {
    final conversionFactors = {
      'l': {
        'kl': 1000.0,
        'l': 1.0,
        'ml': 0.001,
      },
      'gr': {
        'kg': 1000.0,
        'gr': 1.0,
        'mg': 0.001,
      },
      'm': {
        'km': 1000.0,
        'm': 1.0,
        'cm': 0.01,
        'mm': 0.001,
      },
    };

    double fromFactor = conversionFactors[type]?[unitFrom] ?? 1.0;
    double toFactor = conversionFactors[type]?[unitTo] ?? 1.0;

    return fromFactor / toFactor;
  }

  void _updateResult() {
    // Future.microtask(() {
    //    });
    //    setState(() {

    _calculatePrice();

    // });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    price = widget.hargaPer;
    unitCount = widget.perbanyak;
    _priceController = TextEditingController(text: "$price");
    _unitCountController = TextEditingController(text: "$unitCount");

    _selectedType = widget.selectedUnitType;
    _selectedUnitTo = widget.selectedUnitTos;
    _selectedUnitFrom = widget.selectedUnitTos;

    _updateResult();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SizedBox(
        width: SizeConfig.screenWidth,
        child: Column(
          children: <Widget>[
            //
            // DropDowns((String? newValue) {
            //   setState(
            //         () {
            //
            //           _selectedType = newValue!;
            //           _selectedUnitFrom = _units[_selectedType]![0];
            //           _selectedUnitTo = _units[_selectedType]![1];
            //           _updateResult();
            //           },
            //   );
            //
            //
            // }, Colors.orange.shade900, _units.keys.toList(), _units.keys.toList()[0],
            //     _units.keys.toList()[_units.keys.toList().indexOf(_selectedType)], "Tipe Satuan ", []),

            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _priceController,
                    decoration: InputDecoration(
                      labelText: 'Harga',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(.1),
                      ),
                      contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (text) => _updateResult(),
                  ),
                ),
                // Fields(
                //     controller: _priceController,
                //     // dataKategoriInisialisasi.where((element) => element.vari == data.keys.elementAt(index)[0].toString()).first.satuan
                //     satuan: "",
                //     title: "Harga per Satuan",
                //     tema: Colors.green,
                //     onStateChange: (text) => _updateResult(),
                //     typeinput: TextInputType.number, enable: true
                // ),
                // ),
                SizedBox(width: defaultPadding / 2),

                SizedBox(
                  width: 10,
                  child: Text("/"),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  flex: 8,
                  child: TextField(
                    controller: _unitCountController,
                    decoration: InputDecoration(
                      labelText: 'per kapasitas ',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(.1),
                      ),
                      contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (text) => _updateResult(),
                  ),
                ),
                Expanded(flex: 1, child: SizedBox(width: defaultPadding / 2)),
                Expanded(
                  flex: 6,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 12.0),
                    margin: EdgeInsets.symmetric(vertical: 8.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: DropdownButton<String>(
                      value: _selectedUnitFrom,
                      icon: Icon(Icons.arrow_drop_down),
                      onChanged: (String? newValue) {
                        // setState(() {
                        _selectedUnitFrom = newValue!;
                        _updateResult();
                        // });
                      },
                      items: _units[_selectedType]!
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ],
            ),

            // DropDowns((String? newValue) {
            //   setState(
            //         () {
            //       _selectedUnitFrom = newValue!;
            //       _updateResult();
            //     },
            //   );
            //
            //
            // }, Colors.orange.shade900, _units[_selectedType]!, _units[_selectedType]![0],
            //     _units[_selectedType]![_units[_selectedType]!.indexOf(_selectedUnitFrom)], "", []),

            // DropDowns((String? newValue) {
            //   setState(
            //         () {
            //           _selectedUnitTo = newValue!;
            //           _updateResult();
            //     },
            //   );
            //
            //
            // }, Colors.orange.shade900, _units[_selectedType]!, _units[_selectedType]![0],
            //     _units[_selectedType]![_units[_selectedType]!.indexOf(_selectedUnitTo )], "Ke Satuan : ", []),
            Text(
              '*Contoh : Rp. 50.000 / 500 ml',
              style: TextStyle(fontSize: 10),
            ),
            SizedBox(height: 20),
            Text(
              'Harga per $_selectedUnitTo: Rp ${(_result).toStringAsFixed(2)} / $_selectedUnitTo',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
