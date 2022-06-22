import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';
import 'package:travelin_mobile_apps/constants/color_constant.dart';
import 'package:travelin_mobile_apps/models/recomendation_model.dart';
import 'package:http/http.dart' as http;
import 'package:travelin_mobile_apps/screens/detail_paket_screen.dart';

import '../constants/variable_const.dart';

class PaketTourScreen extends StatefulWidget {
  RecommendedModel recommendedModel;
  PaketTourScreen({Key? key, required this.recommendedModel}) : super(key: key);

  @override
  State<PaketTourScreen> createState() => _PaketTourScreenState();
}

class _PaketTourScreenState extends State<PaketTourScreen> {
  String output = "Tidak Ada Data";

  List tour = [];
  bool isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.fetchTour(widget.recommendedModel.id);
  }

  //Mengambil Data Paket Tour Berdasarkan Id Kota
  fetchTour(String id) async {
    setState(() {
      isLoading = true;
    });

    var url = "${baseUrl}cities?id=" + id;
    var response = await http.get(Uri.parse(url));
    // print(response.body);
    if (response.statusCode == 200) {
      var items = json.decode(response.body)['tour'];
      setState(() {
        tour = items;
        isLoading = false;
      });
    } else {
      tour = [];
      isLoading = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/
    final double itemHeight = (size.height - kToolbarHeight - 40) / 2;
    final double itemWidth = size.width / 2;

    return Scaffold(
      body: Column(children: <Widget>[
        Stack(
          children: <Widget>[
            Container(
              height: 250,
              decoration: BoxDecoration(
                color: mBackgroundColor,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)),
              ),
            ),
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
                      ),
                    ),
                  ),
                  Container(
                    height: 57.6,
                    width: 57.6,
                    padding: EdgeInsets.all(18),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(9.6),
                      color: Color(0x080a0928),
                    ),
                    child: Icon(IconlyLight.search),
                  ),
                ],
              ),
            ),

            //Text Widget untuk Selamat Datang di kota Makassar
            Positioned(
              bottom: 30.0,
              child: Container(
                height: 70,
                margin: EdgeInsets.only(top: 28.8, left: 28.8, right: 28.8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Selamat Datang',
                            style: GoogleFonts.poppins(
                                fontSize: 20, fontWeight: FontWeight.w700),
                          ),
                          Text(
                            "Di " + widget.recommendedModel.name,
                            style: GoogleFonts.poppins(
                                fontSize: 18, fontWeight: FontWeight.normal),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 100,
                    ),
                    VerticalDivider(),
                    Container(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            // Your elements here
                            Padding(
                              padding: EdgeInsets.only(right: 5),
                              child: Text(
                                tour.length.toString(),
                                style: GoogleFonts.poppins(
                                    fontSize: 20, fontWeight: FontWeight.w700),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomLeft,
                              child: Text(
                                'wisata',
                                style: GoogleFonts.poppins(
                                    fontSize: 12, fontWeight: FontWeight.w700),
                              ),
                            ),
                          ],
                        ),
                        Text(
                          'Lokasi',
                          style: GoogleFonts.poppins(
                              color: mSubtitleColor,
                              fontSize: 12,
                              fontWeight: FontWeight.normal),
                        ),
                      ],
                    )),
                  ],
                ),
              ),
            ),
          ],
        ),
        getBody()
      ]),
    );
  }

  Widget getBody() {
    if (tour.contains(null) || tour.length < 0 || isLoading) {
      return Container(
        margin: EdgeInsets.all(10),
        child: Column(children: [
          Center(
              child: CircularProgressIndicator(
            valueColor: new AlwaysStoppedAnimation<Color>(mBlueColor),
          )),
        ]),
      );
    } else if (tour.length == 0) {
      return Container(
        margin: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Image(
                height: 180,
                width: 180,
                image: AssetImage("assets/images/magnifying.png"),
              ),
            ),
            Text(
              'Whoops!',
              style: GoogleFonts.poppins(
                  fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              'Paket wisata di Kota ini belum ada :(\nsilahkan liat paket wisata di kota lain!',
              style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  color: mSubtitleColor),
            ),
          ],
        ),
      );
    }
    return Expanded(
      child: ListView.builder(
          itemCount: tour.length,
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            return getItem(tour[index]);
          }),
    );
  }

  Widget getItem(item) {
    var id = item['id'];
    var title = item['title'];
    var description = item['description'];
    var travel_route = item['travel_route'];
    var itinary = item['itinary'];
    var price = item['price'];
    var price_detail = item['price_detail'];
    var id_kota = item['id_kota'];
    var image_paket = item['image'];
    return Card(
      elevation: 0,
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => DetailPaketScreen(
                id:id,
                title: title,
                description: description,
                travel_route: travel_route,
                itinary: itinary,
                price: price,
                price_detail: price_detail,
                id_kota: id_kota.toString(),
                image_paket: image_paket.toString(),
              ),
            ),
          );
        },
        child: Stack(
          children: <Widget>[
            Container(
              margin: EdgeInsets.fromLTRB(40.0, 5.0, 20.0, 5.0),
              height: 180,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Padding(
                padding: EdgeInsets.fromLTRB(100.0, 20.0, 20.0, 20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          child: Text(
                            title,
                            style: GoogleFonts.poppins(
                                fontSize: 18,
                                color: Colors.black.withOpacity(0.8),
                                fontWeight: FontWeight.bold),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(right: 5),
                              child: Text(
                                price,
                                style: GoogleFonts.poppins(
                                    fontSize: 14, fontWeight: FontWeight.w500),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomLeft,
                              child: Container(
                                margin: EdgeInsets.only(top: 5),
                                child: Text('/Orang',
                                    style: GoogleFonts.poppins(
                                        fontSize: 11,
                                        fontWeight: FontWeight.w400,
                                        color: mSubtitleColor)),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          size: 18,
                          color: mSubtitleColor,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        namaKota(id_kota.toString()),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 20.0,
              top: 15.0,
              bottom: 15.0,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: imageKota(image_paket.toString())),
            ),
          ],
        ),
      ),
    );
  }

  Image imageKota(String imagekota) {
    if (imagekota == 'null') {
      return Image(
        width: 110.0,
        image: NetworkImage(
            "https://images.unsplash.com/photo-1506929562872-bb421503ef21?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=468&q=80"),
        fit: BoxFit.cover,
      );
    } else {
      return Image(
        width: 110.0,
        image: NetworkImage("http://192.168.1.5/storage/" + imagekota),
        fit: BoxFit.cover,
      );
    }
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
}
