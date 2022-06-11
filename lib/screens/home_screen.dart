
// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// // import 'package:flutter_swiper/flutter_swiper.dart';
// // ignore: import_of_legacy_library_into_null_safe
// import 'package:flutter_swiper/flutter_swiper.dart';
// import 'package:travelin_mobile_apps/constants/color_constant.dart';
// import 'package:travelin_mobile_apps/constants/style_constant.dart';
// import 'package:travelin_mobile_apps/models/carousel_model.dart';
// import 'package:travelin_mobile_apps/models/popular_destination_model.dart';

// import '../widgets/bottom_navigation_travelin.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({Key? key}) : super(key: key);

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   int _current = 0;

//   List<T> map<T>(List list, Function handler) {
//     List<T> result = [];
//     for (var i = 0; i < list.length; i++) {
//       result.add(handler(i, list[i]));
//     }
//     return result;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: mBackgroundColor,
//         // title: SvgPicture.asset('assets/svg/travelin-black-logo.svg'),
//         title: Text('Trivellin'),
//         elevation: 0,
//       ),
//       backgroundColor: mBackgroundColor,
//       bottomNavigationBar: BottomNavigationTravelin(),
//       body: Container(
//         child: ListView(
//           physics: ClampingScrollPhysics(),
//           children: <Widget>[
//             //Promo Section
//             Padding(
//               padding: EdgeInsets.only(left: 16, bottom: 24),
//               child: Text(
//                 'Hi, User 👋 This Promo For You!',
//                 style: mTitleStyle,
//               ),
//             ),
//             Container(
//               alignment: Alignment.centerLeft,
//               margin: EdgeInsets.only(left: 16, right: 16),
//               width: MediaQuery.of(context).size.width,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: <Widget>[
//                   Container(
//                     width: MediaQuery.of(context).size.width,
//                     height: 190,
//                     child: Swiper(
//                       onIndexChanged: (index) {
//                         setState(() {
//                           _current = index;
//                         });
//                       },
//                       autoplay: true,
//                       layout: SwiperLayout.DEFAULT,
//                       itemCount: carousels.length,
//                       itemBuilder: (BuildContext context, index) {
//                         return Container(
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(8),
//                             image: DecorationImage(
//                                 image: AssetImage(
//                                   carousels[index].image,
//                                 ),
//                                 fit: BoxFit.cover),
//                           ),
//                         );
//                       },
//                     ),
//                   ),
//                   SizedBox(
//                     height: 12,
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: <Widget>[
//                       Row(
//                         children: map<Widget>(
//                           carousels,
//                           (index, image) {
//                             return Container(
//                               alignment: Alignment.centerLeft,
//                               height: 6,
//                               width: 6,
//                               margin: EdgeInsets.only(right: 8),
//                               decoration: BoxDecoration(
//                                   shape: BoxShape.circle,
//                                   color: _current == index
//                                       ? mBlueColor
//                                       : mGreyColor), // BoxDecoration
//                             ); // Container
//                           },
//                         ),
//                       ),
//                       Text(
//                         'More...',
//                         style: mMoreDiscountStyle,
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),

