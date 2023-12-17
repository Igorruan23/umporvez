import 'package:flutter/material.dart';
import 'package:umporvez/view/MyApp_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(color: Colors.blue),
      ),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
