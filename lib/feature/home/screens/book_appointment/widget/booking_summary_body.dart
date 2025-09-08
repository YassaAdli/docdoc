import 'package:Docdoc/feature/home/data/model/doctor/doctor.dart';
import 'package:Docdoc/feature/home/screens/book_appointment/widget/booking_information.dart';
import 'package:Docdoc/feature/home/screens/book_appointment/widget/custom_process_about.dart';
import 'package:Docdoc/feature/home/screens/book_appointment/widget/doctor_information.dart';
import 'package:Docdoc/feature/home/screens/book_appointment/widget/payment_information.dart';
import 'package:Docdoc/feature/home/screens/doctordetails/widget/custom_app_bar.dart';
import 'package:flutter/material.dart';

class BookingSummaryBody extends StatelessWidget {
  const BookingSummaryBody({
    super.key,
    this.title,
    this.date,
    this.type,
    this.time,
    this.doctor,
  });
  final String? title;
  final DateTime? date;
  final String? time;
  final int? type;
  final Doctor? doctor;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomAppBar(title: 'Book Appointment'),
        const SizedBox(height: 32),
        const CustomProcessAbout(process: 3),
        const SizedBox(height: 40),
        BookingInfirmation(date: date.toString(), time: time, type: type),
        const SizedBox(height: 32),
        DoctorInformation(datum: doctor!),
        const SizedBox(height: 32),
        PaymentInformation(title: title),
      ],
    );
  }
}
