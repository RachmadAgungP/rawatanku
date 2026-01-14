// import 'package:get_it/get_it.dart';
// import 'package:rawatt/model/petani/mdl_Petani.dart';
import 'dart:convert';
// import 'dart:io';

// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:supabase/supabase.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:get/get.dart';
//
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/material.dart';

import 'package:rawatt/screens/convert/component/inisialisasi_var.dart';

import '../model/MenuRawatan/mdl_MenuRawatan.dart';
import '../model/diskon/diskon.dart';
import '../model/jenisMesin/mdl_JenisMesin.dart';
import '../model/product/mdl_Produk.dart';

final supabase = Get.find<SupabaseClient>();

// final messaging = FirebaseMessaging.instance;
// final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

dynamic fixdata(String jsonString, value,key,index,data){
  bool terdapatKarakterTanda = false;

  List ss= ["{","}","[","]"];
  for (String tanda in ss) {

    if (value.toString().contains(tanda)) {
      terdapatKarakterTanda = true;
      break;
    }
  }

  if (terdapatKarakterTanda) {
    jsonString = value.replaceAll("'", '"');
    if (json.decode(jsonString).runtimeType.toString() == "List<dynamic>"){
      List<dynamic> myMap = json.decode(jsonString);
      data[index][key] = json.decode(jsonString);
      return myMap;
    }else{
      Map<String, dynamic> myMap = json.decode(jsonString);
      data[index][key] = json.decode(jsonString);
      return myMap;

    }
  } else {
    // print('Kalimat tidak mengandung karakter dalam list.');
  }
}
//
// void initializeFirebaseMessaging() {
//   _firebaseMessaging.requestPermission();
//   _firebaseMessaging.getToken().then((token) {
//     // print("Firebase Messaging Token: $token");
//     // Langkah-langkah tambahan jika perlu
//   });
//
//   // Berlangganan ke topik yang sesuai dengan data yang ingin Anda pantau
//   _firebaseMessaging.subscribeToTopic('dataProduk');
// }
// Map<String, dynamic> parseJsonString(String jsonString) {
//   Map<String, dynamic> resultMap = {};
//   jsonString = jsonString.trim(); // Hapus spasi ekstra jika ada
//   if (jsonString.startsWith('{') && jsonString.endsWith('}')) {
//     jsonString = jsonString.substring(1, jsonString.length - 1); // Hapus kurung kurawal awal dan akhir
//     List<String> keyValuePairs = jsonString.split(',');
//     for (String pair in keyValuePairs) {
//       List<String> keyValue = pair.split(':');
//       if (keyValue.length == 2) {
//         String key = keyValue[0].trim().replaceAll('"', '');
//         String value = keyValue[1].trim();
//         resultMap[key] = value;
//       }
//     }
//   }
//   return resultMap;
// }

class DatabaseService {
//   Future fetchDataPetanis() async {
//     try {
//       var response = await Get.find<SupabaseClient>()
//           .from("dataPetani")
//           .select()
//           .execute();
//       print(response.data);
//     } catch (e) {
//       print(e.toString());
//     }
//   }
//

