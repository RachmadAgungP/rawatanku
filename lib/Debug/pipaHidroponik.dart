import 'package:flutter/material.dart';
import 'package:rawatt/constants.dart';

class Pipa extends StatefulWidget {
  final Function(Map)? onChangeState;
  final bool ukurancostume;
  final int banyaktanaman;
  final Map dataUkuran;

  const Pipa({
    super.key,
    this.onChangeState,
    required this.ukurancostume,
    required this.banyaktanaman,
    required this.dataUkuran,
  });

  @override
  _PipaState createState() => _PipaState();
}

class _PipaState extends State<Pipa> {
  double _length = 100;
  double _diameter = 4;
  double _distance = 4;
  int _holeCount = 0;
  int _plantCount = 0;

  int jumlahTanam = 0;
  @override
  void initState() {
    super.initState();

    _length = widget.dataUkuran['panjang']?.toDouble() ?? 100;
    jumlahTanam = widget.banyaktanaman;
    // Validasi nilai diameter
    _diameter = widget.dataUkuran['diameter']?.toDouble() ?? 4;
    if (_diameter < 4) _diameter = 4;
    if (_diameter > 10) _diameter = 10;

    _plantCount = widget.banyaktanaman;
    _distance = widget.dataUkuran['jarakLubang']?.toDouble() ?? 8;
    _calculateHoles();
    _triggerOnChangeState();
  }

  @override
  void didUpdateWidget(Pipa oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.banyaktanaman != widget.banyaktanaman) {
      _plantCount = widget.banyaktanaman;
      _calculateHoles();
      setState(() {});
    }

    if (oldWidget.dataUkuran != widget.dataUkuran) {
      _length = widget.dataUkuran['panjang']?.toDouble() ?? 100;

      // Validasi nilai diameter saat update
      _diameter = widget.dataUkuran['diameter']?.toDouble() ?? 4;
      if (_diameter < 4) _diameter = 4;
      if (_diameter > 10) _diameter = 10;

      _calculateHoles();
    }
  }

  void _triggerOnChangeState() {
    if (widget.onChangeState != null) {
      widget.onChangeState!({
        "panjang": _length,
        "diameter": _diameter,
        "jarakLubang": _distance,
        "jumlahLubang": jumlahTanam,
      });
    }
  }

  void _calculateHoles() {
    if (_length > 0 && _diameter > 0 && _distance > 0) {
      setState(() {
        _holeCount = ((_length - _diameter) / (_distance + _diameter)).floor();

        if (_plantCount >= _holeCount) {
          jumlahTanam = _holeCount;
        } else {
          jumlahTanam = _plantCount;
        }
        print("jumlah $jumlahTanam ${_plantCount >= _holeCount}");
      });
    }
  }

  Widget _buildPipe() {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        color: Colors.grey[200],
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final pipeWidth = constraints.maxWidth;
          final holeSpacing = _distance / _length * pipeWidth;
          final holeDiameter = _diameter / _length * pipeWidth;
          final startOffset = (pipeWidth -
                  (_holeCount * (holeDiameter + holeSpacing) - holeSpacing)) /
              2;

          List<Widget> holes = [];
          final int totalHoles = _holeCount;
          int plants = _plantCount;
          List<int> plantPositions = [];
          if (totalHoles > 0 && plants > 0) {
            for (int i = 0; i < plants; i++) {
              int position = ((i + 0.5) * totalHoles / plants).floor();
              plantPositions.add(position);
            }
          }

          for (int index = 0; index < totalHoles; index++) {
            bool hasPlant = plantPositions.contains(index);
            holes.add(
              Positioned(
                left: startOffset + index * (holeSpacing + holeDiameter),
                top: 0,
                bottom: 0,
                child: Container(
                  width: holeDiameter,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: hasPlant ? Colors.green : Colors.black,
                  ),
                ),
              ),
            );
          }

          return Stack(
            children: holes,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: [
          if (widget.ukurancostume)
            Column(
              children: [
                Text('Panjang Pipa (cm): ${_length.toStringAsFixed(0)}'),
                Slider(
                  value: _length,
                  min: 100,
                  max: 200,
                  divisions: 100,
                  label: _length.toStringAsFixed(0),
                  onChanged: (value) {
                    setState(() {
                      _length = value;
                      _calculateHoles();
                      _triggerOnChangeState();
                    });
                  },
                ),
                SizedBox(height: defaultPadding),
                Text('Diameter Lubang (cm): ${_diameter.toStringAsFixed(1)}'),
                Slider(
                  value: _diameter,
                  min: 4,
                  max: 10,
                  divisions: 60,
                  label: _diameter.toStringAsFixed(1),
                  onChanged: (value) {
                    setState(() {
                      _diameter = value;
                      _calculateHoles();
                      _triggerOnChangeState();
                    });
                  },
                ),
                SizedBox(height: 20),
                Text(
                    'Jarak Antar Lubang (cm): ${_distance.toStringAsFixed(1)}'),
                Slider(
                  value: _distance,
                  min: 4,
                  max: 10,
                  divisions: 6,
                  label: _distance.toStringAsFixed(1),
                  onChanged: (value) {
                    setState(() {
                      _distance = value;
                      _calculateHoles();
                      _triggerOnChangeState();
                    });
                  },
                ),
                SizedBox(height: 20),
              ],
            ),
          _buildPipe(),
          SizedBox(height: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
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
                child: Padding(
                  padding: EdgeInsets.all(defaultPadding),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 4,
                        child: Text(
                          'Jumlah Total Lubang: $_holeCount',
                          textAlign: TextAlign.left,
                          style: TextStyle(fontSize: 14),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
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
                child: Padding(
                  padding: EdgeInsets.all(defaultPadding),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.green,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 4,
                        child: Text(
                          'Jumlah Lubang yang bisa ditanam berdasarkan jarak tanam antar tanaman : $jumlahTanam',
                          textAlign: TextAlign.left,
                          style: TextStyle(fontSize: 14),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
