import 'package:flutter/material.dart';
// import 'package:healingbloom/theme/app_theme.dart';

class ScanSkinScreen extends StatelessWidget {
  const ScanSkinScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Scan Skin',
          style: Theme.of(context).textTheme.displayMedium,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: const Center(
        child: Text('Camera Screen Content'),
      ),
    );
  }
}
