import 'package:flutter/material.dart';

class MedicineDetailsPage extends StatelessWidget {
  const MedicineDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Medicine Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.asset('assets/images/medicine.png'), // Placeholder image
            SizedBox(height: 10),
            Text('Medicine Name', style: Theme.of(context).textTheme.headline5),
            Text('Price: \$19.99'),
            SizedBox(height: 10),
            Text('Description: This is a detailed description of the medicine.'),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // Add to cart functionality
              },
              child: Text('Add to Cart'),
            ),
          ],
        ),
      ),
    );
  }
} 