import 'dart:async';
import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../convert/component/inisialisasi_var.dart';

Map ContorCountdown = {
  "start": true,
  "stop": false,
  "reset": false,
};

class CountDowns extends StatefulWidget {
  const CountDowns({super.key, required this.col});
  final Color col;
  @override
  State<CountDowns> createState() => _CountDownsState();
}

class _CountDownsState extends State<CountDowns> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    String timeea = "";

    try {
      String Waktu = downku;
      String bss = Waktu.replaceAll("'", '"');
      timeea = Waktu;
      // print("sss ${timeea}");
    } catch (e) {
      String Waktu = "2023-10-10 00:00:00.000";
      String bss = Waktu.replaceAll("'", '"');
      timeea = "2012-02-27 13:27:00,123456789z";
      // print("saa ${timeea} ${e}");
      // print(downku);
    }
    // String timeea = ds(json.decode(bss));

    _startTimer(DateTime.parse(timeea));
  }

  void _startTimer(DateTime dates) {
    Duration timeUntilDue = dates.difference(DateTime.now());
    int daysUntil = timeUntilDue.inDays;
    dats.hari = (daysUntil < 0) ? "0" : daysUntil.toString();
    int hoursUntil = timeUntilDue.inHours - (daysUntil * 24);
    dats.jam = (hoursUntil < 0) ? "0" : hoursUntil.toString();
    int minUntil =
        timeUntilDue.inMinutes - (daysUntil * 24 * 60) - (hoursUntil * 60);
    dats.menit = (minUntil < 0) ? "0" : minUntil.toString();
    int secUntil = timeUntilDue.inSeconds -
        (daysUntil * 24 * 60 * 60) -
        (hoursUntil * 60 * 60) -
        (minUntil * 60);

    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (mounted) {
        // Periksa apakah widget masih terpasang
        setState(() {
          if (dats.hari == '0' &&
              dats.jam == '0' &&
              dats.menit == '0' &&
              dats.detik == '0') {
            _timer?.cancel();
            // dispose();
            // Hentikan timer jika waktu habis.
          } else {
            _timeUntil = OurTimeleft().timeLeft(dates);
          }
        });
      } else {
        _timer?.cancel();
        // dispose(); // Hentikan timer jika widget tidak lagi terpasang
      }
    });
  }

  List<String>? _timeUntil = ["Loading..", "2"];

  // @override
  // void initState() {
  //   super.initState();
  //
  //
  //   print("${dats.jam.toString()} stop");
  // }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AutoSizeText(
          "${dats.hari} Hari",
          style: TextStyle(
              color: widget.col, fontWeight: FontWeight.w900, fontSize: 18),
          minFontSize: 2,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: AutoSizeText(
                " ${dats.jam} : ${dats.menit} : ${dats.detik}",
                style: TextStyle(
                    color: widget.col,
                    fontWeight: FontWeight.w900,
                    fontSize: 18),
                minFontSize: 2,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class OurTimeleft {
  List<String> timeLeft(DateTime due) {
    List<String>? retval = [];

    Duration timeUntilDue = due.difference(DateTime.now());
    int daysUntil = timeUntilDue.inDays;
    dats.hari = (daysUntil < 0) ? "0" : daysUntil.toString();
    int hoursUntil = timeUntilDue.inHours - (daysUntil * 24);
    dats.jam = (hoursUntil < 0) ? "0" : hoursUntil.toString();
    int minUntil =
        timeUntilDue.inMinutes - (daysUntil * 24 * 60) - (hoursUntil * 60);
    dats.menit = (minUntil < 0) ? "0" : minUntil.toString();
    int secUntil = timeUntilDue.inSeconds -
        (daysUntil * 24 * 60 * 60) -
        (hoursUntil * 60 * 60) -
        (minUntil * 60);
    dats.detik = (secUntil < 0) ? "0" : secUntil.toString();
    // retval[0] = _daysUntil.toString();
    String dos = "";
    dos =
        "${daysUntil.toString()}:${hoursUntil.toString()} : ${minUntil.toString()} : ${secUntil.toString()}";

    retval = [dos, "a2"];
    return retval;
  }
}

class DatasTime {
  String? hari;
  String? jam;
  String? menit;
  String? detik;

  DatasTime({
    @required this.hari,
    @required this.jam,
    @required this.menit,
    @required this.detik,
  });
}

DatasTime dats = DatasTime();
