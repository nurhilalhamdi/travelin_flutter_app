import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:travelin_mobile_apps/constants/color_constant.dart';
import 'package:travelin_mobile_apps/models/recomendation_model.dart';
import 'package:travelin_mobile_apps/models/tour_model.dart';
import 'package:travelin_mobile_apps/screens/paket_tour_screen.dart';
import 'package:travelin_mobile_apps/widgets/CustomTabIndicator.dart';
import 'package:http/http.dart' as http;
import 'detail_news.dart';

class ScreenHome extends StatefulWidget {
  const ScreenHome({Key? key}) : super(key: key);

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  final _pageController = PageController(viewportFraction: 0.877);
  List _post=[''];
  
  @override
  void initState(){
    super.initState();
    _getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Body
      body: SafeArea(
          child: Container(
            child: ListView(
              scrollDirection: Axis.vertical,
              physics: BouncingScrollPhysics(),
              children: <Widget>[
                //Custom navigation menu dan search icon
                Container(
                  height: 70,
                  margin: EdgeInsets.only(top: 28.8, left: 28.8, right: 28.8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        child: Text(
                          'Trivelin',
                          style: GoogleFonts.poppins(
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                              color: Colors.orange[400]),
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

                //Text Widget untuk title Explore Sulawesi Selatan
                Padding(
                  padding: EdgeInsets.only(top: 48, left: 28.8),
                  child: Text(
                    'Explore\nSulawesi Selatan',
                    style: GoogleFonts.poppins(
                        fontSize: 32, fontWeight: FontWeight.w700),
                  ),
                ),

                //Custom Tab bar dengan indicator
                Container(
                  height: 30,
                  margin: EdgeInsets.only(left: 14.4, top: 28.8),
                  child: DefaultTabController(
                      length: 3,
                      child: TabBar(
                          labelPadding: EdgeInsets.only(left: 14.4, right: 14.4),
                          indicatorPadding:
                          EdgeInsets.only(left: 14.4, right: 14.4),
                          labelColor: Color(0xFF000000),
                          isScrollable: true,
                          unselectedLabelColor: Color(0xFF8a8a8a),
                          labelStyle: GoogleFonts.poppins(
                              fontSize: 14, fontWeight: FontWeight.w700),
                          unselectedLabelStyle: GoogleFonts.poppins(
                              fontSize: 14, fontWeight: FontWeight.w700),
                          indicator: RoundedRectangleTabIndicator(
                              color: Color(0xFF000000), weight: 2.4, width: 14.4),
                          tabs: [
                            Tab(
                              child: Container(
                                child: Text('Rekomendasi'),
                              ),
                            ),
                            Tab(
                              child: Container(
                                child: Text('Wisata Populer'),
                              ),
                            ),
                            Tab(
                              child: Container(
                                child: Text('Destinasi wisata Baru'),
                              ),
                            )
                          ])),
                ),

                //Listview Widget dengan PageView
                //Section Rekomendasi
                Container(
                  height: 218.4,
                  margin: EdgeInsets.only(top: 16),
                  child: PageView(
                    physics: BouncingScrollPhysics(),
                    controller: _pageController,
                    scrollDirection: Axis.horizontal,
                    children: List.generate(
                      recommendations.length,
                          (int index) => GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => PaketTourScreen(
                                  recommendedModel: recommendations[index])));
                        },
                        child: Container(
                          margin: EdgeInsets.only(right: 28.8),
                          width: 336.6,
                          height: 218.4,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(9.6),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(recommendations[index].image),
                            ),
                          ),
                          child: Stack(
                            children: <Widget>[
                              Positioned(
                                bottom: 19.2,
                                left: 19.2,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(4.8),
                                  child: BackdropFilter(
                                    filter: ImageFilter.blur(
                                        sigmaX: 19.2, sigmaY: 19.2),
                                    child: Container(
                                      height: 36,
                                      padding:
                                      EdgeInsets.only(left: 16.72, right: 14.4),
                                      alignment: Alignment.centerLeft,
                                      child: Row(
                                        children: <Widget>[
                                          Icon(
                                            IconlyBold.location,
                                            color: Colors.white,
                                          ),
                                          SizedBox(
                                            width: 9.52,
                                          ),
                                          Text(
                                              "Paket Wisata " +
                                                  recommendations[index].name,
                                              style: GoogleFonts.poppins(
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.white,
                                                  fontSize: 14.8)),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                //Dots Indicator
                //Menggunakan SmoothPageIndicator Library
                Padding(
                  padding: EdgeInsets.only(left: 28.8, top: 28.8),
                  child: SmoothPageIndicator(
                    controller: _pageController,
                    count: recommendations.length,
                    effect: ExpandingDotsEffect(
                        activeDotColor: Color(0xFF8a8a8a),
                        dotColor: Color(0xFFababab),
                        dotHeight: 4.8,
                        dotWidth: 6,
                        spacing: 4.8),
                  ),
                ),

                //listview berita
                Padding(
                  padding: EdgeInsets.only(top: 30, left: 28.8),
                  child: Text(
                    'Berita Wisata',
                    style: GoogleFonts.poppins(
                         fontWeight: FontWeight.w700),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 18.8, left: 28.8, right: 28.8),
                    height: 200.0,
                    child: ListView.builder
                      (scrollDirection: Axis.vertical,
                        physics: BouncingScrollPhysics(),
                        itemCount: _post.length,
                        itemBuilder: (context, index) {
                        return ListTile(
                          contentPadding: EdgeInsets.symmetric(vertical: 8.0),
                          title: Text('${_post[index]['title']}',maxLines: 2,overflow: TextOverflow.ellipsis,),
                          subtitle: Text('${_post[index]['description']}',maxLines:2 ,overflow: TextOverflow.ellipsis,),
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (c)=>Detail_news
                              (
                              url:_post[index]['url'],
                              title:_post[index]['title'],
                              content:_post[index]['content'],
                              publishedAt:_post[index]['publishedAt'],
                              author:_post[index]['author'],
                              urlToImage:_post[index]['urlToImage'],
                            ),
                            ),
                            );
                          },
                        );
                        }
                ),
                ),
              ],
            ),
          )),
    );
  }
  Future _getData()async{
    try{
      final response =await http.get(Uri.parse('https://newsapi.org/v2/everything?q=wisata%20makassar&from=2022-05-25&sortBy=publishedAt&apiKey=50925ca11f98492ab5d8164dee1c8e09'));

      if(response.statusCode==200){
        final data=json.decode(response.body);
        setState(() {
          _post =data['articles'];
        });
        //print(_post);
      }
    }catch(e){
      print(e);
    }
  }
}