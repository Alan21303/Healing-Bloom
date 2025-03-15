import 'package:flutter/material.dart';

class DocumentDetailsScreen extends StatelessWidget {
  const DocumentDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Document Viewer'),
        actions: [
          IconButton(
            icon: Icon(Icons.download),
            onPressed: () {
              // Logic to download the document
            },
          ),
          IconButton(
            icon: Icon(Icons.print),
            onPressed: () {
              // Logic to print the document
            },
          ),
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              // Logic to delete the document
            },
          ),
          IconButton(
            icon: Icon(Icons.share),
            onPressed: () {
              // Logic to share the document
            },
          ),
        ],
      ),
      body: Center(
        child: Container(
          // Replace with actual document preview
          child: Text('Document Preview Here'),
        ),
      ),
    );
  }
} 