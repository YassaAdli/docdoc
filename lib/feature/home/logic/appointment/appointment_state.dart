part of 'appointment_cubit.dart';



sealed class AppointmentState extends Equatable {
  const AppointmentState();

  @override
  List<Object> get props => [];
}

final class AppointmentInitial extends AppointmentState {}
final class AppointmentLoading extends AppointmentState {}
final class AppointmentSuccess extends AppointmentState {
  final List<Data> doctor;
  const AppointmentSuccess(this.doctor);
}
final class AppointmentFailure extends AppointmentState {
  final String errMassage;
  const AppointmentFailure(this.errMassage);
}
