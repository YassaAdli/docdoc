import 'package:Docdoc/core/utils/color_manage.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, this.title});
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: ColorManager.textColor, width: 1),
          ),
          child: Center(
            child: GestureDetector(
              onTap: () {
                GoRouter.of(context).pop();
              },
              child: const Icon(
                Icons.keyboard_arrow_left_rounded,
                color: Colors.black,
                size: 28,
              ),
            ),
          ),
        ),
        Expanded(
          child: Text(
            textAlign: TextAlign.center,
            title ?? '',
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
        ),
      ],
    );
  }
}
