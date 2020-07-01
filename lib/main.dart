import 'package:flutter/material.dart';
import 'package:weather_dump/screens/loading_screen.dart';
import 'package:flutter/services.dart';

void main() { 
  SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
  runApp(MyApp());
  }
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoadingScreen(),
    );
  }
}