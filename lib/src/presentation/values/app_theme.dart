import 'package:flutter/material.dart';

import 'palette.dart';

abstract class AppTheme {
  static final RoundedRectangleBorder _defaultButtonShape =
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(4));
  static const EdgeInsets _defaultButtonPadding =
      EdgeInsets.symmetric(vertical: 12, horizontal: 12);

  static final BorderRadius _defaultInputBorderRadius = BorderRadius.circular(4);

  static final ThemeData lightTheme = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: Palette.primary,
    canvasColor: Palette.primary,
    brightness: Brightness.light,
    primaryColor: Palette.primary,
    primaryColorLight: Palette.primaryLight,
    primaryColorDark: Palette.primaryDark,
    secondaryHeaderColor: Palette.secondaryElement,
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: Colors.white,
    ),
    appBarTheme: const AppBarTheme(
      elevation: 0,
      centerTitle: true,
    ),
    colorScheme: const ColorScheme.light().copyWith(
      primary: Palette.primary,
      secondary: Palette.secondary,
      secondaryContainer: Palette.secondaryContainer,
      primaryContainer: Palette.primaryContainer,
    ),
    tabBarTheme: const TabBarTheme(
      indicatorSize: TabBarIndicatorSize.tab,
      labelColor: Palette.primary,
      unselectedLabelColor: Palette.secondaryElement,
      indicator: UnderlineTabIndicator(
        borderSide: BorderSide(color: Palette.primary, width: 2),
        insets: EdgeInsets.symmetric(horizontal: 24),
      ),
    ),
    dialogTheme: DialogTheme(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Palette.primary,
      border: OutlineInputBorder(
        borderRadius: _defaultInputBorderRadius,
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: _defaultInputBorderRadius,
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: _defaultInputBorderRadius,
        borderSide: const BorderSide(color: Palette.primary),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16),
      hintStyle: const TextStyle(fontSize: 14, color: Palette.secondaryElement),
      labelStyle: const TextStyle(fontSize: 14, color: Palette.secondaryElement),
      alignLabelWithHint: true,
      errorMaxLines: 2,
    ),
    buttonTheme: ButtonThemeData(
      textTheme: ButtonTextTheme.accent,
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
      shape: _defaultButtonShape,
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        shape: _defaultButtonShape,
        padding: _defaultButtonPadding,
        side: const BorderSide(color: Palette.primary),
        textStyle: const TextStyle(color: Colors.black),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith(
          (Set<MaterialState> states) => states.contains(MaterialState.disabled)
              ? Palette.primary.withOpacity(.85)
              : Palette.primary,
        ),
        shape: MaterialStateProperty.all(_defaultButtonShape),
        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
        overlayColor: MaterialStateProperty.all<Color>(Palette.primaryLight),
        padding: MaterialStateProperty.all<EdgeInsets>(_defaultButtonPadding),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        shape: MaterialStateProperty.all(_defaultButtonShape),
        padding: MaterialStateProperty.all<EdgeInsets>(_defaultButtonPadding),
        shadowColor: MaterialStateProperty.all(Palette.primaryLight),
        backgroundColor: MaterialStateProperty.resolveWith(
          (Set<MaterialState> states) =>
              states.contains(MaterialState.disabled) ? Palette.primaryLight : Palette.primary,
        ),
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Palette.primaryContainer,
      selectedItemColor: Palette.secondary,
      unselectedItemColor: Palette.primary,
      selectedIconTheme: IconThemeData(color: Palette.secondary),
      unselectedIconTheme: IconThemeData(color: Palette.primaryLight),
    ),
    checkboxTheme: CheckboxThemeData(
      fillColor: MaterialStateProperty.resolveWith(
        (Set<MaterialState> states) =>
            states.contains(MaterialState.selected) ? Palette.primary : Palette.secondaryElement,
      ),
    ),
    radioTheme: RadioThemeData(
      fillColor: MaterialStateProperty.resolveWith(
        (Set<MaterialState> states) =>
            states.contains(MaterialState.selected) ? Palette.primary : Palette.secondaryElement,
      ),
    ),
    switchTheme: SwitchThemeData(
      splashRadius: 20,
      trackColor: MaterialStateProperty.resolveWith(
        (Set<MaterialState> states) => states.contains(MaterialState.disabled)
            ? Palette.secondaryElement
            : Palette.primaryLight,
      ),
      thumbColor: MaterialStateProperty.resolveWith(
        (Set<MaterialState> states) =>
            states.contains(MaterialState.disabled) ? Palette.secondaryElement : Palette.primary,
      ),
    ),
  );
}
