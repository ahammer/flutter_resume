import 'package:flutter/material.dart';


ThemeData getTheme(String name) {
  switch (name) {
    case "Light": return ThemeData.light();
    case "Dark": return ThemeData.dark();
  }
  return ThemeData.dark();
}
