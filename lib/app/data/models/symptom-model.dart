class Symptom {
  final String id;
  final String name;
  final String description;
  final int severity; // 1-3 (mild, moderate, severe)
  final bool isCritical; // Flag to mark symptoms that require medical attention

  Symptom({
    required this.id,
    required this.name,
    this.description = '',
    this.severity = 1,
    this.isCritical = false,
  });

  factory Symptom.fromJson(Map<String, dynamic> json) {
    return Symptom(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String? ?? '',
      severity: json['severity'] as int? ?? 1,
      isCritical: json['isCritical'] as bool? ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'severity': severity,
      'isCritical': isCritical,
    };
  }
}
