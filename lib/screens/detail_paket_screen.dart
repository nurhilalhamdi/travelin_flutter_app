import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';
import 'package:travelin_mobile_apps/constants/color_constant.dart';
import 'package:travelin_mobile_apps/models/recomendation_model.dart';
import 'package:travelin_mobile_apps/models/tour_model.dart';
import 'package:readmore/readmore.dart';

extension StringCasingExtension on String {
  String toCapitalized() =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';
  String toTitleCase() => replaceAll(RegExp(' +'), ' ')
      .split(' ')
      .map((str) => str.toCapitalized())
      .join(' ');
}

class DetailPaketScreen extends StatelessWidget {
  final _pageController = PageController();

  final String title;
  final String description;
  final String travel_route;
  final String itinary;
  final String price;
  final String price_detail;
  final String id_kota;
  final String image_paket;
  DetailPaketScreen({
    Key? key,
    required this.title,
    required this.description,
    required this.travel_route,
    required this.itinary,
    required this.price,
    required this.price_detail,
    required this.id_kota,
    required this.image_paket,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/
    final double itemHeight = (size.height - kToolbarHeight - 40) / 2;
    final double itemWidth = size.width / 2;

    return Scaffold(
      backgroundColor: Colors.white,
      body: getBody(context),
    );
  }

  Widget getBody(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Stack(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: size.height * 0.5,
            decoration: imageKota(image_paket),
            child: SafeArea(
              child: Column(
                children: [
                  Container(
                    height: 70,
                    margin: EdgeInsets.only(top: 28.8, left: 28.8, right: 28.8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: Container(
                            height: 57.6,
                            width: 57.6,
                            padding: EdgeInsets.all(18),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(9.6),
                              color: Color(0x080a0928),
                            ),
                            child: Icon(
                              IconlyLight.arrow_left,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: size.height * 0.45),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Align(
                    child: Container(
                      width: 50,
                      height: 7,
                      decoration: BoxDecoration(
                        color: mBorderColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),

                  //Title Section
                  SizedBox(
                    height: 10,
                  ),
                  titleSection(title),

                  //Nama Kota Sect
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        color: mSubtitleColor,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      namaKota(id_kota),
                    ],
                  ),

                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 5),
                        child: Text(
                          price,
                          style: GoogleFonts.poppins(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Container(
                          margin: EdgeInsets.only(top: 5),
                          child: Text('/person',
                              style: GoogleFonts.poppins(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w400,
                                  color: mSubtitleColor)),
                        ),
                      ),
                    ],
                  ),

                  //Deskripsi
                  SizedBox(
                    height: 20,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      margin: EdgeInsets.only(top: 5),
                      child: Text('Deskripsi',
                          style: GoogleFonts.poppins(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black.withOpacity(0.8))),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      child: ReadMoreText(
                        description,
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.normal,
                            color: mSubtitleColor),
                        trimLines: 2,
                        colorClickableText: mBlueColor,
                        trimMode: TrimMode.Line,
                        trimCollapsedText: '... Baca selengkapnya >',
                        trimExpandedText: ' Tutup',
                      ),
                    ),
                  ),

                  //Rute Travel
                  SizedBox(
                    height: 20,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      margin: EdgeInsets.only(top: 5),
                      child: Text('Rute Travel',
                          style: GoogleFonts.poppins(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black.withOpacity(0.8))),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      child: Html(data: """ $travel_route """),
                    ),
                  ),

                  //Rencana Perjalanan
                  SizedBox(
                    height: 20,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      margin: EdgeInsets.only(top: 5),
                      child: Text('Rencana Perjalan',
                          style: GoogleFonts.poppins(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black.withOpacity(0.8))),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      child: Html(data: """ $itinary """),
                    ),
                  ),

                  //Detail Harga
                  SizedBox(
                    height: 20,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      margin: EdgeInsets.only(top: 5),
                      child: Text('Detail Harga',
                          style: GoogleFonts.poppins(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black.withOpacity(0.8))),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      child: Html(data: """ $price_detail """),
                    ),
                  ),

                  //Button Order
                  SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: Stack(
                        children: <Widget>[
                          Positioned.fill(
                            child: Container(
                              decoration:
                                  const BoxDecoration(color: mBlueColor),
                            ),
                          ),
                          TextButton(
                            style: TextButton.styleFrom(
                              padding: const EdgeInsets.all(16.0),
                              primary: Colors.white,
                              textStyle: const TextStyle(fontSize: 20),
                            ),
                            onPressed: () {},
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Order Sekarang',
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Icon(
                                  IconlyBold.bag,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Row titleSection(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Flexible(
          flex: 1,
          child: Text(
            title,
            style: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          height: 32,
          width: 32,
          decoration: BoxDecoration(
            color: Color(0xffff6464),
            shape: BoxShape.circle,
          ),
          child: Icon(
            IconlyBold.heart,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}

BoxDecoration imageKota(String imagekota) {
  if (imagekota == 'null') {
    return BoxDecoration(
      image: DecorationImage(
        image: NetworkImage(
            "https://images.unsplash.com/photo-1563244495-1de93ffe7c23?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8bWFrYXNzYXJ8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60"),
        fit: BoxFit.cover,
      ),
    );
  }
  return BoxDecoration(
    image: DecorationImage(
      image: NetworkImage("http://192.168.1.5/storage/" + imagekota),
      fit: BoxFit.cover,
    ),
  );
}

Widget namaKota(String idKota) {
  if (idKota == '1') {
    return Text(
      "Makassar",
      style: GoogleFonts.poppins(
        color: mSubtitleColor,
        fontWeight: FontWeight.w500,
      ),
    );
  } else if (idKota == '2') {
    return Text(
      "Tana Toraja",
      style: GoogleFonts.poppins(
        color: mSubtitleColor,
        fontWeight: FontWeight.w500,
      ),
    );
  } else if (idKota == '3') {
    return Text(
      "Bulukumba",
      style: GoogleFonts.poppins(
        color: mSubtitleColor,
        fontWeight: FontWeight.w500,
      ),
    );
  } else if (idKota == '4') {
    return Text(
      "Parepare",
      style: GoogleFonts.poppins(
        color: mSubtitleColor,
        fontWeight: FontWeight.w500,
      ),
    );
  } else if (idKota == '5') {
    return Text(
      "Kab Maros",
      style: GoogleFonts.poppins(
        color: mSubtitleColor,
        fontWeight: FontWeight.w500,
      ),
    );
  } else if (idKota == '6') {
    return Text(
      "Jeneponto",
      style: GoogleFonts.poppins(
        color: mSubtitleColor,
        fontWeight: FontWeight.w500,
      ),
    );
  } else if (idKota == '7') {
    return Text(
      "Pangkajene",
      style: GoogleFonts.poppins(
        color: mSubtitleColor,
        fontWeight: FontWeight.w500,
      ),
    );
  } else if (idKota == '8') {
    return Text(
      "Kab Bone",
      style: GoogleFonts.poppins(
        color: mSubtitleColor,
        fontWeight: FontWeight.w500,
      ),
    );
  }
  return Text(
    "Error",
    style: GoogleFonts.poppins(
      color: mSubtitleColor,
      fontWeight: FontWeight.w500,
    ),
  );
}
