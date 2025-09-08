part of 'user_information_bloc.dart';

sealed class UserInformationEvent extends Equatable {
  const UserInformationEvent();

  @override
  List<Object> get props => [];
}
final class GetUserInformation extends UserInformationEvent {

}
final class UpdateUserInformation extends UserInformationEvent {
  final User user;
  const UpdateUserInformation(this.user);
}

