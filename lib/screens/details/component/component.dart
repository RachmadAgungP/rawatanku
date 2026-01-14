import 'dart:convert';

import 'package:rawatt/constants.dart';
import 'package:rawatt/model/controler.dart';
import 'package:rawatt/model/datafix.dart';
import 'package:rawatt/model/dosis/fieldku_campur.dart';
import 'package:rawatt/model/product/mdl_Produk.dart';
import 'package:rawatt/screens/details/components.dart';
import 'package:rawatt/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../model/petani/mdl_Petani.dart';
import '../../convert/component/inisialisasi_var.dart';
//
// Future<void> setPreferenceKalku()async{
//   final jembKalku = await SharedPreferences.getInstance();
//   final dataKuKalku = json.encode({
//     "dataKonsumsiListrik":MyData.encode(parentData).toString()
//   });
//
//   if (jembKalku.containsKey('dataKuKalku')){
//     jembKalku.clear();
//   }
//   jembKalku.setString('dataKuKalku',dataKuKalku);
//
//   Map<String, dynamic> asas = json.decode(dataKuKalku!) as Map<String, dynamic>;
//   print("c.cartsku ${asas}");
//   //
//   // print("c.cartsku.value ${json.decode(asas["dataProduk"]).toList()[59]["quantity"]}");
//
// }
//
// Future<void> getPreferenceKalku()async{
//   final jembKalku = await SharedPreferences.getInstance();
//   if (jembKalku.containsKey('dataKuKalku')){
//     final dataKuKalkuJson = jembKalku.getString('dataKuKalku');
//     // final String dataString = jemb.getString('dataKu') ;
//     final dataKuKalku = json.decode(dataKuKalkuJson!) as Map<String, dynamic>;
//
//     final List<MyData> myListrik =MyData.decode(dataKuKalku['dataKonsumsiListrik']);
//
//
//     parentData = myListrik;
//
//   }
// }

class Item {
  String name;
  int quantity;

  Item(this.name, this.quantity);

  Map<String, dynamic> toJson() => {
        'name': name,
        'quantity': quantity,
      };

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      json['name'],
      json['quantity'],
    );
  }
}

Future<void> setPreference() async {
  final jemb = await SharedPreferences.getInstance();
  // updateDataPerent();
  final dataKu = json.encode({
    // "dataPetani": json.encode(dataPetani),
    // "regis":c.isviewRegister.value.toString(),
    "dataProduk": DataProducts.encode(dataProductsObj).toString(),
    "dataKonsumsiListrik": MyData.encode(parentData).toString(),
    // "harga":convertData(c.AcontrolHarga.value.toList())
  });

  if (jemb.containsKey('dataKu')) {
    jemb.clear();
  }
  jemb.setString('dataKu', dataKu);

  Map<String, dynamic> asas = json.decode(dataKu) as Map<String, dynamic>;
  // print("c.cartsku.value ${dataProductsObj[59].nama}");
  // print("cartsku.value ${MyData.decode(asas["dataKonsumsiListrik"]).map((e) => e.kategoriRumusKu).toList().map((e) => e.map((e) => e.valuess))} }");
}

