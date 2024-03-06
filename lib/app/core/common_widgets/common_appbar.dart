import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../gen/assets.gen.dart';
import '../../gen/fonts.gen.dart';
import '../config/app_colors.dart';
import 'app_image_view.dart';
import 'ripple_view.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  final int cartItemCount;
  final bool showElevation;
  final Color? backgroundColor;
  final bool showBackButton;
  final VoidCallback? onBackButtonPressed;
  final VoidCallback? onCartPressed;

  const CommonAppBar({
    super.key,
    this.cartItemCount = 0,
    this.showElevation = true,
    this.showBackButton = true,
    this.backgroundColor = AppColors.white,
    this.onBackButtonPressed,
    this.onCartPressed,
  });

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
              enabledBorder: borderStyle,
              focusedBorder: borderStyle,
              errorBorder: borderStyle,
              focusedErrorBorder: borderStyle,
            ),
          ),
        ),

        // ---------------- Cart Action ----------------
        Container(
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
        ),
      ]),
    );
  }
}
