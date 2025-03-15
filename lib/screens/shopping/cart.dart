import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Cart'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          CartItemCard(),
          CartItemCard(),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // Navigate to checkout page
            },
            child: Text('Proceed to Checkout'),
          ),
        ],
      ),
    );
  }
}

class CartItemCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Image.asset('assets/images/medicine.png'), // Placeholder image
        title: Text('Medicine Name'),
        subtitle: Text('Price: \$19.99'),
        trailing: IconButton(
          icon: Icon(Icons.remove_circle),
          onPressed: () {
            // Remove item from cart
          },
        ),
      ),
    );
  }
} 