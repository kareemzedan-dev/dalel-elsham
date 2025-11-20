import 'package:dart_either/dart_either.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../../../../core/errors/failures.dart';
import '../../../../domain/use_cases/project_display_sections_use_case/project_display_sections_use_case.dart';
import 'delete_project_display_section_view_model_states.dart';
@injectable
class DeleteProjectDisplaySectionViewModel extends Cubit<DeleteProjectDisplaySectionViewModelStates> {
  final ProjectDisplaySectionsUseCase deleteProjectDisplaySectionUseCase;
  DeleteProjectDisplaySectionViewModel({required this.deleteProjectDisplaySectionUseCase}) : super(DeleteProjectDisplaySectionViewModelInitial());

  Future<Either<Failures, void>> deleteProjectDisplaySection(String id) async {
 try {
   emit(DeleteProjectDisplaySectionViewModelLoading());
   final result = await deleteProjectDisplaySectionUseCase.deleteProjectDisplaySection(id);
   result.fold(
     ifLeft:
     (failure) => emit(DeleteProjectDisplaySectionViewModelError(failure.message)),
     ifRight:
     (success) => emit(DeleteProjectDisplaySectionViewModelSuccess()),
   );
   return result;
 } catch (e) {
   emit(DeleteProjectDisplaySectionViewModelError(e.toString()));
   return Left(ServerFailure(e.toString()));
 }
  }

}