// lib/widgets/custom_bottom_nav.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:healing_bloom/constants/colors.dart';
import 'package:healing_bloom/providers/navigation_provider.dart';

class CustomBottomNav extends StatelessWidget {
  const CustomBottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: Provider.of<NavigationProvider>(context).currentIndex,
      onTap: (index) => Provider.of<NavigationProvider>(context, listen: false)
          .changePage(index),
      selectedItemColor: AppColors.primaryDark,
      unselectedItemColor: Colors.grey,
      items: const [
        BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: 'Home'),
        BottomNavigationBarItem(
            icon: Icon(Icons.upload_file_outlined),
            activeIcon: Icon(Icons.upload_file),
            label: 'Test'),
        BottomNavigationBarItem(
            icon: Icon(Icons.camera_outlined),
            activeIcon: Icon(Icons.camera),
            label: 'Scan'),
        BottomNavigationBarItem(
            icon: Icon(Icons.document_scanner_outlined),
            activeIcon: Icon(Icons.document_scanner),
            label: 'Documents'),
        BottomNavigationBarItem(
            icon: Icon(Icons.medication_outlined),
            activeIcon: Icon(Icons.medication),
            label: 'Medicine'),
      ],
      type: BottomNavigationBarType.fixed,
    );
  }
}
