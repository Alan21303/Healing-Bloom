// lib/widgets/custom_drawer.dart
import 'package:flutter/material.dart';
import 'package:healing_bloom/constants/styles.dart';
import 'package:healing_bloom/constants/colors.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(color: AppColors.primary),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage('assets/images/profile.png'),
                ),
                const SizedBox(height: 15),
                Text('Username',
                    style: TextStyles.heading.copyWith(color: Colors.white)),
                Text('user@healingbloom.com',
                    style: TextStyle(color: Colors.white70)),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.person, color: AppColors.primaryDark),
            title: Text('Profile', style: TextStyles.body),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.history, color: AppColors.primaryDark),
            title: Text('Medical History', style: TextStyles.body),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.settings, color: AppColors.primaryDark),
            title: Text('Settings', style: TextStyles.body),
            onTap: () {},
          ),
          const Divider(),
          ListTile(
            leading:
                const Icon(Icons.exit_to_app, color: AppColors.primaryDark),
            title: Text('Logout', style: TextStyles.body),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
