import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../core/components/custom_app_bar.dart';
import '../../../../../../../core/di/di.dart';
import '../manager/app_links/get_all_app_links_view_model/get_all_app_links_view_model.dart';
import '../widgets/contact_us_view_body.dart';

class ContactUsView extends StatelessWidget {
  const ContactUsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "اتصل بنا"),
      body: BlocProvider(
        create: (_) => getIt<GetAllAppLinksViewModel>()..getAllAppLinks(),
        child: const ContactUsViewBody(),
      ),
    );
  }
}
