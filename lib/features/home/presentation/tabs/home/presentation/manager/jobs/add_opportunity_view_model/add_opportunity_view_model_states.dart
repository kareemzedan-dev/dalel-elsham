abstract class AddOpportunityViewModelStates{}
class AddOpportunityViewModelInitial extends AddOpportunityViewModelStates{}
class AddOpportunityViewModelLoading extends AddOpportunityViewModelStates{}
class AddOpportunityViewModelSuccess extends AddOpportunityViewModelStates{}
class AddOpportunityViewModelError extends AddOpportunityViewModelStates{
  final String message;
  AddOpportunityViewModelError(this.message);
}
