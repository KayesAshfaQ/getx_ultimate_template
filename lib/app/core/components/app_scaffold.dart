import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../config/app_colors.dart';

class AppScaffold extends StatelessWidget {
  /// A custom scaffold widget for the application.
  ///
  /// The [AppScaffold] widget is a custom scaffold widget that provides a consistent layout for the application.
  /// It extends the [StatelessWidget] class and takes several parameters to customize its appearance and behavior.
  ///
  /// Parameters:
  /// - `key`: The widget key.
  /// - `scaffoldKey`: The key assigned to the scaffold.
  /// - `appBar`: The app bar to display at the top of the scaffold.
  /// - `body`: The primary content of the scaffold.
  /// - `floatingActionButton`: The floating action button displayed at the bottom of the scaffold.
  /// - `drawer`: The drawer displayed at the side of the scaffold.
  /// - `endDrawer`: The end drawer displayed at the opposite side of the scaffold.
  /// - `bodyPadding`: The padding for the body content.
  /// - `resizeToAvoidBottomInset`: Whether the body should resize when the keyboard appears.
  /// - `useSafeArea`: Whether to use safe area. Default value is true.
  /// - `backgroundColor`: The background color of the scaffold. If no background color is given or `null`, then the background will be gradient.
  /// - `extendBodyBehindAppBar`: Whether the body content should extend behind the app bar.
  /// - `bottomNavigationBar`: The bottom navigation bar displayed at the bottom of the scaffold.
  /// - `bottomSheet`: The bottom sheet displayed at the bottom of the scaffold.
  /// - `floatingActionButtonLocation`: The location of the floating action button.
  /// - `extendBody`: Whether the body content should extend into the areas covered by the system UI.
  /// - `statusBarBrightness`: The brightness of the status bar.
  /// - `navigationBarBrightness`: The brightness of the navigation bar.
  ///
  /// Example usage:
  /// ```dart
  /// AppScaffold(
  ///   appBar: AppBar(title: Text('Title')),
  ///   body: Center(child: Text('Hello World')),
  ///   floatingActionButton: FloatingActionButton(onPressed: () {}),
  /// );
  /// ```
  const AppScaffold({
    super.key,
    this.scaffoldKey,
    this.appBar,
    this.body,
    this.floatingActionButton,
    this.drawer,
    this.endDrawer,
    this.bodyPadding,
    this.resizeToAvoidBottomInset,
    this.useSafeArea = true,
    this.backgroundColor,
    this.extendBodyBehindAppBar = false,
    this.bottomNavigationBar,
    this.bottomSheet,
    this.floatingActionButtonLocation,
    this.extendBody,
    this.statusBarColor = AppColors.white,
    this.statusBarBrightness = Brightness.dark,
    this.navigationBarBrightness = Brightness.dark,
  });

  final PreferredSizeWidget? appBar;
  final Widget? body;
  final Widget? floatingActionButton;
  final Widget? drawer;
  final Widget? endDrawer;
  final EdgeInsets? bodyPadding;
  final bool? resizeToAvoidBottomInset;
  final bool useSafeArea;
  final Key? scaffoldKey;
  final Color? backgroundColor;
  final bool extendBodyBehindAppBar;
  final Widget? bottomNavigationBar;
  final Widget? bottomSheet;
  final bool? extendBody;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final Color statusBarColor;
  final Brightness statusBarBrightness;
  final Brightness navigationBarBrightness;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: AnnotatedRegion(
        value: SystemUiOverlayStyle(
          statusBarColor: statusBarColor,
          // For Android.
          // Use [light] for white status bar and [dark] for black status bar.
          statusBarIconBrightness: statusBarBrightness,
          // For iOS.
          // Use [dark] for white status bar and [light] for black status bar.
          statusBarBrightness: statusBarBrightness,
          systemNavigationBarColor: Colors.transparent,
          systemNavigationBarIconBrightness: navigationBarBrightness,
          systemNavigationBarContrastEnforced: false,
        ),
        child: SafeArea(
          top: useSafeArea,
          bottom: useSafeArea,
          child: Scaffold(
            key: scaffoldKey,
            extendBody: extendBody ?? false,
            backgroundColor: backgroundColor,
            extendBodyBehindAppBar: extendBodyBehindAppBar,
            resizeToAvoidBottomInset: resizeToAvoidBottomInset,
            appBar: appBar,
            endDrawer: endDrawer,
            bottomNavigationBar: bottomNavigationBar,
            bottomSheet: bottomSheet,
            floatingActionButtonLocation: floatingActionButtonLocation,
            body: body,
            floatingActionButton: floatingActionButton,
            drawer: drawer,
          ),
        ),
      ),
    );
  }
}
