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

  bool get canProceed => selectedSymptoms.isNotEmpty;

  void goToRecommendation() {
    if (canProceed) {
      Get.toNamed('/recommendation', arguments: {
        'disease': disease,
        'selectedSymptoms': selectedSymptoms,
      });
    } else {
      Get.snackbar(
        'Perhatian',
        'Silakan pilih minimal satu gejala',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: AppTheme.warningColor,
        colorText: Colors.white,
      );
    }
  }
}
