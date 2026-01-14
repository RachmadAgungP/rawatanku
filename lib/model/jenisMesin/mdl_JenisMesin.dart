import 'package:flutter/material.dart';

List kategorisubMenuRawatan = [
  {
    'id': 0,
    'namaKomoditi': 'Padi',
    'media': {
      'Padi': {
        'Lahan': ['10.000', '20.000'],
        'Pot': ['12.000', '22.000']
      }
    },
    'variableKetetapan': [
      {
        "Listrks": {
          "hasilDosis": "0",
        }
      },
    ],
    'img': 'assets/images/komoditi/padi.png',
    'icon': Icons.solar_power_outlined,
    'id_MenuRawatan': '1'
  },
  // {
  //   'id': 1,
  //   'namaKomoditi': 'Jagung',
  //   'media': {
  //     'Jagung': {
  //       'Lahan': ['10.000', '20.000'],
  //       'Pot': ['12.000', '22.000']
  //     }
  //   },
  //   'variableKetetapan': [
  //     {
  //       "Listrks": {
  //         "hasilDosis": "0",
  //       }
  //     },
  //   ],
  //   'img': 'assets/images/komoditi/jagung.png',
  //   'icon': Icons.solar_power_outlined,
  //   'id_MenuRawatan': '1'
  // },
  // {
  //   'id': 2,
  //   'namaKomoditi': 'Kedelai / Kacang Tanah',
  //   'media': {
  //     'Kedelai / Kacang Tanah': {
  //       'Lahan': ['10.000', '20.000'],
  //       'Pot': ['12.000', '22.000']
  //     }
  //   },
  //   'variableKetetapan': [
  //     {
  //       "Listrks": {
  //         "hasilDosis": "0",
  //       }
  //     },
  //   ],
  //   'img': 'assets/images/komoditi/kedelai.png',
  //   'icon': Icons.solar_power_outlined,
  //   'id_MenuRawatan': '1'
  // },
  // {
  //   'id': 3,
  //   'namaKomoditi': 'Ubi Kayu',
  //   'media': {
  //     'Ubi Kayu': {
  //       'Lahan': ['10.000', '20.000'],
  //       'Pot': ['12.000', '22.000']
  //     }
  //   },
  //   'variableKetetapan': [
  //     {
  //       "Listrks": {
  //         "hasilDosis": "0",
  //       }
  //     },
  //   ],
  //   'img': 'assets/images/komoditi/ubikayu.png',
  //   'icon': Icons.solar_power_outlined,
  //   'id_MenuRawatan': '1'
  // },
  // {
  //   'id': 4,
  //   'namaKomoditi': 'Tembakau',
  //   'media': {
  //     'Tembakau': {
  //       'Lahan': ['10.000', '20.000'],
  //       'Pot': ['12.000', '22.000']
  //     }
  //   },
  //   'variableKetetapan': [
  //     {
  //       "Listrks": {
  //         "hasilDosis": "0",
  //       }
  //     },
  //   ],
  //   'img': 'assets/images/komoditi/tembakau.png',
  //   'icon': Icons.solar_power_outlined,
  //   'id_MenuRawatan': '1'
  // },
  // {
  //   'id': 5,
  //   'namaKomoditi': 'Kentang',
  //   'media': {
  //     'Kentang': {
  //       'Lahan': ['10.000', '20.000'],
  //       'Pot': ['12.000', '22.000']
  //     }
  //   },
  //   'variableKetetapan': [
  //     {
  //       "Listrks": {
  //         "hasilDosis": "0",
  //       }
  //     },
  //   ],
  //   'img': 'assets/images/komoditi/kentang.png',
  //   'icon': Icons.solar_power_outlined,
  //   'id_MenuRawatan': '1'
  // },
  // {
  //   'id': 6,
  //   'namaKomoditi': 'Bawang Merah',
  //   'media': {
  //     'Bawang Merah': {
  //       'Lahan': ['10.000', '20.000'],
  //       'Pot': ['12.000', '22.000']
  //     }
  //   },
  //   'variableKetetapan': [
  //     {
  //       "Listrks": {
  //         "hasilDosis": "0",
  //       }
  //     },
  //   ],
  //   'img': 'assets/images/komoditi/bawang.png',
  //   'icon': Icons.solar_power_outlined,
  //   'id_MenuRawatan': '1'
  // },
  // {
  //   'id': 7,
  //   'namaKomoditi': 'Cabai',
  //   'media': {
  //     'Cabai': {
  //       'Lahan': ['10.000', '20.000'],
  //       'Pot': ['12.000', '22.000']
  //     }
  //   },
  //   'variableKetetapan': [
  //     {
  //       "Listrks": {
  //         "hasilDosis": "0",
  //       }
  //     },
  //   ],
  //   'img': 'assets/images/komoditi/lombok.png',
  //   'icon': Icons.solar_power_outlined,
  //   'id_MenuRawatan': '1'
  // },
  // {
  //   'id': 8,
  //   'namaKomoditi': 'Anggur',
  //   'media': {
  //     'Anggur': {
  //       'Lahan': ['10.000', '20.000'],
  //       'Pot': ['12.000', '22.000']
  //     }
  //   },
  //   'variableKetetapan': [
  //     {
  //       "Listrks": {
  //         "hasilDosis": "0",
  //       }
  //     },
  //   ],
  //   'img': 'assets/images/komoditi/anggur.png',
  //   'icon': Icons.solar_power_outlined,
  //   'id_MenuRawatan': '1'
  // },
  // {
  //   'id': 9,
  //   'namaKomoditi': 'Tomat',
  //   'media': {
  //     'Tomat': {
  //       'Lahan': ['10.000', '20.000'],
  //       'Pot': ['12.000', '22.000']
  //     }
  //   },
  //   'variableKetetapan': [
  //     {
  //       "Listrks": {
  //         "hasilDosis": "0",
  //       }
  //     },
  //   ],
  //   'img': 'assets/images/komoditi/tomat.png',
  //   'icon': Icons.solar_power_outlined,
  //   'id_MenuRawatan': '1'
  // },
  // {
  //   'id': 10,
  //   'namaKomoditi': 'Mangga',
  //   'media': {
  //     'Mangga': {
  //       'Lahan': ['10.000', '20.000'],
  //       'Pot': ['12.000', '22.000']
  //     }
  //   },
  //   'variableKetetapan': [
  //     {
  //       "Listrks": {
  //         "hasilDosis": "0",
  //       }
  //     },
  //   ],
  //   'img': 'assets/images/komoditi/mangga.png',
  //   'icon': Icons.solar_power_outlined,
  //   'id_MenuRawatan': '1'
  // },
  // {
  //   'id': 11,
  //   'namaKomoditi': 'Blimbing',
  //   'media': {
  //     'Blimbing': {
  //       'Lahan': ['10.000', '20.000'],
  //       'Pot': ['12.000', '22.000']
  //     }
  //   },
  //   'variableKetetapan': [
  //     {
  //       "Listrks": {
  //         "hasilDosis": "0",
  //       }
  //     },
  //   ],
  //   'img': 'assets/images/komoditi/blimbing.png',
  //   'icon': Icons.solar_power_outlined,
  //   'id_MenuRawatan': '1'
  // },
  // {
  //   'id': 12,
  //   'namaKomoditi': 'Kakao',
  //   'media': {
  //     'Kakao': {
  //       'Lahan': ['10.000', '20.000'],
  //       'Pot': ['12.000', '22.000']
  //     }
  //   },
  //   'variableKetetapan': [
  //     {
  //       "Listrks": {
  //         "hasilDosis": "0",
  //       }
  //     },
  //   ],
  //   'img': 'assets/images/komoditi/kakao.png',
  //   'icon': Icons.solar_power_outlined,
  //   'id_MenuRawatan': '1'
  // },
  // {
  //   'id': 13,
  //   'namaKomoditi': 'Kopi',
  //   'media': {
  //     'Kopi': {
  //       'Lahan': ['10.000', '20.000'],
  //       'Pot': ['12.000', '22.000']
  //     }
  //   },
  //   'variableKetetapan': [
  //     {
  //       "Listrks": {
  //         "hasilDosis": "0",
  //       }
  //     },
  //   ],
  //   'img': 'assets/images/komoditi/kopi.png',
  //   'icon': Icons.solar_power_outlined,
  //   'id_MenuRawatan': '1'
  // },
  // {
  //   'id': 14,
  //   'namaKomoditi': 'Semangka',
  //   'media': {
  //     'Semangka': {
  //       'Lahan': ['10.000', '20.000'],
  //       'Pot': ['12.000', '22.000']
  //     }
  //   },
  //   'variableKetetapan': [
  //     {
  //       "Listrks": {
  //         "hasilDosis": "0",
  //       }
  //     },
  //   ],
  //   'img': 'assets/images/komoditi/semangka.png',
  //   'icon': Icons.solar_power_outlined,
  //   'id_MenuRawatan': '1'
  // },
  // {
  //   'id': 15,
  //   'namaKomoditi': 'Melon',
  //   'media': {
  //     'Melon': {
  //       'Lahan': ['10.000', '20.000'],
  //       'Pot': ['12.000', '22.000']
  //     }
  //   },
  //   'variableKetetapan': [
  //     {
  //       "Listrks": {
  //         "hasilDosis": "0",
  //       }
  //     },
  //   ],
  //   'img': 'assets/images/komoditi/melon.png',
  //   'icon': Icons.solar_power_outlined,
  //   'id_MenuRawatan': '1'
  // },
  // {
  //   'id': 16,
  //   'namaKomoditi': 'Terong',
  //   'media': {
  //     'Terong': {
  //       'Lahan': ['10.000', '20.000'],
  //       'Pot': ['12.000', '22.000']
  //     }
  //   },
  //   'variableKetetapan': [
  //     {
  //       "Listrks": {
  //         "hasilDosis": "0",
  //       }
  //     },
  //   ],
  //   'img': 'assets/images/komoditi/terong.png',
  //   'icon': Icons.solar_power_outlined,
  //   'id_MenuRawatan': '1'
  // },
  // {
  //   'id': 17,
  //   'namaKomoditi': 'Wortel',
  //   'media': {
  //     'Wortel': {
  //       'Lahan': ['10.000', '20.000'],
  //       'Pot': ['12.000', '22.000']
  //     }
  //   },
  //   'variableKetetapan': [
  //     {
  //       "Listrks": {
  //         "hasilDosis": "0",
  //       }
  //     },
  //   ],
  //   'img': 'assets/images/komoditi/wortel.png',
  //   'icon': Icons.solar_power_outlined,
  //   'id_MenuRawatan': '1'
  // },
  // {
  //   'id': 18,
  //   'namaKomoditi': 'Kubis',
  //   'media': {
  //     'Kubis': {
  //       'Lahan': ['10.000', '20.000'],
  //       'Pot': ['12.000', '22.000']
  //     }
  //   },
  //   'variableKetetapan': [
  //     {
  //       "Listrks": {
  //         "hasilDosis": "0",
  //       }
  //     },
  //   ],
  //   'img': 'assets/images/komoditi/kubis.png',
  //   'icon': Icons.solar_power_outlined,
  //   'id_MenuRawatan': '1'
  // },
  // {
  //   'id': 19,
  //   'namaKomoditi': 'Sawi',
  //   'media': {
  //     'Sawi': {
  //       'Lahan': ['10.000', '20.000'],
  //       'Pot': ['12.000', '22.000']
  //     }
  //   },
  //   'variableKetetapan': [
  //     {
  //       "Listrks": {
  //         "hasilDosis": "0",
  //       }
  //     },
  //   ],
  //   'img': 'assets/images/komoditi/sawi.png',
  //   'icon': Icons.solar_power_outlined,
  //   'id_MenuRawatan': '1'
  // },
  // {
  //   'id': 20,
  //   'namaKomoditi': 'Mentimun',
  //   'media': {
  //     'Mentimun': {
  //       'Lahan': ['10.000', '20.000'],
  //       'Pot': ['12.000', '22.000']
  //     }
  //   },
  //   'variableKetetapan': [
  //     {
  //       "Listrks": {
  //         "hasilDosis": "0",
  //       }
  //     },
  //   ],
  //   'img': 'assets/images/komoditi/mentimun.png',
  //   'icon': Icons.solar_power_outlined,
  //   'id_MenuRawatan': '1'
  // },
  // {
  //   'id': 21,
  //   'namaKomoditi': 'Jeruk',
  //   'media': {
  //     'Jeruk': {
  //       'Lahan': ['10.000', '20.000'],
  //       'Pot': ['12.000', '22.000']
  //     }
  //   },
  //   'variableKetetapan': [
  //     {
  //       "Listrks": {
  //         "hasilDosis": "0",
  //       }
  //     },
  //   ],
  //   'img': 'assets/images/komoditi/jeruk.png',
  //   'icon': Icons.solar_power_outlined,
  //   'id_MenuRawatan': '1'
  // },
  // {
  //   'id': 22,
  //   'namaKomoditi': 'Nanas',
  //   'media': {
  //     'Nanas': {
  //       'Lahan': ['10.000', '20.000'],
  //       'Pot': ['12.000', '22.000']
  //     }
  //   },
  //   'variableKetetapan': [
  //     {
  //       "Listrks": {
  //         "hasilDosis": "0",
  //       }
  //     },
  //   ],
  //   'img': 'assets/images/komoditi/nanas.png',
  //   'icon': Icons.solar_power_outlined,
  //   'id_MenuRawatan': '1'
  // },
  // {
  //   'id': 23,
  //   'namaKomoditi': 'Manggis',
  //   'media': {
  //     'Manggis': {
  //       'Lahan': ['10.000', '20.000'],
  //       'Pot': ['12.000', '22.000']
  //     }
  //   },
  //   'variableKetetapan': [
  //     {
  //       "Listrks": {
  //         "hasilDosis": "0",
  //       }
  //     },
  //   ],
  //   'img': 'assets/images/komoditi/manggis.png',
  //   'icon': Icons.solar_power_outlined,
  //   'id_MenuRawatan': '1'
  // },
  // {
  //   'id': 24,
  //   'namaKomoditi': 'Pisang',
  //   'media': {
  //     'Pisang': {
  //       'Lahan': ['10.000', '20.000'],
  //       'Pot': ['12.000', '22.000']
  //     }
  //   },
  //   'variableKetetapan': [
  //     {
  //       "Listrks": {
  //         "hasilDosis": "0",
  //       }
  //     },
  //   ],
  //   'img': 'assets/images/komoditi/pisang.png',
  //   'icon': Icons.solar_power_outlined,
  //   'id_MenuRawatan': '1'
  // },
  // {
  //   'id': 25,
  //   'namaKomoditi': 'Selada',
  //   'media': {
  //     'Selada': {
  //       'Lahan': ['10.000', '20.000'],
  //       'Pot': ['12.000', '22.000']
  //     }
  //   },
  //   'variableKetetapan': [
  //     {
  //       "Listrks": {
  //         "hasilDosis": "0",
  //       }
  //     },
  //   ],
  //   'img': 'assets/images/komoditi/selada.png',
  //   'icon': Icons.solar_power_outlined,
  //   'id_MenuRawatan': '1'
  // },
  // {
  //   'id': 26,
  //   'namaKomoditi': 'Kangkung',
  //   'media': {
  //     'Kangkung': {
  //       'Lahan': ['10.000', '20.000'],
  //       'Pot': ['12.000', '22.000']
  //     }
  //   },
  //   'variableKetetapan': [
  //     {
  //       "Listrks": {
  //         "hasilDosis": "0",
  //       }
  //     },
  //   ],
  //   'img': 'assets/images/komoditi/kangkung.png',
  //   'icon': Icons.solar_power_outlined,
  //   'id_MenuRawatan': '1'
  // },
  // {
  //   'id': 27,
  //   'namaKomoditi': 'Bunga Kol',
  //   'media': {
  //     'Bunga Kol': {
  //       'Lahan': ['10.000', '20.000'],
  //       'Pot': ['12.000', '22.000']
  //     }
  //   },
  //   'variableKetetapan': [
  //     {
  //       "Listrks": {
  //         "hasilDosis": "0",
  //       }
  //     },
  //   ],
  //   'img': 'assets/images/komoditi/kubisbunga.png',
  //   'icon': Icons.solar_power_outlined,
  //   'id_MenuRawatan': '1'
  // },
  // {
  //   'id': 28,
  //   'namaKomoditi': 'Brokoli',
  //   'media': {
  //     'Brokoli': {
  //       'Lahan': ['10.000', '20.000'],
  //       'Pot': ['12.000', '22.000']
  //     }
  //   },
  //   'variableKetetapan': [
  //     {
  //       "Listrks": {
  //         "hasilDosis": "0",
  //       }
  //     },
  //   ],
  //   'img': 'assets/images/komoditi/brokoli.png',
  //   'icon': Icons.solar_power_outlined,
  //   'id_MenuRawatan': '1'
  // },
  // {
  //   'id': 29,
  //   'namaKomoditi': 'Bawang Daun',
  //   'media': {
  //     'Bawang Daun': {
  //       'Lahan': ['10.000', '20.000'],
  //       'Pot': ['12.000', '22.000']
  //     }
  //   },
  //   'variableKetetapan': [
  //     {
  //       "Listrks": {
  //         "hasilDosis": "0",
  //       }
  //     },
  //   ],
  //   'img': 'assets/images/komoditi/bawang.png',
  //   'icon': Icons.solar_power_outlined,
  //   'id_MenuRawatan': '1'
  // },
  // {
  //   'id': 30,
  //   'namaKomoditi': 'Tebu',
  //   'media': {
  //     'Tebu': {
  //       'Lahan': ['10.000', '20.000'],
  //       'Pot': ['12.000', '22.000']
  //     }
  //   },
  //   'variableKetetapan': [
  //     {
  //       "Listrks": {
  //         "hasilDosis": "0",
  //       }
  //     },
  //   ],
  //   'img': 'assets/images/komoditi/tebu.png',
  //   'icon': Icons.solar_power_outlined,
  //   'id_MenuRawatan': '1'
  // },
  // {
  //   'id': 31,
  //   'namaKomoditi': 'Kacang Tanah',
  //   'media': {
  //     'Kacang Tanah': {
  //       'Lahan': ['10.000', '20.000'],
  //       'Pot': ['12.000', '22.000']
  //     }
  //   },
  //   'variableKetetapan': [
  //     {
  //       "Listrks": {
  //         "hasilDosis": "0",
  //       }
  //     },
  //   ],
  //   'img': 'assets/images/komoditi/buncis.png',
  //   'icon': Icons.solar_power_outlined,
  //   'id_MenuRawatan': '1'
  // },
  // {
  //   'id': 32,
  //   'namaKomoditi': 'Bawang Putih',
  //   'media': {
  //     'Bawang Putih': {
  //       'Lahan': ['10.000', '20.000'],
  //       'Pot': ['12.000', '22.000']
  //     }
  //   },
  //   'variableKetetapan': [
  //     {
  //       "Listrks": {
  //         "hasilDosis": "0",
  //       }
  //     },
  //   ],
  //   'img': 'assets/images/komoditi/bawangputih.png',
  //   'icon': Icons.solar_power_outlined,
  //   'id_MenuRawatan': '1'
  // },
  // {
  //   'id': 33,
  //   'namaKomoditi': 'Ubi Jalar',
  //   'media': {
  //     'Ubi Jalar': {
  //       'Lahan': ['10.000', '20.000'],
  //       'Pot': ['12.000', '22.000']
  //     }
  //   },
  //   'variableKetetapan': [
  //     {
  //       "Listrks": {
  //         "hasilDosis": "0",
  //       }
  //     },
  //   ],
  //   'img': 'assets/images/komoditi/ubijalar.png',
  //   'icon': Icons.solar_power_outlined,
  //   'id_MenuRawatan': '1'
  // },
  // {
  //   'id': 34,
  //   'namaKomoditi': 'Kacang Panjang',
  //   'media': {
  //     'Kacang Panjang': {
  //       'Lahan': ['10.000', '20.000'],
  //       'Pot': ['12.000', '22.000']
  //     }
  //   },
  //   'variableKetetapan': [
  //     {
  //       "Listrks": {
  //         "hasilDosis": "0",
  //       }
  //     },
  //   ],
  //   'img': 'assets/images/komoditi/kacangpanjang.png',
  //   'icon': Icons.solar_power_outlined,
  //   'id_MenuRawatan': '1'
  // },
  // {
  //   'id': 35,
  //   'namaKomoditi': 'Apel *)',
  //   'media': {
  //     'Apel *)': {
  //       'Lahan': ['10.000', '20.000'],
  //       'Pot': ['12.000', '22.000']
  //     }
  //   },
  //   'variableKetetapan': [
  //     {
  //       "Listrks": {
  //         "hasilDosis": "0",
  //       }
  //     },
  //   ],
  //   'img': 'assets/images/komoditi/apel.png',
  //   'icon': Icons.solar_power_outlined,
  //   'id_MenuRawatan': '1'
  // },
  // {
  //   'id': 36,
  //   'namaKomoditi': 'Kelapa Sawit',
  //   'media': {
  //     'Kelapa Sawit': {
  //       'Lahan': ['10.000', '20.000'],
  //       'Pot': ['12.000', '22.000']
  //     }
  //   },
  //   'variableKetetapan': [
  //     {
  //       "Listrks": {
  //         "hasilDosis": "0",
  //       }
  //     },
  //   ],
  //   'img': 'assets/images/komoditi/kelapasawit.png',
  //   'icon': Icons.solar_power_outlined,
  //   'id_MenuRawatan': '1'
  // },
  // {
  //   'id': 37,
  //   'namaKomoditi': 'Lada',
  //   'media': {
  //     'Lada': {
  //       'Lahan': ['10.000', '20.000'],
  //       'Pot': ['12.000', '22.000']
  //     }
  //   },
  //   'variableKetetapan': [
  //     {
  //       "Listrks": {
  //         "hasilDosis": "0",
  //       }
  //     },
  //   ],
  //   'img': 'assets/images/komoditi/lada.png',
  //   'icon': Icons.solar_power_outlined,
  //   'id_MenuRawatan': '1'
  // },
  // {
  //   'id': 38,
  //   'namaKomoditi': 'Cengkeh',
  //   'media': {
  //     'Cengkeh': {
  //       'Lahan': ['10.000', '20.000'],
  //       'Pot': ['12.000', '22.000']
  //     }
  //   },
  //   'variableKetetapan': [
  //     {
  //       "Listrks": {
  //         "hasilDosis": "0",
  //       }
  //     },
  //   ],
  //   'img': 'assets/images/komoditi/cengkeh.png',
  //   'icon': Icons.solar_power_outlined,
  //   'id_MenuRawatan': '1'
  // },
  // {
  //   'id': 39,
  //   'namaKomoditi': 'Buncis',
  //   'media': {
  //     'Buncis': {
  //       'Lahan': ['10.000', '20.000'],
  //       'Pot': ['12.000', '22.000']
  //     }
  //   },
  //   'variableKetetapan': [
  //     {
  //       "Bensins": {
  //         "hasilDosis": "01234",
  //       }
  //     },
  //   ],
  //   'img': 'assets/images/komoditi/buncis.png',
  //   'icon': Icons.solar_power_outlined,
  //   'id_MenuRawatan': '1'
  // },
  {
    'id': 40,
    'namaKomoditi': 'Kendaraan',
    'media': {
      'Bensin': {
        'pertamax': ['10.000', '20.000'],
        'premium': ['12.000', '22.000']
      }
    },
    'variableKetetapan': [
      {
        "Bensins": {
          "hasilDosis": "0",
        }
      },
    ],
    'img': 'assets/images/komoditi/padi.png',
    'icon': Icons.oil_barrel,
    'id_MenuRawatan': '0'
  },
  // {
  //   'id': 41,
  //   'namaKomoditi': 'Diesel',
  //   'media': {
  //     'Diesel': {
  //       'pertamax': ['10.000', '20.000'],
  //       'premium': ['12.000', '22.000']
  //     }
  //   },
  //   'variableKetetapan': [
  //     {
  //       "Diesels": {
  //         "hasilDosis": "0",
  //       }
  //     },
  //   ],
  //   'img': 'assets/images/komoditi/jagung.png',
  //   'icon': Icons.solar_power_outlined,
  //   'id_MenuRawatan': '0'
  // },
  // {
  //   'id': 42,
  //   'namaKomoditi': 'Kolam',
  //   'media': {
  //     'Kolam': {
  //       'pertamax': ['10.000', '20.000'],
  //       'premium': ['12.000', '22.000']
  //     }
  //   },
  //   'variableKetetapan': [
  //     {
  //       "Listrks": {
  //         "hasilDosis": "0",
  //       }
  //     },
  //   ],
  //   'img': 'assets/images/komoditi/jagung.png',
  //   'icon': '0xf718',
  //   'id_MenuRawatan': '0'
  // },
  {
    'id': 43,
    'namaKomoditi': 'Panel Surya',
    'media': {
      'Rumah Tangga': {
        'Rumah_bagian_utama': [
          'ruang tamu',
          'ruang keluarga',
          'kamar tidur utama',
          'kamar anak'
        ],
        'dapur': ['dapur utama', 'ruang makan'],
        'kamar_mandi': ['kamar mandi utama', 'kamar mandi tamu'],
        'lainnya': ['garasi', 'teras', 'taman']
      },
    },
    'variableKetetapan': [
      {
        "Pelanggan rumah tangga": {
          "daya 450 VA (Volt Ampere) bersubsidi": "415",
          "daya 900 VA bersubsidi": "605",
          "daya 900 VA RTM (Rumah Tangga Mampu)": "1352",
          "daya 1300 VA": "1444.70",
          "daya 2200 VA": "1444.70",
          "daya 3500 ke atas": "1699.53"
        }
      }
    ],
    'img': 'assets/images/komoditi/padi.png',
    'icon': Icons.solar_power_outlined,
    'id_MenuRawatan': '2'
  },
  {
    'id': 44,
    'namaKomoditi': 'Ikan',
    'media': {
      'Ikan': {
        'Pot': ['12.000', '22.000']
      }
    },
    'variableKetetapan': [
      {
        "Bensins": {
          "hasilDosis": "01234",
        }
      },
    ],
    'img': 'assets/images/komoditi/buncis.png',
    'icon': Icons.solar_power_outlined,
    'id_MenuRawatan': '3'
  },
  {
    'id': 45,
    'namaKomoditi': 'Maggot',
    'media': {
      'Maggot': {
        'Pot': ['12.000', '22.000']
      }
    },
    'variableKetetapan': [
      {
        "Bensins": {
          "hasilDosis": "01234",
        }
      },
    ],
    'img': 'assets/images/komoditi/buncis.png',
    'icon': Icons.solar_power_outlined,
    'id_MenuRawatan': '4'
  },
  {
    'id': 46,
    'namaKomoditi': 'Ayam',
    'media': {
      'Ayam': {
        'Kandang': ['12.000', '22.000']
      }
    },
    'variableKetetapan': [
      {
        "Bensins": {
          "hasilDosis": "01234",
        }
      },
    ],
    'img': 'assets/images/komoditi/buncis.png',
    'icon': Icons.solar_power_outlined,
    'id_MenuRawatan': '5'
  },

  // {
  //   'id': 44,
  //   'namaKomoditi': 'Kolam Bisnis',
  //   'media': {
  //     'Bisnis': {
  //       'Bisnis_bagian_utama': [
  //         'ruang tamu',
  //         'ruang keluarga',
  //         'kamar tidur utama',
  //         'kamar anak'
  //       ],
  //       'dapur': ['dapur utama', 'ruang makan'],
  //       'kamar_mandi': ['kamar mandi utama', 'kamar mandi tamu'],
  //       'lainnya': ['garasi', 'teras', 'taman']
  //     },
  //   },
  //   'variableKetetapan': [
  //     {
  //       "Bisnis": {
  //         "Golongan B-2/Tegangan Rendah (TR) daya 6600 VA-200 kVA": "1444.70",
  //         "Golongan B-3/Tegangan Menengah (TM) daya di atas 200 kVA": "1114.74"
  //       }
  //     }
  //   ],
  //   'img': 'assets/images/komoditi/jagung.png',
  //   'icon': '0xe11b',
  //   'id_MenuRawatan': '2'
  // },
  // {
  //   'id': 45,
  //   'namaKomoditi': 'Kolam Industri',
  //   'media': {
  //     'Industri': {
  //       'Industri_bagian_utama': [
  //         'ruang tamu',
  //         'ruang keluarga',
  //         'kamar tidur utama',
  //         'kamar anak'
  //       ],
  //       'dapur': ['dapur utama', 'ruang makan'],
  //       'kamar_mandi': ['kamar mandi utama', 'kamar mandi tamu'],
  //       'lainnya': ['garasi', 'teras', 'taman']
  //     },
  //   },
  //   'variableKetetapan': [
  //     {
  //       "Industri": {
  //         "Golongan I-3/TM daya di atas 200 kVA": "1114.74",
  //         "Golongan I-4/Tegangan Tinggi (TT) daya 30000 kVA ke atas": "996.74"
  //       }
  //     },
  //   ],
  //   'img': 'assets/images/komoditi/jagung.png',
  //   'icon': '0xf04fd',
  //   'id_MenuRawatan': '2'
  // }
];

