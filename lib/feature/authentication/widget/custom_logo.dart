import 'package:Docdoc/core/utils/color_manage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomLogo extends StatelessWidget {
  const CustomLogo({super.key, required this.image, this.width, this.height});
  final String image;
  final double? width, height;

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
        child: SvgPicture.asset(
          image,
          fit: BoxFit.contain,
          width: 24,
          height: 24,
        ),
      ),
    );
  }
}
