import 'package:dalel_elsham/features/home/presentation/tabs/home/presentation/manager/project_display_section_view_model/update_project_display_section_view_model/update_project_display_section_view_model_states.dart';
import 'package:dart_either/dart_either.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../../../../core/errors/failures.dart';
import '../../../../domain/entities/project_display_section_entity.dart';
import '../../../../domain/use_cases/project_display_sections_use_case/project_display_sections_use_case.dart';
@injectable
class UpdateProjectDisplaySectionViewModel
    extends Cubit<UpdateProjectDisplaySectionViewModelStates> {
  final ProjectDisplaySectionsUseCase updateProjectDisplaySectionUseCase;

  UpdateProjectDisplaySectionViewModel({
    required this.updateProjectDisplaySectionUseCase,
  }) : super(UpdateProjectDisplaySectionViewModelInitial());

  Future<Either<Failures, void>> updateProjectDisplaySection(
    ProjectDisplaySectionEntity projectDisplaySectionEntity,
  ) async {
    try {
      emit(UpdateProjectDisplaySectionViewModelLoading());
      final result = await updateProjectDisplaySectionUseCase
          .updateProjectDisplaySection(projectDisplaySectionEntity);
      result.fold(
        ifLeft: (fail) => emit(
          UpdateProjectDisplaySectionViewModelError(message: fail.message),
        ),
        ifRight: (value) => emit(UpdateProjectDisplaySectionViewModelSuccess()),
      );
      return result;
    } catch (e) {
      emit(UpdateProjectDisplaySectionViewModelError(message: e.toString()));
      return Left(ServerFailure(e.toString()));
    }
  }
}
