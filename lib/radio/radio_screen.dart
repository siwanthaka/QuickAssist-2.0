import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class RadioScreen extends StatefulWidget {
  const RadioScreen({super.key});

  @override
  State<RadioScreen> createState() => _RadioScreenState();
}

class _RadioScreenState extends State<RadioScreen> {
  final AudioPlayer _player = AudioPlayer();
  bool _isPlaying = false;

  // 🔴 ONE ONLINE FM RADIO (example – replace later if needed)
  final String radioUrl =
      'https://stream.rcs.revma.com/ypqt40u0x1zuv'; // example stream

  Future<void> _playRadio() async {
    try {
      await _player.setUrl(radioUrl);
      _player.play();
      setState(() => _isPlaying = true);
    } catch (e) {
      debugPrint('Radio error: $e');
    }
  }

  void _stopRadio() {
    _player.stop();
    setState(() => _isPlaying = false);
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Emergency Radio'),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.radio, color: Colors.red, size: 100),
            const SizedBox(height: 20),

            const Text(
              'Sri Lanka Emergency FM',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            Text(
              _isPlaying ? 'Radio Playing...' : 'Radio Stopped',
              style: const TextStyle(color: Colors.white70),
            ),

            const SizedBox(height: 30),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 14,
                ),
              ),
              onPressed: _isPlaying ? _stopRadio : _playRadio,
              child: Text(
                _isPlaying ? 'STOP RADIO' : 'PLAY RADIO',
                style: const TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
