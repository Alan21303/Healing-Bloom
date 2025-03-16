import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:io';
import 'package:healingbloom/screens/documents/upload_document_screen.dart';

class DocumentScreen extends StatefulWidget {
  @override
  _DocumentScreenState createState() => _DocumentScreenState();
}

class _DocumentScreenState extends State<DocumentScreen> {
  List<Map<String, String>> _documents = [];

  void _addDocument(String name, String path) {
    setState(() {
      _documents.add({'name': name, 'path': path});
    });
  }

  void _showDocumentDetails(String name, String path) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(name),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('File Path: $path'),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // Implement download functionality
              },
              child: Text('Download'),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Close'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Documents')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
          ),
          itemCount: _documents.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () => _showDocumentDetails(
                _documents[index]['name']!,
                _documents[index]['path']!,
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.purple.shade50,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.purple, width: 2),
                ),
                child: Center(
                  child: Text(
                    _documents[index]['name']!,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.purple),
                  ),
                ),
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            height: 60,
            color: Colors.white,
          ),
          Positioned(
            bottom: 10,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UploadDocumentScreen(onDocumentUploaded: _addDocument),
                  ),
                );
              },
              child: Icon(Icons.add, size: 30),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                minimumSize: Size(MediaQuery.of(context).size.width * 0.9, 50),
              ),
            ),
          ),
        ],
      ),
    );
  }
}









