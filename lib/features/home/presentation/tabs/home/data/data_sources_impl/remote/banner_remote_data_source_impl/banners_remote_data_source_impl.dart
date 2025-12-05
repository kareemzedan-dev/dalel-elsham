import 'package:dalel_elsham/features/home/presentation/tabs/home/data/models/banner_model.dart';
import 'package:dart_either/dart_either.dart';
import 'package:injectable/injectable.dart';
import '../../../../../../../../../core/errors/failures.dart';
import '../../../../../../../../../core/helper/network_validation.dart';
import '../../../../../../../../../core/services/firebase_service.dart';
import '../../../../domain/entities/banner_entity.dart';
import '../../../data_sources/remote/banner_remote_data_source/banners_remote_data_source.dart';
@Injectable(as: BannersRemoteDataSource)
class BannersRemoteDataSourceImpl implements BannersRemoteDataSource {
  final FirebaseService firebaseService;

  BannersRemoteDataSourceImpl(this.firebaseService);

  @override
  Future<Either<Failures, List<BannerModel>>> getBannersByPosition(String position) async {
    try {
      if (!await NetworkValidation.hasInternet()) {
        return Left(NetworkFailure("لا يوجد اتصال بالانترنت, برجاء التحقق من اتصالك بالانترنت"));
      }

      final data = await firebaseService.getCollection(
        collection: "banners",
      );

      final allBanners = data.map((item) {
        return BannerModel.fromMap(
          item,
          item["id"],
        );
      }).toList();


      final filtered = allBanners
          .where((banner) => banner.places.contains(position))
          .toList();

      return Right(filtered);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
