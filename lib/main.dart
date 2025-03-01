import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:healing_bloom/providers/navigation_provider.dart';
import 'package:healing_bloom/screens/splash_screen.dart';
import 'constants/colors.dart';

void main() => runApp(HealingBloomApp());

class HealingBloomApp extends StatelessWidget {
  const HealingBloomApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => NavigationProvider(),
      child: MaterialApp(
        title: 'Healing Bloom',
        theme: ThemeData(
          primaryColor: AppColors.primary,
          colorScheme: ColorScheme.light(
            primary: AppColors.primary,
            secondary: AppColors.primaryLight,
          ),
          scaffoldBackgroundColor: Colors.white,
          fontFamily: 'Roboto',
          appBarTheme: AppBarTheme(
            backgroundColor: AppColors.primary,
            elevation: 0,
          ),
        ),
        home: SplashScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
