import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PinDialog {
  static Future<bool> open(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    final savedPin = prefs.getString('app_pin');

    final TextEditingController pinController = TextEditingController();
    String errorText = '';

    return await showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              backgroundColor: Colors.grey[900],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              title: Text(
                savedPin == null ? 'Set PIN' : 'Enter PIN',
                style: const TextStyle(color: Colors.white),
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: pinController,
                    keyboardType: TextInputType.number,
                    obscureText: true,
                    maxLength: 6,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      counterText: '',
                      hintText: 'Enter PIN',
                      hintStyle:
                      const TextStyle(color: Colors.white38),
                      errorText:
                      errorText.isEmpty ? null : errorText,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide:
                        const BorderSide(color: Colors.red),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide:
                        const BorderSide(color: Colors.redAccent),
                      ),
                    ),
                  ),
                ],
              ),

              /// 🔘 ACTION BUTTONS (LEFT → RIGHT, NO OVERFLOW)
              actions: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Wrap(
                    alignment: WrapAlignment.end,
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      /// ❌ Cancel
                      TextButton(
                        onPressed: () =>
                            Navigator.pop(context, false),
                        child: const Text(
                          'Cancel',
                          style:
                          TextStyle(color: Colors.white70),
                        ),
                      ),

                      /// 🗑 Delete PIN
                      if (savedPin != null)
                        TextButton(
                          onPressed: () async {
                            if (pinController.text != savedPin) {
                              setState(() =>
                              errorText = 'Incorrect PIN');
                              return;
                            }
                            await prefs.remove('app_pin');
                            Navigator.pop(context, false);
                          },
                          child: const Text(
                            'Delete',
                            style: TextStyle(
                                color: Colors.redAccent),
                          ),
                        ),

                      /// 🔄 Update PIN
                      if (savedPin != null)
                        TextButton(
                          onPressed: () async {
                            if (pinController.text != savedPin) {
                              setState(() =>
                              errorText = 'Incorrect PIN');
                              return;
                            }

                            Navigator.pop(context, false);
                            await _showNewPinDialog(context);
                          },
                          child: const Text(
                            'Update',
                            style: TextStyle(
                                color: Colors.orangeAccent),
                          ),
                        ),

                      /// ✅ OK / SAVE
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          shape: RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.circular(8),
                          ),
                        ),
                        onPressed: () async {
                          if (pinController.text.length < 4) {
                            setState(() =>
                            errorText = 'PIN too short');
                            return;
                          }

                          if (savedPin == null) {
                            await prefs.setString(
                                'app_pin', pinController.text);
                            Navigator.pop(context, true);
                          } else if (pinController.text ==
                              savedPin) {
                            Navigator.pop(context, true);
                          } else {
                            setState(() =>
                            errorText = 'Incorrect PIN');
                          }
                        },
                        child:
                        Text(savedPin == null ? 'Save' : 'OK'),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        );
      },
    ) ??
        false;
  }

  /// 🔐 NEW PIN SETUP DIALOG
  static Future<void> _showNewPinDialog(BuildContext context) async {
    final TextEditingController newPinController =
    TextEditingController();
    String errorText = '';

    await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              backgroundColor: Colors.grey[900],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              title: const Text(
                'Set New PIN',
                style: TextStyle(color: Colors.white),
              ),
              content: TextField(
                controller: newPinController,
                keyboardType: TextInputType.number,
                obscureText: true,
                maxLength: 6,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  counterText: '',
                  hintText: 'New PIN',
                  hintStyle:
                  const TextStyle(color: Colors.white38),
                  errorText:
                  errorText.isEmpty ? null : errorText,
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text(
                    'Cancel',
                    style: TextStyle(color: Colors.white70),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                  ),
                  onPressed: () async {
                    if (newPinController.text.length < 4) {
                      setState(() =>
                      errorText = 'PIN too short');
                      return;
                    }

                    final prefs =
                    await SharedPreferences.getInstance();
                    await prefs.setString(
                        'app_pin', newPinController.text);
                    Navigator.pop(context);
                  },
                  child: const Text('Save'),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
