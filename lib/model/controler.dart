// import 'package:rawatt/repository/shop_data_repository.dart';
// import 'package:flutter/material.dart';

class Product {
  late int id;
  late String nama;
  late String title;
  late List<String> color;
  late String penjelas;
  late String image;
  late List<String> brosure;
  late Informasi informasi;
  late int quantity;
  late int category;

  Product(
      {required this.id,
      required this.nama,
      required this.title,
      required this.color,
      required this.penjelas,
      required this.image,
      required this.brosure,
      required this.informasi,
      required this.quantity,
      required this.category});

  Product.fromJson(Map<String, dynamic> json) {
    nama = json['nama'];
    title = json['title'];
    color = json['color'].cast<String>();
    penjelas = json['penjelas'];
    image = json['image'];
    brosure = json['brosure'].cast<String>();
    informasi = (json['informasi'] != null
        ? Informasi.fromJson(json['informasi'])
        : null)!;
    category = json['category'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['nama'] = nama;
    data['title'] = title;
    data['color'] = color;
    data['penjelas'] = penjelas;
    data['image'] = image;
    data['brosure'] = brosure;
    data['informasi'] = informasi.toJson();
    data['category'] = category;
    return data;
  }
}

class Informasi {
  late List<String> spesifikasi;
  late List<String> sifat;
  late List<String> manfaat;
  late List<String> gejalaKekurangan;

  Informasi(
      {required this.spesifikasi,
      required this.sifat,
      required this.manfaat,
      required this.gejalaKekurangan});

  Informasi.fromJson(Map<String, dynamic> json) {
    spesifikasi = json['spesifikasi'].cast<String>();
    sifat = json['sifat'].cast<String>();
    manfaat = json['manfaat'].cast<String>();
    gejalaKekurangan = json['Gejala kekurangan'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['spesifikasi'] = spesifikasi;
    data['sifat'] = sifat;
    data['manfaat'] = manfaat;
    data['Gejala kekurangan'] = gejalaKekurangan;
    return data;
  }
}

// class Coba extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     int i = 1;
//     return Scaffold(
//       body: Center(
//         child: Container(
//           height: 100,
//           width: 100,
//           color: Colors.amberAccent,
//           child: InkWell(
//             onTap: () {
//               var product = ShopDataProvider();
//               // print(product.pupuk(i)['color'][0]);
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }

// void main() => runApp(new MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return new MaterialApp(
//       title: 'Flutter Demo',
//       theme: new ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: Coba(),
//     );
//   }
// }
