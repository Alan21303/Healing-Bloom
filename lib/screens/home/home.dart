import 'package:flutter/material.dart'; // Import Flutter material package
import 'package:healingbloom/widgets/top_navigation_bar.dart';
import 'package:healingbloom/widgets/side_menu.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: TopNavigationBar(
          userName: 'John Doe', // Replace with actual user name
          onProfileTap: () {
            // Logic to show the side menu
            Scaffold.of(context).openDrawer();
          },
        ),
      ),
      drawer: SideMenu(),
      body: Center(
        child: Text(
          'Welcome to Healing Bloom',
          style: Theme.of(context).textTheme.displayLarge,
        ),
      ),
    );
  }
}
