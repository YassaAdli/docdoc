import 'package:Docdoc/core/utils/add_router.dart';
import 'package:Docdoc/core/utils/color_manage.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomProfileAppBar extends StatelessWidget {
  const CustomProfileAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 12.0,
        right: 24,
        left: 24,
        bottom: 32,
      ),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(
              Icons.keyboard_arrow_left_rounded,
              color: ColorManager.white,
              size: 28,
            ),
            onPressed: () {},
          ),
          Expanded(
            child: Text(
              textAlign: TextAlign.center,
              'Profile',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: ColorManager.white,
              ),
            ),
          ),
          IconButton(
            icon: const Icon(
              Icons.settings_outlined,
              color: ColorManager.white,
              size: 24,
            ),
            onPressed: () {
              GoRouter.of(context).push(AppRouter.setting);
            },
          ),
        ],
      ),
    );
  }
}
