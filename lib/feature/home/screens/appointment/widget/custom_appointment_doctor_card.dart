import 'package:Docdoc/core/utils/color_manage.dart';
import 'package:Docdoc/feature/home/data/model/doctor/doctor.dart';
import 'package:Docdoc/feature/home/screens/homescreen/widget/custom_doctor_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomAppointmentDoctorCard extends StatelessWidget {
  const CustomAppointmentDoctorCard({super.key, required this.doctor, required this.dateTime});
  final Doctor doctor;
  final String dateTime;

  @override
  Widget build(BuildContext context) {
    return Container(
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
                Text(
                  overflow: TextOverflow.ellipsis,
                  doctor.specialization!.name!,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: ColorManager.textColor,
                  ),
                ),

                const SizedBox(height: 12),
                 Row(
                  children: [
                    const SizedBox(width: 1),
                    Text(
                      parseDate(dateTime),
                      style:const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: ColorManager.textColor,
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
                    Text(
                      parseTime(dateTime),
                      style: const TextStyle(
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
    );
  }
  String parseDate(String dateString) {
    DateTime dateTime = DateFormat("EEEE, MMMM d, yyyy h:mm a").parse(dateString);
    String formattedDate = DateFormat("EEE, d MMM").format(dateTime);
    return formattedDate ;

  }
  String parseTime(String dateString) {
    DateTime dateTime = DateFormat("EEEE, MMMM d, yyyy h:mm a").parse(dateString);
    String formattedTime = DateFormat("hh.mm a").format(dateTime);
    return formattedTime ;

  }
}
