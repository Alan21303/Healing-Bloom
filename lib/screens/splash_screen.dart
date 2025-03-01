import 'package:flutter/material.dart';
import 'package:healing_bloom/constants/styles.dart';
import 'package:healing_bloom/constants/colors.dart';
import 'package:healing_bloom/screens/signin_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => SignInScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/icon_dot.png', width: 120),
            SizedBox(height: 20),
            Text('Healing Bloom', style: TextStyles.appNameStyle),
            SizedBox(height: 30),
            LinearProgressIndicator(
              minHeight: 2,
              backgroundColor: AppColors.accent,
              valueColor: AlwaysStoppedAnimation<Color>(AppColors.primaryDark),
            ),
          ],
        ),
      ),
    );
  }
}
