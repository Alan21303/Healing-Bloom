import 'package:flutter/material.dart';
import 'package:healing_bloom/constants/styles.dart';
import 'package:healing_bloom/constants/colors.dart'; // Add this import
import 'package:healing_bloom/screens/home_screen.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Welcome to Healing Bloom')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildSignInButton(
              icon: Icons.email,
              text: 'Continue with Email',
              onPressed: () => _navigateToHome(context),
            ),
            SizedBox(height: 20),
            _buildSignInButton(
              icon: Icons.medical_services,
              text: 'Medical Professional Login',
              onPressed: () => _navigateToHome(context),
            ),
          ],
        ),
      ),
    );
  }

  // lib/screens/signin_screen.dart
  Widget _buildSignInButton(
      {required IconData icon,
      required String text,
      required VoidCallback onPressed}) {
    return ElevatedButton.icon(
      icon: Icon(icon, color: AppColors.primaryDark),
      label: Text(text, style: TextStyles.body),
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.accent, // Changed from primary
        padding: EdgeInsets.symmetric(vertical: 15),
      ),
      onPressed: onPressed,
    );
  }

  void _navigateToHome(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => HomeScreen()),
    );
  }
}
