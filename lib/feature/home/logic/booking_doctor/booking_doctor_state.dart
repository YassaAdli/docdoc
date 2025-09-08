part of 'booking_doctor_cubit.dart';

sealed class BookingDoctorState extends Equatable {
  const BookingDoctorState();

  @override
  List<Object> get props => [];
}

final class BookingDoctorInitial extends BookingDoctorState {}

final class BookingDoctorLoading extends BookingDoctorState {}

final class BookingDoctorSuccess extends BookingDoctorState {
  final AuthResponse response;
  const BookingDoctorSuccess(this.response);
}

final class BookingDoctorFailure extends BookingDoctorState {
  final String message;
  const BookingDoctorFailure(this.message);
}
