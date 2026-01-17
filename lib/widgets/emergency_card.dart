import 'package:flutter/material.dart';

class EmergencyCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final bool isDanger;
  final VoidCallback? onTap;

  const EmergencyCard({
    super.key,
    required this.title,
    required this.icon,
    this.isDanger = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final Color iconColor =
    isDanger ? Colors.redAccent : Colors.red;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF0F0F0F), // true dark black
          borderRadius: BorderRadius.circular(18),

          // 🧠 3D / NEUMORPHIC EFFECT
          boxShadow: [
            // light highlight (top-left)
            BoxShadow(
              color: Colors.white.withOpacity(0.04),
              offset: const Offset(-2, -2),
              blurRadius: 6,
            ),

            // dark shadow (bottom-right)
            BoxShadow(
              color: Colors.black.withOpacity(0.9),
              offset: const Offset(4, 4),
              blurRadius: 10,
            ),
          ],

          // subtle red glow ONLY for SOS
          border: isDanger
              ? Border.all(color: Colors.redAccent, width: 1.2)
              : Border.all(color: Colors.grey.shade900),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 42,
              color: iconColor,
            ),
            const SizedBox(height: 12),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
