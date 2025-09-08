import 'package:Docdoc/core/utils/color_manage.dart';
import 'package:Docdoc/feature/home/logic/doctor_mode/doctor_mode_cubit.dart';
import 'package:Docdoc/feature/home/logic/specialization_doctor/specialization_doctor_bloc.dart';
import 'package:Docdoc/feature/home/screens/recommend_doctor/widget/bottom_sheet_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final parentContext = context; // capture parent context here
        showModalBottomSheet(
          backgroundColor: ColorManager.white,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
          ),
          context: context,
          builder: (_) {
            // pass down the parent context using BlocProvider.value
            return MultiBlocProvider(
              providers: [
                BlocProvider.value(
                  value: parentContext.read<DoctorModeCubit>(),
                ),
                BlocProvider.value(
                  value: parentContext.read<SpecializationDoctorBloc>(),
                ),
              ],
              child: const BottomSheetBody(),
            );
          },
        );
      },
      child: Icon(Icons.filter_list_rounded, size: 24),
    );
  }
}
