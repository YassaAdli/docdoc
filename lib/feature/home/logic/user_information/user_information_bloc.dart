import 'package:Docdoc/feature/authentication/data/model/auth_response.dart';
import 'package:Docdoc/feature/home/data/model/user/user.dart';
import 'package:Docdoc/feature/home/data/model/user/user_response.dart';
import 'package:Docdoc/feature/home/data/model/validation_error_response.dart';
import 'package:Docdoc/feature/home/data/repositories/repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'user_information_event.dart';
part 'user_information_state.dart';

class UserInformationBloc
    extends Bloc<UserInformationEvent, UserInformationState> {
  final Repository repository;
  UserInformationBloc(this.repository) : super(UserInformationInitial()) {
    on<GetUserInformation>(_getUserInformation);
    on<UpdateUserInformation>(_updateUserInformation);
  }
  Future<void> _getUserInformation(
    GetUserInformation event,
    Emitter<UserInformationState> emit,
  ) async {
    emit(GetUserInformationLoading());
    final result = await repository.getUser();
    result.fold(
          (failure) {
        emit(UserInformationFailure(failure.errMassage));
      },
          (result) {
        if (result.status == true) {
          emit(UserInformationLoaded( result));
        }
      },
    );
  }
    Future<void> _updateUserInformation(
    UpdateUserInformation event,
    Emitter<UserInformationState> emit,
  ) async {
    emit(UpdateUserInformationLoading());
    print("User object: ${event.user}");
    print("User JSON: ${event.user.toJson()}");
    final result = await repository.updateUser(event.user);
    result.fold(
      (failure) {

        emit(UpdateUserInformationFailure(failure.errMassage));
      },
      (result) {
        if (result.status == true) {
          emit(UserInformationUpdated(result));
        }
      },
    );
  }
}
