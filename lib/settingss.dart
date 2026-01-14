import 'dart:io';

import 'package:flutter/services.dart';
import 'package:rawatt/components/card_field.dart';
import 'package:rawatt/components/card_judulPetro.dart';
import 'package:rawatt/components/tabCostume.dart';
import 'package:rawatt/components/tema_Page.dart';
import 'package:rawatt/constants.dart';
import 'package:rawatt/model/jenisMesin/mdl_JenisMesin.dart';
import 'package:rawatt/screens/convert/component/PropertyKalkulator.dart';
import 'package:rawatt/screens/convert/component/component.dart';
import 'package:rawatt/screens/convert/component/inisialisasi_var.dart';
import 'package:rawatt/screens/convert/screen_Lanscape/backgrounds.dart';
import 'package:rawatt/screens/home/home_screen.dart';
import 'package:rawatt/size_config.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

// import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:rawatt/components/tema_Page.dart';
import 'package:rawatt/model/data_hargaPangan.dart';
import 'package:rawatt/screens/convert/screen_Lanscape/backgrounds.dart';

import 'package:rawatt/screens/convert/screen_Potrait/backgrounds.dart';
import 'package:rawatt/screens/profile/maknaLogo.dart';

import 'package:flutter/material.dart';

import 'model/product/mdl_Produk.dart';

class BodyKalkulatoralls extends StatefulWidget {
  const BodyKalkulatoralls({
    super.key,
  });

  @override
  _BodyKalkulatorallsState createState() => _BodyKalkulatorallsState();
}

class _BodyKalkulatorallsState extends State<BodyKalkulatoralls> {
  // BannerAd _banner2;
  // BannerAd _banner1;
  @override
  void initState() {
    super.initState();

    // createBAnnerAd();
    // createBAnnerAd2();
  }
  // void createBAnnerAd() {
  //   _banner2 =BannerAd(size: AdSize.fullBanner, adUnitId: AdMobService.bannerAdUnitId, listener: AdMobService.bannerListener, request: const AdRequest(),)..load();
  //
  // }
  // void createBAnnerAd2() {
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
  @override
  void initState() {
    super.initState();
  }

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
              Text("Setting Scan code : "),
              ListView(
                shrinkWrap: true,
                children: <Widget>[
                  const ListTile(
                    title: Text('Camera selection'),
                    dense: true,
                    enabled: false,
                  ),
                  const ListTile(
                    title: Text('Button Texts'),
                    dense: true,
                    enabled: false,
                  ),
                  ListTile(
                    title: TextField(
                      decoration: const InputDecoration(
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        labelText: 'Flash On',
                      ),
                      controller: c.flashOnController.value,
                    ),
                  ),
                  ListTile(
                    title: TextField(
                      decoration: const InputDecoration(
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        labelText: 'Flash Off',
                      ),
                      controller: c.flashOffController.value,
                    ),
                  ),
                  ListTile(
                    title: TextField(
                      decoration: const InputDecoration(
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        labelText: 'Cancel',
                      ),
                      controller: c.cancelController.value,
                    ),
                  ),
                  if (Platform.isAndroid) ...[
                    const ListTile(
                      title: Text('Android specific options'),
                      dense: true,
                      enabled: false,
                    ),
                    ListTile(
                      title: Text(
                        'Aspect tolerance (${c.aspectTolerance.value.toStringAsFixed(2)})',
                      ),
                      subtitle: Slider(
                        min: -1,
                        value: c.aspectTolerance.value,
                        onChanged: (value) {
                          setState(() {
                            c.aspectTolerance.value = value;
                          });
                        },
                      ),
                    ),
                    CheckboxListTile(
                      title: const Text('Use autofocus'),
                      value: c.useAutoFocus.value,
                      onChanged: (checked) {
                        setState(() {
                          c.useAutoFocus.value = checked!;
                        });
                      },
                    ),
                  ],
                  const ListTile(
                    title: Text('Other options'),
                    dense: true,
                    enabled: false,
                  ),
                  CheckboxListTile(
                    title: const Text('Start with flash'),
                    value: c.autoEnableFlash.value,
                    onChanged: (checked) {
                      setState(() {
                        c.autoEnableFlash.value = checked!;
                      });
                    },
                  ),
                ],
              ),
            ]),
          ),
        ),
        tema: Colors.green,
      ),
    );
  }
}
