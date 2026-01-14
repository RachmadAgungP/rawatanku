import 'package:rawatt/components/BG.dart';
// import 'package:rawatt/components/card_judulPetro.dart';
import 'package:rawatt/constants.dart';
import 'package:rawatt/screens/home/screen_Lanscape/navbar.dart';
import 'package:rawatt/screens/product/components/components.dart';
import 'package:rawatt/size_config.dart';
import 'package:flutter/material.dart';

import '../model/MenuRawatan/mdl_MenuRawatan.dart';
import '../screens/convert/component/inisialisasi_var.dart';

AppBar appBarLanscape() {
  return AppBar(
      toolbarHeight: heightfit(90),
      // backgroundColor: Colors.transparent,
      backgroundColor: Colors.green,
      elevation: 0,
      // title: Text("Title"),
      actions: <Widget>[
        FittedBox(
            child: SizedBox(
                height: heightfit(100), width: widthfit(350), child: NavBar()))
      ]);
}

AppBar appBarPotrait() {
  return AppBar(
    toolbarHeight: heightfit(50),
    backgroundColor: Colors.transparent,
    // backgroundColor: Colors.green,
    elevation: 0,
    // title: Text("Title"),
  );
}

class BackgraundPotrait extends StatelessWidget {
  const BackgraundPotrait({
    super.key,
    required this.judul,
    required this.penjelas,
    required this.widgets,
    required this.tema,
  });

  final String judul;
  final String penjelas;
  final Widget widgets;
  final Color tema;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        children: [
          BackgroundShop(
            bolimages: true,
            flex1: 200,
            flex2: 230,
            warnaBG2: Colors.white,
            warnaBG1: Colors.white,
            topRights: 20,
            topLefts: 20,
            bottomRights: 0,
            bottomLefts: 0,
            images:
                dataKategoriMenuRawatan[c.indexMenuRawatan.value].img_banner[0],
          ),
          Padding(
            padding: EdgeInsets.only(top: heightfit(60)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TitlePage(judul: judul, penjelas: penjelas),
                widgets,
              ],
            ),
          )
        ],
      ),
    );
  }
}

class BackgraundLanscape extends StatelessWidget {
  const BackgraundLanscape({
    super.key,
    required this.widgets,
  });
  final Widget widgets;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.screenHeight,
      width: SizeConfig.screenWidth,
      decoration: const BoxDecoration(
          color: kColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(0),
            bottomLeft: Radius.circular(20),
            topRight: Radius.circular(20),
            bottomRight: Radius.circular(0),
          )),
      child: widgets,
    );
  }
}