// IconData icons(String sa) {
//   return IconData(int.tryParse(sa)!, fontFamily: 'MaterialIcons');
// }

IconData icons(String sa) {
  int value = int.tryParse(sa) ??
      int.tryParse(
          '0xf04fd')!; // Default value 0 jika int.tryParse mengembalikan null
  return IconData(value, fontFamily: 'MaterialIcons');
}

class KategorisubMenuRawatan {
  int id;
  String namaKomoditi;
  String img;
  String id_MenuRawatan;
  dynamic _iconRaw;
  IconData get icon {
    final v = _iconRaw;
    if (v is IconData) return v;
    if (v is int) return IconData(v, fontFamily: 'MaterialIcons');
    if (v is String) {
      final s = v.toLowerCase();
      final hex = s.startsWith('0x') ? s.substring(2) : s;
      final cp = int.tryParse(hex, radix: 16);
      if (cp != null) return IconData(cp, fontFamily: 'MaterialIcons');
      final maybeInt = int.tryParse(v);
      if (maybeInt != null)
        return IconData(maybeInt, fontFamily: 'MaterialIcons');
    }
    return Icons.help_outline;
  }

  List<Map<String, dynamic>> variableKetetapan;
  Map<String, dynamic> media;

  KategorisubMenuRawatan(
      {required this.id,
      required this.namaKomoditi,
      required this.img,
      required this.id_MenuRawatan,
      required dynamic icon,
      required this.media,
      required this.variableKetetapan})
      : _iconRaw = icon;

