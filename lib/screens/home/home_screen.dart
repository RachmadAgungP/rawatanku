import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'dart:typed_data';
import 'dart:ui';
import 'package:card_swiper/card_swiper.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'dart:math' as math;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:device_info_plus/device_info.dart';
// import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:path_provider/path_provider.dart';
import 'package:progress_tracker/progress_tracker.dart';

import 'package:rawatt/Debug/aiWork.dart';
import 'package:rawatt/Debug/dataAi.dart';
import 'package:rawatt/Debug/diaknosisPenyakit.dart';
import 'package:rawatt/Debug/searchKomoditiKal.dart';
import 'package:rawatt/Debug/widget_mediaLahan.dart';
import 'package:rawatt/components/tema_Page.dart';
import 'package:rawatt/constants.dart';
import 'package:rawatt/location_services.dart';
import 'package:rawatt/main.dart';
import 'package:rawatt/model/MenuRawatan/mdl_MenuRawatan.dart';
import 'package:rawatt/model/controler.dart';
import 'package:rawatt/model/daerah/kab.dart';
import 'package:rawatt/model/daerah/kec.dart';
import 'package:rawatt/model/daerah/prov.dart';
import 'package:rawatt/model/data_.dart';
import 'package:rawatt/model/data_hargaPangan.dart';
import 'package:rawatt/model/datafix.dart';
import 'package:rawatt/model/dosis/fieldku_campur.dart';
import 'package:rawatt/notifire/databaseNotif.dart';

import 'package:rawatt/screens/convert/component/component.dart';
import 'package:rawatt/screens/convert/component/inisialisasi_var.dart';
import 'package:rawatt/screens/home/components/card_ButtonsMenu.dart';
import 'package:rawatt/screens/home/screen_Lanscape/backgrounds.dart';
import 'package:rawatt/screens/home/screen_Lanscape/navbar.dart';
import 'package:rawatt/screens/home/screen_Portrait/backgrounds.dart';
import 'package:rawatt/screens/home/screen_Portrait/layer2_home.dart';
import 'package:rawatt/screens/profile/maknaLogo.dart';
import 'package:rawatt/service/ad_mob_service.dart';
import 'package:rawatt/size_config.dart';
import 'package:flutter/material.dart';

// import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

// import 'package:supabase/supabase.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

import '../../components/card_img.dart';
import '../../components/card_product.dart';
import '../../components/inputan.dart';
import '../../model/jenisMesin/mdl_JenisMesin.dart';
import '../../model/petani/mdl_Petani.dart';
import '../../model/product/mdl_Produk.dart';
import '../../paletteColor.dart';
import '../../service/database_service.dart';
import '../../settingss.dart';
import '../convert/component/Widget_Jarak_Tanaman.dart';
import '../convert/component/dialogku.dart';
import '../convert/screens/dosis_pupuk_tanaman/dosis_pupuk_tanaman.dart';
import '../details/component/component.dart';
import '../details/details_screen.dart';
import '../product/cariHidroponik.dart';
import '../profilePetani.dart';
import 'countdown_time.dart';

// import 'countdown_time.dart';
import 'package:crystal_navigation_bar/crystal_navigation_bar.dart';

// ?===============================================
class BlurryEffect extends StatelessWidget {
  final double opacity;
  final double blurry;
  final Color shade;

  const BlurryEffect(this.opacity, this.blurry, this.shade, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: blurry, sigmaY: blurry),
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(color: shade.withOpacity(opacity)),
          ),
        ),
      ),
    );
  }
}

// class DataApi {
//   Future<List> readJson(url) async {
//     final response = await http.get(Uri.parse(url));
//     // Map harga = response.body.;
//     // print(harga.keys);
//     // final datasurah = await json.decode(response.body) as List;
//     HargaPangan datahargaPangan =
//         HargaPangan.fromJson(jsonDecode(response.body));
//     List sda = HargaPangan.fromJson(jsonDecode(response.body)).tableData;
//     // print("Coba ${sda[0].name}");
//     String comodity = HargaPangan.fromJson(jsonDecode(response.body)).commodity;
//     // print("${comodity}");
//     List dataout = [DatahargaPangan(sda), comodity];
//     return (dataout);
//     // print(datahargaPangan.tableData[0].name);
//   }
// }

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  // static String routeName = "/home";
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

// Future<void> openUrl(String url,
//     {bool forceWebView = false, bool enableJavaScript = false}) async {
//   if (await canLaunch(url)) {
//     await launch(url,
//         forceWebView: forceWebView, enableJavaScript: enableJavaScript);
//   }
// }

// void gaetdata() {
//   readJson(
//       "https://hargapangan.id/index.php?option=com_gtpihps&e5097018726ab8be538a6f6bf4d47036=1&commodity_id=cat-2&price_type_id=1&data_type=price&date=11-03-2022&task=json.getData&_=1647069290544");
// }
// List dataHargaPangan = [
//   TableDatum(
//       value: "14150", name: "Kalimantan Tengah", display: "Rp14.150", id: "22")
// ];
// List dataHargaPanganAkhir = [
//   TableDatum(
//       value: "13150", name: "Kalimantan Tengah", display: "Rp14.150", id: "22")
// ];

Map dataharga = {};
List dataHargaPangann = [];
List dataHargaPanganAkhirn = [];
List dataComodity = [];
String lokasi = "";
String provinsi = "";
String formattedDateAkhir = "";
String formattedDateAwal = "";
//
// LokasiServices datalokasi = LokasiServices();
//
// DataApi dataApi = DataApi();
//
// Future<List> datahargapanganAsyncCall(int cat) async {
//   var yest = new DateTime.now().subtract(Duration(days: 2));
//   var formatter = new DateFormat('dd-MM-yyyy');
//   var now = new DateTime.now().subtract(Duration(days: 1));
//   formattedDateAkhir = formatter.format(now);
//   formattedDateAwal = formatter.format(yest);
//   List dataHargaPangan = await dataApi
//       .readJson(
//           "https://hargapangan.id/index.php?option=com_gtpihps&e5097018726ab8be538a6f6bf4d47036=1&commodity_id=cat-$cat&price_type_id=1&data_type=price&date=${formattedDateAkhir}&task=json.getData&_=1647069290544")
//       .then((value) => [value[0].dataHargaPangan, value[1]]);
//
//   List dataHargaPanganAkhir = await dataApi
//       .readJson(
//           "https://hargapangan.id/index.php?option=com_gtpihps&e5097018726ab8be538a6f6bf4d47036=1&commodity_id=cat-$cat&price_type_id=1&data_type=price&date=${formattedDateAwal}&task=json.getData&_=1647069290544")
//       .then((value) => [value[0].dataHargaPangan, value[1]]);
//   lokasi = await datalokasi.getCoordinate();
//   return [dataHargaPangan, lokasi, dataHargaPanganAkhir];
// }

// Future datalokasiAsyncCall() async {
//   // lokasi = await datalokasi.getCoordinate();
//   lokasi = await datalokasi.getCoordinate().then((value) => value);

//   lokasi);
// }
bool errors = false;
bool datakosong = false;

Uint8List? imageBytes;

Color primary = Colors.blueGrey;
Color primaryText = Colors.black;
Color background = Colors.white;
List<Color> palette = [];

enum _SelectedTab { home, bacode, search }

class _HomeScreenState extends State<HomeScreen> {
  // ===========================================================

  // String nama_petani = "";
  // String notlp = "+62";
  // String desa_petani = "Desa";

  DatabaseService databaseKu = DatabaseService();
  final TextEditingController controllersnama = TextEditingController();
  final TextEditingController controllerstlp = TextEditingController();
  final TextEditingController controllersDesa = TextEditingController();

  Future<List<DataProducts>> readJson(url) async {
    final response = await http.get(Uri.parse(url));
    print(response.body);
    List<DataProducts> dataProduk = DataProducts.decode(response.body);

    return (dataProduk);
    // print(datahargaPangan.tableData[0].name);
  }

  //
  // Future<List<DataProducts>> datahargapanganAsyncCall(int cat) async {
  //   List<DataProducts> dataPro = await dataProdukApi
  //         .readJson(
  //         "https://raw.githubusercontent.com/RachmadAgungP/Rachmad.github.oi/master/data.json"));
  //   return  dataPro;
  // }

  //
  // Future<List> datahargapanganAsyncCall(int cat) async {
  //   var yest = new DateTime.now().subtract(Duration(days: 2));
  //   var formatter = new DateFormat('dd-MM-yyyy');
  //   var now = new DateTime.now().subtract(Duration(days: 1));
  //   formattedDateAkhir = formatter.format(now);
  //   formattedDateAwal = formatter.format(yest);
  //   List dataHargaPangan = await dataApi
  //       .readJson(
  //       "https://hargapangan.id/index.php?option=com_gtpihps&e5097018726ab8be538a6f6bf4d47036=1&commodity_id=cat-$cat&price_type_id=1&data_type=price&date=${formattedDateAkhir}&task=json.getData&_=1647069290544")
  //       .then((value) => [value[0].dataHargaPangan, value[1]]);
  //
  //   List dataHargaPanganAkhir = await dataApi
  //       .readJson(
  //       "https://hargapangan.id/index.php?option=com_gtpihps&e5097018726ab8be538a6f6bf4d47036=1&commodity_id=cat-$cat&price_type_id=1&data_type=price&date=${formattedDateAwal}&task=json.getData&_=1647069290544")
  //       .then((value) => [value[0].dataHargaPangan, value[1]]);
  //   lokasi = await datalokasi.getCoordinate();
  //   return [dataHargaPangan, lokasi, dataHargaPanganAkhir];
  // }

  @override
  void initState() {
    // TODO: implement setState
    // setState(() {
    colorBackground =
        warnas(dataKategoriMenuRawatan[c.indexMenuRawatan.value].colorku[0]);
    // edit menu yang ditampilkan
    c.indexMenuRawatan.value = 1;
    // extractColors();
    // print("c.isviewdialogValid.value ${c.palette.value}");
    // });

    // _createBAnnerAd1();
    // _createBAnnerAd2();
    c.indexsubMenuRawatan.value = 1;
    c.isdialogPenting.value = true;
    _checkSavedSerial();

    super.initState();
  }

  // BannerAd _banner1;
  // BannerAd _banner2;
  //
  // void _createBAnnerAd1() {
  //   _banner1 = BannerAd(
  //     size: AdSize.fullBanner,
  //     adUnitId: AdMobService.bannerAdUnitId,
  //     listener: AdMobService.bannerListener,
  //     request: const AdRequest(),
  //   )..load();
  // }
  //
  // void _createBAnnerAd2() {
  //   _banner2 = BannerAd(
  //     size: AdSize.fullBanner,
  //     adUnitId: AdMobService.bannerAdUnitId,
  //     listener: AdMobService.bannerListener,
  //     request: const AdRequest(),
  //   )..load();
  // }

  int indexProv = 0;
  String img_prod = '';
  String img_back1 = '';
  String img_back2 = '';

  final iconList = <IconData>[
    Icons.brightness_5,
    Icons.brightness_4,
    Icons.brightness_6,
    Icons.brightness_7,
  ];
  final _bottomNavIndex = 0;
  var _selectedTab = _SelectedTab.home;

  IconData iconData = Icons.check;
  Color iconColor = Colors.green;
  String results = "";
  List<String> idBarcode = dataProductsObj
      .map((e) => e.id.toString() + e.id_MenuRawatan.toString())
      .toList();