//             //Service Section
//             Padding(
//               padding: EdgeInsets.only(left: 16, top: 24, bottom: 12),
//               child: Text(
//                 'Let\'s Booking!',
//                 style: mTitleStyle,
//               ),
//             ),
//             Container(
//               height: 144,
//               margin: EdgeInsets.only(left: 16, right: 16),
//               child: Column(
//                 children: <Widget>[
//                   Row(
//                     children: <Widget>[
//                       Expanded(
//                         child: Container(
//                           margin: EdgeInsets.only(right: 8),
//                           padding: EdgeInsets.only(left: 16),
//                           height: 64,
//                           decoration: BoxDecoration(
//                             color: mFillColor,
//                             borderRadius: BorderRadius.circular(12),
//                             border: Border.all(color: mBorderColor, width: 1),
//                           ),
//                           child: Row(
//                             children: <Widget>[
//                               SvgPicture.asset(
//                                 'assets/svg/service_flight_icon.svg',
//                                 fit: BoxFit.contain,
//                               ),
//                               Padding(
//                                 padding: EdgeInsets.only(left: 16),
//                                 child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: <Widget>[
//                                     Text(
//                                       'Flight',
//                                       style: mServiceTitleStyle,
//                                     ),
//                                     Text(
//                                       'Feel Freedom',
//                                       style: mServiceSubTitleStyle,
//                                     )
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                       Expanded(
//                         child: Container(
//                           margin: EdgeInsets.only(right: 8),
//                           padding: EdgeInsets.only(left: 16),
//                           height: 64,
//                           decoration: BoxDecoration(
//                             color: mFillColor,
//                             borderRadius: BorderRadius.circular(12),
//                             border: Border.all(color: mBorderColor, width: 1),
//                           ),
//                           child: Row(
//                             children: <Widget>[
//                               SvgPicture.asset(
//                                 'assets/svg/service_tourguide_icon.svg',
//                                 fit: BoxFit.contain,
//                               ),
//                               Padding(
//                                 padding: EdgeInsets.only(left: 16),
//                                 child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: <Widget>[
//                                     Text(
//                                       'Tour Guide',
//                                       style: mServiceTitleStyle,
//                                     ),
//                                     Text(
//                                       'Feel Safety',
//                                       style: mServiceSubTitleStyle,
//                                     )
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                   SizedBox(
//                     height: 16,
//                   ),
//                   Row(
//                     children: <Widget>[
//                       Expanded(
//                         child: Container(
//                           margin: EdgeInsets.only(right: 8),
//                           padding: EdgeInsets.only(left: 16),
//                           height: 64,
//                           decoration: BoxDecoration(
//                             color: mFillColor,
//                             borderRadius: BorderRadius.circular(12),
//                             border: Border.all(color: mBorderColor, width: 1),
//                           ),
//                           child: Row(
//                             children: <Widget>[
//                               SvgPicture.asset(
//                                 'assets/svg/service_hotel_icon.svg',
//                                 fit: BoxFit.contain,
//                               ),
//                               Padding(
//                                 padding: EdgeInsets.only(left: 16),
//                                 child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: <Widget>[
//                                     Text(
//                                       'Hotel',
//                                       style: mServiceTitleStyle,
//                                     ),
//                                     Text(
//                                       'Lets take a break',
//                                       style: mServiceSubTitleStyle,
//                                     )
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                       Expanded(
//                         child: Container(
//                           margin: EdgeInsets.only(right: 8),
//                           padding: EdgeInsets.only(left: 16),
//                           height: 64,
//                           decoration: BoxDecoration(
//                             color: mFillColor,
//                             borderRadius: BorderRadius.circular(12),
//                             border: Border.all(color: mBorderColor, width: 1),
//                           ),
//                           child: Row(
//                             children: <Widget>[
//                               SvgPicture.asset(
//                                 'assets/svg/service_car_icon.svg',
//                                 fit: BoxFit.contain,
//                               ),
//                               Padding(
//                                 padding: EdgeInsets.only(left: 16),
//                                 child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: <Widget>[
//                                     Text(
//                                       'Car Rental',
//                                       style: mServiceTitleStyle,
//                                     ),
//                                     Text(
//                                       'Around the city',
//                                       style: mServiceSubTitleStyle,
//                                     )
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),

//             //Popular Destination Section
//             Padding(
//               padding: EdgeInsets.only(left: 16, top: 24, bottom: 12),
//               child: Text(
//                 'Popular Destinations!',
//                 style: mTitleStyle,
//               ),
//             ),
//             Container(
//               height: 144,
//               child: ListView.builder(
//                 itemCount: populars.length,
//                 padding: EdgeInsets.only(left: 16, right: 16),
//                 scrollDirection: Axis.horizontal,
//                 itemBuilder: (context, index) {
//                   return Card(
//                     elevation: 0,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                     child: Container(
//                       height: 140,
//                       width: 120,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(12),
//                         border: Border.all(color: mBorderColor, width: 1),
//                       ),
//                       child: Padding(
//                         padding: const EdgeInsets.only(top: 8.0, bottom: 16),
//                         child: Column(
//                           children: <Widget>[
//                             Image.asset(
//                               populars[index].image,
//                               height: 74,
//                             ),
//                             Text(
//                               populars[index].nama,
//                               style: mPopularDestinationTitleStyle,
//                             ),
//                             Text(
//                               populars[index].daerah,
//                               style: mPopularDestinationSubTitleStyle,
//                             )
//                           ],
//                         ),
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
