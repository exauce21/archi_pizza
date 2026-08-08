import 'package:archi_pizza/avis.dart';
import 'package:flutter/material.dart';

class AvisListe extends StatefulWidget {
  const AvisListe({super.key});

  @override
  State<AvisListe> createState() => _AvisListe();
}

class _AvisListe extends State<AvisListe> {
  final List<Avis> listavis = [
    Avis (
      "Claude Tom",
      5,
      "Très bonne pizza ! La pâte est excellente.",
     "Aujourd'hui",
    ),
    Avis (
      "Michel Dupont",
      4,
     "Très bon goût, je recommande.",
      "Hier",
    ),
    Avis (
      "Sophie Martin",
      2,
      "Pizza délicieuse et bien garnie.",
      "12/08/2026",
    ),
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Avis"),
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
      ),

      body: Column(
        children: [

          // NOTE MOYENNE
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),

            child: Column(
              children: [

                const Text(
                  "4.7",
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    5,
                        (index) => const Icon(
                      Icons.star,
                      color: Colors.amber,
                      size: 25,
                    ),
                  ),
                ),

                const SizedBox(height: 5),

                Text(
                  "${listavis.length} avis",
                  style: TextStyle(
                    color: Colors.grey.shade600,
                  ),
                ),
              ],
            ),
          ),

          const Divider(),

          // LISTE DES AVIS
          Expanded(
            child: ListView.builder(
              itemCount: listavis.length,
              itemBuilder: (context, index) {

                final avisItem = listavis[index];

                return Card(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 6,
                  ),

                  child: Padding(
                    padding: const EdgeInsets.all(15),

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [

                        // NOM + NOTE
                        Row(
                          children: [

                            const CircleAvatar(
                              child: Icon(Icons.person),
                            ),

                            const SizedBox(width: 10),

                            Expanded(
                              child: Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,

                                children: [

                                  Text(
                                    avisItem["user"],
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),

                                  Row(
                                    children: List.generate(
                                      5,
                                          (starIndex) => Icon(
                                        starIndex <
                                            listavis.
                                            ? Icons.star
                                            : Icons.star_border,
                                        color: Colors.amber,
                                        size: 18,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            Text(
                              avisItem["date"],
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey.shade600,
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 12),

                        // COMMENTAIRE
                        Text(
                          avisItem["commentaire"],
                          style: const TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),

      // BOUTON AJOUTER UN AVIS
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.red,

        onPressed: () {
          _ajouterAvis();
        },

        icon: const Icon(
          Icons.rate_review,
          color: Colors.white,
        ),

        label: const Text(
          "Ajouter un avis",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  void _ajouterAvis() {
    // Nous ajouterons ici le formulaire d'avis.
  }
}