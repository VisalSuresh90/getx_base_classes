import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  final Widget mobile;
  final Widget? mobileLandscape;
  final Widget tablet;
  final Widget? tabletLandscape;
  final Widget desktop;

  const Responsive({
    Key? key,
    required this.mobile,
    required this.tablet,
    required this.desktop,
    this.mobileLandscape,
    this.tabletLandscape,
  }) : super(key: key);

  static const double mobileWidth = 650;
  static const double mobileLandScapeWidth = 900;
  static const double tabWidth = 1100;
  static const double tabLandScapeWidth = 1200;

  static bool isMobile(BuildContext context) {
    return MediaQuery.of(context).size.width < mobileWidth;
  }

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width < tabWidth &&
      MediaQuery.of(context).size.width >= mobileWidth;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= tabWidth;

  static DisplayScreenType getScreenType(BuildContext context) {
    bool isPortrait =
        (MediaQuery.of(context).orientation == Orientation.portrait);
    double width = MediaQuery.of(context).size.width;
    if (isPortrait) {
      if (width >= tabWidth) {
        return DisplayScreenType.DESKTOP;
      } else if (width >= mobileWidth) {
        return DisplayScreenType.TAB;
      } else {
        return DisplayScreenType.MOBILE;
      }
    } else {
      if (width >= tabLandScapeWidth) {
        return DisplayScreenType.DESKTOP;
      } else if (width >= mobileLandScapeWidth) {
        return DisplayScreenType.TAB;
      } else {
        return DisplayScreenType.MOBILE;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isPortrait =
            (MediaQuery.of(context).orientation == Orientation.portrait);
        double width = constraints.maxWidth;
        debugPrint('LayoutBuilder isPortrait:$isPortrait width $width');
        if (isPortrait) {
          if (width >= tabWidth) {
            return desktop;
          } else if (width >= mobileWidth) {
            return tablet;
          } else {
            return mobile;
          }
        } else {
          if (width >= tabLandScapeWidth) {
            return desktop;
          } else if (width >= mobileLandScapeWidth) {
            return tabletLandscape ?? tablet;
          } else {
            return mobileLandscape ?? mobile;
          }
        }
      },
    );
  }
}

enum DisplayScreenType { MOBILE, MOBILE_LANDSCAPE, TAB, TAB_LANDSCAPE, DESKTOP }
