import 'package:flutter/material.dart';

class FixingwaterLeaks extends StatelessWidget {
  const FixingwaterLeaks({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Fixing Water Leaks"),
        backgroundColor: Colors.black,
      ),
      body: const Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            StepText("Shut off the main water valve."),
            StepText("Dry the leaking area."),
            StepText("Apply sealing tape or compound."),
            StepText("Avoid using the pipe until fixed."),
            StepText("Contact a plumber if leak persists."),
          ],
        ),
      ),
    );
  }
}

class StepText extends StatelessWidget {
  final String text;
  const StepText(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Text(
        "• $text",
        style: const TextStyle(color: Colors.white70, fontSize: 16),
      ),
    );
  }
}
