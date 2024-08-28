import 'package:flutter/material.dart';
import 'package:spotify_app_clone/core/configs/theme/app_theme.dart';
import 'package:spotify_app_clone/presentation/splash/pages/splash.dart';

void main() {
  runApp(const SpotifyCloneApp());
}

class SpotifyCloneApp extends StatelessWidget {
  const SpotifyCloneApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.ligthTheme,
      home: const SplashPage(),
    );
  }
}
