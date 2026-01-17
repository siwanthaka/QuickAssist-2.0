import 'package:flutter/material.dart';
import '../database/app_database.dart';

class EditLiveLocationNumberScreen extends StatefulWidget {
  const EditLiveLocationNumberScreen({super.key});

  @override
  State<EditLiveLocationNumberScreen> createState() =>
      _EditLiveLocationNumberScreenState();
}

class _EditLiveLocationNumberScreenState
    extends State<EditLiveLocationNumberScreen> {
  final _controller = TextEditingController();
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _loadNumber();
  }

  Future<void> _loadNumber() async {
    final number = await AppDatabase.getLiveLocationNumber();
    if (number != null) {
      _controller.text = number;
    }
    setState(() => _loading = false);
  }

  Future<void> _save() async {
    final number = _controller.text.trim();

    if (number.length < 9) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Enter a valid phone number')),
      );
      return;
    }

    await AppDatabase.saveLiveLocationNumber(number);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Live location number saved')),
    );

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0E0E0E),
      appBar: AppBar(
        title: const Text('Live Location Number'),
        backgroundColor: Colors.black,
      ),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              keyboardType: TextInputType.phone,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelText: 'SMS Receiver Number',
                labelStyle: const TextStyle(color: Colors.white70),
                filled: true,
                fillColor: Colors.grey.shade900,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                onPressed: _save,
                child: const Text('Save'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
