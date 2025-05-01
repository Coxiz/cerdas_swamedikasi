class Symptom {
  final String id;
  final String name;
  final String description;
  final int severity; // 1-3 (mild, moderate, severe)

  Symptom({
    required this.id,
    required this.name,
    this.description = '',
    this.severity = 1,
  });

  factory Symptom.fromJson(Map<String, dynamic> json) {
    return Symptom(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String? ?? '',
      severity: json['severity'] as int? ?? 1,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'severity': severity,
    };
  }
}
