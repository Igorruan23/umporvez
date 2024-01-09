import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:umporvez/Model/dbModel.dart';
import 'package:umporvez/controller/Progress_Controller.dart';
import 'package:umporvez/controller/date_Progress_Controller.dart';
import 'package:umporvez/database/db.dart';
import 'package:umporvez/view/Motivation_page.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //variavel de controle da data
  late DateProgressController controllerDate;
  late DateTime selectedDate;
  late int daysPassed = 0;
  // controle do progresso
  final ProgressController _controllerProgress =
      ProgressController(initialProgress: 0.0);
//

  //barra de progresso
  double _progress = 0.0;
  //controllers de escolhas e inputs
  late TextEditingController _dayController;
  late TextEditingController _textController;

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
    _initializeDB();
    //carregar a data
    controllerDate = DateProgressController();
    //controle de inputs
    _dayController = TextEditingController();
    _textController = TextEditingController();
  }

//criada para o banco de dados não inicializar com app e quebrar
  Future<void> _initializeDB() async {
    await DB.open();
    await _loadProgressData();
  }

  Future<void> deleteDB() async {
    List<DBModel> registros = await DB.getallProgress();
    if (registros.isNotEmpty) {
      DBModel ultimoRegistro = registros.last;
      int? getLastID = ultimoRegistro.id;
      if (getLastID != null) {
        print('ID do último registro: $getLastID');
        await DB.delete(getLastID);
        print('Registro excluído');
        await _initializeDB();
        await _loadProgressData().then((_) {
          setState(() {
            _dayController = TextEditingController();
            _textController = TextEditingController();
            daysPassed = 0;
            _progress = 0.0;
          });
        });
      }
    }
  }

  //carregar dados salvos
  Future<void> _loadProgressData() async {
    List<DBModel> registros = await DB.getallProgress();
    if (registros.isNotEmpty) {
      DBModel ultimoRegistro = registros.last;

      setState(() {
        _textController.text = ultimoRegistro.metaDescription;
        DateTime savedStartDate = DateTime.parse(ultimoRegistro.metaStartDate);
        _dayController.text = ultimoRegistro.goalDays.toString();
        //calculando dias passados com base na data salva e na data atual
        DateTime currentDate = DateTime.now();
        Duration difference = currentDate.difference(savedStartDate);
        daysPassed = difference.inDays;

        //atualizando o progresso
        double progress = _controllerProgress.calculateProgress(
            savedStartDate, ultimoRegistro.goalDays);
        _progress = progress;
      });
    }
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
                  daysPassed.toString(),
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
                                        onPressed: () async {
                                          String currentText =
                                              _textController.text;
                                          if (currentText.isNotEmpty) {
                                            String previousText = currentText;
                                            _textController.clear();
                                            _textController.text = previousText;
                                            List<DBModel> registros =
                                                await DB.getallProgress();
                                            if (registros.isNotEmpty) {
                                              DBModel ultimoRegistro =
                                                  registros.last;
                                              // Atualizar o modelo com o novo texto
                                              ultimoRegistro.metaDescription =
                                                  previousText;
                                              // Chamar a função de atualização no banco de dados
                                              await DB.update(ultimoRegistro);
                                            }
                                          }
                                          //data atual do inicio da meta
                                          DateTime currentDate = DateTime.now();
                                          String metaDescription =
                                              _textController.text;
                                          //implementar logica da data
                                          String metaStartDate = currentDate
                                              .toString(); // Ou formate conforme desejado
                                          int goalDays = int.tryParse(
                                                  _dayController.text) ??
                                              0;

                                          // Criar um objeto DBModel com os dados
                                          DBModel novoRegistro = DBModel(
                                            metaDescription: metaDescription,
                                            metaStartDate: metaStartDate,
                                            goalDays: goalDays,
                                          );
                                          await DB.insert(novoRegistro);

                                          // Usar o valor obtido em goalDays para calcular o progresso no seu ProgressController
                                          double progress = _controllerProgress
                                              .calculateProgress(
                                                  currentDate, goalDays);
                                          Navigator.pop(context);
                                          setState(() {
                                            selectedDate = DateTime.now();
                                            controllerDate
                                                .startProgress(selectedDate);
                                            daysPassed = controllerDate
                                                .calculateDaysPassed();
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
                        onPressed: () async {
                          //await deleteDB();
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Text('Confirmação'),
                                  content: const Text(
                                      "Tem certeza que deseja excluir essa meta?"),
                                  actions: <Widget>[
                                    TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: const Text('Cancelar')),
                                    TextButton(
                                        onPressed: () async {
                                          await deleteDB();
                                          Navigator.of(context).pop();
                                        },
                                        child: Text("Confirmar"))
                                  ],
                                );
                              });
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
                    color: Color.fromARGB(255, 22, 89, 143)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      Text(
                        daysPassed.toString(),
                        style: GoogleFonts.robotoMono(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 25),
                      ),
                      Text(
                        "/",
                        style: GoogleFonts.robotoMono(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 25),
                      ),
                      Text(
                        _dayController.text,
                        style: GoogleFonts.robotoMono(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 25),
                      ),
                    ]),
                    Text(
                      "VOCE CONSEGUE!!!",
                      style: GoogleFonts.robotoMono(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 20),
                    ),
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
}
