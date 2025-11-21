import 'package:dalel_elsham/features/home/presentation/tabs/home/domain/use_cases/jobs_use_case/get_all_opportunities_usecase/get_all_opportunities_usecase.dart';
import 'package:dart_either/dart_either.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../../../../core/errors/failures.dart';
import '../../../../domain/entities/job_entity.dart';
import 'get_all_opportunities_view_model_states.dart';

@injectable
class GetAllOpportunitiesViewModel
    extends Cubit<GetAllOpportunitiesViewModelStates> {

  final GetAllOpportunitiesUsecase getAllOpportunitiesUsecase;

  /// 🔥 اللستة الأصلية — علشان البحث يتم عليها
  List<JobEntity> allOpportunities = [];

  GetAllOpportunitiesViewModel(this.getAllOpportunitiesUsecase)
      : super(GetAllOpportunitiesViewModelInitial());

  Future<Either<Failures, List<JobEntity>>> getAllOpportunities() async {
    try {
      emit(GetAllOpportunitiesViewModelLoading());

      final result = await getAllOpportunitiesUsecase.getAllOpportunities();

      result.fold(
        ifLeft: (fail) => emit(GetAllOpportunitiesViewModelError(fail.message)),
        ifRight: (opportunities) {
          allOpportunities = opportunities; // حفظ البيانات الأصلية
          emit(GetAllOpportunitiesViewModelSuccess(opportunities));
        },
      );

      return result;
    } catch (e) {
      emit(GetAllOpportunitiesViewModelError(e.toString()));
      return Left(ServerFailure(e.toString()));
    }
  }

  /// 🔍 البحث المحلي بدون API Calls
  void searchOpportunities(String keyword) {
    if (keyword.isEmpty) {
      emit(GetAllOpportunitiesViewModelSuccess(allOpportunities));
      return;
    }

    final filtered = allOpportunities.where((opportunity) {
      final t = opportunity.title.toLowerCase();
      final d = opportunity.description.toLowerCase();
      final k = keyword.toLowerCase();

      return t.contains(k) || d.contains(k);
    }).toList();

    emit(GetAllOpportunitiesViewModelSuccess(filtered));
  }
}
