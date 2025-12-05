import 'package:dalel_elsham/features/home/presentation/tabs/home/domain/entities/banner_entity.dart';

import '../../../../data/models/banner_model.dart';

abstract class GetBannersByPositionViewModelStates {}
class GetBannersByPositionViewModelStatesInitial extends GetBannersByPositionViewModelStates {}
class GetBannersByPositionViewModelStatesLoading extends GetBannersByPositionViewModelStates {}
class GetBannersByPositionViewModelStatesSuccess extends GetBannersByPositionViewModelStates {
  final List<BannerEntity> banners;
  GetBannersByPositionViewModelStatesSuccess({required this.banners});
}
class GetBannersByPositionViewModelStatesError extends GetBannersByPositionViewModelStates {
  final String message;
  GetBannersByPositionViewModelStatesError({required this.message});
}
