import 'package:flutter/material.dart';

class FloodSafety extends StatelessWidget {
  const FloodSafety({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Flood Safety"),
        backgroundColor: Colors.black,
      ),
      body: const Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            StepText("Move to higher ground immediately."),
            StepText("Avoid walking or driving through flood water."),
            StepText("Turn off electricity if flooding occurs."),
            StepText("Stay away from downed power lines."),
            StepText("Listen to emergency alerts."),
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
