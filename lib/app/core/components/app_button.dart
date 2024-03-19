import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../config/app_colors.dart';

class AppButton extends StatelessWidget {
  final double borderRadius;
  final EdgeInsets? padding;
  final Color backgroundColor;
  final Color foregroundColor;
  final double iconTitleGap;

  ///This can receive `IconData` or `String`. If String is given then it will take it as svg image.
  final dynamic icon;
  final String? buttonText;
  final bool isIconOnPrefix;
  final VoidCallback onTap;
  final TextStyle? buttonTextStyle;
  final double? height;
  final double? width;
  final double? iconSize;
  final List<BoxShadow>? boxShadow;
  final bool isOutlineButton;
  final Color? outlineFillColor;
  final double outlineWidth;
  final bool isLoading;

  const AppButton({
    super.key,
    this.borderRadius = 50,
    this.padding,
    this.backgroundColor = AppColors.primary,
    this.foregroundColor = AppColors.white,
    this.iconTitleGap = 10,
    this.icon,
    this.buttonText,
    this.isIconOnPrefix = true,
    required this.onTap,
    this.buttonTextStyle,
    this.height,
    this.width = double.maxFinite,
    this.iconSize,
    this.boxShadow,
    this.isOutlineButton = false,
    this.outlineFillColor,
    this.outlineWidth = 1,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 1000),
      height: height,
      width: isLoading ? 50 : width,
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          foregroundColor: foregroundColor,
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          padding: padding ?? const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          elevation: 0,
          shadowColor: Colors.transparent,
          // fixedSize: Size(
          //   width ?? Get.width,
          //   height ?? 50,
          // ),
        ),
        onPressed: onTap,
        icon: showIcon(),
        label: isLoading
            ? const Center(
                child: SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(
                    color: AppColors.primary,
                    strokeWidth: 2.4,
                  ),
                ),
              )
            : Text(
                buttonText!,
                style: buttonTextStyle ?? Get.textTheme.headlineSmall?.copyWith(color: foregroundColor),
              ),
      ),
    );
  }

  Widget showIcon() {
    if (icon is IconData) {
      return Icon(
        icon,
        color: foregroundColor,
        size: iconSize ?? 20,
      );
    } else if (icon is String) {
      return SizedBox(
        height: iconSize ?? 20,
        width: iconSize ?? 20,
        child: SvgPicture.asset(
          icon,
          colorFilter: ColorFilter.mode(foregroundColor, BlendMode.srcIn),
        ),
      );
    } else if (icon is Widget) {
      return icon;
    } else {
      return SizedBox(width: iconTitleGap);
    }
  }
}
