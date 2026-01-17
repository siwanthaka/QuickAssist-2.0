import 'package:flutter/material.dart';

class RescueAndEmergencyKnots extends StatelessWidget {
  const RescueAndEmergencyKnots({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Rescue & Emergency Knots"),
        backgroundColor: Colors.black,
      ),
      body: const Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            StepText("Use strong, load-bearing rope."),
            StepText("Ensure knot can be untied quickly."),
            StepText("Double-check knot strength."),
            StepText("Never use damaged rope."),
            StepText("Practice rescue knots beforehand."),
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
