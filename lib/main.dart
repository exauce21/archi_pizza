import 'package:flutter/material.dart';
import 'StackImage.dart';
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
              StackImage(imgUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQCxv_7UxuKCHrglOBjwxbOqTyMqf7v2t7r_w&usqp=CAU",),
              Row(
                children: [
                  Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.only(
                                left: 15,
                                top: 15,
                                right: 15,
                                bottom: 0
                            ),
                            child: Text('Pizza Maison',
                              style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(
                              left: 15,
                            ),
                            child: Text('Par Michel Dupont',
                              style: TextStyle(
                                  color: Colors.grey.shade700
                              ),
                            ),
                          ),
                        ],
                      )
                  ),
                  Icon( Icons.favorite, color: Colors.red,),
                  Text('11')
                ],
              )
            ],
          ),
        )
    );
  }
}

