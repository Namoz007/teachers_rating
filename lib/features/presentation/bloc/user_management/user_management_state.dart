
import '../../../../sources.dart';

sealed class UserManagementState {}

final class InitialUserManagementState extends UserManagementState {}

final class LoadingUserManagementState extends UserManagementState {}

final class LoadedUserManagementState extends UserManagementState {
  PersonalEntities model;

  LoadedUserManagementState({
    required this.model,
  });
}

final class ErrorUserManagementState extends UserManagementState {
  String message;

  ErrorUserManagementState({
    required this.message,
  });
}
