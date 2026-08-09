import 'package:flutter/material.dart';
import 'avis.dart';
import 'avisWidget.dart';

class PizzaDetailsAvis extends StatefulWidget {
  const PizzaDetailsAvis({
    super.key,
    required this.avis,
    this.initialCount = 1,
    this.step = 3,
  });

  final List<Avis> avis;
  final int initialCount;
  final int step;

  @override
  State<PizzaDetailsAvis> createState() => _PizzaDetailsAvisState();
}

class _PizzaDetailsAvisState extends State<PizzaDetailsAvis> {
  late int _visibleCount = widget.initialCount.clamp(0, widget.avis.length);

  void _voirPlus() {
    setState(() {
      _visibleCount =
          (_visibleCount + widget.step).clamp(0, widget.avis.length);
    });
  }

  void _voirMoins() {
    setState(() {
      _visibleCount = widget.initialCount.clamp(0, widget.avis.length);
    });
  }

  @override
  Widget build(BuildContext context) {
    if (widget.avis.isEmpty) {
      return const SizedBox.shrink();
    }

    final double moyenne =
        widget.avis.map((a) => a.note).reduce((a, b) => a + b) /
            widget.avis.length;

    final bool hasMore = _visibleCount < widget.avis.length;
    final bool canCollapse = _visibleCount > widget.initialCount;
    final visibles = widget.avis.take(_visibleCount).toList();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                "Avis (${widget.avis.length})",
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(width: 8),
              const Icon(Icons.star_rounded, size: 18, color: Colors.amber),
              Text(
                moyenne.toStringAsFixed(1),
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),

          ...visibles.map((a) => AvisWidget(avis: a)),

          if (hasMore || canCollapse)
            Padding(
              padding: const EdgeInsets.only(top: 4, bottom: 8),
              child: Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (hasMore)
                      _PillButton(
                        label: "Voir plus d'avis",
                        icon: Icons.keyboard_arrow_down,
                        onTap: _voirPlus,
                      ),
                    if (hasMore && canCollapse) const SizedBox(width: 10),
                    if (canCollapse)
                      _PillButton(
                        label: "Voir moins",
                        icon: Icons.keyboard_arrow_up,
                        onTap: _voirMoins,
                      ),
                  ],
                ),
              ),
            ),

          const SizedBox(height: 100),
        ],
      ),
    );
  }
}

class _PillButton extends StatelessWidget {
  const _PillButton({
    required this.label,
    required this.icon,
    required this.onTap,
  });

  final String label;
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(30),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.red.shade50,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              label,
              style: TextStyle(
                color: Colors.red.shade400,
                fontWeight: FontWeight.w600,
                fontSize: 13,
              ),
            ),
            const SizedBox(width: 4),
            Icon(icon, size: 18, color: Colors.red.shade400),
          ],
        ),
      ),
    );
  }
}