import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain/entities/project_entity.dart';
import '../../../../domain/use_cases/projects/delete_project_usecase/delete_project_usecase.dart';
import 'delete_project_view_model_states.dart';
@injectable
class DeleteProjectViewModel extends Cubit<DeleteProjectViewModelStates> {
  final DeleteProjectUseCase deleteProjectUseCase;

  DeleteProjectViewModel(this.deleteProjectUseCase)
    : super(DeleteProjectViewModelInitial());

  Future<void> deleteProject(String projectEntity) async {
    emit(DeleteProjectViewModelLoading());
    final result = await deleteProjectUseCase.deleteProject(projectEntity);
    result.fold(
      ifLeft: (fail) => emit(DeleteProjectViewModelError(fail.message)),
      ifRight: (value) => emit(DeleteProjectViewModelSuccess()),
    );
  }
}
