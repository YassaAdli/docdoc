import 'package:Docdoc/feature/home/screens/book_appointment/widget/custom_payment_radio.dart';
import 'package:Docdoc/feature/home/screens/book_appointment/widget/custom_process_about.dart';
import 'package:Docdoc/feature/home/screens/doctordetails/widget/custom_app_bar.dart';
import 'package:flutter/material.dart';

class BookingPaymentBody extends StatelessWidget {
  const BookingPaymentBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomAppBar(title: 'Book Appointment'),
        const SizedBox(height: 32),
        const CustomProcessAbout(process: 2),
        const SizedBox(height: 40),
        const CustomPaymentRadio(),
      ],
    );
  }
}
