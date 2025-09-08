import 'package:Docdoc/core/utils/color_manage.dart';
import 'package:Docdoc/feature/home/data/model/doctor/doctor.dart';
import 'package:Docdoc/feature/home/screens/homescreen/widget/custom_doctor_card.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomCompletedCard extends StatelessWidget {
  const CustomCompletedCard({
    super.key,
    required this.doctor,
    required this.dateTime, this.isCancelled = false,
  });
  final Doctor doctor;
  final String dateTime;
  final bool isCancelled;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: ColorManager.white,
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        isCancelled ?'Appointment cancelled' :'Appointment done',
                        style: TextStyle(
                          fontSize: 12,
                          color: isCancelled ? ColorManager.fillRed : ColorManager.fillGreen,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Row(
                        children: [
                          const SizedBox(width: 1),
                          Text(
                            parseDate(dateTime),
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: ColorManager.text80,
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                            child: VerticalDivider(
                              color: ColorManager.text80,
                              thickness: 1,
                              width: 10,
                            ),
                          ),
                          Text(
                            parseTime(dateTime),
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: ColorManager.text80,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 16),
                Icon(Icons.more_vert_rounded, color: ColorManager.text60),
              ],
            ),
            const SizedBox(height: 12),
            Divider(color: ColorManager.text10),
            const SizedBox(height: 14),
            SizedBox(
              height: 80,
              child: CustomDoctorCard(doctor: doctor, isActive: false),
            ),
          ],
        ),
      ),
    );
  }

  String parseDate(String dateString) {
    DateTime dateTime = DateFormat(
      "EEEE, MMMM d, yyyy h:mm a",
    ).parse(dateString);
    String formattedDate = DateFormat("EEE, d MMM").format(dateTime);
    return formattedDate;
  }

  String parseTime(String dateString) {
    DateTime dateTime = DateFormat(
      "EEEE, MMMM d, yyyy h:mm a",
    ).parse(dateString);
    String formattedTime = DateFormat("hh.mm a").format(dateTime);
    return formattedTime;
  }
}
