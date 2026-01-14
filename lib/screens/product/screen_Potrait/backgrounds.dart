import 'package:rawatt/components/card_judulPetro.dart';
import 'package:rawatt/components/tema_Page.dart';
import 'package:rawatt/constants.dart';
import 'package:rawatt/screens/convert/component/inisialisasi_var.dart';
import 'package:rawatt/screens/product/components/components.dart';
import 'package:flutter/material.dart';

class NarrowLayout extends StatelessWidget {
  const NarrowLayout({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.white,
      child: BackgraundPotrait(
        judul: "Produk Terbaik",
        penjelas: "Pilih dengan Bijak",
        widgets: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(defaultPadding),
              child: CardListProduct(
                key: Key("s"),
              ),
            ),
            Products(
              crossAxisCounts: 2,
              dataProduk:
                  filterdataByMenuRawatan(c.indexMenuRawatan.value.toString()),
              todetail: true,
              onChangeState: (DataProducts) {},
            ),
            Container()
          ],
        ),
        tema: Colors.green,
        key: Key("s"),
      ),
    );
  }
}
