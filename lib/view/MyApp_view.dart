import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:umporvez/controller/Progress_Controller.dart';
import 'package:umporvez/view/Motivation_page.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // ignore: prefer_final_fields
  ProgressController _controllerProgress =
      ProgressController(initialProgress: 0.0);

  //barra de progresso
  double _progress = 0.0;
  //controllers de escolhas e inputs
  late TextEditingController _dayController;
  late TextEditingController _textController;
  String selectedOption = '';

  @override
  void dispose() {
    _dayController.dispose();
    _textController.dispose();
    super.dispose();
  }

  //lista com as opções de escolha

  @override
  void initState() {
    super.initState();

    _dayController = TextEditingController();
    _textController = TextEditingController();
  }

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
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.blue, Colors.red, Colors.orangeAccent],
                    stops: [0.3, 0.7, 0.8],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
            ),
            Positioned(
              child: Container(
                margin: const EdgeInsets.all(90),
                decoration: const BoxDecoration(
                    color: Colors.orange, shape: BoxShape.circle),
              ),
            ),
            Positioned(
              child: Container(
                margin: const EdgeInsets.all(100),
                decoration: const BoxDecoration(
                    color: Colors.orangeAccent, shape: BoxShape.circle),
              ),
            ),
            Positioned(
              child: Container(
                margin: const EdgeInsets.all(120),
                decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 253, 194, 116),
                    shape: BoxShape.circle),
              ),
            ),
            Positioned(
              child: Container(
                margin: const EdgeInsets.all(150),
                decoration: const BoxDecoration(
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
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40)),
                  color: Color.fromARGB(221, 23, 69, 80),
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
                  style:
                      GoogleFonts.robotoMono(color: Colors.white, fontSize: 50),
                ),
              ),
            ),
            Positioned(
              top: 150,
              left: 10,
              right: 10,
              child: Center(
                child: Text(
                  //acesso a meta/vicio
                  _textController.text,
                  style:
                      GoogleFonts.robotoMono(color: Colors.white, fontSize: 30),
                ),
              ),
            ),
            Positioned(
              bottom: 100,
              left: 10,
              right: 10,
              child: Column(
                children: <Widget>[
                  LinearProgressIndicator(
                    backgroundColor: Colors.grey,
                    value: _progress,
                    color: Colors.blue,
                    minHeight: 10,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Progresso da meta: ${(100 * _progress).toStringAsFixed(2)}%',
                    style: GoogleFonts.robotoMono(
                        color: Colors.white, fontSize: 20),
                  )
                ],
              ),
            ),
            Positioned(
              bottom: 50,
              left: 10,
              right: 10,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blueAccent),
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  content: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        TextField(
                                          controller: _dayController,
                                          keyboardType: TextInputType.number,
                                          decoration: const InputDecoration(
                                              hintText: 'Quantos dias?'),
                                        ),
                                        TextField(
                                            controller: _textController,
                                            keyboardType: TextInputType.text,
                                            decoration: const InputDecoration(
                                                hintText:
                                                    'Ficar sem / ofensiva de dias'))
                                      ]),
                                  actions: <Widget>[
                                    ElevatedButton(
                                        onPressed: () {
                                          //data atual do inicio da meta
                                          DateTime currentDate = DateTime.now();
                                          int goalDays = int.tryParse(
                                                  _dayController.text) ??
                                              0;
                                          // Usar o valor obtido em goalDays para calcular o progresso no seu ProgressController
                                          double progress = _controllerProgress
                                              .calculateProgress(
                                                  currentDate, goalDays);
                                          Navigator.pop(context);
                                          setState(() {
                                            _progress = progress;
                                          });
                                        },
                                        child: const Text('Salvar'))
                                  ],
                                );
                              });
                        },
                        child: Center(
                          child: Text(
                            "Nova meta!",
                            style: GoogleFonts.robotoMono(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        )),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blueAccent),
                        onPressed: () {
                          print(
                              "Implementar logica de redefinir o tempo se estiver vazio");
                        },
                        child: Text(
                          "Redefinir",
                          style: GoogleFonts.robotoMono(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ))
                  ]),
            )
          ],
        ),
        //Drawer (lateral menu)
        drawer: Drawer(
          backgroundColor: const Color.fromARGB(255, 125, 181, 226),
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 36, 79, 114)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    TextButton(
                      onPressed: () {
                        _showOptionsDialog();
                      },
                      child: Container(
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(45))),
                        child: Text(
                          "Meta/Vicio",
                          style: GoogleFonts.robotoMono(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 25),
                        ),
                      ),
                    ),
                    Text(
                      selectedOption,
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
                leading: const Icon(
                  Icons.rocket,
                  color: Colors.grey,
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MotivacaoPage()));
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
                leading: const Icon(
                  Icons.info,
                  color: Colors.grey,
                ),
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text("Informações do programador"),
                          content: Text(
                              "Este Aplicativo foi desenvolvido por: IGOR RUAN",
                              style: GoogleFonts.robotoMono()),
                          actions: <Widget>[
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text("Fechar"))
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

  //função para exibir opções de escolhas na tela lateral
  Future<void> _showOptionsDialog() async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Escolha uma opção'),
          content: StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  RadioListTile<String>(
                    title: const Text('Ficar sem por dias'),
                    value: 'Ficar sem por dias',
                    groupValue: selectedOption,
                    onChanged: (value) {
                      setState(() {
                        selectedOption = value!;
                      });
                    },
                  ),
                  RadioListTile<String>(
                    title: const Text('Fazer por dias'),
                    value: 'Fazer por dias',
                    groupValue: selectedOption,
                    onChanged: (value) {
                      setState(() {
                        selectedOption = value!;
                      });
                    },
                  ),
                ],
              );
            },
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                //setstate para atualizar a homescreen
                setState(() {});
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
