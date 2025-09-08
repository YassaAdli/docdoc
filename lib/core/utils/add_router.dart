import 'package:Docdoc/core/utils/service_locator.dart';
import 'package:Docdoc/feature/authentication/screens/login/login_view.dart';
import 'package:Docdoc/feature/authentication/screens/onboarding/onboarding_view.dart';
import 'package:Docdoc/feature/authentication/screens/signup/sign_up_view.dart';
import 'package:Docdoc/feature/authentication/screens/splash/splash_view.dart';
import 'package:Docdoc/feature/home/data/model/doctor/doctor.dart';
import 'package:Docdoc/feature/home/logic/user_information/user_information_bloc.dart';
import 'package:Docdoc/feature/home/screens/book_appointment/book_appointment_view.dart';
import 'package:Docdoc/feature/home/screens/book_appointment/booking_confirmation_view.dart';
import 'package:Docdoc/feature/home/screens/book_appointment/booking_payment_view.dart';
import 'package:Docdoc/feature/home/screens/book_appointment/booking_summary_view.dart';
import 'package:Docdoc/feature/home/screens/custom_bottom_nav_bar.dart';
import 'package:Docdoc/feature/home/screens/doctordetails/doctor_details_view.dart';
import 'package:Docdoc/feature/home/screens/recommend_doctor/specialty_doctor.dart';
import 'package:Docdoc/feature/home/screens/recommend_doctor/recommendation_doctor_view.dart';
import 'package:Docdoc/feature/home/screens/user_profile/personal_information_view.dart';
import 'package:Docdoc/feature/home/screens/user_profile/setting_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const String onboardingView = '/onboarding';
  static const String loginView = '/login';
  static const String registerView = '/register';
  static const String homeScreen = '/home';
  static const String recommendationDoctor = '/recommendation';
  static const String doctorDetail = '/doctorDetail';
  static const String doctorFilter = '/doctorFilter';
  static const String bookAppointment = '/bookAppointment';
  static const String bookingPayment = '/bookingPayment';
  static const String bookingSummary = '/bookingSummary';
  static const String bookingConfirmation = '/bookingConfirmation';
  static const String setting = '/setting';
  static const String personalInformationView = '/PersonalInformation';

  static final router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => const SplashView()),
      GoRoute(
        path: onboardingView,
        builder: (context, state) => const OnboardingView(),
      ),
      GoRoute(path: loginView, builder: (context, state) => const LoginView()),
      GoRoute(
        path: registerView,
        builder: (context, state) => const SignUpView(),
      ),
      GoRoute(
        path: homeScreen,
        builder: (context, state) => const CustomBottomNavBar(),
      ),
      GoRoute(
        path: recommendationDoctor,
        builder: (context, state) =>
            RecommendationDoctorView(specializationId: state.extra as int?),
      ),
      GoRoute(
        path: doctorDetail,
        builder: (context, state) =>
            DoctorDetailsView(doctor: state.extra as Doctor),
      ),
      GoRoute(
        path: doctorFilter,
        builder: (context, state) => const SpecialtyDoctor(),
      ),
      GoRoute(
        path: bookAppointment,
        builder: (context, state) =>
            BookAppointmentView(doctor: state.extra as Doctor),
      ),
      GoRoute(
        path: bookingPayment,
        builder: (context, state) => BookingPaymentView(),
      ),
      GoRoute(
        path: bookingSummary,
        builder: (context, state) => BookingSummaryView(),
      ),
      GoRoute(
        path: bookingConfirmation,
        builder: (context, state) => const BookingConfirmationView(),
      ),
      GoRoute(path: setting, builder: (context, state) => const SettingView()),
      GoRoute(
        path: personalInformationView,
        builder: (context, state) =>
        BlocProvider(create: (context) => getIt<UserInformationBloc>()..add(GetUserInformation()),
        child: const PersonalInformationView()),
      ),
    ],
  );
}
