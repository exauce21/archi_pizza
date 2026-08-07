import 'package:archi_pizza/bottomBarMenu.dart';
import 'package:archi_pizza/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'StackImage.dart';

import 'TopBarMenu.dart';

final User user = User(
  image: "https://static.vecteezy.com/system/resources/thumbnails/055/125/883/small/close-up-portrait-of-african-teenager-with-defined-braided-cornrows-on-white-background-free-photo.jpg",
  firstname: "Arthur",
  lastname: "Tom",
  email: "arthur@gmail.com",
  phone: 4738304545,
  address: "75 rue Paris",
  paymentMethod: "Carte Bancaire",
);

class Userprofil extends StatefulWidget {
  const Userprofil({super.key});

  @override
  State<Userprofil> createState() => _UserprofilState();
}

class _UserprofilState extends State<Userprofil> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Topbarmenu(title: 'Profil utilisateur'),
      bottomNavigationBar: Bottombarmenu(),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 20),
        children: [
          const SizedBox(height: 20),
          Center(
            child: CircleAvatar(
              radius: 70,
              backgroundImage: NetworkImage(user.image),
            ),
          ),

          const SizedBox(height: 20),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "${user.firstname} ${user.lastname}",
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 1),
                Text(
                  user.email,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          Card(
            elevation: 1,
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.email),
                  title: const Text("Email"),
                  subtitle: Text(user.email),
                ),

                ListTile(
                  leading: const Icon(Icons.phone),
                  title: const Text("Téléphone"),
                  subtitle: Text(user.phone.toString()),
                ),

                ListTile(
                  leading: const Icon(Icons.location_on),
                  title: const Text("Adresse"),
                  subtitle: Text(user.address),
                ),

                ListTile(
                  leading: const Icon(Icons.payment),
                  title: const Text("Paiement"),
                  subtitle: Text(user.paymentMethod),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          // Bouton modifier
          ElevatedButton.icon(
            onPressed: () {
              // Modifier le profil
            },
            icon: const Icon(Icons.edit),
            label: const Text("Modifier mon profil"),
          ),

        ],
      ),
    );
  }
}
