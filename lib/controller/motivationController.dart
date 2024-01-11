import 'package:umporvez/Model/motivation_model.dart';

class VersiculoController {
  final MotivacaoClass _versiculosModel = MotivacaoClass();

  String getVersiculoAleatorio() {
    return _versiculosModel.getMotivacaoAleatoria();
  }
}
