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
        body: Stack(children: [
          Positioned(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.blue, Colors.orange, Colors.deepOrange],
                  stops: [0.3, 0.7, 0.8],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ),
          Positioned(
            child: Container(
              margin: EdgeInsets.all(90),
              decoration:
                  BoxDecoration(color: Colors.orange, shape: BoxShape.circle),
            ),
          ),
          Positioned(
            child: Container(
              margin: EdgeInsets.all(100),
              decoration: BoxDecoration(
                  color: Colors.orangeAccent, shape: BoxShape.circle),
            ),
          ),
          Positioned(
            child: Container(
              margin: EdgeInsets.all(120),
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 253, 194, 116),
                  shape: BoxShape.circle),
            ),
          ),
          Positioned(
            child: Container(
              margin: EdgeInsets.all(150),
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 250, 212, 163),
                  shape: BoxShape.circle),
            ),
          ),
          Positioned(
            top: 500.0,
            left: 25.0,
            right: 25.0,
            child: Container(
              alignment: Alignment.bottomCenter,
              decoration: BoxDecoration(
                  border:
                      Border.all(style: BorderStyle.solid, color: Colors.white),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(45),
                      topRight: Radius.circular(45)),
                  color: Colors.black),
              height: 150,
              width: double.infinity,
            ),
          )
        ]),
      ),
    );
  }
}
