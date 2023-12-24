import 'package:umporvez/Model/versiculos_model.dart';


class VersiculoController {
  final VersiculosClass _versiculosModel = VersiculosClass();
 

  String getVersiculoAleatorio() {
    return _versiculosModel.getVersiculoAleatorio();
  }

  
}

