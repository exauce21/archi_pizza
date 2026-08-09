import 'package:archi_pizza/avis.dart';
import 'package:archi_pizza/imageSlider.dart';
import 'package:archi_pizza/pizzaDetailsAvis.dart';
import 'package:archi_pizza/prixWidget.dart';
import 'package:flutter/material.dart';
import 'TopBarMenu.dart';
import 'bottomBarMenu.dart';
import 'package:archi_pizza/favorisWidget.dart';
import 'recette.dart';
import 'avis.dart';

class Pizzadetails extends StatelessWidget {
  const Pizzadetails({
    super.key,
    required this.recette,
  });
  final Recette recette;

  @override
  Widget build(BuildContext context) {

    Widget _liste(String texte) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.red.shade50,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 6,
              height: 6,
              decoration: const BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(width: 8),
            Text(
              texte,
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      );
    }

    final List<Avis> avisliste = [
      Avis("Sophie Martin", 5, "Pizza délicieuse, pâte fine et croustillante. Je recommande vivement !", "2026-08-01"),
      Avis("Karim Benali", 4, "Très bon rapport qualité-prix, juste un peu trop cuite à mon goût.", "2026-07-28"),
      Avis("Léa Dubois", 5, "La meilleure pizza maison que j'ai goûtée, le fromage est excellent.", "2026-07-20"),
      Avis("Thomas Rousseau", 3, "Correcte mais rien d'exceptionnel, la livraison a mis du temps.", "2026-07-15"),
      Avis("Nadia Cherif", 4, "Bon goût, portions généreuses.", "2026-07-10"),
    ];

    return Scaffold(
      //appBar: AppBarTitre(title: recette.title, bgColor: Color.fromRGBO(255, 0, 0, 0.8)),
      appBar: Topbarmenu(title: recette.title),
      bottomNavigationBar: const Bottombarmenu(currentIndex: 0),
      body: Stack(
        children: [
          ListView(
            children: [

              ImageSlider(images: recette.images),

              const SizedBox(height: 16),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            recette.title,
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            recette.user,
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.grey.shade600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    FavorisWidget(
                      isFavorited: recette.isFavorite,
                      favorisCount: recette.favoriteCount,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 8),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    _ActionButton(
                      icon: Icons.chat_bubble_outline,
                      label: 'Commenter',
                      onTap: () {},
                    ),
                    const SizedBox(width: 12),
                    _ActionButton(
                      icon: Icons.share_outlined,
                      label: 'Partager',
                      onTap: () {},
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),
              // Description et Ingredients
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 16,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Description",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Container(
                      child: Text(recette.description),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "Ingrédients",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: [
                        _liste('Farine'),
                        _liste('Levure'),
                        _liste('Sel'),
                        _liste('Fromage'),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              PizzaDetailsAvis(avis: avisliste),

              const SizedBox(height: 20),
            ],
          ),

          Positioned(
            left: 0,
            right: 0,
            bottom: 16,
            child: PrixWidget(prix: recette.prix),
          ),
        ],
      )
    );
  }
}

class _ActionButton extends StatelessWidget {
  const _ActionButton({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(30),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 18, color: Colors.black87),
            const SizedBox(width: 8),
            Text(
              label,
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
