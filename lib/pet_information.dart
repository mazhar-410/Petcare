
import 'package:flutter/material.dart';
import 'pet.dart';
import 'app_data.dart';
import 'schedule.dart';

class PetInformation extends StatefulWidget {
  const PetInformation({super.key});

  @override
  State<PetInformation> createState() => _PetInformationState();
}

class _PetInformationState extends State<PetInformation> {
  final nameController = TextEditingController();
  final otherTypeController = TextEditingController();

  String selectedType = 'Dog';

  final List<String> petTypes = [
    'Dog',
    'Cat',
    'Bird',
    'Chicken',
    'Cow',
    'Monkey',
    'Other',
  ];

  void savePet() {
    if (nameController.text.isEmpty ||
        (selectedType == 'Other' &&
            otherTypeController.text.isEmpty)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please fill all fields'),
        ),
      );
      return;
    }

    String type = selectedType == 'Other'
        ? otherTypeController.text
        : selectedType;

    Pet pet = Pet(
      name: nameController.text,
      type: type,
    );

    AppData.pets.add(pet);

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Schedule(pet: pet),
      ),
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    otherTypeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pet Information'),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [

            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: 'Pet Name',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            DropdownButtonFormField<String>(
              value: selectedType,
              decoration: const InputDecoration(
                labelText: 'Pet Type',
                border: OutlineInputBorder(),
              ),

              items: petTypes.map((type) {
                return DropdownMenuItem(
                  value: type,
                  child: Text(type),
                );
              }).toList(),

              onChanged: (value) {
                setState(() {
                  selectedType = value!;
                });
              },
            ),

            if (selectedType == 'Other') ...[
              const SizedBox(height: 20),

              TextField(
                controller: otherTypeController,
                decoration: const InputDecoration(
                  labelText: 'Enter Pet Type',
                  border: OutlineInputBorder(),
                ),
              ),
            ],

            const SizedBox(height: 25),

            ElevatedButton(
              onPressed: savePet,
              child: const Text('Save Pet'),
            ),
          ],
        ),
      ),
    );
  }
}
