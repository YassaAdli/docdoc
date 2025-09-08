import 'package:Docdoc/BlocObserver.dart';
import 'package:Docdoc/core/utils/add_router.dart';
import 'package:Docdoc/core/utils/secure_service.dart';
import 'package:Docdoc/core/utils/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupServerLocator();
  final token = await SecureStorage().getToken();

  debugPrint(
    '===============================================================================$token',
  );
  // await SecureStorage().clearToken();
  final cred = await SecureStorage().getCredentials();
  debugPrint(
    '===============================================================================$cred',
  );

  Bloc.observer = const CounterObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.router,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(scaffoldBackgroundColor: Colors.white),
    );
  }
}
