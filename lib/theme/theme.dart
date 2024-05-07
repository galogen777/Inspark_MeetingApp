import 'package:flutter/material.dart';

final themeMain = ThemeData(
    dividerColor: Colors.amber,
    colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.cyan,
        background: const Color.fromARGB(255, 255, 255, 240)),
    useMaterial3: true,
    textTheme: const TextTheme(
        bodyMedium: TextStyle(
          color: Colors.deepOrange,
          fontSize: 20,
          fontWeight: FontWeight.w900,
        ),
        displaySmall: TextStyle(
          color: Colors.grey,
          fontSize: 16,
          fontWeight: FontWeight.w300,
        )));