import 'package:dalel_elsham/core/services/firebase_service.dart';
import 'package:dalel_elsham/features/home/presentation/tabs/home/domain/entities/job_entity.dart';
import 'package:dart_either/dart_either.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../../../../../core/errors/failures.dart';
import '../../../../../../../../../../core/helper/network_validation.dart';
import '../../../../data_sources/remote/jobs/add_job_remote_data_source/add_job_remote_data_source.dart';
import '../../../../models/job_model.dart';
@Injectable(as: AddJobRemoteDataSource)
class AddJobRemoteDataSourceImpl implements AddJobRemoteDataSource {
  final FirebaseService firebaseService;

  AddJobRemoteDataSourceImpl(this.firebaseService);

  @override
  Future<Either<Failures, void>> addJob(JobEntity job) async {
    try {

      if (!await NetworkValidation.hasInternet()) {
        return Left(NetworkFailure("لا يوجد اتصال بالانترنت"));
      }


      final model = JobModel(
        id: job.id,
        title: job.title,
        description: job.description,
        type: job.type,
        phone: job.phone,
        location: job.location,
        imageUrl: job.imageUrl,
        isActive: job.isActive,
        duration: job.duration,
        createdAt: job.createdAt,
        status: job.status,
      );


      await firebaseService.addDocument(
        collection: "jobs",
        data: model.toMap(),
        docId: job.id,
      );

      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
