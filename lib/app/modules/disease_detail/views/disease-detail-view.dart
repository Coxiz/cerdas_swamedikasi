import 'package:cerdas_swamedikasi/app/config/constants/app-constants.dart';
import 'package:cerdas_swamedikasi/app/config/themes/app-theme.dart';
import 'package:cerdas_swamedikasi/app/global_widgets/buttons/custom-button.dart';
import 'package:cerdas_swamedikasi/app/global_widgets/inputs/symptom-checkbox.dart';
import 'package:cerdas_swamedikasi/app/modules/disease_detail/controllers/disease-detail-controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DiseaseDetailView extends GetView<DiseaseDetailController> {
  const DiseaseDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Penyakit'),
        centerTitle: true,
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        return Column(
          children: [
            _buildDiseaseHeader(),
            Expanded(
              child: _buildSymptomList(),
            ),
            _buildBottomButtons(),
          ],
        );
      }),
    );
  }

  Widget _buildDiseaseHeader() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppConstants.PADDING_L),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(AppConstants.BORDER_RADIUS_L),
          bottomRight: Radius.circular(AppConstants.BORDER_RADIUS_L),
        ),
        boxShadow: AppTheme.shadow,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: AppTheme.primaryColor.withOpacity(0.1),
                  borderRadius:
                      BorderRadius.circular(AppConstants.BORDER_RADIUS_M),
                ),
                child: const Icon(
                  Icons.health_and_safety,
                  color: AppTheme.primaryColor,
                  size: 28,
                ),
              ),
              const SizedBox(width: AppConstants.PADDING_M),
              Expanded(
                child: Text(
                  controller.disease.name,
                  style: Get.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: AppConstants.PADDING_M),
          Text(
            controller.disease.description,
            style: Get.textTheme.bodyMedium,
          ),
          const SizedBox(height: AppConstants.PADDING_M),
          Container(
            padding: const EdgeInsets.all(AppConstants.PADDING_M),
            decoration: BoxDecoration(
              color: AppTheme.infoColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(AppConstants.BORDER_RADIUS_M),
              border: Border.all(
                color: AppTheme.infoColor,
                width: 1,
              ),
            ),
            child: Row(
              children: [
                const Icon(
                  Icons.info_outline,
                  color: AppTheme.infoColor,
                ),
                const SizedBox(width: AppConstants.PADDING_M),
                const Expanded(
                  child: Text(
                    'Pilih gejala yang Anda alami untuk mendapatkan rekomendasi pengobatan yang tepat.',
                    style: TextStyle(
                      color: AppTheme.textColorPrimary,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSymptomList() {
    return Obx(() {
      return ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: AppConstants.PADDING_M),
        itemCount: controller.symptoms.length,
        itemBuilder: (context, index) {
          final symptom = controller.symptoms[index];
          return Obx(() {
            return SymptomCheckbox(
              symptom: symptom,
              isChecked: controller.isSymptomSelected(symptom.id),
              onChanged: (checked) {
                controller.toggleSymptom(symptom.id);
              },
            );
          });
        },
      );
    });
  }

  Widget _buildBottomButtons() {
    return Container(
      padding: const EdgeInsets.all(AppConstants.PADDING_M),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(AppConstants.BORDER_RADIUS_L),
          topRight: Radius.circular(AppConstants.BORDER_RADIUS_L),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            offset: const Offset(0, -3),
            blurRadius: 6,
          ),
        ],
      ),
      child: Obx(() {
        return CustomButton(
          text: 'Lihat Hasil',
          onPressed: controller.canProceed
              ? () => controller.goToRecommendation()
              : null,
          type: ButtonType.primary,
          isDisabled: !controller.canProceed,
          icon: Icons.arrow_forward,
        );
      }),
    );
  }
}
