import 'package:Docdoc/feature/home/data/model/doctor/doctor.dart';
import 'package:Docdoc/feature/home/logic/booking/booking_cubit.dart';

class BookingArguments {
  final Doctor doctor;
  final AppointmentCubit cubit;

  BookingArguments({required this.doctor, required this.cubit});
}
