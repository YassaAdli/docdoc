part of 'specialization_doctor_bloc.dart';

sealed class SpecializationDoctorState extends Equatable {
  const SpecializationDoctorState();

  @override
  List<Object> get props => [];
}

final class SpecializationDoctorInitial extends SpecializationDoctorState {}

final class SpecializationDoctorLoading extends SpecializationDoctorState {}

final class SpecializationDoctorSuccess extends SpecializationDoctorState {
  final List<Doctor> doctor;
  const SpecializationDoctorSuccess(this.doctor);
}

final class SpecializationDoctorFailure extends SpecializationDoctorState {
  final String errMassage;
  const SpecializationDoctorFailure(this.errMassage);
}
