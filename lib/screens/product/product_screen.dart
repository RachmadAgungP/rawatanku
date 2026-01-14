// import 'package:google_mobile_ads/google_mobile_ads.dart';
// import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:rawatt/components/tema_Page.dart';
import 'package:rawatt/model/controler.dart';
import 'package:rawatt/screens/product/screen_Lanscape/backgrounds.dart';
import 'package:rawatt/screens/product/screen_Potrait/backgrounds.dart';
import 'package:rawatt/size_config.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../service/ad_mob_service.dart';

class Body extends StatefulWidget {
  // final ScrollController = controller;

  const Body({super.key});

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  // BannerAd? _banner2;
  // BannerAd? _banner1;
  @override
  void initState() {
    super.initState();

    // _createBAnnerAd();
    // _createBAnnerAd2();
  }

  // void _createBAnnerAd() {
  //   _banner2 =BannerAd(size: AdSize.fullBanner, adUnitId: AdMobService.bannerAdUnitId, listener: AdMobService.bannerListener, request: const AdRequest(),)..load();
  // }
  // void _createBAnnerAd2() {
  //   _banner1 =BannerAd(size: AdSize.fullBanner, adUnitId: AdMobService.bannerAdUnitId, listener: AdMobService.bannerListener, request: const AdRequest(),)..load();
  // }
  // @override
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      extendBodyBehindAppBar: (SizeConfig.screenWidth! > 600) ? false : true,
      appBar:
          (SizeConfig.screenWidth! > 600) ? appBarLanscape() : appBarPotrait(),
      body: LayoutBuilder(builder: (context, constraints) {
        if (constraints.maxWidth > 600) {
          return Stack(
            children: [
              WideLayoutProduct(),
              // WideAdsBanner(banner: _banner1!, key: Key("s"),)
            ],
          );
        } else {
          return Stack(
            children: [
              NarrowLayout(),
              // NarrowAdsBanner(banner: _banner2!, key: Key("s"))
            ],
          );
        }
      }),
      // bottomNavigationBar: _banner2 ==null? Container():Container(
      //   margin: EdgeInsets.only(bottom: defaultPadding),
      //   height: 52,
      //   child: AdWidget(ad:_banner2),
      // ),
    );
  }
}
