import 'package:flutter/material.dart';
import 'package:healingbloom/theme/app_theme.dart';
import 'package:healingbloom/screens/scanskin/results_screen.dart';

class LoadingScreen extends StatelessWidget {
  final String imagePath;

  const LoadingScreen({Key? key, required this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Start the navigation to ResultsScreen after a delay
    Future.delayed(Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => ResultsScreen(
            imagePath: imagePath,
            diseaseName: "Dummy Disease",
            confidenceScore: 75.0,
            recommendations: "This is a dummy recommendation.",
          ),
        ),
      );
    });

    return Scaffold(
      backgroundColor: AppTheme.pearlWhite,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(AppTheme.primaryColor),
              strokeWidth: 4,
            ),
            SizedBox(height: 32),
            Text("Analyzing Image", 
                style: Theme.of(context).textTheme.displayMedium),
            SizedBox(height: 16),
            Text("This usually takes 10-15 seconds",
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: AppTheme.velvetAmethyst
                )),
            SizedBox(height: 32),
            _loadingDots(),
          ],
        ),
      ),
    );
  }

  Widget _loadingDots() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(3, (index) {
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 4),
          width: 12,
          height: 12,
          decoration: BoxDecoration(
            color: AppTheme.primaryColor.withOpacity(0.3 + index * 0.3),
            shape: BoxShape.circle,
          ),
        );
      }),
    );
  }
}