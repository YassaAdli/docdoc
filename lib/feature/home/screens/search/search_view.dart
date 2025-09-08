import 'package:Docdoc/core/utils/service_locator.dart';
import 'package:Docdoc/feature/home/logic/doctor_mode/doctor_mode_cubit.dart';
import 'package:Docdoc/feature/home/logic/search_doctor/search_doctor_bloc.dart';
import 'package:Docdoc/feature/home/logic/specialization_doctor/specialization_doctor_bloc.dart';
import 'package:Docdoc/feature/home/screens/search/widget/search_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: MultiBlocProvider(
          providers: [
            BlocProvider(create: (_) => getIt<DoctorModeCubit>()),
            BlocProvider(create: (_) => getIt<SearchDoctorBloc>()),
            BlocProvider(create: (_) => getIt<SpecializationDoctorBloc>()),
          ],
          child: SearchViewBody(),
        ),
      ),
    );
  }
}
