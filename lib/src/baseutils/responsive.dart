// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

/// A widget that adjusts its child based on the screen size and orientation.
class Responsive extends StatelessWidget {
  final Widget mobile;
  final Widget? mobileLandscape;
  final Widget tablet;
  final Widget? tabletLandscape;
  final Widget desktop;

  /// Constructs a [Responsive] widget with specified layouts for different screen sizes.
  ///
  /// [mobile]: The layout for small mobile screens.
  /// [mobileLandscape]: The layout for small mobile screens in landscape orientation.
  /// [tablet]: The layout for tablets.
  /// [tabletLandscape]: The layout for tablets in landscape orientation.
  /// [desktop]: The layout for desktop screens.
  const Responsive({
    Key? key,
    required this.mobile,
    required this.tablet,
    required this.desktop,
    this.mobileLandscape,
    this.tabletLandscape,
  }) : super(key: key);

  /// The width threshold for identifying a mobile screen.
  static const double mobileWidth = 650;

  /// The width threshold for identifying a mobile screen in landscape orientation.
  static const double mobileLandScapeWidth = 900;

  /// The width threshold for identifying a tablet screen.
  static const double tabWidth = 1100;

  /// The width threshold for identifying a tablet screen in landscape orientation.
  static const double tabLandScapeWidth = 1200;

  /// Checks if the screen is a mobile screen.
  static bool isMobile(BuildContext context) {
    return MediaQuery.of(context).size.width < mobileWidth;
  }

  /// Checks if the screen is a tablet screen.
  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width < tabWidth &&
      MediaQuery.of(context).size.width >= mobileWidth;

  /// Checks if the screen is a desktop screen.
  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= tabWidth;

  /// Retrieves the [DisplayScreenType] based on the current screen size and orientation.
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
        return DisplayScreenType.TAB_LANDSCAPE;
      } else {
        return DisplayScreenType.MOBILE_LANDSCAPE;
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

/// Enumeration representing different display screen types.
enum DisplayScreenType { MOBILE, MOBILE_LANDSCAPE, TAB, TAB_LANDSCAPE, DESKTOP }
