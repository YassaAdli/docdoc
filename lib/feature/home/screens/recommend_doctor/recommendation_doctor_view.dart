import 'package:Docdoc/core/utils/service_locator.dart';
import 'package:Docdoc/feature/home/logic/doctor/doctor_bloc.dart';
import 'package:Docdoc/feature/home/logic/doctor_mode/doctor_mode_cubit.dart';
import 'package:Docdoc/feature/home/logic/search_doctor/search_doctor_bloc.dart';
import 'package:Docdoc/feature/home/logic/specialization_doctor/specialization_doctor_bloc.dart';
import 'package:Docdoc/feature/home/screens/recommend_doctor/widget/recommendation_doctor_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RecommendationDoctorView extends StatelessWidget {
  final int? specializationId;
  const RecommendationDoctorView({super.key, this.specializationId});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => getIt<DoctorBloc>()..add(GetDoctor())),
        BlocProvider(
          create: (_) {
            final cubit = getIt<DoctorModeCubit>();
            if (specializationId != null && specializationId != 11) {
              cubit.changeMode(DoctorMode.filter);
            }
            return cubit;
          },
        ),
        BlocProvider(create: (_) => getIt<SearchDoctorBloc>()),
        BlocProvider(
          create: (_) {
            final bloc = getIt<SpecializationDoctorBloc>();
            if (specializationId != null) {
              bloc.add(GetDoctorsBySpecialization(specializationId!));
            }
            return bloc;
          },
        ),
      ],
      child: const Scaffold(body: SafeArea(child: RecommendationDoctorBody())),
    );
  }
}
