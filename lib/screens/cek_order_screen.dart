import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class ScreenCekOrder extends StatefulWidget {
  const ScreenCekOrder({Key? key}) : super(key: key);

  @override
  State<ScreenCekOrder> createState() => _ScreenCekOrderState();
}

class _ScreenCekOrderState extends State<ScreenCekOrder> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      //Body
      body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.only(left: 28.8, right: 28.8) ,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 48.0,),
                    child: Text(
                      'Trivelin',
                      style: GoogleFonts.poppins(
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          color: Colors.orange[400]),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 48.0,),
                    child: Text(
                      'Form\nCek Pemesanan',
                      style: GoogleFonts.poppins(
                          fontSize: 32, fontWeight: FontWeight.w700),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 24,),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("Kode Booking", style:GoogleFonts.poppins(
                            fontSize: 18,
                            fontWeight: FontWeight.w600)),
                        Container(
                          margin: const EdgeInsets.only(top: 12,),
                          height: 50,
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(12)
                          ),
                          child: Center(
                            child: Row(
                              children: [
                                Icon(Icons.email),
                                SizedBox(width: 16,),
                                Expanded(child: TextFormField(
                                  decoration: InputDecoration.collapsed(
                                    hintText: "Kode Booking Anda",
                                  ),
                                ))
                              ],
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 18,),
                          child:Text("Email Address", style:GoogleFonts.poppins(
                              fontSize: 18,
                              fontWeight: FontWeight.w600)),
                        ),

                        Container(
                          margin: const EdgeInsets.only(top: 12,),
                          height: 50,
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(12)
                          ),
                          child: Center(
                            child: Row(
                              children: [
                                Icon(Icons.email),
                                SizedBox(width: 16,),
                                Expanded(child: TextFormField(
                                  decoration: InputDecoration.collapsed(
                                    hintText: "Email Anda",
                                  ),
                                ))
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: 50,
                          width: double.infinity,
                          margin: const EdgeInsets.only(top: 36),
                          child: TextButton(
                            onPressed: (){},
                            style: TextButton.styleFrom(
                              backgroundColor: Colors.orange[400],
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)
                            ),
                          ),
                            child: Text("Cek Pemesanan", style:GoogleFonts.poppins(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.w600)),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
