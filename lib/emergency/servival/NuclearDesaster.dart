import 'package:flutter/material.dart';

class NuclearDesaster extends StatelessWidget {
  const NuclearDesaster({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Nuclear Disaster Safety"),
        backgroundColor: Colors.black,
      ),
      body: const Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            StepText("Move indoors immediately."),
            StepText("Close all windows and doors."),
            StepText("Stay away from contaminated areas."),
            StepText("Follow official emergency broadcasts."),
            StepText("Do not consume exposed food or water."),
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
