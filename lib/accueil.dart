import 'package:archi_pizza/recettesListe.dart';
import 'package:flutter/material.dart';
import 'TopBarMenu.dart';
import 'accueilCategoryChip.dart';
import 'accueilPizzaCard.dart';
import 'bottomBarMenu.dart';
import 'recette.dart';
import 'pizzaDetails.dart';

class Accueil extends StatefulWidget {
  const Accueil({super.key});

  @override
  State<Accueil> createState() => _AccueilState();
}

class _AccueilState extends State<Accueil> {
  String selectedCategorie = "Toutes";
  final TextEditingController _searchController = TextEditingController();

  final List<Recette> recettes = [
    Recette(
      "1",
      "Pizza Pepperoni",
      "Par Michel dupont",
      "https://images.unsplash.com/photo-1628840042765-356cda07504e?w=400",
      "Offre valable aujourd'hui seulement",
      false,
      10,
      10.00,
      [
        "https://images.unsplash.com/photo-1628840042765-356cda07504e?w=400",
        "https://images.unsplash.com/photo-1628840042765-356cda07504e?w=400",
        "https://images.unsplash.com/photo-1628840042765-356cda07504e?w=400",
      ],
      "20min",
      4.5,
      25,
      "Classiques",
    ),
    Recette(
      "2",
      "Pizza Margherita",
      "Par Michel dudu",
      "https://images.unsplash.com/photo-1574071318508-1cdbab80d002?w=400",
      "Réduction sur toutes les tailles",
      false,
      10,
      8.00,
      [
        "https://images.unsplash.com/photo-1574071318508-1cdbab80d002?w=400",
        "https://images.unsplash.com/photo-1574071318508-1cdbab80d002?w=400",
        "https://images.unsplash.com/photo-1574071318508-1cdbab80d002?w=400",
      ],
      "30min",
      4.6,
      20,
      "Vegetarian",
    ),
    Recette(
      "2",
      "Pizza 4 Fromages",
      "Par Michel",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQCxv_7UxuKCHrglOBjwxbOqTyMqf7v2t7r_w&usqp=CAU",
      "Réduction sur toutes les tailles",
      false,
      10,
      12.50,
      [
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQCxv_7UxuKCHrglOBjwxbOqTyMqf7v2t7r_w&usqp=CAU",
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQCxv_7UxuKCHrglOBjwxbOqTyMqf7v2t7r_w&usqp=CAU",
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQCxv_7UxuKCHrglOBjwxbOqTyMqf7v2t7r_w&usqp=CAU",
      ],
      "30min",
      4.6,
      20,
      "Specials",
    )
  ];

  List<Recette> get _filtered {
    if (selectedCategorie == "Toutes") return recettes;
    return recettes.where((r) => r.categorie == selectedCategorie).toList();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      bottomNavigationBar: const Bottombarmenu(currentIndex: 0),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          children: [
            // Barre de recherche
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.04),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Icon(Icons.search, color: Colors.grey.shade500),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      controller: _searchController,
                      decoration: InputDecoration(
                        hintText: "Cherche ta pizza préférée",
                        hintStyle: TextStyle(
                          color: Colors.grey.shade500,
                          fontSize: 14,
                        ),
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.symmetric(vertical: 14),
                      ),
                    ),
                  ),
                  Icon(Icons.tune, color: Colors.grey.shade700),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Bannière offre spéciale
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Colors.red.shade50, Colors.orange.shade50],
                ),
                borderRadius: BorderRadius.circular(24),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Offre Spéciale",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          "20% de réduction appliquée au moment de payer",
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey.shade600,
                            height: 1.4,
                          ),
                        ),
                        const SizedBox(height: 14),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 18,
                            vertical: 10,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: const Text(
                            "Commander",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 13,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 12),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(60),
                    child: Image.network(
                      "https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?w=300",
                      width: 110,
                      height: 110,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 28),

            // Titre section + "Voir tout"
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Pizzas populaires",
                  style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const RecettesListe()),
                    );
                  },
                  child: Text(
                    "Voir tout",
                    style: TextStyle(
                      color: Colors.red.shade400,
                      fontWeight: FontWeight.w600,
                      fontSize: 13,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 14),

            // Filtres catégories
            SizedBox(
              height: 40,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  AccueilCategoryChip(
                    label: "Toutes",
                    isSelected: selectedCategorie == "Toutes",
                    onTap: () => setState(() => selectedCategorie = "Toutes"),
                  ),
                  const SizedBox(width: 10),
                  AccueilCategoryChip(
                    label: "Classique",
                    isSelected: selectedCategorie == "Classique",
                    onTap: () => setState(() => selectedCategorie = "Classique"),
                  ),
                  const SizedBox(width: 10),
                  AccueilCategoryChip(
                    label: "Vegetarian",
                    isSelected: selectedCategorie == "Vegetarian",
                    onTap: () =>
                        setState(() => selectedCategorie = "Vegetarian"),
                  ),
                  const SizedBox(width: 10),
                  AccueilCategoryChip(
                    label: "Specials",
                    isSelected: selectedCategorie == "Specials",
                    onTap: () =>
                        setState(() => selectedCategorie = "Specials"),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // Liste des pizzas
            ..._filtered.map((r) => AccueilPizzaCard(recette: r)),

            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}


