import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:healingbloom/screens/home/home.dart';
import 'package:healingbloom/screens/testscreens/test_screen.dart';
import 'package:healingbloom/screens/scanskin/camera.dart';
// import 'package:healingbloom/screens/documents/';
import 'package:healingbloom/screens/shopping/shopping.dart';
import 'package:healingbloom/theme/app_theme.dart';
import 'package:healingbloom/screens/documents/document_upload_screen.dart';

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    HomeScreen(),
    TestScreen(),
    CameraScreen(),
    ShoppingScreen(),
    DocumentScreen(),
  ];

  void _onItemTapped(int index) {
    HapticFeedback.lightImpact();
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        transitionBuilder: (Widget child, Animation<double> animation) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
        child: _screens[_selectedIndex],
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32),
          boxShadow: [
            BoxShadow(
              color: AppTheme.royalPlum.withAlpha(38),
              blurRadius: 20,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(32),
          child: BottomNavigationBar(
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
            backgroundColor: AppTheme.pearlWhite,
            selectedItemColor: AppTheme.royalPlum,
            unselectedItemColor: AppTheme.velvetAmethyst.withAlpha(128),
            type: BottomNavigationBarType.fixed,
            elevation: 0,
            items: [
              const BottomNavigationBarItem(
                icon: Icon(Icons.home_rounded, size: 28),
                label: 'Home',
              ),
              const BottomNavigationBarItem(
                icon: Icon(Icons.science_rounded, size: 28),
                label: 'Test',
              ),
              BottomNavigationBarItem(
                icon: Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: const LinearGradient(
                      colors: [
                        AppTheme.royalPlum,
                        AppTheme.velvetAmethyst,
                      ],
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: AppTheme.royalPlum.withAlpha(77),
                        blurRadius: 10,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.camera_alt_rounded,
                    color: AppTheme.pearlWhite,
                    size: 36,
                  ),
                ),
                label: 'Scan Skin',
              ),
              const BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart, size: 28),
                label: 'Shopping',
              ),
              const BottomNavigationBarItem(
                icon: Icon(Icons.upload_file_rounded, size: 28),
                label: 'Documents',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
