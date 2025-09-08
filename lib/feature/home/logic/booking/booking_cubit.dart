import 'package:Docdoc/feature/home/logic/booking/booking_state.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppointmentCubit extends Cubit<AppointmentState> {
  AppointmentCubit()
    : super(
        AppointmentState(
          selectedDate: DateTime.now(),
          selectedTime: null,
          selectedTypeIndex: 0,
          paymentMethod: "Credit Card", // default value
        ),
      );

  void selectDate(DateTime date) => emit(state.copyWith(selectedDate: date));

  void selectTime(String time) => emit(state.copyWith(selectedTime: time));

  void selectType(int index) => emit(state.copyWith(selectedTypeIndex: index));

  void selectPayment(String method) =>
      emit(state.copyWith(paymentMethod: method));

  void confirmAppointment() {
    debugPrint(
      "Appointment confirmed with date: ${state.selectedDate}, "
      "time: ${state.selectedTime ?? "Not selected"}, "
      "type index: ${state.selectedTypeIndex}, "
      "payment method: ${state.paymentMethod}",
    );
  }
}
