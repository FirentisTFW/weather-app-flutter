import 'package:app/extensions/string_extensions.dart';
import 'package:app/universal_widgets/image_placeholder.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class AppCachedNetworkImage extends StatelessWidget {
  final double? height;
  final String? imageUrl;
  final double? width;

  const AppCachedNetworkImage({
    this.height,
    required this.imageUrl,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    if (imageUrl.isNullOrBlank) {
      return const ImagePlaceholder();
    }
    return CachedNetworkImage(
      height: height,
      imageUrl: imageUrl!,
      width: width,
    );
  }
}
