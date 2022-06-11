import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travelin_mobile_apps/screens/home_screen.dart';
import 'package:travelin_mobile_apps/screens/paket_tour_screen.dart';
import 'package:travelin_mobile_apps/screens/screen_home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Travelin',
      home: ScreenHome(),
      // home: PaketTourScreen(),
    );
  }
}
