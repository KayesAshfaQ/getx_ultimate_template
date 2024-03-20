import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:shimmer/shimmer.dart';

class AppImageView extends StatelessWidget {
  /// `AppImageViewer` is a stateless widget that displays an image from a given path.
  ///
  /// The image can be displayed in a circular or rectangular shape based on the `isImageCircular` flag.
  /// The image's height and width can be adjusted using the `height` and `width` parameters.
  /// If the width is not provided, it defaults to the value of height.
  ///
  /// The `fit` parameter determines how the image should be inscribed into the box.
  /// The `color` parameter can be used to provide a color filter to the image.
  ///
  /// In case of an error in loading the image, an error image is displayed which is specified by the `errorImage` parameter.
  ///
  /// Parameters:
  /// * `path`: The path of the image to be displayed.
  /// * `height`: The height of the image. Defaults to 48.
  /// * `width`: The width of the image. If not provided, defaults to the value of height.
  /// * `color`: The color filter to apply to the image. Defaults to `AppColors.gray`.
  /// * `fit`: How the image should be inscribed into the box. Defaults to `BoxFit.cover`.
  /// * `isImageCircular`: Whether the image should be displayed in a circular shape. Defaults to `false`.
  /// * `errorImage`: The image to display in case of an error. Defaults to 'assets/images/image_not_supported.png'.
  ///
  /// Example of using `AppImageViewer`:
  ///
  /// ```dart
  /// AppImageViewer(
  ///   'assets/images/example.png',
  ///   height: 100,
  ///   width: 100,
  ///   color: Colors.red,
  ///   fit: BoxFit.fill,
  ///   isImageCircular: true,
  ///   errorImage: 'assets/images/error.png',
  /// )
  /// ```
  const AppImageView(
    this.path, {
    super.key,
    this.height = 48,
    this.width,
    this.color,
    this.fit = BoxFit.cover,
    this.isImageCircular = false,
    this.errorImage = 'assets/images/image_not_supported.png',
  });

  final String path;
  final double? height, width;
  final Color? color;
  final BoxFit fit;
  final bool isImageCircular;
  final String errorImage;

  Widget _imageWidget(ImageProvider<Object> imageProvider) {
    return Container(
      height: height,
      width: width ?? height,
      decoration: BoxDecoration(
        shape: isImageCircular ? BoxShape.circle : BoxShape.rectangle,
        image: DecorationImage(
          image: imageProvider,
          fit: fit,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (path.isEmpty) {
      return _imageWidget(AssetImage(errorImage));
    } else if (path.startsWith('http') || path.startsWith('https')) {
      return CachedNetworkImage(
        imageUrl: path,
        imageBuilder: (context, imageProvider) => _imageWidget(
          imageProvider,
        ),
        // progressIndicatorBuilder: (context, data, progress) {
        //   double value = 0.0;
        //   if (progress.totalSize != null) {
        //     var totalBytes = progress.totalSize!;
        //     var receivedBytes = progress.downloaded;
        //     value = receivedBytes / totalBytes;
        //   }
        //   return CircularProgressIndicator(value: value);
        // },
        placeholder: (context, url) => Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Container(
            width: width ?? height,
            height: height,
            decoration: BoxDecoration(
              shape: isImageCircular ? BoxShape.circle : BoxShape.rectangle,
              color: Colors.white,
            ),
          ),
        ),
        errorWidget: (context, url, error) => _imageWidget(
          AssetImage(errorImage),
        ),
      );
    } else if (path.endsWith('.svg')) {
      return SvgPicture.asset(
        path,
        width: width ?? height,
        height: height,
        colorFilter: color != null ? ColorFilter.mode(color!, BlendMode.srcIn) : null,
      );
    } else if (path.startsWith('file://')) {
      return _imageWidget(FileImage(File(path)));
    } else if (path.endsWith('.jpg') || path.endsWith('.jpeg') || path.endsWith('.png') || path.endsWith('.gif') || path.endsWith('.bmp') || path.endsWith('.webp') || path.endsWith('.wbmp')) {
      return _imageWidget(AssetImage(path));
    } else {
      throw FormatException('Unsupported image format: $path');
    }
  }
}
