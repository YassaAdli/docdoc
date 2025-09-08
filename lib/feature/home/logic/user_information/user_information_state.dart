part of 'user_information_bloc.dart';

sealed class UserInformationState extends Equatable {
  const UserInformationState();
  
  @override
  List<Object> get props => [];
}

final class UserInformationInitial extends UserInformationState {}
final class GetUserInformationLoading extends UserInformationState {}
final class UpdateUserInformationLoading extends UserInformationState {}
final class UserInformationLoaded extends UserInformationState {
  final UserResponse userResponse;
  const UserInformationLoaded(this.userResponse);
}

final class UserInformationUpdated extends UserInformationState {
  final AuthResponse authResponse;
  const UserInformationUpdated(this.authResponse);
}
final class UserInformationFailure extends UserInformationState {
  final String message;
  const UserInformationFailure(this.message);
}
final class UpdateUserInformationFailure extends UserInformationState {
  final String message;
  const UpdateUserInformationFailure(this.message);
}
