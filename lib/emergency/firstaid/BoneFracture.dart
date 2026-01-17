import 'package:flutter/material.dart';

class BoneFracture extends StatelessWidget {
  const BoneFracture({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Bone Fracture"),
        backgroundColor: Colors.black,
      ),
      body: const Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            StepText("Keep the injured part still."),
            StepText("Do not try to realign the bone."),
            StepText("Apply ice to reduce swelling."),
            StepText("Seek medical attention immediately."),
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
