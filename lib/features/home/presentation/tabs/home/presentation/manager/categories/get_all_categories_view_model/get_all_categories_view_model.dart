import 'package:dart_either/dart_either.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../../../../core/errors/failures.dart';
import '../../../../domain/entities/category_entity.dart';
import '../../../../domain/use_cases/category_use_case/category_use_case.dart';
import 'get_all_categories_view_model_states.dart';
@injectable
class GetAllCategoriesViewModel extends Cubit<GetAllCategoriesViewModelStates> {
  final CategoryUseCase categoryUseCase;

  // 📌 Cache — يخزن كل الكاتيجوريز بعد أول تحميل
  List<CategoryEntity> _cachedCategories = [];

  GetAllCategoriesViewModel(this.categoryUseCase)
      : super(GetAllCategoriesViewModelInitial());

  Future<Either<Failures, List<CategoryEntity>>> getAllCategories() async {
    try {
      // ⭐ 1) لو الكاش مش فاضي → رجّع الداتا فوراً
      if (_cachedCategories.isNotEmpty) {
        emit(GetAllCategoriesViewModelSuccess(_cachedCategories));
        return Right(_cachedCategories);
      }

      // ⭐ 2) تحميل أول مرة
      emit(GetAllCategoriesViewModelLoading());

      final result = await categoryUseCase.getAllCategories();

      result.fold(
        ifLeft: (failure) =>
            emit(GetAllCategoriesViewModelError(failure.message)),
        ifRight: (categories) {

          /// ⭐ ترتيب حسب order قبل التخزين
          categories.sort((a, b) => a.order.compareTo(b.order));

          // ⭐ 3) خزّن في الكاش
          _cachedCategories = categories;

          emit(GetAllCategoriesViewModelSuccess(categories));
        },
      );

      return result;

    } catch (e) {
      emit(GetAllCategoriesViewModelError(e.toString()));
      return Left(ServerFailure(e.toString()));
    }
  }
}
