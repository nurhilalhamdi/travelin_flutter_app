
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_launch/flutter_launch.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';
import 'package:intl/intl.dart';

import '../models/order_model.dart';

class ResCekOrederScreen extends StatefulWidget {
  final Order order;
  const ResCekOrederScreen({Key? key, required this.order}) : super(key: key);

  @override
  State<ResCekOrederScreen> createState() => _ResCekOrederScreenState();
}

class _ResCekOrederScreenState extends State<ResCekOrederScreen> {
  String currDate = DateFormat("yyyy-MM-dd").format(DateTime.now());
  @override
  Widget build(BuildContext context) {
    String getDate = DateFormat("yyyy-MM-dd").format(widget.order.created_at);

    void openWhatsapp() async {
      bool isAvailable = await FlutterLaunch.hasApp(name: "whatsapp");

      if(isAvailable){
        await FlutterLaunch.launchWhatsapp(phone: "+6281234567890", message: "Halo Admin Trivelin,Saya ingin konfirmasi pemesanan");
      }else{
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("WhatsApp not installed"))
        );
        }
    }
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 24,vertical: 48),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  child:Row(children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Container(
                        height: 48,
                        width: 48,
                        margin: const EdgeInsets.only(right: 16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(9),
                          color: Color(0x080a0928),
                        ),
                        child: Icon(
                          IconlyLight.arrow_left,
                        ),),),
                    Text(
                      'Trivelin',
                      style: GoogleFonts.poppins(
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          color: Colors.orange[400]),
                    ),
                  ],
                  ),
                ),

                Container(
                  margin: const EdgeInsets.only(top: 32),
                  child: Text(
                    'Paket Wisata',
                    style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 12),
                  child: Text(
                    widget.order.title,
                    style: GoogleFonts.poppins(
                        fontSize: 20,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 8),
                  child: Text(
                    '${widget.order.price}/orang',
                    style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 24),
                  child:Divider(thickness: 3,color: Colors.grey[300],) ,
                ),
                detailPemesananBold("Kode Booking",widget.order.booking_code),
                divider(),
                detailPemesananBold("Tanggal Perjalanan",widget.order.tour_date),
                divider(),
                Container(
                  margin: const EdgeInsets.only(top: 24),
                  child: Text(
                    'Detail Pemesanan',
                    style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey),
                  ),
                ),

                detailPemesanan("Nama", widget.order.name),
                divider(),
                detailPemesanan("Email", widget.order.email),
                divider(),
                detailPemesanan("No. Hp", widget.order.phone_number),
                divider(),
                detailPemesanan("Alamat", widget.order.address),
                divider(),
                detailPemesanan("Jumlah Pesanan", widget.order.quantity),
                Container(
                  margin: const EdgeInsets.only(top: 16),
                  child:Divider(thickness: 5,color: Colors.black,) ,
                ),
                Padding(padding: const EdgeInsets.symmetric(vertical: 8),
                  child:Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Status",
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,),
                      ),
                      if(widget.order.status == 1)...[
                        Text(
                          "Lunas",
                          style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: Colors.green),
                        ),
                      ]else...[
                        if(currDate==getDate)...[
                          Text(
                            "Menunggu Pembayaran",
                            style: GoogleFonts.poppins(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: Colors.orange),
                          ),
                        ]else...{
                          Text(
                            "Dibatalkan",
                            style: GoogleFonts.poppins(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: Colors.red),
                          ),
                        }
                      ]
                      
                    ],
                  ),
                ),
                Container(
                  child:Divider(thickness: 5,color: Colors.black,) ,
                ),
                Container(
                  height: 50,
                  width: double.infinity,
                  margin: const EdgeInsets.only(top: 36),
                  child: TextButton(
                    onPressed: (){
                      openWhatsapp();
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.orange[400],
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)
                      ),
                    ),
                    child: Text("Hubungi Admin", style:GoogleFonts.poppins(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.w600)),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 16),
                  child: Text(
                    '*Pembayaran dilakukan di luar website silahkan hubungi admin melalui email yang anda dapatkan',
                    style: GoogleFonts.poppins(
                        fontSize: 12,),
                  ),
                ),
              ],
            ),
          )
        ),
      ),
    );
  }

  Widget divider(){
    return Container(
      child:Divider(thickness: 3,color: Colors.grey[300],) ,
    );
  }

  Widget detailPemesanan(header,content){
    return Padding(padding: const EdgeInsets.symmetric(vertical: 8),
      child:Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            header,
            style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w500,),
          ),
          Text(
            content,
            style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w500,),
          ),
        ],
      ),
    );
  }

  Widget detailPemesananBold(header,content){
    return Padding(padding: const EdgeInsets.symmetric(vertical: 8),
      child:Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            header,
            style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w700,),
          ),
          Text(
            content,
            style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w700,),
          ),
        ],
      ),
    );
  }
}