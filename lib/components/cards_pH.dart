import 'package:rawatt/components/card_atom.dart';
import 'package:flutter/material.dart';

class CardpH extends StatelessWidget {
  const CardpH({
    super.key,
    @required required this.hasilAkhir,
  });

  final String hasilAkhir;

  @override
  Widget build(BuildContext context) {
    return CardAtom(
      simbolAtom: hasilAkhir,
      nomerAtom: 'pH',
      massaAtom: "0",
      namaAtom: (double.parse(hasilAkhir) < 6.5)
          ? "Asam"
          : (double.parse(hasilAkhir) <= 7.0)
              ? "Optimal"
              : "Basa",
      ionisasiEnergi: "",
      warna: Colors.white,
      key: Key("l"),
    );
  }
}
