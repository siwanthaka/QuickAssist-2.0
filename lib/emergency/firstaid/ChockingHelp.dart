import 'package:flutter/material.dart';

class ChockingHelp extends StatelessWidget {
  const ChockingHelp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0E0E0E),
      appBar: AppBar(
        title: const Text("Choking Emergency"),
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
            title: "Check If the Person Can Breathe",
            imagePath: "assets/first_aid/chocking/1.png",
            description:
            "Ask the person if they are choking. If they can cough, speak, or breathe, "
                "encourage them to continue coughing. Do not interfere unless breathing stops.",
          ),

          /// Step 2
          _InstructionCard(
            step: "2",
            title: "Give Back Blows",
            imagePath: "assets/first_aid/chocking/2.png",
            description:
            "Stand slightly behind the person and lean them forward. "
                "Deliver up to 5 firm back blows between the shoulder blades using the heel of your hand.",
          ),

          /// Step 3
          _InstructionCard(
            step: "3",
            title: "Perform Abdominal Thrusts",
            imagePath: "assets/first_aid/chocking/3.png",
            description:
            "If back blows fail, perform abdominal thrusts (Heimlich maneuver). "
                "Place your fist above the navel, grasp it with the other hand, and thrust inward and upward.",
          ),

          /// Step 4
          _InstructionCard(
            step: "4",
            title: "Repeat Until Object Is Removed",
            imagePath: "assets/first_aid/chocking/4.png",
            description:
            "Alternate between 5 back blows and 5 abdominal thrusts "
                "until the object is expelled or the person becomes unconscious.",
          ),

          /// Step 5
          _InstructionCard(
            step: "5",
            title: "Call Emergency Services",
            imagePath: "assets/first_aid/chocking/5.png",
            description:
            "If the person collapses or choking continues, "
                "call emergency services immediately and begin CPR if trained.",
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
              "Choking can block breathing and become fatal within minutes.\nAct immediately.",
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
        "If choking is not resolved quickly, seek emergency medical help immediately.",
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
