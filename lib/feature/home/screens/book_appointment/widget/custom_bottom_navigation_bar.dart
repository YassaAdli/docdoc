import 'package:Docdoc/core/function/custom_snack_bar.dart';
import 'package:Docdoc/core/utils/add_router.dart';
import 'package:Docdoc/core/utils/color_manage.dart';
import 'package:Docdoc/core/utils/sizeConfig.dart';
import 'package:Docdoc/core/widget/custom_button.dart';
import 'package:Docdoc/feature/home/data/model/booking_arguments.dart';
import 'package:Docdoc/feature/home/data/model/doctor/doctor.dart';
import 'package:Docdoc/feature/home/logic/appointment/appointment_cubit.dart';
import 'package:Docdoc/feature/home/logic/booking_doctor/booking_doctor_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({
    super.key,
    this.title,
    this.date,
    this.time,
    this.type,
    this.doctor,
    this.args,
  });
  final BookingArguments? args;
  final String? title;
  final DateTime? date;
  final String? time;
  final int? type;
  final Doctor? doctor;

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Material(
      elevation: 15,
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(40),
        topRight: Radius.circular(40),
      ),
      child: Container(
        height: SizeConfig.screenHeight * 0.3,
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.white, // background color is handled here
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24),
          child: Column(
            children: [
              const SizedBox(height: 28),
              Text(
                'Payment Info',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: ColorManager.text100,
                ),
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'SubTotal',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: ColorManager.body,
                        ),
                      ),
                      Text(
                        '\$${doctor?.appointPrice}',
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: ColorManager.text100,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Tax',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: ColorManager.body,
                        ),
                      ),
                      Text(
                        '\$0',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: ColorManager.text100,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Payment total ',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: ColorManager.text100,
                    ),
                  ),
                  Text(
                    '\$${doctor?.appointPrice}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: ColorManager.text100,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 26),
              BlocConsumer<BookingDoctorCubit, BookingDoctorState>(
                builder: (context, state) {
                  return state is BookingDoctorLoading
                      ? CustomButton(
                          isLoading: true,
                          text: 'Continue',
                          onPressed: () {
                            final cubit = context.read<BookingDoctorCubit>();
                            cubit.bookingDoctor(
                              date.toString(), // selected date/time
                              doctor!.id.toString(), // doctor id
                            );
                          },
                        )
                      : CustomButton(
                          text: 'Continue',
                          onPressed: () {
                            final cubit = context.read<BookingDoctorCubit>();
                            cubit.bookingDoctor(
                              date.toString(), // selected date/time
                              doctor!.id.toString(), // doctor id
                            );
                          },
                        );
                },
                listener: (context, state) {
                  if (state is BookingDoctorSuccess) {
                    GoRouter.of(context).push(
                      AppRouter.bookingConfirmation,
                      extra: BookingArguments(
                        doctor: args!.doctor,
                        cubit: args!.cubit,
                      ),
                    );
                    context.read<AppointmentCubit>().getAppointment();
                  } else if (state is BookingDoctorFailure) {
                    customSnackBar(context, state.message);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
