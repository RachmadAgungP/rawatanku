import 'dart:io';
import 'dart:math';

import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:rawatt/Debug/aiWork.dart';
import 'package:rawatt/constants.dart';
import 'package:rawatt/size_config.dart';

import 'package:rawatt/screens/MedsosIG/screen_Portrait.dart';

import 'package:rawatt/screens/convert/component/inisialisasi_var.dart';
import 'package:rawatt/screens/convert/kalkulator.dart';
import 'package:rawatt/screens/convert/screen_Potrait/backgroundKumuplanKal.dart';
import 'package:rawatt/screens/convert/screens/dolomit/Dolomit_display.dart';
import 'package:rawatt/screens/convert/screens/dolomit/myMainDolomit.dart';
import 'package:rawatt/screens/convert/screens/majemuk2tunggal/majemuk2tunggal_display.dart';
import 'package:rawatt/screens/convert/screens/majemuk2tunggal/my_main.dart';
import 'package:rawatt/screens/convert/screens/tunggal2majemuk_display/my_mainT2M.dart';
import 'package:rawatt/screens/convert/screens/tunggal2majemuk_display/tunggal2majemuk_display.dart';
// import 'package:rawatt/screens/hama/components/body.dart';

import 'package:rawatt/screens/hara/components/body.dart';
import 'package:rawatt/screens/home/countdown_time.dart';
import 'package:rawatt/screens/home/home_screen.dart';
import 'package:rawatt/screens/login_view.dart';
import 'package:rawatt/screens/product/product_screen.dart';
import 'package:rawatt/screens/profile/maknaLogo.dart';
import 'package:rawatt/screens/profile/sejarah.dart';
// import 'package:rawatt/screens/profile/visi.dart';
import 'package:rawatt/screens/profilePetani.dart';
import 'package:rawatt/screens/register_view.dart';

import 'package:rawatt/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

// import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:flutter/services.dart';
import 'package:rawatt/screens/theme/theme.dart';
import 'package:rawatt/screens/theme/theme_controller.dart';
import 'package:rawatt/service/database_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:time_machine/time_machine.dart' hide Offset;

import 'model/product/mdl_Produk.dart';
import 'screens/convert/screens/dosis_pupuk_tanaman/dosis_pupuk_tanaman.dart';

import 'package:get/get.dart';

// import 'package:isar/isar.dart';
// import 'package:timezone/data/latest.dart' as tz;
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

// Future<void> initSettings() async {
//   settings = isar.settings.where().findFirstSync() ?? Settings();
//   if (settings.language == null) {
//     settings.language = '${Get.deviceLocale}';
//     isar.writeTxnSync(() => isar.settings.putSync(settings));
//   }
//
//   if (settings.theme == null) {
//     settings.theme = 'system';
//     isar.writeTxnSync(() => isar.settings.putSync(settings));
//   }
// }

FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

bool amoledTheme = false;
bool materialColor = false;
String timeformat = '24';
Locale locale = const Locale('id', 'ID');

final List appLanguages = [
  {'name': 'العربية', 'locale': const Locale('ar', 'AR')},
  {'name': 'English', 'locale': const Locale('en', 'US')},
  {'name': 'Español', 'locale': const Locale('es', 'ES')},
  {'name': 'Français', 'locale': const Locale('fr', 'FR')},
  {'name': 'Italiano', 'locale': const Locale('it', 'IT')},
  {'name': 'فارسی', 'locale': const Locale('fa', 'IR')},
  {'name': 'Русский', 'locale': const Locale('ru', 'RU')},
  {'name': '中文', 'locale': const Locale('zh', 'CN')},
  {'name': '中国传统台湾', 'locale': const Locale('zh', 'TW')},
  {'name': 'Deutsch', 'locale': const Locale('de', 'DE')},
  {'name': 'Indonesia', 'locale': const Locale('id', 'ID')},
];

void main() async {
  // debugPrintMarkNeedsLayoutStacks = true;
  final String timeZoneName;

  WidgetsFlutterBinding.ensureInitialized();

  // if (Platform.isAndroid || Platform.isIOS) {
  //   timeZoneName = await FlutterTimezone.getLocalTimezone();
  // } else {
  //   timeZoneName = '${DateTimeZone.local}';
  // }

  timeZoneName = '${DateTimeZone.local}';
  tz.initializeTimeZones();
  tz.setLocalLocation(tz.getLocation(timeZoneName));

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  // await SharedPreferences.getInstance();
  // // MobileAds.instance.initialize();
  // SystemChrome.setPreferredOrientations(
  //     [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  // await loadData();

  const DarwinInitializationSettings initializationSettingsIos =
      DarwinInitializationSettings();
  const AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('@mipmap/ic_launcher');
  const LinuxInitializationSettings initializationSettingsLinux =
      LinuxInitializationSettings(defaultActionName: 'ToDark');
  const InitializationSettings initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      linux: initializationSettingsLinux,
      iOS: initializationSettingsIos);
  await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  // await IsarController().openDB();
  // await initSettings();

  Get.put(SupabaseClient(
    'https://iopkyzkhxhwaogmcwwoy.supabase.co',
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImlvcGt5emtoeGh3YW9nbWN3d295Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTU0NDE5MDksImV4cCI6MjAxMTAxNzkwOX0.awl9zmD08A4uPu2DeUCoWDnRUWVSVb6cAI2zl_OnIBo',
  ));

