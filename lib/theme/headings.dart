import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rainbow_challenge/theme/colors.dart';
import 'package:rainbow_challenge/theme/fonts.dart' as ThemeFonts;

// TO DO: make headings easy to use in various cases.
// Maybe we should use Theme.of() instead? I am not sure what it better.

// This file contains a handful of TextStyle widgets to create styles for
// headings that can be reused in various places of the app.
// PROBLEMS: ThemeColors.colorName.withOpacity() is not working. Don't know
// why yet.

class ThemeHeadings {
  // A big big heading that is used in WelcomePage()
  static const mainTitle = TextStyle(
      fontSize: 90.0,
      fontFamily: ThemeFonts.primaryFontFamily,
      fontStyle: FontStyle.italic,
      fontWeight: FontWeight.w600,
      color: ThemeColors.primaryColor,
      height: 0.8,
      shadows: [
        Shadow(
          offset: Offset(2.0, 2.0),
          blurRadius: 0,
          color: ThemeColors.tetriaryColor,
        ),
        Shadow()
      ]);

  static const themeHeading1 = TextStyle(
      color: ThemeColors.primaryColor,
      fontSize: 50,
      fontFamily: ThemeFonts.primaryFontFamily,
      shadows: [
        Shadow(
          offset: Offset(2.0, 2.0),
          blurRadius: 0,
          color: ThemeColors.tetriaryColor,
        ),
        Shadow(
          offset: Offset(-2.0, -2.0),
          blurRadius: 0,
          //    color: ThemeColors.secondaryColor.withOpacity(0.3),
        ),
      ]);

  static const themeHeading3 = TextStyle(
      fontSize: 24.0,
      height: 1,
      fontWeight: FontWeight.w600,
      fontFamily: ThemeFonts.primaryFontFamily,
      color: Colors.black);

  static const themeHeading4 = TextStyle(
      fontSize: 20.0,
      fontFamily: ThemeFonts.primaryFontFamily,
      color: ThemeColors.neutralColorLight);
}
