import 'package:teachers/features/data/model/model.dart';

sealed class TeachersControllerState {}

final class InitialTeachersControllerState extends TeachersControllerState {}

final class LoadingTeachersControllerState extends TeachersControllerState {}

final class LoadedTeachersControllerState extends TeachersControllerState {
  List<TeacherModel> teachers;

  LoadedTeachersControllerState({
    required this.teachers,
  });
}

final class ErrorTeachersControllerState extends TeachersControllerState {
  String message;

  ErrorTeachersControllerState({
    required this.message,
  });
}
