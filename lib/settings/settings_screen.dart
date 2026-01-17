import 'package:flutter/material.dart';

// Screens
import 'edit_sos_number_screen.dart';
import 'edit_live_location_number_screen.dart';
import 'edit_personal_detail_screen.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0E0E0E),
      appBar: AppBar(
        title: const Text(
          'Settings',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            letterSpacing: 0.6,
          ),
        ),
        backgroundColor: Colors.black,
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _sectionTitle('Emergency Settings'),

          _settingTile(
            icon: Icons.phone,
            title: 'Edit SOS Number',
            subtitle: 'Change emergency call number',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const EditSosNumberScreen(),
                ),
              );
            },
          ),

          _settingTile(
            icon: Icons.location_on,
            title: 'Live Location Number',
            subtitle: 'Change SMS receiver number',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const EditLiveLocationNumberScreen(),
                ),
              );
            },
          ),

          const SizedBox(height: 28),
          _sectionTitle('Personal'),

          _settingTile(
            icon: Icons.person,
            title: 'Personal Details',
            subtitle: 'Edit emergency medical info',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const EditPersonalDetailScreen(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  // 🔹 Section header
  Widget _sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Text(
        title.toUpperCase(),
        style: const TextStyle(
          color: Colors.redAccent,
          fontSize: 13,
          letterSpacing: 1.2,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }

  // 🔹 Tile widget
  Widget _settingTile({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      decoration: BoxDecoration(
        color: Colors.grey.shade900,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade800),
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.black,
          child: Icon(icon, color: Colors.redAccent),
        ),
        title: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: const TextStyle(color: Colors.white70),
        ),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          size: 16,
          color: Colors.white38,
        ),
        onTap: onTap,
      ),
    );
  }
}
