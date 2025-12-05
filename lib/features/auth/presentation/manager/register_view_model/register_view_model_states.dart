import '../../../domain/entities/auth_entity.dart';

abstract class RegisterViewModelStates {}
class RegisterViewModelStatesInitial extends RegisterViewModelStates {}
class RegisterViewModelStatesLoading extends RegisterViewModelStates {}
class RegisterViewModelStatesSuccess extends RegisterViewModelStates {
  final AuthEntity authEntity;
  RegisterViewModelStatesSuccess({required this.authEntity});
}
class RegisterViewModelStatesError extends RegisterViewModelStates {
  final String message;
  RegisterViewModelStatesError({required this.message});
}