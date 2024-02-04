import 'dart:ffi';

import 'package:flutter/material.dart';

import 'package:umporvez/view/MyApp_view.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

void main() async {

  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(color: Colors.blue),
      ),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
