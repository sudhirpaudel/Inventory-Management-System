import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:inventorymanagementsystem/config/colors.dart';

final materialAppTheme = MaterialAppData(
  debugShowCheckedModeBanner: false,
  themeMode: ThemeMode.light,
  theme: ThemeData(
    platform: TargetPlatform.android,
    useMaterial3: true,
    fontFamily: 'Roboto',
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        fontSize: 34,
        fontWeight: FontWeight.w700,
        color: backgroundColor,
      ),
      titleMedium: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.w600,
        color: primaryColor,
      ),
      titleSmall:  TextStyle(
        fontSize: 26,
        fontWeight: FontWeight.w500,
        color: secondaryColor,
      ),
      bodyLarge:  TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w400,
        color: primaryColor,
      ),
      bodyMedium:  TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w400,
        color: secondaryColor,
      ),
      bodySmall:  TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w400,
        color: primaryColor,
      ),
       displayLarge:  TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w500,
        color: primaryColor,
      ),
      
    
    ),
    primaryColor: primaryColor,
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: primaryColor,
      onPrimary: secondaryColor,
      secondary: secondaryColor,
      onSecondary: primaryColor,
      error: Colors.red,
      onError: Colors.orange,
      background: backgroundColor,
      onBackground: whiteColor,
      surface: whiteColor,
      onSurface: backgroundColor,
    ),
   
  ),
);
