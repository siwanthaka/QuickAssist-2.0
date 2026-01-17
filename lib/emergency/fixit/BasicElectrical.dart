import 'package:flutter/material.dart';

class BasicElectrical extends StatelessWidget {
  const BasicElectrical({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Basic Electrical Safety"),
        backgroundColor: Colors.black,
      ),
      body: const Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            StepText("Turn off main power before touching wires."),
            StepText("Use insulated tools only."),
            StepText("Never touch exposed wires."),
            StepText("Replace damaged plugs immediately."),
            StepText("Call an electrician if sparks appear."),
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
