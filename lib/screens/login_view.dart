import 'dart:convert';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:get/get.dart';
import 'package:rawatt/components/matahari.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart'; // Diganti dari 'package:supabase/supabase.dart'

import '../constants.dart';
import '../size_config.dart';
import 'convert/component/inisialisasi_var.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  _LoginViewState createState() => _LoginViewState();
}

bool prosess = false;

class _LoginViewState extends State<LoginView> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void _tombolLogin() async {
    if (c.isLoadButton.value) return;
    c.isLoadButton.value = true;
    await Future.delayed(Duration(seconds: 2));
    c.isLoadButton.value = true;
    if (_formKey.currentState!.validate()) {
      _login().onError((error, stackTrace) =>
          _showDialog(context, title: 'Error', message: error.toString()));
    }
    c.isLoadButton.value = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(context),
      backgroundColor: kColor,
    );
  }

  Widget _buildBody(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Obx(() {
      return SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: [
                SizedBox(
                  height: heightfit(175),
                ),
                SizedBox(
                  height: heightfit(200),
                  width: widthfit(250),
                  child: FittedBox(
                    child: Container(
                      height: 200,
                      width: 250,
                      padding: EdgeInsets.all(defaultPadding),
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image:
                                  AssetImage("assets/images/logo_putih.png")),
                          borderRadius:
                              BorderRadius.circular(defaultPadding / 2),
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 18,
                                offset: Offset(-8, 10),
                                color: Color.fromRGBO(0, 0, 0, 0.2))
                          ]),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            SizedBox(
                              height: defaultPadding,
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: defaultPadding),
                              child: TextFormField(
                                controller: _emailController,
                                cursorColor: Colors.black,
                                style: TextStyle(),
                                decoration: InputDecoration(
                                  labelText: 'E-mail',
                                  labelStyle: TextStyle(color: Colors.black),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black),
                                  ),
                                ),
                                validator: (String? value) {
                                  if (value!.isEmpty) {
                                    return "Invalid e-mail";
                                  }
                                  return null;
                                },
                              ),
                            ),
                            SizedBox(
                              height: defaultPadding,
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: defaultPadding),
                              child: TextFormField(
                                controller: _passwordController,
                                cursorColor: Colors.black,
                                obscureText: true,
                                style: TextStyle(),
                                decoration: InputDecoration(
                                  labelText: 'Password',
                                  labelStyle: TextStyle(color: Colors.black),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black),
                                  ),
                                ),
                                validator: (String? value) {
                                  if (value!.isEmpty) {
                                    return 'Invalid password';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            SizedBox(
                              height: defaultPadding * 3,
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: defaultPadding),
                              width: size.width,
                              height: defaultPadding * 3,
                              child: ElevatedButton(
                                onPressed: _tombolLogin,

                                // _showInterstitalAd,

                                style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.all(1),
                                  shadowColor: Colors.green,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  elevation: 0,
                                  backgroundColor: Colors.lightGreen,
                                ),

                                child: c.isLoadButton.value
                                    ? Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          CircularProgressIndicator(
                                            color: Colors.white,
                                          ),
                                          SizedBox(
                                            width: defaultPadding,
                                          ),
                                          AutoSizeText(
                                            "Tunggu Sebentar...",
                                            textAlign: TextAlign.center,
                                            maxLines: 4,
                                            minFontSize: 8,
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w800),
                                          ),
                                        ],
                                      )
                                    : Text(
                                        'Login',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Don\'t have an account?',
                                  style: TextStyle(color: Colors.black),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(context, 'register');
                                  },
                                  child: Text(
                                    'Register',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            Positioned(
              right: 0,
              top: 0,
              child: FittedBox(
                child: Transform.scale(
                  scale: 5,
                  child: Matahari(key: Key("s")),
                ),
              ),
            )
          ],
        ),
      );
    });
  }

  Future _login() async {
    final sharedPreferences = await SharedPreferences.getInstance();

    final result = await Get.find<SupabaseClient>().auth.signInWithPassword(
        email: _emailController.text, password: _passwordController.text);

    if (result.session != null) {
      await sharedPreferences.setString(
          'user', jsonEncode(result.session!.toJson()));
      c.myUserId.value = result.user!.id;
      // databaseKuP.fetchDataPetani(result.user!.id).then((value) => List.of(value).isEmpty?c.isviewRegister.value = true:c.isviewRegister.value = false);

      if (mounted) {
        Navigator.pushReplacementNamed(context, 'home');
      }
    }

    // } else if (result.session.error?.message != null) {
    //
    // } else {
    //   Center(
    //     child: CircularProgressIndicator(
    //       color: Colors.green,
    //     ),
    //   );
    // }
  }
}

void _showDialog(BuildContext context, {String? title, String? message}) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      // retorna um objeto do tipo Dialog
      return AlertDialog(
        title: Text(title ?? ''),
        content: Text(message ?? ''),
        actions: <Widget>[
          // define os botões na base do dialogo
          MaterialButton(
            child: Text("Close"),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      );
    },
  );
}
