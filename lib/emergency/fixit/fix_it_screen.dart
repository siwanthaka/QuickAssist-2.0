import 'package:flutter/material.dart';

import 'ApplianceFix.dart';
import 'BasicElectrical.dart';
import 'BasicPlumbing.dart';
import 'DoorHingeRepairs.dart';
import 'FixingwaterLeaks.dart';

class FixItScreen extends StatelessWidget {
  const FixItScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Fix & Repair"),
        backgroundColor: Colors.black,
      ),
      body: GridView.count(
        padding: const EdgeInsets.all(16),
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        children: [
          _item(context, "Appliance Fix", Icons.kitchen, const ApplianceFix()),
          _item(context, "Basic Electrical", Icons.electrical_services, const BasicElectrical()),
          _item(context, "Basic Plumbing", Icons.plumbing, const BasicPlumbing()),
          _item(context, "Door Hinge Repair", Icons.door_front_door, const DoorHingeRepairs()),
          _item(context, "Water Leak Fix", Icons.water_drop, const FixingwaterLeaks()),
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
