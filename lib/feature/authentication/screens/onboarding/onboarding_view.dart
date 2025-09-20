import 'package:Docdoc/core/utils/add_router.dart';
import 'package:Docdoc/core/utils/color_manage.dart';
import 'package:Docdoc/core/utils/image_data.dart';
import 'package:Docdoc/core/utils/sizeConfig.dart';
import 'package:Docdoc/core/widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20.0, bottom: 40),
              child: Image.asset(TImage.logo, height: 38, width: 141),
            ),
            Expanded(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 30.0),
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          width: SizeConfig.screenWidth,
                          height: SizeConfig.blockSizeVertical * 50,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(TImage.logoBackground),
                              fit: BoxFit.contain,
                            ),
                          ),
                          child: Image.asset(TImage.doctor, fit: BoxFit.fill),
                        ),
                        Positioned(
                          left: 0,
                          right: 0,
                          top: SizeConfig.blockSizeVertical * 30,
                          child: Container(
                            width: double.infinity,
                            height: SizeConfig.blockSizeVertical * 20,
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Colors
                                      .transparent,
                                  Color.fromARGB(
                                    20,
                                    255,
                                    255,
                                    255,
                                  ), 
                                  Color.fromARGB(
                                    80,
                                    255,
                                    255,
                                    255,
                                  ), 
                                  Color.fromARGB(
                                    150,
                                    255,
                                    255,
                                    255,
                                  ), 
                                  Colors.white,
                                ],
                                stops: [
                                  0.0, 
                                  0.4,
                                  0.65, 
                                  0.85, 
                                  1.0, 
                                ],
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 0,
                          right: 0,
                          top: SizeConfig.blockSizeVertical * 43,
                          child: const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 5.0),
                            child: Text(
                              'Best Doctor \n Appointment App',
                              style: TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                                color: ColorManager.primaryColor,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Column(
                      children: [
                        const SizedBox(height: 18),

                        // Subtitle
                        const Text(
                          'Manage and schedule all of your medical appointments easily with DocDoc to get a new experience.',
                          style: TextStyle(
                            fontSize: 10,
                            color: ColorManager.textColor,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 35),

                        SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: CustomButton(
                            text: 'Get Started',
                            onPressed: () {
                              GoRouter.of(context).go(AppRouter.loginView);
                            },
                          ),
                        ),
                        const SizedBox(height: 40),
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
