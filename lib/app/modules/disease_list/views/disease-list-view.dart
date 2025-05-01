import 'package:cerdas_swamedikasi/app/config/constants/app-constants.dart';
import 'package:cerdas_swamedikasi/app/config/themes/app-theme.dart';
import 'package:cerdas_swamedikasi/app/global_widgets/cards/disease-item.dart';
import 'package:cerdas_swamedikasi/app/global_widgets/inputs/search-input.dart';
import 'package:cerdas_swamedikasi/app/modules/disease_list/controllers/disease-list-controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DiseaseListView extends GetView<DiseaseListController> {
  const DiseaseListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Penyakit'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          _buildSearchBar(),
          Expanded(
            child: _buildDiseaseList(),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: AppConstants.PADDING_M,
      ),
      child: SearchInput(
        controller: controller.searchController,
        hintText: 'Cari penyakit...',
        onChanged: (value) {
          controller.filterDiseases(value);
        },
        onClear: () {
          controller.filterDiseases('');
        },
      ),
    );
  }

  Widget _buildDiseaseList() {
    return Obx(() {
      if (controller.isLoading.value) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }

      if (controller.filteredDiseases.isEmpty) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.search_off,
                size: 64,
                color: AppTheme.textColorLight,
              ),
              const SizedBox(height: AppConstants.PADDING_M),
              Text(
                'Tidak ada penyakit yang ditemukan',
                style: Get.textTheme.titleMedium?.copyWith(
                  color: AppTheme.textColorSecondary,
                ),
              ),
              const SizedBox(height: AppConstants.PADDING_S),
              const Text(
                'Coba gunakan kata kunci yang berbeda',
                style: TextStyle(
                  color: AppTheme.textColorLight,
                ),
              ),
            ],
          ),
        );
      }

      return ListView.builder(
        padding: const EdgeInsets.only(bottom: AppConstants.PADDING_L),
        itemCount: controller.filteredDiseases.length,
        itemBuilder: (context, index) {
          final disease = controller.filteredDiseases[index];
          return DiseaseItem(
            disease: disease,
            onTap: () => controller.goToDiseaseDetail(disease),
          );
        },
      );
    });
  }
}
