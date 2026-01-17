import 'package:flutter/material.dart';

class PersonalDetailsCard extends StatelessWidget {
  const PersonalDetailsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.grey.shade900,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade800),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Personal Emergency Info',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: 6),
              Text(
                'Blood Group: --',
                style: TextStyle(color: Colors.white),
              ),
              Text(
                'Age: --',
                style: TextStyle(color: Colors.white),
              ),
              Text(
                'Emergency Contact: --',
                style: TextStyle(color: Colors.white),
              ),
              Text(
                'Allergies: --',
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
          Icon(
            Icons.edit,
            color: Colors.redAccent,
          ),
        ],
      ),
    );
  }
}
