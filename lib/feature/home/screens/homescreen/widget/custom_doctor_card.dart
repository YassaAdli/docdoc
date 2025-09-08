import 'package:Docdoc/core/utils/add_router.dart';
import 'package:Docdoc/core/utils/color_manage.dart';
import 'package:Docdoc/feature/home/data/model/doctor/doctor.dart';
import 'package:Docdoc/feature/home/screens/homescreen/widget/custom_doctor_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomDoctorCard extends StatelessWidget {
  const CustomDoctorCard({
    super.key,
    this.isActive = true,
    required this.doctor,
  });
  final bool isActive;
  final Doctor doctor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isActive
          ? () {
              GoRouter.of(context).push(AppRouter.doctorDetail, extra: doctor);
            }
          : () {},
      child: Container(
        width: double.infinity,
        height: 130,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.white,
        ),
        child: Row(
          children: [
            CustomDoctorImage(imageUrl: doctor.photo!),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    doctor.name!,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: ColorManager.blackColor,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Flexible(
                        child: Text(
                          overflow: TextOverflow.ellipsis,
                          doctor.specialization!.name!,
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: ColorManager.textColor,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                        child: VerticalDivider(
                          color: ColorManager.textColor,
                          thickness: 1,
                          width: 10,
                        ),
                      ),
                      Flexible(
                        child: Text(
                          doctor.city!.name!,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: ColorManager.textColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  const Row(
                    children: [
                      Icon(Icons.star, color: Colors.amber, size: 16),
                      SizedBox(width: 1),
                      Text(
                        '4.5',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: ColorManager.textColor,
                        ),
                      ),
                      SizedBox(width: 4),
                      Text(
                        '(4,279 reviews)',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: ColorManager.textColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
