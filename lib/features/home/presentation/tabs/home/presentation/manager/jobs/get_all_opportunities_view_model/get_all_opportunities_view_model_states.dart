import '../../../../domain/entities/job_entity.dart';

abstract class GetAllOpportunitiesViewModelStates{}

class GetAllOpportunitiesViewModelInitial extends GetAllOpportunitiesViewModelStates{}
class GetAllOpportunitiesViewModelLoading extends GetAllOpportunitiesViewModelStates{}
class GetAllOpportunitiesViewModelSuccess extends GetAllOpportunitiesViewModelStates{
  final List<JobEntity> jobs;
  GetAllOpportunitiesViewModelSuccess(this.jobs);
}
class GetAllOpportunitiesViewModelError extends GetAllOpportunitiesViewModelStates{
  final String message;
  GetAllOpportunitiesViewModelError(this.message);
}