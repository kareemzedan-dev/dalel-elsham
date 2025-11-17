import '../../../domain/entities/auth_entity.dart';

abstract class LoginViewModelStates {}
class LoginViewModelStatesInitial extends LoginViewModelStates {}
class LoginViewModelStatesLoading extends LoginViewModelStates {}
class LoginViewModelStatesSuccess extends LoginViewModelStates {
  final AuthEntity authEntity;
  LoginViewModelStatesSuccess({required this.authEntity});
}
class LoginViewModelStatesError extends LoginViewModelStates {
  final String message;
  LoginViewModelStatesError({required this.message});
}