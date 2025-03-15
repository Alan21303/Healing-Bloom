import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:healingbloom/providers/auth_provider.dart';
import 'package:healingbloom/screens/splash_screen.dart';
import 'package:healingbloom/theme/app_theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
      ],
      child: const HealingBloomApp(),
    ),
  );
}

class HealingBloomApp extends StatelessWidget {
  const HealingBloomApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Healing Bloom',
      theme: AppTheme.lightTheme,
      home: const SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
