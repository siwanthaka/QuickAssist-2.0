import 'package:flutter/material.dart';

class CampingServivalKnots extends StatelessWidget {
  const CampingServivalKnots({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Camping & Survival Knots"),
        backgroundColor: Colors.black,
      ),
      body: const Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            StepText("Use knots suitable for outdoor conditions."),
            StepText("Secure tents and shelters firmly."),
            StepText("Avoid knots that slip under tension."),
            StepText("Practice knots before camping."),
            StepText("Check knots regularly."),
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
