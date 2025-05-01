import 'package:cerdas_swamedikasi/app/data/models/disease-model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/services/data_service.dart';

class DiseaseListController extends GetxController {
  final DataService _dataService = Get.find<DataService>();

  final searchController = TextEditingController();

  var isLoading = false.obs;
  var diseases = <Disease>[].obs;
  var filteredDiseases = <Disease>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadDiseases();
  }

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }

  void loadDiseases() {
    isLoading.value = true;

    try {
      diseases.value = _dataService.getDiseases();
      filteredDiseases.value = diseases;
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to load diseases: ${e.toString()}',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }

  void filterDiseases(String query) {
    if (query.isEmpty) {
      filteredDiseases.value = diseases;
    } else {
      filteredDiseases.value = _dataService.filterDiseasesByName(query);
    }
  }

  void goToDiseaseDetail(Disease disease) {
    Get.toNamed('/disease-detail', arguments: disease);
  }
}
