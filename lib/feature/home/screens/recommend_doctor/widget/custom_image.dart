import 'package:Docdoc/core/utils/color_manage.dart';
import 'package:flutter/material.dart';

class CustomImage extends StatelessWidget {
  const CustomImage({
    super.key,
    required this.image,
    this.width,
    this.height,
    this.imageSize,
  });
  final String image;
  final double? width, height, imageSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 46,
      height: height ?? 46,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: ColorManager.logoColor,
      ),
      child: Center(
        child: Image.asset(
          image,
          fit: BoxFit.contain,
          width: imageSize ?? 24,
          height: imageSize ?? 24,
        ),
      ),
    );
  }
}
