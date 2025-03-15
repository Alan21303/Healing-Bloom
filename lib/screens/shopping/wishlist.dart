import 'package:flutter/material.dart';

class WishlistPage extends StatelessWidget {
  const WishlistPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Wishlist'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          WishlistItemCard(),
          WishlistItemCard(),
        ],
      ),
    );
  }
}

class WishlistItemCard extends StatelessWidget {
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
            // Remove item from wishlist
          },
        ),
      ),
    );
  }
} 