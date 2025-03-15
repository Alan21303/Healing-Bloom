import 'package:flutter/material.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Checkout'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text('Delivery Address', style: Theme.of(context).textTheme.headline6),
            TextField(
              decoration: InputDecoration(
                hintText: 'Enter your address',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            Text('Payment Method', style: Theme.of(context).textTheme.headline6),
            // Add payment options here
            ElevatedButton(
              onPressed: () {
                // Confirm order functionality
              },
              child: Text('Confirm Order'),
            ),
          ],
        ),
      ),
    );
  }
} 