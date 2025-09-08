import 'package:Docdoc/core/widget/custom_error_message.dart';
import 'package:Docdoc/feature/home/data/model/doctor/doctor.dart';
import 'package:Docdoc/feature/home/logic/doctor_mode/doctor_mode_cubit.dart';
import 'package:Docdoc/feature/home/logic/search_doctor/search_doctor_bloc.dart';
import 'package:Docdoc/feature/home/logic/specialization_doctor/specialization_doctor_bloc.dart';
import 'package:Docdoc/feature/home/screens/homescreen/widget/custom_doctor_card.dart';
import 'package:Docdoc/feature/home/screens/search/widget/Custom_recent_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomSearchListView extends StatelessWidget {
  final Function(int) onSelect;
  const CustomSearchListView({super.key, required this.onSelect});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DoctorModeCubit, DoctorMode>(
      builder: (context, mode) {
        if (mode == DoctorMode.search) {
          return _DoctorListView<SearchDoctorBloc, SearchDoctorState>(
            extractDoctors: (state) =>
                state is SearchDoctorSuccess ? state.doctor : [],
            extractError: (state) =>
                state is SearchDoctorFailure ? state.errMassage : null,
            onSelect: (int p1) {
              onSelect(p1);
            },
          );
        } else {
          return _DoctorListView<
            SpecializationDoctorBloc,
            SpecializationDoctorState
          >(
            extractDoctors: (state) =>
                state is SpecializationDoctorSuccess ? state.doctor : [],
            extractError: (state) =>
                state is SpecializationDoctorFailure ? state.errMassage : null,
            onSelect: (int p1) {
              onSelect(p1);
            },
          );
        }
      },
    );
  }
}

class _DoctorListView<B extends StateStreamable<S>, S> extends StatelessWidget {
  final List<Doctor> Function(S state) extractDoctors;
  final String? Function(S state)? extractError;
  final Function(int) onSelect;

  const _DoctorListView({
    required this.extractDoctors,
    this.extractError,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<B, S>(
      builder: (context, state) {
        final doctors = extractDoctors(state);
        final error = extractError?.call(state);

        if (doctors.isNotEmpty) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            onSelect(doctors.length);
          });
          return ListView.builder(
            itemCount: doctors.length,
            itemBuilder: (_, i) => CustomDoctorCard(doctor: doctors[i]),
          );
        } else if (error != null) {
          return Center(child: CustomErrorMessage(errMessage: error));
        } else {
          return const Center(child: CustomRecentSearch());
        }
      },
    );
  }
}
