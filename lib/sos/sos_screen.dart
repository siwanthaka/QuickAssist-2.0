import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:permission_handler/permission_handler.dart';

import '../database/app_database.dart';

class SosScreen extends StatefulWidget {
  const SosScreen({super.key});

  @override
  State<SosScreen> createState() => _SosScreenState();
}

class _SosScreenState extends State<SosScreen> {
  String sosNumber = '';
  bool _hasCalled = false;
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _loadNumberAndCall();
  }

  /// 🔴 Load SOS number from SQLite then call
  Future<void> _loadNumberAndCall() async {
    final number = await AppDatabase.getSosNumber();

    if (number == null || number.isEmpty) {
      setState(() {
        sosNumber = 'NOT SET';
        _loading = false;
      });
      return;
    }

    sosNumber = number;
    setState(() => _loading = false);

    await _startSosCall();
  }

  /// 📞 Direct call logic
  Future<void> _startSosCall() async {
    if (_hasCalled) return;
    _hasCalled = true;

    final permission = await Permission.phone.request();

    if (permission.isGranted) {
      await FlutterPhoneDirectCaller.callNumber(sosNumber);
    } else {
      debugPrint('CALL_PHONE permission denied');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Center(
          child: _loading
              ? const CircularProgressIndicator(color: Colors.red)
              : Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.sos,
                color: Colors.red,
                size: 100,
              ),
              const SizedBox(height: 24),
              const Text(
                'EMERGENCY SOS',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                sosNumber == 'NOT SET'
                    ? 'SOS number not configured'
                    : 'Calling $sosNumber',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                'Please stay calm.\nHelp is being contacted.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 40),

              /// ❌ Cancel Button
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey.shade800,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 12,
                  ),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.close),
                label: const Text('Cancel'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
