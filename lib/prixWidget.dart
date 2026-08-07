import 'package:flutter/material.dart';

class PrixWidget extends StatefulWidget {
  const PrixWidget({
    super.key,
    required this.prix
  });

  final double prix;

  @override
  State<PrixWidget> createState() => _PrixWidgetState();
}

class _PrixWidgetState extends State<PrixWidget> {

  late double prix;

  @override
  void initState() {
    super.initState();
    prix = widget.prix;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(50),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 16,
            offset: const Offset(0, 6),
          ),
        ],
      ),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Row(
              children: [
                IconButton(
                  onPressed: (){
                    setState(() {
                      prix -= prix;
                    });
                  },
                  icon: const Icon(
                    Icons.remove,
                  ),
                ),
                Container(
                  width: 1,
                  height: 24,
                  color: Colors.grey.shade300,
                ),
                IconButton(
                  onPressed: (){
                    setState(() {
                      prix += prix;
                    });
                  },
                  icon: const Icon(
                    Icons.add_circle,
                    color: Colors.green,
                    size: 40,
                  ),
                ),
              ],
            ),
          ),

          // Prix
          Text(
            "${prix.toStringAsFixed(2)} €",
            style: const TextStyle(
              fontSize: 34,
              fontWeight: FontWeight.bold,
            ),
          ),

          // Bouton ajouter au panier
          Padding(
            padding: const EdgeInsets.only(right: 2),
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 24,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
              icon: const Icon(
                Icons.shopping_cart,
                color: Colors.white,
                size: 20,
              ),
              label: const Text(
                "J'ajoute au Panier",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Pizza ajoutée au panier"),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}