sealed class AuthenticationState{}

final class InitialAuthenticationState extends AuthenticationState{}

final class LoadingAuthenticationState extends AuthenticationState{}

final class AuthenticatedAuthenticationState extends AuthenticationState{}

final class UnAuthenticatedAuthenticationState extends AuthenticationState{}

final class ErrorAuthenticationState extends AuthenticationState{
  String message;

  ErrorAuthenticationState({required this.message});
}