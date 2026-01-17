import 'package:flutter/material.dart';

class VirusOutbreak extends StatelessWidget {
  const VirusOutbreak({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Virus Outbreak Safety"),
        backgroundColor: Colors.black,
      ),
      body: const Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            StepText("Wash hands frequently."),
            StepText("Wear masks in crowded areas."),
            StepText("Avoid close contact with sick people."),
            StepText("Follow health authority guidelines."),
            StepText("Seek medical advice if symptoms appear."),
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
