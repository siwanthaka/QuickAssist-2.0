import 'package:flutter/material.dart';

import 'BasicKnots.dart';
import 'AdvancedKnots.dart';
import 'FishingKnots.dart';
import 'CampinhServivalKnots.dart';
import 'RescuAndEmergencyKnots.dart';

class KnotsScreen extends StatelessWidget {
  const KnotsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Knots & Ropes"),
        backgroundColor: Colors.black,
      ),
      body: GridView.count(
        padding: const EdgeInsets.all(16),
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        children: [
          _item(context, "Basic Knots", Icons.all_inclusive, const BasicKnots()),
          _item(context, "Advanced Knots", Icons.link, const AdvancedKnots()),
          _item(context, "Fishing Knots", Icons.phishing, const FishingKnots()),
          _item(context, "Camping Knots", Icons.terrain, const CampingServivalKnots()),
          _item(context, "Rescue Knots", Icons.health_and_safety, const RescueAndEmergencyKnots()),
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
