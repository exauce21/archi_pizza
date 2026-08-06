import 'package:flutter/material.dart';
import 'recette.dart';


class Recettelist extends StatefulWidget {
  const Recettelist({super.key});

  @override
  State<Recettelist> createState() => _RecettelistState();
}

class _RecettelistState extends State<Recettelist> {

  final List<Recette> recettes = [
    Recette(
        "Pizza maison",
        "Par Michel dupont",
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQCxv_7UxuKCHrglOBjwxbOqTyMqf7v2t7r_w&usqp=CAU",
        "Super ils ont envie de faire dodo !",
        false,
        10
    ),
    Recette(
        "Pizza papa",
        "Par Michel dudu",
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQCxv_7UxuKCHrglOBjwxbOqTyMqf7v2t7r_w&usqp=CAU",
        "Super ils ont envie de faire dodo !",
        false,
        10
    ),
    Recette(
        "Pizza maman",
        "Par Michel dudu",
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQCxv_7UxuKCHrglOBjwxbOqTyMqf7v2t7r_w&usqp=CAU",
        "Super ils ont envie de faire dodo !",
        false,
        10
    ),
    Recette(
        "Pizza frérot",
        "Par Michel dudu",
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQCxv_7UxuKCHrglOBjwxbOqTyMqf7v2t7r_w&usqp=CAU",
        "Super ils ont envie de faire dodo !",
        false,
        10
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
