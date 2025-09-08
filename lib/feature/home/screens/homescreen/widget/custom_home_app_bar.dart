import 'package:Docdoc/core/utils/color_manage.dart';
import 'package:Docdoc/core/utils/service_locator.dart';
import 'package:Docdoc/core/utils/shared_pref_service.dart';
import 'package:flutter/material.dart';

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final sharedPref = getIt<SharedPrefService>();
    String? username = sharedPref.getValue<String>("username");

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hi, $username!',
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w700,
                fontSize: 18,
              ),
            ),
            const Text(
              'How Are you today?',
              style: TextStyle(
                color: ColorManager.textColor,
                fontWeight: FontWeight.w400,
                fontSize: 11,
              ),
            ),
          ],
        ),

        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: ColorManager.logoColor,
          ),
          child: const Icon(Icons.notifications_none_outlined),
        ),
      ],
    );
  }
}
