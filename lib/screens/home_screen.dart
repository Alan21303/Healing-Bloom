// lib/screens/home_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:healing_bloom/providers/navigation_provider.dart';
import 'package:healing_bloom/widgets/custom_bottom_nav.dart';
import 'package:healing_bloom/widgets/custom_drawer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  final List<Widget> _pages = const [
    _BlankHomeContent(),
    _BlankTestContent(),
    _BlankCameraContent(),
    // _BlankMedicalContent(),
    _BlankDocumentUploadContent(),
    _BlankMedicinePredictContent(),
  ];

  @override
  Widget build(BuildContext context) {
    final navProvider = Provider.of<NavigationProvider>(context);
    final scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: scaffoldKey, // Add scaffold key
      appBar: AppBar(
        leading: IconButton(
          icon: const CircleAvatar(
            backgroundImage: AssetImage('assets/images/profile.png'),
          ),
          onPressed: () => scaffoldKey.currentState?.openDrawer(),
        ),
        title: const Text('Healing Bloom'),
        actions: [
          Image.asset('assets/images/cloud.png', width: 30),
          const SizedBox(width: 20),
        ],
      ),
      drawer: const CustomDrawer(),
      body: IndexedStack(
        index: navProvider.currentIndex,
        children: _pages,
      ),
      bottomNavigationBar: const CustomBottomNav(),
    );
  }
}
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//           icon: const CircleAvatar(
//             backgroundImage: AssetImage('assets/images/profile.png'),
//           ),
//           onPressed: () => Scaffold.of(context).openDrawer(),
//         ),
//         title: const Text('Healing Bloom'),
//         actions: [
//           Image.asset('assets/images/cloud.png', width: 30),
//           const SizedBox(width: 20),
//         ],
//       ),
//       drawer: const CustomDrawer(),
//       body: IndexedStack(
//         index: navProvider.currentIndex,
//         children: _pages,
//       ),
//       bottomNavigationBar: const CustomBottomNav(),
//     );
//   }
// }

// Add these blank content classes inside the home_screen.dart file
class _BlankHomeContent extends StatelessWidget {
  const _BlankHomeContent();

  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.white);
  }
}

class _BlankTestContent extends StatelessWidget {
  const _BlankTestContent();

  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.white);
  }
}

class _BlankCameraContent extends StatelessWidget {
  const _BlankCameraContent();

  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.white);
  }
}

// class _BlankMedicalContent extends StatelessWidget {
//   const _BlankMedicalContent();

//   @override
//   Widget build(BuildContext context) {
//     return Container(color: Colors.white);
//   }
// }

class _BlankDocumentUploadContent extends StatelessWidget {
  const _BlankDocumentUploadContent();

  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.white);
  }
}

class _BlankMedicinePredictContent extends StatelessWidget {
  const _BlankMedicinePredictContent();

  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.white);
  }
}
