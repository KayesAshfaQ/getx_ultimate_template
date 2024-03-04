import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'app_colors.dart';

/// Custom loader configuration for the app using [EasyLoading]
getCustomLoaderInstance() => EasyLoading.instance
  ..displayDuration = const Duration(milliseconds: 2000)
  ..indicatorType = EasyLoadingIndicatorType.ring
  ..loadingStyle = EasyLoadingStyle.custom
  ..maskType = EasyLoadingMaskType.custom
  ..indicatorSize = 40.0
  ..radius = 8.0
  ..progressColor = Colors.white
  ..backgroundColor = AppColors.primary
  ..indicatorColor = Colors.white
  ..textColor = Colors.white
  ..maskColor = Colors.black.withOpacity(0.25)
  ..userInteractions = false
  ..dismissOnTap = true
  ..toastPosition = EasyLoadingToastPosition.bottom
  ..customAnimation = CustomAnimation()
  ..successWidget = const Icon(
    Icons.check,
    color: Colors.white,
    size: 40,
  )

  // circle cross icon
  ..errorWidget = const Icon(
    Icons.error,
    color: Colors.white,
    size: 40,
  )
  ..infoWidget = Container(
    color: Colors.white,
    child: const Icon(
      Icons.info,
      color: Colors.orange,
      size: 40,
    ),
  );

class CustomAnimation extends EasyLoadingAnimation {
  CustomAnimation();

  @override
  Widget buildWidget(
    Widget child,
    AnimationController controller,
    AlignmentGeometry alignment,
  ) {
    return Opacity(
      opacity: controller.value,
      child: RotationTransition(
        turns: controller,
        child: child,
      ),
    );
  }
}
