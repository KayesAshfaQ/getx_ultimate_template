import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../gen/assets.gen.dart';
import '../../gen/fonts.gen.dart';
import '../config/app_colors.dart';
import 'app_image_view.dart';
import 'ripple_view.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  /// `CommonAppBar` is a custom AppBar widget that provides a consistent AppBar
  /// across the application with a back button, search field, and a cart action.
  ///
  /// This widget takes several parameters:
  /// * `cartItemCount`: The number of items in the cart. Defaults to 0.
  /// * `showElevation`: A boolean to control the display of the shadow. Defaults to true.
  /// * `backgroundColor`: The color of the AppBar. Defaults to AppColors.white.
  /// * `showBackButton`: A boolean to control the display of the back button. Defaults to true.
  /// * `onBackButtonPressed`: A callback function that is called when the back button is pressed.
  /// * `onCartPressed`: A callback function that is called when the cart button is pressed.
  ///
  /// The `CommonAppBar` implements `PreferredSizeWidget` and has a preferred size of `kToolbarHeight`.
  ///
  /// Example usage:
  /// ```dart
  /// CommonAppBar(
  ///   cartItemCount: 5,
  ///   showElevation: true,
  ///   showBackButton: true,
  ///   backgroundColor: AppColors.white,
  ///   onBackButtonPressed: () => Navigator.of(context).pop(),
  ///   onCartPressed: () => Navigator.of(context).pushNamed('/cart'),
  /// )
  /// ```
  ///
  /// Note: The `onBackButtonPressed` and `onCartPressed` callbacks default to popping the current screen
  /// and navigating to the cart screen respectively if not provided.
  const CommonAppBar({
    super.key,
    this.cartItemCount = 0,
    this.showElevation = true,
    this.showBackButton = true,
    this.showCartButton = true,
    this.backgroundColor = AppColors.white,
    this.onBackButtonPressed,
    this.onCartPressed,
  });

  final int cartItemCount;
  final bool showElevation;
  final Color? backgroundColor;
  final bool showBackButton, showCartButton;
  final VoidCallback? onBackButtonPressed;
  final VoidCallback? onCartPressed;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  static OutlineInputBorder borderStyle = OutlineInputBorder(
    borderSide: BorderSide(color: AppColors.primary.shade300, width: 1.0),
    borderRadius: const BorderRadius.all(Radius.circular(8.0)),
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      height: preferredSize.height,
      decoration: BoxDecoration(
        color: backgroundColor,
        boxShadow: showElevation
            ? [
                BoxShadow(
                  color: AppColors.gray.shade100.withOpacity(0.4),
                  offset: const Offset(0, 6), // hide shadow top
                  blurRadius: 5,
                ),
                const BoxShadow(
                  color: Colors.white, // replace with color of container
                  offset: Offset(-6, 0), // hide shadow right
                ),
                const BoxShadow(
                  color: Colors.white, // replace with color of container
                  offset: Offset(6, 0), // hide shadow left
                ),
              ]
            : null,
      ),
      child: Row(children: [
        // ---------------- Back Button ----------------
        showBackButton
            ? Container(
                margin: REdgeInsets.symmetric(horizontal: 8),
                alignment: Alignment.centerLeft,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: RippleView(
                  onTap: onBackButtonPressed ?? () => Navigator.of(context).pop(),
                  isCircular: true,
                  padding: 8,
                  child: AppImageView(
                    Assets.iconsBack.path,
                    height: 16.h,
                    isImageCircular: true,
                  ),
                ),
              )
            : SizedBox(width: 16.w),

        // ---------------- Search Field ----------------
        Expanded(
          child: TextField(
            maxLines: 1,
            maxLength: 256,
            style: TextStyle(
              fontSize: 14.0,
              fontFamily: FontFamily.inter,
              fontWeight: FontWeight.w500,
              color: AppColors.gray.shade700,
            ),
            decoration: InputDecoration(
              counterText: '',
              isDense: true,
              hintText: 'Search...',
              border: borderStyle,
              contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
              fillColor: AppColors.white,
              filled: true,
              enabledBorder: borderStyle,
              focusedBorder: borderStyle,
              errorBorder: borderStyle,
              focusedErrorBorder: borderStyle,
            ),
          ),
        ),

        // ---------------- Cart Action ----------------
        showCartButton
            ? Container(
                alignment: Alignment.centerRight,
                padding: REdgeInsets.symmetric(horizontal: 12),
                child: RippleView(
                  onTap: onCartPressed ??
                      () {
                        // TODO: Navigate to cart screen
                      },
                  isCircular: true,
                  child: Stack(
                    children: <Widget>[
                      AppImageView(
                        Assets.iconsCart.path,
                        height: 24.h,
                      ),
                      if (cartItemCount > 0)
                        Positioned(
                          right: 0,
                          child: Container(
                            padding: const EdgeInsets.all(1),
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            constraints: const BoxConstraints(
                              minWidth: 12,
                              minHeight: 12,
                            ),
                            child: Text(
                              '$cartItemCount',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 8,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              )
            : SizedBox(width: 16.w),
      ]),
    );
  }
}
