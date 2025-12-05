import '../../../../domain/entities/app_link_entity.dart';

abstract class AddOrUpdateLinkViewModelStates {}
class AddOrUpdateLinkViewModelStatesInitial extends AddOrUpdateLinkViewModelStates {}
class AddOrUpdateLinkViewModelStatesLoading extends AddOrUpdateLinkViewModelStates {}
class AddOrUpdateLinkViewModelStatesSuccess extends AddOrUpdateLinkViewModelStates {

}
class AddOrUpdateLinkViewModelStatesError extends AddOrUpdateLinkViewModelStates {
  final String message;
  AddOrUpdateLinkViewModelStatesError({required this.message});
}
