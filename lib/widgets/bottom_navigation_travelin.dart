import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';
import 'package:travelin_mobile_apps/constants/color_constant.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomNavigationTravelin extends StatefulWidget {
  const BottomNavigationTravelin({Key? key}) : super(key: key);

  @override
  State<BottomNavigationTravelin> createState() =>
      _BottomNavigationTravelinState();
}

class _BottomNavigationTravelinState extends State<BottomNavigationTravelin> {
  int _selectedIndex = 0;
  var bottomTextStyle =
  GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.w500);

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }



  @override
  Widget build(BuildContext context) {
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
                ? Icon(IconlyBold.wallet)
                : Icon(IconlyLight.wallet),
            label: 'Cek Pemesanan',
          ),
          BottomNavigationBarItem(
            icon: _selectedIndex == 2
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
}
