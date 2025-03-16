import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:io';

class UploadDocumentScreen extends StatefulWidget {
  final Function(String, String) onDocumentUploaded;

  const UploadDocumentScreen({Key? key, required this.onDocumentUploaded}) : super(key: key);

  @override
  _UploadDocumentScreenState createState() => _UploadDocumentScreenState();
}

class _UploadDocumentScreenState extends State<UploadDocumentScreen> {
  String? _filePath;
  String? _fileName;

  void _pickDocument() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(type: FileType.any);
    if (result != null) {
      setState(() {
        _filePath = result.files.single.path;
        _fileName = result.files.single.name;
      });
    }
  }

  void _submitDocument() {
    if (_filePath != null && _fileName != null) {
      widget.onDocumentUploaded(_fileName!, _filePath!);
      Navigator.pop(context); // Go back to the previous screen
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Upload Document')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: _pickDocument,
              child: Container(
                height: 150,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.purple.shade50,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.purple, width: 2),
                ),
                child: Center(
                  child: _filePath == null
                      ? Text('Tap to Upload Document', style: TextStyle(color: Colors.purple))
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Selected: $_fileName', style: TextStyle(color: Colors.purple)),
                            SizedBox(height: 10),
                            Text('Tap to Change', style: TextStyle(color: Colors.purple)),
                          ],
                        ),
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _submitDocument,
              child: Text('Submit'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
                foregroundColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
} 