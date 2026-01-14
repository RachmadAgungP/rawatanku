import 'package:flutter/material.dart';
import 'package:rawatt/constants.dart';
import 'package:rawatt/size_config.dart';

class PanenKeuntunganDataTable extends StatelessWidget {
  final List<dynamic> panenKeuntunganData;
  final Function(int) removeRow;
  final VoidCallback addRow;
  final double biayaTotal;
  final Function(int, String, double) updateData;

  const PanenKeuntunganDataTable({
    super.key,
    required this.panenKeuntunganData,
    required this.removeRow,
    required this.addRow,
    required this.biayaTotal,
    required this.updateData,
  });

  void _showEditDialog(
      BuildContext context, int index, String key, double currentValue) {
    TextEditingController controller =
        TextEditingController(text: currentValue.toString());

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Edit $key'),
          content: TextField(
            controller: controller,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              hintText: 'Masukkan nilai baru',
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                double? newValue = double.tryParse(controller.text);
                if (newValue != null) {
                  updateData(index, key, newValue);
                  Navigator.of(context).pop();
                }
              },
              child: Text('Simpan'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Batal'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    if (panenKeuntunganData.isEmpty) {
      return Center(child: Text("Tidak ada data"));
    }

    List<String> keys = panenKeuntunganData.first.keys.toList();
    keys.add('Keuntungan');

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
            columns: keys.map((key) {
              return DataColumn(
                label: Text(
                  key == 'Keuntungan' ? 'Keuntungan (Rp)' : key,
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              );
            }).toList()
              ..add(
                DataColumn(
                  label: Text('Aksi'),
                ),
              ),
            rows: List<DataRow>.generate(
              panenKeuntunganData.length,
              (int index) {
                double keuntunganFrekuensi = (panenKeuntunganData[index]
                            ['hasilPanen'] as double) *
                        (panenKeuntunganData[index]['hargaPerKg'] as double) -
                    (biayaTotal / panenKeuntunganData.length);

                return DataRow(
                  cells: keys.map((key) {
                    var value = panenKeuntunganData[index][key];
                    if (key == 'Keuntungan') {
                      value = keuntunganFrekuensi;
                    }

                    return DataCell(
                      GestureDetector(
                        onTap: () {
                          if (key != 'Keuntungan') {
                            _showEditDialog(
                                context, index, key, value as double);
                          }
                        },
                        child: Text(
                          value is double
                              ? value.toStringAsFixed(2)
                              : value.toString(),
                        ),
                      ),
                    );
                  }).toList()
                    ..add(
                      DataCell(
                        Row(
                          children: [
                            IconButton(
                              icon: Icon(Icons.delete),
                              onPressed: () => removeRow(index),
                            ),
                          ],
                        ),
                      ),
                    ),
                );
              },
            ),
          ),
        ),
        SizedBox(height: 20),
        Container(
          margin: EdgeInsets.symmetric(
              horizontal: heightfit(defaultPadding / 2),
              vertical: heightfit(defaultPadding / 2)),
          // height: 200,
          width: heightfit(double.infinity),
          decoration: BoxDecoration(
              color: Colors.orange.shade700,
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
          child: TextButton(
            onPressed: addRow,
            child: Text(
              'Tambah Hasil Panen',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        ),
      ],
    );
  }
}
