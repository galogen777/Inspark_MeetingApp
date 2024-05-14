import 'package:flutter/material.dart';

final themeMain = ThemeData(
    dividerColor: Colors.white70,
    colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.cyan,
        background: const Color.fromARGB(255, 255, 255, 240)),
    useMaterial3: true,
    textTheme: const TextTheme(
      headlineMedium: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.w900,
      ),
      bodySmall: TextStyle(
          color: Colors.white70,
          fontSize: 12,
          fontWeight: FontWeight.w400,
        ),
      bodyMedium: TextStyle(
          color: Colors.white70,
          fontSize: 14,
          fontWeight: FontWeight.w900,
        ),
        displaySmall: TextStyle(
          color: Colors.grey,
          fontSize: 16,
          fontWeight: FontWeight.w300,
        ),
    ));