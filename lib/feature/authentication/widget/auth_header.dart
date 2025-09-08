import 'package:Docdoc/core/utils/color_manage.dart';
import 'package:flutter/material.dart';

class AuthHeader extends StatelessWidget {
  const AuthHeader({super.key, this.title, this.subTitle});
  final String? title;
  final String? subTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title ?? 'Welcome Back',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: ColorManager.primaryColor,
          ),
          textAlign: TextAlign.start,
        ),
        Text(
          subTitle ??
              'We\'re excited to have you back, can\'t wait to see what you\'ve been up to since you last logged in.',
          style: const TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 14,
            color: ColorManager.textColor,
          ),
          textAlign: TextAlign.start,
        ),
      ],
    );
  }
}
