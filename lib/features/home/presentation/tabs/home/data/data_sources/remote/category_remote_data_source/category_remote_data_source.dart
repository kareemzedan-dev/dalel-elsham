import 'package:dart_either/dart_either.dart';

import '../../../../../../../../../core/errors/failures.dart';
import '../../../../domain/entities/category_entity.dart';

abstract class CategoryRemoteDataSource {

  Future<Either<Failures, List<CategoryEntity>>> getAllCategories();
}