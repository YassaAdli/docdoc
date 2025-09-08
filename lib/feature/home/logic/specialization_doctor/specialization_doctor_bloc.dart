import 'package:Docdoc/feature/home/data/model/doctor/doctor.dart';
import 'package:Docdoc/feature/home/data/repositories/repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'specialization_doctor_event.dart';
part 'specialization_doctor_state.dart';

class SpecializationDoctorBloc
    extends Bloc<SpecializationDoctorEvent, SpecializationDoctorState> {
  final Repository repository;
  SpecializationDoctorBloc(this.repository)
    : super(SpecializationDoctorInitial()) {
    on<GetDoctorsBySpecialization>(_specializationDoctor);
  }
  Future<void> _specializationDoctor(
    GetDoctorsBySpecialization event,
    Emitter<SpecializationDoctorState> emit,
  ) async {
    emit(SpecializationDoctorLoading());
    final result = await repository.specializationDoctor(
      event.specializationId,
    );
    result.fold(
      (failure) {
        emit(SpecializationDoctorFailure(failure.errMassage));
      },
      (result) {
        if (result.isNotEmpty) {
          emit(SpecializationDoctorSuccess(result));
        }
      },
    );
  }
}
