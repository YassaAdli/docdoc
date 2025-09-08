import 'package:Docdoc/core/widget/custom_button.dart';
import 'package:Docdoc/feature/home/data/model/booking_arguments.dart';
import 'package:Docdoc/feature/home/screens/book_appointment/widget/booking_confirmation_body.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BookingConfirmationView extends StatelessWidget {
  const BookingConfirmationView({super.key});

  @override
  Widget build(BuildContext context) {
    final args = GoRouterState.of(context).extra as BookingArguments;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
          child: BookingConfirmationBody(args: args),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24),
        child: CustomButton(
          text: 'Done',
          onPressed: () {
            GoRouter.of(context).pop();
            GoRouter.of(context).pop();
            GoRouter.of(context).pop();
            GoRouter.of(context).pop();
          },
        ),
      ),
    );
  }
}
