import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:umporvez/view/Motivacao_page.dart';

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
        ),
        backgroundColor: Colors.blue,
        body: Stack(
          children: [
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
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                alignment: Alignment.bottomCenter,
                decoration: BoxDecoration(
                  color: Colors.black87,
                ),
                height: 100,
                width: double.infinity,
              ),
            ),
            Positioned(
              top: 30,
              left: 10,
              right: 10,
              child: Container(
                color: Colors.transparent,
                alignment: Alignment.center,
                child: Text(
                  '00',
                  style:
                      GoogleFonts.robotoMono(color: Colors.white, fontSize: 50),
                ),
              ),
            ),
            Positioned(
                top: 75,
                left: 10,
                right: 10,
                child: Container(
                  color: Colors.transparent,
                  alignment: Alignment.center,
                  //adicionar um if ternario, se dia for diferente de 0/1 colocar S
                  child: Text(
                    'Dias',
                    style: GoogleFonts.robotoMono(
                        color: Colors.white, fontSize: 50),
                  ),
                )),
          ],
        ),
        //Drawer (lateral menu)
        drawer: Drawer(
          backgroundColor: const Color.fromARGB(255, 125, 181, 226),
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(color: Colors.blue),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Vicio",
                      style: GoogleFonts.robotoMono(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 25),
                    ),
                    Text(
                      "Dias",
                      style: GoogleFonts.robotoMono(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 20),
                    )
                  ],
                ),
              ),
              ListTile(
                title: Text(
                  "Motivação",
                  style: GoogleFonts.robotoMono(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 20),
                ),
                leading: Icon(
                  Icons.rocket,
                  color: Colors.grey,
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MotivacaoPage()));
                },
              ),
              ListTile(
                title: Text(
                  "Sobre",
                  style: GoogleFonts.robotoMono(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 20),
                ),
                leading: Icon(
                  Icons.info,
                  color: Colors.grey,
                ),
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text("Informações do programador"),
                          content: Text(
                              "Este Aplicativo foi desenvolvido por: IGOR RUAN",
                              style: GoogleFonts.robotoMono()),
                          actions: <Widget>[
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text("Fechar"))
                          ],
                        );
                      });
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
