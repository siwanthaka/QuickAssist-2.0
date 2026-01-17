import 'package:flutter/material.dart';

class BleedingControl extends StatelessWidget {
  const BleedingControl({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Bleeding Control"),
        backgroundColor: Colors.black,
      ),
      body: const Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            StepText("Apply firm pressure with a clean cloth or bandage."),
            StepText("Raise the injured area if possible."),
            StepText("Do not remove deeply embedded objects."),
            StepText("Get medical help immediately."),
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
