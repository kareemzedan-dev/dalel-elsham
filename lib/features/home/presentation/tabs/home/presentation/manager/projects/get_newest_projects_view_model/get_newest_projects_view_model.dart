import 'package:dart_either/dart_either.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../../../../core/errors/failures.dart';
import '../../../../domain/entities/project_entity.dart';
import '../../../../domain/use_cases/projects/get_newest_projects_usecase/get_newest_projects_usecase.dart';
import 'get_newest_projects_view_model_states.dart';
@injectable
class GetNewestProjectsViewModel
    extends Cubit<GetNewestProjectsViewModelStates> {
  final GetNewestProjectsUseCase getNewestProjectsUseCase;

  GetNewestProjectsViewModel(this.getNewestProjectsUseCase)
    : super(GetNewestProjectsViewModelInitial());

  Future<Either<Failures, List<ProjectEntity>>> getNewestProjects() async {
    try {
      emit(GetNewestProjectsViewModelLoading());
      final result = await getNewestProjectsUseCase.call();
      result.fold(
        ifLeft: (fail) => emit(GetNewestProjectsViewModelError(fail.message)),
        ifRight: (value) => emit(GetNewestProjectsViewModelSuccess(value)),
      );
      return result;
    } catch (e) {
      emit(GetNewestProjectsViewModelError(e.toString()));
      return Left(ServerFailure(e.toString()));
    }
  }
}
