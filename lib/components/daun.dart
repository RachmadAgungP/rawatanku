import 'package:flutter/material.dart';

class Daun extends StatelessWidget {
  final bool number;
  const Daun({super.key, required this.i, required this.number});

  final int i;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 30,
      child: Stack(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                height: 15,
                width: 10,
                decoration: BoxDecoration(
                  color: Colors.green.shade400,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(6),
                      bottomRight: Radius.circular(0),
                      topLeft: Radius.circular(0),
                      topRight: Radius.circular(6)),
                  // border:
                  //     Border.all(color: kTextColor.withOpacity(.8), width: .2)
                  // boxShadow: [
                  //   BoxShadow(
                  //       blurRadius: 5,
                  //       offset: Offset(-1, 8),
                  //       color: Colors.black54.withOpacity(.2))
                  // ]
                ),
              ),
              Container(
                height: 20,
                width: 20,
                decoration: BoxDecoration(
                  color: Colors.green.shade400,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(0),
                      bottomRight: Radius.circular(10),
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(0)),
                  // border:
                  //     Border.all(color: kTextColor.withOpacity(.8), width: .2)
                  // boxShadow: [
                  //   BoxShadow(
                  //       blurRadius: 5,
                  //       offset: Offset(-1, 8),
                  //       color: Colors.black54.withOpacity(.2))
                  // ]
                ),
                child: Center(
                  child: Text(
                    (number == true) ? "$i." : "",
                    textAlign: TextAlign.justify,
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
