import 'package:intl/intl.dart';
import 'package:Docdoc/feature/home/data/model/appointment/data.dart';

class AppointmentManager {
  final List<Data> appointments;

  AppointmentManager(this.appointments);

  DateTime? _parseDate(String? dateStr) {
    if (dateStr == null) return null;
    try {
      return DateFormat("EEEE, MMMM d, yyyy h:mm a").parse(dateStr);
    } catch (e) {
      return null;
    }
  }

  List<Data> getUpcomingAppointments() {
    final now = DateTime.now();
    return appointments.where((a) {
      if (a.status?.toLowerCase() != "pending") return false;
      final date = _parseDate(a.appointmentTime);
      return date != null && date.isAfter(now);
    }).toList();
  }

  List<Data> getCompletedAppointments() {
    final now = DateTime.now();
    return appointments.where((a) {
      if (a.status?.toLowerCase() != "pending") return false;
      final date = _parseDate(a.appointmentTime);
      return date != null && date.isBefore(now);
    }).toList();
  }

  List<Data> getCancelledAppointments() {
    final now = DateTime.now();
    return appointments.where((a) {
      if (a.status?.toLowerCase() != "pending") return false;
      final date = _parseDate(a.appointmentTime);
      return date != null && date.isBefore(now);
    }).toList();
  }
}
