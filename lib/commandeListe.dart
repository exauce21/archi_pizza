import 'package:archi_pizza/commandeWidget.dart';
import 'package:flutter/material.dart';
import 'TopBarMenu.dart';
import 'bottomBarMenu.dart';
import 'commande.dart';
import 'commandeDetails.dart';

class CommandesListe extends StatefulWidget {
  const CommandesListe({super.key});

  @override
  State<CommandesListe> createState() => _CommandesListeState();
}

class _CommandesListeState extends State<CommandesListe> {
  final List<Commande> commandes = [
    Commande(
      "1042",
      "08 août 2026",
      ["Pizza maison", "Pizza papa"],
      27.50,
      "Livrée",
    ),
    Commande(
      "1043",
      "07 août 2026",
      ["Pizza maman"],
      18.00,
      "En préparation",
    ),
    Commande(
      "1044",
      "05 août 2026",
      ["Pizza frérot", "Pizza maison"],
      47.50,
      "En attente",
    ),
    Commande(
      "1039",
      "28 juillet 2026",
      ["Pizza papa"],
      15.00,
      "Annulée",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: Topbarmenu(title: 'Mes commandes'),
      bottomNavigationBar: const Bottombarmenu(currentIndex: 2),
      body: commandes.isEmpty
          ? Center(
        child: Text(
          "Aucune commande pour le moment",
          style: TextStyle(color: Colors.grey.shade500),
        ),
      )
          : ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 8),
        itemCount: commandes.length,
        itemBuilder: (context, index) {
          final commande = commandes[index];
          return CommandeWidget(
            commande: commande,
            onTap: () {
              Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondary) =>
                      CommandeDetails(commande: commande),
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
                    animation = CurvedAnimation(
                      parent: animation,
                      curve: Curves.ease,
                    );
                    return FadeTransition(
                        opacity: animation, child: child);
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}