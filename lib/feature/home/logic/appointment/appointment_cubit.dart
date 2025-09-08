import 'package:Docdoc/feature/home/data/model/appointment/data.dart';
import 'package:Docdoc/feature/home/data/repositories/repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'appointment_state.dart';

class AppointmentCubit extends Cubit<AppointmentState> {
  final Repository repository;
  AppointmentCubit(this.repository) : super(AppointmentInitial());
  void getAppointment() async {
    emit(AppointmentLoading());
    final result = await repository.getAppointment();
    result.fold(
      (failure) {
        emit(AppointmentFailure(failure.errMassage));
      },
      (appointment) {
        if (appointment.isNotEmpty) {
          emit(AppointmentSuccess(appointment));
        } else {
          emit(AppointmentFailure("No Appointment"));
        }
      },
    );
  }
}
