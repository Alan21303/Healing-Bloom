import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class UploadImageWidget extends StatefulWidget {
  final Function(bool) onImageUploaded;

  const UploadImageWidget({super.key, required this.onImageUploaded});

  @override
  _UploadImageWidgetState createState() => _UploadImageWidgetState();
}

class _UploadImageWidgetState extends State<UploadImageWidget> {
  String? _imagePath;
  bool _showPrediction = false;

  Future<void> _uploadImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        _imagePath = image.path;
        _showPrediction = false;
      });
      widget.onImageUploaded(true);
    }
  }

  void _showResult() {
    if (_imagePath == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('No image uploaded! Please upload an image first.'),
        ),
      );
    } else {
      setState(() {
        _showPrediction = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Image Upload Section
          GestureDetector(
            onTap: _uploadImage,
            child: Container(
              height: 180,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.purple.shade50,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.purple.shade700, width: 2),
              ),
              child: _imagePath == null
                  ? const Center(
                      child: Text(
                        'Tap to Upload Image',
                        style: TextStyle(color: Colors.purple, fontSize: 16),
                      ),
                    )
                  : ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.file(File(_imagePath!), fit: BoxFit.cover),
                    ),
            ),
          ),

          const SizedBox(height: 20),

          // Submit Button
          ElevatedButton(
            onPressed: _showResult,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.purple.shade800,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
            ),
            child: const Text('Submit', style: TextStyle(fontSize: 18, color: Colors.white)),
          ),

          const SizedBox(height: 20),

          // Prediction Result Section
          if (_showPrediction)
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.purple.shade100,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(color: Colors.purple.shade100, blurRadius: 10, spreadRadius: 2),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Prediction Result',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  Divider(color: Colors.purple.shade900),

                  const SizedBox(height: 8),
                  Text(
                    'Predicted Disease: Sample Disease Type',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.purple.shade900),
                  ),
                  Text('Symptoms: Fever, Cough', style: TextStyle(color: Colors.purple.shade700)),
                  Text('Possible Causes: Viral Infection', style: TextStyle(color: Colors.purple.shade700)),
                  Text('Precautions: Stay Hydrated, Rest', style: TextStyle(color: Colors.purple.shade700)),
                  Text('Recommended Medicines: Paracetamol, Cough Syrup', style: TextStyle(color: Colors.purple.shade700)),

                  const SizedBox(height: 15),
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.redAccent.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Text(
                      'Note: Please consult with your doctor.',
                      style: TextStyle(color: Colors.redAccent, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),

                  const SizedBox(height: 15),

                  // Action Buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton.icon(
                        onPressed: () {
                          // Logic to print result
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.purple.shade600,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        ),
                        icon: const Icon(Icons.print, color: Colors.white),
                        label: const Text('Print', style: TextStyle(color: Colors.white)),
                      ),
                      ElevatedButton.icon(
                        onPressed: () {
                          setState(() {
                            _showPrediction = false;
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.purple.shade600,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        ),
                        icon: const Icon(Icons.close, color: Colors.white),
                        label: const Text('OK', style: TextStyle(color: Colors.white)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
