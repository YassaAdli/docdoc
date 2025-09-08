import 'package:Docdoc/core/utils/secure_service.dart';
import 'package:Docdoc/core/utils/shared_pref_service.dart';
import 'package:Docdoc/feature/authentication/data/model/auth_request.dart';

import 'package:Docdoc/feature/authentication/data/repositories/auth_repository.dart';
import 'package:Docdoc/feature/authentication/logic/register/register_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final AuthRepository repository;
  final SecureStorage secureStorage;
  final SharedPrefService sharedPrefService;

  RegisterCubit(this.repository, this.secureStorage, this.sharedPrefService)
    : super(RegisterInitial());

  Future<void> register(
    String email,
    String password,
    String name,
    String phone,
    String gender,
    String passwordConfirmation,
  ) async {
    emit(RegisterLoading());
    final request = AuthRequest(
      email: email,
      password: password,
      name: name,
      phone: phone,
      gender: gender,
      passwordConfirmation: passwordConfirmation,
    );
    final result = await repository.register(request);

    result.fold(
      (failure) {
        emit(RegisterFailure(failure.errMassage));
      },
      (response) async {
        if (response.status && response.data != null) {
          await secureStorage.saveToken(response.data!.token);
          await sharedPrefService.setValue("username", response.data!.username);
          await sharedPrefService.setValue("email", email);
          emit(RegisterSuccess(response));
        } else {
          emit(RegisterFailure(response.message));
        }
      },
    );
  }
}
