import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travelin_mobile_apps/screens/all_paket_screen.dart';
import 'package:travelin_mobile_apps/screens/cek_order_screen.dart';
import 'package:travelin_mobile_apps/screens/res_cek_order_screen.dart';
import 'package:travelin_mobile_apps/screens/how_order_screen.dart';
import 'package:travelin_mobile_apps/screens/screen_home.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';
import 'package:travelin_mobile_apps/constants/color_constant.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Travelin',
      home: MainScreen(),
      // home: PaketTourScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreen();
}

class _MainScreen extends State<MainScreen> {
  int _selectedIndex = 0;
  var bottomTextStyle =
      GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.w500);

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget bottomNav() {
    return Container(
      height: 86.4,
      decoration: BoxDecoration(
        color: mFillColor,
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 15,
              offset: Offset(0, 5))
        ],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      child: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: _selectedIndex == 0
                ? Icon(IconlyBold.home)
                : Icon(IconlyLight.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: _selectedIndex == 1
                ? Icon(IconlyBold.category)
                : Icon(IconlyLight.category),
            label: 'List Paket',
          ),
          BottomNavigationBarItem(
            icon: _selectedIndex == 2
                ? Icon(IconlyBold.wallet)
                : Icon(IconlyLight.wallet),
            label: 'Cek Pemesanan',
          ),
          BottomNavigationBarItem(
            icon: _selectedIndex == 3
                ? Icon(IconlyBold.document)
                : Icon(IconlyLight.document),
            label: 'Cara Pemesanan',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: mBlueColor,
        unselectedItemColor: mSubtitleColor,
        onTap: _onItemTapped,
        backgroundColor: Colors.transparent,
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 12,
        showUnselectedLabels: true,
        elevation: 0,
      ),
    );
  }

  Widget body() {
    switch (_selectedIndex) {
      case 0:
        return ScreenHome();
        break;
      case 1:
        return AllPaketTourScreen();
        break;
      case 2:
        return ScreenCekOrder();
        break;
      case 3:
        return FaqPage();
        break;
      default:
        return ScreenHome();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: bottomNav(),
      body: body(),
    );
  }
}
