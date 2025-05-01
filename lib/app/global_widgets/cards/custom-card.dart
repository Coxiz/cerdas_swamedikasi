import 'package:cerdas_swamedikasi/app/config/constants/app-constants.dart';
import 'package:cerdas_swamedikasi/app/config/themes/app-theme.dart';
import 'package:flutter/material.dart';
import '../../config/constants/app_constants.dart';
import '../../config/themes/app_theme.dart';

class CustomCard extends StatelessWidget {
  final Widget child;
  final Color? backgroundColor;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry margin;
  final double borderRadius;
  final double elevation;
  final VoidCallback? onTap;
  final bool hasBorder;
  final Color? borderColor;
  final List<BoxShadow>? boxShadow;

  const CustomCard({
    Key? key,
    required this.child,
    this.backgroundColor,
    this.padding = const EdgeInsets.all(AppConstants.PADDING_M),
    this.margin = const EdgeInsets.all(AppConstants.PADDING_S),
    this.borderRadius = AppConstants.BORDER_RADIUS_L,
    this.elevation = 2,
    this.onTap,
    this.hasBorder = false,
    this.borderColor,
    this.boxShadow,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (onTap != null) {
      return GestureDetector(
        onTap: onTap,
        child: _buildCard(),
      );
    }

    return _buildCard();
  }

  Widget _buildCard() {
    return Container(
      margin: margin,
      decoration: BoxDecoration(
        color: backgroundColor ?? AppTheme.cardColor,
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: boxShadow ?? (elevation > 0 ? AppTheme.shadow : null),
        border: hasBorder
            ? Border.all(
                color: borderColor ?? AppTheme.textColorLight,
                width: 1,
              )
            : null,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: Padding(
          padding: padding,
          child: child,
        ),
      ),
    );
  }
}

class CustomCardHeader extends StatelessWidget {
  final String title;
  final TextStyle? titleStyle;
  final Widget? leading;
  final Widget? trailing;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry padding;
  final bool hasDivider;

  const CustomCardHeader({
    Key? key,
    required this.title,
    this.titleStyle,
    this.leading,
    this.trailing,
    this.onTap,
    this.padding = const EdgeInsets.only(
      left: AppConstants.PADDING_M,
      right: AppConstants.PADDING_M,
      top: AppConstants.PADDING_M,
      bottom: AppConstants.PADDING_S,
    ),
    this.hasDivider = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        InkWell(
          onTap: onTap,
          child: Padding(
            padding: padding,
            child: Row(
              children: [
                if (leading != null) ...[
                  leading!,
                  const SizedBox(width: AppConstants.PADDING_M),
                ],
                Expanded(
                  child: Text(
                    title,
                    style: titleStyle ??
                        Theme.of(context).textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                  ),
                ),
                if (trailing != null) ...[
                  const SizedBox(width: AppConstants.PADDING_M),
                  trailing!,
                ],
              ],
            ),
          ),
        ),
        if (hasDivider)
          const Divider(
            height: 1,
            thickness: 1,
            color: AppTheme.textColorLight,
          ),
      ],
    );
  }
}

class CustomCardFooter extends StatelessWidget {
  final List<Widget> actions;
  final MainAxisAlignment actionsAlignment;
  final EdgeInsetsGeometry padding;
  final bool hasDivider;

  const CustomCardFooter({
    Key? key,
    required this.actions,
    this.actionsAlignment = MainAxisAlignment.end,
    this.padding = const EdgeInsets.only(
      left: AppConstants.PADDING_M,
      right: AppConstants.PADDING_M,
      top: AppConstants.PADDING_S,
      bottom: AppConstants.PADDING_M,
    ),
    this.hasDivider = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (hasDivider)
          const Divider(
            height: 1,
            thickness: 1,
            color: AppTheme.textColorLight,
          ),
        Padding(
          padding: padding,
          child: Row(
            mainAxisAlignment: actionsAlignment,
            children: actions,
          ),
        ),
      ],
    );
  }
}
