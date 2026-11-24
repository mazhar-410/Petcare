
class Treatment {
  String petName;
  String feedingFrequency;
  String medicationName;
  List<String> medicationTimes;
  String treatmentPlan;
  DateTime date;

  Treatment({
    required this.petName,
    required this.feedingFrequency,
    required this.medicationName,
    required this.medicationTimes,
    required this.treatmentPlan,
    required this.date,
  });
}
