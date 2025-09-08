import 'package:Docdoc/feature/home/data/model/appointment/data.dart';
import 'package:Docdoc/feature/home/screens/appointment/widget/custom_completed_card.dart';
import 'package:flutter/material.dart';
class ListViewAppointment extends StatelessWidget {
  const ListViewAppointment({super.key, required this.doctors, this.isCancelled = false});
  final List<Data> doctors;
  final bool isCancelled;


  @override
  Widget build(BuildContext context) {
    return  ListView.builder(
      itemCount: doctors.length,
      itemBuilder: (context, index) {
        return CustomCompletedCard(doctor: doctors[index].doctor!, dateTime: doctors[index].appointmentTime!,isCancelled: isCancelled,);
      },
    );
  }
}
