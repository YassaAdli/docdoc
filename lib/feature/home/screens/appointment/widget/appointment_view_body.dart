import 'package:Docdoc/core/utils/color_manage.dart';
import 'package:Docdoc/feature/home/logic/appointment/appointment_cubit.dart';
import 'package:Docdoc/feature/home/screens/appointment/widget/custom_appointment_app_bar.dart';
import 'package:Docdoc/feature/home/screens/appointment/widget/custom_appointment_tab_bar.dart';
import 'package:Docdoc/feature/home/screens/doctordetails/widget/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppointmentViewBody extends StatelessWidget {
  const AppointmentViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomAppointmentAppBar(),
        const SizedBox(height: 32),
        BlocBuilder<AppointmentCubit, AppointmentState>(
          builder: (BuildContext context, state) {
            if (state is AppointmentLoading) {
              return const Center(
                child: CircularProgressIndicator(
                  color: ColorManager.primaryColor,
                ),
              );
            } else if (state is AppointmentSuccess) {
              return  CustomAppointmentTabBar(doctors: state.doctor,);
            } else if (state is AppointmentFailure) {
              return const Center(child: Text("No Appointment"));
            }else{
              return const Center(
                child: CircularProgressIndicator(
                  color: ColorManager.primaryColor,
                ),
              );
            }
          },
        ),
      ],
    );
  }
}
