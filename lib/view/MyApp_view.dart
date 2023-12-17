import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Um por vez!',
            style: GoogleFonts.robotoMono(
                color: Colors.white, fontWeight: FontWeight.w500, fontSize: 25),
          ),
          centerTitle: true,
          actions: <Widget>[
            IconButton(onPressed: () {}, icon: Icon(Icons.settings))
          ],
        ),
        backgroundColor: Colors.blue,
        body: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
          colors: [Colors.blue, Colors.orange, Colors.deepOrange],
          stops: [0.3, 0.7, 0.8],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ))),
      ),
    );
  }
}
