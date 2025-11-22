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

  List<JobEntity> allOpportunities = [];

  GetAllOpportunitiesViewModel(this.getAllOpportunitiesUsecase)
      : super(GetAllOpportunitiesViewModelInitial());

  Future<Either<Failures, List<JobEntity>>> getAllOpportunities() async {
    try {
      emit(GetAllOpportunitiesViewModelLoading());

      final result = await getAllOpportunitiesUsecase.getAllOpportunities();

      result.fold(
        ifLeft: (fail) =>
            emit(GetAllOpportunitiesViewModelError(fail.message)),
        ifRight: (opportunities) {

          // ⭐ ترتيب حسب type
          opportunities.sort((a, b) {
            const priority = {
              "gold": 3,
              "silver": 2,
              "normal": 1,
            };

            final aRank = priority[a.type.toLowerCase()] ?? 0;
            final bRank = priority[b.type.toLowerCase()] ?? 0;

            return bRank.compareTo(aRank); // ترتيب تنازلي
          });

          allOpportunities = opportunities;

          emit(GetAllOpportunitiesViewModelSuccess(opportunities));
        },
      );

      return result;

    } catch (e) {
      emit(GetAllOpportunitiesViewModelError(e.toString()));
      return Left(ServerFailure(e.toString()));
    }
  }

  /// 🔍 البحث
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
