import 'package:flutter/material.dart';

const kDefaultFont = "Helvetica";
ThemeData getTheme(String name) {
  switch (name) {
    case "Light": return ThemeData.light();
    case "Dark": return ThemeData.dark();
  }
  return ThemeData.dark();
}
