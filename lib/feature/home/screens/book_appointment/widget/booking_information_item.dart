import 'package:Docdoc/core/utils/color_manage.dart';
import 'package:Docdoc/core/utils/image_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

class BookingInformationItem extends StatelessWidget {
  const BookingInformationItem({
    super.key,
    this.title,
    this.subTitle,
    this.image,
    this.color,
    this.backgroundColor,
    this.date,
    this.time,
  });
  final String? title;
  final String? subTitle;
  final String? image;
  final Color? color;
  final Color? backgroundColor;
  final String? date;
  final String? time;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: backgroundColor ?? ColorManager.surfaceBlue,
          ),
          child: Center(
            child: SvgPicture.asset(
              image ?? TImage.calendar,
              color: color ?? ColorManager.primaryColor,
              width: 24,
              height: 24,
            ),
          ),
        ),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title ?? 'Date & Time',
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 14,
                color: ColorManager.blackColor,
              ),
            ),
            Text(
              maxLines: 2,
              subTitle ??
                  formatAppointmentDate(
                    date ?? '2025-08-29 21:40:40.425661',
                    time ?? '21:40',
                  ),
              style: const TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 12,
                color: ColorManager.body,
              ),
            ),
          ],
        ),
      ],
    );
  }

  String formatAppointmentDate(String dateString, String timeString) {
    final DateTime date = DateTime.parse(dateString);

    final String datePart = DateFormat('EEEE, dd MMMM yyyy').format(date);

    return "$datePart\n$timeString";
  }
}