// // The promptForPushNotificationsWithUserResponse function will show the iOS or Android push notification prompt. We recommend removing the following code and instead using an In-App Message to prompt for notification permission
//   OneSignal.Notifications.requestPermission(true);
  await SharedPreferences.getInstance();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(MyApp());
  });
}

final GlobalKey<NavigatorState> navigatorKey =
    GlobalKey(debugLabel: "Main Navigator"); //

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  static Future<void> updateAppState(
    BuildContext context, {
    bool? newAmoledTheme,
    bool? newMaterialColor,
    String? newTimeformat,
    Locale? newLocale,
  }) async {
    final state = context.findAncestorStateOfType<_MyAppState>()!;

    if (newAmoledTheme != null) {
      state.changeAmoledTheme(newAmoledTheme);
    }
    if (newMaterialColor != null) {
      state.changeMarerialTheme(newMaterialColor);
    }
    if (newTimeformat != null) {
      state.changeTimeFormat(newTimeformat);
    }
    if (newLocale != null) {
      state.changeLocale(newLocale);
    }
  }

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // final themeController = Get.put(ThemeController());

  void changeAmoledTheme(bool newAmoledTheme) {
    setState(() {
      amoledTheme = newAmoledTheme;
    });
  }

  void changeMarerialTheme(bool newMaterialColor) {
    setState(() {
      materialColor = newMaterialColor;
    });
  }

  void changeTimeFormat(String newTimeformat) {
    setState(() {
      timeformat = newTimeformat;
    });
  }

  void changeLocale(Locale newLocale) {
    setState(() {
      locale = newLocale;
    });
  }

  @override

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: DynamicColorBuilder(
        builder: (lightColorScheme, darkColorScheme) {
          final lightMaterialTheme =
              lightTheme(lightColorScheme?.surface, lightColorScheme);
          final darkMaterialTheme =
              darkTheme(darkColorScheme?.surface, darkColorScheme);
          final darkMaterialThemeOled = darkTheme(oledColor, darkColorScheme);

          return GetMaterialApp(
            navigatorKey: navigatorKey,
            title: 'Rawatan Apps',
            theme: materialColor
                ? lightColorScheme != null
                    ? lightMaterialTheme
                    : lightTheme(lightColor, colorSchemeLight)
                : lightTheme(lightColor, colorSchemeLight),
            darkTheme: amoledTheme
                ? materialColor
                    ? darkColorScheme != null
                        ? darkMaterialThemeOled
                        : darkTheme(oledColor, colorSchemeDark)
                    : darkTheme(oledColor, colorSchemeDark)
                : materialColor
                    ? darkColorScheme != null
                        ? darkMaterialTheme
                        : darkTheme(darkColor, colorSchemeDark)
                    : darkTheme(darkColor, colorSchemeDark),
            // themeMode: themeController.theme,
            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],

            locale: locale,
            fallbackLocale: const Locale('id', 'ID'),
            supportedLocales:
                appLanguages.map((e) => e['locale'] as Locale).toList(),
            debugShowCheckedModeBanner: false,
            builder: (context, widget) {
              // Ensure SizeConfig is initialized for sizing helpers
              // On web, provide a phone-like MediaQuery so widgets size themselves like a phone
              if (kIsWeb) {
                final double phoneWidth =
                    SizeConfig.baseWidth; // target phone logical width in px
                final mq = MediaQuery.of(context);
                final screenWidth = mq.size.width;
                final double targetWidth =
                    screenWidth < phoneWidth ? screenWidth : phoneWidth;

                final double fontScale = targetWidth / SizeConfig.baseWidth;

                final mqOverride = mq.copyWith(
                  size: Size(targetWidth, mq.size.height),
                  textScaler: TextScaler.linear((mq.textScaleFactor * fontScale)
                      .clamp(0.7, 1.2) as double),
                );

                final double targetHeight =
                    mq.size.height < SizeConfig.baseHeight
                        ? mq.size.height
                        : SizeConfig.baseHeight;

                return Center(
                  child: SizedBox(
                    width: targetWidth,
                    height: targetHeight,
                    child: MediaQuery(
                      data: mqOverride,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 12,
                              spreadRadius: 4,
                              offset: Offset(0, 6),
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Builder(
                            builder: (innerCtx) {
                              SizeConfig().init(innerCtx);
                              return widget ?? const SizedBox.shrink();
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }

              // Non-web platforms: still initialize SizeConfig and scale fonts relative to base width
              return Builder(builder: (innerCtx) {
                SizeConfig().init(innerCtx);
                final mq2 = MediaQuery.of(innerCtx);
                final double fontScale =
                    (SizeConfig.screenWidth ?? SizeConfig.baseWidth) /
                        SizeConfig.baseWidth;
                final mqOverride2 = mq2.copyWith(
                    textScaler: TextScaler.linear(
                        (mq2.textScaleFactor * fontScale).clamp(0.7, 1.2)
                            as double));
                return MediaQuery(
                    data: mqOverride2,
                    child: widget ?? const SizedBox.shrink());
              });
            },

            initialRoute: 'home',
            routes: {
              // When navigating to the "/" route, build the FirstScreen widget.
              // '/': (context) => SplashScreen(),
              // When navigating to the "/second" route, build the SecondScreen widget.
              // '/': (context) => HomeScreen(),
              'register': (context) => RegisterView(),
              'login': (context) => LoginView(),
              'home': (context) => HomeScreen(),
              'product': (context) => Body(),
              'kalall': (context) => BodyKalkulatorall(),
              // '/profilePetani':(context) => profilePetani(),
              // '/dosisPupukTanamanBuah': (context) => DosisPupukTanamanbuah(),
              // '/setting': (context) =>BodyKalkulatorall(),
              'hara': (context) => BodyHaraScreen(),
              'menuConversi': (context) => BodyKalkulator(),
              'majemuk2tunggal_display': (context) => MajemuktoTunggalDisplay(),
              'tunggal2majemuk_display': (context) => TunggaltoMajemukDisplay(),
              'dolomit_display': (context) => DolomitDisplay(),
              'sejarah': (context) => Sejarah(),
              'maknalogo': (context) => MaknaLogo(),
            },
          );
        },
      ),
    );

    //   MaterialApp(
    //
    //   navigatorKey: navigatorKey,
    //   // builder: (context, widget) => ResponsiveWrapper.builder(
    //   //   ClampingScrollWrapper.builder(context, widget),
    //   //   maxWidth: 1200,
    //   //   minWidth: 480,
    //   //   defaultScale: true,
    //   //   defaultName: MOBILE,
    //   //   breakpoints: [
    //   //     ResponsiveBreakpoint.autoScale(480, name: MOBILE),
    //   //     ResponsiveBreakpoint.autoScale(600, name: MOBILE),
    //   //     ResponsiveBreakpoint.autoScale(800, name: TABLET),
    //   //     ResponsiveBreakpoint.resize(1000, name: DESKTOP),
    //   //   ],
    //   // ),
    //   debugShowCheckedModeBanner: false,
    //
    //   title: 'Rawatan Apps',
    //   theme: ThemeData(
    //       primaryColor: Colors.greenAccent,
    //       scaffoldBackgroundColor: Colors.white,
    //       fontFamily: "Muli",
    //       textTheme: TextTheme(
    //         // titleHomeText1: TextStyle(color: kTextColor),
    //         bodyText1: TextStyle(color: kTextColor),
    //         bodyText2: TextStyle(color: kPrimaryLightColor),
    //       )),
    //   initialRoute: '/home',
    //   routes: {
    //     // When navigating to the "/" route, build the FirstScreen widget.
    //     '/': (context) => SplashScreen(),
    //     // When navigating to the "/second" route, build the SecondScreen widget.
    //     // '/': (context) => HomeScreen(),
    //     '/register': (context) => RegisterView(),
    //     '/login': (context) => LoginView(),
    //     '/home': (context) => HomeScreen(),
    //     '/product': (context) => Body(),
    //     '/kalall': (context) => BodyKalkulatorall(),
    //     // '/profilePetani':(context) => profilePetani(),
    //     // '/dosisPupukTanamanBuah': (context) => DosisPupukTanamanbuah(),
    //     // '/setting': (context) =>BodyKalkulatorall(),
    //     '/hara': (context) => BodyHaraScreen(),
    //     '/menuConversi': (context) => BodyKalkulator(),
    //     '/majemuk2tunggal_display': (context) => MajemuktoTunggalDisplay(),
    //     '/tunggal2majemuk_display': (context) => TunggaltoMajemukDisplay(),
    //     '/dolomit_display': (context) => DolomitDisplay(),
    //     '/sejarah': (context) => Sejarah(),
    //     '/maknalogo': (context) => MaknaLogo(),
    //   },
    // );
  }
}
