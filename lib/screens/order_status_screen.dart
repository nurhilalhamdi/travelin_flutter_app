import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travelin_mobile_apps/main.dart';

class StatusOrderScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    padding: EdgeInsets.only(top: 48.0,left: 48,right: 48),
                    child: Image(image: AssetImage('assets/images/success.png'),)
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 24,),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: Text(
                            'Pesanan Anda Berhasil Dibuat',
                            style: GoogleFonts.poppins(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: Colors.green[500]),
                          ),
                        ),
                        Center(
                          child: Text(
                            'Silahkan Cek Email Anda untuk Melihat Detail Pemesanan',
                            style: GoogleFonts.poppins(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Container(
                          height: 50,
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(horizontal: 48),
                          margin: const EdgeInsets.only(top: 36),
                          child: TextButton(
                            onPressed: (){
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => MyApp(),
                                ),
                              );
                            },
                            style: TextButton.styleFrom(
                              backgroundColor: Colors.orange[400],
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)
                              ),
                            ),
                            child: Text("Back To Home", style:GoogleFonts.poppins(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.w600)),
                          ),
                        ),
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