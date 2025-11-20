import 'package:dart_either/dart_either.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../../../../core/errors/failures.dart';
import '../../../../domain/entities/project_entity.dart';
import '../../../../domain/use_cases/projects/get_projects_by_display_section_use_case/get_projects_by_display_section_use_case.dart';
import 'get_projects_by_display_section_view_model_states.dart';
@injectable
class GetProjectsByDisplaySectionViewModel
    extends Cubit<GetProjectsByDisplaySectionViewModelStates> {
  final GetProjectsByDisplaySectionUseCase getProjectsByDisplaySectionUseCase;

  GetProjectsByDisplaySectionViewModel(this.getProjectsByDisplaySectionUseCase)
    : super(GetProjectsByDisplaySectionViewModelStatesInitial());

  Future<Either<Failures, List<ProjectEntity>>> getProjectsByDisplaySection(
    String displaySectionId,
  ) async {
    try {
      emit(GetProjectsByDisplaySectionViewModelStatesLoading());
      final result = await getProjectsByDisplaySectionUseCase(displaySectionId);
      result.fold(
        ifLeft: (failure) => emit(
          GetProjectsByDisplaySectionViewModelStatesError(
            message: failure.message,
          ),
        ),
        ifRight: (projects) => emit(
          GetProjectsByDisplaySectionViewModelStatesSuccess(projects: projects),
        ),
      );
      return result;
    } catch (e) {
      emit(
        GetProjectsByDisplaySectionViewModelStatesError(message: e.toString()),
      );
      return Left(ServerFailure(e.toString()));
    }
  }
}
