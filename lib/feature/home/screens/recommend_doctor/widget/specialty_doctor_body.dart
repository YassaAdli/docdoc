import 'package:Docdoc/core/utils/add_router.dart';
import 'package:Docdoc/core/utils/color_manage.dart';
import 'package:Docdoc/core/utils/image_data.dart';
import 'package:Docdoc/feature/home/screens/doctordetails/widget/custom_app_bar.dart';
import 'package:Docdoc/feature/home/screens/recommend_doctor/widget/custom_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SpecialtyDoctorBody extends StatelessWidget {
  const SpecialtyDoctorBody({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> specializations = [
      {"id": 11, "name": "General", "image": TImage.general},
      {"id": 4, "name": "ENT", "image": TImage.ent},
      {"id": 5, "name": "Pediatric", "image": TImage.pediatric},
      {"id": 8, "name": "Urologist", "image": TImage.urologist},
      {"id": 2, "name": "Dentistry", "image": TImage.dentistry},
      {"id": 9, "name": "Intestine", "image": TImage.intestine},
      {"id": 6, "name": "Histologist", "image": TImage.histologist},
      {"id": 10, "name": "Hepatology", "image": TImage.hepatology},
      {"id": 1, "name": "Cardiologist", "image": TImage.cardiologist},
      {"id": 3, "name": "Neurologic", "image": TImage.neurologic},
      {"id": 1, "name": "Pulmonary", "image": TImage.pulmonary},
      {"id": 7, "name": "Optometry", "image": TImage.optometry},
    ];
    return Column(
      children: [
        const CustomAppBar(title: 'Specialty Doctor'),
        const SizedBox(height: 32),
        Expanded(
          child: GridView.builder(
            itemCount: 12,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 80 / 117,
            ),
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  GoRouter.of(context).push(
                    AppRouter.recommendationDoctor,
                    extra: specializations[index]['id'],
                  );
                },
                child: Column(
                  children: [
                    CustomImage(
                      image: specializations[index]['image'],
                      width: 80,
                      height: 80,
                      imageSize: 40,
                    ),
                    SizedBox(height: 8),
                    Text(
                      specializations[index]['name'],
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: ColorManager.text100,
                      ),
                    ),
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
