
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../core/di/di.dart';
import '../manager/banners/get_banners_by_position_view_model/get_banners_by_position_view_model.dart';
import '../manager/banners/get_banners_by_position_view_model/get_banners_by_position_view_model_states.dart';
import 'banner_section.dart';

class BannerEvery5 extends StatelessWidget {
  final String position;
  const BannerEvery5({required this.position});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
      getIt<GetBannersByPositionViewModel>()..getBannersByPosition(position),
      child: BlocBuilder<
          GetBannersByPositionViewModel,
          GetBannersByPositionViewModelStates>(
        builder: (context, state) {
          if (state is GetBannersByPositionViewModelStatesSuccess &&
              state.banners.isNotEmpty) {
            return BannerSection(images: state.banners);
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}
