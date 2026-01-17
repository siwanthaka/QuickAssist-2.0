import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0E0E0E),
      appBar: AppBar(
        title: const Text(
          'Settings',
          style: TextStyle(fontWeight: FontWeight.bold),
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
              // TODO: Navigate to Edit SOS Number Screen (SQLite)
            },
          ),

          _settingTile(
            icon: Icons.location_on,
            title: 'Live Location Number',
            subtitle: 'Change SMS receiver number',
            onTap: () {
              // TODO: Navigate to Live Location Number Screen (SQLite)
            },
          ),

          const SizedBox(height: 24),
          _sectionTitle('Personal'),

          _settingTile(
            icon: Icons.person,
            title: 'Personal Details',
            subtitle: 'Blood group, allergies, medical info',
            onTap: () {
              // TODO: Navigate to Personal Details Screen (SQLite)
            },
          ),
        ],
      ),
    );
  }

  // 🔹 Section Title
  Widget _sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.redAccent,
          fontSize: 14,
          letterSpacing: 1,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  // 🔹 Setting Tile
  Widget _settingTile({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
    Color iconColor = Colors.redAccent,
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
          child: Icon(icon, color: iconColor),
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
