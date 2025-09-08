import 'package:Docdoc/core/utils/add_router.dart';
import 'package:Docdoc/core/widget/custom_button.dart';
import 'package:Docdoc/feature/home/data/model/booking_arguments.dart';
import 'package:Docdoc/feature/home/logic/booking/booking_cubit.dart';
import 'package:Docdoc/feature/home/logic/booking/booking_state.dart';
import 'package:flutter/material.dart';
import 'package:Docdoc/feature/home/screens/book_appointment/widget/booking_payment_body.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class BookingPaymentView extends StatelessWidget {
  const BookingPaymentView({super.key});

  @override
  Widget build(BuildContext context) {
    final args = GoRouterState.of(context).extra as BookingArguments;
    final doctor = args.doctor;
    final cubit = args.cubit;

    return BlocProvider.value(
      value: cubit,
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
            child: BookingPaymentBody(),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24),
          child: BlocBuilder<AppointmentCubit, AppointmentState>(
            builder: (BuildContext context, state) {
              return CustomButton(
                text: 'Continue',
                onPressed: () {
                  cubit.confirmAppointment();
                  GoRouter.of(context).push(
                    AppRouter.bookingSummary,
                    extra: BookingArguments(doctor: doctor, cubit: cubit),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
