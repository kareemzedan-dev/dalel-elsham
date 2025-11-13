import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../../../core/components/custom_app_bar.dart';
import '../widgets/add_new_service_view_body.dart';

class AddNewServiceView extends StatelessWidget {
  const AddNewServiceView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppBar(title: "أضف اعلانك",),
      body: AddNewServiceViewBody(),
    );
  }
}
