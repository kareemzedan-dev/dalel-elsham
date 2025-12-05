abstract class DeleteAccountViewModelStates {}
class DeleteAccountViewModelStatesInitial extends DeleteAccountViewModelStates {}
class DeleteAccountViewModelStatesSuccess extends DeleteAccountViewModelStates {}
class DeleteAccountViewModelStatesError extends DeleteAccountViewModelStates {
  final String error;
  DeleteAccountViewModelStatesError(this.error);
}
class DeleteAccountViewModelStatesLoading extends DeleteAccountViewModelStates {}

