import 'package:Docdoc/core/utils/color_manage.dart';
import 'package:Docdoc/feature/home/logic/booking/booking_cubit.dart';
import 'package:Docdoc/feature/home/logic/booking/booking_state.dart';
import 'package:Docdoc/feature/home/screens/book_appointment/widget/appointment_type_selector.dart';
import 'package:Docdoc/feature/home/screens/book_appointment/widget/available_time.dart';
import 'package:Docdoc/feature/home/screens/book_appointment/widget/custom_process_about.dart';
import 'package:Docdoc/feature/home/screens/book_appointment/widget/date_picker_header.dart';
import 'package:Docdoc/feature/home/screens/doctordetails/widget/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookAppointmentViewBody extends StatelessWidget {
  const BookAppointmentViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomAppBar(title: 'Book Appointment'),
        const SizedBox(height: 32),
        CustomProcessAbout(),
        const SizedBox(height: 40),
        BlocBuilder<AppointmentCubit, AppointmentState>(
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DatePickerHeader(
                  selectedDate: state.selectedDate,
                  onChanged: (date) =>
                      context.read<AppointmentCubit>().selectDate(date),
                ),
                const SizedBox(height: 24),

                const Text(
                  'Available time',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: ColorManager.text100,
                  ),
                ),
                const SizedBox(height: 24),

                AvailableTime(
                  selectedTime: state.selectedTime,
                  onChanged: (time) =>
                      context.read<AppointmentCubit>().selectTime(time),
                ),

                const SizedBox(height: 24),

                AppointmentTypeSelector(
                  selectedIndex: state.selectedTypeIndex,
                  onChanged: (index) =>
                      context.read<AppointmentCubit>().selectType(index),
                ),
              ],
            );
          },
        ),

        const SizedBox(height: 24),
      ],
    );
  }
}
