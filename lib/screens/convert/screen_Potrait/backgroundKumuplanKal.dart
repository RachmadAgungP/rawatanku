import 'package:rawatt/components/card_field.dart';
import 'package:rawatt/components/card_judulPetro.dart';
import 'package:rawatt/components/tabCostume.dart';
import 'package:rawatt/components/tema_Page.dart';
import 'package:rawatt/constants.dart';
import 'package:rawatt/model/jenisMesin/mdl_JenisMesin.dart';
import 'package:rawatt/screens/convert/component/PropertyKalkulator.dart';
import 'package:rawatt/screens/convert/component/component.dart';
import 'package:rawatt/screens/convert/screen_Lanscape/backgrounds.dart';
import 'package:rawatt/screens/home/home_screen.dart';
import 'package:rawatt/size_config.dart';
import 'package:flutter/material.dart';

import '../../home/screen_Portrait/layer2_home.dart';
import '../component/inisialisasi_var.dart';

import 'dart:convert';

// import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:rawatt/components/tema_Page.dart';
import 'package:rawatt/model/data_hargaPangan.dart';
import 'package:rawatt/screens/convert/screen_Lanscape/backgrounds.dart';

import 'package:rawatt/screens/convert/screen_Potrait/backgrounds.dart';
import 'package:rawatt/screens/profile/maknaLogo.dart';

import 'package:rawatt/size_config.dart';
import 'package:flutter/material.dart';

import '../screens/dosis_pupuk_tanaman/dosis_pupuk_tanaman.dart';

class BodyKalkulatorall extends StatefulWidget {
  const BodyKalkulatorall({
    super.key,
  });

  @override
  _BodyKalkulatorallState createState() => _BodyKalkulatorallState();
}

class _BodyKalkulatorallState extends State<BodyKalkulatorall> {
  // BannerAd _banner2;
  // BannerAd _banner1;
  @override
  void initState() {
    super.initState();

    // _createBAnnerAd();
    // _createBAnnerAd2();
  }

  // void _createBAnnerAd() {
  //   _banner2 =BannerAd(size: AdSize.fullBanner, adUnitId: AdMobService.bannerAdUnitId, listener: AdMobService.bannerListener, request: const AdRequest(),)..load();
  //
  // }
  // void _createBAnnerAd2() {
  //   _banner1 =BannerAd(size: AdSize.fullBanner, adUnitId: AdMobService.bannerAdUnitId, listener: AdMobService.bannerListener, request: const AdRequest(),)..load();
  // }
  int indexSubMenu = 0;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      extendBodyBehindAppBar: (SizeConfig.screenWidth! > 600) ? false : true,
      appBar:
          (SizeConfig.screenWidth! > 600) ? appBarLanscape() : appBarPotrait(),
      body:
// ====================== rotate ============= Lancape
          LayoutBuilder(builder: (context, constraints) {
        if (constraints.maxWidth > 600) {
          return Stack(
            children: [
              WideLayoutProduct(),
              // WideAdsBanner(banner: _banner2)
            ],
          );
        } else {
          return Stack(
            children: [
              NarrowLayouts(),
              // NarrowAdsBanner(banner: _banner1)
            ],
          );
        }
      }),
      //   NarrowLayout()
    );
  }
}

class NarrowLayouts extends StatefulWidget {
  const NarrowLayouts({
    super.key,
  });

  @override
  _NarrowLayoutsState createState() => _NarrowLayoutsState();
}

class _NarrowLayoutsState extends State<NarrowLayouts> {
  final int _selectedItem = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.white,
      child: BackgraundPotrait(
        judul: "Menu Kalkulator",
        penjelas: "Rawatan",
        widgets: Padding(
          padding: EdgeInsets.only(
              left: widthfit(defaultPadding),
              right: widthfit(defaultPadding),
              top: heightfit(defaultPadding / 2),
              bottom: heightfit(defaultPadding)),
          child: SingleChildScrollView(
            child: Column(children: [
              CardListProduct(),
              SizedBox(
                height: defaultPadding,
              ),
              // Titles(
              //   titles: "Kalkulator Pemupukan Pupuk Petrokimia",
              // ),
              WcalcTanaman(
                h: SizeConfig.screenHeight! / 2.4,
                w: SizeConfig.screenWidth!,
                img: false,
                onStateChange: (int indexsubmenu) {
                  setState(() {});
                  // c.indexsubMenuRawatan.value = 0;
                  //   Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => DosisPupukTanamanbuah( indexsubmenu: indexsubmenu, indexmenu: 0,),
                  //   ),
                  // );
                  // showInterstitalAd(context,"/dosisPupukTanamanBuah");
                },
                indexmenu: 0, indexsubmenu: 0,
                // datasubMenuRawatan: dataKategoriKomoditi,
              ),
              WcalcTanaman(
                h: SizeConfig.screenHeight! / 2.4,
                w: SizeConfig.screenWidth!,
                img: false,
                onStateChange: (int indexsubmenu) {
                  setState(() {});
                  //   // c.indexsubMenuRawatan.value = 0;
                  //   // Navigator.push(
                  //   //   context,
                  //   //   MaterialPageRoute(
                  //   //     builder: (context) => DosisPupukTanamanbuah( indexsubmenu: indexsubmenu, indexmenu: 0,),
                  //   //   ),
                  //   // );
                  //   // showInterstitalAd(context,"/dosisPupukTanamanBuah");
                },
                indexmenu: 1, indexsubmenu: 0,
                // datasubMenuRawatan: dataKategoriKomoditi,
              ),
              WcalcTanaman(
                h: SizeConfig.screenHeight! / 2.4,
                w: SizeConfig.screenWidth!,
                img: false,
                onStateChange: (int indexsubmenu) {
                  setState(() {});
                  // c.indexsubMenuRawatan.value = 0;
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => DosisPupukTanamanbuah( indexsubmenu: indexsubmenu, indexmenu: 0,),
                  //   ),
                  // );
                  // showInterstitalAd(context,"/dosisPupukTanamanBuah");
                },
                indexmenu: 2, indexsubmenu: 0,
                // datasubMenuRawatan: dataKategoriKomoditi,
              ),
            ]),
          ),
        ),
        tema: Colors.green,
      ),
    );
  }
}
