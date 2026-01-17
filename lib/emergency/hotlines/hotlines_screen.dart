import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HotlinesScreen extends StatelessWidget {
  const HotlinesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Emergency Hotlines (Sri Lanka)'),
        backgroundColor: Colors.black,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          HotlineTile(
            title: 'Police Emergency',
            number: '0750818024',
            icon: Icons.local_police,
          ),
          HotlineTile(
            title: 'Ambulance / Suwa Seriya',
            number: '1990',
            icon: Icons.local_hospital,
          ),
          HotlineTile(
            title: 'Fire & Rescue',
            number: '110',
            icon: Icons.fire_truck,
          ),
          HotlineTile(
            title: 'Disaster Management Centre',
            number: '117',
            icon: Icons.warning,
          ),
          HotlineTile(
            title: 'Child & Women Protection',
            number: '1938',
            icon: Icons.family_restroom,
          ),
          HotlineTile(
            title: 'Tourist Police',
            number: '1912',
            icon: Icons.travel_explore,
          ),
          HotlineTile(
            title: 'Electricity Emergency (CEB)',
            number: '1987',
            icon: Icons.electric_bolt,
          ),
        ],
      ),
    );
  }
}

class HotlineTile extends StatelessWidget {
  final String title;
  final String number;
  final IconData icon;

  const HotlineTile({
    super.key,
    required this.title,
    required this.number,
    required this.icon,
  });

  Future<void> _callNumber() async {
    final uri = Uri.parse('tel:$number');
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.red, size: 32),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  number,
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(Icons.call, color: Colors.green),
            onPressed: _callNumber,
          ),
        ],
      ),
    );
  }
}
