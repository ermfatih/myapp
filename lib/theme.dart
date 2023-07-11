import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myapp/color_items.dart';
class LightTheme {
  late ThemeData theme;
  LightTheme() {
    theme = ThemeData.light().copyWith(
        tabBarTheme: const TabBarTheme(
          labelColor: ColorItems.hex,
          indicator: BoxDecoration(
            color: ColorItems.black,
          ),
          unselectedLabelColor: ColorItems.mercury,
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: ColorItems.hex,
          elevation: 0,
          //sizeConstraints:
              //BoxConstraints(maxWidth: 200, minWidth: 50, minHeight: 35)
          //,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
          primary: Colors.white,
          shadowColor: Colors.black,
        )),
        inputDecorationTheme: const InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
        ),
        scaffoldBackgroundColor: ColorItems.mercury,
        appBarTheme: const AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle.light,
          centerTitle: true,
          // toolbarHeight: 100,
          color: ColorItems.hex,
        ));
  }
}
