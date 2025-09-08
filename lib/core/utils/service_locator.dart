import 'package:Docdoc/core/network/api_service.dart';
import 'package:Docdoc/core/utils/secure_service.dart';
import 'package:Docdoc/core/utils/shared_pref_service.dart';
import 'package:Docdoc/feature/authentication/data/datasource/onboarding_local_data_source.dart';
import 'package:Docdoc/feature/authentication/data/repositories/auth_repository.dart';
import 'package:Docdoc/feature/authentication/data/repositories/auth_repository_impl.dart';
import 'package:Docdoc/feature/authentication/data/repositories/onboarding_repository.dart';
import 'package:Docdoc/feature/authentication/logic/login/login_cubit.dart';
import 'package:Docdoc/feature/authentication/logic/logout/logout_cubit.dart';
import 'package:Docdoc/feature/authentication/logic/register/register_cubit.dart';
import 'package:Docdoc/feature/home/data/repositories/repository.dart';
import 'package:Docdoc/feature/home/data/repositories/repository_impl.dart';
import 'package:Docdoc/feature/home/logic/appointment/appointment_cubit.dart';
import 'package:Docdoc/feature/home/logic/booking_doctor/booking_doctor_cubit.dart';
import 'package:Docdoc/feature/home/logic/doctor/doctor_bloc.dart';
import 'package:Docdoc/feature/home/logic/doctor_mode/doctor_mode_cubit.dart';
import 'package:Docdoc/feature/home/logic/search_doctor/search_doctor_bloc.dart';
import 'package:Docdoc/feature/home/logic/specialization_doctor/specialization_doctor_bloc.dart';
import 'package:Docdoc/feature/home/logic/user_information/user_information_bloc.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

void setupServerLocator() async {
  final prefs = await SharedPreferences.getInstance();
  getIt.registerLazySingleton<Dio>(() => Dio());
  getIt.registerLazySingleton<ApiService>(() => ApiService(getIt<Dio>()));
  getIt.registerLazySingleton<SecureStorage>(() => SecureStorage());

  getIt.registerSingleton<SharedPrefService>(SharedPrefService(prefs: prefs));

  getIt.registerSingleton<OnboardingLocalDataSource>(
    OnboardingLocalDataSource(),
  );
  getIt.registerSingleton<OnboardingRepository>(
    OnboardingRepository(
      localDataSource: getIt<OnboardingLocalDataSource>(),
      secureStorage: getIt<SecureStorage>(),
    ),
  );

  getIt.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(getIt<ApiService>(), getIt<SecureStorage>()),
  );
  getIt.registerLazySingleton<Repository>(
    () => RepositoryImpl(getIt<ApiService>()),
  );

  getIt.registerFactory<LoginCubit>(()=>
    LoginCubit(
      getIt<AuthRepository>(),
      getIt<SecureStorage>(),
      getIt<SharedPrefService>(),
    ),
  );
  getIt.registerFactory<LogoutCubit>(()=>
    LogoutCubit(
      getIt<AuthRepository>(),
      getIt<SecureStorage>(),
      getIt<SharedPrefService>(),
    ),
  );
  getIt.registerFactory<RegisterCubit>(()=>
    RegisterCubit(
      getIt<AuthRepository>(),
      getIt<SecureStorage>(),
      getIt<SharedPrefService>(),
    ),
  );
  getIt.registerFactory<BookingDoctorCubit>(()=>
    BookingDoctorCubit(getIt<Repository>()),
  );
  getIt.registerFactory<DoctorBloc>(() => DoctorBloc(getIt<Repository>()));
  getIt.registerFactory(() => DoctorModeCubit());
  getIt.registerFactory(() => SpecializationDoctorBloc(getIt<Repository>()));
  getIt.registerFactory(() => SearchDoctorBloc(getIt<Repository>()));
  getIt.registerFactory<UserInformationBloc>(() => UserInformationBloc(getIt<Repository>()));
  getIt.registerFactory<AppointmentCubit>(() => AppointmentCubit(getIt<Repository>()));

}
