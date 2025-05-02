class Recommendation {
  final String id;
  final String diseaseId;
  final String title;
  final String description;
  final List<MedicationItem> medications;
  final List<String> additionalAdvice;
  final List<String> warnings;
  final bool needsMedicalAttention;
  final String
      criticalMessage; // Message to show when critical symptoms are selected

  Recommendation({
    required this.id,
    required this.diseaseId,
    required this.title,
    required this.description,
    required this.medications,
    this.additionalAdvice = const [],
    this.warnings = const [],
    this.needsMedicalAttention = false,
    this.criticalMessage = '',
  });

  factory Recommendation.fromJson(Map<String, dynamic> json) {
    return Recommendation(
      id: json['id'] as String,
      diseaseId: json['diseaseId'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      medications: (json['medications'] as List)
          .map((item) => MedicationItem.fromJson(item))
          .toList(),
      additionalAdvice: List<String>.from(json['additionalAdvice'] ?? []),
      warnings: List<String>.from(json['warnings'] ?? []),
      needsMedicalAttention: json['needsMedicalAttention'] as bool? ?? false,
      criticalMessage: json['criticalMessage'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'diseaseId': diseaseId,
      'title': title,
      'description': description,
      'medications': medications.map((item) => item.toJson()).toList(),
      'additionalAdvice': additionalAdvice,
      'warnings': warnings,
      'needsMedicalAttention': needsMedicalAttention,
      'criticalMessage': criticalMessage,
    };
  }
}

class MedicationItem {
  final String id;
  final String name;
  final String dosage;
  final String frequency;
  final String duration;
  final List<String> sideEffects;
  final List<String> precautions;

  MedicationItem({
    required this.id,
    required this.name,
    required this.dosage,
    required this.frequency,
    required this.duration,
    this.sideEffects = const [],
    this.precautions = const [],
  });

  factory MedicationItem.fromJson(Map<String, dynamic> json) {
    return MedicationItem(
      id: json['id'] as String,
      name: json['name'] as String,
      dosage: json['dosage'] as String,
      frequency: json['frequency'] as String,
      duration: json['duration'] as String,
      sideEffects: List<String>.from(json['sideEffects'] ?? []),
      precautions: List<String>.from(json['precautions'] ?? []),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'dosage': dosage,
      'frequency': frequency,
      'duration': duration,
      'sideEffects': sideEffects,
      'precautions': precautions,
    };
  }
}
