import 'package:cerdas_swamedikasi/app/config/constants/app-constants.dart';
import 'package:cerdas_swamedikasi/app/config/themes/app-theme.dart';
import 'package:cerdas_swamedikasi/app/data/models/symptom-model.dart';
import 'package:flutter/material.dart';
import '../../config/constants/app_constants.dart';
import '../../config/themes/app_theme.dart';

class SymptomCheckbox extends StatelessWidget {
  final Symptom symptom;
  final bool isChecked;
  final Function(bool?) onChanged;

  const SymptomCheckbox({
    Key? key,
    required this.symptom,
    required this.isChecked,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Determine colors based on whether symptom is critical and checked
    Color borderColor = symptom.isCritical
        ? AppTheme.errorColor
        : (isChecked ? AppTheme.primaryColor : AppTheme.textColorLight);

    Color backgroundColor = symptom.isCritical
        ? AppTheme.errorColor.withOpacity(0.05)
        : (isChecked ? AppTheme.primaryColor.withOpacity(0.05) : Colors.white);

    Color textColor = symptom.isCritical
        ? AppTheme.errorColor
        : (isChecked ? AppTheme.primaryColor : AppTheme.textColorPrimary);

    Color checkboxActiveColor =
        symptom.isCritical ? AppTheme.errorColor : AppTheme.primaryColor;

    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: AppConstants.PADDING_XS,
        horizontal: AppConstants.PADDING_M,
      ),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(AppConstants.BORDER_RADIUS_M),
        border: Border.all(
          color: borderColor,
          width: symptom.isCritical ? 1.5 : 1,
        ),
      ),
      child: CheckboxListTile(
        title: Row(
          children: [
            Expanded(
              child: Text(
                symptom.name,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: isChecked || symptom.isCritical
                      ? FontWeight.w600
                      : FontWeight.normal,
                  color: textColor,
                ),
              ),
            ),
            if (symptom.isCritical)
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppConstants.PADDING_S,
                  vertical: AppConstants.PADDING_XS,
                ),
                decoration: BoxDecoration(
                  color: AppTheme.errorColor.withOpacity(0.1),
                  borderRadius:
                      BorderRadius.circular(AppConstants.BORDER_RADIUS_S),
                ),
                child: const Text(
                  'Gejala Penting',
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.errorColor,
                  ),
                ),
              ),
          ],
        ),
        subtitle: symptom.description.isNotEmpty
            ? Padding(
                padding: const EdgeInsets.only(top: 4.0),
                child: Text(
                  symptom.description,
                  style: TextStyle(
                    fontSize: 12,
                    color: symptom.isCritical
                        ? AppTheme.errorColor.withOpacity(0.8)
                        : (isChecked
                            ? AppTheme.primaryColor.withOpacity(0.8)
                            : AppTheme.textColorSecondary),
                  ),
                ),
              )
            : null,
        value: isChecked,
        onChanged: onChanged,
        activeColor: checkboxActiveColor,
        checkColor: Colors.white,
        controlAffinity: ListTileControlAffinity.leading,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: AppConstants.PADDING_M,
          vertical: AppConstants.PADDING_S,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppConstants.BORDER_RADIUS_M),
        ),
      ),
    );
  }
}
