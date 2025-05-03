import 'package:cerdas_swamedikasi/app/config/constants/app-constants.dart';
import 'package:cerdas_swamedikasi/app/config/themes/app-theme.dart';
import 'package:cerdas_swamedikasi/app/modules/home/controllers/home-controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(),
            Expanded(
              child: _buildContent(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppConstants.PADDING_L),
      decoration: const BoxDecoration(
        color: AppTheme.primaryColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(AppConstants.BORDER_RADIUS_XL),
          bottomRight: Radius.circular(AppConstants.BORDER_RADIUS_XL),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: AppConstants.PADDING_M),
          Row(
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: const BoxDecoration(
                  color: Colors.transparent,
                  shape: BoxShape.circle,
                ),
                child: Image.asset(
                  'assets/images/Cerdik_white_splash.png',
                  width: 80,
                  height: 80,
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(width: AppConstants.PADDING_M),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppConstants.appName,
                      style: Get.textTheme.headlineMedium?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      "Cerdas Swamedikasi",
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: AppConstants.PADDING_L),
          const Text(
            "Lakukan pengobatan mandiri dengan tepat dan aman",
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: AppConstants.PADDING_S),
        ],
      ),
    );
  }

  Widget _buildContent() {
    return Container(
      padding: const EdgeInsets.all(AppConstants.PADDING_L),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Menu Utama",
            style: Get.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: AppConstants.PADDING_L),
          _buildMenuCard(
            icon: Icons.medical_information,
            title: "Lakukan Swamedikasi",
            subtitle: "Pilih gejala, temukan solusi pengobatan",
            onTap: () => controller.goToDiseaseList(),
            color: AppTheme.primaryColor,
          ),
          _buildMenuCard(
            icon: Icons.help_outline,
            title: "Petunjuk Penggunaan",
            subtitle: "Cara menggunakan aplikasi ini",
            onTap: () => controller.goToGuide(),
            color: AppTheme.secondaryColor,
          ),
          _buildMenuCard(
            icon: Icons.info_outline,
            title: "Tentang Aplikasi",
            subtitle: "Informasi tentang aplikasi & pengembang",
            onTap: () => controller.goToAbout(),
            color: AppTheme.accentColor,
          ),
          const Spacer(),
          const Center(
            child: Text(
              "© 2025 Cerdas Swamedikasi",
              style: TextStyle(
                color: AppTheme.textColorLight,
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuCard({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
    required Color color,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: AppConstants.PADDING_M),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(AppConstants.BORDER_RADIUS_L),
          child: Ink(
            decoration: const BoxDecoration(
              color: Colors.white,
              //    borderRadius: BorderRadius.circular(AppConstants.BORDER_RADIUS_L),
              boxShadow: AppTheme.shadow,
            ),
            child: Container(
              padding: const EdgeInsets.all(AppConstants.PADDING_M),
              child: Row(
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: color.withOpacity(0.1),
                      borderRadius:
                          BorderRadius.circular(AppConstants.BORDER_RADIUS_M),
                    ),
                    child: Icon(
                      icon,
                      size: 32,
                      color: color,
                    ),
                  ),
                  const SizedBox(width: AppConstants.PADDING_M),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: Get.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          subtitle,
                          style: Get.textTheme.bodySmall?.copyWith(
                            color: AppTheme.textColorSecondary,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Icon(
                    Icons.arrow_forward_ios,
                    color: AppTheme.textColorSecondary,
                    size: 16,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
