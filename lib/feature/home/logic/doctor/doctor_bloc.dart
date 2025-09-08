import 'package:Docdoc/feature/home/data/model/doctor/doctor.dart';
import 'package:Docdoc/feature/home/data/repositories/repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
part 'doctor_event.dart';
part 'doctor_state.dart';

class DoctorBloc extends Bloc<DoctorEvent, DoctorState> {
  final Repository repository;
  DoctorBloc(this.repository) : super(DoctorInitial()) {
    on<GetDoctor>((event, emit) async {
      emit(DoctorLoading());
      final result = await repository.getDoctor();
      result.fold(
        (failure) => emit(DoctorFailure(failure.errMassage)),
        (doctor) => emit(DoctorSuccess(doctor)),
      );
    });
  }
}
