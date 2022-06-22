import 'dart:convert';
import 'dart:ui';

import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:iconly/iconly.dart';
import 'package:intl/intl.dart';
import 'package:travelin_mobile_apps/models/order_model.dart';
import 'package:travelin_mobile_apps/screens/order_status_screen.dart';
import 'package:travelin_mobile_apps/screens/res_cek_order_screen.dart';
import 'package:travelin_mobile_apps/widgets/button_loading.dart';

import '../constants/variable_const.dart';


class AddOrderScreen extends StatefulWidget {
  final String idTour;
  const AddOrderScreen({Key? key, required this.idTour}) : super(key: key);

  @override
  State<AddOrderScreen> createState() => _AddOrderScreenState();
}

Future fetchOrder(name,email,phone,address,quantity,date,id) async {
  var url = "${baseUrl}checkout";
  var headers = {'Content-Type': 'application/json'};
  var body = jsonEncode({
    'tour_date' : date,
    'quantity' : quantity,
    'name' : name,
    'phone_number' : phone,
    'email' : email,
    'address' : address,
    'tour_id' : id,
  });
  var response = await http.post(Uri.parse(url),headers: headers,body: body);

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    var data = json.decode(response.body)['data'];
    if(data != null){
      return data;
    }
    return null;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to add order');
  }
}

class _AddOrderScreenState extends State<AddOrderScreen> {
  bool isLoading = false;
  final format = DateFormat("yyyy-MM-dd");


  TextEditingController nameController = TextEditingController(text: "");
  TextEditingController emailController = TextEditingController(text: "");
  TextEditingController addressController = TextEditingController(text: "");
  TextEditingController phoneController = TextEditingController(text: "");
  TextEditingController quantityController = TextEditingController(text: "");
  TextEditingController dateController = TextEditingController(text: "");
  @override
  Widget build(BuildContext context) {
    cekOrderHandle () async {
      setState(() {
        isLoading = true;
      });

      if(_validate()){
        var _order =  await fetchOrder(nameController.text,
            emailController.text,
            phoneController.text,
            addressController.text,
            quantityController.text,
            dateController.text,
            widget.idTour);
        print(_order['name']);
        if(_order != null){
          // Order order = Order.fromJson(_order);
          // print(order);
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => StatusOrderScreen(),
            ),
          );
          setState(() {
            isLoading = false;
          });
        }
        else {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Gagal Membuat Pesanan"))
          );
        }
      }
      else {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: Text('Pastikan Semua Data Telah Terisi'),
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
              padding: const EdgeInsets.only(top:48,left: 28.8, right: 28.8) ,
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

                  Padding(
                    padding: EdgeInsets.only(top: 24.0,),
                    child: Text(
                      'Form Pemesanan',
                      style: GoogleFonts.poppins(
                          fontSize: 26, fontWeight: FontWeight.w700),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 24,),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("Nama", style:GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w600)),
                          Container(
                            height: 50,
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(12)
                            ),
                            child: Center(
                              child: Row(
                                children: [
                                  Icon(Icons.person),
                                  SizedBox(width: 16,),
                                  Expanded(child: TextFormField(
                                    controller: nameController,
                                    decoration: InputDecoration.collapsed(
                                      hintText: "Nama Anda",
                                    ),
                                  ))
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 10,),

                          Text("Email", style:GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w600)),
                          Container(
                            height: 50,
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            decoration: BoxDecoration(
                                color: Colors.grey[200],
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
                          SizedBox(height: 10,),


                          Text("No. Telepon", style:GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w600)),
                          Container(
                            height: 50,
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(12)
                            ),
                            child: Center(
                              child: Row(
                                children: [
                                  Icon(Icons.phone),
                                  SizedBox(width: 16,),
                                  Expanded(child: TextFormField(
                                    controller: phoneController,
                                    decoration: InputDecoration.collapsed(
                                      hintText: "No. Telepon Anda",
                                    ),
                                  ))
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 10,),


                          Text("Alamat", style:GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w600)),
                          Container(
                            height: 50,
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(12)
                            ),
                            child: Center(
                              child: Row(
                                children: [
                                  Icon(Icons.home),
                                  SizedBox(width: 16,),
                                  Expanded(child: TextFormField(
                                    controller: addressController,
                                    decoration: InputDecoration.collapsed(
                                      hintText: "Alamat Anda",
                                    ),
                                  ))
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 10,),


                          Text("Jumlah Tiket", style:GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w600)),
                          Container(
                            height: 50,
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(12)
                            ),
                            child: Center(
                              child: Row(
                                children: [
                                  Icon(Icons.sticky_note_2),
                                  SizedBox(width: 16,),
                                  Expanded(child: TextFormField(
                                    keyboardType: TextInputType.number,
                                    controller: quantityController,
                                    decoration: InputDecoration.collapsed(
                                      hintText: "Jumlah Tiket Anda",
                                    ),
                                  ))
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 10,),

                          Text("Tanggal Perjalanan", style:GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w600)),
                          Container(
                            height: 50,
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(12)
                            ),
                            child: Center(
                              child: Row(
                                children: [
                                  Icon(Icons.calendar_today_rounded),
                                  SizedBox(width: 16,),
                                  Expanded(child:
                                  DateTimeField(
                                    format: format,
                                    controller: dateController,
                                    onShowPicker: (context, currentValue) {
                                      return showDatePicker(
                                          context: context,
                                          firstDate: DateTime.now(),
                                          initialDate: currentValue ?? DateTime.now(),
                                          lastDate: DateTime(2100));
                                    },
                                  ),)
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 10,),

                          isLoading? ButtonLoading() : ButtonSubmit(cekOrderHandle)

                        ],
                      ),
                    ),
                ],
              ),
            ),
          )),
    );
  }

  bool _validate() {
    if(
    nameController.text != "" &&
        emailController.text != "" &&
        phoneController.text != "" &&
        addressController.text != "" &&
        quantityController.text != "" &&
        dateController.text != ""
    ){
      print(dateController.text);
      return true;
    }
    return false;
  }



  Widget ButtonSubmit(VoidCallback functionCek){
    return Container(
      height: 50,
      width: double.infinity,
      margin: const EdgeInsets.only(top: 36,bottom: 48),
      child: TextButton(
        onPressed: functionCek,
        style: TextButton.styleFrom(
          backgroundColor: Colors.orange[400],
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)
          ),
        ),
        child: Text("Pesan Sekarang", style:GoogleFonts.poppins(
            fontSize: 16,
            color: Colors.black,
            fontWeight: FontWeight.w600)),
      ),
    );
  }
}
