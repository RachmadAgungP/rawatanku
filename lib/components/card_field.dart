// ignore_for_file: null_check_always_fails

import 'package:rawatt/constants.dart';
import 'package:rawatt/size_config.dart';
import 'package:flutter/material.dart';

import '../model/MenuRawatan/mdl_MenuRawatan.dart';
import '../model/jenisMesin/mdl_JenisMesin.dart';
import '../screens/convert/component/inisialisasi_var.dart';

class CardFields extends StatelessWidget {
  const CardFields({
    super.key,
    required this.tema,
    required this.columns,
    required this.judul,
    required this.onChangeState,
    required this.indexmenu,
    required this.indexsubmenu,
    required this.warna,
  });
  final Function() onChangeState;
  final Color tema;
  final Color warna;
  final Widget columns;
  final String judul;
  final int indexmenu;
  final int indexsubmenu;

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.only(bottom: heightfit(defaultPadding / 2)),
      child: SizedBox(
        width: widthfit(500),
        child: Stack(
          children: [
            Container(
              margin: EdgeInsets.only(top: heightfit(defaultPadding)),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: heightfit(defaultPadding),
                ),
                child: Container(
                  margin:
                      EdgeInsets.only(bottom: heightfit(defaultPadding / 3)),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      border: Border.all(
                          style: BorderStyle.solid, color: warna, width: 2.5),
                      // boxShadow: [
                      //   BoxShadow(
                      //       blurRadius: 10,
                      //       offset: Offset(0, 5),
                      //       // color: tema.withOpacity(.3)
                      //   )
                      // ],
                      color: Colors.white),
                  child: Container(
                    margin: EdgeInsets.symmetric(
                        vertical: heightfit(defaultPadding)),
                    child: columns,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              child: Padding(
                padding: EdgeInsets.only(
                    top: heightfit(defaultPadding / 2),
                    left: defaultPadding * 2),
                child: FitTextCostume(
                  judul: judul,
                  tema: tema,
                  height: 40,
                  indexsubmenu: indexsubmenu,
                  indexmenu: indexmenu,
                  warna: warna,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FitTextCostume extends StatefulWidget {
  const FitTextCostume({
    super.key,
    required this.judul,
    required this.tema,
    required this.height,
    required this.indexsubmenu,
    required this.indexmenu,
    required this.warna,
  });

  final String judul;
  final Color tema;
  final Color warna;
  final double height;
  final int indexsubmenu;
  final int indexmenu;

  @override
  State<FitTextCostume> createState() => _FitTextCostumeState();
}

class _FitTextCostumeState extends State<FitTextCostume> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.symmetric(horizontal: defaultPadding),
      height: heightfit(widget.height),
      // width: widthfit(width),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(5),
              bottomRight: Radius.circular(5),
              topLeft: Radius.circular(5),
              topRight: Radius.circular(5)),
          // border:
          // Border.all(
          //     style: BorderStyle.solid,
          //     color: warna,width: 2.5),
          boxShadow: [
            BoxShadow(
                blurRadius: 10,
                offset: Offset(0, 2),
                color: Colors.black87.withOpacity(0.2))
          ]),
      child: Text(
        widget.judul,
        style: TextStyle(
            color: widget.tema, fontWeight: FontWeight.bold, fontSize: 20),
      ),
    );
  }
}
