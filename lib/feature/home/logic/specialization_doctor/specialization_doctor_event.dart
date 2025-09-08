part of 'specialization_doctor_bloc.dart';

abstract class SpecializationDoctorEvent extends Equatable {
  const SpecializationDoctorEvent();

  @override
  List<Object> get props => [];
}

class GetDoctorsBySpecialization extends SpecializationDoctorEvent {
  final int specializationId;
  const GetDoctorsBySpecialization(this.specializationId);
}
