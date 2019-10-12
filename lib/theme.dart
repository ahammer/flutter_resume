import 'package:flutter/material.dart';


ThemeData getTheme() => ThemeData.dark().copyWith(
    backgroundColor: Colors.black,
    textTheme: TextTheme(
        display1: TextStyle(
            fontFamily: "Helvetica",
            color: Colors.white54,
            fontSize: 24,
            shadows: []),
        display3: TextStyle(
          fontFamily: "Helvetica",
          fontSize: 42,
        ),
        headline: TextStyle(
            fontFamily: "Helvetica",
            color: Colors.white54,
            fontSize: 48,
            fontWeight: FontWeight.bold,
            shadows: []),
        subhead: TextStyle(
            fontFamily: "Helvetica",
            color: Colors.blueAccent,
            fontSize: 24,
            shadows: []),
        button: TextStyle(
            fontFamily: "Helvetica",
            color: Colors.black87,
            fontSize: 24,
            shadows: []),
            
        display4: TextStyle(fontFamily: "Helvetica")));
