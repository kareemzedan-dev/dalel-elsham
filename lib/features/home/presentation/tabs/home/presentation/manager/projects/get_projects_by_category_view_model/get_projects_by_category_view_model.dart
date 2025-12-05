import 'package:dalel_elsham/features/home/presentation/tabs/home/domain/use_cases/projects/get_projects_by_category_usecase/get_projects_by_category_usecase.dart';
import 'package:dart_either/dart_either.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../../../../core/errors/failures.dart';
import '../../../../domain/entities/project_entity.dart';
import 'get_projects_by_category_view_model_states.dart';
@injectable
class GetProjectsByCategoryViewModel extends Cubit<GetProjectsByCategoryViewModelStates>{
  final GetProjectsByCategoryUseCase getProjectsByCategoryUseCase;

  GetProjectsByCategoryViewModel(this.getProjectsByCategoryUseCase)
      : super(GetProjectsByCategoryViewModelInitial());

  Future<Either<Failures, List<ProjectEntity>>> getProjectsByCategory(String category) async {
    try {
      emit(GetProjectsByCategoryViewModelLoading());

      final result = await getProjectsByCategoryUseCase.getProjectsByCategory(category);

      result.fold(
        ifLeft: (fail) {
          emit(GetProjectsByCategoryViewModelError(fail.message));
        },
        ifRight: (projects) {

          /// ⭐ ترتيب المشاريع حسب النوع: Gold → Silver → Normal
          projects.sort((a, b) {
            int getRank(String type) {
              switch (type.toLowerCase()) {
                case "gold":
                  return 0;
                case "silver":
                  return 1;
                default:
                  return 2;
              }
            }

            return getRank(a.tier).compareTo(getRank(b.tier));
          });

          emit(GetProjectsByCategoryViewModelSuccess(projects));
        },
      );

      return result;

    } catch (e) {
      emit(GetProjectsByCategoryViewModelError(e.toString()));
      return Left(ServerFailure(e.toString()));
    }
  }
}
