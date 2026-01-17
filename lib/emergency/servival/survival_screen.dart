import 'package:flutter/material.dart';

import 'AnimalBite.dart';
import 'FireSafety.dart';
import 'FloodSafety.dart';
import 'NuclearDesaster.dart';
import 'PowerOutage.dart';
import 'VirusOutbreak.dart';

class SurvivalScreen extends StatelessWidget {
  const SurvivalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Emergency & Survival"),
        backgroundColor: Colors.black,
      ),
      body: GridView.count(
        padding: const EdgeInsets.all(16),
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        children: [
          _item(context, "Fire Safety", Icons.local_fire_department, const FireSafety()),
          _item(context, "Flood Safety", Icons.water, const FloodSafety()),
          _item(context, "Animal Bite", Icons.pets, const AnimalBite()),
          _item(context, "Power Outage", Icons.flash_off, const PowerOutage()),
          _item(context, "Virus Outbreak", Icons.coronavirus, const VirusOutbreak()),
          _item(context, "Nuclear Disaster", Icons.warning, const NuclearDesaster()),
        ],
      ),
    );
  }

  Widget _item(
      BuildContext context,
      String title,
      IconData icon,
      Widget page,
      ) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => page),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[900],
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.white, size: 36),
            const SizedBox(height: 10),
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
