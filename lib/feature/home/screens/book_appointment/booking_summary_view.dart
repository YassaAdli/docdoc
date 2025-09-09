import 'package:Docdoc/core/utils/service_locator.dart';
import 'package:Docdoc/feature/home/data/model/booking_arguments.dart';
import 'package:Docdoc/feature/home/logic/appointment/appointment_cubit.dart';
import 'package:Docdoc/feature/home/logic/booking_doctor/booking_doctor_cubit.dart';
import 'package:Docdoc/feature/home/screens/book_appointment/widget/booking_summary_body.dart';
import 'package:Docdoc/feature/home/screens/book_appointment/widget/custom_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class BookingSummaryView extends StatelessWidget {
  const BookingSummaryView({super.key});

  @override
  Widget build(BuildContext context) {
    final args = GoRouterState.of(context).extra as BookingArguments;
    final doctor = args.doctor;
    final cubit = args.cubit;
    final state = cubit.state;

    return BlocProvider.value(
      value: cubit,
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
            child: SingleChildScrollView(
              child: BookingSummaryBody(
                doctor: doctor,
                title: state.paymentMethod,
                date: state.selectedDate,
                time: state.selectedTime,
                type: state.selectedTypeIndex,
              ),
            ),
          ),
        ),
        bottomNavigationBar: MultiBlocProvider(
          providers: [
            BlocProvider(create: (BuildContext context) => getIt<BookingDoctorCubit>(),),
            BlocProvider(create: (BuildContext context) => getIt<AppointmentCubit>(),),
          ],

          child: CustomBottomNavigationBar(
            args: args,
            doctor: doctor,
            title: state.paymentMethod,
            date: state.selectedDate,
            time: state.selectedTime,
            type: state.selectedTypeIndex,
          ),
        ),
      ),
    );
  }
}
