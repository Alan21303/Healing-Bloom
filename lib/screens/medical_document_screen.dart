import 'package:flutter/material.dart';

class MedicalDocumentScreen extends StatelessWidget {
  const MedicalDocumentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Medical Documents')),
      body: const Center(child: Text('Medical Documents Page')),
    );
  }
}
