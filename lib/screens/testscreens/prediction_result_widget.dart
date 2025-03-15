import 'package:flutter/material.dart';

class PredictionResultWidget extends StatelessWidget {
  final String predictedDisease;
  final String symptoms;
  final String additionalSymptoms;
  final String possibleCauses;
  final String precautions;

  const PredictionResultWidget({
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
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      backgroundColor: Colors.deepPurple.shade900,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.85, // Slightly larger dialog
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Colors.deepPurple.shade900,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 12,
              spreadRadius: 3,
              offset: Offset(0, 5),
            ),
          ],
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              // Title
              Center(
                child: Text(
                  'Prediction Result',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.amberAccent.shade100,
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Disease Name
              _buildDetailSection('Predicted Disease', predictedDisease),
              _buildDetailSection('Symptoms', symptoms),
              _buildDetailSection('Additional Symptoms', additionalSymptoms),
              _buildDetailSection('Possible Causes', possibleCauses),
              _buildDetailSection('Precautions', precautions),

              const SizedBox(height: 20),

              // Note
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  '⚠️ Please consult with a doctor.',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.amberAccent.shade200,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),

              const SizedBox(height: 20),

              // Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildButton(
                    context,
                    label: 'Print',
                    color: Colors.deepPurpleAccent.shade100,
                    onTap: () {
                      // Logic to print results (implement PDF generation)
                    },
                  ),
                  _buildButton(
                    context,
                    label: 'OK',
                    color: Colors.amberAccent.shade100,
                    onTap: () {
                      Navigator.of(context).pop(); // Close Dialog
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Function to create text sections
  Widget _buildDetailSection(String title, String content) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.amberAccent.shade100,
            ),
          ),
          Text(
            content,
            style: TextStyle(
              fontSize: 14,
              color: Colors.white70,
            ),
          ),
          const SizedBox(height: 6),
          Divider(color: Colors.amberAccent.shade100.withOpacity(0.5)),
        ],
      ),
    );
  }

  // Function to create buttons
  Widget _buildButton(BuildContext context, {required String label, required Color color, required VoidCallback onTap}) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.deepPurple.shade900,
        ),
      ),
    );
  }
}
