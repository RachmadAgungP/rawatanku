import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:rawatt/constants.dart';
import 'package:rawatt/screens/details/component/component.dart';
import 'package:rawatt/size_config.dart';

import '../../home/home_screen.dart';
import 'inisialisasi_var.dart';

class Constants {
  Constants._();
  static const double padding = 20;
  static const double avatarRadius = 45;
}

class CustomDialogBox extends StatefulWidget {
  final String title, descriptions, text, img;
  final Function() chek;

  const CustomDialogBox({
    super.key,
    required this.title,
    required this.descriptions,
    required this.text,
    required this.img,
    required this.chek,
  });

  @override
  // ignore: library_private_types_in_public_api
  _CustomDialogBoxState createState() => _CustomDialogBoxState();
}

class _CustomDialogBoxState extends State<CustomDialogBox> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BlurryEffect(0, 3, Colors.white),
        Center(
          child: SingleChildScrollView(
            child: Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(Constants.padding),
              ),
              elevation: 0,
              backgroundColor: Colors.transparent,
              child: Stack(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(
                        left: Constants.padding,
                        top: Constants.avatarRadius + Constants.padding,
                        right: Constants.padding,
                        bottom: Constants.padding),
                    margin: EdgeInsets.only(top: Constants.avatarRadius),
                    decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: (c.isviewdialogValid.value == true)
                            ? Colors.green
                            : Colors.red,
                        borderRadius: BorderRadius.circular(Constants.padding),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black12.withOpacity(0.4),
                              offset: Offset(0, 10),
                              blurRadius: 10),
                        ]),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(
                          widget.title,
                          style: TextStyle(
                              fontSize: heightfit(28),
                              fontWeight: FontWeight.w600,
                              color: Colors.white),
                        ),
                        SizedBox(
                          height: heightfit(defaultPadding / 2),
                        ),
                        Text(
                          widget.descriptions,
                          style: TextStyle(
                              fontSize: heightfit(22), color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: heightfit(defaultPadding),
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: ElevatedButton(
                              onPressed: widget.chek,
                              style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.all(1),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  elevation: 0,
                                  backgroundColor: Colors.white),
                              child: Text(
                                widget.text,
                                style: TextStyle(
                                    fontSize: heightfit(20),
                                    color: Colors.black87),
                              )),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    left: Constants.padding,
                    right: Constants.padding,
                    child: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      radius: Constants.avatarRadius,
                      child: ClipRRect(
                          borderRadius: BorderRadius.all(
                              Radius.circular(Constants.avatarRadius)),
                          child: Image.asset(widget.img)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
