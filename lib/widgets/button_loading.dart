import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonLoading extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 16, height: 16,
              child: CircularProgressIndicator(strokeWidth: 3, valueColor: AlwaysStoppedAnimation(Colors.black),),
            ),
            SizedBox(width: 6,),
            Text("Loading", style:GoogleFonts.poppins(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.w600)),
          ],
        )
      ),
    );
  }

}