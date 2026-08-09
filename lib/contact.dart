import 'package:flutter/material.dart';
import 'ContactTextField.dart';
import 'TopBarMenu.dart';
import 'bottomBarMenu.dart';
import 'contactFieldLabel.dart';

class Contact extends StatefulWidget {
  const Contact({super.key});

  @override
  State<Contact> createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nomController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _sujetController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

  bool _isSending = false;

  @override
  void dispose() {
    _nomController.dispose();
    _emailController.dispose();
    _sujetController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  void _envoyer() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isSending = true);

    // Simule un appel réseau — remplace par ta vraie logique d'envoi
    await Future.delayed(const Duration(seconds: 1));

    if (!mounted) return;
    setState(() => _isSending = false);

    _formKey.currentState!.reset();
    _nomController.clear();
    _emailController.clear();
    _sujetController.clear();
    _messageController.clear();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text("Message envoyé avec succès !"),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.green.shade700,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: Topbarmenu(title: 'Contactez-nous'),
      bottomNavigationBar: const Bottombarmenu(currentIndex: 0),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            // En-tête
            Container(
              padding: const EdgeInsets.all(20),
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
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.red.shade50,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Icon(
                      Icons.mail_outline,
                      color: Colors.red,
                      size: 28,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Une question ?",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          "On te répond sous 24h",
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Champ Nom
            ContactFieldLabel("Nom complet"),
            ContactTextField(
              controller: _nomController,
              hint: "Ton nom et prénom",
              icon: Icons.person_outline,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return "Le nom est requis";
                }
                return null;
              },
            ),

            const SizedBox(height: 18),

            // Champ Email
            ContactFieldLabel("Email"),
            ContactTextField(
              controller: _emailController,
              hint: "toi@exemple.com",
              icon: Icons.alternate_email,
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return "L'email est requis";
                }
                final emailRegex = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$');
                if (!emailRegex.hasMatch(value.trim())) {
                  return "Email invalide";
                }
                return null;
              },
            ),

            const SizedBox(height: 18),

            // Champ Sujet
            ContactFieldLabel("Sujet"),
            ContactTextField(
              controller: _sujetController,
              hint: "De quoi veux-tu parler ?",
              icon: Icons.subject,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return "Le sujet est requis";
                }
                return null;
              },
            ),

            const SizedBox(height: 18),

            // Champ Message
            ContactFieldLabel("Message"),
            ContactTextField(
              controller: _messageController,
              hint: "Écris ton message ici...",
              icon: Icons.message_outlined,
              maxLines: 5,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return "Le message est requis";
                }
                if (value.trim().length < 10) {
                  return "Message trop court (10 caractères min.)";
                }
                return null;
              },
            ),

            const SizedBox(height: 28),

            // Bouton envoyer
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                  elevation: 0,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                icon: _isSending
                    ? const SizedBox(
                  width: 18,
                  height: 18,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: Colors.white,
                  ),
                )
                    : const Icon(Icons.send_rounded, size: 18),
                label: Text(
                  _isSending ? "Envoi en cours..." : "Envoyer le message",
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                onPressed: _isSending ? null : _envoyer,
              ),
            ),

            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}