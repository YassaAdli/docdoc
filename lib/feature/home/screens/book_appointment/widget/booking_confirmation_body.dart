import 'package:Docdoc/feature/home/data/model/booking_arguments.dart';
import 'package:Docdoc/feature/home/screens/book_appointment/widget/booking_confirmed.dart';
import 'package:Docdoc/feature/home/screens/book_appointment/widget/booking_information.dart';
import 'package:Docdoc/feature/home/screens/book_appointment/widget/doctor_information.dart';
import 'package:Docdoc/feature/home/screens/doctordetails/widget/custom_app_bar.dart';
import 'package:flutter/material.dart';

class BookingConfirmationBody extends StatelessWidget {
  const BookingConfirmationBody({super.key, required this.args});
  final BookingArguments args;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomAppBar(title: 'Details'),
        const BookingConfirmed(),
        BookingInfirmation(
          date: args.cubit.state.selectedDate.toString(),
          time: args.cubit.state.selectedTime,
          type: args.cubit.state.selectedTypeIndex,
        ),
        const SizedBox(height: 24),
        DoctorInformation(datum: args.doctor),
      ],
    );
  }
}
