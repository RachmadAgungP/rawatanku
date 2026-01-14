import 'package:rawatt/components/card_penjelas.dart';
import 'package:rawatt/components/card_pupuk.dart';
import 'package:rawatt/constants.dart';
import 'package:rawatt/screens/convert/component/inisialisasi_var.dart';
import 'package:flutter/material.dart';

class WidgetKebutuhanPupukN extends StatelessWidget {
  const WidgetKebutuhanPupukN({
    super.key,
    required this.judul,
    required this.data,
    required this.hasil,
  });
  final String judul;
  final List data;
  final List hasil;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(children: [
            TextSpan(
              text: judul,
              style: TextStyle(
                  color: kTextColor,
                  fontSize: sT18,
                  fontWeight: FontWeight.bold),
            ),
          ]),
        ),
        SizedBox(
          height: defaultPadding,
        ),
        Padding(
          padding: EdgeInsets.symmetric(
              vertical: defaultPadding / 2, horizontal: defaultPadding),
          child: Column(
            //  myList = List<String>(3);
            children: [
              for (var i = 0; i < 3; i++)
                Padding(
                  padding: EdgeInsets.only(
                    bottom: defaultPadding,
                  ),
                  child: CardpHs(
                    id: 0,
                    hasilAkhir: "",
                    title: "Pupuk ${filterdataByPerusahaan(0)[i].nama} \n",
                    sizes: sT18,
                    cardornot: true,
                    tema: warnas(
                        List.from(filterdataByPerusahaan(0)[i].color)[0]),
                    multitext: [],
                    texts: "${hasil[i]} = \n"
                            "-> ${data[i].toStringAsFixed(1)} Kg ${filterdataByPerusahaan(0)[i].nama}\n" + // hasil
                        "-> ${(data[i] * 1000).toStringAsFixed(1)} g ${filterdataByPerusahaan(0)[i].nama}",
                    cardCostume: Container(
                        // padding: EdgeInsets.all(defaultPadding / 2),
                        child: CardProductku(
                            tema: warnas(List.from(
                                filterdataByPerusahaan(0)[i].color)[0]),
                            image: filterdataByPerusahaan(0)[i].img)),
                    widgetCostum: Container(),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
