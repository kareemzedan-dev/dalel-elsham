import 'package:dalel_elsham/core/errors/failures.dart';

import 'package:dalel_elsham/features/home/presentation/tabs/home/domain/entities/category_entity.dart';

import 'package:dart_either/src/dart_either.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/repos/category_repos/category_repos.dart';
import '../../data_sources/remote/category_remote_data_source/category_remote_data_source.dart';
@Injectable(as: CategoryRepos)
class CategoryReposImpl implements CategoryRepos{
  final CategoryRemoteDataSource categoryRemoteDataSource;
  CategoryReposImpl(this.categoryRemoteDataSource);
  @override
  Future<Either<Failures, List<CategoryEntity>>> getAllCategories() {
    return categoryRemoteDataSource.getAllCategories();
  }
}