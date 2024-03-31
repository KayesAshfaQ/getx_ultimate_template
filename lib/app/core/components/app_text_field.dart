import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:getx_ultimate_template/app/core/extensions/app_validator.dart';

import '../config/app_colors.dart';

enum AppTextFieldType {
  none,
  email,
  password,
  phone,
  number,
}

class AppTextField extends StatelessWidget {
  /// `AppTextField` is a custom text field widget that extends `StatelessWidget`.
  /// It provides a highly customizable text field with several options.
  ///
  /// The `AppTextField` constructor takes in several parameters:
  /// * `controller`: A `TextEditingController` that controls the text being edited.
  /// * `focusNode`: A `FocusNode` that determines whether the text field has the keyboard focus.
  /// * `autoValidate`: A `bool` that determines whether the text field should auto-validate its content.
  /// * `isObscure`: A `bool` that determines whether the text field should obscure its content.
  /// * `showCounter`: A `bool` that determines whether the text field should show a character counter.
  /// * `isEnable`: A `bool` that determines whether the text field is enabled.
  /// * `textFieldType`: An `AppTextFieldType` that determines the type of the text field (e.g., email, password, phone, number).
  /// * `hint`: A `String` that provides a hint to the user about what to enter in the text field.
  /// * `label`: A `String` that provides a label for the text field.
  /// * `prefixIcon`: A dynamic type that can either be an `IconData` or a `String`. If it's a `String`, it's considered as an SVG image.
  /// * `suffixIcon`: A dynamic type that can either be an `IconData` or a `String`. If it's a `String`, it's considered as an SVG image.
  /// * `suffixClick`: A `VoidCallback` that is called when the suffix icon is clicked.
  /// * `maxLength`: An `int` that determines the maximum length of the text field.
  /// * `maxLines`: An `int` that determines the maximum number of lines for the text field.
  /// * `minLines`: An `int` that determines the minimum number of lines for the text field.
  /// * `textStyle`, `hintStyle`, `labelStyle`: `TextStyle` objects that style the text, hint, and label of the text field, respectively.
  /// * `radius`: A `double` that determines the radius of the text field.
  /// * `filledColor`: A `Color` that determines the fill color of the text field.
  /// * `defaultBorderColor`, `focusedBorderColor`, `disabledBorderColor`: `Color` objects that determine the border color of the text field in different states.
  /// * `defaultBorderWidth`, `focusedBorderWidth`, `disabledBorderWidth`: `double` values that determine the border width of the text field in different states.
  /// * `onChanged`: A `Function` that is called when the text field's content changes.
  /// * `willValidate`: A `bool` that determines whether the text field should validate its content.
  /// * `contentPadding`: An `EdgeInsetsGeometry` that determines the padding around the text field's content.
  ///
  /// Example usage:
  /// ```dart
  /// AppTextField(
  ///   hint: 'Search...',
  ///   textFieldType: AppTextFieldType.none,
  ///   radius: 6.r,
  ///   defaultBorderColor: AppColors.primary.shade300,
  ///   defaultBorderWidth: 1,
  ///   contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
  /// )
  ///
  /// ```
  ///
  /// The `build` method returns a `TextFormField` widget with the above customizations.
  /// The `_inputBorder` method returns an `OutlineInputBorder` with customizations based on the text field's state (focused, error, disabled).
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
    this.prefixIconConstraints,
    this.suffixIconConstraints,
    this.maxLength = 256,
    this.maxLines = 1,
    this.minLines = 1,
    this.textStyle,
    this.hintStyle,
    this.labelStyle,
    this.focusedBorderColor,
    this.defaultBorderColor,
    this.disabledBorderColor,
    this.onChanged,
    this.radius = 32,
    this.filledColor,
    this.isEnable = true,
    this.willValidate = true,
    this.contentPadding,
    this.defaultBorderWidth,
    this.focusedBorderWidth,
    this.disabledBorderWidth,
  }) : _isFilled = filledColor != null;

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
  final BoxConstraints? prefixIconConstraints, suffixIconConstraints;

  final int? maxLength;
  final int? maxLines;
  final int? minLines;
  final TextStyle? textStyle, hintStyle, labelStyle;
  final double radius;
  final Color? filledColor;
  final bool _isFilled;
  final Color? defaultBorderColor, focusedBorderColor, disabledBorderColor;
  final double? defaultBorderWidth, focusedBorderWidth, disabledBorderWidth;

  final void Function(String)? onChanged;
  final bool willValidate;
  final EdgeInsetsGeometry? contentPadding;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      enabled: isEnable,
      focusNode: focusNode,
      style: textStyle ?? Get.textTheme.bodyMedium?.copyWith(height: 1),
      obscureText: isObscure,
      maxLines: maxLines,
      minLines: minLines,
      maxLength: maxLength,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: hintStyle ?? Get.textTheme.bodyMedium?.copyWith(color: AppColors.gray.shade200),

        labelText: label,
        labelStyle: labelStyle ?? Get.textTheme.bodyMedium?.copyWith(color: AppColors.text),

        filled: _isFilled,
        fillColor: filledColor,

        isDense: true,
        contentPadding: contentPadding ?? const EdgeInsets.symmetric(horizontal: 20, vertical: 16),

        enabledBorder: _inputBorder(),
        disabledBorder: _inputBorder(isDisabled: true),
        focusedBorder: _inputBorder(isFocused: true),
        errorBorder: _inputBorder(isError: true),
        focusedErrorBorder: _inputBorder(isFocused: true, isError: true),

        prefixIconConstraints: prefixIcon != null
            ? (prefixIconConstraints ??
                const BoxConstraints(
                  maxHeight: 48,
                  maxWidth: 48,
                ))
            : null,

        // show prefix icon
        prefixIcon: prefixIcon != null
            ? Padding(
                padding: const EdgeInsets.only(left: 8, right: 4),
                child: prefixIcon is IconData
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
                        : null)
            : null,

        // change suffix icon size
        suffixIconConstraints: (textFieldType == AppTextFieldType.password || suffixIcon != null)
            ? (suffixIconConstraints ??
                const BoxConstraints(
                  maxHeight: 48,
                  maxWidth: 48,
                ))
            : null,

        // show password obscure icon as suffix when textfield type is password and suffix icon is not provided otherwise show the provided suffix icon
        suffixIcon: (textFieldType == AppTextFieldType.password || suffixIcon != null)
            ? Padding(
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
              )
            : null,

        // show counter with textfield
        counterText: showCounter ? '${controller?.text.length ?? 0}/${maxLength ?? 200}' : '',
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
  InputBorder _inputBorder({bool isFocused = false, bool isError = false, bool isDisabled = false}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(radius),
      borderSide: BorderSide(
        color: isFocused
            ? focusedBorderColor ?? AppColors.secondary
            : isError
                ? AppColors.error
                : isDisabled
                    ? disabledBorderColor ?? AppColors.gray.shade900
                    : defaultBorderColor ?? AppColors.secondary.shade300,
        width: isFocused || (isFocused && isError)
            ? focusedBorderWidth ?? 1.6
            : isError
                ? defaultBorderWidth ?? 1.2
                : isDisabled
                    ? disabledBorderWidth ?? 1.2
                    : defaultBorderWidth ?? 1.2,
        style: BorderStyle.solid,
      ),
    );
  }
}
