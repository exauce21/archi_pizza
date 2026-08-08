import 'package:flutter/material.dart';
import 'package:archi_pizza/userProfil.dart';

class Topbarmenu extends StatelessWidget implements PreferredSizeWidget{

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
      backgroundColor: bgColor,
      centerTitle: true,

      title: Text(
        title,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 30,
        ),
      ),

      actions: [
        IconButton(
          icon: const Icon(Icons.search, color: Colors.white),
          onPressed: onSearchPressed,
        ),
        IconButton(
          icon: const Icon(Icons.person, color: Colors.white),
          onPressed: (){
              Navigator.push(
              context,
              MaterialPageRoute(
              builder: (context) => const Userprofil(),
              ),
            );
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

