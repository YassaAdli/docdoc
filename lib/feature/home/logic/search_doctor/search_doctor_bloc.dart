import 'package:Docdoc/feature/home/data/model/doctor/doctor.dart';
import 'package:Docdoc/feature/home/data/repositories/repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'search_doctor_event.dart';
part 'search_doctor_state.dart';

class SearchDoctorBloc extends Bloc<SearchDoctorEvent, SearchDoctorState> {
  final Repository repository;
  SearchDoctorBloc(this.repository) : super(SearchDoctorInitial()) {
    on<SearchDoctorByName>(searchDoctor);
  }
  Future<void> searchDoctor(
    SearchDoctorByName event,
    Emitter<SearchDoctorState> emit,
  ) async {
    emit(SearchDoctorLoading());
    final result = await repository.searchDoctor(event.name);
    result.fold(
      (failure) {
        emit(SearchDoctorFailure(failure.errMassage));
      },
      (result) {
        if (result.isNotEmpty) {
          emit(SearchDoctorSuccess(result));
        }
      },
    );
  }
}
