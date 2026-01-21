import 'package:flutter/material.dart';

class BurnTreatment extends StatelessWidget {
  const BurnTreatment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0E0E0E),
      appBar: AppBar(
        title: const Text("Burn Treatment"),
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
            title: "Remove from Heat Source",
            imagePath: "assets/first_aid/burn/1.png",
            description:
            "Move the person away from fire, hot objects, electricity, or chemicals immediately. "
                "Ensure the area is safe before giving first aid.",
          ),

          /// Step 2
          _InstructionCard(
            step: "2",
            title: "Cool the Burn",
            imagePath: "assets/first_aid/burn/2.png",
            description:
            "Cool the burn under cool (not cold) running water for at least 10–20 minutes. "
                "This helps reduce pain, swelling, and further skin damage.",
          ),

          /// Step 3
          _InstructionCard(
            step: "3",
            title: "Remove Tight Items",
            imagePath: "assets/first_aid/burn/3.png",
            description:
            "Carefully remove rings, watches, or tight clothing near the burn before swelling begins. "
                "Do not remove clothing stuck to the burn.",
          ),

          /// Step 4
          _InstructionCard(
            step: "4",
            title: "Cover the Burn",
            imagePath: "assets/first_aid/burn/4.png",
            description:
            "Cover the burn loosely with a clean, non-stick cloth or sterile dressing. "
                "This protects the area from infection and reduces pain.",
          ),

          /// Step 5
          _InstructionCard(
            step: "5",
            title: "Seek Medical Help",
            imagePath: "assets/first_aid/burn/5.png",
            description:
            "Get medical help immediately if the burn is large, deep, blistering, "
                "or affects the face, hands, feet, or genitals.",
          ),

          SizedBox(height: 30),

          /// Final Note
          _FinalNote(),
        ],
      ),
    );
  }
}

////////////////////////////////////////////////////////////////
/// ⚠️ Emergency Warning Box
////////////////////////////////////////////////////////////////
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
              "Severe burns can be life-threatening.\nAct quickly and avoid home remedies.",
              style: TextStyle(color: Colors.white, fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }
}

////////////////////////////////////////////////////////////////
/// 🧱 Instruction Card
////////////////////////////////////////////////////////////////
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

////////////////////////////////////////////////////////////////
/// ✅ Final Instruction
////////////////////////////////////////////////////////////////
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
        "Do NOT apply ice, toothpaste, butter, or oil on burns. "
            "Always seek professional medical help for serious burns.",
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
