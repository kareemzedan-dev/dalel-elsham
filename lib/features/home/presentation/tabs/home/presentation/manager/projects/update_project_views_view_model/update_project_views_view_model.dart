import 'package:dalel_elsham/features/home/presentation/tabs/home/presentation/manager/projects/update_project_views_view_model/update_project_views_view_model_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain/repos/projects/update_project_repository/update_project_repository.dart';
@injectable
class UpdateProjectViewsViewModel
    extends Cubit<UpdateProjectViewsViewModelStates> {
  final UpdateProjectRepository updateProjectRepository;

  UpdateProjectViewsViewModel({required this.updateProjectRepository})
    : super(UpdateProjectViewsViewModelInitial());

  Future<void> updateProjectViews(String projectId) async {
    emit(UpdateProjectViewsViewModelLoading());
    final result = await updateProjectRepository.updateProjectViews(projectId);
    result.fold(
      ifLeft: (failure) =>
          emit(UpdateProjectViewsViewModelError(failure.message)),
      ifRight: (success) => emit(UpdateProjectViewsViewModelSuccess()),
    );
  }
}
