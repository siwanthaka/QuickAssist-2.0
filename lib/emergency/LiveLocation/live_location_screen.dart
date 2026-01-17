import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:quick_assist_2/database/app_database.dart';


class LiveLocationScreen extends StatefulWidget {
  const LiveLocationScreen({super.key});

  @override
  State<LiveLocationScreen> createState() => _LiveLocationScreenState();
}

class _LiveLocationScreenState extends State<LiveLocationScreen> {
  bool _alreadySent = false;
  String _statusText = 'Preparing to share location…';
  String? _emergencyNumber;

  @override
  void initState() {
    super.initState();
    _loadAndSend();
  }

  Future<void> _loadAndSend() async {
    // 0️⃣ Load number from DB
    final number = await AppDatabase.getLiveLocationNumber();

    if (number == null || number.isEmpty) {
      setState(() {
        _statusText =
        'Live location number not set.\nPlease set it in Settings.';
      });
      return;
    }

    _emergencyNumber = number;
    await _sendLiveLocation();
  }

  Future<void> _sendLiveLocation() async {
    if (_alreadySent) return;
    _alreadySent = true;

    setState(() {
      _statusText = 'Checking location permission…';
    });

    // 1️⃣ Permission check
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    if (permission == LocationPermission.deniedForever) {
      setState(() {
        _statusText =
        'Location permission permanently denied.\nEnable it in system settings.';
      });
      return;
    }

    setState(() {
      _statusText = 'Getting current location…';
    });

    // 2️⃣ Get GPS position
    final position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    final double lat = position.latitude;
    final double lng = position.longitude;

    // 3️⃣ Google Maps link
    final String mapsLink =
        'https://maps.google.com/?q=$lat,$lng';

    final String message =
        '🚨 EMERGENCY!\nI need help.\nMy live location:\n$mapsLink';

    setState(() {
      _statusText = 'Opening SMS app…';
    });

    // 4️⃣ Open SMS app
    final Uri smsUri = Uri(
      scheme: 'sms',
      path: _emergencyNumber,
      queryParameters: {
        'body': message,
      },
    );

    await launchUrl(smsUri);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.location_on,
                  color: Colors.red,
                  size: 100,
                ),
                const SizedBox(height: 24),
                const Text(
                  'LIVE LOCATION',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  _statusText,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 30),
                const Text(
                  'Please press SEND in the SMS app',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 40),

                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey.shade800,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 12,
                    ),
                  ),
                  icon: const Icon(Icons.arrow_back),
                  label: const Text('Back'),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
