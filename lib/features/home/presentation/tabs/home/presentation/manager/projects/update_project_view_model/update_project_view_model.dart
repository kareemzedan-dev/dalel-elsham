import 'package:dalel_elsham/features/home/presentation/tabs/home/presentation/manager/projects/update_project_view_model/update_project_view_model_states.dart';
import 'package:dart_either/dart_either.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../../../../core/errors/failures.dart';
import '../../../../domain/entities/project_entity.dart';
import '../../../../domain/use_cases/projects/update_project_usecase/update_project_usecase.dart';
@injectable
class UpdateProjectViewModel extends Cubit<UpdateProjectViewModelStates>{
  final UpdateProjectUseCase updateProjectUseCase;
  UpdateProjectViewModel(this.updateProjectUseCase) : super(UpdateProjectViewModelInitial());

  Future<Either<Failures, void>> updateProject(ProjectEntity project) async {
    try {
      emit(UpdateProjectViewModelLoading());
      final result = await updateProjectUseCase.updateProject(project);
      result.fold(
        ifLeft: (fail) => emit(UpdateProjectViewModelError(fail.message)),
        ifRight: (value) => emit(UpdateProjectViewModelSuccess()),
      );
      return result ;
    } catch (e) {
      emit(UpdateProjectViewModelError(e.toString()));
      return Left(ServerFailure(e.toString()));

    }
  }

}