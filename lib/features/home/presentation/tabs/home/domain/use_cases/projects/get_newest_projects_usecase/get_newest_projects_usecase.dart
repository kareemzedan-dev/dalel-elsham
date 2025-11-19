import 'package:dart_either/dart_either.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../../../../core/errors/failures.dart';
import '../../../entities/project_entity.dart';
import '../../../repos/projects/get_newest_projects_repository/get_newest_projects_repository.dart';
@injectable
 class GetNewestProjectsUseCase {
   final GetNewestProjectsRepository repository;

   GetNewestProjectsUseCase(this.repository);

   Future<Either<Failures, List<ProjectEntity>>> call() async {
     return await repository.getNewestProjects();
   }
 }