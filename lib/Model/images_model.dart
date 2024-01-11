import 'dart:math';

class ImageRandomClass {
  final List<String> imagePaths = [
    'lib/assets/image1.jpg',
    'lib/assets/image2.jpg',
    'lib/assets/image3.jpg',
    'lib/assets/image4.jpg',
  ];

  String getRandomImagePath() {
    final random = Random();
    return imagePaths[random.nextInt(imagePaths.length)];
  }
}
