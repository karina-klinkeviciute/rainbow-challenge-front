import 'package:flutter/material.dart';

// Theme color variables use hex format. (0xff added before the hex code of the
// color makes the color value work in Color() class.). Oxff shows that the
// color has full opacity.

// TO DO: maybe we should use MaterialColor model that accepts tints. Tints can
// very handy in some situations.

class ThemeColors {
  // Violet color. Used in headlines or backgrounds.
  static const primaryColor = Color(0xFF7843E6);
  // VioletDark color. Used in backgrounds.
  static const primaryColorDark = Color(0xFF4F289F);

  // LightRed color. Used in buttons, actions, to draw attention.
  static const secondaryColor = Color(0xFFF85F6A);
  // DarkRed color.
  static const secondaryColorDark = Color(0xFFCD434D);

  // LightTurquoise color. Suits for accents and playful shadows
  static const tetriaryColor = Color(0xFF00FEFE);
  // Turquoise color.
  static const tetriaryColorDark = Color(0xFF00C2C2);

  // Greyish color. Useful for body texts, form elements and auxiliary
  // actions/buttons
  static const neutralColor = Color(0xFF455066);
  // Greyish color lighter. Useful for elements that need to be
  static const neutralColorLight = Color(0xFF7A859B);

  // Light pink color. Used in backgrounds, modal.
  static const bgColor = Color(0xFFFAD9D9);
  // Lighter pink color. Used in backgrounds.
  static const bgColorLight = Color(0xFFFDECEC);

  static const contrastColor = Colors.black;
}
