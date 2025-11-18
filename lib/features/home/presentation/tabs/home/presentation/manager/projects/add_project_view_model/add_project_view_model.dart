import 'package:dalel_elsham/features/home/presentation/tabs/home/domain/use_cases/projects/add_project_usecase/add_project_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain/entities/project_entity.dart';
import 'add_project_view_model_states.dart';
@injectable
class AddNewServiceViewModel extends Cubit<AddNewServiceViewModelStates> {
  final AddProjectUseCase addProjectUseCase;

  AddNewServiceViewModel(this.addProjectUseCase)
    : super(AddProjectViewModelInitial());

  Future<void> addProject(ProjectEntity projectEntity) async {
    emit(AddProjectViewModelLoading());
    final result = await addProjectUseCase.addProject(projectEntity);
    result.fold(
      ifLeft: (fail) => emit(AddProjectViewModelError(fail.message)),
      ifRight: (success) => emit(AddProjectViewModelSuccess()),
    );
  }
}
