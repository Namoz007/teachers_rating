

import '../../../../sources.dart';

sealed class AuthenticationEvent {}

final class LoginAuthenticationEvent extends AuthenticationEvent {
  LoginEntities model;

  LoginAuthenticationEvent({
    required this.model,
  });
}

final class RegistrationAuthenticationEvent extends AuthenticationEvent {
  RegistrationEntities model;

  RegistrationAuthenticationEvent({
    required this.model,
  });
}

final class ResetPasswordAuthenticationEvent extends AuthenticationEvent {
  String email;

  ResetPasswordAuthenticationEvent({
    required this.email,
  });
}

final class UserLoggedAuthenticationEvent extends AuthenticationEvent{}