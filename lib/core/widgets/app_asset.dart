import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppAsset extends StatelessWidget {
  final String? path;
  final IconData? icon;
  final double? size;
  final Color? color;
  final BoxFit fit;

  const AppAsset.icon(
    this.icon, {
    super.key,
    this.size = 24,
    this.color,
  })  : path = null,
        fit = BoxFit.contain;

  const AppAsset.image(
    this.path, {
    super.key,
    this.size,
    this.color,
    this.fit = BoxFit.cover,
  }) : icon = null;

  @override
  Widget build(BuildContext context) {
    final effectiveSize = size ?? 24;

    if (icon != null) {
      return Icon(
        icon,
        size: effectiveSize,
        color: color ?? Theme.of(context).iconTheme.color,
      );
    }

    if (path == null) return const SizedBox.shrink();

    if (path!.endsWith('.svg')) {
      return SvgPicture.asset(
        path!,
        width: effectiveSize,
        height: effectiveSize,
        colorFilter: color != null
            ? ColorFilter.mode(color!, BlendMode.srcIn)
            : null,
        fit: BoxFit.contain,
      );
    }

    return Image.asset(
      path!,
      width: effectiveSize,
      height: effectiveSize,
      fit: fit,
      errorBuilder: (_, __, ___) => Icon(Icons.broken_image, size: effectiveSize),
    );
  }
}