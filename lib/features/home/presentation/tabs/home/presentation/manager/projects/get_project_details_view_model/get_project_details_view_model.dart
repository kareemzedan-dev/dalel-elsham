import 'package:dart_either/dart_either.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../../../../core/errors/failures.dart';
import '../../../../domain/entities/project_entity.dart';
import '../../../../domain/use_cases/projects/get_project_details_usecase/get_project_details_usecase.dart';
import 'get_project_details_view_model_states.dart';
@injectable
class GetProjectDetailsViewModel extends Cubit<GetProjectDetailsViewModelStates>{
  final GetProjectDetailsUsecase getProjectDetailsUseCase;
  GetProjectDetailsViewModel(this.getProjectDetailsUseCase) : super(GetProjectDetailsViewModelInitial());

  Future<Either<Failures, ProjectEntity>> getProjectDetails(String projectId) async {
    try {
      emit(GetProjectDetailsViewModelLoading());
      final result = await getProjectDetailsUseCase.getProjectDetails(projectId);
      result.fold(
        ifLeft: (fail) => emit(GetProjectDetailsViewModelError(fail.message)),
        ifRight: (value) => emit(GetProjectDetailsViewModelSuccess(value)),
      );
      return result ;
    } catch (e) {
      emit(GetProjectDetailsViewModelError(e.toString()));
      return Left(ServerFailure(e.toString()));

    }
  }

}