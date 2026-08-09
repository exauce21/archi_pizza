import 'package:archi_pizza/accueil.dart';
import 'package:flutter/material.dart';
import 'package:archi_pizza/recettesListe.dart';
import 'package:archi_pizza/avisListe.dart';
import 'package:archi_pizza/userProfil.dart';

import 'commandeListe.dart';
import 'main.dart';
import 'navItem.dart';

class Bottombarmenu extends StatelessWidget {
  const Bottombarmenu({super.key, this.currentIndex = 0});

  final int currentIndex;

  void _onTap(BuildContext context, int index) {
    if (index == currentIndex) return; // déjà sur la page

    late final Widget page;
    switch (index) {
      case 0:
        page = const Accueil();
        break;
      case 1:
        page = const AvisListe();
        break;
      case 2:
        page = const CommandesListe();
        break;
      case 3:
        page = const Userprofil();
        break;
      default:
        return;
    }

    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondary) => page,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          animation = CurvedAnimation(parent: animation, curve: Curves.ease);
          return FadeTransition(opacity: animation, child: child);
        },
        transitionDuration: const Duration(milliseconds: 200),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      padding: const EdgeInsets.symmetric(vertical: 6),
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.red.withOpacity(0.35),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          NavItem(
            icon: Icons.home_rounded,
            label: 'Accueil',
            isActive: currentIndex == 0,
            onTap: () => _onTap(context, 0),
          ),
          NavItem(
            icon: Icons.star_rounded,
            label: 'Avis',
            isActive: currentIndex == 1,
            onTap: () => _onTap(context, 1),
          ),
          NavItem(
            icon: Icons.restaurant_rounded,
            label: 'Mes commandes',
            isActive: currentIndex == 2,
            onTap: () => _onTap(context, 2),
          ),
          NavItem(
            icon: Icons.person_rounded,
            label: 'Profil',
            isActive: currentIndex == 3,
            onTap: () => _onTap(context, 3),
          ),
        ],
      ),
    );
  }
}