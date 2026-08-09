import 'package:archi_pizza/bottomBarMenu.dart';
import 'package:archi_pizza/user.dart';
import 'package:flutter/material.dart';
import 'TopBarMenu.dart';
import 'commandeListe.dart';
import 'contact.dart';

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
      //backgroundColor: Colors.grey.shade50,
      appBar: Topbarmenu(title: 'Mon Profil'),
      //bottomNavigationBar: Bottombarmenu(),
      bottomNavigationBar: const Bottombarmenu(currentIndex: 3),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 20),
        children: [

          // En-tête : avatar + nom + email
          Center(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.08),
                        blurRadius: 20,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),
                  child: CircleAvatar(
                    radius: 60,
                    backgroundImage: NetworkImage(user.image),
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  "${user.firstname} ${user.lastname}",
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  user.email,
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey.shade600,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 32),

          // informations sur la profil
          Container(
            padding: const EdgeInsets.symmetric(vertical: 4),
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
              children: [
                InfoTile(
                  icon: Icons.email_outlined,
                  color: Colors.blue,
                  label: "Email",
                  value: user.email,
                ),
                DividerInfo(),
                InfoTile(
                  icon: Icons.phone_outlined,
                  color: Colors.green,
                  label: "Téléphone",
                  value: user.phone.toString(),
                ),
                DividerInfo(),
                InfoTile(
                  icon: Icons.location_on_outlined,
                  color: Colors.orange,
                  label: "Adresse",
                  value: user.address,
                ),
                DividerInfo(),
                InfoTile(
                  icon: Icons.payment_outlined,
                  color: Colors.purple,
                  label: "Paiement",
                  value: user.paymentMethod,
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),

          Container(
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
              children: [
                _NavTile(
                  icon: Icons.receipt_long_outlined,
                  color: Colors.blue,
                  label: "Mes commandes",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const CommandesListe()),
                    );
                  },
                ),
                Divider(height: 1, thickness: 1, indent: 58, color: Colors.grey.shade100),
                _NavTile(
                  icon: Icons.headset_mic_outlined,
                  color: Colors.purple,
                  label: "Contactez-nous",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Contact()),
                    );
                  },
                ),
                Divider(height: 1, thickness: 1, indent: 58, color: Colors.grey.shade100),
                _NavTile(
                  icon: Icons.edit_outlined,
                  color: Colors.red,
                  label: "Modifier mon profil",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Contact()),
                    );
                  },
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),
        ],
      ),
    );
  }
}

class InfoTile extends StatelessWidget {
  const InfoTile({
    required this.icon,
    required this.color,
    required this.label,
    required this.value,
  });

  final IconData icon;
  final Color color;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: color, size: 20),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey.shade500,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DividerInfo extends StatelessWidget {
  const DividerInfo();

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 1,
      thickness: 1,
      indent: 58,
      color: Colors.grey.shade100,
    );
  }
}

class _NavTile extends StatelessWidget {
  const _NavTile({
    required this.icon,
    required this.color,
    required this.label,
    required this.onTap,
  });

  final IconData icon;
  final Color color;
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: color, size: 20),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                label,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                ),
              ),
            ),
            Icon(Icons.chevron_right, color: Colors.grey.shade400),
          ],
        ),
      ),
    );
  }
}