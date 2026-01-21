import 'package:flutter/material.dart';

class BoneFracture extends StatelessWidget {
  const BoneFracture({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0E0E0E),
      appBar: AppBar(
        title: const Text("Bone Fracture"),
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
            title: "Keep the Person Still",
            imagePath: "assets/first_aid/fracture/1.png",
            description:
            "Do not move the injured person unless absolutely necessary. "
                "Movement can worsen the fracture and cause further injury.",
          ),

          /// Step 2
          _InstructionCard(
            step: "2",
            title: "Immobilize the Injured Area",
            imagePath: "assets/first_aid/fracture/2.png",
            description:
            "Support the injured limb in the position you found it. "
                "Use a splint, rolled newspaper, or stick to prevent movement.",
          ),

          /// Step 3
          _InstructionCard(
            step: "3",
            title: "Apply Cold Compress",
            imagePath: "assets/first_aid/fracture/3.png",
            description:
            "Apply an ice pack or cold compress wrapped in cloth. "
                "This helps reduce swelling and pain. Do not apply ice directly to skin.",
          ),

          /// Step 4
          _InstructionCard(
            step: "4",
            title: "Stop Any Bleeding",
            imagePath: "assets/first_aid/fracture/4.png",
            description:
            "If there is bleeding, apply gentle pressure with a clean cloth. "
                "Do not press directly on exposed bone.",
          ),

          /// Step 5
          _InstructionCard(
            step: "5",
            title: "Seek Medical Help Immediately",
            imagePath: "assets/first_aid/fracture/5.png",
            description:
            "Fractures require professional medical treatment. "
                "Call emergency services or take the person to a hospital as soon as possible.",
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
              "Suspected bone fractures can be serious.\nDo not attempt to straighten the bone.",
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
        "Do not give food or drink to the injured person. "
            "Keep them warm and calm until medical help arrives.",
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
