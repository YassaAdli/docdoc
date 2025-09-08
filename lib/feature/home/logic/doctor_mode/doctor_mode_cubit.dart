import 'package:flutter_bloc/flutter_bloc.dart';

enum DoctorMode { all, search, filter }

class DoctorModeCubit extends Cubit<DoctorMode> {
  DoctorModeCubit() : super(DoctorMode.all);

  void showAll() => emit(DoctorMode.all);

  void showSearch() => emit(DoctorMode.search);

  void showFilter() => emit(DoctorMode.filter);
  void changeMode(DoctorMode mode) {
    emit(mode);
  }
}
