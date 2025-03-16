// results_screen.dart
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:healingbloom/theme/app_theme.dart';

class ResultsScreen extends StatelessWidget {
  final String imagePath;
  final String diseaseName;
  final double confidenceScore;
  final String recommendations;

  const ResultsScreen({
    required this.imagePath,
    this.diseaseName = "Acne Vulgaris",
    this.confidenceScore = 92.5,
    this.recommendations = "Use non-comedogenic products and maintain regular cleansing. Consult a dermatologist if condition persists.",
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Analysis Results"),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _imagePreview(),
            SizedBox(height: 24),
            _resultDetails(),
            SizedBox(height: 24),
            _recommendationsSection(),
            SizedBox(height: 32),
            _actionButtons(context),
          ],
        ),
      ),
    );
  }

  Widget _imagePreview() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Image.file(
        File(imagePath),
        height: 220,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _resultDetails() {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Diagnosis", style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppTheme.primaryColor)),
            SizedBox(height: 10),
            Text(diseaseName, style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w800)),
            SizedBox(height: 20),
            _confidenceIndicator(),
          ],
        ),
      ),
    );
  }

  Widget _confidenceIndicator() {
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              width: 100,
              height: 100,
              child: CircularProgressIndicator(
                value: confidenceScore / 100,
                strokeWidth: 8,
                backgroundColor: Colors.grey[200],
                valueColor: AlwaysStoppedAnimation<Color>(AppTheme.primaryColor),
              ),
            ),
            Text("${confidenceScore.toStringAsFixed(1)}%", 
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ],
        ),
      ],
    );
  }

  Widget _recommendationsSection() {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Recommendations", style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppTheme.primaryColor)),
            SizedBox(height: 12),
            Text(recommendations, 
                style: TextStyle(fontSize: 16, height: 1.5)),
          ],
        ),
      ),
    );
  }

  Widget _actionButtons(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppTheme.primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              padding: EdgeInsets.symmetric(vertical: 16),
            ),
            onPressed: () => Navigator.pop(context),
            child: Text("Scan Again", style: TextStyle(color: Colors.white)),
          ),
        ),
      ],
    );
  }
}
