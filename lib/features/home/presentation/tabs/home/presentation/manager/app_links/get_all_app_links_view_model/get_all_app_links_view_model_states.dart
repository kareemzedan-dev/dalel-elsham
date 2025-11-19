import '../../../../domain/entities/app_link_entity.dart';

abstract class GetAllAppLinksViewModelStates {}
class GetAllAppLinksViewModelStatesInitial extends GetAllAppLinksViewModelStates {}
class GetAllAppLinksViewModelStatesLoading extends GetAllAppLinksViewModelStates {}
class GetAllAppLinksViewModelStatesSuccess extends GetAllAppLinksViewModelStates {
  final List<AppLinkEntity> appLinks;
  GetAllAppLinksViewModelStatesSuccess({required this.appLinks});
}
class GetAllAppLinksViewModelStatesError extends GetAllAppLinksViewModelStates {
  final String message;
  GetAllAppLinksViewModelStatesError({required this.message});
}