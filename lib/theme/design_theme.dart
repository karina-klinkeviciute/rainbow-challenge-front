import 'package:flutter/material.dart';
import 'package:rainbow_challenge/theme/colors.dart';
import 'package:rainbow_challenge/theme/fonts.dart' as ThemeFonts;

// MaterialApp theme adapted for our needs. Defines the colors and typography
// of built-in MaterialApp widgets.
// TO DO: add darkTheme colors, continue adding customizations to lightTheme

class DesignTheme with ChangeNotifier {
  // Light mode theme for the app
  static ThemeData get lightTheme {
    return ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,
          shape: Border(
              bottom: BorderSide(
                  color: ThemeColors.neutralColorLight.withOpacity(0.5),
                  width: 0.5)),
          elevation: 0,
          iconTheme: const IconThemeData(color: ThemeColors.secondaryColor),
          actionsIconTheme:
              const IconThemeData(color: ThemeColors.neutralColorLight),
        ),
        primaryColor: ThemeColors.primaryColor,
        primaryColorBrightness: Brightness.light,
        primaryColorLight: ThemeColors.primaryColor,
        primaryColorDark: ThemeColors.primaryColorDark,
        canvasColor: ThemeColors.bgColor,
        scaffoldBackgroundColor: Colors.white,
        bottomAppBarColor: Colors.white,
        cardColor: Colors.white,
        dividerColor: ThemeColors.neutralColorLight,
        focusColor: ThemeColors.neutralColorLight,
        hoverColor: ThemeColors.secondaryColorDark,
        highlightColor: ThemeColors.neutralColorLight.withOpacity(0.1),
        splashColor: ThemeColors.neutralColorLight.withOpacity(0.2),
        selectedRowColor: Colors.grey,
        unselectedWidgetColor: Colors.grey.shade400,
        disabledColor: Colors.grey.shade200,
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Colors.white,
        ),

        // Some info about buttons theming:
        // https://flutter.dev/docs/release/breaking-changes/buttons
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(primary: ThemeColors.secondaryColor),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              minimumSize: const Size(250, 42),
              primary: ThemeColors.secondaryColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0))),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
              minimumSize: const Size(250, 42),
              primary: ThemeColors.secondaryColor,
              side: const BorderSide(
                  width: 1.0, color: ThemeColors.secondaryColor),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0))),
        ),
        buttonTheme: ButtonThemeData(
          // 4
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
          buttonColor: ThemeColors.secondaryColor,
        ),
        // Define the default font family.
        fontFamily: ThemeFonts.primaryFontFamily,

        // Define the default `TextTheme`. Use this to specify the default
        // text styling for headlines, titles, bodies of text, and more.
        // Read more about TextTheme:
        // https://api.flutter.dev/flutter/material/TextTheme-class.html
        textTheme: const TextTheme(
          headline1: TextStyle(
              fontSize: 72.0,
              fontWeight: FontWeight.w600,
              fontStyle: FontStyle.italic),
          headline2: TextStyle(
              fontSize: 50.0,
              fontWeight: FontWeight.w600,
              fontStyle: FontStyle.italic),
          headline3:
              TextStyle(fontSize: 24.0, fontWeight: FontWeight.w600, height: 1),
          headline4: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600),
          headline5: TextStyle(
              fontSize: 16.0, fontWeight: FontWeight.w600, fontFamily: 'Asap'),
          headline6: TextStyle(
              fontSize: 14.0, fontWeight: FontWeight.w600, fontFamily: 'Asap'),
          subtitle1: TextStyle(fontSize: 24.0),
          subtitle2: TextStyle(fontSize: 18.0),
          bodyText1: TextStyle(
              fontSize: 16.0, fontFamily: ThemeFonts.primaryFontFamily),
          bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Asap'),
          caption: TextStyle(fontSize: 12.0),
          button: TextStyle(fontSize: 18.0),
          overline: TextStyle(fontSize: 12.0),
        ));
  }

  // Dark mode theme for the app
  static ThemeData get darkTheme {
    return ThemeData();
  }

  // Theme switcher
  static bool _isDarkTheme = true;
  ThemeMode get currentTheme => _isDarkTheme ? ThemeMode.dark : ThemeMode.light;

  void toggleTheme() {
    _isDarkTheme = !_isDarkTheme;
    notifyListeners();
  }
}
