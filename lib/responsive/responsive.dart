import 'package:flutter/material.dart';

import '../constant/size.dart';

class Responsive extends StatelessWidget {
  final Widget? tablet;
  final Widget? deskTop;
  final Widget? mobile;

  const Responsive({
    Key? key,
    this.tablet,
    this.deskTop,
    this.mobile,
  }) : super(key: key);

  static bool isDesktop(context) =>
      MediaQuery.of(context).size.width > kTabletSize;

  static bool isTablet(context) =>
      MediaQuery.of(context).size.width > kMobileSize;

  static bool isMobile(context) =>
      MediaQuery.of(context).size.width <= kMobileSize;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (_, consTraint) {
      if (consTraint.maxWidth > kTabletSize) {
        return deskTop!;
      } else if (consTraint.maxWidth > kMobileSize) {
        return tablet!;
      } else {
        return mobile!;
      }
    });
  }
}
