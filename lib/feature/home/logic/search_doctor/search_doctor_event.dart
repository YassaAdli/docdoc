part of 'search_doctor_bloc.dart';

abstract class SearchDoctorEvent extends Equatable {
  const SearchDoctorEvent();

  @override
  List<Object> get props => [];
}

class SearchDoctorByName extends SearchDoctorEvent {
  final String name;
  const SearchDoctorByName(this.name);
}
