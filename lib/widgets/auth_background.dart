import 'package:flutter/material.dart';
import 'package:healingbloom/theme/app_theme.dart';

class AuthBackground extends StatelessWidget {
  final Widget child;

  const AuthBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Bottom left cluster
        Positioned(
          left: -30,
          bottom: -30,
          child: Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppTheme.lavenderMist.withAlpha(77),
            ),
          ),
        ),
        Positioned(
          left: 40,
          bottom: 50,
          child: Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppTheme.opulentLilac.withAlpha(102),
            ),
          ),
        ),
        Positioned(
          left: 80,
          bottom: -20,
          child: Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppTheme.velvetAmethyst.withAlpha(51),
            ),
          ),
        ),
        // Top right cluster
        Positioned(
          right: -20,
          top: 100,
          child: Container(
            width: 90,
            height: 90,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppTheme.lavenderMist.withAlpha(77),
            ),
          ),
        ),
        Positioned(
          right: 50,
          top: 150,
          child: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppTheme.opulentLilac.withAlpha(102),
            ),
          ),
        ),
        // Middle right bubble
        Positioned(
          right: -40,
          top: MediaQuery.of(context).size.height * 0.4,
          child: Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppTheme.velvetAmethyst.withAlpha(38),
            ),
          ),
        ),
        child,
      ],
    );
  }
}