  void showAlert(BuildContext context, String message) {
    DataProducts producket = dataProductsObj
        .where((element) => element.id.toString() == message.substring(0, 2))
        .last;
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Hasil Barcode Produk'),
          content: FittedBox(
            child: Column(
              children: [
                // results = message.substring(0,2);
                // ProductListCard(data: data, index: index, press: press);
                FittedBox(
                    child: SizedBox(
                  // padding: EdgeInsets.symmetric(horizontal: defaultPadding/2),
                  height: 180.0,
                  width: 130,
                  child: Stack(
                    children: [
                      ProductListCard(
                        index: int.tryParse(message.substring(0, 2))!,
                        data: producket,
                        press: () {},
                        key: Key("s"),
                        todetail: true,
                      ),
                    ],
                  ),
                )),
                Icon(iconData, color: iconColor, size: heightfit(35)),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void setIconData(IconData data, Color color) {
    setState(() {
      iconData = data;
      iconColor = color;
    });
  }

  void checkNama(String targetId, BuildContext context) {
    setState(() {
      if (idBarcode.contains(targetId)) {
        // Nama ditemukan dalam list
        showAlert(context, targetId);
        setIconData(Icons.check, Colors.green);
      } else {
        // Nama tidak ditemukan dalam list
        showAlert(context, "Nama Tidak Ditemukan");
        setIconData(Icons.close, Colors.red);
      }
    });
  }

  void _handleIndexChanged(int i) {
    setState(() {
      _selectedTab = _SelectedTab.values[i];
      if (i == 2) {
        Navigator.pushNamed(context, 'product');
      }
      if (i == 1) {
        // _scan();
      }
    });
  }

  final TextEditingController _serialController = TextEditingController();
  String _message = '';
  bool _isValid = false;

  // Daftar serial number yang valid (6 digit)
  final List<String> _validSerialNumbers = [
    'ABC123',
    'DEF456',
    'GHI789',
    'JKL012',
    'MNO345'
  ];

  String? _activeSerialNumber;

  Future<void> _checkSavedSerial() async {
    final prefs = await SharedPreferences.getInstance();
    final savedSerial = prefs.getString('active_serial');

    if (savedSerial != null && savedSerial.isNotEmpty) {
      // Dapatkan device ID
      final deviceInfo = DeviceInfoPlugin();
      String? deviceId;

      try {
        if (Theme.of(context).platform == TargetPlatform.android) {
          AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
          deviceId = androidInfo.id;
        } else if (Theme.of(context).platform == TargetPlatform.iOS) {
          IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
          deviceId = iosInfo.identifierForVendor;
        } else {
          deviceId = 'unknown';
        }
      } catch (e) {
        deviceId = 'error';
      }

      if (deviceId == 'unknown' || deviceId == 'error') {
        setState(() {
          _message = 'Gagal memverifikasi perangkat';
        });
        return;
      }

      final key = 'serial_$savedSerial';
      final storedDeviceId = prefs.getString(key);

      if (storedDeviceId == deviceId) {
        setState(() {
          _isValid = true;
          _activeSerialNumber = savedSerial;
          _message = 'Serial number $savedSerial aktif untuk perangkat ini';
        });
      } else {
        // Device ID tidak match, hapus serial yang tersimpan
        await prefs.remove('active_serial');
      }
    }
  }

  Future<void> _validateSerialNumber() async {
    final serialNumber = _serialController.text.trim().toUpperCase();

    // Validasi format
    if (serialNumber.length != 6) {
      setState(() {
        _message = 'Serial number harus 6 karakter';
      });
      return;
    }

    // Validasi apakah serial number ada di daftar
    if (!_validSerialNumbers.contains(serialNumber)) {
      setState(() {
        _message = 'Serial number tidak valid';
      });
      return;
    }

    // Dapatkan device ID
    final deviceInfo = DeviceInfoPlugin();
    String? deviceId;

    try {
      if (Theme.of(context).platform == TargetPlatform.android) {
        AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
        deviceId = androidInfo.id;
      } else if (Theme.of(context).platform == TargetPlatform.iOS) {
        IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
        deviceId = iosInfo.identifierForVendor;
      } else {
        deviceId = 'unknown';
      }
    } catch (e) {
      deviceId = 'error';
    }

    if (deviceId == 'unknown' || deviceId == 'error') {
      setState(() {
        _message = 'Gagal mendapatkan informasi perangkat';
      });
      return;
    }

    final prefs = await SharedPreferences.getInstance();
    final key = 'serial_$serialNumber';
    final storedDeviceId = prefs.getString(key);

    if (storedDeviceId == null) {
      // Serial number belum pernah digunakan di perangkat manapun
      await prefs.setString(key, deviceId!);
      await prefs.setString('active_serial', serialNumber);
      setState(() {
        _message = 'Serial number berhasil diaktivasi untuk perangkat ini';
        _isValid = true;
        _activeSerialNumber = serialNumber;
      });
    } else if (storedDeviceId == deviceId) {
      // Serial number sudah terdaftar untuk perangkat ini
      await prefs.setString('active_serial', serialNumber);
      setState(() {
        _message = 'Serial number valid untuk perangkat ini';
        _isValid = true;
        _activeSerialNumber = serialNumber;
      });
    } else {
      // Serial number sudah digunakan di perangkat lain
      setState(() {
        _message = 'Serial number sudah digunakan di perangkat lain';
      });
    }
  }

  Future<void> _resetSerial() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('active_serial');

    setState(() {
      _isValid = false;
      _message = '';
      _activeSerialNumber = null;
      _serialController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    // print(photos);
    // final currentUser = GetIt.instance<SupabaseClient>().auth.user();
    // print("baru -> " + " ${dataHargaPanganAkhir[0].name}");
    // print("c.cartsku.value ${c.cartsku.value}");

    return FutureBuilder(
        future: loadData(),
        builder: (context, _) {
          print("warnaku ${parentData.map((e) => e.indexmenu)}");
          return Scaffold(
              extendBody: true,
              bottomNavigationBar: CrystalNavigationBar(
                margin: EdgeInsets.zero,
                currentIndex: _SelectedTab.values.indexOf(_selectedTab),
                // indicatorColor: Colors.blue,
                unselectedItemColor: Colors.white70,

                backgroundColor: Colors.black.withOpacity(0.6),
                onTap: _handleIndexChanged,
                items: [
                  /// Home
                  CrystalNavigationBarItem(
                    icon: Icons.home,
                    unselectedIcon: Icons.home,
                    selectedColor: Colors.white,
                  ),

                  /// Add
                  CrystalNavigationBarItem(
                    icon: Icons.document_scanner_outlined,
                    unselectedIcon: Icons.document_scanner_outlined,
                    selectedColor: Colors.white,
                  ),

                  /// Search
                  CrystalNavigationBarItem(
                      icon: Icons.shop,
                      unselectedIcon: Icons.calculate,
                      selectedColor: Colors.white),
                ],
              ),
              extendBodyBehindAppBar:
                  (SizeConfig.screenWidth! > 600) ? false : true,
              // backgroundColor: Colors.transparent,
              drawer: Obx(() {
                return Drawer(
                  backgroundColor: colorBackground,
                  elevation: 9,
                  child: SingleChildScrollView(
                    // it enables scrolling
                    child: Column(
                      children: [
                        DrawerHeader(
                            child: ImgOnline(
                                dataKategoriMenuRawatan[
                                        c.indexMenuRawatan.value]
                                    .img,
                                dataKategoriMenuRawatan[
                                        c.indexMenuRawatan.value]
                                    .img
                                    .toString())),
                        // DrawerListTile(
                        //   title: "Dashboard",
                        //   svgSrc: "assets/icons/Petrokimia_logo.png",
                        //   press: () {},
                        // ),
                        // DrawerListTile(
                        //   title: "About",
                        //   // svgSrc: "assets/icons/menu_setting.svg",
                        //   press: () {
                        //     Navigator.pushNamed(context, 'profilePetani');
                        //   },
                        //   svgSrc: '',
                        // ),
                        DrawerListTile(
                          title: "Log Out",
                          // svgSrc: "assets/icons/menu_setting.svg",
                          press: () {
                            _logout(context);
                          },
                          svgSrc: '',
                        ),
                      ],
                    ),
                  ),
                );
              }),
              appBar: (SizeConfig.screenWidth! > 600)
                  ? appBarLanscape()
                  : appBarPotrait(),
              body: LayoutBuilder(builder: (context, constraints) {
                // if (!_isValid) {

                // };
                if (constraints.maxWidth > 600) {
                  // c.isLoadButton.value = false;
                  return Stack(
                    children: [
                      NarrowLayout(),
                      // (!_isValid)? Container(
                      //   color:Colors.white,
                      //
                      //   child: Center(
                      //     child: Column(
                      //       mainAxisAlignment: MainAxisAlignment.center,
                      //
                      //       children: [
                      //         TextField(
                      //           controller: _serialController,
                      //           decoration: InputDecoration(
                      //             labelText: 'Masukkan Serial Number',
                      //             border: OutlineInputBorder(),
                      //           ),
                      //           maxLength: 6,
                      //         ),
                      //         SizedBox(height: 20),
                      //         ElevatedButton(
                      //           onPressed: _validateSerialNumber,
                      //           child: Text('Validasi'),
                      //         ),
                      //         SizedBox(height: 20),
                      //         Text(
                      //           _message,
                      //           style: TextStyle(
                      //             color: _isValid ? Colors.green : Colors.red,
                      //             fontSize: 18,
                      //           ),
                      //           textAlign: TextAlign.center,
                      //         )
                      //       ],
                      //
                      //     ),
                      //   ),
                      // ):Container(),
                    ],
                  );
                } else {
                  return Stack(
                    children: [
                      // if (_isValid) ...[

                      NarrowLayout(),
                      //       (!_isValid)? Container(
                      //   color:Colors.white,
                      //
                      //   child: Center(
                      //     child: Column(
                      //       mainAxisAlignment: MainAxisAlignment.center,
                      //
                      //     children: [
                      //     TextField(
                      //     controller: _serialController,
                      //     decoration: InputDecoration(
                      //     labelText: 'Masukkan Serial Number',
                      //     border: OutlineInputBorder(),
                      //     ),
                      //     maxLength: 6,
                      //     ),
                      //     SizedBox(height: 20),
                      //     ElevatedButton(
                      //     onPressed: _validateSerialNumber,
                      //     child: Text('Validasi'),
                      //     ),
                      //     SizedBox(height: 20),
                      //     Text(
                      //     _message,
                      //     style: TextStyle(
                      //     color: _isValid ? Colors.green : Colors.red,
                      //     fontSize: 18,
                      //     ),
                      //     textAlign: TextAlign.center,
                      //     )
                      //     ],
                      //
                      //     ),
                      //   ),
                      // ):Container(),
                      // ],
                    ],
                  );
                }
              }));
        });
  }
}

Future<void> _logout(context) async {
  // await GetIt.I.get<SupabaseClient>().auth.signOut();

  final sharedPreferences = await SharedPreferences.getInstance();
  sharedPreferences.clear();

  Navigator.pushReplacementNamed(context, '/');
}

class WideLayout extends StatelessWidget {
  const WideLayout({super.key});

  @override
  Widget build(BuildContext context) {
    // List selectedperusahaanList = perusahaan;
    return BackgraundHomeR();
  }
}

void launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Tidak dapat membuka URL: $url';
  }
}

class NarrowLayout extends StatefulWidget {
  const NarrowLayout({super.key});

  @override
  _NarrowLayoutState createState() => _NarrowLayoutState();
}

void _launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Tidak dapat membuka URL: $url';
  }
}

List<Status> statuList = [
  Status(name: 'ORDER', icon: Icons.shopping_bag),
  Status(name: 'SHIP', icon: Icons.local_shipping),
  Status(name: 'DONE', icon: Icons.check_circle),
];

class _NarrowLayoutState extends State<NarrowLayout> {
  // ============================================================
  List datas = [1, 5, 6, 7, 8];
  final ScrollController _parentController = ScrollController();

  // List comodity = [];
  void inits() {
    //   dataHargaPanganAkhirn.clear();
    //   dataHargaPangann.clear();
    //   for (int i = 0; i < 5; i++) {
    //     datahargapanganAsyncCall(datas[i]).catchError((onError) {
    //       setState(() {
    //         errors = false;
    //         datakosong = false;
    //       });
    //     }).then((value) {
    //       setState(() {
    //         if (value == null) {
    //           datakosong = false;
    //         } else {
    //           datakosong = true;
    //           // print("inilah  ${value}");
    //           dataHargaPangann.add(value[0][0]);
    //           lokasi = value[1];
    //           dataHargaPanganAkhirn.add(value[2][0]);

    //           List dataharga_awal =
    //               value[0][0].map((ei) => [ei.name, ei.value]).toList();
    //           List dataharga_akhir =
    //               value[2][0].map((ei) => [ei.name, ei.value]).toList();
    //           dataharga["${value[0][1]}"] = [];
    //           for (int u = 0; u < dataharga_awal.length; u++) {
    //             if (value[1] == value[0][0][u].name) {
    //               dataharga["${value[0][1]}"]
    //                   .add(int.tryParse(value[0][0][u].value));
    //             }
    //             if (value[1] == value[2][0][u].name) {
    //               dataharga["${value[0][1]}"]
    //                   .add(int.tryParse(value[2][0][u].value));
    //             }
    //           }
    //           ;
    //         }
    //       });
    //     }).whenComplete(() {
    //       setState(() {
    //         if (dataHargaPanganAkhirn.isNotEmpty && dataHargaPangann.isNotEmpty) {
    //           errors = true;
    //         } else {
    //           errors = false;
    //         }
    //       });
    //     });
    //   }
  }

