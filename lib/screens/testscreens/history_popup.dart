import 'package:flutter/material.dart';

class HistoryPopup extends StatelessWidget {
  final String predictedDisease;
  final String symptoms;
  final String additionalSymptoms;
  final String possibleCauses;
  final String precautions;

  const HistoryPopup({
    super.key,
    required this.predictedDisease,
    required this.symptoms,
    required this.additionalSymptoms,
    required this.possibleCauses,
    required this.precautions,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Container(
        padding: const EdgeInsets.all(20),
        constraints: BoxConstraints(maxWidth: 400), // Adjust width for better layout
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title
              Center(
                child: Text(
                  'Test History Details',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.purple.shade900,
                  ),
                ),
              ),
              const SizedBox(height: 10),

              // Divider
              Divider(color: Colors.purple.shade200, thickness: 1),

              // Predicted Disease
              _buildSectionTitle('Predicted Disease'),
              _buildSectionContent(predictedDisease),

              // Symptoms
              _buildSectionTitle('Symptoms'),
              _buildSectionContent(symptoms),

              // Additional Symptoms
              _buildSectionTitle('Additional Symptoms'),
              _buildSectionContent(additionalSymptoms),

              // Possible Causes
              _buildSectionTitle('Possible Causes'),
              _buildSectionContent(possibleCauses),

              // Precautions
              _buildSectionTitle('Precautions'),
              _buildSectionContent(precautions),

              // Warning Note
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.orange[100],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  '⚠️ Note: Please consult with your doctor.',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.red[700],
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),

              // Action Buttons
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton.icon(
                    onPressed: () {
                      // Logic to print the document as PDF
                    },
                    icon: Icon(Icons.print, color: Colors.blue.shade700),
                    label: Text('Print', style: TextStyle(color: Colors.blue.shade700)),
                  ),
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: Text('Close', style: TextStyle(color: Colors.red.shade700)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper function to build section titles
  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 12, bottom: 4),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.purple.shade900,
        ),
      ),
    );
  }

  // Helper function to build section content
  Widget _buildSectionContent(String content) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Text(
        content,
        style: TextStyle(
          fontSize: 14,
          color: Colors.black87,
        ),
      ),
    );
  }
}
