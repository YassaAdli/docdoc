import 'package:Docdoc/core/utils/color_manage.dart';
import 'package:Docdoc/core/utils/image_data.dart';
import 'package:Docdoc/feature/home/data/model/doctor/doctor.dart';
import 'package:Docdoc/feature/home/screens/appointment/widget/custom_appointment_doctor_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
class CustomAppointmentCard extends StatelessWidget {
  const CustomAppointmentCard({super.key, required this.doctor, required this.dateTime});
  final Doctor doctor ;
  final String dateTime ;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: ColorManager.white,
      elevation: 0.2,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: SizedBox(
                    height: 79,
                    child: CustomAppointmentDoctorCard( doctor: doctor, dateTime: dateTime,),
                  ),
                ),
                const SizedBox(width: 8),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: SvgPicture.asset(
                    TImage.message,
                    color: ColorManager.primaryColor,
                    width: 24,
                    height: 24,
                  ),
                ),
              ],
            ),
            Divider(),
            SizedBox(height: 16,),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 39,
                    decoration: BoxDecoration(
                      color: ColorManager.white,
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(color: ColorManager.primaryColor,width: 1),
                    ),
                    child: Center(
                      child: Text('Cancel Appointment',style: TextStyle(fontSize: 12,color: ColorManager.primaryColor,fontWeight: FontWeight.w600),),
                    ),
                  ),
                ),
                SizedBox(width: 16,),
                Expanded(
                  child: Container(
                    height: 39,
                    decoration: BoxDecoration(
                      color: ColorManager.primaryColor,
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(color: ColorManager.primaryColor,width: 1),
                    ),
                    child: Center(
                      child: Text('Reschedule',style: TextStyle(fontSize: 12,color: ColorManager.white,fontWeight: FontWeight.w600),),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 16,),
          ],
        ),
      ),
    );
  }
}
