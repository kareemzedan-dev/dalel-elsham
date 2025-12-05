import 'package:dart_either/dart_either.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../../../../core/errors/failures.dart';
import '../../../../domain/entities/app_link_entity.dart';
import '../../../../domain/use_cases/app_links_usecase/app_links_usecase.dart';
import 'add_or_update_link_view_model_states.dart';
@injectable
class AddOrUpdateLinkViewModel extends Cubit<AddOrUpdateLinkViewModelStates> {
  final AppLinksUseCase addOrUpdateLinkUseCase;

  AddOrUpdateLinkViewModel(this.addOrUpdateLinkUseCase)
    : super(AddOrUpdateLinkViewModelStatesInitial());

  Future<Either<Failures, void>> addOrUpdateLink(AppLinkEntity appLink) async {
    try {
      emit(AddOrUpdateLinkViewModelStatesLoading());
      final result = await addOrUpdateLinkUseCase.addOrUpdateLink(appLink);
      result.fold(
        ifLeft: (failure) =>
            emit(AddOrUpdateLinkViewModelStatesError(message: failure.message)),
        ifRight: (succuss) => emit(AddOrUpdateLinkViewModelStatesSuccess()),
      );
      return result;
    } catch (e) {
      emit(AddOrUpdateLinkViewModelStatesError(message: e.toString()));
      return Left(ServerFailure(e.toString()));
    }
  }
}
