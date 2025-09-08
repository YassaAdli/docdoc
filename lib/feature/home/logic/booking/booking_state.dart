class AppointmentState {
  final DateTime selectedDate;
  final String? selectedTime;
  final int selectedTypeIndex;
  final String paymentMethod;

  AppointmentState({
    required this.selectedDate,
    this.selectedTime,
    required this.selectedTypeIndex,
    required this.paymentMethod,
  });

  AppointmentState copyWith({
    DateTime? selectedDate,
    String? selectedTime,
    int? selectedTypeIndex,
    String? paymentMethod,
  }) {
    return AppointmentState(
      selectedDate: selectedDate ?? this.selectedDate,
      selectedTime: selectedTime ?? this.selectedTime,
      selectedTypeIndex: selectedTypeIndex ?? this.selectedTypeIndex,
      paymentMethod: paymentMethod ?? this.paymentMethod,
    );
  }
}
