import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

Widget cachedNetworkImage(
    {double? height,
    double? width,
    String? cuisineImageUrl,
    String? placeholder,
    Color? color,
    BoxFit? errorFit,
    BoxFit? imageFit}) {
  return CachedNetworkImage(
    height: height ?? 0,
    width: width ?? 0,
    fadeInDuration: const Duration(seconds: 1),
    placeholderFadeInDuration: const Duration(milliseconds: 400),
    fadeInCurve: Curves.easeIn,
    imageUrl: cuisineImageUrl!,
    color: color,
    placeholder: (context, str) {
      return Image.asset(
        placeholder ?? 'assets/images/wizmo.jpg',
        fit: errorFit ?? BoxFit.contain,
      );
    },
    fit: imageFit ?? BoxFit.contain,
    errorWidget: (context, url, error) => Image.asset(
      placeholder ?? 'assets/images/wizmo.jpg',
      fit: errorFit ?? BoxFit.contain,
    ),
  );
}
