import 'package:dart_either/dart_either.dart';
import 'package:injectable/injectable.dart';
import '../../../../../../../../../core/errors/failures.dart';
import '../../../../../../../../../core/helper/network_validation.dart';
import '../../../../../../../../../core/services/firebase_service.dart';
import '../../../../domain/entities/category_entity.dart';
import '../../../data_sources/remote/category_remote_data_source/category_remote_data_source.dart';
import '../../../models/category_model.dart';

@Injectable(as: CategoryRemoteDataSource)
class CategoryRemoteDataSourceImpl implements CategoryRemoteDataSource {
  final FirebaseService firebaseService;

  CategoryRemoteDataSourceImpl(this.firebaseService);

  @override
  Future<Either<Failures, List<CategoryEntity>>> getAllCategories() async {
    try {
      // 1) تحقق من الانترنت
      if (!await NetworkValidation.hasInternet()) {
        return Left(NetworkFailure("لا يوجد اتصال بالانترنت"));
      }

      // 2) جلب البيانات من firestore
      final data = await firebaseService.getCollection(
        collection: "categories",
      );

      // 3) تحويلها لموديل
      final categories = data.map((item) {
        return CategoryModel.fromMap(item, item["id"]);
      }).toList();

      // 4) إرجاعها
      return Right(categories);

    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
