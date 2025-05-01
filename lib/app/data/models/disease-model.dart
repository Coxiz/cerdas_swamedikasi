class Disease {
  final String id;
  final String name;
  final String description;
  final List<String> symptoms;
  final List<String> medications;

  Disease({
    required this.id,
    required this.name,
    required this.description,
    required this.symptoms,
    required this.medications,
  });

  factory Disease.fromJson(Map<String, dynamic> json) {
    return Disease(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      symptoms: List<String>.from(json['symptoms']),
      medications: List<String>.from(json['medications']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'symptoms': symptoms,
      'medications': medications,
    };
  }
}
