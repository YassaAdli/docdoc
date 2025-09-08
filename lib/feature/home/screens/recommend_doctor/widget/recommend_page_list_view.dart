import 'package:Docdoc/core/widget/custom_error_message.dart';
import 'package:Docdoc/feature/home/data/model/doctor/doctor.dart';
import 'package:Docdoc/feature/home/logic/doctor/doctor_bloc.dart';
import 'package:Docdoc/feature/home/logic/doctor_mode/doctor_mode_cubit.dart';
import 'package:Docdoc/feature/home/logic/search_doctor/search_doctor_bloc.dart';
import 'package:Docdoc/feature/home/logic/specialization_doctor/specialization_doctor_bloc.dart';
import 'package:Docdoc/feature/home/screens/homescreen/widget/custom_doctor_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RecommendPageListView extends StatelessWidget {
  const RecommendPageListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DoctorModeCubit, DoctorMode>(
      builder: (context, mode) {
        if (mode == DoctorMode.all) {
          return _DoctorListView<DoctorBloc, DoctorState>(
            extractDoctors: (state) =>
                state is DoctorSuccess ? state.response : [],
            extractError: (state) =>
                state is DoctorFailure ? state.message : null,
          );
        } else if (mode == DoctorMode.search) {
          return _DoctorListView<SearchDoctorBloc, SearchDoctorState>(
            extractDoctors: (state) =>
                state is SearchDoctorSuccess ? state.doctor : [],
            extractError: (state) =>
                state is SearchDoctorFailure ? state.errMassage : null,
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
          );
        }
      },
    );
  }
}

class _DoctorListView<B extends StateStreamable<S>, S> extends StatelessWidget {
  final List<Doctor> Function(S state) extractDoctors;
  final String? Function(S state)? extractError;

  const _DoctorListView({required this.extractDoctors, this.extractError});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<B, S>(
      builder: (context, state) {
        final doctors = extractDoctors(state);
        final error = extractError?.call(state);

        if (doctors.isNotEmpty) {
          return ListView.builder(
            itemCount: doctors.length,
            itemBuilder: (_, i) => CustomDoctorCard(doctor: doctors[i]),
          );
        } else if (error != null) {
          return Center(child: CustomErrorMessage(errMessage: error));
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
