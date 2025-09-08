import 'package:Docdoc/core/utils/add_router.dart';
import 'package:Docdoc/core/utils/color_manage.dart';
import 'package:Docdoc/core/utils/image_data.dart';
import 'package:Docdoc/feature/home/screens/recommend_doctor/widget/custom_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DoctorSpeciality extends StatelessWidget {
  const DoctorSpeciality({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> specializations = [
      {"id": 11, "name": "General", "image": TImage.general},
      {"id": 3, "name": "Neurologic", "image": TImage.neurologic},
      {"id": 5, "name": "Pediatric", "image": TImage.pediatric},
      {"id": 8, "name": "Urologist", "image": TImage.urologist},
    ];

    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: specializations.length,
        itemBuilder: (context, index) {
          final item = specializations[index];
          return GestureDetector(
            onTap: () {
              GoRouter.of(context).push(
                AppRouter.recommendationDoctor,
                extra: specializations[index]['id'],
              );
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                children: [
                  CustomImage(image: item["image"], width: 58, height: 58),
                  const SizedBox(height: 12),
                  Text(
                    item["name"],
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: ColorManager.blackColor,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
