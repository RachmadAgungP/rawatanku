import 'package:get/get.dart';
import 'package:rawatt/screens/convert/component/inisialisasi_var.dart';
import 'package:rawatt/screens/splash/components/body.dart';
import 'package:rawatt/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import 'package:supabase/supabase.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../model/petani/mdl_Petani.dart';
import '../../service/database_service.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  // static String routeName = "/splash";

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    // Always run the login check; on web we will hide the splash UI in build
    checkLogin();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    // If running on web, avoid showing the full in-app splash; navigation will be handled by checkLogin
    if (kIsWeb) {
      return const Scaffold(body: SizedBox.shrink());
    }

    return Scaffold(body: Body());
  }
  //
  //

  Future<void> checkLogin() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final session = sharedPreferences.getString('user');
    // print("okes ${session}");
    if (session == null) {
      Navigator.pushReplacementNamed(context, 'login');
    } else {
      final response =
          await Get.find<SupabaseClient>().auth.recoverSession(session);

      if (response.user != null && response.session != null) {
        c.myUserId.value = response.user!.id;
        // databaseKuP.fetchDataPetani(response.user!.id).then((value) => List.of(value).isEmpty?c.isviewRegister.value = true:c.isviewRegister.value = false);

        sharedPreferences.setString(
            'user', response.session!.toJson().toString());

        Navigator.pushReplacementNamed(context, 'home');
      } else {
        // Jika sesi tidak valid, arahkan ke login
        Navigator.pushReplacementNamed(context, 'login');
      }
    }
  }

  // @override
  // Widget build(BuildContext context) {
  //   SizeConfig().init(context);
  //   return Scaffold(body: Body());
  // }
}
