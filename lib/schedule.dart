
import 'package:flutter/material.dart';
import 'pet.dart';
import 'treatment.dart';
import 'app_data.dart';
import 'report_history.dart';
import 'pet_information.dart';

class Schedule extends StatefulWidget {
  final Pet pet;

  const Schedule({super.key, required this.pet});

  @override
  State<Schedule> createState() => _ScheduleState();
}

class _ScheduleState extends State<Schedule> {
  final medicationController = TextEditingController();
  final planController = TextEditingController();

  String feedingFrequency = 'Once a day';

  bool morning = false;
  bool afternoon = false;
  bool evening = false;

  void saveTreatment() {
    List<String> selectedTimes = [];

    if (morning) selectedTimes.add('Morning');
    if (afternoon) selectedTimes.add('Afternoon');
    if (evening) selectedTimes.add('Evening');

    if (planController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter the treatment plan'),
        ),
      );
      return;
    }

    AppData.treatments.add(
      Treatment(
        petName: widget.pet.name,
        feedingFrequency: feedingFrequency,
        medicationName: medicationController.text,
        medicationTimes: selectedTimes,
        treatmentPlan: planController.text,
        date: DateTime.now(),
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Treatment information saved'),
      ),
    );
  }

  @override
  void dispose() {
    medicationController.dispose();
    planController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Feeding & Medication Schedules'),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Text(
              'Pet: ${widget.pet.name}',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              'Feeding Schedule',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            RadioListTile<String>(
              title: const Text('Once a day'),
              value: 'Once a day',
              groupValue: feedingFrequency,
              onChanged: (value) {
                setState(() {
                  feedingFrequency = value!;
                });
              },
            ),

            RadioListTile<String>(
              title: const Text('Twice a day'),
              value: 'Twice a day',
              groupValue: feedingFrequency,
              onChanged: (value) {
                setState(() {
                  feedingFrequency = value!;
                });
              },
            ),

            RadioListTile<String>(
              title: const Text('Three times a day'),
              value: 'Three times a day',
              groupValue: feedingFrequency,
              onChanged: (value) {
                setState(() {
                  feedingFrequency = value!;
                });
              },
            ),

            const SizedBox(height: 15),

            const Text(
              'Medication Schedule',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            TextField(
              controller: medicationController,
              decoration: const InputDecoration(
                labelText: 'Medication Name',
                border: OutlineInputBorder(),
              ),
            ),

            CheckboxListTile(
              title: const Text('Morning'),
              value: morning,
              onChanged: (value) {
                setState(() {
                  morning = value!;
                });
              },
            ),

            CheckboxListTile(
              title: const Text('Afternoon'),
              value: afternoon,
              onChanged: (value) {
                setState(() {
                  afternoon = value!;
                });
              },
            ),

            CheckboxListTile(
              title: const Text('Evening'),
              value: evening,
              onChanged: (value) {
                setState(() {
                  evening = value!;
                });
              },
            ),

            const SizedBox(height: 15),

            const Text(
              'Treatment Plan',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            TextField(
              controller: planController,
              maxLines: 3,
              decoration: const InputDecoration(
                hintText: 'Enter treatment plan',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 25),

            ElevatedButton(
              onPressed: saveTreatment,
              child: const Text('Save'),
            ),

            const SizedBox(height: 10),

            OutlinedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                    const ReportHistory(),
                  ),
                );
              },
              child: const Text('Report History'),
            ),

            const SizedBox(height: 10),

            OutlinedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                    const PetInformation(),
                  ),
                );
              },
              child: const Text('Add Another Pet'),
            ),
          ],
        ),
      ),
    );
  }
}
