import 'package:flutter/material.dart';

class AppBarTitre extends StatelessWidget implements PreferredSizeWidget {
  const AppBarTitre({
    super.key,
    required this.title,
    this.bgColor = Colors.red,
    this.onProfilePressed,
    this.onSearchPressed,
  });

  final String title;
  final Color bgColor;

  // Callbacks pour les clics
  final VoidCallback? onProfilePressed;
  final VoidCallback? onSearchPressed;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: bgColor,
      centerTitle: true,

      // Icône à gauche
      leading: IconButton(
        icon: const Icon(Icons.person, color: Colors.white),
        onPressed: onProfilePressed,
      ),

      title: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 30,
        ),
      ),

      // Icône à droite
      actions: [
        IconButton(
          icon: const Icon(Icons.search, color: Colors.white),
          onPressed: onSearchPressed,
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}