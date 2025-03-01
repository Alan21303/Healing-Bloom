// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:healing_bloom/screens/home_screen.dart';
import 'package:healing_bloom/screens/test_screen.dart';
import 'package:healing_bloom/screens/camera_screen.dart';
// import 'package:healing_bloom/screens/medical_screen.dart';
import 'package:healing_bloom/screens/medical_document_screen.dart';
import 'package:healing_bloom/screens/medicine_prediction_screen.dart';

class NavigationProvider with ChangeNotifier {
  int _currentIndex = 0;

  final List<Widget> pages = const [
    HomeScreen(),
    TestScreen(),
    CameraScreen(),
    // MedicalAnalysisScreen(),
    MedicalDocumentScreen(),
    MedicinePredictionScreen(),
  ];

  int get currentIndex => _currentIndex;

  void changePage(int index) {
    _currentIndex = index;
    notifyListeners();
  }
}
