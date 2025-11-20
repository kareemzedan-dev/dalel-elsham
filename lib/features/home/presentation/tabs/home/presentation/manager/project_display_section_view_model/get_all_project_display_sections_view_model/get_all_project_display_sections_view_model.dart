import 'package:dart_either/dart_either.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../../../../core/errors/failures.dart';
import '../../../../domain/entities/project_display_section_entity.dart';
import '../../../../domain/use_cases/project_display_sections_use_case/project_display_sections_use_case.dart';
import 'get_all_project_display_sections_view_model_states.dart';
@injectable
class GetAllProjectDisplaySectionsViewModel
    extends Cubit<GetAllProjectDisplaySectionsViewModelStates> {
  final ProjectDisplaySectionsUseCase getAllProjectDisplaySectionsUseCase;

  GetAllProjectDisplaySectionsViewModel({
    required this.getAllProjectDisplaySectionsUseCase,
  }) : super(GetAllProjectDisplaySectionsViewModelInitial());

  Future<Either<Failures, List<ProjectDisplaySectionEntity>>>
  getAllProjectDisplaySections() async {
    try {
      emit(GetAllProjectDisplaySectionsViewModelLoading());
      final result = await getAllProjectDisplaySectionsUseCase
          .getAllProjectDisplaySections();
      result.fold(
        ifLeft: (fail) =>
            emit(GetAllProjectDisplaySectionsViewModelError(fail.message)),
        ifRight: (value) =>
            emit(GetAllProjectDisplaySectionsViewModelSuccess(value)),
      );
      return result;
    } catch (e) {
      emit(GetAllProjectDisplaySectionsViewModelError(e.toString()));
      return Left(ServerFailure(e.toString()));
    }
  }
}
