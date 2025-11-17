import 'package:dalel_elsham/features/auth/presentation/manager/register_view_model/register_view_model_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/use_cases/auth_usecase/auth_usecase.dart';
@injectable
class RegisterViewModel extends Cubit<RegisterViewModelStates> {
  final AuthUseCase authUseCase;

  RegisterViewModel(this.authUseCase) : super(RegisterViewModelStatesInitial());

  void register({
    required String name,
    required String email,
    required String phone,
    required String password,
  }) async {
    emit(RegisterViewModelStatesLoading());
    final result = await authUseCase.register(
      name: name,
      email: email,
      phone: phone,
      password: password,
    );
    result.fold(
      ifLeft: (fail) =>
          emit(RegisterViewModelStatesError(message: fail.message)),
      ifRight: (succuss) =>
          emit(RegisterViewModelStatesSuccess(authEntity: succuss)),
    );
  }
}
