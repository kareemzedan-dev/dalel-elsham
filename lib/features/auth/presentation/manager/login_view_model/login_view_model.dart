import 'package:dalel_elsham/features/auth/domain/use_cases/auth_usecase/auth_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'login_view_model_states.dart';
@injectable
class LoginViewModel extends Cubit<LoginViewModelStates> {
  final AuthUseCase authUseCase;

  LoginViewModel(this.authUseCase) : super(LoginViewModelStatesInitial());

  void login({required String email, required String password}) async {
    emit(LoginViewModelStatesLoading());
    final result = await authUseCase.login(email: email, password: password);
    result.fold(
      ifLeft: (fail) => emit(LoginViewModelStatesError(message: fail.message)),
      ifRight: (succuss) =>
          emit(LoginViewModelStatesSuccess(authEntity: succuss)),
    );
  }
}
