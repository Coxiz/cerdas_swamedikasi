import 'package:cerdas_swamedikasi/app/config/themes/app-theme.dart';
import 'package:cerdas_swamedikasi/app/data/models/disease-model.dart';
import 'package:cerdas_swamedikasi/app/data/models/recommendation-model.dart';
import 'package:cerdas_swamedikasi/app/data/models/symptom-model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../../data/services/data_service.dart';

class RecommendationController extends GetxController {
  final DataService _dataService = Get.find<DataService>();

  var isLoading = false.obs;
  late Disease disease;
  late List<String> selectedSymptomIds;
  var selectedSymptoms = <Symptom>[].obs;
  var recommendation = Rx<Recommendation?>(null);

  @override
  void onInit() {
    super.onInit();

    // Get data from arguments
    if (Get.arguments is Map<String, dynamic>) {
      final args = Get.arguments as Map<String, dynamic>;

      if (args.containsKey('disease') && args.containsKey('selectedSymptoms')) {
        disease = args['disease'] as Disease;
        selectedSymptomIds = args['selectedSymptoms'] as List<String>;
        loadData();
      } else {
        showError('Invalid data format');
      }
    } else {
      showError('Invalid arguments');
    }
  }

  void loadData() {
    isLoading.value = true;

    try {
      // Load selected symptoms
      selectedSymptoms.value = selectedSymptomIds
          .map((id) => _dataService.findSymptomById(id))
          .where((symptom) => symptom != null)
          .cast<Symptom>()
          .toList();

      // Load recommendation
      recommendation.value =
          _dataService.findRecommendationByDiseaseId(disease.id);

      if (recommendation.value == null) {
        showError('Recommendation not found for this disease');
      }
    } catch (e) {
      showError('Failed to load data: ${e.toString()}');
    } finally {
      isLoading.value = false;
    }
  }

  void showError(String message) {
    Get.snackbar(
      'Error',
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.red,
      colorText: Colors.white,
    );
    Get.back();
  }

  void copyRecommendation() {
    if (recommendation.value != null) {
      final text = generateRecommendationText();
      Clipboard.setData(ClipboardData(text: text));

      Get.snackbar(
        'Berhasil',
        'Rekomendasi berhasil disalin',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: AppTheme.successColor,
        colorText: Colors.white,
        duration: const Duration(seconds: 2),
      );
    }
  }

  String generateRecommendationText() {
    final rec = recommendation.value!;
    final buffer = StringBuffer();

    buffer.writeln('REKOMENDASI SWAMEDIKASI');
    buffer.writeln('=======================');
    buffer.writeln('Penyakit: ${disease.name}');
    buffer.writeln('');

    buffer.writeln('Gejala yang dialami:');
    for (var i = 0; i < selectedSymptoms.length; i++) {
      buffer.writeln('${i + 1}. ${selectedSymptoms[i].name}');
    }
    buffer.writeln('');

    buffer.writeln('OBAT YANG DIREKOMENDASIKAN:');
    for (var i = 0; i < rec.medications.length; i++) {
      final med = rec.medications[i];
      buffer.writeln('${i + 1}. ${med.name}');
      buffer.writeln('   Dosis: ${med.dosage}');
      buffer.writeln('   Frekuensi: ${med.frequency}');
      buffer.writeln('   Durasi: ${med.duration}');
      if (med.precautions.isNotEmpty) {
        buffer.writeln('   Perhatian: ${med.precautions.join(', ')}');
      }
      buffer.writeln('');
    }

    if (rec.additionalAdvice.isNotEmpty) {
      buffer.writeln('SARAN TAMBAHAN:');
      for (var i = 0; i < rec.additionalAdvice.length; i++) {
        buffer.writeln('${i + 1}. ${rec.additionalAdvice[i]}');
      }
      buffer.writeln('');
    }

    if (rec.warnings.isNotEmpty) {
      buffer.writeln('PERINGATAN:');
      for (var i = 0; i < rec.warnings.length; i++) {
        buffer.writeln('${i + 1}. ${rec.warnings[i]}');
      }
      buffer.writeln('');
    }

    buffer.writeln(
        'Catatan: Rekomendasi ini bersifat umum. Konsultasikan dengan tenaga kesehatan jika gejala memburuk atau tidak membaik dalam 3 hari.');

    return buffer.toString();
  }

  void goToHome() {
    Get.offAllNamed('/home');
  }
}
