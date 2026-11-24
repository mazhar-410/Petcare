
import 'package:flutter/material.dart';
import 'app_data.dart';

class ReportHistory extends StatelessWidget {
  const ReportHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Report History'),
      ),

      body: AppData.treatments.isEmpty
          ? const Center(
        child: Text('No treatment records yet'),
      )
          : ListView.builder(
        padding: const EdgeInsets.all(15),
        itemCount: AppData.treatments.length,

        itemBuilder: (context, index) {
          final treatment =
          AppData.treatments[index];

          return Card(
            margin: const EdgeInsets.only(bottom: 15),

            child: Padding(
              padding: const EdgeInsets.all(15),

              child: Column(
                crossAxisAlignment:
                CrossAxisAlignment.start,

                children: [

                  Text(
                    treatment.petName,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF2563EB),
                    ),
                  ),

                  const SizedBox(height: 10),

                  Text(
                    'Date: ${treatment.date.day}/'
                        '${treatment.date.month}/'
                        '${treatment.date.year}',
                  ),

                  const Divider(),

                  Text(
                    'Feeding: ${treatment.feedingFrequency}',
                  ),

                  const SizedBox(height: 8),

                  Text(
                    'Medication: ${treatment.medicationName.isEmpty ? 'Not specified' : treatment.medicationName}',
                  ),

                  const SizedBox(height: 8),

                  Text(
                    'Medication Times: ${treatment.medicationTimes.isEmpty ? 'Not specified' : treatment.medicationTimes.join(', ')}',
                  ),

                  const SizedBox(height: 8),

                  Text(
                    'Treatment Plan: ${treatment.treatmentPlan}',
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
