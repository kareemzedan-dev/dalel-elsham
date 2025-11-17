import 'package:dalel_elsham/features/home/presentation/tabs/home/domain/use_cases/jobs_use_case/get_all_opportunities_usecase/get_all_opportunities_usecase.dart';
import 'package:dart_either/dart_either.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../../../../core/errors/failures.dart';
import '../../../../domain/entities/job_entity.dart';
import 'get_all_opportunities_view_model_states.dart';
@injectable
class GetAllOpportunitiesViewModel extends Cubit<GetAllOpportunitiesViewModelStates> {
  final GetAllOpportunitiesUsecase getAllOpportunitiesUsecase;
  GetAllOpportunitiesViewModel(this.getAllOpportunitiesUsecase) :
        super(GetAllOpportunitiesViewModelInitial());

  Future<Either<Failures, List<JobEntity>>> getAllOpportunities() async {
    try {
      emit(GetAllOpportunitiesViewModelLoading());
      final result = await getAllOpportunitiesUsecase.getAllOpportunities();
      result.fold(
        ifLeft: (fail) => emit(GetAllOpportunitiesViewModelError(fail.message)),
        ifRight: (opportunities) =>  emit(GetAllOpportunitiesViewModelSuccess(opportunities)),
      );
      return result;
    } catch (e) {
      emit(GetAllOpportunitiesViewModelError(e.toString()));
      return Left(ServerFailure(e.toString()));
    }
  }
}