  Future fetchDataPetani(String userId) async {
    try {
      var response = await Get.find<SupabaseClient>()
          .from("dataPetani")
          .select('nama,notelp,alamat,pertanian')
          .eq('id_user', userId);
      // print("users ${response} $userId");
      return response;
    } catch (e) {

      // print(e.toString());
      return e;
    }
  }

//
//   Future<PostgrestResponse?> add(
//       {String? nama,
//       notelp,
//       id_user,
//       Map? alamat,
//       List<Map<String, dynamic>>? pertanian}) async {
//     try {
//       PostgrestResponse response =
//           await Get.find<SupabaseClient>().from("dataPetani").insert({
//         "nama": nama,
//         "id_user": id_user,
//         "notelp": notelp,
//         "alamat": alamat,
//         "pertanian": pertanian
//       }).execute();
//       if (response.data != null) {
//         print(response.data);
//       } else {
//         print(response.status);
//       }
//     } catch (e) {
//       print(e.toString());
//     }
//   }
//
//
//   Future getdataApp() async {
//     try {
//       var response = await Get.find<SupabaseClient>()
//           .from("dataApp")
//           .select("detail")
//           .execute();
//       return response.data;
//
//     } catch (e) {
//       return e;
//       print(e.toString());
//     }}
  bool boos = false;
  Future fetchDataProduksku() async {
    try {
      var response = await Get.find<SupabaseClient>()
          .from("dataProduk")
          .select("id,idPerusahaan,nama,kandungan,bentuk,title,color,penjelas,img,brosure,informasi,kategoriProduk,id_MenuRawatan,harga,bundle,quantity,countdownku,diskon");


      String jsonString = jsonEncode(response);
      // print("lias ${ jsonString}");
      List<dynamic> listData = json.decode(jsonString);

      for (int r = 0; r<listData.length; r++){
        Map<String,dynamic>.of(listData[r]).forEach((key, value) {
          // fixdata(jsonString, value,key,r,listData);
          fixdata(jsonString, value,key,r,listData);
        });
      }
      // print("Products ${listData}");

      // print("lia ${listData.runtimeType}");
      dataProductsObj = DataProducts.decodew(listData);
      // print("lola ${dataProductsObaj[0].img.runtimeType}");
      // dataProducts = listData;

      // ======================================= MenuRawatan=============================
      var responseMenuRawatan = await Get.find<SupabaseClient>()
          .from("menuRawatan")
          .select("id,namaMenurawatan,img,colorku,tagline1,tagline2,fitur,img_banner,img_produks");


      String jsonStringMenuRawatan = jsonEncode(responseMenuRawatan);

      List<dynamic> listDataMenuRawatan = json.decode(jsonStringMenuRawatan);

      for (int r = 0; r<listDataMenuRawatan.length; r++){
        Map<String,dynamic>.of(listDataMenuRawatan[r]).forEach((key, value) {
          fixdata(jsonStringMenuRawatan, value,key,r,listDataMenuRawatan);
        });
      }
      // print("Menurawatan");
      // listDataMenuRawatan.forEach((element) {element.id = int.tryParse(element.id.toString())!; });
      List<KategoriMenuRawatan> listku= KategoriMenuRawatan.decodew(listDataMenuRawatan);

      listku.sort((a, b) => a.id.compareTo(b.id));
      dataKategoriMenuRawatan =  listku;


      // ======================================= datakategorisubMenuRawatan=============================
      var responseObjHitung = await Get.find<SupabaseClient>()
          .from("dataObjHitung")
          .select("id,namaKomoditi,img,icon,id_MenuRawatan");


      String jsonStringObjHitung = jsonEncode(responseObjHitung);

      List<dynamic> listDataObjHitung = json.decode(jsonStringObjHitung);

      for (int r = 0; r<listDataObjHitung.length; r++){
        Map<String,dynamic>.of(listDataObjHitung[r]).forEach((key, value) {
          fixdata(jsonStringObjHitung, value,key,r,listDataObjHitung);
        });
      }

      // listDataObjHitung.forEach((element) {element.id = int.tryParse(element.id.toString())!; });

      List<KategorisubMenuRawatan> listkuObjHitung= KategorisubMenuRawatan.decodew(listDataObjHitung);

      listkuObjHitung.sort((a, b) => a.id.compareTo(b.id));
      datakategorisubMenuRawatan =  listkuObjHitung;

      // ======================================= dataDiskon=============================
      var responseDataDiskon = await Get.find<SupabaseClient>()
          .from("diskon")
          .select("id,nama,kupon,waktu,Img,link,id_MenuRawatan");


      String jsonStringDataDiskon = jsonEncode(responseDataDiskon);

      List<dynamic> listDataDataDiskon = json.decode(jsonStringDataDiskon);

      for (int r = 0; r<listDataDataDiskon.length; r++){
        Map<String,dynamic>.of(listDataDataDiskon[r]).forEach((key, value) {
          fixdata(jsonStringDataDiskon, value,key,r,listDataDataDiskon);
        });
      }

      // listDataObjHitung.forEach((element) {element.id = int.tryParse(element.id.toString())!; });

      List<Diskon> listkuDataDiskon = Diskon.decodew(listDataDataDiskon);

      listkuDataDiskon.sort((a, b) => a.id.compareTo(b.id));
      datadiskon =  listkuDataDiskon;

      return [DataProducts.decodew(listData),KategoriMenuRawatan.decodew(listDataMenuRawatan)];


    } catch (e) {

      c.connection_e.value =false;
      print('${e.toString()}sdasdasdsa');
      return e;
    }
  }
}
//
DatabaseService databaseKuP = DatabaseService();



