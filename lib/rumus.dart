// import 'package:rawatt/screens/convert/component/Widget_Komoditi.dart';
import 'package:rawatt/model/product/mdl_Produk.dart';
import 'package:rawatt/model/product/mdl_Produk.dart';
import 'package:rawatt/screens/convert/component/Widget_Jenis_Tanah.dart';
import 'package:rawatt/screens/convert/component/database_rumus_komoditi.dart';

import 'model/dosis/mdl_dosisPengaplikasian.dart';
import 'screens/convert/component/inisialisasi_var.dart';

List bentukPupuk(String bntk) {
  return dataProductsObj
      .where((element) => element.bentuk == "cair")
      .map((e) => e.nama)
      .toList();
}

// List bentukPupukTitle(String bntk){
//   return dataProductsObj.where((element) => element.bentuk == "cair").map((e) => e.title).toList();
// }

// String takaran(Map cob) {
//   String hasil = "";
//   cob.forEach((k, v) {
//     hasil += bentukPupuk(k).contains(k)
//         ? "\n$k : ${v.toStringAsFixed(1)} ${listDPT[c.selectobjPemupukan.value].satuan == "Gr" ? "gram/Pohon" : "L"}"
//         : "\n$k : ${v.toStringAsFixed(1)} ${listDPT[c.selectobjPemupukan.value].satuan == "Gr" ? "gram/Pohon" : "Kg"}";
//   });
//   print("${listDPT[c.selectobjPemupukan.value].variabels}");
//   return hasil;
// }
//

String MaptoStr(maps, luas, satuan, id) {
  // print("loh ${satuan}");
  String output = "";
  maps.forEach((i, k) {
    double ff = double.parse(k.replaceAll(RegExp(r'[^0-9.]'), ''));
    output += (ff * 1000000.toString().length <= 6)
        ? "$i : ${(ff * 1000).toStringAsFixed(1)} ${(c.selectobjPemupukan.value == 1) ? "g" : "g"}  atau ${(ff * 1000000).toStringAsFixed(1)} ${(c.selectobjPemupukan.value == 1) ? "mg" : "mg"} \n"
        : "> $i :  ${(ff).toStringAsFixed(1)} ${(c.selectobjPemupukan.value == 1) ? "kg" : "kg"} \n";
  });
  return (output);
}

String dosis(Map cob) {
  String hasil = "";
  cob.forEach((k, v) {
    hasil += "\n${List.from(v)[0]} : ${List.from(v)[1]}";
  });
  return hasil;
}

String convertRumus(Map dataRumus, String rumuss) {
  for (int i = 0; i < dataRumus.keys.length; i++) {
    String aw = dataRumus.keys.elementAt(i);
    rumuss = rumuss.replaceAllMapped(RegExp(aw, caseSensitive: true),
        (m) => dataRumus.values.elementAt(i)[1].toString());
  }
  // print("datamus ${rumuss}");
  return rumuss;
}

String convertRumusTextEdit(Map dataRumus, String rumuss) {
  for (int i = 0; i < dataRumus.keys.length; i++) {
    String aw = dataRumus.keys.elementAt(i);
    rumuss = rumuss.replaceAllMapped(RegExp(aw, caseSensitive: true),
        (m) => dataRumus.values.elementAt(i)[3].text.toString());
  }
  return rumuss;
}

List convertListRumus(Map<String, dynamic> varRumus, List rumuss) {
  List actif = rumuss;
  for (int i = 0; i < varRumus.keys.length; i++) {
    String aw = varRumus.keys.elementAt(i);
    for (int o = 0; o < actif.length; o++) {
      actif[o] =
          actif[o].replaceAllMapped(RegExp(aw, caseSensitive: true), (m) {
        return varRumus[varRumus.keys.elementAt(i)].length > 1
            ? varRumus.values.elementAt(i)[o].toString()
            : varRumus[varRumus.keys.elementAt(i)].length == 1
                ? varRumus.values.elementAt(i)[0].toString()
                : varRumus.values.elementAt(i)[o][0].toString();
      });
    }
  }
  // print("rumuss ${actif}");
  return actif;
}

List convertRumusList(Map<String, dynamic> varRumus, List rumuss) {
  for (int i = 0; i < varRumus.keys.length; i++) {
    String aw = varRumus.keys.elementAt(i);
    rumuss[i] = rumuss[i].replaceAllMapped(RegExp(aw, caseSensitive: true),
        (m) => varRumus.values.elementAt(i)[1].toString());
  }
  return rumuss;
}
