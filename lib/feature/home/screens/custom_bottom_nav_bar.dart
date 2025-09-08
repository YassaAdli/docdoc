import 'package:Docdoc/core/function/custom_snack_bar.dart';
import 'package:Docdoc/core/utils/color_manage.dart';
import 'package:Docdoc/core/utils/image_data.dart';
import 'package:Docdoc/core/utils/service_locator.dart';
import 'package:Docdoc/feature/home/logic/appointment/appointment_cubit.dart';
import 'package:Docdoc/feature/home/logic/doctor/doctor_bloc.dart';
import 'package:Docdoc/feature/home/screens/appointment/appointment_view.dart';
import 'package:Docdoc/feature/home/screens/homescreen/home_view.dart';
import 'package:Docdoc/feature/home/screens/message_view/message_view.dart';
import 'package:Docdoc/feature/home/screens/search/search_view.dart';
import 'package:Docdoc/feature/home/screens/user_profile/user_profile_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class CustomBottomNavBar extends StatefulWidget {
  const CustomBottomNavBar({super.key});

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  int _selectedIndex = 0;
  DateTime? _lastPressed;
  final List<Widget> _pages = [];

  @override
  void initState() {
    super.initState();
    _pages.addAll([
      const HomeView(),
      const MessageView(),
      const SearchView(),
      const AppointmentView(),
      UserProfileView(
        onTapAppointment: () {
          setState(() {
            _selectedIndex = 3;
          });
        },
      ),
    ]);
  }


  void _onItemTapped(int index) {
    if (index == 2) return;
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(

          create: (context) => getIt<DoctorBloc>()..add(GetDoctor()),
        ),
        BlocProvider(
          create: (context) => getIt<AppointmentCubit>()..getAppointment(),
        ),
      ],
      child: PopScope(
        canPop: false,
        onPopInvoked: (didPop) => _handleBackPress(didPop),
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          body: _pages[_selectedIndex],
          bottomNavigationBar: MediaQuery.of(context).viewInsets.bottom > 0
              ? const SizedBox()
              : Container(
                  height: 80,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildNavItem(TImage.home, 0),
                      _buildNavItem(TImage.message, 1, hasBadge: true),
                      const SizedBox(width: 72),
                      _buildNavItem(TImage.calendar, 3),
                      _buildNavItem(TImage.doctor, 4, isProfile: true),
                    ],
                  ),
                ),
          floatingActionButton: MediaQuery.of(context).viewInsets.bottom > 0
              ? null
              : GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedIndex = 2;
                    });
                  },
                  child: Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      color: ColorManager.primaryColor,
                      borderRadius: BorderRadius.circular(28),
                      border: Border.all(color: Colors.white, width: 3),
                    ),
                    child: Center(
                      child: SvgPicture.asset(
                        TImage.search,
                        width: 24,
                        height: 24,
                        colorFilter: const ColorFilter.mode(
                          Colors.white,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                  ),
                ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
        ),
      ),
    );
  }

  void _handleBackPress(bool didPop) {
    if (didPop) return;
    if (_selectedIndex != 0) {
      setState(() {
        _selectedIndex = 0;
      });
      return;
    }

    final now = DateTime.now();
    if (_lastPressed == null ||
        now.difference(_lastPressed!) > const Duration(seconds: 2)) {
      _lastPressed = now;
      customSnackBar(context, "Press back again to exit");
      return;
    }

    Navigator.of(context).maybePop();
  }

  Widget _buildNavItem(
    String asset,
    int index, {
    bool hasBadge = false,
    bool isProfile = false,
  }) {
    bool isActive = _selectedIndex == index;

    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: Stack(
        alignment: Alignment.center,
        children: [
          if (isProfile)
            CircleAvatar(
              radius: 16,
              backgroundImage: AssetImage(TImage.testPro),
            )
          else
            SvgPicture.asset(
              asset,
              width: 28,
              height: 28,
              colorFilter: ColorFilter.mode(
                isActive ? ColorManager.primaryColor : ColorManager.textColor,
                BlendMode.srcIn,
              ),
            ),

          if (isProfile && isActive)
            Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                color: Colors.black.withValues(alpha: 0.3),
                shape: BoxShape.circle,
              ),
            ),

          if (hasBadge)
            Positioned(
              right: 0,
              top: 0,
              child: Container(
                width: 10,
                height: 10,
                decoration: const BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
