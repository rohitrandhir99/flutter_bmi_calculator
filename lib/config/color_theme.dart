import 'package:bmi_app/config/colors.dart';
import 'package:flutter/material.dart';

// light theme
var lightTheme = ThemeData(
  useMaterial3: true,
  colorScheme: const ColorScheme.light(
    background: lBgColor,
    primary: lPrimaryColor,
    onBackground: lFontColor,
    primaryContainer: lDivColor,
    onPrimaryContainer: lFontColor,
    onSecondaryContainer: lLabelColor,
  ),
);

// dark theme
var darkTheme = ThemeData(
   useMaterial3: true,
   colorScheme: const ColorScheme.dark(
    background: dBgColor,
    primary: dPrimaryColor,
    onBackground: dFontColor,
    primaryContainer: dDivColor,
    onPrimaryContainer: dFontColor,
    onSecondaryContainer: dLabelColor,
   ),
);