  Future<void> refreshData() async {
    await Future.delayed(Duration(seconds: 1));
    // await fetchDataPetani(1);

    // inits();
    // setState(() {});
  }

  List<DataProducts> dataProduk = [];
  List<MyData> dataKonsumsiListrik = [];

  @override
  void initState() {
    setState(() {
      c.produkku.value.quantity;
      c.indexMenuRawatan.value;
      c.connection_e.value = true;
    });

    super.initState();
    // inits();

    _listViewController = ScrollController();
    _singleChildScrollViewController = ScrollController();
    // checkNotificationAllowed();
  }

  @override
  void dispose() {
    _listViewController.dispose();
    _singleChildScrollViewController.dispose();
    _parentController.dispose();
    super.dispose();
  }

  ScrollController _listViewController = ScrollController();
  ScrollController _singleChildScrollViewController = ScrollController();

  int indexmenuRawatans = 0;
  int indexsubmenuRawatan = 0;

  // final todoController = Get.put(TodoController());

  //
  // void nextButton() {
  //   // setState(() {
  //   c.indexw.value++;
  //   statuList[c.indexw.value].active = true;
  //   // });
  // }
  //
  // void backButton() {
  //   // setState(() {
  //   c.indexw.value--;
  //   statuList[c.indexw.value].active = true;
  //   // });
  // }

