import 'package:flutter/material.dart';
import 'package:notepad/pages/home.dart';
import 'package:notepad/pages/notes.dart';



void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      primaryColor: Colors.yellow[50],
    ),
    initialRoute: '/',
    routes: {
      '/': (context) => Home(),
      '/notes': (context) => Notes(),
    },
  ));
}

