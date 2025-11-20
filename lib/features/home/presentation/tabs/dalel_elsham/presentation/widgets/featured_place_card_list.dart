import 'package:dalel_elsham/features/home/presentation/tabs/dalel_elsham/presentation/manager/get_all_place_view_model/get_all_place_view_model.dart';
import 'package:dalel_elsham/features/home/presentation/tabs/dalel_elsham/presentation/manager/get_all_place_view_model/get_all_place_view_model_states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../core/di/di.dart';
import 'featured_place_card.dart';

class FeaturedPlaceCardList extends StatelessWidget {
  const FeaturedPlaceCardList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAllPlaceViewModel, GetAllPlaceViewModelStates>(
      builder: (context, state) {
        if (state is GetAllPlaceViewModelLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is GetAllPlaceViewModelSuccess) {
          return ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: state.places.length,
            itemBuilder: (context, index) {
              return FeaturedPlaceCard(place: state.places[index],);
            },
          );
        }
        if (state is GetAllPlaceViewModelError) {
          return Center(child: Text(state.error));
        }
        return const SizedBox();
      },
    );
  }
}
