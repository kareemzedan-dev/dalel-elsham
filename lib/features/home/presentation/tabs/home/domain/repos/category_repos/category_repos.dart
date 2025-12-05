import 'package:dart_either/dart_either.dart';

import '../../../../../../../../core/errors/failures.dart';
import '../../entities/category_entity.dart';

abstract class CategoryRepos {
  Future<Either<Failures, List<CategoryEntity>>> getAllCategories();
}