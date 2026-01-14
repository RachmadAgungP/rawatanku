import 'package:rawatt/constants.dart';
import 'package:flutter/material.dart';

class PupukRating extends StatelessWidget {
  final double score;
  final Color tema;
  const PupukRating({
    super.key,
    required this.score,
    required this.tema,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20,
      width: 45,
      // padding: EdgeInsets.symmetric(
      //     vertical: defaultPadding / 2, horizontal: defaultPadding / 2),
      // decoration: BoxDecoration(
      //     color: Colors.white,
      //     borderRadius: BorderRadius.circular(16),
      //     boxShadow: [
      //       BoxShadow(
      //         offset: Offset(-7, 7),
      //         blurRadius: 20,
      //         color: Colors.black.withOpacity(.2),
      //       )
      //     ]),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            Icons.star,
            color: Colors.orangeAccent,
            size: 20,
          ),
          Text(
            "$score",
            style: TextStyle(
              color: tema,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}
