import 'package:cerdas_swamedikasi/app/config/constants/app-constants.dart';
import 'package:cerdas_swamedikasi/app/config/themes/app-theme.dart';
import 'package:cerdas_swamedikasi/app/global_widgets/buttons/custom-button.dart';
import 'package:cerdas_swamedikasi/app/global_widgets/cards/custom-card.dart';
import 'package:cerdas_swamedikasi/app/modules/about/controllers/about-controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AboutView extends GetView<AboutController> {
  const AboutView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tentang Aplikasi'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppConstants.PADDING_M),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildAppInfo(),
            const SizedBox(height: AppConstants.PADDING_L),
            _buildAppDescription(),
            const SizedBox(height: AppConstants.PADDING_L),
            _buildDeveloperInfo(),
            const SizedBox(height: AppConstants.PADDING_L),
            _buildContactInfo(),
            const SizedBox(height: AppConstants.PADDING_L),
            Center(
              child: CustomButton(
                text: 'Kembali',
                onPressed: controller.goBack,
                type: ButtonType.primary,
                width: 200,
                isFullWidth: false,
              ),
            ),
            const SizedBox(height: AppConstants.PADDING_L),
          ],
        ),
      ),
    );
  }

  Widget _buildAppInfo() {
    return Center(
      child: Column(
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: AppTheme.primaryColor,
              borderRadius: BorderRadius.circular(20),
              boxShadow: AppTheme.shadow,
            ),
            child: const Icon(
              Icons.medical_services_rounded,
              size: 60,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: AppConstants.PADDING_M),
          Text(
            AppConstants.appName,
            style: Get.textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: AppTheme.primaryColor,
            ),
          ),
          const SizedBox(height: AppConstants.PADDING_XS),
          Text(
            'Version ${controller.appVersion}',
            style: Get.textTheme.bodyMedium?.copyWith(
              color: AppTheme.textColorSecondary,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAppDescription() {
    return CustomCard(
      backgroundColor: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomCardHeader(
            title: 'Tentang Aplikasi',
            leading: Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                color: AppTheme.primaryColor.withOpacity(0.1),
                borderRadius:
                    BorderRadius.circular(AppConstants.BORDER_RADIUS_S),
              ),
              child: const Icon(
                Icons.info_outline,
                color: AppTheme.primaryColor,
                size: 18,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(AppConstants.PADDING_M),
            child: Text(
              controller.appDescription,
              style: Get.textTheme.bodyMedium,
              textAlign: TextAlign.justify,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDeveloperInfo() {
    return CustomCard(
      backgroundColor: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomCardHeader(
            title: 'Pengembang',
            leading: Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                color: AppTheme.secondaryColor.withOpacity(0.1),
                borderRadius:
                    BorderRadius.circular(AppConstants.BORDER_RADIUS_S),
              ),
              child: const Icon(
                Icons.code,
                color: AppTheme.secondaryColor,
                size: 18,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(AppConstants.PADDING_M),
            child: Text(
              controller.developerInfo,
              style: Get.textTheme.bodyMedium,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContactInfo() {
    return CustomCard(
      backgroundColor: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomCardHeader(
            title: 'Kontak',
            leading: Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                color: AppTheme.accentColor.withOpacity(0.1),
                borderRadius:
                    BorderRadius.circular(AppConstants.BORDER_RADIUS_S),
              ),
              child: const Icon(
                Icons.email_outlined,
                color: AppTheme.accentColor,
                size: 18,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(AppConstants.PADDING_M),
            child: Row(
              children: [
                const Icon(
                  Icons.email,
                  size: 20,
                  color: AppTheme.textColorSecondary,
                ),
                const SizedBox(width: AppConstants.PADDING_M),
                Text(
                  controller.contactEmail,
                  style: Get.textTheme.bodyMedium,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
