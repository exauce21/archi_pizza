import 'package:flutter/material.dart';
import 'TopBarMenu.dart';
import 'avis.dart';
import 'avisWidget.dart';
import 'bottomBarMenu.dart';

class AvisListe extends StatefulWidget {
  const AvisListe({super.key});

  @override
  State<AvisListe> createState() => _AvisListeState();
}

class _AvisListeState extends State<AvisListe> {
  final List<Avis> avisliste = [
    Avis(
      "Sophie Martin",
      5,
      "Pizza délicieuse, pâte fine et croustillante. Je recommande vivement !",
      "2026-08-01",
    ),
    Avis(
      "Karim Benali",
      4,
      "Très bon rapport qualité-prix, juste un peu trop cuite à mon goût.",
      "2026-07-28",
    ),
    Avis(
      "Léa Dubois",
      5,
      "La meilleure pizza maison que j'ai goûtée, le fromage est excellent.",
      "2026-07-20",
    ),
    Avis(
      "Thomas Rousseau",
      3,
      "Correcte mais rien d'exceptionnel, la livraison a mis du temps.",
      "2026-07-15",
    ),
  ];

  @override
  Widget build(BuildContext context) {

    final double moyenne =
        avisliste.map((a) => a.note).reduce((a, b) => a + b) / avisliste.length;

    return Scaffold(
      appBar: Topbarmenu(title: 'Liste des avis'),
      bottomNavigationBar: const Bottombarmenu(currentIndex: 1),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
        itemCount: avisliste.length + 1, // +1 pour le header
        itemBuilder: (context, index) {
          if (index == 0) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Row(
                children: [
                  Text(
                    "Avis (${avisliste.length})",
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Icon(Icons.star_rounded, size: 18, color: Colors.amber),
                  Text(
                    moyenne.toStringAsFixed(1),
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            );
          }

          final avis = avisliste[index - 1]; // décalage à cause du header
          return AvisWidget(avis: avis);
        },
      ),
    );
  }
}