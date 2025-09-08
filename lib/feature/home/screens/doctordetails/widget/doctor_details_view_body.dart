import 'package:Docdoc/core/utils/add_router.dart';
import 'package:Docdoc/core/utils/color_manage.dart';
import 'package:Docdoc/core/utils/image_data.dart';
import 'package:Docdoc/core/widget/custom_button.dart';
import 'package:Docdoc/feature/home/data/model/doctor/doctor.dart';
import 'package:Docdoc/feature/home/screens/doctordetails/widget/custom_app_bar.dart';
import 'package:Docdoc/feature/home/screens/doctordetails/widget/custom_doctor_details_tab_bar.dart';
import 'package:Docdoc/feature/home/screens/homescreen/widget/custom_doctor_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class DoctorDetailsViewBody extends StatelessWidget {
  const DoctorDetailsViewBody({super.key, required this.doctor});
  final Doctor doctor;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12),
        child: Column(
          children: [
            CustomAppBar(title: doctor.name),
            const SizedBox(height: 32),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: SizedBox(
                    height: 79,
                    child: CustomDoctorCard(isActive: false, doctor: doctor),
                  ),
                ),
                SizedBox(width: 8),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: SvgPicture.asset(
                    TImage.message,
                    color: ColorManager.primaryColor,
                    width: 24,
                    height: 24,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            CustomDoctorDetailsTabBar(doctor: doctor),
            const SizedBox(height: 16),
            CustomButton(
              text: 'Make An Appointment',
              onPressed: () {
                GoRouter.of(
                  context,
                ).push(AppRouter.bookAppointment, extra: doctor);
              },
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
