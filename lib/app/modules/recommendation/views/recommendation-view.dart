import 'package:cerdas_swamedikasi/app/config/constants/app-constants.dart';
import 'package:cerdas_swamedikasi/app/config/themes/app-theme.dart';
import 'package:cerdas_swamedikasi/app/global_widgets/buttons/custom-button.dart';
import 'package:cerdas_swamedikasi/app/global_widgets/cards/custom-card.dart';
import 'package:cerdas_swamedikasi/app/modules/recommendation/controllers/recommendation-controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RecommendationView extends GetView<RecommendationController> {
  const RecommendationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rekomendasi Swamedikasi'),
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
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(AppConstants.PADDING_M),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildHeader(),
                    const SizedBox(height: AppConstants.PADDING_M),
                    _buildSelectedSymptoms(),
                    const SizedBox(height: AppConstants.PADDING_M),
                    _buildMedicationList(),
                    const SizedBox(height: AppConstants.PADDING_M),
                    _buildAdditionalAdvice(),
                    const SizedBox(height: AppConstants.PADDING_M),
                    _buildWarnings(),
                    const SizedBox(height: AppConstants.PADDING_L),
                  ],
                ),
              ),
            ),
            _buildBottomButtons(),
          ],
        );
      }),
    );
  }

  Widget _buildHeader() {
    return CustomCard(
      backgroundColor: Colors.white,
      borderRadius: AppConstants.BORDER_RADIUS_L,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: AppTheme.successColor.withOpacity(0.1),
                  borderRadius:
                      BorderRadius.circular(AppConstants.BORDER_RADIUS_M),
                ),
                child: const Icon(
                  Icons.check_circle,
                  color: AppTheme.successColor,
                  size: 28,
                ),
              ),
              const SizedBox(width: AppConstants.PADDING_M),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Rekomendasi untuk',
                      style: Get.textTheme.bodyMedium?.copyWith(
                        color: AppTheme.textColorSecondary,
                      ),
                    ),
                    Text(
                      controller.disease.name,
                      style: Get.textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: AppConstants.PADDING_M),
          Obx(() {
            final rec = controller.recommendation.value;
            if (rec == null) return const SizedBox();

            return Text(
              rec.description,
              style: Get.textTheme.bodyMedium,
            );
          }),
        ],
      ),
    );
  }

  Widget _buildSelectedSymptoms() {
    return CustomCard(
      backgroundColor: Colors.white,
      borderRadius: AppConstants.BORDER_RADIUS_L,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomCardHeader(
            title: 'Gejala yang Anda Alami',
            leading: Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                color: AppTheme.infoColor.withOpacity(0.1),
                borderRadius:
                    BorderRadius.circular(AppConstants.BORDER_RADIUS_S),
              ),
              child: const Icon(
                Icons.sentiment_dissatisfied,
                color: AppTheme.infoColor,
                size: 18,
              ),
            ),
          ),
          const SizedBox(height: AppConstants.PADDING_S),
          Obx(() {
            if (controller.selectedSymptoms.isEmpty) {
              return const Padding(
                padding: EdgeInsets.all(AppConstants.PADDING_M),
                child: Text('Tidak ada gejala yang dipilih'),
              );
            }

            return ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: controller.selectedSymptoms.length,
              itemBuilder: (context, index) {
                final symptom = controller.selectedSymptoms[index];
                return ListTile(
                  leading: const Icon(
                    Icons.circle,
                    size: 10,
                    color: AppTheme.primaryColor,
                  ),
                  title: Text(
                    symptom.name,
                    style: Get.textTheme.bodyMedium,
                  ),
                  dense: true,
                  visualDensity: VisualDensity.compact,
                );
              },
            );
          }),
        ],
      ),
    );
  }

  Widget _buildMedicationList() {
    return Obx(() {
      final rec = controller.recommendation.value;
      if (rec == null) return const SizedBox();

      return CustomCard(
        backgroundColor: Colors.white,
        borderRadius: AppConstants.BORDER_RADIUS_L,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomCardHeader(
              title: 'Obat yang Direkomendasikan',
              leading: Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: AppTheme.primaryColor.withOpacity(0.1),
                  borderRadius:
                      BorderRadius.circular(AppConstants.BORDER_RADIUS_S),
                ),
                child: const Icon(
                  Icons.medication,
                  color: AppTheme.primaryColor,
                  size: 18,
                ),
              ),
            ),
            const SizedBox(height: AppConstants.PADDING_S),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: rec.medications.length,
              separatorBuilder: (context, index) => const Divider(),
              itemBuilder: (context, index) {
                final medication = rec.medications[index];
                return Padding(
                  padding: const EdgeInsets.all(AppConstants.PADDING_M),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        medication.name,
                        style: Get.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: AppConstants.PADDING_S),
                      _buildInfoRow(
                        icon: Icons.medical_information,
                        label: 'Dosis:',
                        value: medication.dosage,
                      ),
                      _buildInfoRow(
                        icon: Icons.schedule,
                        label: 'Frekuensi:',
                        value: medication.frequency,
                      ),
                      _buildInfoRow(
                        icon: Icons.calendar_today,
                        label: 'Durasi:',
                        value: medication.duration,
                      ),
                      if (medication.sideEffects.isNotEmpty) ...[
                        const SizedBox(height: AppConstants.PADDING_S),
                        Text(
                          'Efek Samping:',
                          style: Get.textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: AppConstants.PADDING_XS),
                        Wrap(
                          spacing: AppConstants.PADDING_S,
                          runSpacing: AppConstants.PADDING_XS,
                          children: medication.sideEffects.map((effect) {
                            return Chip(
                              label: Text(
                                effect,
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: AppTheme.textColorSecondary,
                                ),
                              ),
                              backgroundColor: Colors.grey[200],
                              visualDensity: VisualDensity.compact,
                              materialTapTargetSize:
                                  MaterialTapTargetSize.shrinkWrap,
                            );
                          }).toList(),
                        ),
                      ],
                      if (medication.precautions.isNotEmpty) ...[
                        const SizedBox(height: AppConstants.PADDING_S),
                        Text(
                          'Perhatian:',
                          style: Get.textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: AppConstants.PADDING_XS),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: medication.precautions.map((precaution) {
                            return Padding(
                              padding: const EdgeInsets.only(
                                  bottom: AppConstants.PADDING_XS),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Icon(
                                    Icons.warning_amber,
                                    size: 16,
                                    color: AppTheme.warningColor,
                                  ),
                                  const SizedBox(width: AppConstants.PADDING_S),
                                  Expanded(
                                    child: Text(
                                      precaution,
                                      style: const TextStyle(
                                        fontSize: 13,
                                        color: AppTheme.textColorPrimary,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }).toList(),
                        ),
                      ],
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      );
    });
  }

  Widget _buildAdditionalAdvice() {
    return Obx(() {
      final rec = controller.recommendation.value;
      if (rec == null || rec.additionalAdvice.isEmpty) return const SizedBox();

      return CustomCard(
        backgroundColor: Colors.white,
        borderRadius: AppConstants.BORDER_RADIUS_L,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomCardHeader(
              title: 'Saran Tambahan',
              leading: Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: AppTheme.secondaryColor.withOpacity(0.1),
                  borderRadius:
                      BorderRadius.circular(AppConstants.BORDER_RADIUS_S),
                ),
                child: const Icon(
                  Icons.lightbulb,
                  color: AppTheme.secondaryColor,
                  size: 18,
                ),
              ),
            ),
            const SizedBox(height: AppConstants.PADDING_S),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: rec.additionalAdvice.length,
              itemBuilder: (context, index) {
                final advice = rec.additionalAdvice[index];
                return ListTile(
                  leading: Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      color: AppTheme.secondaryColor.withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      '${index + 1}',
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: AppTheme.secondaryColor,
                      ),
                    ),
                  ),
                  title: Text(
                    advice,
                    style: Get.textTheme.bodyMedium,
                  ),
                  dense: true,
                );
              },
            ),
            const SizedBox(height: AppConstants.PADDING_S),
          ],
        ),
      );
    });
  }

  Widget _buildWarnings() {
    return Obx(() {
      final rec = controller.recommendation.value;
      if (rec == null || rec.warnings.isEmpty) return const SizedBox();

      return CustomCard(
        backgroundColor: AppTheme.warningColor.withOpacity(0.05),
        borderRadius: AppConstants.BORDER_RADIUS_L,
        hasBorder: true,
        borderColor: AppTheme.warningColor.withOpacity(0.3),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomCardHeader(
              title: 'Peringatan',
              titleStyle: Get.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
                color: AppTheme.warningColor,
              ),
              leading: Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: AppTheme.warningColor.withOpacity(0.1),
                  borderRadius:
                      BorderRadius.circular(AppConstants.BORDER_RADIUS_S),
                ),
                child: const Icon(
                  Icons.warning_amber,
                  color: AppTheme.warningColor,
                  size: 18,
                ),
              ),
              hasDivider: false,
            ),
            const SizedBox(height: AppConstants.PADDING_S),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: rec.warnings.length,
              itemBuilder: (context, index) {
                final warning = rec.warnings[index];
                return Padding(
                  padding: const EdgeInsets.only(
                    left: AppConstants.PADDING_M,
                    right: AppConstants.PADDING_M,
                    bottom: AppConstants.PADDING_M,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.warning_amber,
                        size: 20,
                        color: AppTheme.warningColor,
                      ),
                      const SizedBox(width: AppConstants.PADDING_M),
                      Expanded(
                        child: Text(
                          warning,
                          style: const TextStyle(
                            color: AppTheme.textColorPrimary,
                            height: 1.4,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      );
    });
  }

  Widget _buildInfoRow({
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            icon,
            size: 16,
            color: AppTheme.textColorSecondary,
          ),
          const SizedBox(width: 8),
          SizedBox(
            width: 80,
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 14,
                color: AppTheme.textColorSecondary,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                fontSize: 14,
                color: AppTheme.textColorPrimary,
              ),
            ),
          ),
        ],
      ),
    );
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
      child: Row(
        children: [
          Expanded(
            child: CustomButton(
              text: 'Salin Rekomendasi',
              onPressed: controller.copyRecommendation,
              type: ButtonType.outlined,
              icon: Icons.copy,
            ),
          ),
          const SizedBox(width: AppConstants.PADDING_M),
          Expanded(
            child: CustomButton(
              text: 'Kembali ke Beranda',
              onPressed: controller.goToHome,
              type: ButtonType.primary,
              icon: Icons.home,
            ),
          ),
        ],
      ),
    );
  }
}
