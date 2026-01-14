// import 'package:rawatt/components/tema_Page.dart';
// import 'package:rawatt/constants.dart';
// import 'package:rawatt/size_config.dart';
// import 'package:card_swiper/card_swiper.dart';
// import 'package:flutter/material.dart';
//
// // import 'package:insta_public_api/insta_public_api.dart';
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:connectivity/connectivity.dart';
//
// class MedsosIG extends StatefulWidget {
//   @override
//   _MedsosIGState createState() => _MedsosIGState();
// }
//
// List<Map<String, dynamic>> DataMainMedsos = [
//   {
//     "id": 0,
//     "photoProfil": "",
//     "nama": "PetroKimia Gresik",
//     "subnama": "Agro Industri",
//     "namaAkun": "petrokimiagresik_official",
//     "jumlahPost": "",
//     "Followers": "",
//     "Following": "",
//     "bio": "",
//     "data": []
//   },
//   {
//     "id": 1,
//     "photoProfil": "",
//     "nama": "pt.pupukindonesia",
//     "subnama": "Pupuk Indonesia",
//     "namaAkun": "pupukindonesia",
//     "jumlahPost": "",
//     "Followers": "",
//     "Following": "",
//     "bio": "",
//     "data": []
//   },
//   {
//     "id": 2,
//     "photoProfil": "",
//     "nama": "Sahabat.Petani",
//     "subnama": "Sahabat Petani",
//     "namaAkun": "Sahabat.Petani",
//     "jumlahPost": "",
//     "Followers": "",
//     "Following": "",
//     "bio": "",
//     "data": []
//   },
// ];
//
// class _MedsosIGState extends State<MedsosIG> {
//   /// Initialize with your username
//   final ipa1 = InstaPublicApi('petrokimiagresik_official', postsLimit: 12);
//   final ipa2 = InstaPublicApi('sahabat.petani', postsLimit: 12);
//   final ipa = InstaPublicApi('pt.pupukindonesia', postsLimit: 12);
//
//   final SwiperController scrolls = SwiperController();
//   int selectedItem = 0;
//
//   /// Helper function
//   Widget makeText(String text) => Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 8),
//         child: RichText(
//             textAlign: TextAlign.justify,
//             text: TextSpan(children: [
//               TextSpan(
//                 text: text,
//                 style: TextStyle(color: Colors.black87),
//               )
//             ])),
//       );
//
//   @override
//   Widget build(BuildContext context) {
//     List<InstaPublicApi> aPImediasosials = [ipa1, ipa, ipa2];
//     return Scaffold(
//         extendBodyBehindAppBar: (SizeConfig.screenWidth !> 600) ? false : true,
//         appBar:
//             (SizeConfig.screenWidth !> 600) ? appBarLanscape() : appBarPotrait(),
//         body: Container(
//           width: double.infinity,
//           height: double.infinity,
//           color: Colors.white,
//           child: BackgraundPotrait(
//             judul: "Akun Instagram ",
//             penjelas: "Content Terbaik",
//             widgets: StreamBuilder<ConnectivityResult>(
//                 stream: Connectivity().onConnectivityChanged,
//                 builder: (_, snapshot) => (snapshot.hasData)
//                     ? Container(
//                         height: heightfit(670),
//                         width: SizeConfig.screenWidth,
//                         child: statusConnection(aPImediasosials, snapshot.data!))
//                     : Center(child: CircularProgressIndicator())), tema: Colors.green,
//           ),
//         ));
//   }
//
//   Widget statusConnection(
//       List<InstaPublicApi> aPImediasosials, ConnectivityResult result) {
//     if (result == ConnectivityResult.wifi ||
//         result == ConnectivityResult.mobile) {
//       return FittedBox(
//         child: Container(
//           height: 580,
//           width: 350,
//           child: Swiper(
//               controller: scrolls,
//               scrollDirection: Axis.vertical,
//               itemCount: aPImediasosials.length,
//               viewportFraction: 1,
//               scale: 0.8,
//               // itemWidth: 145.0,
//               // itemHeight: 145.0,
//               itemBuilder: (context, i) {
//                 return MedSos(
//                   ipa: aPImediasosials[i],
//                   index: i,
//                 );
//               }),
//         ),
//       );
//     } else {
//       return Container(
//           height: 540, width: 400, child: Text("Connection Error"));
//     }
//   }
// }
//
// class MedSos extends StatelessWidget {
//   const MedSos({
//     Key? key,
//     required this.ipa,
//     required this.index,
//   }) : super(key: key);
//
//   final InstaPublicApi ipa;
//   final int index;
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Flexible(
//           flex: 3,
//           child: Container(
//               // height: heightfit(10),
//               width: SizeConfig.screenWidth,
//               margin: EdgeInsets.symmetric(
//                   horizontal: heightfit(defaultPadding / 2)),
//               decoration: BoxDecoration(
//                   borderRadius: BorderRadius.all(Radius.circular(15)),
//                   border: Border.all(
//                       style: BorderStyle.solid,
//                       color: Colors.green.withOpacity(0.3)),
//                   boxShadow: [
//                     BoxShadow(
//                         blurRadius: 5,
//                         offset: Offset(0, 5),
//                         color: Colors.black45.withOpacity(.3))
//                   ],
//                   color: Colors.green),
//               child: infoIG(index: index, ipa: ipa)),
//         ),
//         DataMainMedsos[index]["data"].length == 0
//             ? FutureBuilder(
//                 future: ipa.getTimelinePosts(),
//                 builder: (context, snapshot) {
//                   if (snapshot.error != null) {
//                     return Center(
//                         child: Text(
//                             "Connection Internet Bermasalah ${snapshot.error}"));
//                   }
//                   if (snapshot.connectionState == ConnectionState.waiting) {
//                     return Center(child: CircularProgressIndicator());
//                   } else if (snapshot.connectionState == ConnectionState.none) {
//                     return Center(child: Text("Conection error"));
//                   } else {
//                     DataMainMedsos[index]["data"] = snapshot.data;
//                     return Flexible(
//                         flex: 12, child: MainPostingan(indexs: index));
//                   }
//                 })
//             : Flexible(flex: 12, child: MainPostingan(indexs: index))
//       ],
//     );
//   }
// }
//
// class infoIG extends StatelessWidget {
//   const infoIG({
//     Key? key,
//     required this.index,
//     required this.ipa,
//   }) : super(key: key);
//   final int index;
//   final InstaPublicApi ipa;
//
//   @override
//   Widget build(BuildContext context) {
//     return DataMainMedsos[index]["photoProfil"] == ""
//         ? FutureBuilder(
//             future: ipa.getBasicInfo(),
//             builder: (context, snapshot) {
//               if (snapshot.error != null) {
//                 return Center(
//                     child: Text(
//                         "Connection Internet Bermasalah ${snapshot.error}"));
//               }
//               if (snapshot.connectionState == ConnectionState.waiting) {
//                 return Center(child: CircularProgressIndicator());
//               } else if (snapshot.connectionState == ConnectionState.none) {
//                 return Center(child: Text("Conection error"));
//               } else {
//                 final info = snapshot.data;
//
//                 DataMainMedsos[index]["photoProfil"] = info?.profilePic;
//                 DataMainMedsos[index]["nama"] = info?.fullName;
//                 DataMainMedsos[index]["jumlahPost"] = info?.noOfPosts.toString();
//                 DataMainMedsos[index]["Followers"] = info?.followers.toString();
//                 DataMainMedsos[index]["Following"] = info?.following.toString();
//                 DataMainMedsos[index]["bio"] = info?.bio;
//                 return bingkaiFoto(DataMainMedsos[index]["photoProfil"]);
//               }
//             })
//         : bingkaiFoto(DataMainMedsos[index]["photoProfil"]);
//   }
//
//   Widget bingkaiFoto(String urlImg) {
//     return Container(
//       // height: heightfit(200),
//       // width: SizeConfig.screenWidth,
//       margin: EdgeInsets.all(heightfit(defaultPadding / 2)),
//       child: Row(
//         children: [
//           Expanded(
//             flex: 4,
//             child: FittedBox(
//               child: Container(
//                 height: heightfit(80),
//                 width: heightfit(80),
//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.all(
//                       Radius.circular(heightfit(20)),
//                     ),
//                     border: Border.all(
//                         style: BorderStyle.solid,
//                         color: Colors.green.withOpacity(0.3)),
//                     boxShadow: [
//                       BoxShadow(
//                           blurRadius: 5,
//                           offset: Offset(0, 2),
//                           color: Colors.black54.withOpacity(.3))
//                     ],
//                     color: Colors.white),
//                 child: ClipRRect(
//                   borderRadius: BorderRadius.all(
//                     Radius.circular(20),
//                   ),
//                   child: GestureDetector(
//                     onTap: () {
//                       // DialogImg(context, urlmg, 1, index);
//                     },
//                     child: CachedNetworkImage(
//                       key: UniqueKey(),
//                       errorWidget: (context, url, error) {
//                         return Container(
//                           color: Colors.red,
//                         );
//                       },
//                       placeholder: (context, url) => Center(
//                         child: CircularProgressIndicator(
//                           color: Colors.green,
//                         ),
//                       ),
//                       imageUrl: urlImg,
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           Flexible(
//             flex: 1,
//             child: SizedBox(
//               width: heightfit(defaultPadding),
//             ),
//           ),
//           Expanded(
//             flex: 10,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Expanded(
//                   flex: 4,
//                   child: RichText(
//                       textAlign: TextAlign.start,
//                       text: TextSpan(children: [
//                         TextSpan(
//                             text: DataMainMedsos[index]["nama"]
//                                         .toString()
//                                         .length >
//                                     20
//                                 ? "${DataMainMedsos[index]["nama"].substring(0, 18)}\n"
//                                 : "${DataMainMedsos[index]["nama"]}\n",
//                             style: TextStyle(
//                                 fontSize: heightfit(16),
//                                 // color: Colors.black87,
//                                 fontWeight: FontWeight.bold)),
//                         TextSpan(
//                             text: DataMainMedsos[index]["subnama"],
//                             style: TextStyle(
//                               fontSize: heightfit(12),
//                               // color: Colors.black87,
//                             )),
//                       ])),
//                 ),
//                 Expanded(
//                   flex: 1,
//                   child: SizedBox(
//                     height: heightfit(defaultPadding),
//                   ),
//                 ),
//                 Expanded(
//                   flex: 4,
//                   child: Center(
//                     child: Container(
//                       // width: widthfit(180),
//                       child:
//                           Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               // spacing: heightfit(defaultPadding),
//                               // alignment: WrapAlignment.spaceBetween,
//                               children: [
//                             RichText(
//                                 textAlign: TextAlign.center,
//                                 text: TextSpan(children: [
//                                   TextSpan(
//                                       text:
//                                           "${DataMainMedsos[index]["jumlahPost"].toString().substring(0, 2)} RB\n",
//                                       style: TextStyle(
//                                           fontSize: heightfit(14),
//                                           // color: Colors.black87,
//                                           fontWeight: FontWeight.bold)),
//                                   TextSpan(
//                                       text: "Postingan",
//                                       style: TextStyle(
//                                         fontSize: heightfit(10),
//                                         // color: Colors.black87,
//                                       )),
//                                 ])),
//                             RichText(
//                                 textAlign: TextAlign.center,
//                                 text: TextSpan(children: [
//                                   TextSpan(
//                                       text:
//                                           "${DataMainMedsos[index]["Followers"].toString().substring(0, 2)} RB\n",
//                                       style: TextStyle(
//                                           fontSize: heightfit(14),
//                                           // color: Colors.black87,
//                                           fontWeight: FontWeight.bold)),
//                                   TextSpan(
//                                       text: "Pengikut",
//                                       style: TextStyle(
//                                         fontSize: heightfit(10),
//                                         // color: Colors.black87,
//                                       )),
//                                 ])),
//                             RichText(
//                                 textAlign: TextAlign.center,
//                                 text: TextSpan(children: [
//                                   TextSpan(
//                                       text:
//                                           "${DataMainMedsos[index]["Following"].toString()}\n",
//                                       style: TextStyle(
//                                           fontSize: heightfit(14),
//                                           // color: Colors.black87,
//                                           fontWeight: FontWeight.bold)),
//                                   TextSpan(
//                                       text: "Mengikuti",
//                                       style: TextStyle(
//                                         fontSize: heightfit(10),
//                                         // color: Colors.black87,
//                                       )),
//                                 ])),
//                           ]),
//                     ),
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class MainPostingan extends StatelessWidget {
//   const MainPostingan({
//     Key? key,
//     required this.indexs,
//   }) : super(key: key);
//
//   final int indexs;
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: heightfit(SizeConfig.screenHeight !- 30),
//       padding: EdgeInsets.symmetric(horizontal: heightfit(defaultPadding / 2)),
//       child: GridView.builder(
//         padding: EdgeInsets.symmetric(vertical: heightfit(defaultPadding / 2)),
//         shrinkWrap: true,
//         physics: new NeverScrollableScrollPhysics(),
//         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 3,
//         ),
//         scrollDirection: Axis.vertical,
//         itemCount: DataMainMedsos[indexs]["data"].length,
//         itemBuilder: (BuildContext context, int index) {
//           List<String> urlmg = [
//             ...DataMainMedsos[indexs]["data"][index]
//                 .images
//                 .map((i) => i.displayUrl)
//           ];
//           return Center(
//             child: Container(
//               height: heightfit(210),
//               width: heightfit(210),
//               child: ClipRRect(
//                 child: FittedBox(
//                   child: Container(
//                       height: 100,
//                       width: 100,
//                       margin: EdgeInsets.all(3),
//
//                       // padding: EdgeInsets.symmetric(vertical: 10),
//                       child: urlmg.length >= 1
//                           ? Swiper(
//                               scrollDirection: Axis.horizontal,
//                               itemCount: urlmg.length,
//                               layout: SwiperLayout.TINDER,
//                               itemWidth: 150.0,
//                               itemHeight: 150.0,
//                               itemBuilder: (context, i) {
//                                 return Container(
//                                   margin: EdgeInsets.all(2),
//                                   decoration: BoxDecoration(
//                                       borderRadius:
//                                           BorderRadius.all(Radius.circular(15)),
//                                       border: Border.all(
//                                           style: BorderStyle.solid,
//                                           color: Colors.green.withOpacity(0.3)),
//                                       boxShadow: [
//                                         BoxShadow(
//                                             blurRadius: 5,
//                                             offset: Offset(0, 2),
//                                             color: Colors.green.shade800
//                                                 .withOpacity(.3))
//                                       ],
//                                       color: Colors.white),
//                                   child: ClipRRect(
//                                     borderRadius:
//                                         BorderRadius.all(Radius.circular(15)),
//                                     child: GestureDetector(
//                                       onTap: () {
//                                         DialogImg(context, urlmg, 2, index);
//                                       },
//                                       child: CachedNetworkImage(
//                                         key: UniqueKey(),
//                                         errorWidget: (context, url, error) {
//                                           return Container(
//                                             color: Colors.red,
//                                           );
//                                         },
//                                         placeholder: (context, url) => Center(
//                                           child: CircularProgressIndicator(
//                                             color: Colors.green,
//                                           ),
//                                         ),
//                                         imageUrl: urlmg[i],
//                                         fit: BoxFit.cover,
//                                       ),
//                                     ),
//                                   ),
//                                 );
//                               })
//                           : Center(
//                               child: Container(
//                                 margin: EdgeInsets.all(heightfit(3)),
//                                 decoration: BoxDecoration(
//                                     borderRadius:
//                                         BorderRadius.all(Radius.circular(15)),
//                                     border: Border.all(
//                                         style: BorderStyle.solid,
//                                         color: Colors.green.withOpacity(0.3)),
//                                     boxShadow: [
//                                       BoxShadow(
//                                           blurRadius: 5,
//                                           offset: Offset(0, 3),
//                                           color: Colors.green.withOpacity(.3))
//                                     ],
//                                     color: Colors.white),
//                                 child: ClipRRect(
//                                   child: Container(
//                                     height: heightfit(100),
//                                     width: heightfit(100),
//                                     child: GestureDetector(
//                                       onTap: () {
//                                         DialogImg(context, urlmg, 1, index);
//                                       },
//                                       child: CachedNetworkImage(
//                                         key: UniqueKey(),
//                                         errorWidget: (context, url, error) {
//                                           return Container(
//                                             color: Colors.red,
//                                           );
//                                         },
//                                         placeholder: (context, url) => Center(
//                                           child: CircularProgressIndicator(
//                                             color: Colors.green,
//                                           ),
//                                         ),
//                                         imageUrl: DataMainMedsos[indexs]["data"]
//                                                 [index]
//                                             .displayUrl,
//                                         fit: BoxFit.cover,
//                                       ),
//                                     ),
//                                   ),
//                                   borderRadius: BorderRadius.all(
//                                     Radius.circular(15),
//                                   ),
//                                 ),
//                               ),
//                             )),
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
//
//   Future<String?> DialogImg(
//       BuildContext context, List<String> urlmg, int typePost, int indexImg) {
//     return showDialog<String>(
//         barrierColor: Colors.black45.withOpacity(.4),
//         context: context,
//         builder: (BuildContext context) => AlertDialog(
//               shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.all(Radius.circular(15))),
//               titlePadding: EdgeInsets.symmetric(
//                   vertical: heightfit(12), horizontal: heightfit(12)),
//               contentPadding: const EdgeInsets.fromLTRB(18.0, 0.0, 6.0, 0.0),
//               title: Row(
//                 children: [
//                   Flexible(
//                     flex: 3,
//                     child: ClipRRect(
//                       child: Container(
//                         height: heightfit(50),
//                         width: heightfit(50),
//                         child: CachedNetworkImage(
//                           key: UniqueKey(),
//                           placeholder: (context, url) => Center(
//                             child: CircularProgressIndicator(
//                               color: Colors.green,
//                             ),
//                           ),
//                           imageUrl: DataMainMedsos[indexs]["photoProfil"],
//                           fit: BoxFit.cover,
//                         ),
//                       ),
//                       borderRadius: BorderRadius.all(
//                         Radius.circular(15),
//                       ),
//                     ),
//                   ),
//                   Flexible(flex: 1, child: SizedBox(width: widthfit(8))),
//                   Flexible(
//                     flex: 4,
//                     child: RichText(
//                         textAlign: TextAlign.start,
//                         text: TextSpan(children: [
//                           TextSpan(
//                               text: DataMainMedsos[indexs]["nama"]
//                                           .toString()
//                                           .length >
//                                       20
//                                   ? "${DataMainMedsos[indexs]["nama"].substring(0, 18)}\n"
//                                   : "${DataMainMedsos[indexs]["nama"]}\n",
//                               style: TextStyle(
//                                   fontSize: heightfit(18),
//                                   color: Colors.black87,
//                                   fontWeight: FontWeight.bold)),
//                           TextSpan(
//                               text: DataMainMedsos[indexs]["subnama"],
//                               style: TextStyle(
//                                 fontSize: heightfit(14),
//                                 color: Colors.black87,
//                               )),
//                         ])),
//                   ),
//                 ],
//               ),
//               content: RichText(
//                   text: TextSpan(children: [
//                 TextSpan(
//                     style: TextStyle(
//                       color: Colors.black54,
//                       fontSize: heightfit(14),
//                     ),
//                     text: "Lihat postingan di Instagram "),
//                 TextSpan(
//                     style: TextStyle(
//                       color: Colors.blue,
//                       fontSize: heightfit(14),
//                     ),
//                     text: DataMainMedsos[indexs]["namaAkun"]),
//               ])),
//               actions: <Widget>[
//                 typePost == 1
//                     ? Container(
//                         decoration: BoxDecoration(
//                             borderRadius: BorderRadius.all(Radius.circular(15)),
//                             border: Border.all(
//                                 style: BorderStyle.solid,
//                                 color: Colors.green.withOpacity(0.3)),
//                             boxShadow: [
//                               BoxShadow(
//                                   blurRadius: 5,
//                                   offset: Offset(0, 2),
//                                   color: Colors.green.shade800.withOpacity(.3))
//                             ],
//                             color: Colors.white),
//                         margin: EdgeInsets.all(heightfit(defaultPadding / 2)),
//                         child: ClipRRect(
//                             borderRadius: BorderRadius.all(Radius.circular(15)),
//                             child: CachedNetworkImage(
//                               key: UniqueKey(),
//                               placeholder: (context, url) => Center(
//                                 child: CircularProgressIndicator(
//                                   color: Colors.green,
//                                 ),
//                               ),
//                               errorWidget: (context, url, error) {
//                                 return Container(
//                                   color: Colors.red,
//                                 );
//                               },
//                               imageUrl: DataMainMedsos[indexs]["data"][indexImg]
//                                   .displayUrl,
//                               fit: BoxFit.cover,
//                             )))
//                     : SwipCostume(urlmg: urlmg),
//                 TextButton(
//                   onPressed: () => Navigator.pop(context, 'more Information'),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     children: [
//                       Text(
//                         'OK',
//                         style: TextStyle(
//                             fontSize: heightfit(16), color: Colors.green),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ));
//   }
// }
//
// class SwipCostume extends StatelessWidget {
//   const SwipCostume({
//     Key? key,
//     required this.urlmg,
//   }) : super(key: key);
//
//   final List<String> urlmg;
//
//   @override
//   Widget build(BuildContext context) {
//     return Swiper(
//         scrollDirection: Axis.horizontal,
//         itemCount: urlmg.length,
//         layout: SwiperLayout.TINDER,
//         itemWidth: heightfit(320.0),
//         itemHeight: heightfit(320.0),
//         itemBuilder: (context, i) {
//           return Container(
//               // margin: EdgeInsets.only(top: 0),
//               decoration: BoxDecoration(
//                   borderRadius: BorderRadius.all(Radius.circular(15)),
//                   border: Border.all(
//                       style: BorderStyle.solid,
//                       color: Colors.green.withOpacity(0.3)),
//                   boxShadow: [
//                     BoxShadow(
//                         blurRadius: 5,
//                         offset: Offset(0, 2),
//                         color: Colors.green.shade800.withOpacity(.3))
//                   ],
//                   color: Colors.white),
//               child: ClipRRect(
//                   borderRadius: BorderRadius.all(Radius.circular(15)),
//                   child: CachedNetworkImage(
//                     key: UniqueKey(),
//                     placeholder: (context, url) => Center(
//                       child: CircularProgressIndicator(
//                         color: Colors.green,
//                       ),
//                     ),
//                     errorWidget: (context, url, error) {
//                       return Container(
//                         color: Colors.red,
//                       );
//                     },
//                     imageUrl: urlmg[i],
//                     fit: BoxFit.cover,
//                   )));
//         });
//   }
// }
