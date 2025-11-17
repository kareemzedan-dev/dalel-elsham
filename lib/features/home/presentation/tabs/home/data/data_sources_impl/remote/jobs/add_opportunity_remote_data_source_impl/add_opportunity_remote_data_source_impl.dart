import 'package:dalel_elsham/features/home/presentation/tabs/home/domain/entities/job_entity.dart';
import 'package:dart_either/dart_either.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../../../../../../core/errors/failures.dart';
import '../../../../../../../../../../../core/helper/network_validation.dart';
import '../../../../../../../../../../../core/services/firebase_service.dart';
import '../../../../data_sources/remote/jobs/add_opportunity_remote_data_source/add_opportunity_remote_data_source.dart';
import '../../../../models/job_model.dart';
@Injectable(as: AddOpportunityRemoteDataSource)
class AddOpportunityRemoteDataSourceImpl implements AddOpportunityRemoteDataSource {
  final FirebaseService firebaseService;
  AddOpportunityRemoteDataSourceImpl(this.firebaseService);

  @override
  Future<Either<Failures, void>> addOpportunity(JobEntity job) async {
    try {
      /// 1) تأكد من وجود إنترنت
      if (!await NetworkValidation.hasInternet()) {
        return Left(NetworkFailure("لا يوجد اتصال بالإنترنت"));
      }

      /// 2) حول الـ Entity → Model → Map
      final jobModel = JobModel(
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

      /// 3) ارسل البيانات إلى Firebase
      await firebaseService.addDocument(
        collection: "opportunities",   // ← Collection مختلف عن الوظائف
        data: jobModel.toMap(),
        docId: job.id,                // ← علشان كل وثيقة ليها id
      );

      return const Right(null);

    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
