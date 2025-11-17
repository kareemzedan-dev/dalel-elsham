import '../../../../domain/entities/job_entity.dart';

abstract class GetAllJobsViewModelStates{}

class GetAllJobsViewModelInitial extends GetAllJobsViewModelStates{}
class GetAllJobsViewModelLoading extends GetAllJobsViewModelStates{}
class GetAllJobsViewModelSuccess extends GetAllJobsViewModelStates{
  final List<JobEntity> jobs;
  GetAllJobsViewModelSuccess(this.jobs);
}
class GetAllJobsViewModelError extends GetAllJobsViewModelStates{
  final String message;
  GetAllJobsViewModelError(this.message);
}
