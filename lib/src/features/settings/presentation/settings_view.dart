import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hiringtask/src/common/rounded_button.dart';
import 'package:hiringtask/src/features/auth/presentation/login_screen.dart';
import 'package:hiringtask/src/utils/constants.dart';

import '../../auth/domain/auth_provider.dart';
import '../domain/settings_provider.dart';

class SettingsScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkMode = ref.watch(themeProvider);
    final auth = ref.watch(authProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SwitchListTile(
                activeTrackColor: AppConstants.primaryColor,
                inactiveTrackColor: Colors.blueGrey,
                title: Text('Dark Mode'),
                value: isDarkMode,
                onChanged: (value) {
                  ref.read(themeProvider.notifier).toggleTheme();
                },
              ),
              SwitchListTile(
                inactiveTrackColor: Colors.blueGrey,
                title: Text('Notifications'),
                value: false,
                onChanged: (value) {
                  Fluttertoast.showToast(msg: "Notifications Not Yet Implemented");
                },
              ),
              SizedBox(
                height: 100,
              ),
              Center(
                  child: RoundedButton(
                      onTap: () {
                        auth.signOut().then((value) {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginScreen()),
                              (route) => false);
                        });
                      },
                      loading: false,
                      title: "Logout"))
            ],
          )),
    );
  }
}
