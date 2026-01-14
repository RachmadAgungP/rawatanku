import 'dart:convert';

// import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:rawatt/components/tema_Page.dart';
import 'package:rawatt/model/data_hargaPangan.dart';
import 'package:rawatt/screens/convert/screen_Lanscape/backgrounds.dart';

import 'package:rawatt/screens/convert/screen_Potrait/backgrounds.dart';
import 'package:rawatt/screens/profile/maknaLogo.dart';

import 'package:rawatt/size_config.dart';
import 'package:flutter/material.dart';

import '../../service/ad_mob_service.dart';

class BodyKalkulator extends StatefulWidget {
  const BodyKalkulator({
    super.key,
  });

  @override
  _BodyKalkulatorState createState() => _BodyKalkulatorState();
}

class _BodyKalkulatorState extends State<BodyKalkulator> {
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
              NarrowLayout(),
              // NarrowAdsBanner(banner: _banner1)
            ],
          );
        }
      }),
      //   NarrowLayout()
    );
  }
}
