import 'package:Docdoc/feature/authentication/data/model/auth_response.dart';
import 'package:Docdoc/feature/home/data/repositories/repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'booking_doctor_state.dart';

class BookingDoctorCubit extends Cubit<BookingDoctorState> {
  final Repository repository;
  BookingDoctorCubit(this.repository) : super(BookingDoctorInitial());
  Future<void> bookingDoctor(String date, String doctorId) async {
    emit(BookingDoctorLoading());
    final result = await repository.bookingDoctor(date, doctorId);
    result.fold(
      (failure) {
        emit(BookingDoctorFailure(failure.errMassage));
      },
      (result) async {
        if (result.status && result.data != null) {
          emit(BookingDoctorSuccess(result));
        } else {
          emit(BookingDoctorFailure(result.message));
        }
      },
    );
  }
}
