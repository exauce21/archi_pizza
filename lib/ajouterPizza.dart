import 'package:flutter/material.dart';
import 'TopBarMenu.dart';
import 'bottomBarMenu.dart';
import 'recette.dart';

class AjouterPizza extends StatefulWidget {
  const AjouterPizza({super.key});

  @override
  State<AjouterPizza> createState() => _AjouterPizzaState();
}

class _AjouterPizzaState extends State<AjouterPizza> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _imageController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _prixController = TextEditingController();

  bool _isSaving = false;

  @override
  void dispose() {
    _titleController.dispose();
    _userController.dispose();
    _imageController.dispose();
    _descriptionController.dispose();
    _prixController.dispose();
    super.dispose();
  }

  void _enregistrer() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isSaving = true);
    await Future.delayed(const Duration(milliseconds: 400));

    final nouvellePizza = Recette(
      DateTime.now().millisecondsSinceEpoch.toString(), // id
      _titleController.text.trim(),                      // title
      _userController.text.trim(),                       // user
      _imageController.text.trim(),                       // imageUrl
      _descriptionController.text.trim(),                  // description
      false,                                               // isFavorite
      0,                                                   // favoriteCount
      double.parse(_prixController.text.trim().replaceAll(',', '.')), // prix
      [],                                                  // images
      "20min",                                             // duree
      4.5,                                                 // note
      null,                                                // reduction
      "Classiques",                                        // categorie
    );

    if (!mounted) return;
    Navigator.pop(context, nouvellePizza);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: Topbarmenu(title: 'Ajouter une pizza'),
      bottomNavigationBar: const Bottombarmenu(),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            _FieldLabel("Nom de la pizza"),
            _FormField(
              controller: _titleController,
              hint: "Ex : Pizza 4 Fromages",
              icon: Icons.local_pizza_outlined,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return "Le nom est requis";
                }
                return null;
              },
            ),

            const SizedBox(height: 18),

            _FieldLabel("Auteur"),
            _FormField(
              controller: _userController,
              hint: "Ex : Par Michel dupont",
              icon: Icons.person_outline,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return "L'auteur est requis";
                }
                return null;
              },
            ),

            const SizedBox(height: 18),

            _FieldLabel("URL de l'image"),
            _FormField(
              controller: _imageController,
              hint: "https://...",
              icon: Icons.image_outlined,
              keyboardType: TextInputType.url,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return "L'URL de l'image est requise";
                }
                final uri = Uri.tryParse(value.trim());
                if (uri == null || !uri.isAbsolute) {
                  return "URL invalide";
                }
                return null;
              },
            ),

            // Aperçu de l'image
            AnimatedBuilder(
              animation: _imageController,
              builder: (context, _) {
                final url = _imageController.text.trim();
                final uri = Uri.tryParse(url);
                if (url.isEmpty || uri == null || !uri.isAbsolute) {
                  return const SizedBox.shrink();
                }
                return Padding(
                  padding: const EdgeInsets.only(top: 12),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.network(
                      url,
                      height: 140,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => Container(
                        height: 140,
                        alignment: Alignment.center,
                        color: Colors.grey.shade100,
                        child: Text(
                          "Image non chargeable",
                          style: TextStyle(color: Colors.grey.shade500),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),

            const SizedBox(height: 18),

            _FieldLabel("Description"),
            _FormField(
              controller: _descriptionController,
              hint: "Décris la pizza en quelques mots",
              icon: Icons.description_outlined,
              maxLines: 3,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return "La description est requise";
                }
                return null;
              },
            ),

            const SizedBox(height: 18),

            _FieldLabel("Prix (€)"),
            _FormField(
              controller: _prixController,
              hint: "Ex : 12.50",
              icon: Icons.euro_outlined,
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return "Le prix est requis";
                }
                final parsed = double.tryParse(value.trim().replaceAll(',', '.'));
                if (parsed == null || parsed <= 0) {
                  return "Prix invalide";
                }
                return null;
              },
            ),

            const SizedBox(height: 28),

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
                icon: _isSaving
                    ? const SizedBox(
                  width: 18,
                  height: 18,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: Colors.white,
                  ),
                )
                    : const Icon(Icons.check, size: 20),
                label: Text(
                  _isSaving ? "Enregistrement..." : "Ajouter la pizza",
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                onPressed: _isSaving ? null : _enregistrer,
              ),
            ),

            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}

class _FieldLabel extends StatelessWidget {
  const _FieldLabel(this.label);
  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 4, bottom: 8),
      child: Text(
        label,
        style: const TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w600,
          color: Colors.black87,
        ),
      ),
    );
  }
}

class _FormField extends StatelessWidget {
  const _FormField({
    required this.controller,
    required this.hint,
    required this.icon,
    this.keyboardType,
    this.maxLines = 1,
    this.validator,
  });

  final TextEditingController controller;
  final String hint;
  final IconData icon;
  final TextInputType? keyboardType;
  final int maxLines;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        maxLines: maxLines,
        validator: validator,
        style: const TextStyle(fontSize: 14),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 14),
          prefixIcon: Padding(
            padding: EdgeInsets.only(bottom: maxLines > 1 ? 40 : 0),
            child: Icon(icon, color: Colors.grey.shade500, size: 20),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(color: Colors.red, width: 1.5),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(color: Colors.red, width: 1),
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        ),
      ),
    );
  }
}