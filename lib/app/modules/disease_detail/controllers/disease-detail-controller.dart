import 'package:cerdas_swamedikasi/app/config/themes/app-theme.dart';
import 'package:cerdas_swamedikasi/app/data/models/disease-model.dart';
import 'package:cerdas_swamedikasi/app/data/models/symptom-model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/services/data_service.dart';

class DiseaseDetailController extends GetxController {
  final DataService _dataService = Get.find<DataService>();

  var isLoading = false.obs;
  late Disease disease;
  var symptoms = <Symptom>[].obs;
  var selectedSymptoms = <String>[].obs;

  @override
  void onInit() {
    super.onInit();

    // Get disease from arguments
    if (Get.arguments is Disease) {
      disease = Get.arguments;
      loadSymptoms();
    } else {
      Get.snackbar(
        'Error',
        'Invalid disease data',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      Get.back();
    }
  }

  void loadSymptoms() {
    isLoading.value = true;

    try {
      symptoms.value = _dataService.getSymptomsForDisease(disease);
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to load symptoms: ${e.toString()}',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }

  void toggleSymptom(String symptomId) {
    if (selectedSymptoms.contains(symptomId)) {
      selectedSymptoms.remove(symptomId);
    } else {
      selectedSymptoms.add(symptomId);
    }
  }

  bool isSymptomSelected(String symptomId) {
    return selectedSymptoms.contains(symptomId);
  }

  bool get canProceed {
    // If any selected symptom is critical, allow proceeding regardless of count
    if (hasCriticalSymptom()) {
      return true;
    }
    // Otherwise, require at least 2 symptoms to be selected
    return selectedSymptoms.length >= 2;
  }

  bool hasCriticalSymptom() {
    for (String id in selectedSymptoms) {
      Symptom? symptom = _dataService.findSymptomById(id);
      if (symptom != null && symptom.isCritical) {
        return true;
      }
    }
    return false;
  }

  void goToRecommendation() {
    if (canProceed) {
      Get.toNamed('/recommendation', arguments: {
        'disease': disease,
        'selectedSymptoms': selectedSymptoms,
      });
    } else {
      Get.snackbar(
        'Perhatian',
        'Silakan pilih minimal dua gejala',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: AppTheme.warningColor,
        colorText: Colors.white,
      );
    }
  }
}
