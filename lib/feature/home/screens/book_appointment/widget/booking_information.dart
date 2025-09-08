import 'package:Docdoc/core/utils/color_manage.dart';
import 'package:Docdoc/core/utils/image_data.dart';
import 'package:Docdoc/feature/home/screens/book_appointment/widget/booking_information_item.dart';
import 'package:flutter/material.dart';

class BookingInfirmation extends StatelessWidget {
  const BookingInfirmation({super.key, this.date, this.time, this.type});
  final String? date;
  final String? time;
  final int? type;

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
        BookingInformationItem(date: date, time: time),
        const Divider(),
        BookingInformationItem(
          title: 'Appointment Type',
          subTitle: type == 0
              ? 'In Person'
              : type == 1
              ? 'Video Call'
              : 'Phone Call',
          image: TImage.clipboard,
          backgroundColor: ColorManager.surfaceGreen,
          color: ColorManager.fillGreen,
        ),
        const Divider(),
      ],
    );
  }
}