//
//
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   GetIt locator = GetIt.instance;
//
//   if (GetIt.I.isRegistered<SupabaseClient>() == false) {
//     locator.registerSingleton<SupabaseClient>(SupabaseClient(
//       'https://iopkyzkhxhwaogmcwwoy.supabase.co',
//       'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImlvcGt5emtoeGh3YW9nbWN3d295Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTU0NDE5MDksImV4cCI6MjAxMTAxNzkwOX0.awl9zmD08A4uPu2DeUCoWDnRUWVSVb6cAI2zl_OnIBo',
//     ));
//   }
//
//   // Mendapatkan direktori penyimpanan lokal aplikasi
//   Directory appDocumentsDirectory = await getApplicationDocumentsDirectory();
//   print('1');
//
//   String filePath = '${appDocumentsDirectory.path}/datajsonku.json';
//   print('2');
//   databaseKuP.fetchDataProduksku().then((value) => value);
//   print('3');
//
//   List<dynamic> data = dataProducts;
//   print('4');
//
//   // Konversi data menjadi JSON string
//   String jsonString = jsonEncode(data);
//   print('5');
//
//   // Tulis JSON string ke file
//   File file = File(filePath);
//   print('6');
//
//   await file.writeAsString(jsonString);
//   print('7');
//
//   print('Data berhasil ditulis ke file JSON di $filePath');
// }

//
//

//
// class AppService extends ChangeNotifier {
//   final _password = 'PfNNpwyL6infYBz';
//
//   Future<void> _createUser(int i) async {
//     final response = await supabase.auth.signUp('test_$i@test.com', _password);
//
//     await supabase
//         .from('contact')
//         .insert({'id': response.user!.id, 'username': 'User $i'}).execute();
//   }
//
//   Future<void> createUsers() async {
//     await _createUser(1);
//     await _createUser(2);
//   }
//
//   Future<void> signIn(int i) async {
//     await supabase.auth.signIn(email: 'test_$i@test.com', password: _password);
//   }
//
//   Future<void> signOut() async {
//     await supabase.auth.signOut();
//   }
//
//   Future<String> _getUserTo() async {
//     final response = await supabase
//         .from('contact')
//         .select('id')
//         .not('id', 'eq', getCurrentUserId())
//         .execute();
//
//     return response.data[0]['id'];
//   }
//
//   Stream<List<Message>> getMessages() {
//     return supabase
//         .from('message')
//         .stream(['id'])
//         .order('created_at')
//         .execute()
//         .map((maps) => maps
//         .map((item) => Message.fromJson(item, getCurrentUserId()))
//         .toList());
//   }
//
//   Future<void> saveMessage(String content) async {
//     final userTo = await _getUserTo();
//
//     final message = Message.create(
//         content: content, userFrom: getCurrentUserId(), userTo: userTo);
//
//     await supabase.from('message').insert(message.toMap()).execute();
//   }
//
//   Future<void> markAsRead(String messageId) async {
//     await supabase
//         .from('message')
//         .update({'mark_as_read': true})
//         .eq('id', messageId)
//         .execute();
//   }
//
//   bool isAuthentificated() => supabase.auth.currentUser != null;
//
//   String getCurrentUserId() =>
//       isAuthentificated() ? supabase.auth.currentUser!.id : '';
//
//   String getCurrentUserEmail() =>
//       isAuthentificated() ? supabase.auth.currentUser!.email ?? '' : '';
// }