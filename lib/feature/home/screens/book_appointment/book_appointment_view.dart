import 'package:Docdoc/core/utils/add_router.dart';
import 'package:Docdoc/core/widget/custom_button.dart';
import 'package:Docdoc/feature/home/data/model/booking_arguments.dart';
import 'package:Docdoc/feature/home/data/model/doctor/doctor.dart';
import 'package:Docdoc/feature/home/logic/booking/booking_cubit.dart';
import 'package:Docdoc/feature/home/logic/booking/booking_state.dart';
import 'package:Docdoc/feature/home/screens/book_appointment/widget/book_appointment_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class BookAppointmentView extends StatelessWidget {
  const BookAppointmentView({super.key, required this.doctor});
  final Doctor doctor;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppointmentCubit(),
      child: Scaffold(
        body: const SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
            child: SingleChildScrollView(child: BookAppointmentViewBody()),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24),
          child: BlocBuilder<AppointmentCubit, AppointmentState>(
            builder: (context, state) {
              return CustomButton(
                text: 'Continue',
                onPressed: () {
                  final cubit = context.read<AppointmentCubit>();
                  cubit.confirmAppointment();
                  if (state.selectedTime == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Please select a time')),
                    );
                  } else {
                    GoRouter.of(context).push(
                      AppRouter.bookingPayment,
                      extra: BookingArguments(
                        doctor: doctor,
                        cubit: context.read<AppointmentCubit>(),
                      ),
                    );
                  }
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
