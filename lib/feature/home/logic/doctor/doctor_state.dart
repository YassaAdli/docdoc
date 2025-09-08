part of 'doctor_bloc.dart';

@immutable
sealed class DoctorState {}

final class DoctorInitial extends DoctorState {}

final class DoctorLoading extends DoctorState {}

final class DoctorSuccess extends DoctorState {
  final List<Doctor> response;
  DoctorSuccess(this.response);
}

final class DoctorFailure extends DoctorState {
  final String message;
  DoctorFailure(this.message);
}
