// // import 'package:geocoder/geocoder.dart';
// import 'package:geocoding/geocoding.dart';
// import 'package:geolocator/geolocator.dart';
//
// class LokasiServices {
//   Future<String> getCoordinate() async {
//     Position posisi = await Geolocator.getCurrentPosition(
//         desiredAccuracy: LocationAccuracy.low);
//     print("${posisi.latitude}: ${posisi.longitude}");
//     List<Placemark> placemark =
//         await placemarkFromCoordinates(posisi.latitude, posisi.longitude);
//     // final coordinate = new Coordinates(posisi.latitude, posisi.longitude);
//     // var address = await Geocoder.local.findAddressesFromCoordinates(coordinate);
//     // var alamat = address.first;
//     // print(placemark[0].country);
//     // print(placemark[0].name);
//     // print(placemark[0].street);
//     // print(placemark[0].postalCode);
//     // print(placemark[0]);
//     // return alamat.addressLine;
//     return placemark[0].administrativeArea;
//   }
// }
//
// // Future<void> getLocation() async {
// //     List<Placemark> placemark = await placemarkFromCoordinates(UserLocation.lat, UserLocation.long);
//
// //     print(placemark[0].country);
// //     print(placemark[0].name);
// //     print(placemark[0].street);
// //     print(placemark[0].postalCode);
//
// //     setState(() {
// //       country = placemark[0].country!;
// //       name = placemark[0].name!;
// //       street = placemark[0].street!;
// //       postalCode = placemark[0].postalCode!;
// //     });
// //   }
