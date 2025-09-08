import 'package:Docdoc/core/utils/color_manage.dart';
import 'package:Docdoc/feature/home/data/model/doctor/doctor.dart';
import 'package:Docdoc/feature/home/screens/homescreen/widget/custom_doctor_card.dart';
import 'package:flutter/material.dart';

class DoctorInformation extends StatelessWidget {
  const DoctorInformation({super.key, required this.datum});
  final Doctor datum;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Booking Information',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: ColorManager.black,
          ),
        ),
        const SizedBox(height: 24),
        CustomDoctorCard(isActive: false, doctor: datum),
      ],
    );
  }
}