  KategorisubMenuRawatan.fromJson(Map json)
      : id = json["id"],
        namaKomoditi = json["namaKomoditi"],
        img = json["img"],
        id_MenuRawatan = json["id_MenuRawatan"],
        _iconRaw = json["icon"],
        media = json["media"],
        variableKetetapan = json["variableKetetapan"];

  static List<KategorisubMenuRawatan> decodew(List<dynamic> listData) {
    return (listData).map<KategorisubMenuRawatan>((item) {
      // print("kolah ${item["id"]}");
      // print("kolah ${item["namaKomoditi"]}");
      // print("kolah ${item["id_MenuRawatan"]}");
      // print("kolah ${item["icon"]}");
      // print("kolah ${item["img"]}");
      return KategorisubMenuRawatan.fromJson(item);
    }).toList();
  }
}

List<KategorisubMenuRawatan> datakategorisubMenuRawatan = [
  for (var i = 0; i < kategorisubMenuRawatan.length; i++)
    KategorisubMenuRawatan(
        id: i,
        namaKomoditi: kategorisubMenuRawatan[i]["namaKomoditi"],
        img: kategorisubMenuRawatan[i]["img"],
        id_MenuRawatan: kategorisubMenuRawatan[i]["id_MenuRawatan"],
        icon: kategorisubMenuRawatan[i]["icon"],
        media: kategorisubMenuRawatan[i]["media"],
        variableKetetapan: kategorisubMenuRawatan[i]["variableKetetapan"])
];

//
// List kategoriJenisMesin= [
//   {"id": 0, "namaKomoditi": "Bensin", "img": "assets/images/komoditi/padi.png"},
//   {
//     "id": 1,
//     "namaKomoditi": "Diesel",
//     "img": "assets/images/komoditi/jagung.png"
//   },
//   {
//     "id": 2,
//     "namaKomoditi": "Kolam",
//     "img": "assets/images/komoditi/jagung.png"
//   },
//   ];
//
// class KategoriJenisMesin{
//   int id;
//   String namaKomoditi;
//   String img;
//   KategoriJenisMesin({
//     required this.id,
//     required this.namaKomoditi,
//     required this.img,
//   });
// }
//
// List<KategoriJenisMesin> dataKategoriJenisMesin= [
//   for (var i = 0; i < kategoriJenisMesin.length; i++)
//     KategoriJenisMesin(
//       id: i,
//       namaKomoditi: kategoriJenisMesin[i]["namaKomoditi"],
//       img: kategoriJenisMesin[i]["img"],
//     )
// ];
