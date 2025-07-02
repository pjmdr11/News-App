import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

abstract class AppTheme {
  static ThemeData getLightTheme() {
    return ThemeData(
        useMaterial3: true,
        appBarTheme: AppBarTheme(
            color: Colors.white,
            elevation: 0,
            toolbarHeight: 80,
            iconTheme: IconThemeData(color: Colors.grey[800]),
            systemOverlayStyle:
                const SystemUiOverlayStyle(statusBarColor: Colors.grey),
            centerTitle: false,
            titleTextStyle:
                const TextStyle(color: Colors.white, fontSize: 22.0)),
        primarySwatch: Colors.blue,
        highlightColor: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
        primaryColor: Colors.blue[900],
        cardTheme: const CardTheme(color: Colors.white, elevation: 4.0),
        iconTheme: IconThemeData(color: Colors.blue[900]),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            elevation: 10,
            selectedItemColor: Colors.blue,
            selectedIconTheme: IconThemeData(size: 32)),
        iconButtonTheme: IconButtonThemeData(
            style: ButtonStyle(
                iconColor: WidgetStatePropertyAll(Colors.blue[800]))),
        canvasColor: Colors.white,
        progressIndicatorTheme: ProgressIndicatorThemeData(
            circularTrackColor: Colors.blue[900], color: Colors.white),
        brightness: Brightness.light);
  }

  static ThemeData getDarkTheme() {
    return ThemeData(
        useMaterial3: true,
        appBarTheme: AppBarTheme(
            color: Colors.blueGrey[800],
            elevation: 0,
            toolbarHeight: 80,
            iconTheme: const IconThemeData(color: Colors.white),
            systemOverlayStyle:
                SystemUiOverlayStyle(statusBarColor: Colors.grey[900]),
            centerTitle: false,
            titleTextStyle:
                const TextStyle(color: Colors.white, fontSize: 22.0)),
        primarySwatch: Colors.blue,
        highlightColor: Colors.blue[200],
        iconTheme: IconThemeData(
          color: Colors.blue[200],
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            elevation: 10,
            selectedItemColor: Colors.blue,
            selectedIconTheme: IconThemeData(size: 32)),
        scaffoldBackgroundColor: Colors.blueGrey[800],
        cardTheme: CardTheme(color: Colors.blueGrey[900], elevation: 4.0),
        canvasColor: Colors.blueGrey[800],
        primaryColor: Colors.blue[500],
        iconButtonTheme: IconButtonThemeData(
            style: ButtonStyle(
                iconColor: WidgetStatePropertyAll(Colors.blue[300]))),
        progressIndicatorTheme: ProgressIndicatorThemeData(
            circularTrackColor: Colors.blue[900], color: Colors.grey),
        brightness: Brightness.dark);
  }
}
