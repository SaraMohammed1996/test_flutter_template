/// Builds a full image URL from an API base URL and a relative storage path.
String? resolveProductImageUrl(String apiBaseUrl, String? imagePath) {
  if (imagePath == null || imagePath.isEmpty) {
    return null;
  }

  if (imagePath.startsWith('http://') || imagePath.startsWith('https://')) {
    return imagePath;
  }

  final String publicBase =
      apiBaseUrl.replaceFirst(RegExp(r'/api/v\d+/?$'), '');
  final String normalizedPath = imagePath.startsWith('/')
      ? imagePath
      : '/storage/$imagePath';

  return '$publicBase$normalizedPath';
}
