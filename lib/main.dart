import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hiringtask/src/utils/constants.dart';

import 'firebase_options.dart';
import 'src/features/settings/domain/settings_provider.dart';
import 'src/features/splash/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(appThemeProvider);
    return MaterialApp(
      title: 'My Impact Meter',
      theme: theme.copyWith(
        primaryColor: AppConstants.primaryColor,
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}
