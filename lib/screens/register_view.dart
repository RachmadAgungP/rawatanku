// title="register_view.dart"
import 'package:auto_size_text/auto_size_text.dart';
import 'package:get/get.dart';
import 'package:rawatt/components/matahari.dart';
import 'package:flutter/material.dart';
import 'package:supabase/supabase.dart';

import '../constants.dart';
import '../size_config.dart';
import 'convert/component/inisialisasi_var.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  _RegisterViewState createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void _tombolRegister() async {
    if (c.isLoadButton.value) return;
    c.isLoadButton.value = true;
    await Future.delayed(Duration(seconds: 2));
    c.isLoadButton.value = true;
    if (_formKey.currentState!.validate()) {
      _register().onError((error, stackTrace) =>
          _showDialog(context, title: 'Error', message: error.toString()));
    } else {}
    c.isLoadButton.value = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(context),
      backgroundColor: kColor,
    );
  }

  Widget _buildBody(context) {
    final size = MediaQuery.of(context).size;
    bool sukses = true;
    return Obx(() {
      return SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: [
                SizedBox(
                  height: heightfit(135),
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

                              // image: NetworkImage("assets/images/sawah1.jpg")
                              image:
                                  AssetImage("assets/images/logo_putih.png")),
                          borderRadius: BorderRadius.circular(5)),
                    ),
                  ),
                ),
                SizedBox(
                  height: defaultPadding,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: defaultPadding * 2),
                  child: Container(
                    padding: EdgeInsets.only(
                        bottom: 40,
                        left: defaultPadding / 2,
                        right: defaultPadding / 2),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(defaultPadding),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 18,
                              offset: Offset(-8, 10),
                              color: Colors.black.withOpacity(.2))
                        ]),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          SizedBox(
                            height: defaultPadding,
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 20.0),
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
                                if (value!.isEmpty || !value.contains('@')) {
                                  return 'Invalid e-mail';
                                }
                                return null;
                              },
                            ),
                          ),
                          SizedBox(
                            height: defaultPadding,
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 20.0),
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
                            height: 10,
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 20.0),
                            child: TextFormField(
                              cursorColor: Colors.black,
                              obscureText: true,
                              style: TextStyle(),
                              decoration: InputDecoration(
                                labelText: 'Confirm Password',
                                labelStyle: TextStyle(color: Colors.black),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
                                ),
                              ),
                              validator: (String? value) {
                                if (value!.isEmpty ||
                                    value != _passwordController.text) {
                                  return 'Passwords don\'t match';
                                }
                                return null;
                              },
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            width: size.width,
                            height: 45,
                            child: ElevatedButton(
                              onPressed: _tombolRegister,

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
                                      'Register',
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
                                'Already have an account?',
                                style: TextStyle(color: Colors.black),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text(
                                  'Login',
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
                )
              ],
            ),
            Positioned(
              right: 0,
              top: 0,
              child: FittedBox(
                child: Transform.scale(
                  scale: 5,
                  child: Matahari(),
                ),
              ),
            )
          ],
        ),
      );
    });
  }

  Future _register() async {
    final result = await Get.find<SupabaseClient>().auth.signUp(
        email: _emailController.text, password: _passwordController.text);

    if (result.session != null) {
      Navigator.pushReplacementNamed(context, 'login');
      _showDialog(context, title: 'Success', message: 'Register Successful');
    }

    // else if (result.error?.message != null) {
    //   _showDialog(context, title: 'Error', message: result.error?.message);
    // }

    setState(() {
      // just for simplicity reasons (clean the textfields)
    });
  }

  void _showDialog(context, {String? title, String? message}) {
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
}
