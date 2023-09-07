import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:hiringtask/src/features/auth/presentation/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Image.asset(
        "assets/logo/mim_logo.png",
        height: 140,
      )
              .animate()
              .scale(duration: 1.seconds)
              .fadeOut(duration: 1.5.seconds) // fade out & then...
              .swap(
                  builder: (_, __) => Image.asset(
                        "assets/logo/mim_text.png",
                        height: 140,
                        width: 320,
                      )
                          .animate()
                          .scale(duration: 1.5.seconds, curve: Curves.bounceOut)
                          .callback(
                              callback: (_) => Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginScreen()))))),
    );
  }
}
