import 'package:rawatt/components/tema_Page.dart';
import 'package:rawatt/model/controler.dart';
import 'package:rawatt/model/datafix.dart';
import 'package:rawatt/model/product/mdl_Produk.dart';
import 'package:rawatt/screens/details/screen_Lanscape/backgrounds.dart';
import 'package:rawatt/screens/details/screen_Potrait/backgrounds.dart';
import 'package:rawatt/size_config.dart';
import 'package:flutter/material.dart';

import '../convert/component/dialogku.dart';
import '../convert/component/inisialisasi_var.dart';

class BodyDetails extends StatefulWidget {
  const BodyDetails({
    super.key,
  });

  @override
  _BodyDetailsState createState() => _BodyDetailsState();
}

class _BodyDetailsState extends State<BodyDetails> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    // print("produksku ${c.produkku.value.nama}");
    return Scaffold(
        extendBodyBehindAppBar: (SizeConfig.screenWidth! > 600) ? false : true,
        appBar: (SizeConfig.screenWidth! > 600)
            ? appBarLanscape()
            : appBarPotrait(),
        body:
            // ====================== rotate ============= Lancape
            LayoutBuilder(builder: (context, constraints) {
          if (constraints.maxWidth > 600) {
            return WideLayoutProduct();
          } else {
            return DetailsPage();
          }
        }));
  }
}
