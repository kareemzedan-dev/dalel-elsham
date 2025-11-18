import 'package:dart_either/dart_either.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../../../../core/errors/failures.dart';
import '../../../../domain/entities/project_entity.dart';
import '../../../../domain/use_cases/projects/get_all_projects_usecase/get_all_projects_usecase.dart';
import 'get_all_projects_view_model_states.dart';
@injectable
class GetAllProjectsViewModel extends Cubit<GetAllProjectsViewModelStates>{
  final GetAllProjectsUseCase getAllProjectsUseCase;
  GetAllProjectsViewModel(this.getAllProjectsUseCase) : super(GetAllProjectsViewModelInitial());

  Future<Either<Failures, List<ProjectEntity>>> getAllProjects() async {
   try {
     emit(GetAllProjectsViewModelLoading());
     final result = await getAllProjectsUseCase.getAllProjects();
     result.fold(
       ifLeft: (fail) => emit(GetAllProjectsViewModelError(fail.message)),
       ifRight: (value) => emit(GetAllProjectsViewModelSuccess(value)),
     );
     return result ;
   } catch (e) {
     emit(GetAllProjectsViewModelError(e.toString()));
     return Left(ServerFailure(e.toString()));

   }
  }

}
