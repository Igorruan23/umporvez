import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:umporvez/controller/motivationController.dart';
import 'package:umporvez/controller/Image_Controller.dart';

class MotivacaoPage extends StatefulWidget {
  const MotivacaoPage({
    Key? key,
  }) : super(key: key);

  @override
  State<MotivacaoPage> createState() => _MotivacaoPageState();
}

class _MotivacaoPageState extends State<MotivacaoPage> {
  // Instância da classe Versiculoscontroller/imagecontroller
  final ImageController imageController = ImageController();
  final VersiculoController versiculoController = VersiculoController();
  late String versiculoAleatorio;
  late String backgroundImage;

  @override
  void initState() {
    super.initState();
    versiculoAleatorio = versiculoController.getVersiculoAleatorio();
    // Obtém o caminho da imagem aleatória
    backgroundImage = imageController.getRandomImage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(
              "Um dia de cada vez!",
              style: GoogleFonts.robotoMono(
                  color: const Color.fromARGB(255, 0, 0, 0),
                  fontWeight: FontWeight.w900,
                  fontSize: 25),
            ),
            centerTitle: true,
            backgroundColor: Colors.transparent,
            leading: Builder(builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context);
                },
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              );
            })),
        extendBodyBehindAppBar: true,
        body: Stack(children: [
          Image.asset(
            backgroundImage,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                versiculoAleatorio,
                style: GoogleFonts.robotoMono(
                    color: const Color.fromARGB(255, 0, 0, 0),
                    fontWeight: FontWeight.w900,
                    fontSize: 25),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ]));
  }
}
