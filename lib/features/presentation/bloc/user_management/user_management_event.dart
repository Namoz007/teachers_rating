import 'package:teachers/features/domain/entities/entities.dart';

sealed class UserManagementEvent {}

final class GetUserManagementEvent extends UserManagementEvent {}

final class UpdateUserManagementEvent extends UserManagementEvent {
  PersonalEntities model;

  UpdateUserManagementEvent({
    required this.model,
  });
}
