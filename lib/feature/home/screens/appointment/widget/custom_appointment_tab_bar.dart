import 'package:Docdoc/core/utils/color_manage.dart';
import 'package:Docdoc/feature/home/data/model/appointment/data.dart';
import 'package:Docdoc/feature/home/data/model/appointment_manager.dart';
import 'package:Docdoc/feature/home/screens/appointment/widget/custom_appointment_card.dart';
import 'package:Docdoc/feature/home/screens/appointment/widget/custom_completed_card.dart';
import 'package:Docdoc/feature/home/screens/appointment/widget/list_view_appointment.dart';
import 'package:Docdoc/feature/home/screens/appointment/widget/list_view_upcoming_appointment.dart';
import 'package:flutter/material.dart';
class CustomAppointmentTabBar extends StatelessWidget {
  const CustomAppointmentTabBar({super.key, required this.doctors});
  final List<Data> doctors ;

  @override
  Widget build(BuildContext context) {
    final manager = AppointmentManager(doctors);
    return DefaultTabController(
      length: 3,
      child: Expanded(
        child: Column(
          children: [
            const TabBar(
              indicatorColor: ColorManager.primaryColor,
              indicatorSize: TabBarIndicatorSize.tab,
              labelStyle: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 14,
                color: ColorManager.text60,
              ),
              labelColor: ColorManager.primaryColor,
              unselectedLabelColor: ColorManager.text60,
              tabs:  [
                Tab(text: "Upcoming"),
                Tab(text: "Completed"),
                Tab(text: "Cancelled"),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 32),
                    child: ListViewUpcomingAppointment(doctors: manager.getUpcomingAppointments(),)
                  ),
                  // Tab 2 - Location
                  Padding(
                    padding: const EdgeInsets.only(top: 32.0),
                    child: ListViewAppointment(doctors: manager.getCompletedAppointments(),),
                  ),

                  // Tab 3 - Reviews
                  Padding(
                    padding: const EdgeInsets.only(top: 32.0),
                    child: ListViewAppointment(doctors: manager.getCancelledAppointments(),isCancelled: true,),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
