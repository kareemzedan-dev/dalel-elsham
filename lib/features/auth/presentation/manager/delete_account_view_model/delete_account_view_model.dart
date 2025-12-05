import 'package:dalel_elsham/features/auth/domain/use_cases/auth_usecase/auth_usecase.dart';
import 'package:dart_either/dart_either.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/errors/failures.dart';
import 'delete_account_view_model_states.dart';

@injectable
class DeleteAccountViewModel extends Cubit<DeleteAccountViewModelStates> {
  final AuthUseCase authUseCase;

  DeleteAccountViewModel(this.authUseCase)
    : super(DeleteAccountViewModelStatesInitial());

  Future<Either<Failures, void>> deleteAccount() async {
    emit(DeleteAccountViewModelStatesLoading());
    final result = await authUseCase.deleteAccount();
    result.fold(
      ifLeft: (failure) =>
          emit(DeleteAccountViewModelStatesError(failure.message)),
      ifRight: (success) => emit(DeleteAccountViewModelStatesSuccess()),
    );
    return result;
  }
}
