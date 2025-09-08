part of 'search_doctor_bloc.dart';

sealed class SearchDoctorState extends Equatable {
  const SearchDoctorState();

  @override
  List<Object> get props => [];
}

final class SearchDoctorInitial extends SearchDoctorState {}

final class SearchDoctorLoading extends SearchDoctorState {}

final class SearchDoctorSuccess extends SearchDoctorState {
  final List<Doctor> doctor;
  const SearchDoctorSuccess(this.doctor);
}

final class SearchDoctorFailure extends SearchDoctorState {
  final String errMassage;
  const SearchDoctorFailure(this.errMassage);
}
