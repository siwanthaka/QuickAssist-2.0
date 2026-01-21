import 'package:flutter/material.dart';

class Fainting extends StatelessWidget {
  const Fainting({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0E0E0E),
      appBar: AppBar(
        title: const Text("Fainting Emergency"),
        backgroundColor: Colors.black,
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [

          /// 🚨 Warning
          _WarningBox(),

          SizedBox(height: 20),

          /// Step 1
          _InstructionCard(
            step: "1",
            title: "Lay the Person Flat",
            imagePath: "assets/first_aid/fainting/1.png",
            description:
            "Gently help the person lie flat on their back. "
                "This improves blood flow to the brain and helps recovery.",
          ),

          /// Step 2
          _InstructionCard(
            step: "2",
            title: "Raise the Legs",
            imagePath: "assets/first_aid/fainting/2.png",
            description:
            "Raise the person's legs about 12 inches above heart level. "
                "This helps restore blood circulation to the brain.",
          ),

          /// Step 3
          _InstructionCard(
            step: "3",
            title: "Loosen Tight Clothing",
            imagePath: "assets/first_aid/fainting/3.png",
            description:
            "Loosen tight clothing such as belts, collars, or ties. "
                "Ensure fresh air circulation around the person.",
          ),

          /// Step 4
          _InstructionCard(
            step: "4",
            title: "Check Breathing & Consciousness",
            imagePath: "assets/first_aid/fainting/4.png",
            description:
            "Check if the person is breathing normally and regaining consciousness. "
                "Do not give food or drink until fully alert.",
          ),

          /// Step 5
          _InstructionCard(
            step: "5",
            title: "Seek Medical Help",
            imagePath: "assets/first_aid/fainting/5.png",
            description:
            "Call emergency services if the person does not wake up within one minute, "
                "faints repeatedly, or shows signs of injury.",
          ),

          SizedBox(height: 30),

          /// Final Note
          _FinalNote(),
        ],
      ),
    );
  }
}

/// ⚠️ Emergency Warning Box
class _WarningBox extends StatelessWidget {
  const _WarningBox();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.red.withOpacity(0.15),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.red),
      ),
      child: const Row(
        children: [
          Icon(Icons.warning_amber_rounded, color: Colors.red, size: 30),
          SizedBox(width: 12),
          Expanded(
            child: Text(
              "Fainting may indicate serious medical conditions.\nAlways monitor closely.",
              style: TextStyle(color: Colors.white, fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }
}

/// 🧱 Instruction Card
class _InstructionCard extends StatelessWidget {
  final String step;
  final String title;
  final String imagePath;
  final String description;

  const _InstructionCard({
    required this.step,
    required this.title,
    required this.imagePath,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey.shade900,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Colors.grey.shade800),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.red,
                child: Text(
                  step,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Text(
                title,
                style: const TextStyle(
                  color: Colors.redAccent,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),

          const SizedBox(height: 14),

          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              imagePath,
              height: 180,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),

          const SizedBox(height: 12),

          Text(
            description,
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 14,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}

/// ✅ Final Instruction
class _FinalNote extends StatelessWidget {
  const _FinalNote();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.redAccent),
      ),
      child: const Text(
        "If fainting occurs repeatedly or after injury, seek medical attention immediately.",
        style: TextStyle(
          color: Colors.white,
          fontSize: 14,
          height: 1.4,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
