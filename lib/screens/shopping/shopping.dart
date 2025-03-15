import 'package:flutter/material.dart';
import 'package:healingbloom/widgets/top_navigation_bar.dart';
import 'package:healingbloom/widgets/side_menu.dart';

class ShoppingScreen extends StatelessWidget {
  const ShoppingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: TopNavigationBar(
          userName: 'John Doe',
          onProfileTap: () {
            Scaffold.of(context).openDrawer();
          },
        ),
      ),
      drawer: SideMenu(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Welcome to Healing Bloom Pharmacy – Trusted Skincare Solutions',
                style: Theme.of(context).textTheme.headline5?.copyWith(color: Colors.purple),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search for skin medicines, brands, or conditions...',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.search),
                ),
              ),
            ),
            SizedBox(height: 16),
            CategoryTabs(),
            FeaturedMedicinesSection(),
            VerifiedVendorsSection(),
          ],
        ),
      ),
    );
  }
}

class CategoryTabs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          CategoryChip(label: 'Eczema Care'),
          CategoryChip(label: 'Psoriasis Treatment'),
          CategoryChip(label: 'Acne & Pimples'),
          CategoryChip(label: 'Fungal Infections'),
          CategoryChip(label: 'Sun Protection & Healing Creams'),
        ],
      ),
    );
  }
}

class CategoryChip extends StatelessWidget {
  final String label;

  const CategoryChip({required this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Chip(
        label: Text(label),
        backgroundColor: Colors.purple.shade100,
      ),
    );
  }
}

class FeaturedMedicinesSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Featured Medicines', style: Theme.of(context).textTheme.headline5),
          SizedBox(height: 10),
          MedicineCard(),
          MedicineCard(),
        ],
      ),
    );
  }
}

class MedicineCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Image.asset('assets/images/medicine.png'), // Placeholder image
        title: Text('Medicine Name'),
        subtitle: Text('Short description of the medicine.'),
        trailing: Text('\$19.99'),
        onTap: () {
          // Navigate to medicine details page
        },
      ),
    );
  }
}

class VerifiedVendorsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Verified Vendors', style: Theme.of(context).textTheme.headline5),
          SizedBox(height: 10),
          VendorCard(),
          VendorCard(),
        ],
      ),
    );
  }
}

class VendorCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text('Vendor Name'),
        subtitle: Text('Rating: ★★★★☆'),
        trailing: Icon(Icons.check_circle, color: Colors.green),
        onTap: () {
          // Navigate to vendor details page
        },
      ),
    );
  }
} 