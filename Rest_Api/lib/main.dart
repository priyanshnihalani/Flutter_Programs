import 'package:flutter/material.dart';
// import 'package:rest_api/Home_Screen.dart';
// import 'package:rest_api/Second_Screen.dart';
// import 'package:rest_api/Third_Screen.dart';
// import 'package:rest_api/Fourth_Screen.dart';
import 'package:rest_api/Fifth_Screen.dart';
import 'package:rest_api/Fourth_Screen.dart';
import 'package:rest_api/Sixth_Screen.dart';

import 'Seventh_Screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const SeventhScreen());
  }
}
