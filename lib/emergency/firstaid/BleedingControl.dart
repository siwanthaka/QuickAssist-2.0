import 'package:flutter/material.dart';

class BleedingControl extends StatelessWidget {
  const BleedingControl({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0E0E0E),
      appBar: AppBar(
        title: const Text("Bleeding Control"),
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
            title: "Apply Firm Pressure",
            imagePath: "assets/first_aid/bleeding/pressure.png",
            description:
            "Use a clean cloth, bandage, or your hand to apply firm, direct pressure on the wound. "
                "This helps slow or stop bleeding by allowing blood to clot.",
          ),

          /// Step 2
          _InstructionCard(
            step: "2",
            title: "Elevate the Injured Area",
            imagePath: "assets/first_aid/bleeding/elevation.png",
            description:
            "If possible, raise the injured part above heart level. "
                "Elevation reduces blood flow and helps control bleeding.",
          ),

          /// Step 3
          _InstructionCard(
            step: "3",
            title: "Do NOT Remove Embedded Objects",
            imagePath: "assets/first_aid/bleeding/embedded.png",
            description:
            "If an object is deeply embedded in the wound, do NOT remove it. "
                "Removing it may cause severe bleeding. Apply pressure around the object instead.",
          ),

          /// Step 4
          _InstructionCard(
            step: "4",
            title: "Bandage Securely",
            imagePath: "assets/first_aid/bleeding/bandage.png",
            description:
            "Once bleeding slows, wrap the wound with a bandage firmly. "
                "Do not make it too tight. If blood soaks through, add more layers.",
          ),

          /// Step 5
          _InstructionCard(
            step: "5",
            title: "Watch for Shock",
            imagePath: "assets/first_aid/bleeding/shock1.png",
            description:
            "Signs of shock include pale skin, dizziness, rapid breathing, or confusion. "
                "Lay the person down, keep them warm, and seek emergency help immediately.",
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
              "Severe bleeding can be life-threatening.\nAct quickly and stay calm.",
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
        "If bleeding does not stop within 10 minutes or the wound is deep, "
            "seek professional medical help immediately.",
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
