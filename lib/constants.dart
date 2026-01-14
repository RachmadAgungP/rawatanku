import 'package:rawatt/size_config.dart';
import 'package:flutter/material.dart';

// Color
const kColor = Color(0xFF4CAF50);
const kGradientColor = LinearGradient(
    colors: [kPrimaryLightColor, kColor],
    begin: FractionalOffset(4, 1),
    end: FractionalOffset(0.8, 1.5));

// const kPrimaryColor = Color(0xFFC8E6C9);
const kPrimaryColor = Color(0xFFA5D6A7);

const kSecondaryColor = Color(0xFF1B5E20);
const kSecondaryColory = Color(0xFFF9A739);

const kPrimaryGradientColor = LinearGradient(
    colors: [kPrimaryLightColor, kPrimaryColor],
    begin: FractionalOffset(1.5, 0.01),
    end: FractionalOffset(0.8, 1.5));

const kSecondaryGradientColor = LinearGradient(
    colors: [kPrimaryLightColor, kSecondaryColor],
    begin: FractionalOffset(1.9, 1),
    end: FractionalOffset(1.4, 1.3));

const kPrimaryLightColor = Colors.white;
const kPrimaryDarkColor = Colors.black54;
const kSecondaryLight_DarkColor = Colors.black38;

// Size border
const sBgBorderRadius = 36.0;
const sPrimaryBorderRadius = 15.0;

// Size Text
double sT26 = 26.0;
double sT24 = 24.0; //Judul Awal
double sT22 = 22.0; //Judul Awal
double sT20 = 20.0; //Judul Awal
double sT18 = 18.0; //Judul Awal
double sT16 = 16.0; //Judul Awal
double sT14 = 14.0; //Judul Card
double sT12 = 12.0; //Judul tiap fitur
double sT10 = 9.0; //Penjelas Card dan font tombol
double sT8 = 8.0;

double sHCard250 = heightfit(250);
double sWCard300 = heightfit(300);

const kTextColor = Color(0xFF1B5E20);
const kTextColor1 = Color(0xFF388E3C);

const kAnimationDuration = Duration(milliseconds: 200);

const kShadowColor = Colors.black38;

const ksize_scale = 0.8;

double get defaultPadding => SizeConfig.screenWidth == null
    ? 16.0
    : (SizeConfig.screenWidth! / 375.0) * 16.0;

final warna = Colors.black.withOpacity(.3);
final warna1 = Colors.green.withOpacity(.3);

Color warnas(String warnanya) {
  Color temaWarna = Color(int.parse("0xff$warnanya"));
  return temaWarna;
}
