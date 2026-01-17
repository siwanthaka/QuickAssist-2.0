import 'package:flutter/material.dart';

class AdvancedKnots extends StatelessWidget {
  const AdvancedKnots({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Advanced Knots"),
        backgroundColor: Colors.black,
      ),
      body: const Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            StepText("Use advanced knots only when necessary."),
            StepText("Follow step-by-step knot instructions."),
            StepText("Ensure equal tension on both ends."),
            StepText("Double-check knot security."),
            StepText("Practice before emergency use."),
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
