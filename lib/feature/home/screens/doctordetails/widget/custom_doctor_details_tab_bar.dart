import 'package:Docdoc/core/utils/color_manage.dart';
import 'package:Docdoc/core/utils/image_data.dart';
import 'package:Docdoc/feature/home/data/model/doctor/doctor.dart';
import 'package:flutter/material.dart';

class CustomDoctorDetailsTabBar extends StatelessWidget {
  const CustomDoctorDetailsTabBar({super.key, required this.doctor});
  final Doctor doctor;

  @override
  Widget build(BuildContext context) {
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
              tabs: [
                Tab(text: "About"),
                Tab(text: "Location"),
                Tab(text: "Reviews"),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  // Tab 1 - About
                  Padding(
                    padding: const EdgeInsets.only(top: 32),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "About me",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            doctor.description!,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: ColorManager.body,
                            ),
                          ),
                          const SizedBox(height: 24),
                          const Text(
                            "Working Time",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            "Monday - Friday, ${doctor.startTime} - ${doctor.endTime}",
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: ColorManager.body,
                            ),
                          ),
                          const SizedBox(height: 24),
                          const Text(
                            "STR",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            doctor.phone!,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: ColorManager.body,
                            ),
                          ),
                          const SizedBox(height: 24),
                          Text(
                            "${doctor.specialization!.name}",
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            "${doctor.address}",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(height: 4),
                          const Text(
                            "2017 - sekarang",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: ColorManager.body,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Tab 2 - Location
                  Padding(
                    padding: const EdgeInsets.only(top: 32.0),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Practice Place",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            "${doctor.city!.name}, ${doctor.city!.governrate!.name}",
                          ),
                          const SizedBox(height: 18),
                          const Text(
                            "Location Map",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 12),
                          const ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                            child: Image(
                              image: AssetImage(
                                TImage.testCard,
                              ), // Replace with Google Map widget if needed
                              height: 260,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Tab 3 - Reviews
                  Padding(
                    padding: const EdgeInsets.only(top: 32.0),
                    child: Column(
                      children: [
                        Expanded(
                          child: ListView.builder(
                            itemCount: 8,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 16.0),
                                child: SizedBox(
                                  width: double.infinity,
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(50),
                                        ),
                                        child: Image(
                                          image: AssetImage(
                                            TImage.testPro,
                                          ), // Replace with Google Map widget if needed
                                          height: 40,
                                          width: 40,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      SizedBox(width: 10),
                                      Expanded(
                                        child: Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "Practice Place",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 16,
                                                    color: ColorManager.text100,
                                                  ),
                                                ),
                                                Text(
                                                  "today",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 12,
                                                    color: ColorManager.text60,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 8),
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Icon(
                                                  Icons.star,
                                                  color:
                                                      ColorManager.warning100,
                                                  size: 20,
                                                ),
                                                Icon(
                                                  Icons.star,
                                                  color:
                                                      ColorManager.warning100,
                                                  size: 20,
                                                ),
                                                Icon(
                                                  Icons.star,
                                                  color:
                                                      ColorManager.warning100,
                                                  size: 20,
                                                ),
                                                Icon(
                                                  Icons.star,
                                                  color:
                                                      ColorManager.warning100,
                                                  size: 20,
                                                ),
                                                Icon(
                                                  Icons.star,
                                                  color:
                                                      ColorManager.warning100,
                                                  size: 20,
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 10),
                                            Text(
                                              'As someone who lives in a remote area with limited access to healthcare, this telemedicine app has been a game changer for me. I can easily schedule virtual appointments with doctors and get the care I need without having to travel long distances.',
                                              style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 12,
                                                color: ColorManager.text60,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
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
