import 'package:dart_either/dart_either.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../../../../core/errors/failures.dart';
import '../../../../domain/entities/banner_entity.dart';
import '../../../../domain/use_cases/banner_use_case/banner_use_case.dart';
import 'get_banners_by_position_view_model_states.dart';

@injectable
class GetBannersByPositionViewModel
    extends Cubit<GetBannersByPositionViewModelStates> {
  final BannerUseCase bannerUseCase;

  GetBannersByPositionViewModel({required this.bannerUseCase})
    : super(GetBannersByPositionViewModelStatesInitial());

  Future<Either<Failures, List<BannerEntity>>> getBannersByPosition(
    String position,
  ) async {
    try {
      emit(GetBannersByPositionViewModelStatesLoading());
      final result = await bannerUseCase.getBannersByPosition(position);
      result.fold(
        ifLeft: (failure) => emit(
          GetBannersByPositionViewModelStatesError(message: failure.message),
        ),
        ifRight: (banners) =>
            emit(GetBannersByPositionViewModelStatesSuccess(banners: banners)),
      );

      return result;
    } catch (e) {
      emit(GetBannersByPositionViewModelStatesError(message: e.toString()));
      return Left(ServerFailure(e.toString()));
    }
  }
}
