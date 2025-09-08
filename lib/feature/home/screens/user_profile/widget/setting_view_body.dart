import 'package:Docdoc/core/utils/add_router.dart';
import 'package:Docdoc/core/utils/color_manage.dart';
import 'package:Docdoc/core/utils/image_data.dart';
import 'package:Docdoc/feature/authentication/logic/logout/Logout_state.dart';
import 'package:Docdoc/feature/authentication/logic/logout/logout_cubit.dart';
import 'package:Docdoc/feature/home/screens/doctordetails/widget/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

class SettingViewBody extends StatelessWidget {
  const SettingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> settings = [
      {'icon': TImage.notifications, 'title': 'Notification'},
      {'icon': TImage.fqa, 'title': 'FAQ'},
      {'icon': TImage.lock, 'title': 'Security'},
      {'icon': TImage.language, 'title': 'Language'},
      {'icon': TImage.logout, 'title': 'Logout'},
    ];

    return Column(
      children: [
        const CustomAppBar(title: 'Setting'),
        const SizedBox(height: 32),
        SizedBox(
          height: 300,
          child: ListView.separated(
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  if (settings[index]['title'] == 'Logout') {
                    _showLogoutDialog(context);
                  }
                },
                child: SizedBox(
                  height: 50,
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        settings[index]['icon'],
                        width: 24,
                        height: 24,
                      ),
                      const SizedBox(width: 12),
                      Text(
                        settings[index]['title'],
                        style: index == 4
                            ? TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: ColorManager.fillRed,
                              )
                            : TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: ColorManager.text100,
                              ),
                      ),
                      const Spacer(),
                      const Icon(Icons.arrow_forward_ios, size: 18),
                    ],
                  ),
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return const Divider();
            },
            itemCount: settings.length,
          ),
        ),
        const SizedBox(height: 12),
        const Divider(),
      ],
    );
  }

  void _showLogoutDialog(BuildContext pageContext) {
    showCupertinoDialog(
      context: pageContext,
      builder: (BuildContext dialogContext) {
        return BlocProvider.value(
          value: pageContext.read<LogoutCubit>(),
          child: BlocConsumer<LogoutCubit, LogoutState>(
            listener: (context, state) {
              if (state is LogoutSuccess) {
                Navigator.pop(dialogContext);

                GoRouter.of(pageContext).go(AppRouter.loginView);

                ScaffoldMessenger.of(
                  pageContext,
                ).showSnackBar(const SnackBar(content: Text('Logout success')));
              } else if (state is LogoutFailure) {
                Navigator.pop(dialogContext);
                print(state.message);
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text(state.message)));
              }
            },
            builder: (context, state) {
              return CupertinoAlertDialog(
                title: const Text(
                  "Logout",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: ColorManager.black,
                  ),
                ),
                content: const Padding(
                  padding: EdgeInsets.only(top: 8.0),
                  child: Text(
                    "You'll need to enter your username \n and password next time \n you want to login",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: ColorManager.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                actions: [
                  CupertinoDialogAction(
                    onPressed: () => Navigator.pop(dialogContext),
                    isDefaultAction: true,
                    child: const Text(
                      "Cancel",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        color: ColorManager.fillBlue,
                      ),
                    ),
                  ),
                  CupertinoDialogAction(
                    onPressed: () {
                      pageContext.read<LogoutCubit>().logout();
                    },
                    isDestructiveAction: true,
                    child: const Text(
                      "Logout",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        color: ColorManager.fillRed,
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }
}
