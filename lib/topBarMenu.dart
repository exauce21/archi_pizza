import 'package:flutter/material.dart';
import 'package:archi_pizza/userProfil.dart';

class Topbarmenu extends StatelessWidget implements PreferredSizeWidget {
  const Topbarmenu({
    super.key,
    required this.title,
    this.bgColor = Colors.red,
    this.onProfilePressed,
    this.onSearchPressed,
  });

  final String title;
  final Color bgColor;
  final VoidCallback? onProfilePressed;
  final VoidCallback? onSearchPressed;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      centerTitle: true,
      automaticallyImplyLeading: false,
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              bgColor,
              Color.lerp(bgColor, Colors.black, 0.15) ?? bgColor,
            ],
          ),
        ),
      ),
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w700,
          fontSize: 20,
          letterSpacing: 0.3,
        ),
      ),
      actions: [
        _AppBarIconButton(
          icon: Icons.search,
          onPressed: onSearchPressed,
        ),
        const SizedBox(width: 8),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _AppBarIconButton extends StatelessWidget {
  const _AppBarIconButton({
    required this.icon,
    required this.onPressed,
  });

  final IconData icon;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.15),
          shape: BoxShape.circle,
        ),
        child: IconButton(
          icon: Icon(icon, color: Colors.white, size: 20),
          onPressed: onPressed,
        ),
      ),
    );
  }
}