// import 'package:rawatt/screens/profile/maknaLogo.dart';
// import 'package:rawatt/screens/profile/sejarah.dart';
// import 'package:flutter/material.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         // Application name
//         title: 'Flutter Hello World',
//         // Application theme data, you can set the colors for the application as
//         // you want
//         theme: ThemeData(
//           primarySwatch: Colors.blue,
//         ),
//         // A widget which will be started on application startup
//         home: Sejarah()
//         // MaknaLogo(),
//         );
//   }
// }
// import 'package:function_tree/function_tree.dart';
// void main() {
//   // Map<String,dynamic> ku = {
//   //     'pi': "3.14",
//   //     't': "0",
//   //     'const_1': "6",
//   //     "const_2": "3",
//   //     "rI": "0",
//   //     "rII": "0"
//   //   };
//   //   String rumusStr =  " (3.14  x t)/ 6 x ((3 x rI^2) + (3 x rII^2) + t^2 )";
//   // print(rumusStr.replaceAllMapped(RegExp(r't'), ku['t'].toString() ));
//   pigLatin(String words) => words.replaceAllMapped(
//     RegExp(r'\b(\w*?)([aeiou]\w*)', caseSensitive: false),
//     (Match m) => "${m[2]}${m[1]}${m[1]!.isEmpty ? 'way' : 'ay'}");

//     pigLatin('I have a secret now!'); // 'Iway avehay away ecretsay ownay!'
// }

// import 'package:rawatt/components/BG.dart';
// import 'package:rawatt/components/card_field.dart';
// import 'package:rawatt/components/inputan.dart';
// import 'package:rawatt/constants.dart';
// import 'package:rawatt/model/dosis/dosis_pupuk_tunggal.dart';
// import 'package:rawatt/screens/convert/_model.dart';
// import 'package:rawatt/screens/convert/blocs/pemupukanTunggal/PPT_bloc.dart';
// import 'package:rawatt/screens/convert/blocs/pemupukanTunggal/PPT_event.dart';
// import 'package:rawatt/screens/convert/component/Widget_Jenis_Lahan.dart';
// import 'package:rawatt/screens/convert/component/component.dart';
// import 'package:rawatt/screens/convert/kalkulator.dart';
// import 'package:rawatt/size_config.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class PupukBerdasarkanAnjuranPupukTunggal extends StatefulWidget {
//   final Color tema;

//   const PupukBerdasarkanAnjuranPupukTunggal({Key key, required required required this.tema})
//       : super(key: key);
//   @override
//   _PupukBerdasarkanAnjuranPupukTunggalState createState() =>
//       _PupukBerdasarkanAnjuranPupukTunggalState();
// }

// class _PupukBerdasarkanAnjuranPupukTunggalState
//     extends State<PupukBerdasarkanAnjuranPupukTunggal> {
//   List<Map<String, dynamic>> data = DosisPupukTunggal;
//   String komoditi = "Padi Sawah";
//   String typeLahan = "Lahan Rata";

//   bool isVisiblePenjelas = true;
//   List dataKomoditi = [];
//   List dataDropdown = [];
//   bool isVisibleDatar = true;
//   bool isVisibleBedengan = false;

//   @override
//   Widget build(BuildContext context) {
//     int selectedTypeLahans = stateTypeLahan;
//     List<dynamic> typeLahanValues =
//         List.from(listTypeLahan[selectedTypeLahans].hasil.values)
//             .map((e) => e[1])
//             .toList();

//     Color tema = Colors.blueGrey.shade600;
//     dataKomoditi =
//         data.where((me) => komoditi == me["Komoditi"].toString()).toList();
//     dataDropdown = data.map((m) => m["Komoditi"].toString()).toList();
//     return SingleChildScrollView(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.end,
//         children: [
//           CardFields(
//             tema: tema,
//             judul: "Komoditi : ",
//             columns: Column(
//               children: [
//                 Padding(
//                   padding:
//                       EdgeInsets.symmetric(vertical: heightfit(defaultPadding)),
//                   child: DropDowns((newActivity) {
//                     setState(
//                       () {
//                         komoditi = newActivity;
//                         // print(typeLahan);
//                         print("data Komoditi ${dataKomoditi}");
//                         if (komoditi != "Pilih Komoditi") {
//                           isVisiblePenjelas = true;
//                         }
//                       },
//                     );
//                   }, tema, dataDropdown, "Komoditi", komoditi, "Komoditi"),
//                 ),
//                 Visibility(
//                   visible: isVisiblePenjelas,
//                   child: Container(
//                     padding: EdgeInsets.only(
//                         bottom: defaultPadding / 2,
//                         left: defaultPadding,
//                         right: defaultPadding),
//                     width: double.infinity,
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       // mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         RichText(
//                           text: TextSpan(
//                             children: [
//                               TextSpan(
//                                   text: "Komoditi : ",
//                                   style: TextStyle(fontSize: heightfit(20))),
//                               TextSpan(
//                                   text: "${dataKomoditi[0]["Komoditi"]}\n",
//                                   style: TextStyle(fontSize: heightfit(24))),
//                               TextSpan(
//                                   text: "Dosis (kg/ha) : ",
//                                   style: TextStyle(fontSize: heightfit(20))),
//                               TextSpan(
//                                   text: dataKomoditi[0]["Dosis (kg/ha)"],
//                                   style: TextStyle(fontSize: heightfit(24))),
//                             ],
//                             style: TextStyle(color: Colors.blueGrey),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           WidgetFormTypeLahan(
//             indexKe: 0,
//             tema: widget.tema,
//             indexPageCalkulator: 0,
//             onChangeState: (typesLahanValue) {
//               print(typesLahanValue);
//               typeLahanValues = typesLahanValue;
//             },
//           ),
//           Padding(
//             padding:
//                 EdgeInsets.symmetric(horizontal: widthfit(defaultPadding / 2)),
//             child: ElevatedButton(
//               style: ElevatedButton.styleFrom(
//                   padding: EdgeInsets.all(1),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(5),
//                   ),
//                   elevation: 0,
//                   primary: tema),
//               // height: heightfit(30),
//               child: Container(
//                 padding: EdgeInsets.symmetric(
//                     horizontal: widthfit(defaultPadding / 2)),
//                 child: Text('Kalkulasi ',
//                     style: TextStyle(
//                         color: Colors.white, fontSize: heightfit(20))),
//               ),
//               onPressed: () {
//                 BlocProvider.of<PPTBloc>(context).add(PPTEvent(
//                     // satuan
//                     typeLahan,
//                     dataKomoditi,
//                     typeLahanValues));
//                 Navigator.pushNamed(context, '/PPT_display');
//               },
//               // color: kColor,
//             ),
//           ),
//           SizedBox(
//             height: defaultPadding,
//           ),
//         ],
//       ),
//     );
//   }
// }
