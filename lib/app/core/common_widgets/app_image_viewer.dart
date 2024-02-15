import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:path/path.dart' as Path;
import 'package:shimmer/shimmer.dart';

class AppImageViewer extends StatelessWidget {
  
  final String path;
  final double? imageSize;
  final BoxFit fit;
  final bool isNetworkImage, isImageCircular;
  final String errorImage;

  /// [path] is the path of the image. It can be a network image or a local image.
  /// [imageSize] is the size of the image. Default is 48.
  /// [fit] is the BoxFit of the image. Default is BoxFit.cover.
  /// [isImageCircular] is a boolean to check if the image is circular. Default is false.
  /// [errorImage] is the path of the image to be shown when the image is not supported. Default is 'assets/images/image_not_supported.png'.
  /// use [AppImageViewer.network] for network images and [AppImageViewer] for local images.
  const AppImageViewer(
    this.path, {
    super.key,
    this.imageSize = 48,
    this.fit = BoxFit.cover,
    this.isImageCircular = false,
    this.errorImage = 'assets/images/image_not_supported.png',
  }) : isNetworkImage = false;

  /// this constructor is used for network images.
  const AppImageViewer.network(
    this.path, {
    super.key,
    this.imageSize = 48,
    this.fit = BoxFit.cover,
    this.isImageCircular = false,
    this.errorImage = 'assets/images/image_not_supported.png',
  }) : isNetworkImage = true;

  @override
  Widget build(BuildContext context) {
    if (isNetworkImage) {
      return CachedNetworkImage(
        imageUrl: path,
        imageBuilder: (context, imageProvider) => Container(
          width: imageSize,
          height: imageSize,
          decoration: BoxDecoration(
            shape: isImageCircular ? BoxShape.circle : BoxShape.rectangle,
            image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
          ),
        ),
        progressIndicatorBuilder: (context, data, progress) {
          double value = 0.0;
          if (progress.totalSize != null) {
            var totalBytes = progress.totalSize!;
            var receivedBytes = progress.downloaded;
            value = receivedBytes / totalBytes;
          }
          return CircularProgressIndicator(value: value);
        },
        placeholder: (context, url) => Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Container(
            width: imageSize,
            height: imageSize,
            decoration: BoxDecoration(
              shape: isImageCircular ? BoxShape.circle : BoxShape.rectangle,
              color: Colors.white,
            ),
          ),
        ),
        errorWidget: (context, url, error) => Container(
          width: imageSize,
          height: imageSize,
          decoration: BoxDecoration(
            shape: isImageCircular ? BoxShape.circle : BoxShape.rectangle,
            image: DecorationImage(
              image: AssetImage(errorImage),
              fit: BoxFit.cover,
            ),
          ),
        ),
      );
    } else {
      String extension = Path.extension(path);

      switch (extension) {
        case '.svg':
          return SvgPicture.asset(
            path,
            width: imageSize,
            height: imageSize,
          );
        case '.jpg':
        case '.jpeg':
        case '.png':
        case '.gif':
        case '.bmp':
        case '.webp':
        case '.wbmp':
          return Image.asset(
            path,
            fit: fit,
            width: imageSize,
            height: imageSize,
          );
        default:
          throw FormatException('Unsupported image format: $extension');
      }
    }
  }
}
