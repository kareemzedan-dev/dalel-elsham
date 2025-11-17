import 'package:dalel_elsham/features/home/presentation/tabs/home/domain/use_cases/jobs_use_case/get_all_jobs_usecase/get_all_jobs_usecase.dart';
import 'package:dart_either/dart_either.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../../../../core/errors/failures.dart';
import '../../../../domain/entities/job_entity.dart';
import 'get_all_jobs_view_model_states.dart';
@injectable
class GetAllJobsViewModel extends Cubit<GetAllJobsViewModelStates> {
  GetAllJobsUsecase  getAllJobsUsecase ;
  GetAllJobsViewModel(this.getAllJobsUsecase) : super(GetAllJobsViewModelInitial());

  Future<Either<Failures, List<JobEntity>>> getAllJobs() async {
    try {
      emit(GetAllJobsViewModelLoading());
      final result = await getAllJobsUsecase.getAllJobs();
      result.fold(
        ifLeft: (fail) => emit(GetAllJobsViewModelError(fail.message)),
        ifRight: (jobs) => emit(GetAllJobsViewModelSuccess(jobs)),

      );

      return result;
    } catch (e) {
      emit(GetAllJobsViewModelError(e.toString()));
        return Left(ServerFailure(e.toString()));
    }
  }
}