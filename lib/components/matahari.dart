import 'package:rawatt/model/MenuRawatan/mdl_MenuRawatan.dart';
import 'package:rawatt/size_config.dart';
import 'package:flutter/material.dart';
import '../constants.dart';
import '../screens/convert/component/inisialisasi_var.dart';
import 'circle_blur_painter.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class Matahari extends StatelessWidget {
  const Matahari({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Stack(
        children: [
          Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                color: c.palette.value[0].withOpacity(.4),
                // Colors.yellowAccent,
                borderRadius: BorderRadius.all(Radius.circular(36)),
              )),
          Positioned(
            bottom: 15,
            right: 15,
            child: SizedBox(
              height: 30,
              width: 30,
              child: CustomPaint(
                  foregroundPainter:
                      CircleBlurPainter(circleWidth: 25, blurSigma: 10.0)),
            ),
          ),
        ],
      );
    });
  }
}
