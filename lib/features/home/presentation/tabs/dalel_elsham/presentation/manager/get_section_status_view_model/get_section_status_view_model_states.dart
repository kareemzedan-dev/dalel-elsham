abstract class GetSectionStatusViewModelStates {}
class GetSectionStatusViewModelLoading extends GetSectionStatusViewModelStates {}
class GetSectionStatusViewModelSuccess extends GetSectionStatusViewModelStates {
  final bool isActive;
  GetSectionStatusViewModelSuccess({required this.isActive});
}
class GetSectionStatusViewModelError extends GetSectionStatusViewModelStates {
  final String message;
  GetSectionStatusViewModelError({required this.message});
}