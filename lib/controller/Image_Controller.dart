import 'package:umporvez/Model/images_model.dart';

class ImageController {
  final ImageRandomClass _imageRandomClass = ImageRandomClass();

  String getRandomImage() {
    return _imageRandomClass.getRandomImagePath();
  }
}
