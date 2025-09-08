part of 'doctor_bloc.dart';

@immutable
sealed class DoctorEvent {}

class GetDoctor extends DoctorEvent {}
