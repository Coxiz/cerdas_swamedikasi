import 'package:cerdas_swamedikasi/app/config/constants/app-constants.dart';
import 'package:cerdas_swamedikasi/app/config/themes/app-theme.dart';
import 'package:cerdas_swamedikasi/app/data/models/disease-model.dart';
import 'package:flutter/material.dart';
import '../../config/constants/app_constants.dart';
import '../../config/themes/app_theme.dart';

class DiseaseItem extends StatelessWidget {
  final Disease disease;
  final VoidCallback onTap;

  const DiseaseItem({
    Key? key,
    required this.disease,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: AppConstants.PADDING_M,
        vertical: AppConstants.PADDING_S,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppConstants.BORDER_RADIUS_L),
        boxShadow: AppTheme.shadow,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(AppConstants.BORDER_RADIUS_L),
          child: Padding(
            padding: const EdgeInsets.all(AppConstants.PADDING_M),
            child: Row(
              children: [
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: AppTheme.primaryColor.withOpacity(0.1),
                    borderRadius:
                        BorderRadius.circular(AppConstants.BORDER_RADIUS_M),
                  ),
                  // Menambahkan icon yang sama untuk semua penyakit
                  child: const Icon(
                    Icons.medication,
                    size: 28,
                    color: AppTheme.primaryColor,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        disease.name,
                        style:
                            Theme.of(context).textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.w600,
                                ),
                      ),
                      // Removed the symptom count as requested
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
    );
  }
}
