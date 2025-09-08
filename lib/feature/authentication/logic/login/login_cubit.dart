import 'package:Docdoc/core/utils/secure_service.dart';
import 'package:Docdoc/core/utils/shared_pref_service.dart';
import 'package:Docdoc/feature/authentication/data/model/auth_request.dart';
import 'package:Docdoc/feature/authentication/data/repositories/auth_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthRepository repository;
  final SecureStorage secureStorage;
  final SharedPrefService sharedPrefService;

  LoginCubit(this.repository, this.secureStorage, this.sharedPrefService,)
    : super(LoginInitial());

  Future<void> login(String email, String password, {bool remember = false}) async {
    emit(LoginLoading());
    final request = AuthRequest(email: email, password: password);
    final result = await repository.login(request);

    result.fold(
      (failure) {
        emit(LoginFailure(failure.errMassage));
      },
      (response) async {
        if (response.status && response.data != null) {
          await secureStorage.saveToken(response.data!.token);
          await sharedPrefService.setValue("username", response.data!.username);
          await sharedPrefService.setValue("email", email);
          if (remember) {
            await repository.saveCredentials(request.email, request.password);
          } else {
            await repository.clearCredentials();
          }
          emit(LoginSuccess(response));
        } else {
          emit(LoginFailure(response.message));
        }
      },
    );
  }
  Future<void> loadRememberedCredentials() async {
    final creds = await repository.getCredentials();
    if (creds != null) {
      emit(AuthRemembered(creds["email"]!, creds["password"]!));
    } else {
      emit(LoginInitial());
    }
  }



}
