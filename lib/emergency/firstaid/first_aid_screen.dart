import 'package:flutter/material.dart';

import 'BurnTreatment.dart';
import 'ChockingHelp.dart';
import 'Fainting.dart';
import 'BoneFracture.dart';
import 'BleedingControl.dart';

class FirstAidScreen extends StatelessWidget {
  const FirstAidScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("First Aid"),
        backgroundColor: Colors.black,
      ),
      body: GridView.count(
        padding: const EdgeInsets.all(16),
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        children: [
          _item(context, "Bleeding Control", Icons.bloodtype, const BleedingControl()),
          _item(context, "Bone Fracture", Icons.accessibility, const BoneFracture()),
          _item(context, "Burn Treatment", Icons.local_fire_department, const BurnTreatment()),
          _item(context, "Choking Help", Icons.air, const ChockingHelp()),
          _item(context, "Fainting", Icons.health_and_safety, const Fainting()),
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
