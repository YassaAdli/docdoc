import 'package:Docdoc/core/utils/color_manage.dart';
import 'package:flutter/material.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    super.key,
    required this.title,
    this.onTap,
    required this.subtitle,
  });
  final String title, subtitle;

  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: ColorManager.blackColor,
          ),
        ),
        GestureDetector(
          onTap: onTap,
          child: Text(
            subtitle,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: ColorManager.primaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
