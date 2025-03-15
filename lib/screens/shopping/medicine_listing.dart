import 'package:flutter/material.dart';

class MedicineListingPage extends StatelessWidget {
  const MedicineListingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Medicines'),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16.0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.75,
        ),
        itemCount: 10, // Replace with actual medicine count
        itemBuilder: (context, index) {
          return MedicineCard();
        },
      ),
    );
  }
}

class MedicineCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Image.asset('assets/images/medicine.png'), // Placeholder image
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Medicine Name'),
          ),
          Text('\$19.99'),
          ElevatedButton(
            onPressed: () {
              // Add to cart functionality
            },
            child: Text('Add to Cart'),
          ),
        ],
      ),
    );
  }
} 