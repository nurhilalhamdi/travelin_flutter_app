import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:travelin_mobile_apps/models/order_model.dart';
import 'package:travelin_mobile_apps/screens/res_cek_order_screen.dart';
import 'package:travelin_mobile_apps/widgets/button_loading.dart';



class ScreenCekOrder extends StatefulWidget {
  const ScreenCekOrder({Key? key}) : super(key: key);

  @override
  State<ScreenCekOrder> createState() => _ScreenCekOrderState();
}

Future fetchOrder(email,bookingCode) async {
  var url = "http://192.168.1.3/api/orders?email=${email}&booking_code=${bookingCode}";
  var response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    List data = json.decode(response.body)['data'];
    if(data.isNotEmpty){
      return Order.fromJson(data[0]);
    }
    return null;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load order');
  }
}

class _ScreenCekOrderState extends State<ScreenCekOrder> {
  bool isLoading = false;

  TextEditingController emailController = TextEditingController(text: "");
  TextEditingController bookingCodeController = TextEditingController(text: "");
  @override
  Widget build(BuildContext context) {

    cekOrderHandle () async {
      setState(() {
        isLoading = true;
      });

      if(emailController.text != "" && bookingCodeController.text != ""){
        var _order =  await fetchOrder(emailController.text, bookingCodeController.text);
        print(_order);

        if(_order != null){
          Order order = _order as Order;
          print(order);
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => ResCekOrederScreen(order: order,
              ),
            ),
          );
        }
        else {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Pesanan Tidak Dapat Ditemukan"))
          );
        }
      }
      else {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: Text('Email dan Kode Booking Tidak Boleh Kosong'),
              );
            });
      }

      setState(() {
        isLoading = false;
      });
    }

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
                                  controller: bookingCodeController,
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
                                  controller: emailController,
                                  decoration: InputDecoration.collapsed(
                                    hintText: "Email Anda",
                                  ),
                                ))
                              ],
                            ),
                          ),
                        ),
                        isLoading? ButtonLoading() : ButtonSubmit(cekOrderHandle)

                      ],
                    ),
                  )
                ],
              ),
            ),
          )),
    );
  }

  Widget ButtonSubmit(VoidCallback functionCek){
    return Container(
      height: 50,
      width: double.infinity,
      margin: const EdgeInsets.only(top: 36),
      child: TextButton(
        onPressed: functionCek,
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
    );
  }
}
