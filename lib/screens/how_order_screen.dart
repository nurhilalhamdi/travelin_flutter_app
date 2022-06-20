import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

final Uri _url = Uri.parse('https://flutter.dev');

class FaqPage extends StatefulWidget {
  @override
  _FaqPageState createState() => _FaqPageState();
}

Future<void> _makePhoneCall(String phoneNumber) async {
  final Uri launchUri = Uri(
    scheme: 'sms',
    path: phoneNumber,
  );
  await launchUrl(launchUri);
}

class _FaqPageState extends State<FaqPage> {
  List<Panel> panels = [
    Panel(
        'BAGAIMANA CARA PEMESANAN?',
        '1. Pilih Paket Wisata yang kamu inginkan pada menu Home. \n 2. Setelah Memilih paket Wisata klik ORDER SEKARANG. \n 3. Isi Form Reservasi, pastikan EMAIL dan Nomer Telpon yang dimasukkan adalah BENAR.  \n 4. Konfirmasi Booking melalui Email yang dikirim.',
        false),
    Panel(
        'BAGAIMANA CARA PEMBAYARAN?',
        '1. Pembayaran dapat dilakukan dengan cara Transfer Bank/Melalui Gerai. \n 2. Anda akan mendapatkan Kode Booking. \n 3. Berikan Kode Booking yang anda dapatkan pada saat pemesanan kepada Admin kami. \n 4. Pastikan Nama dan jumlah pembayaran yang disebutkan Admin sesuai dengan pesanan anda \n 5. Admin akan melakukan proses pembayaran. \n 6. Status Pembayaran anda akan berubah jika admin telah selesai memproses pembayaran. \n 7. Simpan bukti pembayaran sebagai bukti pembayaran anda.',
        false),
    Panel(
        'BAGAIMANA CARA SAYA MENGHUBUNGI ADMIN?',
        'Admin dapat di hubungi melalui kontak person yang terdapat pada Email Konfirmasi Booking, atau Pengguna dapat mengklik TOMBOL  HUBUNGI di bawah untuk berkomunikasi dengan Admin',
        false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        brightness: Brightness.light,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SafeArea(
        bottom: true,
        child: Padding(
          padding: const EdgeInsets.only(top: 24.0),
          child: ListView(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(
                    left: 24.0, right: 24.0, bottom: 16.0),
                child: Text(
                  'FAQ',
                  style: GoogleFonts.poppins(
                      color: Colors.orange[400],
                      fontWeight: FontWeight.w700,
                      fontSize: 24.0),
                ),
              ),
              ...panels
                  .map((panel) => ExpansionTile(
                          title: Text(
                            panel.title,
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 16, 16, 16)),
                          ),
                          children: [
                            Container(
                                padding: EdgeInsets.all(16.0),
                                color: Color(0xffFAF1E2),
                                child: Text(panel.content,
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 44, 44, 44),
                                        fontSize: 13)))
                          ]))
                  .toList(),
              Padding(
                padding: const EdgeInsets.only(
                    top: 320, left: 320.0, right: 24.0, bottom: 16.0),
                child: FloatingActionButton.large(
                  //* Stet4: Make an update to the watched variable.
                  onPressed: () {
                    // _launchUrl;
                    _makePhoneCall('0812345678');
                  },
                  tooltip: 'Whatsapp',
                  child: const Icon(Icons.whatsapp),
                  backgroundColor: Colors.orange[400],
                  heroTag: null,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// void _launchUrl() async {
//   if (!await launchUrl(_url)) throw 'Could not launch $_url';
// }

class Panel {
  String title;
  String content;
  bool expanded;

  Panel(this.title, this.content, this.expanded);
}
