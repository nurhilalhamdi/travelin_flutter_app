import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';

class Detail_news extends StatelessWidget {
  final url;
  final title;
  final content;
  final publishedAt;
  final author;
  final urlToImage;

  Detail_news(
      {this.url,
      this.title,
      this.content,
      this.publishedAt,
      this.author,
      this.urlToImage});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Row(
              children: <Widget>[
                Container(
                    margin:
                        EdgeInsets.only(left: 20.0, bottom: 30.8, top: 48.0),
                    height: 57.6,
                    width: 57.6,
                    padding: EdgeInsets.all(18),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(9.6),
                      color: Color(0x080a0928),
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Icon(
                        IconlyLight.arrow_left,
                        color: Colors.black,
                      ),
                    )),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(top: 30.0, left: 60.0),
                  child: Text(
                    'Trivelin',
                    style: GoogleFonts.poppins(
                        fontSize: 28,
                        fontWeight: FontWeight.w700,
                        color: Colors.orange[400]),
                  ),
                )
              ],
            ),
          ),
          urlToImage != null
              ? Image.network(urlToImage, width: 350)
              : Container(
                  height: 150,
                  color: Colors.grey,
                ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  '$title',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text(
                  '$publishedAt',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
                SizedBox(height: 5),
                Text('$content'),
                Divider(),
                Text('Author :$author'),
                Text('Sumber :$urlToImage'),
              ],
            ),
          )
        ],
      ),
    );
  }
}