  @override
  Widget build(BuildContext context) {
    // print(dataharga.keys);

    return
        // PopScope(
        // canPop: false,
        // child: Consumer<ScheduleProvider>(
        //     builder: (context, ScheduleProvider, child) {
        //   return
        Obx(() {
      return Center(
        child: RefreshIndicator(
          onRefresh: refreshData,
          child: NotificationListener<ScrollNotification>(
            onNotification: (ScrollNotification notification) {
              // Parent scroll logic if needed
              return false;
            },
            child: SingleChildScrollView(
              controller: _parentController,
              // physics: AlwaysScrollableScrollPhysics(),
              // scrollDirection: Axis.vertical,
              child: Stack(
                alignment:
                    Alignment.center, // Menata semua children di tengah Stack
                children: <Widget>[
                  // Widget pertama (di bagian belakang) — gunakan Positioned.fill agar mengikuti tinggi scroll
                  Positioned.fill(
                    child: Container(
                      color: Colors.white,
                    ),
                  ),
                  Column(
                    children: [
                      HeadHome(),
                      SizedBox(
                        height: defaultPadding,
                      ),

                      SizedBox(
                        height: defaultPadding / 2,
                      ),

                      //       ScheduleProvider.remainderList.isEmpty
                      //           ? Padding(
                      //               padding:
                      //                   EdgeInsets.symmetric(vertical: defaultPadding),
                      //               child: Center(
                      //                   child: Text(
                      //                 "Tidak ada kegiatan !!",
                      //                 style: TextStyle(
                      //                     color: Colors.black54,
                      //                     fontSize: 18,
                      //                     fontWeight: FontWeight.bold),
                      //               )),
                      //             )
                      //           : Column(
                      //               children: [
                      //                 SizedBox(
                      //                   height: defaultPadding,
                      //                 ),
                      //                 SizedBox(
                      //                   height: defaultPadding,
                      //                 ),
                      //                 Container(
                      //                   padding: EdgeInsets.symmetric(
                      //                       horizontal: defaultPadding),
                      //                   height: 370,
                      //                   width: MediaQuery.sizeOf(context).width,
                      //                   child: Container(
                      //                     padding: EdgeInsets.symmetric(
                      //                         horizontal: defaultPadding),
                      //                     decoration: BoxDecoration(
                      //                         borderRadius:
                      //                             BorderRadius.all(Radius.circular(20)),
                      //                         boxShadow: [
                      //                           BoxShadow(
                      //                               blurRadius: 15,
                      //                               offset: Offset(0, 5),
                      //                               color: Colors.black.withOpacity(.3))
                      //                         ],
                      //                         color: warnas(dataKategoriMenuRawatan[
                      //                                 c.indexMenuRawatan.value]
                      //                             .colorku[1])),
                      //                     child: Column(
                      //                       children: [
                      //                         if (!ScheduleProvider
                      //                             .notificationIsAllowed)
                      //                           GestureDetector(
                      //                             onTap: () {
                      //                               diologbox();
                      //                               ScheduleProvider
                      //                                   .checkSessionAndNavigate();
                      //                             },
                      //                             child: Container(
                      //                               padding: const EdgeInsets.symmetric(
                      //                                   horizontal: 5, vertical: 5),
                      //                               width: MediaQuery.of(context)
                      //                                   .size
                      //                                   .width,
                      //                               decoration: BoxDecoration(
                      //                                   borderRadius:
                      //                                       BorderRadius.circular(10),
                      //                                   color: Colors.grey[200]),
                      //                               child: const Text(
                      //                                 "Notifications is Disabled Click Here to Enable Notifications",
                      //                                 textAlign: TextAlign.center,
                      //                                 style: TextStyle(
                      //                                     fontSize: 12,
                      //                                     fontWeight: FontWeight.w500),
                      //                               ),
                      //                             ),
                      //                           ),
                      //                         SizedBox(
                      //                           height: defaultPadding / 2,
                      //                         ),
                      //                         Container(
                      //                           height: 200,
                      //                           width: MediaQuery.sizeOf(context).width,
                      //                           child: Column(
                      //                             children: [
                      //                               Text(
                      //                                 "Kegiatan Selanjutnya: ",
                      //                                 style: TextStyle(
                      //                                     color: Colors.black54,
                      //                                     fontSize: 18,
                      //                                     fontWeight: FontWeight.bold),
                      //                               ),
                      //                               // Text("Upcoming Works",style: TextStyle(color: Colors.black54,fontSize: 18 , fontWeight:FontWeight.bold),),
                      //                               SizedBox(
                      //                                 height: defaultPadding / 2,
                      //                               ),
                      //                               Expanded(
                      //                                 child: ListView.builder(
                      //                                     scrollDirection:
                      //                                         Axis.vertical,
                      //                                     padding: EdgeInsets.zero,
                      //                                     itemCount: ScheduleProvider
                      //                                         .remainderList.length,
                      //                                     itemBuilder:
                      //                                         (context, index) {
                      //                                       return UpcomingWorks(
                      //                                         title: ScheduleProvider
                      //                                                 .remainderList[
                      //                                                     index]
                      //                                                 .title ??
                      //                                             "",
                      //                                         dateTime: ScheduleProvider
                      //                                                 .remainderList[
                      //                                                     index]
                      //                                                 .dateTime ??
                      //                                             1,
                      //                                         discreption:
                      //                                             ScheduleProvider
                      //                                                     .remainderList[
                      //                                                         index]
                      //                                                     .description ??
                      //                                                 "",
                      //                                       );
                      //                                     }),
                      //                               ),
                      //                             ],
                      //                           ),
                      //                         ),
                      //                         Padding(
                      //                           padding: EdgeInsets.symmetric(
                      //                               vertical: defaultPadding / 2),
                      //                           child: ProgressTracker(
                      //                             currentIndex: c.indexw.value,
                      //                             statusList: statuList,
                      //                             activeColor: Colors.green,
                      //                             // Optional: Customize the color for active steps (default: Colors.green).
                      //                             inActiveColor: Colors
                      //                                 .grey, // Optional: Customize the color for inactive steps (default: Colors.grey).
                      //                           ),
                      //                         ),
                      //                         SizedBox(height: defaultPadding / 2),
                      //                         Row(
                      //                           children: [
                      //                             ElevatedButton(
                      //                               onPressed: (){
                      //                                 // setState(() {
                      //                                 if(c.indexw.value != statuList.length + 1) {
                      //                                   setState(() {
                      //                                     c.indexw.value--;
                      //                                     statuList[c.indexw.value].active = true;
                      //                                   });
                      //                                 }else{
                      //                                   null;
                      //                                 }
                      //                                 // });
                      //                               }
                      //                               // onPressed:
                      //                               //   // setState(() {
                      //                               //     c.indexw.value != statuList.length + 1
                      //                               //         ? backButton
                      //                               //         : null
                      //                               //   // });
                      //                               ,
                      //                               child: const Text('PREV'),
                      //                             ),
                      //                             ElevatedButton(
                      //                               onPressed: (){
                      //                                 // setState(() {
                      //                                if(c.indexw.value != statuList.length - 1) {
                      //                                  setState(() {
                      //                                    c.indexw.value++;
                      //                                    statuList[c.indexw.value].active = true;
                      //                                  });
                      //                                }else{
                      //                                  null;
                      //                                }
                      //                                 // });
                      //                               }
                      //
                      //                               ,
                      //                               child: const Text('NEXT'),
                      //                             ),
                      // ElevatedButton(
                      //   onPressed: (){
                      //     int data = DateTime.now().millisecondsSinceEpoch;
                      //
                      //     navigatorKey.currentState!.pushNamed(
                      //       '/pageNotif',
                      //       arguments: data,
                      //     ).then((_) {
                      //       // Setelah pengguna kembali ke halaman ini dari halaman lain,
                      //       // akan dipanggil setState untuk memperbarui widget
                      //       setState(() {});
                      //     });
                      //   }
                      //
                      //   ,
                      //   child: const Text('notfpg'),
                      // ),
                      //
                      //                           ],
                      //                         ),
                      //                         SizedBox(height: defaultPadding / 2),
                      //
                      //                         // Container(
                      //                         //   height: 300,
                      //                         //   width: MediaQuery.sizeOf(context).width,
                      //                         //  padding: EdgeInsets.symmetric(horizontal: defaultPadding/2),
                      //                         //   child: Column(
                      //                         //     mainAxisAlignment: MainAxisAlignment.start,
                      //                         //     crossAxisAlignment: CrossAxisAlignment.start,
                      //                         //     children: [
                      //                         //
                      //                         //     ],
                      //                         //   ),
                      //                         // ),
                      //                       ],
                      //                     ),
                      //                   ),
                      //                 ),
                      //               ],
                      //             ),

                      // Container(
                      //   alignment: Alignment.bottomRight,
                      //   height: 40,
                      //   width: 40,
                      //   color: Colors.lightBlue,
                      //   child: ClipRRect(
                      //       borderRadius: BorderRadius.circular(8.0),
                      //       child: ElevatedButton(
                      //         onPressed: () async {
                      //           await ScheduleProvider.checkSessionAndNavigate();
                      //           Navigator.push(
                      //                   context,
                      //                   PageTransition(
                      //                       child: AddEvent(),
                      //                       type: PageTransitionType.rightToLeft))
                      //               .then((data) => {
                      //                     // getAllUsers()
                      //                   });
                      //         },
                      //         style: ElevatedButton.styleFrom(
                      //             padding: EdgeInsets.all(1),
                      //             shape: RoundedRectangleBorder(
                      //               borderRadius: BorderRadius.circular(20),
                      //             ),
                      //             elevation: 0,
                      //             primary: Colors.black12.withOpacity(.03)),
                      //         child: SizedBox(
                      //             child: Icon(
                      //           Icons.ac_unit_rounded,
                      //           color: Colors.white,
                      //         )
                      //
                      //             // ImgOnline(
                      //             //     "${dataKategoriMenuRawatan[c.indexMenuRawatan.value].img_produks[0]}",
                      //             //     dataKategoriMenuRawatan[c.indexMenuRawatan.value]
                      //             //         .img_produks[0]
                      //             //         .toString()),
                      //
                      //             ),
                      //       )),
                      // ),

                      (dataKategoriMenuRawatan.length <= 1)
                          ? Column(
                              children: [
                                SizedBox(
                                  height: defaultPadding,
                                ),
                                Container(),
                              ],
                            )
                          : Wrap(
                              children: [
                                for (int o = 1;
                                    o < dataKategoriMenuRawatan.length;
                                    o++)
                                  Padding(
                                    padding: EdgeInsets.all(defaultPadding / 2),
                                    child: cardMenuRawatan(
                                      index: o,
                                      getindexmenu:
                                          (int indexmenu, int indexsubmenu) {
                                        setState(() {
                                          indexmenuRawatans = indexmenu;
                                        });
                                      },
                                    ),
                                  ),
                                Padding(
                                    padding: EdgeInsets.all(defaultPadding / 2),
                                    child: InkWell(
                                      onTap:
                                          // pressCategory,
                                          () {
                                        setState(() {
                                          print("role $roles");
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => HomePageAi(
                                                initialRoles: roles,
                                                initialRoleData: roleData,
                                                initialRoleBooks: roleBooks,
                                                initialSavedPrompts:
                                                    savedPrompts,
                                              ),
                                            ),
                                          ).then((value) {});
                                          // indexsub = 0;
                                          // indexsubmenufix = 0;
                                          // widget.getindexmenu(widget.index, indexsub);
                                          // print(indexsub);
                                          // print(dataKategoriMenuRawatan[index].colorku[0]);
                                          // setState(() {
                                          //     getindexsubmenu(index);
                                          // c.indexsubMenuRawatan.value = 0;
                                          // c.indexMenuRawatan.value = widget.index;
                                          // print ("iniloh error ${c.indexMenuRawatan.value} ${filterdataByBundle(c.indexMenuRawatan.value.toString()).length}");
                                          // });
                                        });
                                      },
                                      child: FittedBox(
                                        child: Container(
                                          height: SizeConfig.screenWidth! / 3.5,
                                          width: SizeConfig.screenWidth! / 3.5,
                                          decoration: BoxDecoration(
                                              // color: Colors.amber.withOpacity(.9),
                                              borderRadius: BorderRadius.only(
                                                  bottomLeft:
                                                      Radius.circular(7),
                                                  bottomRight:
                                                      Radius.circular(7),
                                                  topLeft: Radius.circular(7),
                                                  topRight: Radius.circular(7)),
                                              border: Border.all(
                                                  width: 2,
                                                  color: Colors.green),
                                              color: Colors.green,
                                              boxShadow: [
                                                BoxShadow(
                                                    blurRadius: 15,
                                                    offset: Offset(0, 5),
                                                    color: Colors.green
                                                        .withOpacity(.3))
                                              ]),
                                          child: Stack(children: [
                                            Container(
                                              height: 50,
                                              width: 80,
                                              decoration: BoxDecoration(
                                                // color: Colors.amber.withOpacity(.9),
                                                borderRadius: BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(0),
                                                    bottomRight:
                                                        Radius.circular(50),
                                                    topLeft: Radius.circular(0),
                                                    topRight:
                                                        Radius.circular(0)),
                                                color: Colors.white12
                                                    .withOpacity(.2),
                                              ),
                                            ),
                                            Center(
                                              child: Padding(
                                                  padding: EdgeInsets.all(
                                                      defaultPadding / 4),
                                                  child: Icon(
                                                      Icons.auto_fix_high,
                                                      size: 75,
                                                      color: Colors.white)

                                                  // Image.asset(
                                                  //   dataKategoriMenuRawatan[index].img,
                                                  //   fit: BoxFit.fitHeight,
                                                  // ),
                                                  ),
                                            ),
                                          ]),
                                        ),
                                      ),
                                    )),
                              ],
                            ),
                      // SizedBox(
                      //   height: defaultPadding,
                      // ),
                      // WcalcTanaman(
                      //   h: SizeConfig.screenHeight! / 2.4,
                      //   w: SizeConfig.screenWidth!,
                      //   img: false,
                      //   onStateChange: (int indexsubmenu) {
                      //     setState(() {
                      //
                      //     });
                      //     // c.indexsubMenuRawatan.value = 0;
                      //     //   Navigator.push(
                      //     //   context,
                      //     //   MaterialPageRoute(
                      //     //     builder: (context) => DosisPupukTanamanbuah( indexsubmenu: indexsubmenu, indexmenu: 0,),
                      //     //   ),
                      //     // );
                      //     // showInterstitalAd(context,"/dosisPupukTanamanBuah");
                      //   },
                      //   indexmenu: 1, indexsubmenu: 0,
                      //   // datasubMenuRawatan: dataKategoriKomoditi,
                      // ),
                      // (c.indexMenuRawatan.value == 1)?
                      SizedBox(
                        height: defaultPadding / 2,
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: defaultPadding,
                          ),
                          SearchKomoditi(
                            parentController: _parentController,
                            onTextChanged: (String value) {},
                            datad: [],
                          ),
                        ],
                      ),
                      //     MenuHomeTanam(
                      //   indexmenus: c.indexMenuRawatan.value,
                      //   indexsubmenus: indexsubmenuRawatan,
                      // ),
                      SizedBox(
                        height: defaultPadding,
                      ),
                      SizedBox(
                        height: defaultPadding,
                      ),
                      Container(
                        child: ClipRect(
                          child: Stack(
                            children: [
                              Positioned(
                                top: 10.0,
                                right: 10.0,
                                child: Image.asset(
                                  "assets/images/MenuRawatan/logoRBack.png",
                                  height: 450,
                                  width: 450,
                                ),
                              ),
                              Container(
                                color: warnas(dataKategoriMenuRawatan[
                                            c.indexMenuRawatan.value]
                                        .colorku[0])
                                    .withOpacity(.4),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    SizedBox(
                                      height: defaultPadding / 2,
                                    ),
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: defaultPadding,
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                            color: warnas(
                                                dataKategoriMenuRawatan[c
                                                        .indexMenuRawatan.value]
                                                    .colorku[1]),
                                            borderRadius: BorderRadius.only(
                                                bottomLeft: Radius.circular(0),
                                                bottomRight:
                                                    Radius.circular(20),
                                                topLeft: Radius.circular(20),
                                                topRight: Radius.circular(0)),
                                            // border:
                                            //     Border.all(color: kTextColor.withOpacity(.8), width: .2)
                                            // boxShadow: [
                                            //   BoxShadow(
                                            //       blurRadius: 10,
                                            //       offset: Offset(-1, 3),
                                            //       color: Colors.black.withOpacity(.3))
                                            // ]
                                          ),
                                          child: Row(
                                            children: [
                                              SizedBox(
                                                width: defaultPadding / 2,
                                              ),
                                              Icon(
                                                Icons.store_mall_directory,
                                                color: kTextColor,
                                              ),
                                              SizedBox(
                                                width: defaultPadding / 2,
                                              ),
                                              FittedBox(
                                                child: Text(
                                                  "Rawatan Store",
                                                  style: TextStyle(
                                                    color: kTextColor,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: defaultPadding / 2,
                                              ),
                                              IconButton(
                                                onPressed: () {
                                                  print("ok");
                                                  _launchURL(filterdataByDiskon(
                                                          c.indexMenuRawatan
                                                              .value
                                                              .toString())[0]
                                                      .link);
                                                },
                                                style: ElevatedButton.styleFrom(
                                                  backgroundColor: kTextColor,

                                                  padding: EdgeInsets.all(1),
                                                  // shadowColor: Colors.white,

                                                  // padding: EdgeInsets.only(top: 60),
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.only(
                                                        bottomLeft:
                                                            Radius.circular(0),
                                                        bottomRight:
                                                            Radius.circular(10),
                                                        topLeft:
                                                            Radius.circular(10),
                                                        topRight: Radius.circular(
                                                            0)), // Mengatur sudut membulat
                                                  ),
                                                  elevation: 0,
                                                ),
                                                icon: Icon(Icons.arrow_forward,
                                                    color: Colors.white),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Container(
                                        child: Row(
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal:
                                                      defaultPadding / 2),
                                              child: SizedBox(
                                                width: 250,
                                                height: 200,
                                                child: Center(
                                                  child: ImgOnline(
                                                      "assets/images/MenuRawatan/RawatTanam/tikusKotak.png",
                                                      "assets/images/MenuRawatan/RawatTanam/tikusKotak.png"),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal:
                                                      defaultPadding / 2),
                                              child: SizedBox(
                                                width: 250,
                                                height: 200,
                                                child: Center(
                                                  child: ImgOnline(
                                                      "assets/images/MenuRawatan/RawatTanam/PhKotak.png",
                                                      "assets/images/MenuRawatan/RawatTanam/PhKotak.png"),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal:
                                                      defaultPadding / 2),
                                              child: SizedBox(
                                                width: 250,
                                                height: 200,
                                                child: Center(
                                                  child: ImgOnline(
                                                      "assets/images/MenuRawatan/RawatTanam/abmixKotak.png",
                                                      "assets/images/MenuRawatan/RawatTanam/abmixKotak.png"),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal:
                                                      defaultPadding / 2),
                                              child: SizedBox(
                                                width: 250,
                                                height: 200,
                                                child: Center(
                                                  child: ImgOnline(
                                                      "assets/images/MenuRawatan/RawatTanam/garamRosokKotak.png",
                                                      "assets/images/MenuRawatan/RawatTanam/garamRosokKotak.png"),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: defaultPadding * 1.5,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: defaultPadding,
                      ),

                      // cari(),
                      SizedBox(
                        child: Stack(
                          children: [
                            Positioned(
                              top: 0,
                              right: -150,
                              // bottom: 0,
                              // left: 0,
                              child: FittedBox(
                                child: Image.asset(
                                  "assets/images/MenuRawatan/logoRBack.png",
                                  height: SizeConfig.screenHeight! / 2,
                                  width: SizeConfig.screenWidth!,
                                ),
                              ),
                            ),
                            Column(
                              children: [
                                (filterdataByDiskon(c.indexMenuRawatan.value
                                                .toString())
                                            .length >=
                                        2)
                                    ? (filterdataByDiskon(c
                                                .indexMenuRawatan.value
                                                .toString())
                                            .isEmpty)
                                        ? Container()
                                        : SizedBox(
                                            height:
                                                SizeConfig.screenWidth! / 1.5,
                                            width: SizeConfig.screenWidth!,
                                            child: ListView.builder(
                                                itemBuilder:
                                                    (BuildContext context,
                                                        int index) {
                                                  return Padding(
                                                    padding: EdgeInsets.all(
                                                        defaultPadding / 2),
                                                    child: FittedBox(
                                                      child: SizedBox(
                                                        // padding: EdgeInsets.symmetric(horizontal: defaultPadding/9),
                                                        height: 170,
                                                        width: 170,
                                                        child: Stack(children: [
                                                          Center(
                                                            child:
                                                                ElevatedButton(
                                                              onPressed: () {
                                                                print("ok");
                                                                _launchURL(filterdataByDiskon(c
                                                                        .indexMenuRawatan
                                                                        .value
                                                                        .toString())[0]
                                                                    .link);
                                                              },
                                                              style:
                                                                  ElevatedButton
                                                                      .styleFrom(
                                                                backgroundColor:
                                                                    Colors
                                                                        .white,
                                                                padding:
                                                                    EdgeInsets
                                                                        .all(1),
                                                                // shadowColor: Colors.black,
                                                                // padding: EdgeInsets.only(top: 60),
                                                                shape:
                                                                    RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              20),
                                                                ),
                                                                elevation: 0,
                                                              ),
                                                              child: ClipRRect(
                                                                borderRadius: BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            defaultPadding)),
                                                                // Menggunakan anti-aliasing untuk tepi oval yang lebih halus
                                                                child: ImgOnline(
                                                                    filterdataByDiskon(c.indexMenuRawatan.value.toString())[
                                                                            index]
                                                                        .Img,
                                                                    filterdataByDiskon(c
                                                                            .indexMenuRawatan
                                                                            .value
                                                                            .toString())[index]
                                                                        .Img),
                                                              ),
                                                            ),
                                                          ),
                                                        ]),
                                                      ),
                                                    ),
                                                  );
                                                },
                                                itemCount: filterdataByDiskon(c
                                                        .indexMenuRawatan.value
                                                        .toString())
                                                    .length,
                                                scrollDirection:
                                                    Axis.horizontal),
                                          )
                                    : (filterdataByDiskon(c
                                                .indexMenuRawatan.value
                                                .toString())
                                            .isEmpty)
                                        ? Container()
                                        : Column(
                                            children: [
                                              SizedBox(
                                                height: defaultPadding,
                                              ),
                                              SizedBox(
                                                height: SizeConfig.screenWidth!,
                                                width: SizeConfig.screenWidth!,
                                                child: Padding(
                                                  padding: EdgeInsets.all(
                                                      defaultPadding),
                                                  child: FittedBox(
                                                    child: Center(
                                                      child: SizedBox(
                                                        height: SizeConfig
                                                                .screenWidth! /
                                                            1.1,
                                                        width: SizeConfig
                                                                .screenWidth! /
                                                            1.1,
                                                        // margin:EdgeInsets.all(defaultPadding),
                                                        child: ElevatedButton(
                                                          onPressed: () {
                                                            print("ok");
                                                            _launchURL(filterdataByDiskon(c
                                                                    .indexMenuRawatan
                                                                    .value
                                                                    .toString())[0]
                                                                .link);
                                                          },
                                                          style: ElevatedButton
                                                              .styleFrom(
                                                            backgroundColor:
                                                                Colors.black12
                                                                    .withOpacity(
                                                                        .1),
                                                            padding:
                                                                EdgeInsets.zero,
                                                            shadowColor:
                                                                Colors.white,
                                                            // padding: EdgeInsets.only(top: 60),
                                                            shape:
                                                                RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          20),
                                                            ),
                                                            elevation: 0,
                                                          ),
                                                          child: Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              boxShadow: [
                                                                BoxShadow(
                                                                    blurRadius:
                                                                        25,
                                                                    offset:
                                                                        Offset(
                                                                            0,
                                                                            0),
                                                                    color: warnas(dataKategoriMenuRawatan[c
                                                                            .indexMenuRawatan
                                                                            .value]
                                                                        .colorku[0]))
                                                              ],
                                                            ),
                                                            child: ClipRRect(
                                                              borderRadius: BorderRadius
                                                                  .all(Radius
                                                                      .circular(
                                                                          defaultPadding)),
                                                              // Menggunakan anti-aliasing untuk tepi oval yang lebih halus
                                                              child: ImgOnline(
                                                                  filterdataByDiskon(c
                                                                              .indexMenuRawatan
                                                                              .value
                                                                              .toString())[
                                                                          0]
                                                                      .Img,
                                                                  filterdataByDiskon(c
                                                                          .indexMenuRawatan
                                                                          .value
                                                                          .toString())[0]
                                                                      .Img),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                ("${dats.hari} : ${dats.jam} : ${dats.menit} : ${dats.detik}" ==
                                        "0 : 0 : 0 : 0")
                                    ? Container()
                                    : Column(
                                        children: [
                                          SizedBox(
                                            height: defaultPadding / 2,
                                          ),
                                          Titlesy(
                                            judul: "Berakhir dalam",
                                            more: true,
                                            links: "/dosisPupukTanamanBuah",
                                          ),
                                          SizedBox(
                                            height: defaultPadding / 2,
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                right: defaultPadding,
                                                left: defaultPadding),
                                            child: Align(
                                              alignment: Alignment.centerLeft,
                                              child: Container(
                                                padding: EdgeInsets.all(
                                                    defaultPadding / 2.5),
                                                decoration: BoxDecoration(
                                                  // color: Colors.amber.withOpacity(.9),
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  10),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  10),
                                                          topLeft:
                                                              Radius.circular(
                                                                  10),
                                                          topRight:
                                                              Radius.circular(
                                                                  10)),
                                                  color: warnas(
                                                      dataKategoriMenuRawatan[c
                                                              .indexMenuRawatan
                                                              .value]
                                                          .colorku[0]),
                                                ),
                                                child: CountDowns(
                                                  col: warnas(
                                                      dataKategoriMenuRawatan[c
                                                              .indexMenuRawatan
                                                              .value]
                                                          .colorku[1]),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),

                                SizedBox(
                                  height: defaultPadding,
                                ),

                                (c.indexMenuRawatan.value == 1 ||
                                        c.indexMenuRawatan.value == 3 ||
                                        c.indexMenuRawatan.value == 5)
                                    ? Column(
                                        children: [
                                          SizedBox(
                                            width: SizeConfig.screenWidth,
                                            child: Stack(
                                              children: [
                                                Center(
                                                  child: ElevatedButton(
                                                    onPressed: () {
                                                      // print("ok");
                                                      // _launchURL(
                                                      //     filterdataByDiskon(c.indexMenuRawatan.value.toString())[0].link);
                                                    },
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                      backgroundColor:
                                                          Colors.white,
                                                      padding:
                                                          EdgeInsets.all(1),
                                                      // shadowColor: Colors.black,
                                                      // padding: EdgeInsets.only(top: 60),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20),
                                                      ),
                                                      elevation: 0,
                                                    ),
                                                    child: ClipRRect(
                                                      // borderRadius:
                                                      // BorderRadius.all(Radius.circular(defaultPadding)),
                                                      // Menggunakan anti-aliasing untuk tepi oval yang lebih halus
                                                      child: ImgOnline(
                                                          "assets/images/MenuRawatan/RawatTanam/diagnosis.png",
                                                          "assets/images/MenuRawatan/RawatTanam/diagnosis.png"),
                                                    ),
                                                  ),
                                                ),
                                                Positioned(
                                                  left: defaultPadding / 2,
                                                  top: 1,
                                                  child: ElevatedButton(
                                                    onPressed: () {
                                                      print("ok");
                                                      Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                          builder: (context) =>
                                                              IdentifikasiPenyakitPage(),
                                                        ),
                                                      ).then((value) {});
                                                    },
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                      backgroundColor:
                                                          Colors.white,
                                                      padding:
                                                          EdgeInsets.all(1),
                                                      // shadowColor: Colors.black,
                                                      // padding: EdgeInsets.only(top: 60),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      elevation: 0,
                                                    ),
                                                    child: Padding(
                                                      padding: EdgeInsets.only(
                                                          bottom:
                                                              defaultPadding /
                                                                  2,
                                                          left: defaultPadding /
                                                              2),
                                                      child: Text(
                                                        "Cek Gejala Penyakit",
                                                        style: TextStyle(
                                                            color: kTextColor,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 20),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Positioned(
                                                  left: defaultPadding * 4.5,
                                                  bottom: defaultPadding / 2,
                                                  child: SizedBox(
                                                    width: 200,
                                                    child: Transform.scale(
                                                      scale: 0.6,
                                                      child: GlowingButton(
                                                        buttonText: 'Go..!!!',
                                                        onPressed: () {
                                                          Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                              builder: (context) =>
                                                                  IdentifikasiPenyakitPage(),
                                                            ),
                                                          ).then((value) {});
                                                        },
                                                        customLightColor:
                                                            Color(0x005B69FF),
                                                        customDarkColor:
                                                            Color(0xFF115A52),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: defaultPadding,
                                          )
                                        ],
                                      )
                                    : Container(),

                                // SizedBox(
                                //   height: defaultPadding,
                                // ),
                                (filterdataByPromo().isEmpty)
                                    ? Container(
                                        child: SizedBox(
                                          height: defaultPadding / 1.5,
                                        ),
                                      )
                                    : Align(
                                        alignment: Alignment.centerLeft,
                                        child: Row(
                                          children: [
                                            Expanded(
                                              flex: 2,
                                              child: Container(
                                                height: 120,
                                                margin: EdgeInsets.only(
                                                    left: defaultPadding,
                                                    bottom: defaultPadding,
                                                    right:
                                                        defaultPadding / 2.5),
                                                child: Stack(
                                                  children: [
                                                    Positioned(
                                                      bottom: 0,
                                                      // top: 0,
                                                      right: 0,
                                                      left: 0,
                                                      child: FittedBox(
                                                        child: Container(
                                                          height: 170,
                                                          width: 200,
                                                          // margin: EdgeInsets.only(left: defaultPadding/2,right: defaultPadding/2),
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius: BorderRadius.only(
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        10),
                                                                bottomRight:
                                                                    Radius
                                                                        .circular(
                                                                            10),
                                                                topLeft: Radius
                                                                    .circular(
                                                                        10),
                                                                topRight: Radius
                                                                    .circular(
                                                                        10)),
                                                            color: Colors
                                                                .deepOrange,
                                                          ),
                                                          child: Padding(
                                                            padding: EdgeInsets.only(
                                                                top:
                                                                    defaultPadding *
                                                                        1.5),
                                                            child: Center(
                                                                child: RichText(
                                                                    text:
                                                                        TextSpan(
                                                              text: "DISKON\n",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize: 40,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                              children: [
                                                                TextSpan(
                                                                    text:
                                                                        "Sampai",
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            30,
                                                                        fontWeight:
                                                                            FontWeight.normal)),
                                                                TextSpan(
                                                                    text: "\n",
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            8,
                                                                        fontWeight:
                                                                            FontWeight.normal)),
                                                                TextSpan(
                                                                    text: "70%",
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            40,
                                                                        fontWeight:
                                                                            FontWeight.bold))
                                                              ],
                                                            ))),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Positioned(
                                                      // bottom: 0,
                                                      top: 0,
                                                      right: 0,
                                                      left: 0,
                                                      child: Container(
                                                        height: 40,
                                                        margin: EdgeInsets.only(
                                                            left:
                                                                defaultPadding /
                                                                    2,
                                                            right:
                                                                defaultPadding /
                                                                    2),
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius: BorderRadius.only(
                                                              bottomLeft: Radius
                                                                  .circular(10),
                                                              bottomRight:
                                                                  Radius
                                                                      .circular(
                                                                          10),
                                                              topLeft: Radius
                                                                  .circular(10),
                                                              topRight: Radius
                                                                  .circular(
                                                                      10)),
                                                          color: Colors.white,
                                                        ),
                                                        child: Center(
                                                            child: Text(
                                                                "Shopee",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .deepOrange,
                                                                    fontSize:
                                                                        18,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold))),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                                flex: 4,
                                                child: (c.connection_e.isFalse)
                                                    ? FittedBox(
                                                        child: SizedBox(
                                                            // padding: EdgeInsets.symmetric(horizontal: defaultPadding/9),
                                                            height: 150,
                                                            width: 390,
                                                            child: Container(
                                                                decoration: BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.all(Radius.circular(
                                                                            20)),
                                                                    color: Colors
                                                                        .black
                                                                        .withOpacity(
                                                                            .5)))))
                                                    : Swiper(
                                                        itemBuilder:
                                                            (BuildContext
                                                                    context,
                                                                int index) {
                                                          return ClipRRect(
                                                            borderRadius:
                                                                BorderRadius.all(
                                                                    Radius.circular(
                                                                        defaultPadding)),
                                                            // Menggunakan anti-aliasing untuk tepi oval yang lebih halus
                                                            child: FittedBox(
                                                              child: SizedBox(
                                                                // padding: EdgeInsets.symmetric(horizontal: defaultPadding/9),
                                                                height: 160,
                                                                width: 390,
                                                                child:
                                                                    Container(
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.all(
                                                                            Radius.circular(20)),

                                                                    // color: Colors.black.withOpacity(.5)
                                                                  ),
                                                                  child: Stack(
                                                                      children: [
                                                                        Positioned(
                                                                            left:
                                                                                0,
                                                                            bottom:
                                                                                0,
                                                                            top:
                                                                                0,
                                                                            right:
                                                                                0,
                                                                            child: Container(
                                                                                decoration: BoxDecoration(
                                                                                    borderRadius: BorderRadius.all(Radius.circular(20)),
                                                                                    // boxShadow: [
                                                                                    //   BoxShadow(
                                                                                    //     blurRadius: 10,
                                                                                    //     offset: Offset(0, 5),
                                                                                    //     // color: Colors.black.withOpacity(.3)
                                                                                    //   )
                                                                                    // ],
                                                                                    color: warnas(dataKategoriMenuRawatan[c.indexMenuRawatan.value].colorku[0])))),
                                                                        Center(
                                                                            child:
                                                                                ClipRRect(
                                                                          borderRadius:
                                                                              BorderRadius.all(Radius.circular(defaultPadding)),
                                                                          // Menggunakan anti-aliasing untuk tepi oval yang lebih halus
                                                                          child: ImgOnline(
                                                                              "${dataKategoriMenuRawatan[c.indexMenuRawatan.value].img_banner[1]}",
                                                                              dataKategoriMenuRawatan[c.indexMenuRawatan.value].img_banner[1].toString()),
                                                                        )),
                                                                        Positioned(
                                                                          right:
                                                                              0,
                                                                          bottom:
                                                                              0,
                                                                          top:
                                                                              0,
                                                                          child: Container(
                                                                              height: heightfit(90),
                                                                              width: widthfit(110),
                                                                              // alignment: Alignment.topCenter,
                                                                              decoration: BoxDecoration(
                                                                                  color: Colors.white.withOpacity(.4),
                                                                                  borderRadius: BorderRadius.only(
                                                                                    topLeft: Radius.circular(100),
                                                                                    topRight: Radius.circular(0),
                                                                                  ))),
                                                                        ),
                                                                        Positioned(
                                                                          bottom:
                                                                              0,
                                                                          top:
                                                                              0,
                                                                          right:
                                                                              80,
                                                                          // left: 50,
                                                                          child:
                                                                              Transform(
                                                                            alignment:
                                                                                Alignment.center,
                                                                            transform:
                                                                                Matrix4.rotationZ(-.7),
                                                                            child:
                                                                                Center(
                                                                              child: ImgOnline(filterdataByPromo()[index].img, filterdataByPromo()[index].img),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Positioned(
                                                                          right:
                                                                              0,
                                                                          bottom:
                                                                              0,
                                                                          top:
                                                                              70,
                                                                          // right: 20,
                                                                          child: Container(
                                                                              height: 30,
                                                                              width: 60,
                                                                              // alignment: Alignment.topCenter,
                                                                              decoration: BoxDecoration(
                                                                                  color: Colors.deepOrange,
                                                                                  borderRadius: BorderRadius.only(
                                                                                    topLeft: Radius.circular(100),
                                                                                    topRight: Radius.circular(0),
                                                                                  )),
                                                                              child: Center(
                                                                                child: Padding(
                                                                                  padding: EdgeInsets.all(defaultPadding / 2),
                                                                                  child: Text("${filterdataByPromo()[index].diskon} %", style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                                                                                ),
                                                                              )),
                                                                        ),
                                                                      ]),
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                        itemCount:
                                                            filterdataByPromo()
                                                                .length,
                                                        itemWidth: SizeConfig
                                                            .screenWidth!,
                                                        itemHeight: 120.0,
                                                        layout:
                                                            SwiperLayout.TINDER,
                                                      )),
                                          ],
                                        ),
                                      ),
                                (filterdataByBundle(c.indexMenuRawatan.value
                                            .toString())[0]
                                        .isEmpty)
                                    ? Container()
                                    : FittedBox(
                                        child: Container(
                                          height: 410,
                                          width: 430,
                                          margin: EdgeInsets.only(
                                              left: defaultPadding,
                                              bottom: defaultPadding,
                                              right: defaultPadding / 2.5),
                                          child: Container(
                                            child: Stack(
                                              children: [
                                                Positioned(
                                                  bottom: 0,
                                                  // top: 0,
                                                  right: 0,
                                                  left: 0,
                                                  child: SizedBox(
                                                    height: 405,
                                                    width: 430,
                                                    child: Container(
                                                      // height: SizeConfig.screenHeight! / 7,
                                                      // margin: EdgeInsets.only(left: defaultPadding/2,right: defaultPadding/2),
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius.only(
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        10),
                                                                bottomRight:
                                                                    Radius
                                                                        .circular(
                                                                            10),
                                                                topLeft: Radius
                                                                    .circular(
                                                                        10),
                                                                topRight: Radius
                                                                    .circular(
                                                                        10)),
                                                        color: warnas(
                                                            dataKategoriMenuRawatan[c
                                                                    .indexMenuRawatan
                                                                    .value]
                                                                .colorku[0]),
                                                        gradient:
                                                            LinearGradient(
                                                          begin:
                                                              Alignment.topLeft,
                                                          end: Alignment
                                                              .bottomRight,
                                                          transform:
                                                              GradientRotation(
                                                                  17),
                                                          colors: <Color>[
                                                            warnas(dataKategoriMenuRawatan[c
                                                                    .indexMenuRawatan
                                                                    .value]
                                                                .colorku[2]),
                                                            warnas(dataKategoriMenuRawatan[c
                                                                    .indexMenuRawatan
                                                                    .value]
                                                                .colorku[2]),
                                                            warnas(dataKategoriMenuRawatan[c
                                                                    .indexMenuRawatan
                                                                    .value]
                                                                .colorku[0]),
                                                          ],
                                                          // Gradient from https://learnui.design/tools/gradient-generator.html
                                                          tileMode:
                                                              TileMode.mirror,
                                                        ),
                                                      ),
                                                      child: Padding(
                                                        padding: EdgeInsets.only(
                                                            top:
                                                                defaultPadding *
                                                                    2,
                                                            bottom:
                                                                defaultPadding),
                                                        child: Column(
                                                          children: [
                                                            RichText(
                                                                text: TextSpan(
                                                              text:
                                                                  "\nSPECIAL BUNDLE\n",
                                                              style: TextStyle(
                                                                  color: warnas(
                                                                          dataKategoriMenuRawatan[c.indexMenuRawatan.value].colorku[
                                                                              1])
                                                                      .withOpacity(
                                                                          .5),
                                                                  fontSize: 18,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            )),
                                                            Center(
                                                                child: Column(
                                                              children: [
                                                                Container(
                                                                  height: 280,
                                                                  width: 430,
                                                                  padding: EdgeInsets
                                                                      .symmetric(
                                                                          // vertical:
                                                                          //     defaultPadding,
                                                                          horizontal:
                                                                              defaultPadding / 2),
                                                                  child: NotificationListener<
                                                                      ScrollNotification>(
                                                                    onNotification:
                                                                        (notification) {
                                                                      if (notification
                                                                          is ScrollEndNotification) {
                                                                        if (_listViewController
                                                                            .position
                                                                            .atEdge) {
                                                                          if (_listViewController.position.pixels ==
                                                                              0) {
                                                                            // At the top of the child scroll
                                                                            // widget.parentController.jumpTo(widget.parentController.offset - 30);
                                                                            _parentController.animateTo(
                                                                              _parentController.offset - SizeConfig.screenHeight! / 4,
                                                                              duration: const Duration(milliseconds: 300),
                                                                              curve: Curves.easeInOut,
                                                                            );
                                                                          } else {
                                                                            // At the bottom of the child scroll
                                                                            // _parentController.jumpTo(_parentController.offset + 30);
                                                                            _parentController.animateTo(
                                                                              _parentController.offset + SizeConfig.screenHeight! / 4,
                                                                              duration: const Duration(milliseconds: 300),
                                                                              curve: Curves.easeInOut,
                                                                            );
                                                                          }
                                                                        }
                                                                      }
                                                                      return false;
                                                                    },
                                                                    child: ListView
                                                                        .builder(
                                                                      controller:
                                                                          _listViewController,
                                                                      padding:
                                                                          EdgeInsets
                                                                              .zero,
                                                                      itemCount: filterdataByBundle(c
                                                                              .indexMenuRawatan
                                                                              .value
                                                                              .toString())[1]
                                                                          .length,
                                                                      itemBuilder:
                                                                          (context,
                                                                              index) {
                                                                        return Padding(
                                                                          padding:
                                                                              EdgeInsets.only(top: defaultPadding / 2),
                                                                          child: Container(
                                                                              height: 130.0,
                                                                              // width: SizeConfig.screenWidth,
                                                                              decoration: BoxDecoration(
                                                                                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15), bottomRight: Radius.circular(15), topLeft: Radius.circular(15), topRight: Radius.circular(15)),
                                                                                color: warnas(filterdataByBundle(c.indexMenuRawatan.value.toString())[1][index][0].color[1]),
                                                                              ),
                                                                              child: Row(
                                                                                children: [
                                                                                  Expanded(
                                                                                    flex: 1,
                                                                                    child: Swiper(
                                                                                      itemBuilder: (BuildContext context, int indexs) {
                                                                                        return FittedBox(
                                                                                            child: SizedBox(
                                                                                          // padding: EdgeInsets.symmetric(horizontal: defaultPadding/2),
                                                                                          height: 180.0,
                                                                                          width: 130,
                                                                                          child: Stack(
                                                                                            children: [
                                                                                              ProductListCard(
                                                                                                index: filterdataByBundle(c.indexMenuRawatan.value.toString())[1][index][indexs].id,
                                                                                                data: filterdataByBundle(c.indexMenuRawatan.value.toString())[1][index][indexs],
                                                                                                press: () {
                                                                                                  DataProducts data = filterdataByBundle(c.indexMenuRawatan.value.toString())[1][index][indexs];
                                                                                                  c.produkku.value = data;
                                                                                                },
                                                                                                key: Key("s"),
                                                                                                todetail: true,
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ));
                                                                                      },
                                                                                      itemCount: filterdataByBundle(c.indexMenuRawatan.value.toString())[1][index].length,
                                                                                      itemWidth: SizeConfig.screenWidth!,
                                                                                      itemHeight: 120.0,
                                                                                      layout: SwiperLayout.TINDER,
                                                                                    ),
                                                                                  ),
                                                                                  Expanded(
                                                                                      flex: 3,
                                                                                      child: Container(
                                                                                        margin: EdgeInsets.all(defaultPadding / 2),
                                                                                        decoration: BoxDecoration(
                                                                                          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10), topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                                                                                          color: warnas(dataKategoriMenuRawatan[c.indexMenuRawatan.value].colorku[0]),
                                                                                        ),
                                                                                        child: ElevatedButton(
                                                                                          onPressed: () {
                                                                                            c.produkku.value = filterdataByBundle(c.indexMenuRawatan.value.toString())[1][index][0];
                                                                                            // filterdataByBundle(c.indexMenuRawatan.value)[1][index][indexs];

                                                                                            Navigator.push(
                                                                                              context,
                                                                                              MaterialPageRoute(
                                                                                                builder: (context) => BodyDetails(),
                                                                                              ),
                                                                                            ).then((value) {});
                                                                                          },
                                                                                          style: ElevatedButton.styleFrom(
                                                                                            backgroundColor: warnas(dataKategoriMenuRawatan[c.indexMenuRawatan.value].colorku[0]),
                                                                                            padding: EdgeInsets.all(1),
                                                                                            shadowColor: Colors.black,
                                                                                            // padding: EdgeInsets.only(top: 60),
                                                                                            shape: RoundedRectangleBorder(
                                                                                              borderRadius: BorderRadius.circular(20),
                                                                                            ),
                                                                                            elevation: 0,
                                                                                          ),
                                                                                          child: Padding(
                                                                                            padding: EdgeInsets.all(defaultPadding / 2),
                                                                                            child: Column(
                                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                                              crossAxisAlignment: CrossAxisAlignment.center,
                                                                                              children: [
                                                                                                AutoSizeText(
                                                                                                  "Dapatkan Item Sepaket",
                                                                                                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontStyle: FontStyle.italic, fontSize: 24),
                                                                                                  minFontSize: 10,
                                                                                                  maxLines: 1,
                                                                                                  overflow: TextOverflow.ellipsis,
                                                                                                ),
                                                                                                SizedBox(
                                                                                                  height: defaultPadding,
                                                                                                ),
                                                                                                SingleChildScrollView(
                                                                                                  scrollDirection: Axis.horizontal,
                                                                                                  child: Row(
                                                                                                    children: List.generate(filterdataByBundle(c.indexMenuRawatan.value.toString())[1][index].length, (indexs) {
                                                                                                      return Text("- ${filterdataByBundle(c.indexMenuRawatan.value.toString())[1][index][indexs].nama}", style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.normal));
                                                                                                    }),
                                                                                                  ),
                                                                                                )
                                                                                              ],
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      )),
                                                                                ],
                                                                              )),
                                                                        );
                                                                      },
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            )),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Positioned(
                                                  // bottom: 0,
                                                  top: 0,
                                                  right: 0,
                                                  left: 0,
                                                  child: Container(
                                                      height: 40,
                                                      margin: EdgeInsets.only(
                                                          left: defaultPadding /
                                                              2,
                                                          right:
                                                              defaultPadding /
                                                                  2),
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius.only(
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        10),
                                                                bottomRight:
                                                                    Radius
                                                                        .circular(
                                                                            10),
                                                                topLeft: Radius
                                                                    .circular(
                                                                        10),
                                                                topRight: Radius
                                                                    .circular(
                                                                        10)),
                                                        color: Colors.white,
                                                      ),
                                                      child: Center(
                                                        child: ShaderMask(
                                                            shaderCallback:
                                                                (Rect bounds) {
                                                              return LinearGradient(
                                                                begin: Alignment
                                                                    .topLeft,
                                                                end: Alignment
                                                                    .bottomRight,
                                                                transform:
                                                                    GradientRotation(
                                                                        17),
                                                                colors: <Color>[
                                                                  warnas(dataKategoriMenuRawatan[c
                                                                          .indexMenuRawatan
                                                                          .value]
                                                                      .colorku[2]),
                                                                  warnas(dataKategoriMenuRawatan[c
                                                                              .indexMenuRawatan
                                                                              .value]
                                                                          .colorku[2])
                                                                      .withBlue(1),
                                                                  warnas(dataKategoriMenuRawatan[c
                                                                          .indexMenuRawatan
                                                                          .value]
                                                                      .colorku[0]),
                                                                ],
                                                                // Gradient from https://learnui.design/tools/gradient-generator.html
                                                                tileMode:
                                                                    TileMode
                                                                        .mirror,
                                                              ).createShader(
                                                                  bounds);
                                                            },
                                                            child: Text(
                                                                "PROMO EXSLUSIF",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        20,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w900))),
                                                      )),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),

                                (c.indexMenuRawatan.value == 1)
                                    ? Column(
                                        children: [
                                          SizedBox(
                                            height: heightfit(defaultPadding),
                                          ),
                                          Titlesy(
                                            judul: "Tanam metode Hidroponik",
                                            more: true,
                                            links: "",
                                          ),
                                          Padding(
                                            padding: EdgeInsets.all(
                                                defaultPadding / 2),
                                            child: ElevatedButton(
                                              onPressed: () {
                                                setState(() {
                                                  SchedulerBinding.instance
                                                      .addPostFrameCallback(
                                                          (_) {
                                                    Navigator.push(context,
                                                        MaterialPageRoute(
                                                            builder: (context) {
                                                      return MyHomePage();
                                                    }));

                                                    (c.indexMenuRawatan.value ==
                                                            1)
                                                        ? showDialog(
                                                            context: context,
                                                            barrierDismissible:
                                                                false,
                                                            builder:
                                                                (BuildContext
                                                                    context) {
                                                              return AlertDialog(
                                                                title: Center(
                                                                    child: Text(
                                                                  'Pengaplikasian',
                                                                  style: TextStyle(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontSize:
                                                                          30),
                                                                )),
                                                                content: Text(
                                                                  "Perhitungan ini menggunakan Perbandingan yang sudah ditetapkan dari perusahaan per hektar atau per pohon, jadi dengan menggunakan ini kalian harus tetap memperhatikan dosis yang sesuai dengan keperluan tani kalian.",
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .black38),
                                                                ),
                                                                actions: <Widget>[
                                                                  ElevatedButton(
                                                                    onPressed:
                                                                        () {
                                                                      Navigator.of(
                                                                              context)
                                                                          .pop();
                                                                    },
                                                                    style: ElevatedButton.styleFrom(
                                                                        padding: EdgeInsets.all(1),
                                                                        shape: RoundedRectangleBorder(
                                                                          borderRadius:
                                                                              BorderRadius.circular(10),
                                                                        ),
                                                                        elevation: 0,
                                                                        backgroundColor: Colors.orange),
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsets.all(heightfit(
                                                                          defaultPadding /
                                                                              2)),
                                                                      child:
                                                                          Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        children: [
                                                                          Icon(
                                                                            Icons.check_circle,
                                                                            size:
                                                                                15,
                                                                            color:
                                                                                Colors.white,
                                                                          ),
                                                                          Text(
                                                                              "OK",
                                                                              style: TextStyle(color: Colors.black))
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              );
                                                            })
                                                        : Container();
                                                  });
                                                });
                                              },
                                              // onStateChange(),

                                              // _showInterstitalAd,

                                              style: ElevatedButton.styleFrom(
                                                padding:
                                                    const EdgeInsets.all(1),
                                                shadowColor: warnas(
                                                        dataKategoriMenuRawatan[
                                                                1]
                                                            .colorku[1])
                                                    .withOpacity(.3),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                ),
                                                elevation: 0,
                                                backgroundColor: Colors.white,
                                              ),
                                              child: Container(
                                                height: 80,
                                                alignment: Alignment.center,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      const BorderRadius.only(
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  20),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  20),
                                                          topLeft:
                                                              Radius.circular(
                                                                  20),
                                                          topRight:
                                                              Radius.circular(
                                                                  20)),
                                                  color: warnas(
                                                      dataKategoriMenuRawatan[1]
                                                          .colorku[0]),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsets.all(
                                                      defaultPadding),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    children: [
                                                      Container(
                                                        // height: 80,
                                                        // width: 200,
                                                        child: Image.asset(
                                                          "assets/images/hydroponic.png",
                                                          fit: BoxFit.fitHeight,
                                                        ),
                                                      ),
                                                      AutoSizeText(
                                                        "Tabel Ketetapan \npH PPM Hidroponik",
                                                        // ${datakategorisubMenuRawatan.where((element) => element.id_MenuRawatan == widget.indexmenu.toString()).toList()[indexsubmenus].namaKomoditi
                                                        textAlign:
                                                            TextAlign.center,
                                                        maxLines: 4,
                                                        minFontSize: 8,
                                                        style: TextStyle(
                                                            fontSize: 20,
                                                            color: warnas(
                                                                dataKategoriMenuRawatan[
                                                                            1]
                                                                        .colorku[
                                                                    1]),
                                                            fontWeight:
                                                                FontWeight
                                                                    .w800),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      )
                                    : Container(),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: defaultPadding,
                      ),
                      // // widgetHargaPangan(hargaAkhir, hargaAwal, persent),

                      // Stack(
                      //   children: [
                      //     Container(
                      //         alignment: Alignment.bottomCenter,
                      //         height: defaultPadding*5,
                      //         width: double.infinity,
                      //         decoration: BoxDecoration(shape: BoxShape.rectangle,
                      //             color: Colors.green,
                      //             borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30)),
                      //             boxShadow: [
                      //               BoxShadow(color: Colors.black12.withOpacity(0.4),offset: Offset(0,10),
                      //                   blurRadius: 10
                      //               )])
                      //     ),
                      //     SizedBox(
                      //       child: Center(
                      //         child: Column(
                      //           children: [
                      //             SizedBox(
                      //               height: defaultPadding * 1,
                      //             ),
                      //             Text("Product By : rawatan",style: TextStyle(color:Colors.white,fontWeight: FontWeight.w800),),
                      //             Text("#Love_Petani",style: TextStyle(color:Colors.white,fontWeight: FontWeight.w400),),
                      //           ],
                      //         ),
                      //       ),
                      //     ),
                      //
                      //
                      //   ],
                      // ),
                      //
                      // SizedBox(
                      //   height: heightfit(defaultPadding * 3),
                      // ),
                      Stack(
                        children: [
                          SizedBox(
                            height: SizeConfig.screenHeight! / 3,
                            width: SizeConfig.screenWidth,
                            child: ClipRect(
                              child: Stack(
                                children: [
                                  Positioned(
                                    top: 10.0,
                                    right: 10.0,
                                    child: Image.asset(
                                      "assets/images/MenuRawatan/logoRBack.png",
                                      height: 450,
                                      width: 450,
                                    ),
                                  ),
                                  Positioned(
                                    top: 70.0,
                                    bottom: 0,
                                    right: 0.0,
                                    left: 0,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(0),
                                            bottomRight: Radius.circular(0),
                                            topLeft: Radius.circular(90),
                                            topRight: Radius.circular(90)),
                                        color: warnas(dataKategoriMenuRawatan[
                                                    c.indexMenuRawatan.value]
                                                .colorku[0])
                                            .withOpacity(.4),
                                      ),
                                      alignment: Alignment.topRight,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            height: defaultPadding / 2,
                                          ),
                                          Row(
                                            children: [
                                              SizedBox(
                                                width: defaultPadding,
                                              ),
                                              Container(
                                                decoration: BoxDecoration(
                                                  color: warnas(
                                                      dataKategoriMenuRawatan[c
                                                              .indexMenuRawatan
                                                              .value]
                                                          .colorku[1]),
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          bottomLeft: Radius
                                                              .circular(0),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  20),
                                                          topLeft:
                                                              Radius.circular(
                                                                  20),
                                                          topRight:
                                                              Radius.circular(
                                                                  0)),
                                                  // border:
                                                  //     Border.all(color: kTextColor.withOpacity(.8), width: .2)
                                                  // boxShadow: [
                                                  //   BoxShadow(
                                                  //       blurRadius: 10,
                                                  //       offset: Offset(-1, 3),
                                                  //       color: Colors.black.withOpacity(.3))
                                                  // ]
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsets.all(
                                                      defaultPadding / 2),
                                                  child: Row(
                                                    children: [
                                                      SizedBox(
                                                        width:
                                                            defaultPadding / 2,
                                                      ),
                                                      Icon(Icons
                                                          .store_mall_directory),
                                                      SizedBox(
                                                        width:
                                                            defaultPadding / 2,
                                                      ),
                                                      Text(
                                                        "RawatanStore",
                                                        style: TextStyle(
                                                            color: kTextColor,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 20),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              IconButton(
                                                onPressed: () {
                                                  print("ok");
                                                  _launchURL(filterdataByDiskon(
                                                          c.indexMenuRawatan
                                                              .value
                                                              .toString())[0]
                                                      .link);
                                                },
                                                style: ElevatedButton.styleFrom(
                                                  backgroundColor: warnas(
                                                      dataKategoriMenuRawatan[c
                                                              .indexMenuRawatan
                                                              .value]
                                                          .colorku[1]),

                                                  padding: EdgeInsets.all(1),
                                                  shadowColor: Colors.black,
                                                  // padding: EdgeInsets.only(top: 60),
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.only(
                                                        bottomLeft:
                                                            Radius.circular(0),
                                                        bottomRight:
                                                            Radius.circular(10),
                                                        topLeft:
                                                            Radius.circular(10),
                                                        topRight: Radius.circular(
                                                            0)), // Mengatur sudut membulat
                                                  ),
                                                  elevation: 0,
                                                ),
                                                icon: Icon(Icons.arrow_forward),
                                              ),
                                            ],
                                          ),
                                          // SingleChildScrollView(
                                          //   scrollDirection: Axis.horizontal,
                                          //   child: Container(
                                          //     child: Row(
                                          //       children: [
                                          //         Padding(
                                          //           padding: EdgeInsets.symmetric(horizontal  : defaultPadding/2),
                                          //           child: Container(
                                          //             width: 250,
                                          //             height: 200,
                                          //             child:Center(
                                          //               child:
                                          //               ImgOnline(
                                          //                   "assets/images/MenuRawatan/RawatTanam/tikusKotak.png",
                                          //                   "assets/images/MenuRawatan/RawatTanam/tikusKotak.png"),
                                          //             ),
                                          //           ),
                                          //         ),
                                          //         Padding(
                                          //           padding: EdgeInsets.symmetric(horizontal  : defaultPadding/2),
                                          //           child: Container(
                                          //             width: 250,
                                          //             height: 200,
                                          //             child:Center(
                                          //               child: ImgOnline(
                                          //                   "assets/images/MenuRawatan/RawatTanam/PhKotak.png",
                                          //                   "assets/images/MenuRawatan/RawatTanam/PhKotak.png"),
                                          //             ),
                                          //           ),
                                          //         ),
                                          //         Padding(
                                          //           padding: EdgeInsets.symmetric(horizontal  : defaultPadding/2),
                                          //           child: Container(
                                          //             width: 250,
                                          //             height: 200,
                                          //             child:Center(
                                          //               child: ImgOnline(
                                          //                   "assets/images/MenuRawatan/RawatTanam/abmixKotak.png",
                                          //                   "assets/images/MenuRawatan/RawatTanam/abmixKotak.png"),
                                          //             ),
                                          //           ),
                                          //         ),
                                          //         Padding(
                                          //           padding: EdgeInsets.symmetric(horizontal  : defaultPadding/2),
                                          //           child: Container(
                                          //             width: 250,
                                          //             height: 200,
                                          //             child:Center(
                                          //               child: ImgOnline(
                                          //                   "assets/images/MenuRawatan/RawatTanam/garamRosokKotak.png",
                                          //                   "assets/images/MenuRawatan/RawatTanam/garamRosokKotak.png"),
                                          //             ),
                                          //           ),
                                          //         ),
                                          //
                                          //       ],
                                          //     ),
                                          //   ),
                                          // ),
                                          // SizedBox(
                                          //   height: defaultPadding*1.5,
                                          // ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Column(
                            children: [
                              CardFitursButtons(),
                              // SizedBox(
                              //   height: defaultPadding ,
                              // ),
                              // (c.indexMenuRawatan.value == 2 )?
                              // Container()
                              //     :
                              // Padding(
                              //   padding: EdgeInsets.only(left:defaultPadding/2,right:defaultPadding/2,top:defaultPadding,bottom:defaultPadding/2),
                              //   child: Obx(() {
                              //     var createdTodos = todoController.createdAllTodos();
                              //     var completedTodos = todoController.completedAllTodos();
                              //     var precent = (completedTodos / createdTodos * 100).toStringAsFixed(0);
                              //
                              //     return Container(
                              //       decoration: BoxDecoration(
                              //           color: warnas(dataKategoriMenuRawatan[c.indexMenuRawatan.value].colorku[0]),
                              //           borderRadius: BorderRadius.circular(sPrimaryBorderRadius),
                              //           boxShadow: [
                              //             BoxShadow(
                              //               offset: Offset(-6, 7),
                              //               blurRadius: 25,
                              //               color: Colors.black45.withOpacity(.2),
                              //             )
                              //           ]),
                              //       child: Statistics(
                              //         createdTodos: createdTodos,
                              //         completedTodos: completedTodos,
                              //         precent: precent,
                              //       ),
                              //     );
                              //   }
                              //   ),
                              //   // HomePages(),
                              // ),
                            ],
                          ),
                          // SizedBox(
                          //   height: defaultPadding  *2,
                          // ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
    //   }),
    // );
  }

// Container widgetHargaPangan(int hargaAkhir, int hargaAwal, double persent) {
//   return Container(
//       child: StreamBuilder<ConnectivityResult>(
//           stream: Connectivity().onConnectivityChanged,
//           builder: (_, snapshot) => (snapshot.hasData)
//               ? Container(
//                   height: heightfit(210),
//                   width: SizeConfig.screenWidth,
//                   child: snapshot.data == ConnectivityResult.wifi ||
//                           snapshot.data == ConnectivityResult.mobile
//                       ? errors != true
//                           ? datakosong == false
//                               ? Container(
//                                   height: 540,
//                                   width: 400,
//                                   child: Text("Connection Error",
//                                       style: TextStyle(color: Colors.blue)))
//                               : Center(child: CircularProgressIndicator())
//                           : ListView.builder(
//                               scrollDirection: Axis.horizontal,
//                               // physics: NeverScrollableScrollPhysics(),
//                               shrinkWrap: true,
//                               padding: EdgeInsets.zero,
//                               itemCount: 5,
//                               itemBuilder: (context, index) {
//                                 persent = (List.from(dataharga.values)[index]
//                                             [1] -
//                                         List.from(dataharga.values)[index]
//                                             [0]) /
//                                     List.from(dataharga.values)[index][1] *
//                                     100 /
//                                     100;
//
//                                 int indexa = 0;
//                                 List imgs = [
//                                   ["padi.png", "Beras"],
//                                   ["bawang.png", "Bawang Merah"],
//                                   ["bawangputih.png", "Bawang Putih"],
//                                   ["lombok.png", "Cabai Rawit"],
//                                   ["lombok.png", "Cabai Merah"]
//                                 ];
//                                 imgs.asMap().forEach((ind, value) {
//                                   if (List.from(dataharga.keys)[index] ==
//                                       value[1]) {
//                                     indexa = ind;
//                                   }
//                                 });
//                                 return Cardnew1(
//                                     tema: (hargaAkhir - hargaAwal) > 0
//                                         ? Colors.green
//                                         : Colors.red,
//                                     img:
//                                         "assets/images/komoditi/${imgs[indexa][0]}",
//                                     judul:
//                                         "${List.from(dataharga.keys)[index]} /Kg",
//                                     daerah: "${lokasi}",
//                                     persent: persent,
//                                     hargaAwal:
//                                         List.from(dataharga.values)[index][0],
//                                     hargaAkhir:
//                                         List.from(dataharga.values)[index][1],
//                                     tanggalAwal: "${formattedDateAwal}",
//                                     tanggalAkhir: "${formattedDateAkhir}", subJudul: '', jenisPasar: '',);
//                                 // }
//                               })
//                       : Container(
//                           height: 540,
//                           width: 400,
//                           child: Text("Connection Error",
//                               style: TextStyle(color: Colors.blue))))
//               : Center(
//                   // child: CircularProgressIndicator(
//                   // color: Colors.brown,)
//                   child: snapshot.data == ConnectivityResult.wifi ||
//                           snapshot.data == ConnectivityResult.mobile
//                       ? errors != true
//                           ? datakosong == false
//                               ? Container(
//                                   height: 540,
//                                   width: 400,
//                                   child: Text("Connection Error",
//                                       style: TextStyle(color: Colors.blue)))
//                               : Center(child: CircularProgressIndicator())
//                           : ListView.builder(
//                               scrollDirection: Axis.horizontal,
//                               // physics: NeverScrollableScrollPhysics(),
//                               shrinkWrap: true,
//                               padding: EdgeInsets.zero,
//                               itemCount: 5,
//                               itemBuilder: (context, index) {
//                                 persent = (List.from(dataharga.values)[index]
//                                             [1] -
//                                         List.from(dataharga.values)[index]
//                                             [0]) /
//                                     List.from(dataharga.values)[index][1] *
//                                     100 /
//                                     100;
//
//                                 int indexa = 0;
//                                 List imgs = [
//                                   ["padi.png", "Beras"],
//                                   ["bawang.png", "Bawang Merah"],
//                                   ["bawangputih.png", "Bawang Putih"],
//                                   ["lombok.png", "Cabai Rawit"],
//                                   ["lombok.png", "Cabai Merah"]
//                                 ];
//                                 imgs.asMap().forEach((ind, value) {
//                                   if (List.from(dataharga.keys)[index] ==
//                                       value[1]) {
//                                     indexa = ind;
//                                   }
//                                 });
//                                 return Cardnew1(
//                                     tema: (hargaAkhir - hargaAwal) > 0
//                                         ? Colors.green
//                                         : Colors.red,
//                                     img:
//                                         "assets/images/komoditi/${imgs[indexa][0]}",
//                                     judul:
//                                         "${List.from(dataharga.keys)[index]} /Kg",
//                                     daerah: "${lokasi}",
//                                     persent: persent,
//                                     hargaAwal:
//                                         List.from(dataharga.values)[index][0],
//                                     hargaAkhir:
//                                         List.from(dataharga.values)[index][1],
//                                     tanggalAwal: "${formattedDateAwal}",
//                                     tanggalAkhir: "${formattedDateAkhir}", subJudul: '', jenisPasar: '',);
//                                 // }
//                               })
//                       : Container(
//                           height: 540,
//                           width: 400,
//                           child: Text("Connection Error",
//                               style: TextStyle(color: Colors.blue))))));
// }
}

class cari extends StatefulWidget {
  const cari({
    super.key,
  });

  @override
  State<cari> createState() => _cariState();
}

class _cariState extends State<cari> {
  TextEditingController editingController = TextEditingController();

  final duplicateItems = List<String>.generate(10000, (i) => "Item $i");

  var items = <String>[];

  @override
  void initState() {
    // TODO: implement initState
    items = duplicateItems;
    super.initState();
  }

  void filterSearchResults(String query) {
    setState(() {
      items = duplicateItems
          .where((item) => item.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                onChanged: (value) {
                  filterSearchResults(value);
                },
                controller: editingController,
                decoration: InputDecoration(
                    labelText: "Search",
                    hintText: "Search",
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25.0)))),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 200,
          width: 200,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: items.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(items[index]),
              );
            },
          ),
        ),
      ],
    );
  }
}

class HeadHome extends StatefulWidget {
  const HeadHome({
    super.key,
  });

  @override
  State<HeadHome> createState() => _HeadHomeState();
}

class _HeadHomeState extends State<HeadHome> {
  @override
  Widget build(BuildContext context) {
    // print(
    //     "coba ${dataKategoriMenuRawatan[c.indexMenuRawatan.value].img_produks[0]}");
    return Obx(() {
      return Stack(children: [
        SizedBox(height: heightfit(310), child: BackgraundHome()),
        Padding(
          padding: EdgeInsets.only(top: heightfit(120)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: heightfit(45),
                child: FittedBox(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: defaultPadding),
                    child: RichText(
                        text: TextSpan(
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                            children: [
                          TextSpan(
                              text:
                                  "${dataKategoriMenuRawatan[c.indexMenuRawatan.value].tagline1}\n",
                              style: TextStyle(fontSize: 26)),
                          TextSpan(
                              text: dataKategoriMenuRawatan[
                                      c.indexMenuRawatan.value]
                                  .tagline2,
                              style: TextStyle(fontSize: 12))
                        ])),
                  ),
                ),
              ),

              SizedBox(
                height: defaultPadding,
              ),

              SizedBox(
                height: defaultPadding / 2,
              ),
              // banner atassss ==================================================
              FittedBox(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: defaultPadding),
                  height: 160,
                  width: 430,
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 10,
                            offset: Offset(0, 5),
                            // color: Colors.black.withOpacity(.3)
                          )
                        ],
                        color: (c.indexMenuRawatan.value == 0)
                            ? Colors.black.withOpacity(.5)
                            : Colors.white10.withOpacity(.3)),
                    child: Center(
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: ElevatedButton(
                            onPressed: () {
                              print(
                                  "link${filterdataByDiskon(c.indexMenuRawatan.value.toString())[0].link}");
                              _launchURL(filterdataByDiskon(
                                      c.indexMenuRawatan.value.toString())[0]
                                  .link);
                            },
                            style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.all(1),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                elevation: 0,
                                backgroundColor:
                                    Colors.black12.withOpacity(.03)),
                            child: SizedBox(
                              child: ImgOnline(
                                  "${dataKategoriMenuRawatan[c.indexMenuRawatan.value].img_produks[0]}",
                                  dataKategoriMenuRawatan[
                                          c.indexMenuRawatan.value]
                                      .img_produks[0]
                                      .toString()),
                            ),
                          )),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        // Positioned(
        //   top: heightfit(350 / 5.7),
        //   right: defaultPadding * 2,
        //   child: FittedBox(
        //     child: Image.asset(
        //       "assets/images/maskot/char_sapa_duduk.png",
        //       height: 130,
        //       width: 90,
        //     ),
        //   ),
        // ),
      ]);
    });
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    super.key,
    // For selecting those three line once press "Command+D"
    required this.title,
    required this.svgSrc,
    required this.press,
  });

  final String title, svgSrc;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      horizontalTitleGap: 0.0,
      leading: Icon(
        Icons.ac_unit,
        color: warnas(
            dataKategoriMenuRawatan[c.indexMenuRawatan.value].colorku[1]),
      ),
      // SvgPicture.asset(
      //   svgSrc,
      //   color: Colors.white54,
      //   height: 16,
      // ),
      selectedTileColor:
          warnas(dataKategoriMenuRawatan[c.indexMenuRawatan.value].colorku[1]),
      title: Text(
        title,
        style: TextStyle(
            color: warnas(
                dataKategoriMenuRawatan[c.indexMenuRawatan.value].colorku[1])),
      ),
    );
  }
}
