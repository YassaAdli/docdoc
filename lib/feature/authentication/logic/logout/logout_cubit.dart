import 'package:Docdoc/core/utils/secure_service.dart';
import 'package:Docdoc/core/utils/shared_pref_service.dart';
import 'package:Docdoc/feature/authentication/data/repositories/auth_repository.dart';
import 'package:Docdoc/feature/authentication/logic/logout/Logout_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LogoutCubit extends Cubit<LogoutState> {
  final AuthRepository repository;
  final SecureStorage secureStorage;
  final SharedPrefService sharedPrefService;

  LogoutCubit(this.repository, this.secureStorage, this.sharedPrefService)
    : super(LogoutInitial());

  Future<void> logout() async {
    emit(LogoutLoading());
    final result = await repository.logout();
    print(result.toString());
    result.fold(
      (failure) {
        emit(LogoutFailure(failure.errMassage));
      },
      (response) async {
        if (response.status) {
          await secureStorage.clearToken();
          await sharedPrefService.removeValue('username');
          await sharedPrefService.removeValue('email');
          emit(LogoutSuccess(response));
        } else {
          emit(LogoutFailure(response.message));
        }
      },
    );
  }
}
