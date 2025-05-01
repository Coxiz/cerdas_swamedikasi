import 'package:cerdas_swamedikasi/app/config/constants/app-constants.dart';
import 'package:cerdas_swamedikasi/app/config/themes/app-theme.dart';
import 'package:cerdas_swamedikasi/app/global_widgets/buttons/custom-button.dart';
import 'package:cerdas_swamedikasi/app/global_widgets/cards/custom-card.dart';
import 'package:cerdas_swamedikasi/app/modules/guide/controllers/guide-controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GuideView extends GetView<GuideController> {
  const GuideView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Petunjuk Penggunaan'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          _buildHeader(),
          Expanded(
            child: _buildStepsList(),
          ),
          _buildBottomButton(),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppConstants.PADDING_L),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: AppTheme.infoColor.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.help_outline,
              size: 36,
              color: AppTheme.infoColor,
            ),
          ),
          const SizedBox(height: AppConstants.PADDING_M),
          Text(
            'Cara Menggunakan Aplikasi',
            style: Get.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: AppConstants.PADDING_S),
          const Text(
            'Ikuti petunjuk berikut untuk memudahkan Anda menggunakan aplikasi ini dengan baik',
            style: TextStyle(
              color: AppTheme.textColorSecondary,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildStepsList() {
    return ListView.builder(
      padding: const EdgeInsets.all(AppConstants.PADDING_M),
      itemCount: controller.steps.length,
      itemBuilder: (context, index) {
        final step = controller.steps[index];
        return _buildStepCard(step, index);
      },
    );
  }

  Widget _buildStepCard(GuideStep step, int index) {
    return CustomCard(
      backgroundColor: Colors.white,
      margin: const EdgeInsets.only(bottom: AppConstants.PADDING_M),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 40,
            height: 40,
            margin: const EdgeInsets.only(right: AppConstants.PADDING_M),
            decoration: BoxDecoration(
              color: AppTheme.primaryColor,
              borderRadius: BorderRadius.circular(AppConstants.BORDER_RADIUS_M),
            ),
            alignment: Alignment.center,
            child: Text(
              '${index + 1}',
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      _getIconData(step.icon),
                      size: 20,
                      color: AppTheme.primaryColor,
                    ),
                    const SizedBox(width: AppConstants.PADDING_S),
                    Expanded(
                      child: Text(
                        step.title,
                        style: Get.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: AppConstants.PADDING_S),
                Text(
                  step.description,
                  style: Get.textTheme.bodyMedium,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  IconData _getIconData(String iconName) {
    switch (iconName) {
      case 'home':
        return Icons.home;
      case 'format_list_bulleted':
        return Icons.format_list_bulleted;
      case 'medical_information':
        return Icons.medical_information;
      case 'recommend':
        return Icons.recommend;
      default:
        return Icons.help_outline;
    }
  }

  Widget _buildBottomButton() {
    return Container(
      padding: const EdgeInsets.all(AppConstants.PADDING_M),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            offset: const Offset(0, -3),
            blurRadius: 6,
          ),
        ],
      ),
      child: CustomButton(
        text: 'Kembali',
        onPressed: controller.goBack,
        type: ButtonType.primary,
      ),
    );
  }
}
