import 'package:flutter/material.dart';
import 'history_popup.dart'; // Import the new HistoryPopup widget

class HistorySection extends StatelessWidget {
  const HistorySection({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> historyData = [
      {
        'date': '2023-10-01',
        'disease': 'Sample Disease 1',
        'symptoms': 'Fever, Cough',
        'additionalSymptoms': 'Sore Throat',
        'possibleCauses': 'Viral Infection',
        'precautions': 'Stay Hydrated, Rest',
      },
      {
        'date': '2023-09-15',
        'disease': 'Sample Disease 2',
        'symptoms': 'Headache, Nausea',
        'additionalSymptoms': 'Dizziness',
        'possibleCauses': 'Migraine',
        'precautions': 'Avoid Bright Lights',
      },
      {
        'date': '2023-08-20',
        'disease': 'Sample Disease 3',
        'symptoms': 'Fatigue, Muscle Pain',
        'additionalSymptoms': 'Joint Pain',
        'possibleCauses': 'Flu',
        'precautions': 'Rest and Hydration',
      },
    ];

    return ListView.builder(
      itemCount: historyData.length,
      itemBuilder: (context, index) {
        final item = historyData[index];
        return GestureDetector(
          onTap: () {
            // Show the HistoryPopup when a card is tapped
            showDialog(
              context: context,
              builder: (context) => HistoryPopup(
                predictedDisease: item['disease']!,
                symptoms: item['symptoms']!,
                additionalSymptoms: item['additionalSymptoms']!,
                possibleCauses: item['possibleCauses']!,
                precautions: item['precautions']!,
              ),
            );
          },
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            decoration: BoxDecoration(
              color: Colors.purple.shade50,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.purple.shade100,
                  blurRadius: 8,
                  spreadRadius: 2,
                  offset: const Offset(2, 2),
                ),
              ],
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.all(15),
              title: Text(
                item['disease']!,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.purple.shade900,
                ),
              ),
              subtitle: Text(
                '📅 Date: ${item['date']}\n🩺 Symptoms: ${item['symptoms']}',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.purple.shade700,
                ),
              ),
              trailing: Icon(Icons.info_outline, color: Colors.purple.shade800),
            ),
          ),
        );
      },
    );
  }
}
