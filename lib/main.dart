import 'package:flutter/material.dart';
import 'package:CovidTracker/splashsccreen.dart';
import 'homescreen.dart';
import 'statescreen.dart';

void main() {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: SplashScreen.id,
      home: SplashScreen(),
      routes: {
        SplashScreen.id:(context) => SplashScreen(),
        HomeScreen.id: (context) => HomeScreen(),
        MyApp.id : (context) => MyApp(),

      }
  ));
}

