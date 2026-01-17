import 'package:flutter/material.dart';

// Main category screens
import '../emergency/firstaid/first_aid_screen.dart';
import '../emergency/fixit/fix_it_screen.dart';
import '../emergency/servival/survival_screen.dart';
import '../emergency/knots/knots_screen.dart';
import '../emergency/hotlines/hotlines_screen.dart';
import '../emergency/LiveLocation/live_location_screen.dart';
import '../sos/sos_screen.dart';
import '../settings/settings_screen.dart';
import '../radio/radio_screen.dart';
import '../security/pin_dialog.dart';
import '../personal/personal_details_screen.dart';



// Widget
import '../widgets/emergency_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0E0E0E), // deep black

      /// 🔴 Emergency-style AppBar
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: const Text(
          'Quick Assist 2.0',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            letterSpacing: 0.8,
          ),
        ),
        backgroundColor: Colors.black,
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            /// 🔹 Header
            const Text(
              'Emergency Control Panel',
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.w700,
              ),
            ),

            const SizedBox(height: 6),

            const Text(
              'Fast access to life-saving tools',
              style: TextStyle(
                color: Colors.redAccent,
                fontSize: 13,
                letterSpacing: 0.5,
              ),
            ),

            const SizedBox(height: 22),

            /// 🔹 Grid
            Expanded(
              child: GridView.count(
                physics: const BouncingScrollPhysics(),
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                children: [

                  EmergencyCard(
                    title: 'First Aid',
                    icon: Icons.medical_services,
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const FirstAidScreen()),
                    ),
                  ),

                  EmergencyCard(
                    title: 'Emergency & Survival',
                    icon: Icons.warning_amber,
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const SurvivalScreen()),
                    ),
                  ),

                  EmergencyCard(
                    title: 'Fix & Repair',
                    icon: Icons.build,
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const FixItScreen()),
                    ),
                  ),

                  EmergencyCard(
                    title: 'Knots & Ropes',
                    icon: Icons.link,
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const KnotsScreen()),
                    ),
                  ),

                  EmergencyCard(
                    title: 'Hotlines',
                    icon: Icons.phone,
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const HotlinesScreen()),
                    ),
                  ),

                  EmergencyCard(
                    title: 'Live Location',
                    icon: Icons.gps_fixed,
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const LiveLocationScreen(),
                      ),
                    ),
                  ),

                  /// 🆘 SOS (danger styling handled inside card)
                  EmergencyCard(
                    title: 'SOS',
                    icon: Icons.sos,
                    isDanger: true,
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const SosScreen()),
                    ),
                  ),

                  EmergencyCard(
                    title: 'Radio',
                    icon: Icons.radio,
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const RadioScreen()),
                    ),
                  ),

                  EmergencyCard(
                    title: 'Personal Details',
                    icon: Icons.person,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const PersonalDetailsScreen(),
                        ),
                      );
                    },
                  ),
                  EmergencyCard(
                    title: 'Settings',
                    icon: Icons.settings,
                    onTap: () async {
                      final allowed = await PinDialog.open(context);
                      if (allowed) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => const SettingsScreen()),
                        );
                      }
                    },
                  ),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
