// import 'dart:io';
//
// import 'package:flutter/material.dart';
// import 'package:google_mobile_ads/google_mobile_ads.dart';
//
// import '../screens/convert/component/inisialisasi_var.dart';
// import '../size_config.dart';
// // ca-app-pub-1698824233670976/6752716504
// class AdMobService{
//   static String get bannerAdUnitId{
//     if(Platform.isAndroid){
//       return 'ca-app-pub-1698824233670976/6752716504';
//     }
//     return null!;
//   }
//   // ca-app-pub-1698824233670976/4841154446
//   static String get interstitialAdUnitId{
//     if(Platform.isAndroid){
//       return 'ca-app-pub-1698824233670976/4841154446';
//     }
//     return null!;
//   }
//
// static final BannerAdListener bannerListener = BannerAdListener(
//   onAdLoaded:(ad) => debugPrint('Ad loaded.'),
//   onAdFailedToLoad: (ad, error) {
//     ad.dispose();
//     debugPrint('Ad Failed to load : $error');
//
//   },
//   onAdOpened: (ad) => debugPrint('aAd Opened'),
//   onAdClosed: (ad) => debugPrint('aAd Closed'),
//
// );
//
// }
//
// //INTERSTITIAL ADS
// InterstitialAd? _interstitialAd;
//
// void showInterstitalAd(BuildContext context, String link){
//   createInterstitialAd();
//   if(_interstitialAd != null){
//     _interstitialAd?.fullScreenContentCallback = FullScreenContentCallback(
//       onAdDismissedFullScreenContent: (ad){
//
//         ad.dispose();
//         createInterstitialAd();
//         print("ada");
//         c.isLoadButton.value = false;
//
//       },
//       onAdFailedToShowFullScreenContent: (ad, error) {
//         ad.dispose();
//         createInterstitialAd();
//         print("error");
//       },
//     );
//     _interstitialAd?.show();
//     _interstitialAd = null;
//     linkeds(context, link);
//   }else{
//     linkeds(context, link);
//     print("tidak ada");
//   }
//
// }
//
//
// void createInterstitialAd() {
//   InterstitialAd.load(
//       adUnitId: AdMobService.interstitialAdUnitId,
//       request: const AdRequest(),
//       adLoadCallback: InterstitialAdLoadCallback(onAdLoaded:(ad) => _interstitialAd = ad,
//         onAdFailedToLoad:(LoadAdError error) => _interstitialAd =null,));
// }
//
// void linkeds
//     (BuildContext context , String link) async{
//   if(c.isLoadButton.value) return;
//
//   // c.isLoadButton.value = false;
//   c.isLoadButton.value = true;
//   await Future.delayed(Duration(seconds:1));
//   c.isLoadButton.value = true;
//   // _showInterstitalAd;
//   // ignore: use_build_context_synchronously
//   Navigator.pushNamed(context, link);
//   c.isLoadButton.value = false;
// }
//
//
// class WideAdsBanner extends StatelessWidget {
//   const WideAdsBanner({
//     required Key key,
//     required BannerAd banner,
//   }) : _banner = banner, super(key: key);
//
//   final BannerAd _banner;
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       alignment: Alignment.bottomCenter,
//       child: _banner ==null? Container():Container(
//         // margin: EdgeInsets.only(bottom: defaultPadding),
//         height: heightfit(140),
//         child: AdWidget(ad:_banner),
//       ),
//     );
//   }
// }
//
// class NarrowAdsBanner extends StatelessWidget {
//   const NarrowAdsBanner({
//     required Key key,
//     required BannerAd banner,
//   }) : _banner = banner, super(key: key);
//
//   final BannerAd _banner;
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       alignment: Alignment.bottomCenter,
//       child: _banner ==null? Container():Container(
//         // margin: EdgeInsets.only(bottom: defaultPadding),
//         height: heightfit(65),
//         child: AdWidget(ad:_banner),
//       ),
//     );
//   }
// }
