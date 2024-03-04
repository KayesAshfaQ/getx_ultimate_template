import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sl_v4/app/core/utils/extensions/app_validator.dart';

import '../../gen/assets.gen.dart';
import '../config/app_colors.dart';

enum AppTextFieldType {
  none,
  email,
  password,
  phone,
  number,
}

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    this.controller,
    this.focusNode,
    required this.hint,
    this.label,
    this.autoValidate = false,
    this.isObscure = false,
    this.textFieldType = AppTextFieldType.none,
    this.showCounter = false,
    this.prefixIcon,
    this.prefixIconSize,
    this.prefixIconColor,
    this.suffixIcon,
    this.suffixIconSize,
    this.suffixIconColor,
    this.suffixClick,
    this.maxLength,
    this.maxLines = 1,
    this.minLines = 1,
    this.titleStyle,
    this.activeBorderColor,
    this.onChanged,
    this.radius = 32,
    this.isEnable = true,
    this.willValidate = true,
  });

  final TextEditingController? controller;
  final FocusNode? focusNode;
  final bool autoValidate;
  final bool isObscure;
  final bool showCounter;
  final bool isEnable;
  final AppTextFieldType textFieldType;
  final String hint;
  final String? label;

  ///This can receive `IconData` or `String`. If String is given then it will take it as svg image.
  final dynamic prefixIcon;
  final double? prefixIconSize;
  final Color? prefixIconColor;

  final dynamic suffixIcon;
  final double? suffixIconSize;
  final Color? suffixIconColor;
  final VoidCallback? suffixClick;

  final int? maxLength;
  final int? maxLines;
  final int? minLines;
  final TextStyle? titleStyle;
  final Color? activeBorderColor;
  final void Function(String)? onChanged;
  final double radius;
  final bool willValidate;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      enabled: isEnable,
      focusNode: focusNode,
      style: Get.textTheme.bodyMedium?.copyWith(height: 1),
      obscureText: isObscure,
      maxLines: maxLines,
      minLines: minLines,
      maxLength: maxLength,
      decoration: InputDecoration(
        hintText: hint,

        hintStyle: Get.textTheme.bodyMedium?.copyWith(
          color: AppColors.gray.shade200,
        ),
        labelText: label,
        labelStyle: Get.textTheme.bodyMedium?.copyWith(
          color: AppColors.textColorSwatch,
        ),
        isDense: true,
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        border: inputBorder(),
        enabledBorder: inputBorder(),
        disabledBorder: inputBorder(isDisabled: true),
        focusedBorder: inputBorder(isActive: true),
        errorBorder: inputBorder(isError: true),
        focusedErrorBorder: inputBorder(isActive: true, isError: true),

        // show prefix icon
        prefixIcon: prefixIcon != null
            ? prefixIcon is IconData
                ? Icon(
                    prefixIcon,
                    color: prefixIconColor ?? AppColors.gray.shade400,
                    size: prefixIconSize ?? 24,
                  )
                : prefixIcon is String
                    ? SvgPicture.asset(
                        prefixIcon,
                        height: prefixIconSize ?? 20,
                        width: prefixIconSize ?? 20,
                        colorFilter: ColorFilter.mode(prefixIconColor ?? AppColors.gray.shade400, BlendMode.srcIn),
                        fit: BoxFit.scaleDown,
                      )
                    : null
            : null,

        // change suffix icon size
        suffixIconConstraints: (textFieldType == AppTextFieldType.password || suffixIcon != null)
            ? const BoxConstraints(maxHeight: 48, maxWidth: 48)
            : const BoxConstraints(maxHeight: 48, maxWidth: 16),

        // show password obscure icon in suffix when textfield type is password and suffix icon is not provided otherwise show the provided suffix icon
        suffixIcon: Padding(
          padding: const EdgeInsets.only(left: 4, right: 20),
          child: GestureDetector(
            onTap: suffixClick,
            child: textFieldType == AppTextFieldType.password && suffixIcon == null
                ? Icon(
                    isObscure ? Icons.visibility : Icons.visibility_off,
                    color: suffixIconColor ?? AppColors.gray.shade400,
                    size: suffixIconSize ?? 24,
                  )
                // SvgPicture.asset(
                //     isObscure ? Assets.iconsHome.path : Assets.iconsHeart.path,
                //     colorFilter: ColorFilter.mode(AppColors.gray.shade400, BlendMode.srcIn),
                //     fit: BoxFit.scaleDown,
                //   )
                : suffixIcon is IconData
                    ? Icon(
                        suffixIcon,
                        color: suffixIconColor ?? AppColors.gray.shade400,
                        size: suffixIconSize ?? 24,
                      )
                    : suffixIcon is String
                        ? SvgPicture.asset(
                            suffixIcon,
                            height: suffixIconSize ?? 20,
                            width: suffixIconSize ?? 20,
                            colorFilter: ColorFilter.mode(prefixIconColor ?? AppColors.gray.shade400, BlendMode.srcIn),
                            fit: BoxFit.scaleDown,
                          )
                        : null,
          ),
        ),

        // show counter with textfield
        counterText: showCounter ? '${controller?.text.length ?? 0}/${maxLength ?? 200}' : null,
      ),
      autovalidateMode: autoValidate ? AutovalidateMode.onUserInteraction : null,
      keyboardType: textFieldType == AppTextFieldType.email
          ? TextInputType.emailAddress
          : textFieldType == AppTextFieldType.phone
              ? TextInputType.phone
              : textFieldType == AppTextFieldType.number
                  ? TextInputType.number
                  : TextInputType.text,
      validator: (value) {
        if (!willValidate) return null;

        if (value == null || value.trim().isEmpty) {
          return 'Please enter a valid data';
        } else if (textFieldType == AppTextFieldType.email && !value.isEmail) {
          return 'Please enter a valid email address';
        } else if (textFieldType == AppTextFieldType.phone && !value.isPhoneNumber) {
          return 'Please enter a valid phone number';
        } else if (textFieldType == AppTextFieldType.password && !value.isValidPassword()) {
          return 'Password must be at least 8 characters long';
        }
        return null;
      },
      onChanged: onChanged,
      onTapOutside: (event) => Get.focusScope?.unfocus(),
    );
  }

  /// sets the border on the textfield
  InputBorder inputBorder({bool isActive = false, isError = false, isDisabled = false}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(radius),
      borderSide: BorderSide(
        color: isActive
            ? activeBorderColor ?? AppColors.secondary
            : isError
                ? AppColors.error
                : isDisabled
                    ? AppColors.gray.shade300
                    : AppColors.secondary.shade300,
        width: isActive || (isActive && isError) ? 1.6 : 1.2,
        style: BorderStyle.solid,
      ),
    );
  }
}
