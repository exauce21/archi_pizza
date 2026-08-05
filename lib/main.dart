import 'package:flutter/material.dart';
import 'appBarTitre.dart';
import 'appBarTitre2.dart';

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
        home: Scaffold(
          appBar: AppBarTitre(title: "toto Pizzeria", bgColor: Color.fromRGBO(100, 200, 30, 0.5)),
          body: ListView(
            children: [
             Stack(
               children: [
                 Container(
                   width: 600,
                   height: 278,
                   child: Center(child: CircularProgressIndicator()),
                 ),
                 FadeInImage.memoryNetwork(
                     placeholder: kTranparentImage,
                     image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQCxv_7UxuKCHrglOBjwxbOqTyMqf7v2t7r_w&usqp=CAU",
                     width: 600,
                     height: 278,
                     fit: BoxFit.cover,
                 ),
               ],
             )
            ],
          ),
        )
    );
  }
}