import 'package:dalel_elsham/features/home/presentation/tabs/home/domain/use_cases/app_links_usecase/app_links_usecase.dart';
import 'package:dart_either/dart_either.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../../../../core/errors/failures.dart';
import '../../../../domain/entities/app_link_entity.dart';
import 'get_all_app_links_view_model_states.dart';

@injectable
class GetAllAppLinksViewModel extends Cubit<GetAllAppLinksViewModelStates> {
  final AppLinksUseCase appLinksUseCase;

  GetAllAppLinksViewModel(this.appLinksUseCase)
    : super(GetAllAppLinksViewModelStatesInitial());

  Future<Either<Failures, List<AppLinkEntity>>> getAllAppLinks() async {
    try {
      emit(GetAllAppLinksViewModelStatesLoading());
      final result = await appLinksUseCase.getAllAppLinks();

      result.fold(
        ifLeft: (fail) =>
            emit(GetAllAppLinksViewModelStatesError(message: fail.message)),
        ifRight: (succuss) =>
            emit(GetAllAppLinksViewModelStatesSuccess(appLinks: succuss)),
      );
      return result;
    } catch (e) {
      emit(GetAllAppLinksViewModelStatesError(message: e.toString()));
      return Left(ServerFailure(e.toString()));
    }
  }
}
