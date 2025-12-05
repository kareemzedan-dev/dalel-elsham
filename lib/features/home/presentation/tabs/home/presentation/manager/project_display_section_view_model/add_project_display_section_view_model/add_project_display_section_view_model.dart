import 'package:dalel_elsham/features/home/presentation/tabs/home/domain/use_cases/project_display_sections_use_case/project_display_sections_use_case.dart';
import 'package:dalel_elsham/features/home/presentation/tabs/home/presentation/manager/project_display_section_view_model/add_project_display_section_view_model/add_project_display_section_view_model_states.dart';
import 'package:dart_either/dart_either.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../../../../core/errors/failures.dart';
import '../../../../domain/entities/project_display_section_entity.dart';
@injectable
class AddProjectDisplaySectionViewModel
    extends Cubit<AddProjectDisplaySectionViewModelStates> {
  final ProjectDisplaySectionsUseCase addProjectDisplaySectionUseCase;

  AddProjectDisplaySectionViewModel({
    required this.addProjectDisplaySectionUseCase,
  }) : super(AddProjectDisplaySectionViewModelInitial());

  Future<Either<Failures, void>> addProjectDisplaySection(
    ProjectDisplaySectionEntity projectDisplaySectionEntity,
  ) async {
    try {
      emit(AddProjectDisplaySectionViewModelLoading());
      final result = await addProjectDisplaySectionUseCase
          .addProjectDisplaySection(projectDisplaySectionEntity);
      result.fold(
        ifLeft: (failure) =>
            emit(AddProjectDisplaySectionViewModelError(failure.message)),
        ifRight: (success) => emit(AddProjectDisplaySectionViewModelSuccess()),
      );
      return result;
    } catch (e) {
      emit(AddProjectDisplaySectionViewModelError(e.toString()));
      return Left(ServerFailure(e.toString()));
    }
  }
}