Future<void> getPreference() async {
  // final status = await Permission.storage.request();
  // if (status.isGranted) {
  //   try {
  //     print("Data berhasil disimpan ke 'sample.text'");
  //   } catch (e) {
  //     print("Terjadi kesalahan saat menulis ke file: $e");
  //     // Handle error appropriately
  //   }
  // } else if (status.isDenied) {
  //   await Permission.storage.request();
  //   print("Izin penyimpanan ditolak oleh pengguna");
  //   // Handle denied permission
  // } else if (status.isPermanentlyDenied) {
  //   print("Izin penyimpanan secara permanen ditolak oleh pengguna");
  //   // Handle permanently denied permission
  // }
  // print("dataPetanifd ${c.cartsku.value}");
  final jemb = await SharedPreferences.getInstance();
  if (jemb.containsKey('dataKu')) {
    final dataKuJson = jemb.getString('dataKu');
    // final String dataString = jemb.getString('dataKu') ;
    final dataKu = json.decode(dataKuJson!) as Map<String, dynamic>;

    final List<DataProducts> myProduk =
        DataProducts.decode(dataKu['dataProduk']);
    print("datali ${MyData.decode(dataKu['dataKonsumsiListrik'])}");
    final List<MyData> myListrik = MyData.decode(dataKu['dataKonsumsiListrik']);

    dataProductsObj = myProduk;

    // print("awal1 ${c.isviewRegister.value } ");
    // print("awal2 ${dataKu['regis']} ");
    // print("quantiti rr ${myProduk[0].img} ${dataProductsObj[0].nama} ");
    // c.cartsku.value =  dataProductsObj.where((element) => element.quantity !=0 ).toList()
    // ;
    c.cartsku.value =
        myProduk.where((element) => element.quantity != 0).toList();
    parentData = myListrik;
  }
}

class CounterProduct extends StatefulWidget {
  const CounterProduct({
    super.key,
    required this.changeTotal,
    required this.product,
    required this.type,
    required this.index,
  });
  final int index;
  final DataProducts product;
  final Function() changeTotal;
  final bool type;
  @override
  _CounterProductState createState() => _CounterProductState();
}

void tambah(int index, DataProducts shopItem) {
  if (c.cartsku
      .map((element) => element.nama)
      .toList()
      .contains(shopItem.nama)) {
    // print('ada');
  } else {
    c.cartsku.add(dataProductsObj[index]);
  }
  dataProductsObj[index].quantity += 1;
  print('ada ${dataProductsObj[index].quantity}');
}

void kurang(int index, DataProducts shopItem) {
  if (dataProductsObj[index].quantity <= 0) {
    c.cartsku.removeWhere((element) => element.nama.contains(shopItem.nama));
    dataProductsObj[index].quantity = 0;
  } else {
    dataProductsObj[index].quantity -= 1;
  }
  print('ada ${shopItem.quantity}');
  print('ada ${dataProductsObj[index].quantity}');
}

class _CounterProductState extends State<CounterProduct> {
  @override
  Widget build(BuildContext context) {
    // setState(() {

    return SizedBox(
      height: heightfit(100),
      width: widthfit(200),
      child: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 1,
                child: InkWell(
                  onTap: () {
                    setState(() {
                      widget.changeTotal();

                      kurang(widget.index, widget.product);

                      setPreference();
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3),
                        color: c.palette_product.value[4].withOpacity(.7)),
                    child: Center(
                      child: Text(
                        "-",
                        style: TextStyle(
                            fontSize: heightfit(24),
                            color: detect(c.palette_product.value[4])),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: heightfit(defaultPadding / 2),
              ),
              // Expanded(
              //   flex: 2,
              //   child: Container(
              //       // height: 20,
              //       // width: 30,
              //
              //       decoration: BoxDecoration(
              //           borderRadius: BorderRadius.circular(3),
              //           color: c.palette_product.value[4]!.withOpacity(.2)),
              //       child: Center(
              //         child: Text(
              //
              //           dataProductsObj[widget.index].quantity.toString(),
              //          style: TextStyle(
              //               color: c.palette_product.value[1]!,
              //               fontSize: heightfit(20)),
              //         ),
              //       )),
              // ),
              SizedBox(
                width: heightfit(defaultPadding / 2),
              ),
              Expanded(
                flex: 1,
                child: InkWell(
                  onTap: () {
                    setState(() {
                      widget.changeTotal();

                      tambah(widget.index, widget.product);

                      setPreference();
                    });
                  },
                  child: Container(
                    // padding: EdgeInsets.symmetric(horizontal: defaultPadding / 2),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3),
                        color: c.palette_product.value[4].withOpacity(.7)),
                    child: Center(
                      child: Text(
                        "+",
                        style: TextStyle(
                            fontSize: heightfit(24),
                            color: detect(c.palette_product.value[4])),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
