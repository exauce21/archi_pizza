import 'package:flutter/material.dart';

class PrixWidget extends StatefulWidget {
  const PrixWidget({
    super.key,
    required this.prix,
    this.onAjouter,
  });

  final double prix;
  final void Function(int quantite, double total)? onAjouter;

  @override
  State<PrixWidget> createState() => _PrixWidgetState();
}

class _PrixWidgetState extends State<PrixWidget> {
  late double prixUnitaire;
  int quantite = 1;

  static const int minQuantite = 1;
  static const int maxQuantite = 20;

  @override
  void initState() {
    super.initState();
    prixUnitaire = widget.prix;
  }

  double get total => prixUnitaire * quantite;

  void _increment() {
    if (quantite < maxQuantite) {
      setState(() => quantite++);
    }
  }

  void _decrement() {
    if (quantite > minQuantite) {
      setState(() => quantite--);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 0, 20, 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(50),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Stepper quantité
          Container(
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                _StepperButton(icon: Icons.remove, onTap: _decrement),
                SizedBox(
                  width: 26,
                  child: Text(
                    "$quantite",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                _StepperButton(
                  icon: Icons.add,
                  onTap: _increment,
                  color: Colors.green,
                ),
              ],
            ),
          ),

          // Prix total
          Text(
            "${total.toStringAsFixed(2)} €",
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),

          // Bouton ajouter au panier
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              elevation: 0,
              padding: const EdgeInsets.symmetric(
                horizontal: 18,
                vertical: 14,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
            ),
            icon: const Icon(Icons.shopping_cart_outlined, size: 18),
            label: const Text(
              "Ajouter",
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
            ),
            onPressed: () {
              widget.onAjouter?.call(quantite, total);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: const Text("Pizza ajoutée au panier"),
                  behavior: SnackBarBehavior.floating,
                  backgroundColor: Colors.black87,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class _StepperButton extends StatelessWidget {
  const _StepperButton({
    required this.icon,
    required this.onTap,
    this.color = Colors.black87,
  });

  final IconData icon;
  final VoidCallback onTap;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(30),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Icon(icon, size: 18, color: color),
      ),
    );
  }
}