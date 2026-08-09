import 'package:archi_pizza/avisListe.dart';
import 'package:archi_pizza/recettesListe.dart';
import 'package:flutter/material.dart';

import 'accueil.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.red),
        useMaterial3: true,
      ),
      home: const Accueil(),
      //home: AvisListe()
    );
  }
}