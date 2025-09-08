import 'package:Docdoc/core/utils/color_manage.dart';
import 'package:flutter/material.dart';

class CustomRecentSearch extends StatelessWidget {
  const CustomRecentSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Recent Search',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: ColorManager.blackColor,
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: const Text(
                'Recent Search',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: ColorManager.primaryColor,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 120,
          child: ListView.builder(
            padding: const EdgeInsets.all(0),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 4,
            itemBuilder: (context, index) {
              return const Padding(
                padding: EdgeInsets.only(right: 8.0, left: 8.0, bottom: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.watch_later_outlined,
                      color: ColorManager.text60,
                      size: 20,
                    ),
                    SizedBox(width: 8),
                    Text(
                      'General Medical Check ',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: ColorManager.text60,
                      ),
                    ),
                    Spacer(),
                    Icon(Icons.close, color: ColorManager.text60, size: 20),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
