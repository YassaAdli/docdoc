import 'package:Docdoc/feature/home/data/model/appointment/data.dart';
import 'package:Docdoc/feature/home/screens/appointment/widget/custom_appointment_card.dart';
import 'package:flutter/material.dart';

class ListViewUpcomingAppointment extends StatelessWidget {
  const ListViewUpcomingAppointment({super.key, required this.doctors});
  final List<Data> doctors;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: doctors.length,
      itemBuilder: (context, index) {
        return CustomAppointmentCard(doctor: doctors[index].doctor!, dateTime: doctors[index].appointmentTime!,);
      },
    );
  }
}
