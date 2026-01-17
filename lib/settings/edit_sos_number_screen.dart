import 'package:flutter/material.dart';
import '../database/app_database.dart';

class EditSosNumberScreen extends StatefulWidget {
  const EditSosNumberScreen({super.key});

  @override
  State<EditSosNumberScreen> createState() => _EditSosNumberScreenState();
}

class _EditSosNumberScreenState extends State<EditSosNumberScreen> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadNumber();
  }

  Future<void> _loadNumber() async {
    final number = await AppDatabase.getSosNumber();
    if (number != null) {
      _controller.text = number;
    }
  }

  Future<void> _save() async {
    if (_controller.text.length < 9) return;

    await AppDatabase.saveSosNumber(_controller.text);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0E0E0E),
      appBar: AppBar(
        title: const Text('Edit SOS Number'),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              keyboardType: TextInputType.phone,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                labelText: 'SOS Phone Number',
                labelStyle: TextStyle(color: Colors.redAccent),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.redAccent),
                ),
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                minimumSize: const Size(double.infinity, 48),
              ),
              onPressed: _save,
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
