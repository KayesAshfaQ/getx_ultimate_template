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

// Server address
const String baseURL = "http://192.168.145.167:8060/api/v1/";
const String baseImageURL = "http://sl-dev-s3.s3.amazonaws.com";
