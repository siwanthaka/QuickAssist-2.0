import 'package:flutter/material.dart';
import '../database/app_database.dart';

class EditPersonalDetailScreen extends StatefulWidget {
  const EditPersonalDetailScreen({super.key});

  @override
  State<EditPersonalDetailScreen> createState() =>
      _EditPersonalDetailScreenState();
}

class _EditPersonalDetailScreenState extends State<EditPersonalDetailScreen> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _ageController = TextEditingController();
  final _bloodGroupController = TextEditingController();
  final _allergiesController = TextEditingController();
  final _medicalNotesController = TextEditingController();

  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  /// 🔹 Load saved data from SQLite
  Future<void> _loadData() async {
    final data = await AppDatabase.getPersonalDetails();

    if (data != null) {
      _nameController.text = data['name'] ?? '';
      _ageController.text = data['age'] ?? '';
      _bloodGroupController.text = data['blood_group'] ?? '';
      _allergiesController.text = data['allergies'] ?? '';
      _medicalNotesController.text = data['medical_notes'] ?? '';
    }

    setState(() => _loading = false);
  }

  /// 🔹 Save to SQLite
  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;

    await AppDatabase.savePersonalDetails(
      name: _nameController.text.trim(),
      age: _ageController.text.trim(),
      bloodGroup: _bloodGroupController.text.trim(),
      allergies: _allergiesController.text.trim(),
      medicalNotes: _medicalNotesController.text.trim(),
    );

    if (!mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Personal details saved successfully'),
        backgroundColor: Colors.green,
      ),
    );

    Navigator.pop(context);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _ageController.dispose();
    _bloodGroupController.dispose();
    _allergiesController.dispose();
    _medicalNotesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0E0E0E),
      appBar: AppBar(
        title: const Text(
          'Edit Personal Details',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.black,
        elevation: 0,
      ),
      body: _loading
          ? const Center(
        child: CircularProgressIndicator(color: Colors.red),
      )
          : SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              _input(
                controller: _nameController,
                label: 'Full Name',
                icon: Icons.person,
                validator: (v) =>
                v!.isEmpty ? 'Name required' : null,
              ),
              _input(
                controller: _ageController,
                label: 'Age',
                icon: Icons.cake,
                keyboardType: TextInputType.number,
                validator: (v) =>
                v!.isEmpty ? 'Age required' : null,
              ),
              _input(
                controller: _bloodGroupController,
                label: 'Blood Group',
                icon: Icons.bloodtype,
                hint: 'O+, A-, B+',
              ),
              _input(
                controller: _allergiesController,
                label: 'Allergies',
                icon: Icons.warning_amber,
                hint: 'Penicillin, peanuts...',
              ),
              _input(
                controller: _medicalNotesController,
                label: 'Medical Notes',
                icon: Icons.medical_information,
                maxLines: 3,
                hint: 'Asthma, diabetes, heart condition...',
              ),

              const SizedBox(height: 30),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  icon: const Icon(Icons.save),
                  label: const Text(
                    'Save Details',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: _save,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// 🔹 Reusable input field
  Widget _input({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    String? hint,
    int maxLines = 1,
    TextInputType keyboardType = TextInputType.text,
    String? Function(String?)? validator,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.grey.shade900,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.grey.shade800),
      ),
      child: TextFormField(
        controller: controller,
        maxLines: maxLines,
        keyboardType: keyboardType,
        style: const TextStyle(color: Colors.white),
        validator: validator,
        decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: Icon(icon, color: Colors.redAccent),
          labelText: label,
          hintText: hint,
          labelStyle: const TextStyle(color: Colors.white70),
          hintStyle: const TextStyle(color: Colors.white38),
          contentPadding:
          const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        ),
      ),
    );
  }
}
