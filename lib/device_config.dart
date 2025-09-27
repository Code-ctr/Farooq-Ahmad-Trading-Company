import 'package:flutter/material.dart';

class DeviceConfig {
  static late bool isMobile;
  static late bool isDesktop;

  static void init(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    if (width < 600) {
      isMobile = true;
      isDesktop = false;
    } else {
      isMobile = false;
      isDesktop = true;
    }
  }
}
