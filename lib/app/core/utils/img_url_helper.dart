import 'package:getx_ultimate_template/app/core/values/api_end_points.dart';

enum ImageSize { small, medium, large, original }

enum ImageType { product }

extension ImageSizeExtension on ImageSize {
  String get value {
    switch (this) {
      case ImageSize.small:
        return '80';
      case ImageSize.medium:
        return '200';
      case ImageSize.large:
        return '512x512';
      case ImageSize.original:
        return 'original';
      default:
        return 'original';
    }
  }
}

// get base image url
String getImageURL({
  ImageSize size = ImageSize.large,
  ImageType type = ImageType.product,
  required String? path,
}) {
  if (path == null || path.isEmpty) {
    return '';
  } else {
    return "${ApiEndPoints.baseImageURL}/${type.toString().split('.').last}/${size.value}/$path";
  }
}
