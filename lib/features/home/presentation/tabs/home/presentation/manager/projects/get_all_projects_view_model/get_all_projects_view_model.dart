import 'package:dart_either/dart_either.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../../../../core/errors/failures.dart';
import '../../../../domain/entities/project_entity.dart';
import '../../../../domain/use_cases/projects/get_all_projects_usecase/get_all_projects_usecase.dart';
import 'get_all_projects_view_model_states.dart';
@injectable
class GetAllProjectsViewModel extends Cubit<GetAllProjectsViewModelStates> {
  final GetAllProjectsUseCase getAllProjectsUseCase;

  /// 🔥 نخزن البيانات الأصلية هنا
  List<ProjectEntity> allProjects = [];

  GetAllProjectsViewModel(this.getAllProjectsUseCase)
      : super(GetAllProjectsViewModelInitial());

  Future<void> getAllProjects() async {
    try {
      emit(GetAllProjectsViewModelLoading());

      final result = await getAllProjectsUseCase.getAllProjects();

      result.fold(
        ifLeft: (fail) => emit(GetAllProjectsViewModelError(fail.message)),
        ifRight: (value) {
          allProjects = value;     // حفظ المشاريع الأصلية
          emit(GetAllProjectsViewModelSuccess(value));
        },
      );
    } catch (e) {
      emit(GetAllProjectsViewModelError(e.toString()));
    }
  }

  /// 🔎 البحث
  void searchProjects(String query) {
    if (query.trim().isEmpty) {
      emit(GetAllProjectsViewModelSuccess(allProjects));
      return;
    }

    final filtered = allProjects.where((project) {
      final title = project.title.toLowerCase();
      final description = project.description.toLowerCase();
      final q = query.toLowerCase();

      return title.contains(q) || description.contains(q);
    }).toList();

    emit(GetAllProjectsViewModelSuccess(filtered));
  }
}
