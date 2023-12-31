import 'package:flutter/material.dart';

class AppTheme {
  ///
  ///
  static ThemeData lightTheme = ThemeData(
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: {
        TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      },
    ),
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.scaffold,
    cardTheme: const CardTheme(
      color: AppColors.cardColor,
    ),
    textTheme: TextStyles.textTheme,
    appBarTheme: AppBarTheme(
      titleTextStyle: TextStyles.textTheme.titleLarge,
      centerTitle: true,
      color: AppColors.scaffold,
      elevation: 0,
    ),
  );

  ////                                                d
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
  );
}

class TextStyles {
  static TextTheme textTheme = const TextTheme(
    titleLarge: TextStyle(
      color: Color(0xFF153243),
      fontSize: 24,
      fontWeight: FontWeight.bold,
    ),
  );
}

class AppColors {
  static const Color cardColor = Color(0xFFFBF3EF);
  static const Color scaffold = Color(0xFFFEFEFA);
  static const Color button = Color(0xFF153243);
  static const Color buttonText = Color(0xFFEFF6FA);
}
